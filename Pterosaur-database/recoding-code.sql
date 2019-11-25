CREATE TABLE pterosaur_category (
id int UNSIGNED PRIMARY KEY auto_increment comment '分类id',
parent_id int UNSIGNED NOT NULL DEFAULT 0 comment '上级分类id',
name VARCHAR(100) NOT NULL DEFAULT '' comment '名字',
sort int NOT NULL DEFAULT 0 comment '排序'
) engine=innoDB DEFAULT charset=utf8;

INSERT into pterosaur.pterosaur_category(id,parent_id,name)VALUES
(1,0,'喙嘴龙亚目'),
(2,1,'双型齿翼龙科'),(3,2,'双型齿翼龙属'),(4,2,'蓓天翼龙属'),
(5,1,'蛙嘴龙科'),(6,5,'蛙颌翼龙属'),(7,5,'热河翼龙属'),
(8,1,'曲颌形翼龙科'),(9,8,'奥地利翼龙'),(10,8,'卡尼亚翼龙属'),
(11,1,'喙嘴翼龙科'),(12,11,'索德斯翼龙属'),(13,11,'双孔翼龙属'),(14,11,'布尔诺美丽翼龙属'),(15,11,'凤凰翼龙属'),(16,11,'青龙翼龙属');
INSERT into pterosaur.pterosaur_category(id,parent_id,name)VALUES
(17,0,'翼手龙亚目'),
(18,1,'古神翼龙科'),(19,18,'华夏翼龙属'),(20,18,'雷神翼龙属'),(21,18,'掠海翼龙属'),
(22,1,'神龙翼龙科'),(23,22,'风神翼龙属'),(24,22,'伏尔加翼龙'),
(25,1,'翼手龙科'),(26,25,'格格翼龙属'),(27,25,'东方翼龙属'),
(28,1,'悟空翼龙科'),(29,28,'长城翼龙属'),(30,28,'鲲鹏翼龙属'),(31,28,'悟空翼龙属');
select * from pterosaur_category;