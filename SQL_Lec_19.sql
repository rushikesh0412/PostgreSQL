


CREATE TABLE Student(rno int primary key, name varchar(30) NOT NULL, per float, city varchar(20) NOT NULL);

INSERT INTO Student VALUES(1, 'AAA', 60, 'PUNE');
INSERT INTO Student VALUES(2, 'BBB', 70, 'DELHI');
INSERT INTO Student VALUES(3, 'CCC', 65, 'MUMBAI');
INSERT INTO Student VALUES(4, 'DDD', 80, 'PUNE');
INSERT INTO Student VALUES(5, 'EEE', 60, 'MUMBAI');


CREATE TABLE Teacher(tno int primary key, name varchar(30) NOT NULL, salary float, city varchar(20) NOT NULL);

INSERT INTO Teacher VALUES(101, 'PPP', 10000, 'PANJI');
INSERT INTO Teacher VALUES(102, 'QQQ', 70000, 'DELHI');
INSERT INTO Teacher VALUES(103, 'RRR', 30000, 'PUNE');
INSERT INTO Teacher VALUES(104, 'SSS', 70000, 'MUMBAI');
INSERT INTO Teacher VALUES(105, 'TTT', 60000, 'DELHI');





CREATE TABLE ST(rno int REFERENCES Student(rno) ON DELETE CASCADE ON UPDATE CASCADE, tno int REFERENCES Teacher(tno) ON DELETE CASCADE ON UPDATE CASCADE, ldate DATE);

INSERT INTO ST VALUES(1, 101, '2017-08-21');
INSERT INTO ST VALUES(1, 104, '2017-08-17');
INSERT INTO ST VALUES(2, 102, '2017-08-24');
INSERT INTO ST VALUES(3, 103, '2017-08-15');
INSERT INTO ST VALUES(2, 101, '2017-08-21');



SELECT Student.name FROM Student, ST WHERE Student.rno = ST.rno and ldate = '2017-08-15';



SELECT name FROM Student WHERE city = 'PUNE';
SELECT name FROM Teacher WHERE city = 'PUNE';

((SELECT name FROM Student WHERE city = 'PUNE') UNION (SELECT name FROM Teacher WHERE city = 'PUNE'));





mydb=# \dt
          List of relations
 Schema |  Name   | Type  |  Owner
--------+---------+-------+----------
 public | st      | table | postgres
 public | student | table | postgres
 public | teacher | table | postgres
(3 rows)


mydb=# SELECT * FROM Student;
 rno | name | per |  city
-----+------+-----+--------
   1 | AAA  |  60 | PUNE
   2 | BBB  |  70 | DELHI
   3 | CCC  |  65 | MUMBAI
   4 | DDD  |  80 | PUNE
   5 | EEE  |  60 | MUMBAI
(5 rows)


mydb=# SELECT * FROM Teacher;
 tno | name | salary |  city
-----+------+--------+--------
 101 | PPP  |  10000 | PANJI
 102 | QQQ  |  70000 | DELHI
 103 | RRR  |  30000 | PUNE
 104 | SSS  |  70000 | MUMBAI
 105 | TTT  |  60000 | DELHI
(5 rows)


mydb=# Select * FROM ST;
 rno | tno |   ldate
-----+-----+------------
   1 | 101 | 2017-08-21
   1 | 104 | 2017-08-17
   2 | 102 | 2017-08-24
   3 | 103 | 2017-08-15
   2 | 101 | 2017-08-21
(5 rows)


mydb=# SELECT Student.name FROM Student, ST WHERE Student.rno = ST.rno and ldate = '2017-08-15';
 name
------
 CCC
(1 row)


mydb=# SELECT max(salary) FROM Teacher;
  max
-------
 70000
(1 row)


mydb=# SELECT name FROM Teacher WHERE salary = 70000;
 name
------
 QQQ
 SSS
(2 rows)


mydb=# SELECT name FROM Teacher WHERE salary = (SELECT max(salary) FROM Teacher);
 name
------
 QQQ
 SSS
(2 rows)


mydb=# SELECT tno FROM Teacher WHERE salary = (SELECT max(salary) FROM Teacher);
 tno
-----
 102
 104
(2 rows)


mydb=# SELECT Student.name FROM Student, Teacher, ST WHERE Student.rno = ST.
rno AND Teacher.tno = ST.tno AND salary = (SELECT max(salary) FROM Teacher);

 name
------
 AAA
 BBB
(2 rows)


mydb=# Select * FROM ST;
 rno | tno |   ldate
-----+-----+------------
   1 | 101 | 2017-08-21
   1 | 104 | 2017-08-17
   2 | 102 | 2017-08-24
   3 | 103 | 2017-08-15
   2 | 101 | 2017-08-21
(5 rows)


mydb=# SELECT * FROM Teacher;
 tno | name | salary |  city
-----+------+--------+--------
 101 | PPP  |  10000 | PANJI
 102 | QQQ  |  70000 | DELHI
 103 | RRR  |  30000 | PUNE
 104 | SSS  |  70000 | MUMBAI
 105 | TTT  |  60000 | DELHI
(5 rows)


mydb=# SELECT * FROM Student;
 rno | name | per |  city
-----+------+-----+--------
   1 | AAA  |  60 | PUNE
   2 | BBB  |  70 | DELHI
   3 | CCC  |  65 | MUMBAI
   4 | DDD  |  80 | PUNE
   5 | EEE  |  60 | MUMBAI
(5 rows)


mydb=# SELECT Student.name FROM Student, Teacher, ST WHERE Student.rno = ST.rno AND Teacher.tno = ST.tno AND salary = (SELECT max(salary) FROM Teacher);

 name
------
 AAA
 BBB
(2 rows)



        ^
mydb=# select * from Student WHERE city = 'PUNE';
 rno | name | per | city
-----+------+-----+------
   1 | AAA  |  60 | PUNE
   4 | DDD  |  80 | PUNE
(2 rows)


mydb=# select name from Student WHERE city = 'PUNE';
 name
------
 AAA
 DDD
(2 rows)


mydb=# select name from Student WHERE city = 'PUNE';
 name
------
 AAA
 DDD
(2 rows)


mydb=# select name from Teacher WHERE city = 'PUNE';
 name
------
 RRR
(1 row)


mydb=# select * from Teacher WHERE city = 'PUNE';
 tno | name | salary | city
-----+------+--------+------
 103 | RRR  |  30000 | PUNE
(1 row)


mydb=#  ((SELECT name FROM Student WHERE city = 'PUNE') UNION (SELECT name FROM Teacher WHERE city = 'PUNE'));
 name
------
 DDD
 RRR
 AAA 
(3 rows)



mydb=#  ((SELECT city FROM Student) INTERSECT (SELECT city FROM Teacher));
  city
--------
 MUMBAI
 DELHI
 PUNE
(3 rows)


mydb=#  ((SELECT city FROM Student) INTERSECT (SELECT city FROM Teacher)) ORDER BY city;
  city
--------
 DELHI
 MUMBAI
 PUNE
(3 rows)


mydb=#  ((SELECT city FROM Student) UNION (SELECT city FROM Teacher)) ORDER BY city;
  city
--------
 DELHI
 MUMBAI
 PANJI
 PUNE
(4 rows)


mydb=# select * from Teacher WHERE city IN ('PUNE', 'MUMBAI');
 tno | name | salary |  city
-----+------+--------+--------
 103 | RRR  |  30000 | PUNE
 104 | SSS  |  70000 | MUMBAI
(2 rows)



mydb=# select * from Student WHERE city IN (SELECT city FROM Teacher);
 rno | name | per |  city
-----+------+-----+--------
   1 | AAA  |  60 | PUNE
   2 | BBB  |  70 | DELHI
   3 | CCC  |  65 | MUMBAI
   4 | DDD  |  80 | PUNE
   5 | EEE  |  60 | MUMBAI
(5 rows)


mydb=# select name from Teacher WHERE city IN (SELECT city FROM Student);
 name
------
 QQQ
 RRR
 SSS
 TTT
(4 rows)


mydb=# select name from Student WHERE city IN (SELECT city FROM Teacher);
 name
------
 AAA
 BBB
 CCC
 DDD
 EEE
(5 rows)

++++++++6++6

(select name from Student WHERE city IN (SELECT city FROM Teacher)) U
NION (select name from Teacher WHERE city IN (SELECT city FROM Student)) ORD
ER BY name;

mydb=# (select name from Student WHERE city IN (SELECT city FROM Teacher)) UNION (select name from Teacher WHERE city IN (SELECT city FROM Student)) ORDER BY name;
 name
------
 AAA
 BBB
 CCC
 DDD
 EEE
 QQQ
 RRR
 SSS
 TTT
(9 rows)


mydb=# SELECT city, name FROM student ORDER BY city;
  city  | name
--------+------
 DELHI  | BBB
 MUMBAI | CCC
 MUMBAI | EEE
 PUNE   | AAA
 PUNE   | DDD
(5 rows)


mydb=# SELECT city, name FROM teacher ORDER BY city;
  city  | name
--------+------
 DELHI  | QQQ
 DELHI  | TTT
 MUMBAI | SSS
 PANJI  | PPP
 PUNE   | RRR
(5 rows)




mydb=# (SELECT city, name FROM student) UNION (SELECT city, name FROM teacher) ORDER BY city;
  city  | name
--------+------
 DELHI  | TTT
 DELHI  | QQQ
 DELHI  | BBB
 MUMBAI | SSS
 MUMBAI | EEE
 MUMBAI | CCC
 PANJI  | PPP
 PUNE   | RRR
 PUNE   | AAA
 PUNE   | DDD
(10 rows)






mydb=# DROP TABLE ST;
DROP TABLE
mydb=# DROP TABLE STUDENT;
DROP TABLE
mydb=# DROP TABLE Teacher;
DROP TABLE
mydb=#






--Customer

CREATE TABLE Customer(cno int primary key, cname varchar(20) NOT NULL, caddress varchar(100));