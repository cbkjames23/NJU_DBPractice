/*------------------------------------------------------------------------------
 - Copyright (c) 2024. Websoft research group, Nanjing University.
 -
 - This program is free software: you can redistribute it and/or modify
 - it under the terms of the GNU General Public License as published by
 - the Free Software Foundation, either version 3 of the License, or
 - (at your option) any later version.
 -
 - This program is distributed in the hope that it will be useful,
 - but WITHOUT ANY WARRANTY; without even the implied warranty of
 - MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 - GNU General Public License for more details.
 -
 - You should have received a copy of the GNU General Public License
 - along with this program.  If not, see <https://www.gnu.org/licenses/>.
 -----------------------------------------------------------------------------*/

//
// Created by ziqi on 2024/7/17.
//
#include "buffer_pool_manager.h"
#include "replacer/lru_replacer.h"
#include "replacer/lru_k_replacer.h"

#include "../../../common/error.h"

namespace wsdb {

BufferPoolManager::BufferPoolManager(DiskManager *disk_manager, wsdb::LogManager *log_manager, size_t replacer_lru_k)
    : disk_manager_(disk_manager), log_manager_(log_manager)
{
  if (REPLACER == "LRUReplacer") {
    replacer_ = std::make_unique<LRUReplacer>();
  } else if (REPLACER == "LRUKReplacer") {
    replacer_ = std::make_unique<LRUKReplacer>(replacer_lru_k);
  } else {
    WSDB_FETAL("Unknown replacer: " + REPLACER);
  }
  // init free_list_
  for (frame_id_t i = 0; i < static_cast<int>(BUFFER_POOL_SIZE); i++) {
    free_list_.push_back(i);
  }
}

auto BufferPoolManager::FetchPage(file_id_t fid, page_id_t pid) -> Page * {
  std::lock_guard<std::mutex> lock(latch_);
  //std::cout << "fetchpage" << fid << " " << pid << " ";
  fid_pid_t key = {fid, pid};
  auto it = page_frame_lookup_.find(key);
  frame_id_t frame_id;
  bool np = (it == page_frame_lookup_.end());
  if(np){
    frame_id = GetAvailableFrame();
    UpdateFrame(frame_id, fid, pid);
    return frames_[frame_id].GetPage();
  }
  frame_id = page_frame_lookup_[key];
  replacer_->Pin(frame_id);
  Frame & f = frames_[frame_id];
  f.Pin();
  return f.GetPage();
}

auto BufferPoolManager::UnpinPage(file_id_t fid, page_id_t pid, bool is_dirty) -> bool { 
  std::lock_guard<std::mutex> lock(latch_);
  //std::cout << "unpinpage" << fid << " " << pid << std::endl;
  fid_pid_t key = {fid, pid};
  auto it = page_frame_lookup_.find(key);
  if(it == page_frame_lookup_.end())
    return false;
  frame_id_t frame_id = page_frame_lookup_[key];
  Frame & f = frames_[frame_id];
  if(!f.InUse())
    return false;
  f.Unpin();
  if(!f.InUse()){
    //std::cout<<"notuse" << std::endl;
    replacer_->Unpin(frame_id);
  }
  if(is_dirty)
    f.SetDirty(true);
  // for(auto it = free_list_.begin() ; it != free_list_.end() ; ++it)
  // std::cout << *it << " ";
  // std::cout << std::endl;
  return true;
}

auto BufferPoolManager::DeletePage(file_id_t fid, page_id_t pid) -> bool { 
  std::lock_guard<std::mutex> lock(latch_);
  //std::cout << "deletepage" << fid << " " << pid << std::endl;
  fid_pid_t key = {fid, pid};
  auto it = page_frame_lookup_.find(key);
  if(it == page_frame_lookup_.end())  return true;
  frame_id_t frame_id = page_frame_lookup_[key];
  Frame & f = frames_[frame_id];
  //std::cout << f.GetPinCount() << std::endl;
  if(f.InUse()) return false;
  auto page = f.GetPage();
  disk_manager_->WritePage(fid, pid, page->GetData());
  f.Reset();
  free_list_.emplace_back(frame_id);
  replacer_->Unpin(frame_id);
  page_frame_lookup_.erase(key);
  // for(auto it = free_list_.begin() ; it != free_list_.end() ; ++it)
  //   std::cout << *it << " ";
  // std::cout << std::endl;
  return true;
}

auto BufferPoolManager::DeleteAllPages(file_id_t fid) -> bool {  
  //std::cout << "all" << std::endl;
  bool all_delete = true;
  for(frame_id_t i = 0 ; i < BUFFER_POOL_SIZE ; ++i){
    Frame & f = frames_[i];
    auto page = f.GetPage();
    if(page->GetFileId() == fid){
      bool del = DeletePage(fid, page->GetPageId());
      if(!del)
        all_delete = false;
    }
  }
  return all_delete;
}

auto BufferPoolManager::FlushPage(file_id_t fid, page_id_t pid) -> bool { 
  std::lock_guard<std::mutex> lock(latch_);
  //std::cout << "flushpage" << fid << " " << pid << std::endl;
  Frame* f = GetFrame(fid, pid);
  if(!f)
    return false;
  if(f->IsDirty()){
    auto page = f->GetPage();
    disk_manager_->WritePage(fid, pid, page->GetData());
    f->SetDirty(false);
    return true;
  }
  return false;
}

auto BufferPoolManager::FlushAllPages(file_id_t fid) -> bool { 
  bool all_flush = true;
  for(frame_id_t i = 0 ; i < BUFFER_POOL_SIZE ; ++i){
    Frame & f = frames_[i];
    auto page = f.GetPage();
    if(page->GetFileId() == fid){
      bool flu = FlushPage(fid, page->GetPageId());
      if(!flu)
        all_flush = false;
    }
  }
  return all_flush;
}

auto BufferPoolManager::GetAvailableFrame() -> frame_id_t { 
  if(!free_list_.empty()){
    frame_id_t id = free_list_.front();
    free_list_.pop_front();
    return id;
  }
  else{
    frame_id_t id;
    bool f = replacer_->Victim(&id);
    if(f)
      return id;
    else{
      WSDB_THROW(WSDB_NO_FREE_FRAME, "no free frame");
    }
  }
}

void BufferPoolManager::UpdateFrame(frame_id_t frame_id, file_id_t fid, page_id_t pid) { 
  //std::cout << "updateframe" << frame_id << " " << fid << " " << pid << std::endl;
  Frame & f = frames_[frame_id];
  file_id_t o_fid = f.GetPage()->GetFileId();
  page_id_t o_pid = f.GetPage()->GetPageId();
  page_frame_lookup_.erase({o_fid, o_pid});
  auto page = f.GetPage();
  if(f.IsDirty()){
    //std::cout << f.GetPage()->GetData() << std::endl;
    disk_manager_->WritePage(o_fid, o_pid, page->GetData());
    f.SetDirty(false);
  }
  f.Reset();
  page = f.GetPage();
  page->SetFilePageId(fid, pid);
  disk_manager_->ReadPage(fid, pid, page->GetData());
  //std::cout << f.GetPage()->GetData() << std::endl;
  f.Pin();
  replacer_->Pin(frame_id);
  page_frame_lookup_[{fid, pid}] = frame_id;
}

auto BufferPoolManager::GetFrame(file_id_t fid, page_id_t pid) -> Frame *
{
  const auto it = page_frame_lookup_.find({fid, pid}); 
  return it == page_frame_lookup_.end() ? nullptr : &frames_[it->second];
}

}  // namespace wsdb
