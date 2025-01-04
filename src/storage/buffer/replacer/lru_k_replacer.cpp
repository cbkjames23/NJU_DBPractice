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

#include "lru_k_replacer.h"
#include "common/config.h"
#include "../common/error.h"

namespace wsdb {

LRUKReplacer::LRUKReplacer(size_t k) : max_size_(BUFFER_POOL_SIZE), k_(k) {}

auto LRUKReplacer::Victim(frame_id_t *frame_id) -> bool { 
    std::lock_guard<std::mutex> lock(latch_);
    if(cur_size_ == 0)
        return false;
    // std::cout << cur_size_ <<std::endl;
    auto max_dis_node = node_store_.end();
    unsigned long long dis = 0;
    for(auto it = node_store_.begin() ; it != node_store_.end() ; ++it){
        auto node = it->second;
        if(node.IsEvictable()){
            auto n_dis = node.GetBackwardKDistance(cur_ts_);
            // if(max_dis_node != node_store_.end())
            //     std::cout << max_dis_node->second.GetPre() << " " <<  node.GetPre() << std::endl;
            if(max_dis_node == node_store_.end() || n_dis > dis || (n_dis == dis && max_dis_node->second.GetPre() > node.GetPre())){
                max_dis_node = it;
                dis = n_dis;
            }
        }
    }
    if(max_dis_node != node_store_.end()){
        *frame_id = max_dis_node->first;
        node_store_.erase(max_dis_node);
        --cur_size_;
        return true;
    }
    return false;
}

void LRUKReplacer::Pin(frame_id_t frame_id) { 
    std::lock_guard<std::mutex> lock(latch_);
    //std::cout << "pin " << frame_id;
    if(node_store_.find(frame_id) != node_store_.end()){
        //std::cout << " in node_store" << std::endl;
        if(node_store_[frame_id].IsEvictable()){
            //std::cout << "evi" <<std::endl;
            cur_size_--;
            node_store_[frame_id].SetEvictable(false);
            
        }
        else{
            //std::cout << "not evi" << std::endl;
        }
    }
    else{
        // std::cout << " not in node_store" << std::endl;
        LRUKNode node(frame_id, k_);
        node_store_[frame_id] = std::move(node);
    }
    node_store_[frame_id].AddHistory(++cur_ts_);
}

void LRUKReplacer::Unpin(frame_id_t frame_id) { 
    std::lock_guard<std::mutex> lock(latch_);
    //std::cout << "unpin " << frame_id; 
    if(node_store_.find(frame_id) != node_store_.end()){
        //std::cout << " in node_store";
        if(!node_store_[frame_id].IsEvictable()){
            //std::cout << " set evi " << std::endl;
            node_store_[frame_id].SetEvictable(true);
            ++cur_size_;
        }
        else{
            //std::cout << " evi is true" << std::endl;
        }
    }
    else{
        //std::cout << " not in node_store" << std::endl;
    }
}

auto LRUKReplacer::Size() -> size_t { 
    std::lock_guard<std::mutex> lock(latch_);
    return cur_size_;
}

}  // namespace wsdb
