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
// Created by ziqi on 2024/8/10.
//

#include "executor_limit.h"

namespace wsdb {
LimitExecutor::LimitExecutor(AbstractExecutorUptr child, int limit)
    : AbstractExecutor(Basic), child_(std::move(child)), limit_(limit), count_(0)
{}

void LimitExecutor::Init() { 
    child_->Init();
    if(IsEnd())  return ;
    auto child_record = child_.get()->GetRecord();
    if(!child_record)   return ;
    count_++;
    record_ = std::make_unique<Record>(*child_record);
}

void LimitExecutor::Next() { 
    if(IsEnd()) return ;
    child_->Next();
    auto child_record = child_.get()->GetRecord();
    if(!child_record)   return ;
    count_++;
    record_ = std::make_unique<Record>(*child_record);
}

[[nodiscard]] auto LimitExecutor::IsEnd() const -> bool { 
    return child_->IsEnd() || count_ == limit_ + 1;
}

[[nodiscard]] auto LimitExecutor::GetOutSchema() const -> const RecordSchema * { return child_->GetOutSchema(); }
}  // namespace wsdb
