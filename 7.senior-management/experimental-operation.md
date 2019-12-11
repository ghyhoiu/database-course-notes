高级管理

## 用户权限管理

#### 创建用户



```sql
CREATE USER 'test1';
SELECT host, user FROM mysql.user;
```

| host      | user             |
| :-------- | :--------------- |
| %         | test1            |
| localhost | mysql.infoschema |
| localhost | mysql.session    |
| localhost | mysql.sys        |
| localhost | root             |



```sql
CREATE USER 'test2'@'localhost' IDENTIFIED BY '123456';
SELECT plugin, authentication_string FROM mysql.userWHERE user='test2';
```

| plugin                  | authentication\_string                                       |
| :---------------------- | :----------------------------------------------------------- |
| caching\_sha2\_password | $A$005$\*gTEaFld04xa6<br/>N^JHb3q38dLApQ363Eek7cckfZY0oJNv2tS28CVFzkRu1 |

#### 将密码设置为过期



```sql
ALTER USER 'shop'@'127.0.0.%' PASSWORD EXPIRE;
```

#### 修改用户密码

```sql
SHOW DATABASES;

ALTER USER 'shop'@'127.0.0.%' IDENTIFIED BY '123q';
```

#### 为用户设置权限

```sql
GRANT SELECT ON shop.sh_goods TO 'shop'@'127.0.0.%';

DROP TABLE shop.sh_goods;
```

#### 回收用户权限

```sql
REVOKE SELECT ON shop.sh_goods FROM 'shop'@'127.0.0.%';

DROP USER IF EXISTS 'shop'@'localhost';

SELECT * FROM shop.sh_goods;
```

## 数据库备份与还原

#### 备份

##### 备份单个数据库

```bash
c:mysql\bin>mysqldump -u root -h localhost -p yilong>d:\docment.sql
Enter password: ****
```

##### 备份多个数据库

  

```bash
c:mysql\bin>mysqldump -u root -h localhost -p  --databsae yilong asdf>d:\docment.sql
Enter password: ****
```



#### 还原

```bash
c:mysql\bin>mysqldump -u root -h localhost -p --all-database >d:\docment.sql
Enter password: ****
```



##### 输入重定向

```bash
c:mysql\bin>mysqldump -u root -p asdf >d:\docment.sql
Enter password: ****
```

##### source命令

```sql
drop table muke;
Query OK. 0 rows affected (0.02 sec)
source d:\docment.sql
```

