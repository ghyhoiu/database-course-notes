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