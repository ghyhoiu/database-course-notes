#### 复制表结构

        mysql> create table operation.cp like subscribe;
        Query OK, 0 rows affected (0.05 sec)

        mysql> desc cp;
        +--------------+-------------+------+-----+---------+-------+
        | Field        | Type        | Null | Key | Default | Extra |
        +--------------+-------------+------+-----+---------+-------+
        | id           | char(3)     | YES  |     | NULL    |       |
        | email        | varchar(60) | YES  |     | NULL    |       |
        | state        | int(11)     | YES  |     | NULL    |       |
        | verification | varchar(7)  | YES  |     | NULL    |       |
        +--------------+-------------+------+-----+---------+-------+
        4 rows in set (0.00 sec)
#### 复制数据表中的数据


        mysql> insert into operation.cp select * from subscribe;

        Query OK, 4 rows affected (0.05 sec)
        Records: 4  Duplicates: 0  Warnings: 0mysql> select * from cp;
        +------+------------------+-------+--------------+
        | id   | email            | state | verification |
        +------+------------------+-------+--------------+
        | 1    | tom123@163.com   |     1 | TRBXPO       |
        | 2    | lucy123@163.com  |     1 | LOICPE       |
        | 3    | lily123@163.com  |     0 | JIXDAMI      |
        | 4    | jimmy123@163.com |     1 | QKOLPH       |
        +------+------------------+-------+--------------+
        4 rows in set (0.00 sec)
#### 主键冲突
#### 清空数据

        mysql> select * from cp;
        +------+------------------+-------+--------------+
        | id   | email            | state | verification |
        +------+------------------+-------+--------------+
        | 1    | tom123@163.com   |     1 | TRBXPO       |
        | 2    | lucy123@163.com  |     1 | LOICPE       |
        | 3    | lily123@163.com  |     0 | JIXDAMI      |
        | 4    | jimmy123@163.com |     1 | QKOLPH       |
        +------+------------------+-------+--------------+

        mysql> truncate table cp;
        Query OK, 0 rows affected (0.02 sec)

        mysql> select * from cp;
        Empty set (0.00 sec)
#### 去除重复记录

        mysql> select email from subscribe;
        +------------------+
        | email            |
        +------------------+
        | tom123@163.com   |
        | lucy123@163.com  |
        | lily123@163.com  |
        | jimmy123@163.com |
        | tom123@163.com   |
        +------------------+
        5 rows in set (0.00 sec)

        mysql> select distinct email from subscribe;
        +------------------+
        | email            |
        +------------------+
        | tom123@163.com   |
        | lucy123@163.com  |
        | lily123@163.com  |
        | jimmy123@163.com |
        +------------------+
        4 rows in set (0.00 sec)
#### 排序


        mysql> select * from subscribe order by id desc;
        +------+------------------+-------+--------------+
        | id   | email            | state | verification |
        +------+------------------+-------+--------------+
        | 4    | jimmy123@163.com |     1 | QKOLPH       |
        | 3    | lily123@163.com  |     0 | JIXDAMI      |
        | 2    | lucy123@163.com  |     1 | LOICPE       |
        | 1    | tom123@163.com   |     1 | TRBXPO       |
        | 1    | tom123@163.com   |     1 | TRBXPO       |
        +------+------------------+-------+--------------+
        5 rows in set (0.00 sec)
        mysql> select * from subscribe order by id asc;
        +------+------------------+-------+--------------+
        | id   | email            | state | verification |
        +------+------------------+-------+--------------+
        | 1    | tom123@163.com   |     1 | TRBXPO       |
        | 1    | tom123@163.com   |     1 | TRBXPO       |
        | 2    | lucy123@163.com  |     1 | LOICPE       |
        | 3    | lily123@163.com  |     0 | JIXDAMI      |
        | 4    | jimmy123@163.com |     1 | QKOLPH       |
        +------+------------------+-------+--------------+





