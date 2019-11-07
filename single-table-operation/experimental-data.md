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

#### 多字段排序

        mysql> select category_id,id,name,price from goods order by category_id,price desc;
        +-------------+----+-----------------+---------+
        | category_id | id | name            | price   |
        +-------------+----+-----------------+---------+
        |           3 |  2 | 钢笔            |   15.00 |
        |           3 |  3 | 碳素笔          |    1.00 |
        |           3 |  1 | 2B铅笔          |    0.50 |
        |           6 |  5 | 智能手机        | 1999.00 |
        |           8 |  6 | 桌面音箱        |   69.00 |
        |           9 |  7 | 头戴耳机        |  109.00 |
        |          10 |  8 | 办公电脑        | 2000.00 |
        |          12 |  4 | 超薄笔记本      | 5999.00 |
        |          15 |  9 | 收腰风衣        |  299.00 |
        |          16 | 10 | 薄毛衣          |   48.00 |
        +-------------+----+-----------------+---------+
        10 rows in set (0.01 sec)



