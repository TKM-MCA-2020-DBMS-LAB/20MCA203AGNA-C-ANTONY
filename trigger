mysql> create database employee;
Query OK, 1 row affected (0.22 sec)

mysql> use employee;
Database changed
mysql> create table emp(name varchar(10) not null,occupation varchar(12) not null, place varchar(10) not null,workingtime varchar(5));
Query OK, 0 rows affected (3.90 sec)
mysql> insert into emp values('nidhi','Analyst','kochi',10);
Query OK, 1 row affected (0.97 sec)

mysql> insert into emp values('sree','engineer','kollam',12);
Query OK, 1 row affected (0.17 sec)
mysql> insert into emp values('ammu','doctor','thrissur',18);
Query OK, 1 row affected (0.11 sec)
mysql> select * from emp;
+-------+------------+-------------+-------------+
| name  | occupation | place       | workingtime |
+-------+------------+-------------+-------------+
| nidhi | analyst    | kochi       | 10          |
| sree  | engineer   | kollam      | 12          |
| ammu  | doctor     | thrissur    | 18          |
+-------+------------+-------------+-------------+
3 rows in set (0.17 sec)
mysql> DELIMITER //
mysql> Create Trigger Before_insert_empworkingtime
    -> BEFORE INSERT ON emp FOR EACH ROW
    -> IF NEW.workingtime < 0 THEN SET NEW.workingtime = 0;
    -> END IF;
    -> END;//
Query OK, 0 rows affected (0.47 sec)
mysql> delimiter ;
mysql> insert into emp values('sana','baker','kottayam',12);
Query OK, 1 row affected (0.82 sec)
mysql> select * from emp;
+----------+------------+-------------+-------------+
| name     | occupation | place       | workingtime |
+----------+------------+-------------+-------------+
| nidhi    | analyst    | kochi       | 10          |
| sree     | engineer   | kollam        12          |
| ammu     | doctor     | thrissur    | 18          |
| sana     | baker      | kottayam    | 12          |
|          |            |             |             |
+----------+------------+-------------+-------------+
5 rows in set (0.00 sec)

mysql> SHOW TRIGGERS;
+------------------------------+--------+-------+-------------------------------------------------------------+--------+------------------------+--------------------------------------------+----------------+----------------------+----------------------+--------------------+
| Trigger                      | Event  | Table | Statement                                                   | Timing | Created                | sql_mode                                   | Definer        | character_set_client | collation_connection | Database Collation |
+------------------------------+--------+-------+-------------------------------------------------------------+--------+------------------------+--------------------------------------------+----------------+----------------------+----------------------+--------------------+
| Before_insert_empworkingtime | INSERT | emp   | IF NEW.workingtime < 0 THEN SET NEW.workingtime = 0;
END IF | BEFORE | 2021-06-11 10:27:55.10 | STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION | root@localhost | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
+------------------------------+--------+-------+-------------------------------------------------------------+--------+------------------------+--------------------------------------------+----------------+----------------------+----------------------+--------------------+
1 row in set (0.89 sec)
