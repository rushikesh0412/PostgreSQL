

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



mydb=# SELECT * FROM Student, Teacher, ST WHERE Student.rno = ST.rno AND Teacher.tno = ST.tno;

 rno | name | per |  city  | tno | name | salary |  city  | rno | tno |   ldate
-----+------+-----+--------+-----+------+--------+--------+-----+-----+------------
   1 | AAA  |  60 | PUNE   | 101 | PPP  |  10000 | PANJI  |   1 | 101 | 2017-08-21
   1 | AAA  |  60 | PUNE   | 104 | SSS  |  70000 | MUMBAI |   1 | 104 | 2017-08-17
   2 | BBB  |  70 | DELHI  | 102 | QQQ  |  70000 | DELHI  |   2 | 102 | 2017-08-24
   3 | CCC  |  65 | MUMBAI | 103 | RRR  |  30000 | PUNE   |   3 | 103 | 2017-08-15
   2 | BBB  |  70 | DELHI  | 101 | PPP  |  10000 | PANJI  |   2 | 101 | 2017-08-21
(5 rows)



mydb=# SELECT * FROM Student, Teacher, ST WHERE Student.rno = ST.rno AND Teacher.tno = ST.tno AND ldate = '2017-08-21';
 rno | name | per | city  | tno | name | salary | city  | rno | tno |   ldate
-----+------+-----+-------+-----+------+--------+-------+-----+-----+------------
   2 | BBB  |  70 | DELHI | 101 | PPP  |  10000 | PANJI |   2 | 101 | 2017-08-21
   1 | AAA  |  60 | PUNE  | 101 | PPP  |  10000 | PANJI |   1 | 101 | 2017-08-21
(2 rows)

mydb=# SELECT name,name FROM Student, Teacher, ST WHERE Student.rno = ST.rno AND Teacher.tno = ST.tno AND ldate = '2017-08-21';
ERROR:  column reference "name" is ambiguous
LINE 1: SELECT name,name FROM Student, Teacher, ST WHERE Student.rno...

mydb=# SELECT Student.name, Teacher.name FROM Student, Teacher, ST WHERE Student.rno = ST.rno
AND Teacher.tno = ST.tno AND ldate = '2017-08-21';
 name | name
------+------
 BBB  | PPP
 AAA  | PPP
(2 rows)


mydb=# SELECT Student.name AS Student_Name, Teacher.name AS Teacher_Name FROM Student, Teacher, ST WHERE Student.rno = ST.rno AND Teacher.tno = ST.tno AND ldate = '2017-08-21';
 student_name | teacher_name
--------------+--------------
 BBB          | PPP
 AAA          | PPP
(2 rows)


mydb=# SELECT count(Student.name) FROM Student, Teacher, ST WHERE Student.rno = ST.rno AND Teacher.tno = ST.tno AND ldate = '2017-08-21';
 count
-------
     2
(1 row)


mydb=# SELECT count(Teacher.name) FROM Student, Teacher, ST WHERE Student.rno = ST.rno AND Teacher.tno = ST.tno AND ldate = '2017-08-21';
 count
-------
     2
(1 row)



mydb=# SELECT Student.name AS Student_Name, Teacher.name AS Teacher_Name FROM Student, Teacher, ST WHERE Student.rno = ST.rno AND Teacher.tno = ST.tno ORDER BY Student.name;
 student_name | teacher_name
--------------+--------------
 AAA          | PPP
 AAA          | SSS
 BBB          | QQQ
 BBB          | PPP
 CCC          | RRR
(5 rows)


mydb=# SELECT Teacher.name AS Teacher_Name, Student.name AS Student_Name FROM Student, Teacher, ST WHERE Student.rno = ST.rno AND Teacher.tno = ST.tno ORDER BY Teacher.name;
 teacher_name | student_name
--------------+--------------
 PPP          | AAA
 PPP          | BBB
 QQQ          | BBB
 RRR          | CCC
 SSS          | AAA
(5 rows)




mydb=# SELECT Student.name AS Student_Name FROM Student, Teacher, ST WHERE Student.rno = ST.rno AND Teacher.tno = ST.tno AND Teacher.name = 'QQQ';
 student_name
--------------
 BBB
(1 row)



mydb=# SELECT Teacher.name AS Teacher_Name FROM Student, Teacher, ST WHERE Student.rno = ST.rno AND Teacher.tno = ST.tno AND Student.name = 'AAA';
 teacher_name
--------------
 PPP
 SSS
(2 rows)



SELECT((SELECT * FROM Student)- (SELECT count(*) FROM Student, Teacher, ST WHERE Student.rno = ST.rno AND Teacher.tno = ST.tno AND ldate = '2017-08-21'));




mydb=# SELECT ((SELECT count(*) FROM Student)- (SELECT count(*) FROM Student, Teacher, ST WHERE Student.rno = ST.rno AND Teacher.tno = ST.tno AND ldate = '2017-08-21')) AS No_Of_Absent_Student;
 no_of_absent_student
----------------------
                    3
(1 row)



mydb=# SELECT count(*) AS No_Of_Present_Student FROM Student, Teacher, ST WHERE Student.rno = ST.rno AND Teacher.tno = ST.tno AND ldate = '2017-08-21';
 no_of_present_student
-----------------------
                     2
(1 row)



mydb=# SELECT Student.name AS Present_Student FROM Student, Teacher, ST WHERE Student.rno = ST.rno AND Teacher.tno = ST.tno AND ldate = '2017-08-21';
 present_student
-----------------
 BBB
 AAA
(2 rows)



mydb=# SELECT * FROM Student WHERE rno IN (SELECT Student.rno FROM Student, Teacher, ST WHERE Student.rno = ST.rno AND Teacher.tno = ST.tno AND ldate = '2017-08-21');
 rno | name | per | city
-----+------+-----+-------
   1 | AAA  |  60 | PUNE
   2 | BBB  |  70 | DELHI
(2 rows)




SELECT * FROM Student WHERE rno NOT IN (SELECT Student.rno FROM Student, Teacher, ST WHERE Student.rno = ST.rno AND Teacher.tno = ST.tno AND ldate = '2017-08-21');


mydb=# SELECT * FROM Student WHERE rno NOT IN (SELECT Student.rno FROM Student, Teacher, ST WHERE Student.rno = ST.rno AND Teacher.tno = ST.tno AND ldate = '2017-08-21');
 rno | name | per |  city
-----+------+-----+--------
   3 | CCC  |  65 | MUMBAI
   4 | DDD  |  80 | PUNE
   5 | EEE  |  60 | MUMBAI
(3 rows)


mydb=# SELECT name FROM Student WHERE rno IN (SELECT Student.rno FROM Student, Teacher, ST WHERE Student.rno = ST.rno AND Teacher.tno = ST.tno AND ldate = '2017-08-21');
 name
------
 AAA
 BBB
(2 rows)


mydb=# SELECT * FROM Student WHERE rno IN(3,4);
 rno | name | per |  city
-----+------+-----+--------
   3 | CCC  |  65 | MUMBAI
   4 | DDD  |  80 | PUNE
(2 rows)


mydb=# SELECT * FROM Student WHERE rno NOT IN(3,4);
 rno | name | per |  city
-----+------+-----+--------
   1 | AAA  |  60 | PUNE
   2 | BBB  |  70 | DELHI
   5 | EEE  |  60 | MUMBAI
(3 rows)