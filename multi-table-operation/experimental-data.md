## 多表查询                                           
### 联合查询                                          


    SELECT name, id from pterosaur.pterosaur_category 
    where parent_id=11
    UNION 
    SELECT name, id FROM pterosaur.pterosaur_information
    WHERE parent_id=18;
    
|name    |id|
| --------|--|
| 索德斯翼龙属  |12|
| 双孔翼龙属   |13|
| 布尔诺美丽翼龙属|14|
| 凤凰翼龙属   |15|
| 青龙翼龙属   |16|
| 华夏翼龙    |12|
| 雷神翼龙    |13|
| 掠海翼龙    |14|
### 连接查询                                       
#### 交叉连接                                         

    select c.id cid,c.name cname,g.id gid ,g.name gname 
    FROM pterosaur.pterosaur_category as c 
    CROSS JOIN pterosaur.pterosaur_information as g;
由于出现了近600行，省略

cid|cname |gid|gname  |
---|------|---|-------|
  1|喙嘴龙亚目 | 21|悟空翼龙   |
  1|喙嘴龙亚目 | 20|鲲鹏翼龙   |
  1|喙嘴龙亚目 | 19|长城翼龙   |
  1|喙嘴龙亚目 | 18|东方翼龙   |
  1|喙嘴龙亚目 | 17|格格翼龙   |
  1|喙嘴龙亚目 | 16|伏尔加翼龙  |
  1|喙嘴龙亚目 | 15|风神翼龙   |
  1|喙嘴龙亚目 | 14|掠海翼龙   | 

#### 内连接                                           
    
    select c.id cid,c.name cname,g.id gid ,g.name gname 
    FROM pterosaur.pterosaur_category as g 
    JOIN pterosaur.pterosaur_information as c
    on g.parent_id = c.parent_id;
由出现了将近70行，所以仅部分显示

cid|cname  |gid|gname   |
---|-------|---|--------|
2|蓓天翼龙   |  3|双型齿翼龙属  |
1|双型齿翼龙  |  3|双型齿翼龙属 |
2|蓓天翼龙   |  4|蓓天翼龙属   |
1|双型齿翼龙  |  4|蓓天翼龙属   |
4|蛙颌翼龙   |  6|蛙颌翼龙属   |
3|热河翼龙   |  6|蛙颌翼龙属   |
4|蛙颌翼龙   |  7|热河翼龙属   |
3|热河翼龙   |  7|热河翼龙属   |
6|卡尼亚翼龙  |  9|奥地利翼龙   |
5|奥地利翼龙  |  9|奥地利翼龙   |
6|卡尼亚翼龙  | 10|卡尼亚翼龙属  |
#### 左外连接   
     select c.id cid,c.name cname,g.id gid ,g.name gname 
     FROM pterosaur.pterosaur_category as g left 
     JOIN pterosaur.pterosaur_information as c on g.parent_id = c.parent_id;    
 cid|cname  |gid|gname   |
---|-------|---|--------|
1|双型齿翼龙  |  3|双型齿翼龙属 |
1|双型齿翼龙  |  4|蓓天翼龙属   |
2|蓓天翼龙   |  3|双型齿翼龙属  |
2|蓓天翼龙   |  4|蓓天翼龙属   |
3|热河翼龙   |  6|蛙颌翼龙属   |
3|热河翼龙   |  7|热河翼龙属   |
4|蛙颌翼龙   |  6|蛙颌翼龙属   |
4|蛙颌翼龙   |  7|热河翼龙属   |

#### 右外连接    

        select c.id cid,c.name cname,g.id gid ,g.name gname 
        FROM pterosaur.pterosaur_category as g left 
        JOIN pterosaur.pterosaur_information as c 
        on g.parent_id = c.parent_id;


cid|cname  |gid|gname   |
---|-------|---|--------|
  1|双型齿翼龙  |  3|双型齿翼龙属  |
  2|蓓天翼龙   |  3|双型齿翼龙属  |
  1|双型齿翼龙  |  4|蓓天翼龙属   |
  2|蓓天翼龙   |  4|蓓天翼龙属   |
  3|热河翼龙   |  6|蛙颌翼龙属   |
  4|蛙颌翼龙   |  6|蛙颌翼龙属   |
  3|热河翼龙   |  7|热河翼龙属   |
  4|蛙颌翼龙   |  7|热河翼龙属   |                                     
## 子查询    
### 标量子查询  

    select name from pterosaur.pterosaur_category
    WHERE id = (select parent_id from pterosaur.pterosaur_information  where name='热河翼龙');
name|
----|
蛙嘴龙科|                                      
### 列子查询

    SELECT name from pterosaur.pterosaur_category 
    WHERE id IN(SELECT DISTINCT parent_id from pterosaur.pterosaur_information );
name  |
------|
双型齿翼龙科
蛙嘴龙科  |
曲颌形翼龙科
喙嘴翼龙科 |
古神翼龙科 |
神龙翼龙科 |
翼手龙科  |
悟空翼龙科 |

### 行子查询
    SELECT id ,name ,sn,height,area,food FROM pterosaur.pterosaur_information 
    WHERE height=(SELECT MIN(height)FROM pterosaur.pterosaur_information)
id|name|sn     |height|area|food|
--|----|-------|------|----|----|
 2|蓓天翼龙|q010102|0.2   |意大利 |杂食  |
### 表子查询
    SELECT a.id,a.name,a.height,a.parent_id from pterosaur.pterosaur_information as a, 
    (SELECT parent_id,height FROM pterosaur.pterosaur_information GROUP BY parent_id) as b
    where a.parent_id=b.parent_id and a.height=b.height;
id|name |height|parent_id|
--|-----|------|---------|
 1|双型齿翼龙|1     |        2|
 3|热河翼龙 |1     |        5|
 5|奥地利翼龙|NULL  |        8|
 7|索德斯翼龙|0.45  |       11|
12|华夏翼龙 |0.94  |       18|
15|风神翼龙 |11    |       22|
17|格格翼龙 |1.3   |       25|
19|长城翼龙 |0.475 |       28|
### 带exists关键字的查询
    SELECT id from pterosaur.pterosaur_information WHERE name='风神翼龙'
    WHERE EXISTS(select id from pterosaur.pterosaur_information WHERE name='风神翼龙')
    and id=15；

    Rows matched:0 Changed:0 Warning:0
### 带any关键字的查询
    select name from pterosaur.pterosaur_category 
    where id =
    any(SELECT DISTINCT parent_id from pterosaur.pterosaur_information where height<1);

name  |
------|
双型齿翼龙科|
蛙嘴龙科  |
曲颌形翼龙科|
喙嘴翼龙科 |
古神翼龙科 |
悟空翼龙科 |
## 外键约束

    ALTER TABLE mydb.employees
    ADD CONSTRAINT FK_ID1 FOREIGN KEY(dept_id) REFERENCES department(id)
    ON DELETE RESTRICT ON UPDATE CASCADE;
    ### 添加外检约束
#
 
    Updated Rows	0
    Query	ALTER TABLE mydb.employees
    ADD CONSTRAINT FK_ID1 FOREIGN KEY(dept_id) REFERENCES department(id)
    ADD CONSTRAINT FK_ID1 FOREIGN KEY(dept_id) REFERENCES department(id)
    ADD CONSTRAINT FK_ID1 FOREIGN KEY(dept_id) REFERENCES department(id)
### 查看外界约束

    DESC mydb.employees dept_id;
Field  |Type            |Null|Key|Default|Extra|
-------|----------------|----|---|-------|-----|
dept_id|int(10) unsigned|NO  |MUL|       |     |
### 关联表操作
#### 添加数据
    INSERT INTO mydb.department(id, name) VALUES(3, '研发部');

#

    Updated Rows	1
    Query	INSERT INTO mydb.department(id, name) VALUES(3, '研发部')
    Finish time	Thu Nov 28 13:08:42 CST 2019
#### 更新数据

    UPDATE mydb.department SET id = 1 WHERE name = '研发部';
    INSERT INTO mydb.employees(name, dept_id) VALUES('Tom', 3);
#

    Updated Rows	1
    Query	UPDATE mydb.department SET id = 1 WHERE name = '研发部'
    Finish time	Thu Nov 28 13:09:48 CST 2019
#### 删除数据
    DELETE FROM mydb.employees WHERE dept_id = 1;
#

    Updated Rows	0
    Query	DELETE FROM mydb.employees WHERE dept_id = 1
    Finish time	Thu Nov 28 13:13:05 CST 2019
### 删除外键约束
    ALTER TABLE mydb.employees DROP FOREIGN KEY FK_ID1;
#

    Updated Rows	0
    Query	ALTER TABLE mydb.employees DROP FOREIGN KEY FK_ID1
    Finish time	Thu Nov 28 13:14:03 CST 2019

#
    
    DESC mydb.employees dept_id;

Field  |Type            |Null|Key|Default|Extra|
-------|----------------|----|---|-------|-----|
dept_id|int(10) unsigned|NO  |MUL|       |     |