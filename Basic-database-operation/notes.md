## 数据库的操作
#### 创建数据库
- create database; 数据库名称 \[库选项]
- 一般如果创建的数据库已存在，则程序会报错，所以可以在数据库名称前加上 "IF NOT EXISTS"表示如果存在的时候忽略。
#### 查看数据库
-  show databases 查看所有的数据库
-  一般会四个mysql自动创建的库
    -  information_schema  
      -  MySQL服务器的数据字典（保存所有数据表和库的结构信息）
    - performance_schema
      -  性能字典（保存全局变量等的设置）
  - mysql
    - 负责mysql服务器自己需要使用的控制和管理信息，如用户的权限关系等。
  - sys 
    - 系统数据库，包括了存储过程，自定义函数。
- 查看制定数据库的创建的创建信息 show create database; 数据库名称
#### 选择数据库
- use 数据库名称；
- mysql -u 用户名 -p 密码 数据库名称;
#### 删除数据库
- drop datebase 数据库名称;
- 在数据库名称前加上"IF EXISTS"，如果没有数据库，忽略。
## 数据表操作
#### 创建数据表
- create table 表名(字段名 字段类型[字段属性],next ...)[表选项]
- 在后面加上 default charset =utf8;可以使得支持中文
####   查看数据表
- show tables [like 匹配模式]；
  - like 后面可以加关键词
- show table status 数据表名    查看数据表相关数据
  - 字段非常多的时候，可以使用/G作为结束符。为纵向显示
#### 修改数据表
- 修改表名
  - alter table 旧表名 rename [to]新表名
  - 可以直接使用rename 后面加to
- 修改表选项
  - alter table 表名 表选项 = 值； 改变表选项的类型
  ## 表选项操作
  #### 查看表结构
  - 查看数据表的字段信息
    - desc 数据表名
  - 查看数据表的创建语句
    - show create table 表名；
  - 查看数据表结构
    - show [full] columns from 数据表名；
#### 修改表结构
- 修改字段名 alter table 数据表名 change [columns] 旧字段名 新字段名 字段类型 [字段属性];
- 修改字段类型 alter table 数据表名 modify [columns] 字段名 新类型 [字段属性];
- 修改字段的位置
  - 数据表在创建时，字段编写的先后顺序就是其在数据库中存储的顺序。


          alter table 数据表名字
          modify [columns] 字段名1 数据类型[数据属性] [first| after 字段名2];
- 新增字段 
    
    
          alter table 数据表名字
          add [columns]  新字段名 字段类型[first|after 字段名];
- 删除字段
  - alter table 数据表 drop [column] 字段名；
- 删除数据表 
  - drop [temporary] table [IF EXISTS] 数据表1 [,数据表2...]
## 数据操作
#### 添加数据
- insert [into] 数据表名 {values|values}(值1[,值2...]))
- 为部分字段添加数据 


      insert [into] 数据表名 (字段名1[, 字段名2]...)
      (values |value)(值1[, 值2]...);

      insert [into] 数据表名 
      set 字段名1 = 值 1 [, 字段名2 = 值2]...;
- 当多数据一起插入的时候，若一条数据插入失败，则整个插入语句都会出错
#### 查询数据
- 查询表中所有数据
  - select * from 数据表名
- 查询表中部分字段
  - select 字段名1,字段2,字段名3,...}from 数据表名;
- 简单条件查询数据
  

    select * | 字段名1,...
    from 数据表名 where 字段名 = 值；
#### 修改数据


    updata 数据表名
    set 字段名1=值1[,字段名2=值2,...]
    [where 条件];
#### 删除数据

    delete from 数据表名 [where 条件表达式]
  