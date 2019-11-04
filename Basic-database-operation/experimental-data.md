## 创建数据库
  
  
        mysql> create database subscribe;
                Query OK, 1 row affected (0.00 sec)mysql> show databases;
## 查看数据库
       
       
                mysql> show databases;
                +--------------------+
                | Database           |
                +--------------------+
                | information_schema |
                | mysql              |
                | performance_schema |
                | subscribe          |
                | sys                |
                +--------------------+
                5 rows in set (0.01 sec)
## 查看数据库注册信息
    
        
                mysql> show create database subscribe;
                +-----------+----------------------------------------------------------------------+
                | Database  | Create Database                                                      |
                +-----------+----------------------------------------------------------------------+
                | subscribe | CREATE DATABASE `subscribe` /*!40100 DEFAULT CHARACTER SET latin1 */ |
                +-----------+----------------------------------------------------------------------+
                1 row in set (0.00 sec)
## 选择数据库


                mysql> use subscribe;
                Database changed
## 删除数据库
        
        
                mysql> drop database subscribe
                -> ;
                Query OK, 0 rows affected (0.05 sec)
## 创建数据库
     
     
                create database operation;
                Query OK, 1 row affected (0.05 sec)
## 选择数据库
    
    
                mysql> use operation
                Database changed
## 创建数据表
        
        
                mysql> create table subscribe(
                -> id int comment '编号',
                -> email varchar(60) comment '邮箱地址',
                -> state int comment '是否确认的状态',
                -> verification varchar(6) comment '邮箱验证码'
                -> )default charset=utf8;
                Query OK, 0 rows affected (0.01 sec)
## 查看表结构
       
       
                mysql> desc subscribe;
                +--------------+-------------+------+-----+---------+-------+
                | Field        | Type        | Null | Key | Default | Extra |
                +--------------+-------------+------+-----+---------+-------+
                | id           | int(11)     | YES  |     | NULL    |       |
                | email        | varchar(60) | YES  |     | NULL    |       |
                | state        | int(11)     | YES  |     | NULL    |       |
                | verification | varchar(6)  | YES  |     | NULL    |       |
                +--------------+-------------+------+-----+---------+-------+
        4 rows in set (0.01 sec)
## 查看数据表
 
 
                mysql> show tables;
                +---------------------+
                | Tables_in_operation |
                +---------------------+
                | subscribe           |
                +---------------------+
                1 row in set (0.00 sec)
## 查看数据表相关数据
                mysql> show table status from operation like '%subscribe%'\G
                *************************** 1. row ***************************
                Name: subscribe
                Engine: InnoDB
                Version: 10
                Row_format: Dynamic
                Rows: 0
                Avg_row_length: 0
                Data_length: 16384
                Max_data_length: 0
                Index_length: 0
                Data_free: 0
                Auto_increment: NULL
                Create_time: 2019-10-31 17:57:01
                Update_time: NULL
                Check_time: NULL
                Collation: utf8_general_ci
                Checksum: NULL
                Create_options: 
                ;Comment: 
                1 row in set (0.00 sec)
                
#### 查看数据表的创建信息

                mysql> show create table  subscribe;
                +-----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
                | Table     | Create Table                                                                                                                                                                                                                                                         |
                +-----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
                | subscribe | CREATE TABLE `subscribe` (
                `id` int(11) DEFAULT NULL COMMENT '编号',
                `email` varchar(60) DEFAULT NULL COMMENT '邮箱地址',
                `state` int(11) DEFAULT NULL COMMENT '是否确认的状态',
                `verification` varchar(6) DEFAULT NULL COMMENT '邮箱验证码'
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8                   |
                +-----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
                1 row in set (0.00 sec)
#### 查看数据库结构

                mysql> show full columns from subscribe
                -> ;
                +--------------+-------------+-----------------+------+-----+---------+-------+---------------------------------+-----------------------+
                | Field        | Type        | Collation       | Null | Key | Default | Extra | Privileges                      | Comment               |
                +--------------+-------------+-----------------+------+-----+---------+-------+---------------------------------+-----------------------+
                | id           | int(11)     | NULL            | YES  |     | NULL    |       | select,insert,update,references | 编号                  |
                | email        | varchar(60) | utf8_general_ci | YES  |     | NULL    |       | select,insert,update,references | 邮箱地址              |
                | state        | int(11)     | NULL            | YES  |     | NULL    |       | select,insert,update,references | 是否确认的状态        |
                | verification | varchar(6)  | utf8_general_ci | YES  |     | NULL    |       | select,insert,update,references | 邮箱验证码            |
                +--------------+-------------+-----------------+------+-----+---------+-------+---------------------------------+-----------------------+
                4 rows in set (0.00 sec)
#### 添加数据

                mysql> insert into subscribe values
                -> (1,'tom123@163.com',1,'TRBXPO') ;
                Query OK, 1 row affected (0.00 sec)
                mysql> insert into subscribe values
                -> (2, 'lucy123@163.com', 1, 'LOICPE');
                mysql> insert into subscribe values
                -> (3, 'lily123@163.com', 0, 'JIXDAMI');
                Query OK, 1 row affected (0.00 sec)
                mysql> insert into subscribe values
                -> (4, 'jimmy123@163.com', 0, 'QKOLPH') ;
                Query OK, 1 row affected (0.00 sec)
                mysql> insert into subscribe values
                -> (5, 'joy123@163.com', 1, 'JSMWNL');
                Query OK, 1 row affected (0.00 sec)
#### 查询数据

                mysql> select * from subscribe;
                +------+------------------+-------+--------------+
                | id   | email            | state | verification |
                +------+------------------+-------+--------------+
                |    1 | tom123@163.com   |     1 | TRBXPO       |
                |    2 | lucy123@163.com  |     1 | LOICPE       |
                |    3 | lily123@163.com  |     0 | JIXDAMI      |
                |    4 | jimmy123@163.com |     0 | QKOLPH       |
                |    5 | joy123@163.com   |     1 | JSMWNL       |
                +------+------------------+-------+--------------+
                5 rows in set (0.00 sec)
#### 查询表中部分字段
                mysql> select id,email from subscribe;
                +------+------------------+
                | id   | email            |
                +------+------------------+
                |    1 | tom123@163.com   |
                |    2 | lucy123@163.com  |
                |    3 | lily123@163.com  |
                |    4 | jimmy123@163.com |
                |    5 | joy123@163.com   |
                +------+------------------+
                5 rows in set (0.00 sec)
#### 简单条件查询数据



                mysql> select * from subscribe where state = 1;
                +------+-----------------+-------+--------------+
                | id   | email           | state | verification |
                +------+-----------------+-------+--------------+
                |    1 | tom123@163.com  |     1 | TRBXPO       |
                |    2 | lucy123@163.com |     1 | LOICPE       |
                |    5 | joy123@163.com  |     1 | JSMWNL       |
                +------+-----------------+-------+--------------+
                3 rows in set (0.00 sec)
#### 修改数据
                mysql> update subscribe set state = 1 where id =4;
                Query OK, 1 row affected (0.00 sec)
                Rows matched: 1  Changed: 1  Warnings: 0
                mysql> select * from subscribe where state = 1;
                +------+------------------+-------+--------------+
                | id   | email            | state | verification |
                +------+------------------+-------+--------------+
                |    1 | tom123@163.com   |     1 | TRBXPO       |
                |    2 | lucy123@163.com  |     1 | LOICPE       |
                |    4 | jimmy123@163.com |     1 | QKOLPH       |
                |    5 | joy123@163.com   |     1 | JSMWNL       |
                +------+------------------+-------+--------------+
                4 rows in set (0.00 sec)
#### 删除数据


                mysql> delete from subscribe where id =5;
                Query OK, 1 row affected (0.00 sec)
                mysql> select * from subscribe;
                +------+------------------+-------+--------------+
                | id   | email            | state | verification |
                +------+------------------+-------+--------------+
                |    1 | tom123@163.com   |     1 | TRBXPO       |
                |    2 | lucy123@163.com  |     1 | LOICPE       |
                |    3 | lily123@163.com  |     0 | JIXDAMI      |
                |    4 | jimmy123@163.com |     1 | QKOLPH       |
                +------+------------------+-------+--------------+
                4 rows in set (0.00 sec)
