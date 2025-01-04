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
// Created by ziqi on 2024/7/18.
//

#include "executor_filter.h"

namespace wsdb {

FilterExecutor::FilterExecutor(AbstractExecutorUptr child, std::function<bool(const Record &)> filter)
    : AbstractExecutor(Basic), child_(std::move(child)), filter_(std::move(filter))
{}
void FilterExecutor::Init() { 
    child_->Init();
    auto record = child_->GetRecord();
    while((!record || !filter_(*record)) && !IsEnd()){
        child_->Next();
        record = child_->GetRecord();
    }
    if(IsEnd()) return ;
    record_ = std::make_unique<Record>(*record);
}

void FilterExecutor::Next() { 
    if(IsEnd()) return;
    child_->Next();
    auto record = child_->GetRecord();
    while((!record || !filter_(*record)) && !IsEnd()){
        child_->Next();
        record = child_->GetRecord();
    }
    if(IsEnd()) return ;
    record_ = std::make_unique<Record>(*record);
}

auto FilterExecutor::IsEnd() const -> bool { 
    return child_->IsEnd();
}

auto FilterExecutor::GetOutSchema() const -> const RecordSchema * { return child_->GetOutSchema(); }
}  // namespace wsdb
