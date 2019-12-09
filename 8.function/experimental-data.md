## 函数的使用

### 定义函数

```sql
set global log_bin_trust_function_creators=TRUE;
DELIMITER $$CREATE FUNCTION sayHello(name VARCHAR(30)) RETURNS VARCHAR(50)
BEGIN
RETURN CONCAT('Hello ', name,'!');
END
$$
DELIMITER ;
```

![image-20191209164650036](C:\Users\张程鑫\AppData\Roaming\Typora\typora-user-images\image-20191209164650036.png)

### 查看函数

```sql
SHOW CREATE FUNCTION sayHello
SHOW FUNCTION STATUS LIKE 'sayHello'
```

| Db        | Name     | Type     | Definer        | Modified            | Created             | Security\_type | Comment | character\_set\_client | collation\_connection | Database Collation |
| :-------- | :------- | :------- | :------------- | :------------------ | :------------------ | :------------- | :------ | :--------------------- | :-------------------- | :----------------- |
| pterosaur | sayHello | FUNCTION | root@localhost | 2019-12-09 16:43:40 | 2019-12-09 16:43:40 | DEFINER        |         | utf8mb4                | utf8mb4\_0900\_ai\_ci | utf8\_general\_ci  |

### 调用函数

```sql
select sayHello('小李');
```

| sayHello\('小李'\) |
| :----------------- |
| Hello 小李!        |

### 删除函数

```sql
DROP FUNCTION IF EXISTS sayHello;
pterosaur> DROP FUNCTION IF EXISTS sayHello
[2019-12-09 16:50:25] completed in 2 ms
```

## 存储空间的使用

### 创建存储过程

```sql
DELIMITER $$
CREATE PROCEDURE proc(IN sid INT )
BEGIN
SELECT id, name FROM sh_goods_category where id > sid;
END
$$
DELIMITER ;
completed in 0 ms
```


### 查看存储过程

```sql
SHOW PROCEDURE STATUS LIKE 'proc';
```

| Db        | Name | Type      | Definer        | Modified            | Created             | Security\_type | Comment | character\_set\_client | collation\_connection | Database Collation |
| :-------- | :--- | :-------- | :------------- | :------------------ | :------------------ | :------------- | :------ | :--------------------- | :-------------------- | :----------------- |
| pterosaur | proc | PROCEDURE | root@localhost | 2019-12-09 16:51:33 | 2019-12-09 16:51:33 | DEFINER        |         | utf8mb4                | utf8mb4\_0900\_ai\_ci | utf8\_general\_ci  |

### 调用存储过程

```sql
CALL proc(14);

```

| id   | name       |
| :--- | :--------- |
| 15   | 风神翼龙   |
| 16   | 伏尔加翼龙 |
| 17   | 格格翼龙   |
| 18   | 东方翼龙   |
| 19   | 长城翼龙   |
| 20   | 鲲鹏翼龙   |
| 21   | 悟空翼龙   |

### 修改存储过程

```sql
ALTER PROCEDURE proc
SQL SECURITY INVOKER
COMMENT '从翼龙信息表中获取大于指定id值的数据';

SHOW PROCEDURE STATUS LIKE 'proc'
```

| Db        | Name | Type      | Definer        | Modified            | Created             | Security\_type | Comment                              | character\_set\_client | collation\_connection | Database Collation |
| :-------- | :--- | :-------- | :------------- | :------------------ | :------------------ | :------------- | :----------------------------------- | :--------------------- | :-------------------- | :----------------- |
| pterosaur | proc | PROCEDURE | root@localhost | 2019-12-09 16:58:44 | 2019-12-09 16:56:00 | INVOKER        | 从翼龙信息表中获取大于指定id值的数据 | utf8mb4                | utf8mb4\_0900\_ai\_ci | utf8\_general\_ci  |

### 删除存储过程

```sql
DROP PROCEDURE IF EXISTS proc;
```

## 对比函数和存储过程

```
<1>一般来说，存储过程实现的功能要复杂一点，而函数的实现的功能针对性比较强。存储过程，功能强大，可以执行包括修改表等一系列数据库操作；用户定义函数不能用于执行一组修改全局数据库状态的操作。

<2>对于存储过程来说可以返回参数，如记录集，而函数只能返回值或者表对象。函数只能返回一个变量；而存储过程可以返回多个。存储过程的参数可以有IN,OUT,INOUT三种类型，而函数只能有IN类~~存储过程声明时不需要返回类型，而函数声明时需要描述返回类型，且函数体中必须包含一个有效的RETURN语句。

<3>存储过程，可以使用非确定函数，不允许在用户定义函数主体中内置非确定函数。

<4>存储过程一般是作为一个独立的部分来执行（ EXECUTE 语句执行），而函数可以作为查询语句的一个部分来调用（SELECT调用），由于函数可以返回一个表对象，因此它可以在查询语句中位于FROM关键字的后面。 SQL语句中不可用存储过程，而可以使用函数。
```

