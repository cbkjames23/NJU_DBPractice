
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

#include "executor_update.h"

namespace wsdb {

UpdateExecutor::UpdateExecutor(AbstractExecutorUptr child, TableHandle *tbl, std::list<IndexHandle *> indexes,
    std::vector<std::pair<RTField, ValueSptr>> updates)
    : AbstractExecutor(DML),
      child_(std::move(child)),
      tbl_(tbl),
      indexes_(std::move(indexes)),
      updates_(std::move(updates)),
      is_end_(false)
{
  std::vector<RTField> fields(1);
  fields[0]   = RTField{.field_ = {.field_name_ = "updated", .field_size_ = sizeof(int), .field_type_ = TYPE_INT}};
  out_schema_ = std::make_unique<RecordSchema>(fields);
}

void UpdateExecutor::Init() { WSDB_FETAL("UpdateExecutor does not support Init"); }

void UpdateExecutor::Next()
{
  // number of updated records
  int count = 0;
  for(child_->Init() ; !child_->IsEnd() ; child_->Next()){
    auto child_record = child_->GetRecord();
    if(child_record){
      std::vector<ValueSptr> new_value;
      auto sch = child_record->GetSchema();
      for(size_t i = 0 ; i < sch->GetFieldCount() ; ++i){
        bool find = false;
        auto field_name = sch->GetFieldAt(i).field_.field_name_;
        for(auto update : updates_){
          auto field = update.first;
          auto value = update.second;
          if(field.field_.field_name_ == field_name){
            find = true;
            new_value.push_back(value);
            break;
          }
        }
        if(!find) new_value.push_back(child_record->GetValueAt(i));
        // if(sch->GetFieldAt(i).field_.field_name_ == updates_[pos].first.field_.field_name_){
        //   new_value.push_back(updates_[pos].second);
        //   pos++;
        // }
        // else new_value.push_back(child_record->GetValueAt(i));
      }
      auto rid = child_record->GetRID();
      auto u_record = std::make_unique<Record>(sch, new_value, rid);
      tbl_->UpdateRecord(rid, *u_record);
      for(auto index : indexes_)  index->UpdateRecord(*child_record, *u_record);
      count++;
    }
  }

  std::vector<ValueSptr> values{ValueFactory::CreateIntValue(count)};
  record_ = std::make_unique<Record>(out_schema_.get(), values, INVALID_RID);
  is_end_ = true;
}

auto UpdateExecutor::IsEnd() const -> bool { return is_end_; }

}  // namespace wsdb