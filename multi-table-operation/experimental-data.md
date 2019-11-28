## 多表查询                                           
### 联合查询                                          


    SELECT name, id from pterosaur.pterosaur_category where parent_id=11
    UNION 
    SELECT name, id FROM pterosaur.pterosaur_information WHERE parent_id=18;
    name    |id|
    --------|--|
    索德斯翼龙属  |12|
    双孔翼龙属   |13|
    布尔诺美丽翼龙属|14|
    凤凰翼龙属   |15|
    青龙翼龙属   |16|
    华夏翼龙    |12|
    雷神翼龙    |13|
    掠海翼龙    |14|
### 连接查询                                       
#### 交叉连接                                         

    select c.id cid,c.name cname,g.id gid ,g.name gname FROM pterosaur.pterosaur_category as c CROSS JOIN pterosaur.pterosaur_information as g;
    cid|cname   |gid|gname  |
    ---|--------|---|-------|
    |喙嘴龙亚目   | 21|悟空翼龙   |
    |喙嘴龙亚目   | 20|鲲鹏翼龙   |
    |喙嘴龙亚目   | 19|长城翼龙   |
    |喙嘴龙亚目   | 18|东方翼龙   |
    |喙嘴龙亚目   | 17|格格翼龙   |
    |喙嘴龙亚目   | 16|伏尔加翼龙  |
    |喙嘴龙亚目   | 15|风神翼龙   |
    |喙嘴龙亚目   | 14|掠海翼龙   |
#### 内连接                                           
    
    select c.id cid,c.name cname,g.id gid ,g.name gname FROM pterosaur.pterosaur_category as g JOIN pterosaur.pterosaur_information as c on g.parent_id = c.parent_id;
    由出现了将近70行，所以仅部分显示
    cid|cname  |gid|gname   |
    ---|-------|---|--------|
    2|蓓天翼龙   |  3|双型齿翼龙属  |
    1|双型齿翼龙  |  3|双型齿翼龙属  |
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
     select c.id cid,c.name cname,g.id gid ,g.name gname FROM pterosaur.pterosaur_category as g left JOIN pterosaur.pterosaur_information as c on g.parent_id = c.parent_id;    
     cid|cname  |gid|gname   |
    ---|-------|---|--------|
    1|双型齿翼龙  |  3|双型齿翼龙属  |
    1|双型齿翼龙  |  4|蓓天翼龙属   |
    2|蓓天翼龙   |  3|双型齿翼龙属  |
    2|蓓天翼龙   |  4|蓓天翼龙属   |
    3|热河翼龙   |  6|蛙颌翼龙属   |
    3|热河翼龙   |  7|热河翼龙属   |
    4|蛙颌翼龙   |  6|蛙颌翼龙属   |
    4|蛙颌翼龙   |  7|热河翼龙属   |

#### 右外连接                                         
## 子查询                                             
### 标量子查询                                        
### 列子查询                                          
### 行子查询
### 表子查询
### 带exists关键字的查询
### 带any关键字的查询
## 外键约束
### 添加外检约束
### 查看外界约束
### 关联表操作
#### 添加数据
#### 更新数据
#### 删除数据
### 删除外键约束
