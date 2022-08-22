



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















mydb=# \dt
Did not find any relations.
mydb=# CREATE TABLE Student(rno int primary key, name varchar(30) NOT NULL, per float, city varchar(20) NOT NULL);
CREATE TABLE
mydb=#
mydb=#
mydb=# CREATE TABLE Teacher(tno int primary key, name varchar(30) NOT NULL, salary float, city varchar(20) NOT NULL);
CREATE TABLE
mydb=#
mydb=#
mydb=# CREATE TABLE ST(rno int REFERENCES Student(rno) ON DELETE CASCADE ON UPDATE CASCADE, tno int REFERENCES Teacher(tno) ON DELETE CASCADE ON UPDATE CASCADE, ldate DATE);
CREATE TABLE
mydb=# \dt
          List of relations
 Schema |  Name   | Type  |  Owner
--------+---------+-------+----------
 public | st      | table | postgres
 public | student | table | postgres
 public | teacher | table | postgres
(3 rows)


mydb=# INSERT INTO Student VALUES(1, 'AAA', 60, 'PUNE');
INSERT 0 1
mydb=# INSERT INTO Student VALUES(2, 'BBB', 70, 'DELHI');
INSERT 0 1
mydb=# INSERT INTO Student VALUES(3, 'CCC', 65, 'MUMBAI');
INSERT 0 1
mydb=# INSERT INTO Student VALUES(4, 'DDD', 80, 'PUNE');
INSERT 0 1
mydb=# INSERT INTO Student VALUES(5, 'EEE', 60, 'MUMBAI');
INSERT 0 1
mydb=#
mydb=#
mydb=# INSERT INTO Teacher VALUES(101, 'PPP', 10000, 'PANJI');
INSERT 0 1
mydb=# INSERT INTO Teacher VALUES(102, 'QQQ', 70000, 'DELHI');
INSERT 0 1
mydb=# INSERT INTO Teacher VALUES(103, 'RRR', 30000, 'PUNE');
INSERT 0 1
mydb=# INSERT INTO Teacher VALUES(104, 'SSS', 70000, 'MUMBAI');
INSERT 0 1
mydb=# INSERT INTO Teacher VALUES(105, 'TTT', 60000, 'DELHI');
INSERT 0 1
mydb=#
mydb=#
mydb=#
mydb=# INSERT INTO ST VALUES(1, 101, '2017-08-21');
INSERT 0 1
mydb=# INSERT INTO ST VALUES(1, 104, '2017-08-17');
INSERT 0 1
mydb=# INSERT INTO ST VALUES(2, 102, '2017-08-24');
INSERT 0 1
mydb=# INSERT INTO ST VALUES(3, 103, '2017-08-15');
INSERT 0 1
mydb=# INSERT INTO ST VALUES(2, 101, '2017-08-21');
INSERT 0 1
mydb=#



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


mydb=# SELECT * FROM ST;
 rno | tno |   ldate
-----+-----+------------
   1 | 101 | 2017-08-21
   1 | 104 | 2017-08-17
   2 | 102 | 2017-08-24
   3 | 103 | 2017-08-15
   2 | 101 | 2017-08-21
(5 rows)


mydb=# INSERT INTO ST VALUES(6, 101, '2017-08-15');
ERROR:  insert or update on table "st" violates foreign key constraint "st_rno_fkey"
DETAIL:  Key (rno)=(6) is not present in table "student".
mydb=# INSERT INTO ST VALUES(4, 108, '2017-08-15');
ERROR:  insert or update on table "st" violates foreign key constraint "st_tno_fkey"
DETAIL:  Key (tno)=(108) is not present in table "teacher".
mydb=# UPDATE Student SET rno = 7 WHERE rno = 2;
UPDATE 1
mydb=# SELECT * FROM Student;
 rno | name | per |  city
-----+------+-----+--------
   1 | AAA  |  60 | PUNE
   3 | CCC  |  65 | MUMBAI
   4 | DDD  |  80 | PUNE
   5 | EEE  |  60 | MUMBAI
   7 | BBB  |  70 | DELHI
(5 rows)


mydb=# SELECT * FROM ST;
 rno | tno |   ldate
-----+-----+------------
   1 | 101 | 2017-08-21
   1 | 104 | 2017-08-17
   3 | 103 | 2017-08-15
   7 | 102 | 2017-08-24
   7 | 101 | 2017-08-21
(5 rows)


mydb=# DELETE FROM STUDENT WHERE rno = 7;
DELETE 1
mydb=# SELECT * FROM Student;
 rno | name | per |  city
-----+------+-----+--------
   1 | AAA  |  60 | PUNE
   3 | CCC  |  65 | MUMBAI
   4 | DDD  |  80 | PUNE
   5 | EEE  |  60 | MUMBAI
(4 rows)


mydb=# SELECT * FROM ST;
 rno | tno |   ldate
-----+-----+------------
   1 | 101 | 2017-08-21
   1 | 104 | 2017-08-17
   3 | 103 | 2017-08-15
(3 rows)


mydb=# DELETE FROM Student;
DELETE 4
mydb=# SELECT * FROM ST;
 rno | tno | ldate
-----+-----+-------
(0 rows)


mydb=# DELETE FROM Teacher;
DELETE 5
mydb=# SELECT * FROM Teacher;
 tno | name | salary | city
-----+------+--------+------
(0 rows)



mydb=# INSERT INTO Student VALUES(1, 'AAA', 60, 'PUNE');

INSERT 0 1
mydb=# INSERT INTO Student VALUES(2, 'BBB', 70, 'DELHI');
INSERT 0 1
mydb=# INSERT INTO Student VALUES(3, 'CCC', 65, 'MUMBAI');
INSERT 0 1
mydb=# INSERT INTO Student VALUES(4, 'DDD', 80, 'PUNE');

INSERT 0 1
mydb=# INSERT INTO Student VALUES(5, 'EEE', 60, 'MUMBAI');
INSERT 0 1
mydb=#
mydb=#
mydb=# INSERT INTO Teacher VALUES(101, 'PPP', 10000, 'PANJI');
INSERT 0 1
mydb=# INSERT INTO Teacher VALUES(102, 'QQQ', 70000, 'DELHI');
INSERT 0 1
mydb=# INSERT INTO Teacher VALUES(103, 'RRR', 30000, 'PUNE');
INSERT 0 1
mydb=# INSERT INTO Teacher VALUES(104, 'SSS', 70000, 'MUMBAI');
INSERT 0 1
mydb=# INSERT INTO Teacher VALUES(105, 'TTT', 60000, 'DELHI');
INSERT 0 1



mydb=# INSERT INTO ST VALUES(1, 101, '2017-08-21');
INSERT 0 1
mydb=# INSERT INTO ST VALUES(1, 104, '2017-08-17');
INSERT 0 1
mydb=# INSERT INTO ST VALUES(2, 102, '2017-08-24');
INSERT 0 1
mydb=# INSERT INTO ST VALUES(3, 103, '2017-08-15');
INSERT 0 1
mydb=# INSERT INTO ST VALUES(2, 101, '2017-08-21');
INSERT 0 1
mydb=#




mydb=# SELECT name FROM Student WHERE city = 'PUNE';
 name
------
 AAA
 DDD
(2 rows)


