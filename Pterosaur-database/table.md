

select * from pterosaur_category;
| id | parent\_id | name | sort |
| :--- | :--- | :--- | :--- |
| 1 | 0 | 喙嘴龙亚目 | 0 |
| 2 | 1 | 双型齿翼龙科 | 0 |
| 3 | 2 | 双型齿翼龙属 | 0 |
| 4 | 2 | 蓓天翼龙属 | 0 |
| 5 | 1 | 蛙嘴龙科 | 0 |
| 6 | 5 | 蛙颌翼龙属 | 0 |
| 7 | 5 | 热河翼龙属 | 0 |
| 8 | 1 | 曲颌形翼龙科 | 0 |
| 9 | 8 | 奥地利翼龙 | 0 |
| 10 | 8 | 卡尼亚翼龙属 | 0 |
| 11 | 1 | 喙嘴翼龙科 | 0 |
| 12 | 11 | 索德斯翼龙属 | 0 |
| 13 | 11 | 双孔翼龙属 | 0 |
| 14 | 11 | 布尔诺美丽翼龙属 | 0 |
| 15 | 11 | 凤凰翼龙属 | 0 |
| 16 | 11 | 青龙翼龙属 | 0 |
| 17 | 0 | 翼手龙亚目 | 0 |
| 18 | 1 | 古神翼龙科 | 0 |
| 19 | 18 | 华夏翼龙属 | 0 |
| 20 | 18 | 雷神翼龙属 | 0 |
| 21 | 18 | 掠海翼龙属 | 0 |
| 22 | 1 | 神龙翼龙科 | 0 |
| 23 | 22 | 风神翼龙属 | 0 |
| 24 | 22 | 伏尔加翼龙 | 0 |
| 25 | 1 | 翼手龙科 | 0 |
| 26 | 25 | 格格翼龙属 | 0 |
| 27 | 25 | 东方翼龙属 | 0 |
| 28 | 1 | 悟空翼龙科 | 0 |
| 29 | 28 | 长城翼龙属 | 0 |
| 30 | 28 | 鲲鹏翼龙属 | 0 |
| 31 | 28 | 悟空翼龙属 | 0 |

select * from pterosaur_information;
| id | parent\_id | sn | name | height | area | food | era |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | 2 | q010101 | 双型齿翼龙 | 1 | 英格兰/墨西哥 | 鱼类 | 中生代三叠纪晚期 |
| 2 | 2 | q010102 | 蓓天翼龙 | 0.2 | 意大利 | 杂食 | 三叠纪的中诺利阶 |
| 3 | 5 | q010201 | 热河翼龙 | 1 | 中国内蒙宁城 | 鱼类 | 白垩纪早期 |
| 4 | 5 | q010202 | 蛙颌翼龙 | 0.5 | 哈萨克斯坦喀拉套 | 鱼 | 中生代侏罗纪晚侏罗纪世期 |
| 5 | 8 | q010301 | 奥地利翼龙 | NULL | 奥地利 | NULL | 晚三叠纪到白垩纪末 |
| 6 | 8 | q010302 | 卡尼亚翼龙 | 0.8 | 意大利埃内蒙佐 | 较大鱼类 | 三叠纪晚期 |
| 7 | 11 | q010401 | 索德斯翼龙 | 0.45 | 亚洲 | 肉食 | 白垩期末期 |
| 8 | 11 | q010402 | 双孔翼龙 | 1 | 英格兰 | 鱼类 | 下侏罗纪的早托阿尔阶 |
| 9 | 11 | q010403 | 布尔诺美丽翼龙 | 1.5 | 德国布尔诺 | 植物 | 侏罗纪晚期 |
| 10 | 11 | q010404 | 凤凰翼龙 | 1.6 | 中国辽宁建昌县 | 肉食 | 中侏罗纪 |
| 11 | 11 | q010405 | 青龙翼龙 | 0.3 | 中国河北省青龙县 | 昆虫 | 侏罗纪中晚期 |
| 12 | 18 | q020101 | 华夏翼龙 | 0.94 | 华夏辽宁 | 鱼 | 早白垩纪 |
| 13 | 18 | q020102 | 雷神翼龙 | 0.5 | 桑塔纳组克拉图段 | 昆虫 | 白垩纪早期 |
| 14 | 18 | q020103 | 掠海翼龙 | 3.2 | 巴西 | 鱼 | 侏罗纪晚期 |
| 15 | 22 | q020201 | 风神翼龙 | 11 | 大湾国立公园 | 马尔扎龙 | 晚白垩纪晚期 |
| 16 | 22 | q020202 | 伏尔加翼龙 | 10 | 俄罗斯萨拉托夫州 | 小型恐龙 | 上白垩纪早期 |
| 17 | 25 | q020301 | 格格翼龙 | 1.3 | 中国辽宁义县 | 鱼 | 白垩纪早期 |
| 18 | 25 | q020302 | 东方翼龙 | 1.1 | 中国辽宁义县 | 鱼 | 晚侏罗世 |
| 19 | 28 | q020401 | 长城翼龙 | 0.475 | 中国河北青龙 | 昆虫 | 中侏罗世 |
| 20 | 28 | q020402 | 鲲鹏翼龙 | 1.2 | 中国东北部 | 鱼类 | 侏罗纪中晚期 |
| 21 | 28 | q020403 | 悟空翼龙 | 0.7 | 中国辽宁 | 鱼类 | 侏罗纪中期 |

select * from pterosaur_people;
| id | sn | pterosaur\_name | people\_name | area | age |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | q010101 | 双齿型翼龙 | 玛丽·安宁 | 早期英国 | 1798-1847 |
| 2 | q010102 | 培天翼龙 | Rupert Wild | 德国 | 1980-1991 |
| 3 | q010201 | 热河翼龙 | 民众 | 中国 | NULL |
| 4 | q010202 | 蛙颌翼龙 | Anatoly Nicolaevich Ryabinin | 苏联 | NULL |
| 5 | q010301 | 奥地利翼龙 | 民众 | 奥地利 | NULL |
| 6 | q010302 | 卡尼亚翼龙 | Fabio Marco Dalia Vecchia | 意大利 | NULL |
| 7 | q010401 | 索德斯翼龙 | NULL | NULL | NULL |
| 8 | q010402 | 双孔翼龙 | Reverend D.W. Purdon | 英国 | NULL |
| 9 | q010403 | 布尔诺美丽翼龙 | Monika Rothgaenger | 德国 | NULL |
| 10 | q010404 | 凤凰翼龙 | 吕君昌 | 中国 | 1965-2018 |
| 11 | q010405 | 青龙翼龙 | 吕君昌 | 中国 | 1965-2018 |
| 12 | q020101 | 华夏翼龙 | 吕君昌 | 中国 | 1965-2018 |
| 13 | q020102 | 雷神翼龙 | 大卫·安文 | 英国 | NULL |
| 14 | q020103 | 掠海翼龙 | Alexander Keliner | 巴西 | NULL |
| 15 | q020201 | 风神翼龙 | 道格拉斯·劳森 | 美国 | NULL |
| 16 | q020202 | 伏尔加翼龙 | 尼古拉·波戈柳波夫 | 苏联 | 1872-1928 |
| 17 | q020301 | 格格翼龙 | 周忠和 | 美国 | 1965-NULL |
| 18 | q020302 | 东方翼龙 | 吕君昌 | 中国 | 1965-2018 |
| 19 | q020401 | 长城翼龙 | 吕君昌 | 中国 | 1965-2018 |
| 20 | q020402 | 鲲鹏翼龙 | 吕君昌 | 中国 | 1965-2018 |
| 21 | q020403 | 悟空翼龙 | 亚历山大·克尔纳 | 美国 | 1977-NULL |
