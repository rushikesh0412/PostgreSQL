--Delete all records in the table
DELETE FROM Student;

DELETE FROM Student WHERE per = 40;

DELETE FROM Student WHERE per < 40;

DELETE FROM Student WHERE per = (select min(per) from Student);


--Returning Clause\dt



mydb=# Select * from student;
 rno |       name       |    phno    |        per
-----+------------------+------------+-------------------
 104 | Dnyaneshwari     | 9373881264 | 67.55999755859375
 105 | abhishek         | 458574521  |                49
 107 | Sonal            | 45896524   |                55
 103 | Mayur Shinde     | 7887885695 |                40
 101 | Rushikesh        | 8668388724 |                86
 102 | Rushikesh Shinde | 9552772017 |                86
 106 | Sonal            | 45896524   |                86
(7 rows)


mydb=# delete from student where per = 55;
DELETE 1
mydb=# Select * from student;
 rno |       name       |    phno    |        per
-----+------------------+------------+-------------------
 104 | Dnyaneshwari     | 9373881264 | 67.55999755859375
 105 | abhishek         | 458574521  |                49
 103 | Mayur Shinde     | 7887885695 |                40
 101 | Rushikesh        | 8668388724 |                86
 102 | Rushikesh Shinde | 9552772017 |                86
 106 | Sonal            | 45896524   |                86
(6 rows)


mydb=# delete from student where per < 45;
DELETE 1
mydb=# Select * from student;
 rno |       name       |    phno    |        per
-----+------------------+------------+-------------------
 104 | Dnyaneshwari     | 9373881264 | 67.55999755859375
 105 | abhishek         | 458574521  |                49
 101 | Rushikesh        | 8668388724 |                86
 102 | Rushikesh Shinde | 9552772017 |                86
 106 | Sonal            | 45896524   |                86
(5 rows)


mydb=# DELETE FROM student WHERE per = (select min(per) from student);
DELETE 1
mydb=# Select * from student;
 rno |       name       |    phno    |        per
-----+------------------+------------+-------------------
 104 | Dnyaneshwari     | 9373881264 | 67.55999755859375
 101 | Rushikesh        | 8668388724 |                86
 102 | Rushikesh Shinde | 9552772017 |                86
 106 | Sonal            | 45896524   |                86
(4 rows)


mydb=# Delete from student where per = 86 RETURNING *;
 rno |       name       |    phno    | per
-----+------------------+------------+-----
 101 | Rushikesh        | 8668388724 |  86
 102 | Rushikesh Shinde | 9552772017 |  86
 106 | Sonal            | 45896524   |  86
(3 rows)


DELETE 3
mydb=# Select * from student;
 rno |     name     |    phno    |        per
-----+--------------+------------+-------------------
 104 | Dnyaneshwari | 9373881264 | 67.55999755859375
(1 row)


mydb=# INSERT INTO student VALUES(101, 'Rushi' , '9552772017', 95);
INSERT 0 1
mydb=# INSERT INTO student VALUES(102, 'Rushikesh Shinde' , '8668388724', 95
);
INSERT 0 1
mydb=# Select * from student;
 rno |       name       |    phno    |        per
-----+------------------+------------+-------------------
 101 | Rushi            | 9552772017 |                95
 102 | Rushikesh Shinde | 8668388724 |                95
 104 | Dnyaneshwari     | 9373881264 | 67.55999755859375
(3 rows)


mydb=# DELETE FROM student;
DELETE 3
mydb=# Select * from student;
 rno | name | phno | per
-----+------+------+-----
(0 rows)


mydb=# INSERT INTO student VALUES(101, 'Rushi' , '9552772017', 95);
INSERT 0 1
mydb=# INSERT INTO student VALUES(102, 'Rushikesh Shinde' , '8668388724', 95);
INSERT 0 1
mydb=# INSERT INTO student VALUES(103, 'Dnyaneshwari' , '9393881264', 85);
INSERT 0 1
mydb=# DELETE FROM student RETURNING rno, name;
 rno |       name
-----+------------------
 101 | Rushi
 102 | Rushikesh Shinde
 103 | Dnyaneshwari
(3 rows)


DELETE 3
mydb=# Select * from student;
 rno | name | phno | per
-----+------+------+-----
(0 rows)

mydb=# drop table student;
DROP TABLE
mydb=#