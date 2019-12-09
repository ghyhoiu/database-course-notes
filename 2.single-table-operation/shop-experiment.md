#### 创建商品分类表
        
    CREATE TABLE category (
    -> id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '分类id',
    -> parent_id INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类id',
    -> name VARCHAR(100) NOT NULL DEFAULT '' COMMENT '名称',
    -> sort INT NOT NULL DEFAULT 0 COMMENT '排序',
    -> create_time TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
    -> update_time TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间'
    -> ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#### 商品分类表结构


        mysql> show table status;
        +----------+--------+---------+------------+------+----------------+-------------+-----------------+--------------+-----------+----------------+---------------------+-------------+------------+-----------------+----------+----------------+---------+
        | Name     | Engine | Version | Row_format | Rows | Avg_row_length | Data_length | Max_data_length | Index_length | Data_free | Auto_increment | Create_time         | Update_time | Check_time | Collation       | Checksum | Create_options | Comment |
        +----------+--------+---------+------------+------+----------------+-------------+-----------------+--------------+-----------+----------------+---------------------+-------------+------------+-----------------+----------+----------------+---------+
        | category | InnoDB |      10 | Dynamic    |    0 |              0 |       16384 |               0 |            0 |         0 |              1 | 2019-11-07 17:08:26 | NULL        | NULL       | utf8_general_ci |     NULL |                |         |
        +----------+--------+---------+------------+------+----------------+-------------+-----------------+--------------+-----------+----------------+---------------------+-------------+------------+-----------------+----------+----------------+---------+
        1 row in set (0.00 sec)
#### 商品分类表数据的填入

    mysql> INSERT INTO category (id, parent_id, name) VALUES
    -> (1, 0, '办公'), (2, 1, '耗材'), (3, 2, '文具'),
    -> (4, 0, '电子产品'), (5, 4, '通讯'), (6, 5, '手机'),
    -> (7, 4, '影音'), (8, 7, '音箱'), (9, 7, '耳机'),
    -> (10, 4, '电脑'), (11, 10, '台式电脑'), (12,10, '笔记本'),
    -> (13, 0, '服装'), (14, 13, '女装'), (15, 14,'风衣'), (16, 14, '毛衣');

#### 商品分类的数据
        
        
        mysql> select * from category;
        +----+-----------+--------------+------+---------+-------------+-------------+
        | id | parent_id | name         | sort | is_show | create_time | update_time |
        +----+-----------+--------------+------+---------+-------------+-------------+
        |  1 |         0 | 办公         |    0 |       0 |           0 |           0 |
        |  2 |         1 | 耗材         |    0 |       0 |           0 |           0 |
        |  3 |         2 | 文具         |    0 |       0 |           0 |           0 |
        |  4 |         0 | 电子产品     |    0 |       0 |           0 |           0 |
        |  5 |         4 | 通讯         |    0 |       0 |           0 |           0 |
        |  6 |         5 | 手机         |    0 |       0 |           0 |           0 |
        |  7 |         4 | 影音         |    0 |       0 |           0 |           0 |
        |  8 |         7 | 音箱         |    0 |       0 |           0 |           0 |
        |  9 |         7 | 耳机         |    0 |       0 |           0 |           0 |
        | 10 |         4 | 电脑         |    0 |       0 |           0 |           0 |
        | 11 |        10 | 台式电脑     |    0 |       0 |           0 |           0 |
        | 12 |        10 | 笔记本       |    0 |       0 |           0 |           0 |
        | 13 |         0 | 服装         |    0 |       0 |           0 |           0 |
        | 14 |        13 | 女装         |    0 |       0 |           0 |           0 |
        | 15 |        14 | 风衣         |    0 |       0 |           0 |           0 |
        | 16 |        14 | 毛衣         |    0 |       0 |           0 |           0 |
        +----+-----------+--------------+------+---------+-------------+-------------+
        16 rows in set (0.00 sec)
#### 创建商品表

    mysql> CREATE TABLE goods (
    ->   id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT COMMENT '商品id',
    ->   category_id INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类id',
    ->   spu_id INT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'SPU id',
    ->   sn VARCHAR(20) NOT NULL DEFAULT '' COMMENT '编号', 
    ->   name VARCHAR(120) NOT NULL DEFAULT '' COMMENT '名 称',
    ->   keyword VARCHAR(255) NOT NULL DEFAULT '' COMMENT '关键词',
    ->   picture VARCHAR(255) NOT NULL DEFAULT '' COMMENT '图片',
    ->   tips VARCHAR(255) NOT NULL DEFAULT '' COMMENT '提 示',
    ->   description VARCHAR(255) NOT NULL DEFAULT '' COMMENT '描述',
    ->   content TEXT NOT NULL COMMENT '详情',
    ->   stock INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '库 存',
    ->   score DECIMAL(3, 2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评分',
    ->   is_on_sale TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否上架',
    ->   is_del TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
    ->   is_free_shipping TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否包邮',
    ->   sell_count INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量计数',
    ->   comment_count INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论计数',
    ->   on_sale_time INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '上架时间',
    ->   create_time INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
    ->   update_time INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间'
    -> ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    Query OK, 0 rows affected (0.02 sec)
#### 商品表结构

    mysql> desc goods;
    +------------------+------------------------+------+-----+---------+----------------+
    | Field            | Type                   | Null | Key | Default | Extra          |
    +------------------+------------------------+------+-----+---------+----------------+
    | id               | int(10) unsigned       | NO   | PRI | NULL    | auto_increment |
    | category_id      | int(10) unsigned       | NO   |     | 0       |                |
    | spu_id           | int(10) unsigned       | NO   |     | 0       |                |
    | sn               | varchar(20)            | NO   |     |         |                |
    | name             | varchar(120)           | NO   |     |         |                |
    | keyword          | varchar(255)           | NO   |     |         |                |
    | picture          | varchar(255)           | NO   |     |         |                |
    | tips             | varchar(255)           | NO   |     |         |                |
    | description      | varchar(255)           | NO   |     |         |                |
    | content          | text                   | NO   |     | NULL    |                |
    | price            | decimal(10,2) unsigned | NO   |     | 0.00    |                |
    | stock            | int(10) unsigned       | NO   |     | 0       |                |
    | score            | decimal(3,2) unsigned  | NO   |     | 0.00    |                |
    | is_on_sale       | tinyint(3) unsigned    | NO   |     | 0       |                |
    | is_del           | tinyint(3) unsigned    | NO   |     | 0       |                |
    | is_free_shipping | tinyint(3) unsigned    | NO   |     | 0       |                |
    | sell_count       | int(10) unsigned       | NO   |     | 0       |                |
    | comment_count    | int(10) unsigned       | NO   |     | 0       |                |
    | on_sale_time     | int(10) unsigned       | NO   |     | 0       |                |
    | create_time      | int(10) unsigned       | NO   |     | 0       |                |
    | update_time      | int(10) unsigned       | NO   |     | 0       |                |
    +------------------+------------------------+------+-----+---------+----------------+ 
#### 商品表数据输入


        mysql> INSERT INTO goods(id, category_id, name, keyword, content, price,
        -> stock, score, comment_count) VALUES
        -> (1, 3, '2B铅笔', '文具', '考试专用', 0.5, 500, 4.9, 40000),
        -> (2, 3, '钢笔', '文具', '练字必不可少', 15, 300, 3.9, 500),
        -> (3, 3, '碳素笔', '文具', '平时使用', 1, 500, 5, 98000),
        -> (4, 12, '超薄笔记本', '电子产品', '轻小便携', 5999, 0, 2.5, 200),
        -> (5, 6, '智能手机', '电子产品', '人人必备', 1999, 0, 5, 98000),
        -> (6, 8, '桌面音箱', '电子产品', '扩音装备', 69, 750, 4.5, 1000),
        -> (7, 9, '头戴耳机', '电子产品', '独享个人世界', 109, 0, 3.9, 500),
        -> (8, 10, '办公电脑', '电子产品', '适合办公', 2000, 0, 4.8, 6000),
        -> (9, 15, '收腰风衣', '服装', '春节潮流单品', 299, 0, 4.9, 40000),
        -> (10, 16, '薄毛衣', '服装', '居家旅行必备', 48, 0, 4.8, 98000);

#### 商品数据表

        mysql> select * from goods;
        +----+-------------+--------+----+-----------------+--------------+---------+------+-------------+--------------------+---------+-------+-------+------------+--------+------------------+------------+---------------+--------------+-------------+-------------+
        | id | category_id | spu_id | sn | name            | keyword      | picture | tips | description | content            | price   | stock | score | is_on_sale | is_del | is_free_shipping | sell_count | comment_count | on_sale_time | create_time | update_time |
        +----+-------------+--------+----+-----------------+--------------+---------+------+-------------+--------------------+---------+-------+-------+------------+--------+------------------+------------+---------------+--------------+-------------+-------------+
        |  1 |           3 |      0 |    | 2B铅笔          | 文具         |         |      |             | 考试专用           |    0.50 |   500 |  4.90 |          0 |      0 |                0 |          0 |         40000 |            0 |           0 |           0 |
        |  2 |           3 |      0 |    | 钢笔            | 文具         |         |      |             | 练字必不可少       |   15.00 |   300 |  3.90 |          0 |      0 |                0 |          0 |           500 |            0 |           0 |           0 |
        |  3 |           3 |      0 |    | 碳素笔          | 文具         |         |      |             | 平时使用           |    1.00 |   500 |  5.00 |          0 |      0 |                0 |          0 |         98000 |            0 |           0 |           0 |
        |  4 |          12 |      0 |    | 超薄笔记本      | 电子产品     |         |      |             | 轻小便携           | 5999.00 |     0 |  2.50 |          0 |      0 |                0 |          0 |           200 |            0 |           0 |           0 |
        |  5 |           6 |      0 |    | 智能手机        | 电子产品     |         |      |             | 人人必备           | 1999.00 |     0 |  5.00 |          0 |      0 |                0 |          0 |         98000 |            0 |           0 |           0 |
        |  6 |           8 |      0 |    | 桌面音箱        | 电子产品     |         |      |             | 扩音装备           |   69.00 |   750 |  4.50 |          0 |      0 |                0 |          0 |          1000 |            0 |           0 |           0 |
        |  7 |           9 |      0 |    | 头戴耳机        | 电子产品     |         |      |             | 独享个人世界       |  109.00 |     0 |  3.90 |          0 |      0 |                0 |          0 |           500 |            0 |           0 |           0 |
        |  8 |          10 |      0 |    | 办公电脑        | 电子产品     |         |      |             | 适合办公           | 2000.00 |     0 |  4.80 |          0 |      0 |                0 |          0 |          6000 |            0 |           0 |           0 |
        |  9 |          15 |      0 |    | 收腰风衣        | 服装         |         |      |             | 春节潮流单品       |  299.00 |     0 |  4.90 |          0 |      0 |                0 |          0 |         40000 |            0 |           0 |           0 |
        | 10 |          16 |      0 |    | 薄毛衣          | 服装         |         |      |             | 居家旅行必备       |   48.00 |     0 |  4.80 |          0 |      0 |                0 |          0 |         98000 |            0 |           0 |           0 |
        +----+-------------+--------+----+-----------------+--------------+---------+------+-------------+--------------------+---------+-------+-------+------------+--------+------------------+------------+---------------+--------------+-------------+-------------+

