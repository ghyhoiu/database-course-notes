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


        mysql> insert into goods(id,name,content,keyword) values(10,'橡皮','修正书写错误','文具');
        ERROR 1062 (23000): Duplicate entry '10' for key 'PRIMARY'
#### 解决主键冲突


        mysql> insert into goods(id,name,content,keyword) values(10,'橡皮','修正书写错误','文具')
            -> on duplicate key update name ='橡皮',content='修改书写错误',keyword = '文具';
        Query OK, 2 rows affected (0.01 sec)

        mysql> select name from goods;
        +-----------------+
        | name            |
        +-----------------+
        | 2B铅笔          |
        | 钢笔            |
        | 碳素笔          |
        | 超薄笔记本      |
        | 智能手机        |
        | 桌面音箱        |
        | 头戴耳机        |
        | 办公电脑        |
        | 收腰风衣        |
        | 橡皮            |
        +-----------------+
        10 rows in set (0.00 sec)

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
#### 限量


        mysql> select id,name,price from goods
            -> order by price desc limit 1;
        +----+-----------------+---------+
        | id | name            | price   |
        +----+-----------------+---------+
        |  4 | 超薄笔记本      | 5999.00 |
        +----+-----------------+---------+
        1 row in set (0.00 sec)
        # 显示最高价格的东西


        mysql> select id,name,price from goods
            -> limit 0,5;
        +----+-----------------+---------+
        | id | name            | price   |
        +----+-----------------+---------+
        |  1 | 2B铅笔          |    0.50 |
        |  2 | 钢笔            |   15.00 |
        |  3 | 碳素笔          |    1.00 |
        |  4 | 超薄笔记本      | 5999.00 |
        |  5 | 智能手机        | 1999.00 |
        +----+-----------------+---------+
        5 rows in set (0.00 sec)
        显示前五个 
#### 分组统计


        ## 分组后
        mysql> select category_id ,max(price) from goods
            -> group by category_id;
        +-------------+------------+
        | category_id | max(price) |
        +-------------+------------+
        |           3 |      15.00 |
        |           6 |    1999.00 |
        |           8 |      69.00 |
        |           9 |     109.00 |
        |          10 |    2000.00 |
        |          12 |    5999.00 |
        |          15 |     299.00 |
        |          16 |      48.00 |
        +-------------+------------+
        8 rows in set (0.05 sec)
        ## 分组前
        mysql> select category_id,price from goods;
        +-------------+---------+
        | category_id | price   |
        +-------------+---------+
        |           3 |    0.50 |
        |           3 |   15.00 |
        |           3 |    1.00 |
        |          12 | 5999.00 |
        |           6 | 1999.00 |
        |           8 |   69.00 |
        |           9 |  109.00 |
        |          10 | 2000.00 |
        |          15 |  299.00 |
        |          16 |   48.00 |
        +-------------+---------+
        10 rows in set (0.00 sec)
#### 分组排序


        mysql> select category_id,group_concat(id),group_concat(name)
        -> from goods group by category_id desc;
        +-------------+------------------+---------------------------+
        | category_id | group_concat(id) | group_concat(name)        |
        +-------------+------------------+---------------------------+
        |          16 | 10               | 薄毛衣                    |
        |          15 | 9                | 收腰风衣                  |
        |          12 | 4                | 超薄笔记本                |
        |          10 | 8                | 办公电脑                  |
        |           9 | 7                | 头戴耳机                  |
        |           8 | 6                | 桌面音箱                  |
        |           6 | 5                | 智能手机                  |
        |           3 | 1,2,3            | 2B铅笔,钢笔,碳素笔        |
        +-------------+------------------+---------------------------+
        8 rows in set, 1 warning (0.00 sec)
        $group_id 表示分组显示
#### 多分组排序


        mysql> select score,count(*),group_concat(name),comment_count
        -> from goods group by score desc, comment_count;
        +-------+----------+------------------------+---------------+
        | score | count(*) | group_concat(name)     | comment_count |
        +-------+----------+------------------------+---------------+
        |  5.00 |        2 | 碳素笔,智能手机        |         98000 |
        |  4.90 |        2 | 2B铅笔,收腰风衣        |         40000 |
        |  4.80 |        1 | 办公电脑               |          6000 |
        |  4.80 |        1 | 薄毛衣                 |         98000 |
        |  4.50 |        1 | 桌面音箱               |          1000 |
        |  3.90 |        2 | 钢笔,头戴耳机          |           500 |
        |  2.50 |        1 | 超薄笔记本             |           200 |
        +-------+----------+------------------------+---------------+
        7 rows in set, 1 warning (0.00 sec)
#### 回溯统计

        mysql> select score,count(*),group_concat(name),comment_count from goods group by score desc, comment_count with rollup;
        +-------+----------+----------------------------------------------------------------------------------------------------------------------+---------------+
        | score | count(*) | group_concat(name)                                                                                                   | comment_count |
        +-------+----------+----------------------------------------------------------------------------------------------------------------------+---------------+
        |  5.00 |        2 | 碳素笔,智能手机                                                                                                      |         98000 |
        |  5.00 |        2 | 碳素笔,智能手机                                                                                                      |          NULL |
        |  4.90 |        2 | 2B铅笔,收腰风衣                                                                                                      |         40000 |
        |  4.90 |        2 | 2B铅笔,收腰风衣                                                                                                      |          NULL |
        |  4.80 |        1 | 办公电脑                                                                                                             |          6000 |
        |  4.80 |        1 | 薄毛衣                                                                                                               |         98000 |
        |  4.80 |        2 | 办公电脑,薄毛衣                                                                                                      |          NULL |
        |  4.50 |        1 | 桌面音箱                                                                                                             |          1000 |
        |  4.50 |        1 | 桌面音箱                                                                                                             |          NULL |
        |  3.90 |        2 | 钢笔,头戴耳机                                                                                                        |           500 |
        |  3.90 |        2 | 钢笔,头戴耳机                                                                                                        |          NULL |
        |  2.50 |        1 | 超薄笔记本                                                                                                           |           200 |
        |  2.50 |        1 | 超薄笔记本                                                                                                           |          NULL |
        |  NULL |       10 | 碳素笔,智能手机,2B铅笔,收腰风衣,办公电脑,薄毛衣,桌面音箱,钢笔,头戴耳机,超薄笔记本                                    |          NULL |
        +-------+----------+----------------------------------------------------------------------------------------------------------------------+---------------+
        14 rows in set, 1 warning (0.00 sec)
#### 统计筛选

        mysql> select score,count(*),group_concat(name),comment_count from goods group by score desc, comment_count with rollup having count(*)=2;
        +-------+----------+------------------------+---------------+
        | score | count(*) | group_concat(name)     | comment_count |
        +-------+----------+------------------------+---------------+
        |  5.00 |        2 | 碳素笔,智能手机        |         98000 |
        |  5.00 |        2 | 碳素笔,智能手机        |          NULL |
        |  4.90 |        2 | 2B铅笔,收腰风衣        |         40000 |
        |  4.90 |        2 | 2B铅笔,收腰风衣        |          NULL |
        |  4.80 |        2 | 办公电脑,薄毛衣        |          NULL |
        |  3.90 |        2 | 钢笔,头戴耳机          |           500 |
        |  3.90 |        2 | 钢笔,头戴耳机          |          NULL |
        +-------+----------+------------------------+---------------+
        7 rows in set, 1 warning (0.00 sec)
#### 聚合函数


        mysql> select max(price),min(price)from goods;
        +------------+------------+
        | max(price) | min(price) |
        +------------+------------+
        |    5999.00 |       0.50 |
        +------------+------------+
        1 row in set (0.00 sec)

      
      
        mysql> select category_id,max(price)
            -> from goods group by category_id having count(*)>2;
        +-------------+------------+
        | category_id | max(price) |
        +-------------+------------+
        |           3 |      15.00 |
        +-------------+------------+
        1 row in set (0.00 sec)

       
       
        mysql> select category_id,json_arrayagg(id),json_objectagg(id,name)
            -> from goods group by category_id;
        +-------------+-------------------+----------------------------------------------------+
        | category_id | json_arrayagg(id) | json_objectagg(id,name)                            |
        +-------------+-------------------+----------------------------------------------------+
        |           3 | [1, 2, 3]         | {"1": "2B铅笔", "2": "钢笔", "3": "碳素笔"}        |
        |           6 | [5]               | {"5": "智能手机"}                                  |
        |           8 | [6]               | {"6": "桌面音箱"}                                  |
        |           9 | [7]               | {"7": "头戴耳机"}                                  |
        |          10 | [8]               | {"8": "办公电脑"}                                  |
        |          12 | [4]               | {"4": "超薄笔记本"}                                |
        |          15 | [9]               | {"9": "收腰风衣"}                                  |
        |          16 | [10]              | {"10": "薄毛衣"}                                   |
        +-------------+-------------------+----------------------------------------------------+
        8 rows in set (0.01 sec)




        mysql> select avg(price) from goods;
        +-------------+
        | avg(price)  |
        +-------------+
        | 1053.950000 |
        +-------------+
        1 row in set (0.00 sec)

#### between...and...


        mysql> select id,name,price from goods
            -> where price between 2000 and 4000 ;
        +----+--------------+---------+
        | id | name         | price   |
        +----+--------------+---------+
        |  8 | 办公电脑     | 2000.00 |
        +----+--------------+---------+
        1 row in set (0.00 sec)
#### not between...and...


        mysql> select id,name,price from goods where price not between 2000 and 4000;
        +----+-----------------+---------+
        | id | name            | price   |
        +----+-----------------+---------+
        |  1 | 2B铅笔          |    0.50 |
        |  2 | 钢笔            |   15.00 |
        |  3 | 碳素笔          |    1.00 |
        |  4 | 超薄笔记本      | 5999.00 |
        |  5 | 智能手机        | 1999.00 |
        |  6 | 桌面音箱        |   69.00 |
        |  7 | 头戴耳机        |  109.00 |
        |  9 | 收腰风衣        |  299.00 |
        | 10 | 薄毛衣          |   48.00 |
        +----+-----------------+---------+
        9 rows in set (0.00 sec)
#### is null  is not null


        mysql> select id,name,price,keyword from goods
            -> where keyword is not null
            -> order by price desc limit 2;
        +----+-----------------+---------+--------------+
        | id | name            | price   | keyword      |
        +----+-----------------+---------+--------------+
        |  4 | 超薄笔记本      | 5999.00 | 电子产品     |
        |  8 | 办公电脑        | 2000.00 | 电子产品     |
        +----+-----------------+---------+--------------+
        2 rows in set (0.01 sec)
#### 逻辑与


        mysql> select id,name ,price from goods  where keyword ='电子产品'&& score=5;
        +----+--------------+---------+
        | id | name         | price   |
        +----+--------------+---------+
        |  5 | 智能手机     | 1999.00 |
        +----+--------------+---------+
        1 row in set (0.00 sec)

#### 逻辑非


        mysql> select not 10, not 0,not null,not 0 +!0, !0+!0;

        +--------+-------+----------+-----------+-------+
        | not 10 | not 0 | not null | not 0 +!0 | !0+!0 |
        +--------+-------+----------+-----------+-------+
        |      0 |     1 |     NULL |         0 |     2 |
        +--------+-------+----------+-----------+-------+
        1 row in set (0.00 sec)


