- 复制数据表结构
  - create [temporary] table [if exists] 表名(like 旧表名);
- 复制数据表数据
  - insert [into] 数据表名1 [字段列表]   select [字段列表] from 数据表名2;
- 临时表的使用
  - 创建临时表 create temporary table 表名(字段名 字段类型[字段属性],next ...)[表选项];
#### 主键冲突
- 主键冲突就是输入的数据表中已经有了
- 解决方法
    - 主键冲突更新 on duplicate key update
    - 主键冲突替换 replace

#### 清空数据
- truncate [table] 表名;
- 与delete的区别
  - truncate是删除之后重新建立，delete是逐条删除。
  - 效率不同，truncate要比delete效率更高
  - truncate删除之后，再次添加数据，自动增长字段会从默认值开始。delete则不影响自动增长字段。
  - 删除范围不同，truncate不能使用where
  - 返回值不同，truncate返回值无意义。delete返回符合条件的删除记录。
#### 去除重复记录
- select select选项 字段列表 from 数据表 
  - select 选项为 distinct
#### 排序
- select * from 数据表名 order by id {desc|asc};
    - asc表示升序，desc表示降序。
    - 多字段排序 

        select *|{字段列表} from 数据表名
        order by 字段名 1 [asc|desc] [字段名2[asc | desc]]...;
#### 限量
- 限定记录的数量
    
    
        select [选项] 字段列表 from 数据表名
        [where 条件表达句] [order by 字段 ase|desc]
        limit[offset,] 记录数;
#### 分组统计
- group_concat(字段) 表示此字段的分组表示。
- count(*) 为记数单位，表示此分组中有几个数据。
        
        select [选项] 字段列表 from 数据表名
        [where 条件表达句] group by 字段名;
#### 分组排序

        
        select [选项] 字段列表 from 数据表名
        [where 条件表达句]
        group by 字段名 [asc|desc];
#### 多分组排序



        select [选项] 字段列表 from 数据表名
        [where 条件表达句]
        group by 字段名 [asc|desc],[, 字段名2 [asc|desc]];
#### 回溯统计
- 分组之后，系统又自动对分组的字段向上进行了一次新的统计并产生了一个新的统计数据，且该数据对应的分组字段值为NULL。
        
        select [选项] 字段列表 from 数据表名
        [where 条件表达句]
        group by 字段名 [asc|desc],[, 字段名2 [asc|desc]]... with rollup;
#### 统计筛选


        select [选项] 字段列表 from 数据表名
        [where 条件表达句]
        group by 字段名 [asc|desc],[, 字段名2 [asc|desc]]... with rollup;
#### 聚合函数
函数名|描述|
|-|-|
count()|返回字段的数量
sum()|返回和
max()|返回最大值
min()|返回最小值
avg()|返回平均值
group_concat()|返回符合条件的参数字段的连接字符串
json_arrayagg()|将符合条件的参数字段作为单个json数组返回
json_objectagg()|将符合条件的参数字段作为单个json数组返回

#### 运算符
- 常用数学函数

运算符|描述|
|-|-|
cell(x)|返回大于等于x的最小整数
floor(x)|返回小于等于x的最大整数
format(x,y)|返回小数点后保留y位的x(进行四舍五入)
truncate(x,y)|计算离x最近的整数，若设置参数y，与format(x,y)功能相同
abs(x)|绝对值
mod(x,y)|求模运算，与x%y功能相同
pi()|计算圆周率
sqrt(x)|求x的平方根
pow(x,y)|幂运算函数，计算x的y次
rand()|默认返回0，1之间的随机数包括0和1

#### 条件运算符 
- between 条件1 and 条件2
- not between 条件1 and 条件2
- is null ,is not null 判断字符是否为null
#### 逻辑运算符
- 逻辑与 &&
- 逻辑或 ||
- 逻辑非 ！
- 主键异或 XOR
 
 
 
 
