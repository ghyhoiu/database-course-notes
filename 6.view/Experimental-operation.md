## 视图管理
### 创建查看
- 视图的建立
      
        CREATE VIEW view_pterosaur as 
        select id,name,area,food,height FROM pterosaur.pterosaur_information LIMIT 3;
        SELECT * from pterosaur.view_pterosaur;
id|name |area   |food|height|
--|-----|-------|----|------|
 1|双型齿翼龙|英格兰/墨西哥|鱼类  |1     |
 2|蓓天翼龙 |意大利    |杂食  |0.2   |
 3|热河翼龙 |中国内蒙宁城 |鱼类  |1     |
 #### 列
        CREATE VIEW view_pterosaur (a,b,c,d,e) as 
        select id,name,area,food,height FROM pterosaur.pterosaur_information LIMIT 3;
        select * from pterosaur.view_pterosaur;
a|b    |c      |d |e  |
-|-----|-------|--|---|
1|双型齿翼龙|英格兰/墨西哥|鱼类|1  |
2|蓓天翼龙 |意大利    |杂食|0.2|
3|热河翼龙 |中国内蒙宁城 |鱼类|1  |

#### 查看视图
        DESC pterosaur.view_pterosaur;
Name   |Value           |
-------|----------------|
Field  |a               |
Type   |int(10) unsigned|
Null   |NO              |
Key    |                |
Default|0               |
Extra  |                |

####　查看视图状态
        show table status LIKE 'view_pterosaur';
Name           |Value              |
---------------|-------------------|
Name           |view_pterosaur     |
Engine         |                   |
Version        |                   |
Row_format     |                   |
Rows           |                   |
Avg_row_length |                   |
Data_length    |                   |
Max_data_length|                   |
Index_length   |                   |
Data_free      |                   |
Auto_increment |                   |
Create_time    |2019-11-28 17:26:36|
Update_time    |                   |
Check_time     |                   |
Collation      |                   |
Checksum       |                   |
Create_options |                   |
Comment        |VIEW               |

### 修改视图
        CREATE or REPLACE VIEW pterosaur.view_pterosaur as 
        select id, name from pterosaur.pterosaur_category ;
        SELECT * from pterosaur.view_pterosaur;
Name|Value|
----|-----|
id  |1    |
name|喙嘴龙亚目|

### 删除视图
        drop view view_pterosaur;
        Updated Rows	0
        drop view view_pterosaur;
        Finish time	Thu Nov 28 16:57:20 CST 2019
## 视图数据操作
### 添加数据
        INSERT INTO pterosaur.view_pterosaur VALUEs(35,'随意');

        Updated Rows	1
        Query	INSERT INTO pterosaur.view_pterosaur VALUEs(35,'随意')
        Finish time	Thu Nov 28 17:49:03 CST 2019
### 修改数据
        UPDATE pterosaur.view_pterosaur SET name = '我想'  where id=1;
        Query OK， 1 row affected (0.00sec)
        Rows matched:1 Change: 1 Warnings: 0
### 删除数据
        delete from pterosaur.view_pterosaur where id =1;
        Query OK， 1 row affected (0.00sec)
### 视图条件检查
        CREATE VIEW view_cate_t1 AS
        SELECT id, name FROM sh_goods_category WHERE id < 30;
        
        CREATE VIEW view_cate_t2 AS
        SELECT id, name FROM view_cate_t1 WHERE id > 20
        WITH CHECK OPTION; # 相当于：WITH CASCADED CHECK OPTION
        
        INSERT INTO view_cate_t2 VALUES (17, 'test');
        INSERT INTO view_cate_t2 VALUES (21, 'test');
        INSERT INTO view_cate_t2 VALUES (30, 'test');
        
        CREATE VIEW view_cate_t3 AS
        SELECT id, name FROM view_cate_t1 WHERE id > 20
        WITH LOCAL CHECK OPTION;
        
        INSERT INTO view_cate_t3 VALUES (30, 'test');