## 单表操作
#### 复制数据表
- 复制数据表结构
  - create [temporary] table [if exists] 表名(like 旧表名);
- 复制数据表数据
  - insert [into] 数据表名1 [字段列表]   select [字段列表] from 数据表名2;
- 临时表的使用
  - 创建临时表 create temporary table 表名(字段名 字段类型[字段属性],next ...)[表选项]
#### 主键冲突
#### 清空数据
- truncate [table] 表名;
- 与delete的区别
  - truncate是删除之后重新建立，delete是逐条删除。
  - 效率不同，truncate要比delete效率更高
  - truncate删除之后，再次添加数据，自动增长字段会从默认值开始。delete则不影响自动增长字段。
  - 删除范围不同，truncate不能使用where
  - 返回值不同，truncate返回值无意义。delete返回符合条件的删除记录。
#### 去除重复记录
- select select选项 字段列表 from 数据表 
  - select 选项为 distinct
#### 排序
- select * from 数据表名 order by id {desc|asc};