
DROP TABLE Student;
DROP TABLE Teacher;





--Many to 1

CREATE TABLE Teacher(tno int primary key, name varchar(40) NOT NULL, salary float, city varchar(40)  );

INSERT INTO Teacher VALUES(101, 'PPP', 10000, 'PANJI');
INSERT INTO Teacher VALUES(102, 'QQQ', 70000, 'DELHI');
INSERT INTO Teacher VALUES(103, 'RRR', 30000, 'PUNE');
INSERT INTO Teacher VALUES(104, 'SSS', 70000, 'MUMBAI');



CREATE TABLE Student(rno int primary key, name varchar(40) NOT NULL, per float, city varchar(40), tno int REFERENCES Teacher(tno) ON DELETE CASCADE ON UPDATE CASCADE, ldate DATE);

INSERT INTO Student VALUES(1, 'AAA', 60, 'PUNE', 103, '2017-08-21');
INSERT INTO Student VALUES(2, 'BBB', 70, 'DELHI', 104, '2017-08-15');
INSERT INTO Student VALUES(3, 'CCC', 65, 'MUMBAI', 101, '2017-08-17');
INSERT INTO Student VALUES(4, 'DDD', 80, 'PUNE', 101, '2017-08-17');


mydb=# \dt
          List of relations
 Schema |   Name   | Type  |  Owner
--------+----------+-------+----------
 public | customer | table | postgres
(1 row)


mydb=# CREATE TABLE Teacher(tno int primary key, name varchar(40) NOT NULL, salary float, city varchar(40)  );
CREATE TABLE


mydb=#
mydb=# INSERT INTO Teacher VALUES(101, 'PPP', 10000, 'PANJI');
INSERT 0 1
mydb=# INSERT INTO Teacher VALUES(102, 'QQQ', 70000, 'DELHI');
INSERT 0 1
mydb=# INSERT INTO Teacher VALUES(103, 'RRR', 30000, 'PUNE');
INSERT 0 1
mydb=# INSERT INTO Teacher VALUES(104, 'SSS', 70000, 'MUMBAI');
INSERT 0 1
mydb=#


mydb=# CREATE TABLE Student(rno int primary key, name varchar(40) NOT NULL, per float, city varchar(40), tno int REFERENCES Teacher(tno) ON DELETE CASCADE ON UPDATE CASCADE, ldate DATE);
CREATE TABLE


mydb=#
mydb=# INSERT INTO Student VALUES(1, 'AAA', 60, 'PUNE', 103, '2017-08-21');
INSERT 0 1
mydb=# INSERT INTO Student VALUES(2, 'BBB', 70, 'DELHI', 104, '2017-08-15');

INSERT 0 1
mydb=# INSERT INTO Student VALUES(3, 'CCC', 65, 'MUMBAI', 101, '2017-08-17');
INSERT 0 1
mydb=# INSERT INTO Student VALUES(4, 'DDD', 80, 'PUNE', 101, '2017-08-17');
INSERT 0 1
mydb=#


mydb=# SELECT * FROM Student;
 rno | name | per |  city  | tno |   ldate
-----+------+-----+--------+-----+------------
   1 | AAA  |  60 | PUNE   | 103 | 2017-08-21
   2 | BBB  |  70 | DELHI  | 104 | 2017-08-15
   3 | CCC  |  65 | MUMBAI | 101 | 2017-08-17
   4 | DDD  |  80 | PUNE   | 101 | 2017-08-17
(4 rows)


mydb=# SELECT * FROM Teacher;
 tno | name | salary |  city
-----+------+--------+--------
 101 | PPP  |  10000 | PANJI
 102 | QQQ  |  70000 | DELHI
 103 | RRR  |  30000 | PUNE
 104 | SSS  |  70000 | MUMBAI
(4 rows)




mydb=# SELECT * FROM Student WHERE city = 'PUNE';
 rno | name | per | city | tno |   ldate
-----+------+-----+------+-----+------------
   1 | AAA  |  60 | PUNE | 103 | 2017-08-21
   4 | DDD  |  80 | PUNE | 101 | 2017-08-17
(2 rows)


mydb=# SELECT * FROM Teacher WHERE city = 'PUNE';
 tno | name | salary | city
-----+------+--------+------
 103 | RRR  |  30000 | PUNE
(1 row)




--Display teacher wise list of student those who attened lecture on 2017-08-17

mydb=# SELECT Teacher.name, Student.name FROM Teacher, Student WHERE Teacher.tno = Student.tno AND ldate = '2017-08-17';
 name | name
------+------
 PPP  | DDD
 PPP  | CCC
(2 rows)


mydb=# SELECT Teacher.name, Student.name FROM Teacher, Student WHERE Teacher.tno = Student.tno AND ldate = '2017-08-15';
 name | name
------+------
 SSS  | BBB
(1 row)


mydb=# SELECT Teacher.name AS Teacher_Name, Student.name AS Student_Name FROM Teacher, Student WHERE Teacher.tno = Student.tno AND ldate = '2017-08-15';
 teacher_name | student_name
--------------+--------------
 SSS          | BBB
(1 row)


--Display name of student to them teacher 'PPP' is teachig

SELECT Student.name FROM Student, Teacher WHERE Student.tno = Teacher.tno AND Teacher.name = 'PPP';


mydb=# SELECT Student.name FROM Student, Teacher WHERE Student.tno = Teacher.tno AND Teacher.name = 'PPP';
 name
------
 CCC
 DDD
(2 rows)


--Q, Display name of teacher who have not teaching anybody

mydb=# SELECT * FROM Teacher WHERE tno NOT IN (SELECT tno FROM Student);
 tno | name | salary | city
-----+------+--------+-------
 102 | QQQ  |  70000 | DELHI
(1 row)