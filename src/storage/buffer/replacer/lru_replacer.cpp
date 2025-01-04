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

#include "lru_replacer.h"
#include "common/config.h"
#include "../common/error.h"
namespace wsdb {

LRUReplacer::LRUReplacer() : cur_size_(0), max_size_(BUFFER_POOL_SIZE) {}

auto LRUReplacer::Victim(frame_id_t *frame_id) -> bool { 
    std::lock_guard<std::mutex> lock(latch_);
    if(lru_list_.empty()){
        return false;
    }
    auto it = lru_list_.begin();
    while(it != lru_list_.end()){
        if(it->second){
            --cur_size_;
            //std::cout << cur_size_ << " " << it->first << std::endl;
            *frame_id = it->first;
            lru_hash_.erase(it->first);
            lru_list_.erase(it);
            return true;
        }
        ++it;   
    }
    return false;
}

void LRUReplacer::Pin(frame_id_t frame_id) { 
    std::lock_guard<std::mutex> lock(latch_);
    //std::cout << "Pin" << frame_id << " " << cur_size_ << std::endl;
    if (lru_hash_.find(frame_id) != lru_hash_.end()) {
        auto it = lru_hash_[frame_id]; 
        if(it->second)
            cur_size_--; 
        lru_list_.erase(it);  
        lru_hash_.erase(frame_id); 
    }
    lru_list_.emplace_back(frame_id, false);
    lru_hash_[frame_id] = --lru_list_.end();
}


void LRUReplacer::Unpin(frame_id_t frame_id) { 
    std::lock_guard<std::mutex> lock(latch_);
    //std::cout << "Unpin" << frame_id << " " << cur_size_ << std::endl;
    if(lru_hash_.find(frame_id) != lru_hash_.end()){
        if(!lru_hash_[frame_id]->second){
            lru_hash_[frame_id]->second = true;
            ++cur_size_;
        }
    }
}

auto LRUReplacer::Size() -> size_t { 
    std::lock_guard<std::mutex> lock(latch_);
    return cur_size_;
}

}  // namespace wsdb
