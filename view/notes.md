## 视图管理
### 创建查看
- 视图一个虚拟存在的表，表的结构和数据都依赖于基本表
- 代码
- 优点
  - 简化查询语句
  - 安全性
  - 逻辑数据独立性
  
        create [or replace] [algorithm]={undefined|merge|temptable}
        [definet={user| current_user}]
        [sql security { definer | invoker}]
        view view_name [(column_list)]
        as select_statement
        [with [cascaded | local] check option]
- create : 表示创建视图的关键字
- or replace ： 可选，表示替换已有视图
- algorithm　：　可选，表示视图算法，会影响查询语句的解析方式，它的取值有三个。
  - undefined(默认)：由mysql自动选择算法
  - merge ： 将select_statement和查询视图时的select语句合并起来查询
  - definer ： 将select_statement的查询结果存入临时表，然后用临时表查询
- definer ： 可选，表示定义视图的用户，与安全控制有关，默认当前用户
- sql security ： 可选，用于视图的安全控制
  - definer(默认)：由定义者指定的用户的权限来执行
  - invoker： 由调用视图的用户的权限来执行
- column_list 可选，用于制定视图各个列的名称，默认情况下，与select语句查询的列相同
- as 要执行的操作
- select_statement : 一个完整的查询语句，表示从某些表或视图中查出某些满足条件的记录，将记录导入视图中
- with check option : 可选，用于视图数据操作时的检查条件。若省略，则不检查
  - cascaded(默认): 操作数据时要满足所有相关视图和表定义的条件。例如，在一个视图的基础上建立另外的一个视图，进行级联检查
  - local ：　操作数据时满足该视图本身定义的条件就行
### 修改视图
- alter view修改视图
- as之后的select操作选择其他的表来修改
### 删除视图
- drop view 视图名称
## 视图数据操作
### 添加数据
- 与数据表的操作相同
### 修改数据
- 与操作表的操作相同
### 删除数据
- 与操作表的操作相同
### 视图条件检查
