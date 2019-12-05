# 事务

##   事务操作

#### 执行事务前查看数据

```sql
SELECT name, money FROM sh_user;
Alex	1000.00
Bill	1000.00
		
```

#### 开启事务

```sql
START TRANSACTION;
```

#### 在事务中执行操作

```sql
UPDATE sh_user SET money = money - 100 WHERE name = 'Alex';
UPDATE sh_user SET money = money + 100 WHERE name = 'Bill';
COMMIT;
select name,money from sh_user

Alex	900.00
Bill	1100.00
```

#### 回滚事务

```sql
	START TRANSACTION;
	UPDATE sh_user SET money = money - 100 WHERE name = 'Bill';
	SELECT name, money FROM sh_user WHERE name = 'Bill';
	ROLLBACK;
	SELECT name, money FROM sh_user WHERE name = 'Bill';
```

#### 查看

```sql
SELECT @@autocommit;SET AUTOCOMMIT = 0;SELECT name, money FROM sh_user WHERE name = 'Alex';
```

 ## 		REPEATABLE READ

```sql
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;
SELECT SUM(money) FROM sh_user;
INSERT INTO sh_user (id, name, money) VALUES (3, 'Tom', 1000);
SELECT SUM(money) FROM sh_user;
COMMIT;

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;
SELECT SUM(money) FROM sh_user;
INSERT INTO sh_user (id, name, money) VALUES (4, 'd', 1000);
SELECT SUM(money) FROM sh_user;
COMMIT;
```

​	