

--SERIAL


CREATE TABLE Student(rno SERIAL primary key, name varchar(30), per float);


--create sequence

CREATE SEQUENCE tcaseq INCREMENT 1 Start 101;

CREATE TABLE Student(rno int primary key DEFAULT nextval('tcaseq'), name varchar(30) , per float);

ALTER SEQUENCE tcaseq OWNED BY Student.rno;


--drop sequence

DROP SEQUENCE tcaseq CASCADE;












mydb=# \dt
           List of relations
 Schema |    Name    | Type  |  Owner
--------+------------+-------+----------
 public | attendence | table | postgres
 public | bride      | table | postgres
 public | corder     | table | postgres
 public | customer   | table | postgres
 public | groom      | table | postgres
 public | student    | table | postgres
 public | tdemo      | table | postgres
 public | teacher    | table | postgres
(8 rows)


mydb=# drop table Student;
DROP TABLE
mydb=# \dt
           List of relations
 Schema |    Name    | Type  |  Owner
--------+------------+-------+----------
 public | attendence | table | postgres
 public | bride      | table | postgres
 public | corder     | table | postgres
 public | customer   | table | postgres
 public | groom      | table | postgres
 public | tdemo      | table | postgres
 public | teacher    | table | postgres
(7 rows)


mydb=# CREATE TABLE Student(rno SERIAL primary key, name varchar(30), per float);
CREATE TABLE
mydb=# \dt
           List of relations
 Schema |    Name    | Type  |  Owner
--------+------------+-------+----------
 public | attendence | table | postgres
 public | bride      | table | postgres
 public | corder     | table | postgres
 public | customer   | table | postgres
 public | groom      | table | postgres
 public | student    | table | postgres
 public | tdemo      | table | postgres
 public | teacher    | table | postgres
(8 rows)


mydb=# \d Student;
                                    Table "public.student"
 Column |         Type          | Collation | Nullable |               Default
--------+-----------------------+-----------+----------+--------------------------------------
 rno    | integer               |           | not null | nextval('student_rno_seq'::regclass)
 name   | character varying(30) |           |          |
 per    | double precision      |           |          |
Indexes:
    "student_pkey" PRIMARY KEY, btree (rno)


mydb=# SELECT * from Student;
 rno | name | per
-----+------+-----
(0 rows)


mydb=# SELECT nextval('Student_rno_seq');
 nextval
---------
       1
(1 row)


mydb=# INSERT INTO STUDENT(name, per) VALUES('AAA', 60);
INSERT 0 1
mydb=# INSERT INTO STUDENT(name, per) VALUES('BBB', 70);
INSERT 0 1
mydb=# SELECT nextval('Student_rno_seq');
 nextval
---------
       4
(1 row)


mydb=# SELECT * FROM Student;
 rno | name | per
-----+------+-----
   2 | AAA  |  60
   3 | BBB  |  70
(2 rows)


mydb=# INSERT INTO STUDENT(name, per) VALUES('CCC', 80);
INSERT 0 1
mydb=# SELECT * FROM Student;
 rno | name | per
-----+------+-----
   2 | AAA  |  60
   3 | BBB  |  70
   5 | CCC  |  80
(3 rows)


mydb=# DOP TABLE Student;
ERROR:  syntax error at or near "DOP"
LINE 1: DOP TABLE Student;
        ^
mydb=# DROP TABLE Student;
DROP TABLE
mydb=#
mydb=#
mydb=# CREATE TABLE Student(rno SERIAL primary key, name varchar(30), per float);
CREATE TABLE
mydb=# INSERT INTO STUDENT(name, per) VALUES('AAA', 60);
INSERT 0 1
mydb=# INSERT INTO STUDENT(name, per) VALUES('BBB', 70);
INSERT 0 1
mydb=# INSERT INTO STUDENT(name, per) VALUES('CCC', 80);
INSERT 0 1
mydb=# SELECT * FROM Student;
 rno | name | per
-----+------+-----
   1 | AAA  |  60
   2 | BBB  |  70
   3 | CCC  |  80
(3 rows)


mydb=# INSERT INTO Student VALUES(DEFAULT, 'DDD', 90);
INSERT 0 1
mydb=# SELECT * FROM Student;
 rno | name | per
-----+------+-----
   1 | AAA  |  60
   2 | BBB  |  70
   3 | CCC  |  80
   4 | DDD  |  90
(4 rows)


mydb=# INSERT INTO Student VALUES(DEFAULT, 'EEE', 95);
INSERT 0 1
mydb=# SELECT * FROM Student;
 rno | name | per
-----+------+-----
   1 | AAA  |  60
   2 | BBB  |  70
   3 | CCC  |  80
   4 | DDD  |  90
   5 | EEE  |  95
(5 rows)


mydb=# INSERT INTO Student VALUES(DEFAULT, 'FFF', 85) RETURNING rno;
 rno
-----
   6
(1 row)


INSERT 0 1
mydb=# SELECT * FROM Student;
 rno | name | per
-----+------+-----
   1 | AAA  |  60
   2 | BBB  |  70
   3 | CCC  |  80
   4 | DDD  |  90
   5 | EEE  |  95
   6 | FFF  |  85
(6 rows)


mydb=# SELECT pg_get_serial_sequence('Student' , 'rno');
 pg_get_serial_sequence
------------------------
 public.student_rno_seq
(1 row)


mydb=# DROP sequence student_rno_seq CASCADE;
NOTICE:  drop cascades to default value for column rno of table student
DROP SEQUENCE
mydb=# INSERT INTO STUDENT(name, per) VALUES('GGG', 75);
ERROR:  null value in column "rno" of relation "student" violates not-null constraint
DETAIL:  Failing row contains (null, GGG, 75).
mydb=#




--CREATE SEQUENCE





mydb=#
mydb=# CREATE SEQUENCE tcaseq INCREMENT 1 Start 101;
CREATE SEQUENCE
mydb=# DROP TABLE Student;
DROP TABLE
mydb=# CREATE TABLE Student(rno int primary key DEFAULT nextval('tcaseq'), name varchar(30) , per float);
CREATE TABLE
mydb=# ALTER SEQUENCE tcaseq OWNED BY Student.rno;
ALTER SEQUENCE
mydb=#
mydb=# INSERT INTO STUDENT(name, per) VALUES('GGG', 75);
INSERT 0 1
mydb=# INSERT INTO Student VALUES(DEFAULT, 'FFF', 85) RETURNING rno;
 rno
-----
 102
(1 row)


INSERT 0 1
mydb=# SELECT * FROM Student;
 rno | name | per
-----+------+-----
 101 | GGG  |  75
 102 | FFF  |  85
(2 rows)


mydb=# INSERT INTO Student VALUES(DEFAULT, 'EEE', 95);
INSERT 0 1
mydb=# INSERT INTO Student VALUES(DEFAULT, 'DDD', 90);
INSERT 0 1
mydb=# INSERT INTO STUDENT(name, per) VALUES('CCC', 80);
INSERT 0 1
mydb=# INSERT INTO Student VALUES(nextval('tcaseq'), 'BBB', 70);
INSERT 0 1
mydb=# SELECT * FROM Student;
 rno | name | per
-----+------+-----
 101 | GGG  |  75
 102 | FFF  |  85
 103 | EEE  |  95
 103 | EEE  |  95
 104 | DDD  |  90
 105 | CCC  |  80
 106 | BBB  |  70
(6 rows)


mydb=# \d Student;
                               Table "public.student"
 Column |         Type          | Collation | Nullable |           Default
--------+-----------------------+-----------+----------+-----------------------------
 rno    | integer               |           | not null | nextval('tcaseq'::regclass)
 name   | character varying(30) |           |          |
 per    | double precision      |           |          |
Indexes:
    "student_pkey" PRIMARY KEY, btree (rno)


mydb=# DROP SEQUENCE tcaseq CASCADE;
NOTICE:  drop cascades to default value for column rno of table student
DROP SEQUENCE
mydb=# \d Student;
                     Table "public.student"
 Column |         Type          | Collation | Nullable | Default
--------+-----------------------+-----------+----------+---------
 rno    | integer               |           | not null |
 name   | character varying(30) |           |          |
 per    | double precision      |           |          |
Indexes:
    "student_pkey" PRIMARY KEY, btree (rno)


mydb=#
