--ALTER TABLE





How yo add Column-
-------------------
ALTER TABLE Student ADD COLUMN Whatsapp varchar(10);

--We should have to update all records for that column
UPDATE Student SET Whatsapp  = '1111111111' WHERE rno = 1;
UPDATE Student SET Whatsapp  = '2222222222' WHERE rno = 2;
UPDATE Student SET Whatsapp  = '3333333333' WHERE rno = 3;

--then we can set this column as NOT NULL
ALTER TABLE Student ALTER COLUM Whatsapp SET NOT NULL;

--But we have to whatsapp number as unique
ALTER TABLE Student ADD CONSTRAINT Whatsapp_Number UNIQUE(Whatsapp);


--Before using this query we have to check weather existing records do not have per<0 or per>100
ALTER TABLE Student ADD CHECK(per>= 0 AND per<=100);


--applya size for whatsapp = 10
ALTER TABLE Student ADD CHECK(Whatsapp LIKE '__________');


--we have task to drop not null constraint
ALTER TABLE Student ALTER COLUMN Whatsapp DROP NOT NULL;



--for drop constraint
ALTER TABLE Student DROP CONSTRAINT Whatsapp_Number;

mydb=# ALTER TABLE Student DROP CONSTRAINT Whatsapp_Number;
ALTER TABLE


--for delete column
ALTER TABLE Student DROP COLUMN Whatsapp;


--for change column name 
ALTER TABLE Student RENAME COLUMN name TO sname;

--For change table name 
ALTER TABLE Student TO std;



--Use for set default default values

ALTER TABLE Student ALTER COLUMN city SET DEFAULT('N/A');

--Drop Default 
ALTER TABLE Student ALTER COLUMN city DROP DEFAULT;





mydb=# \dt
          List of relations
 Schema |   Name   | Type  |  Owner
--------+----------+-------+----------
 public | bride    | table | postgres
 public | corder   | table | postgres
 public | customer | table | postgres
 public | groom    | table | postgres
 public | student  | table | postgres
 public | teacher  | table | postgres
(6 rows)


mydb=# SELECT * from Student;
 rno | name | per |  city  | tno |   ldate
-----+------+-----+--------+-----+------------
   1 | AAA  |  60 | PUNE   | 103 | 2017-08-21
   2 | BBB  |  70 | DELHI  | 104 | 2017-08-15
   3 | CCC  |  65 | MUMBAI | 101 | 2017-08-17
   4 | DDD  |  80 | PUNE   | 101 | 2017-08-17
(4 rows)


mydb=# Select * from teacher;
 tno | name | salary |  city
-----+------+--------+--------
 101 | PPP  |  10000 | PANJI
 102 | QQQ  |  70000 | DELHI
 103 | RRR  |  30000 | PUNE
 104 | SSS  |  70000 | MUMBAI
(4 rows)


mydb=# ALTER TABLE Student ADD COLUMN Whatsapp varchar(10);
ALTER TABLE
mydb=# SELECT * from Student;
 rno | name | per |  city  | tno |   ldate    | whatsapp
-----+------+-----+--------+-----+------------+----------
   1 | AAA  |  60 | PUNE   | 103 | 2017-08-21 |
   2 | BBB  |  70 | DELHI  | 104 | 2017-08-15 |
   3 | CCC  |  65 | MUMBAI | 101 | 2017-08-17 |
   4 | DDD  |  80 | PUNE   | 101 | 2017-08-17 |
(4 rows)


mydb=# UPDATE Student SET Whatsapp  = '1111111111' WHERE rno = 1;
UPDATE 1
mydb=# UPDATE Student SET Whatsapp  = '2222222222' WHERE rno = 2;
UPDATE 1
mydb=# UPDATE Student SET Whatsapp  = '3333333333' WHERE rno = 3;
UPDATE 1
mydb=#
mydb=#
mydb=# SELECT * from Student;
 rno | name | per |  city  | tno |   ldate    |  whatsapp
-----+------+-----+--------+-----+------------+------------
   4 | DDD  |  80 | PUNE   | 101 | 2017-08-17 |
   1 | AAA  |  60 | PUNE   | 103 | 2017-08-21 | 1111111111
   2 | BBB  |  70 | DELHI  | 104 | 2017-08-15 | 2222222222
   3 | CCC  |  65 | MUMBAI | 101 | 2017-08-17 | 3333333333
(4 rows)


mydb=# UPDATE Student SET Whatsapp  = '4444444444' WHERE rno = 4;
UPDATE 1
mydb=# SELECT * from Student;
 rno | name | per |  city  | tno |   ldate    |  whatsapp
-----+------+-----+--------+-----+------------+------------
   1 | AAA  |  60 | PUNE   | 103 | 2017-08-21 | 1111111111
   2 | BBB  |  70 | DELHI  | 104 | 2017-08-15 | 2222222222
   3 | CCC  |  65 | MUMBAI | 101 | 2017-08-17 | 3333333333
   4 | DDD  |  80 | PUNE   | 101 | 2017-08-17 | 4444444444
(4 rows)


mydb=# INSERT INTO Student VALUES(5, 'EEE', 90, 'NAGAR', 102, '2022-08-14');

INSERT 0 1
mydb=# SELECT * from Student;
 rno | name | per |  city  | tno |   ldate    |  whatsapp
-----+------+-----+--------+-----+------------+------------
   1 | AAA  |  60 | PUNE   | 103 | 2017-08-21 | 1111111111
   2 | BBB  |  70 | DELHI  | 104 | 2017-08-15 | 2222222222
   3 | CCC  |  65 | MUMBAI | 101 | 2017-08-17 | 3333333333
   4 | DDD  |  80 | PUNE   | 101 | 2017-08-17 | 4444444444
   5 | EEE  |  90 | NAGAR  | 102 | 2022-08-14 |
(5 rows)


mydb=# UPDATE Student SET Whatsapp  = '5555555555' WHERE rno = 5;
UPDATE 1
mydb=# SELECT * from Student;
 rno | name | per |  city  | tno |   ldate    |  whatsapp
-----+------+-----+--------+-----+------------+------------
   1 | AAA  |  60 | PUNE   | 103 | 2017-08-21 | 1111111111
   2 | BBB  |  70 | DELHI  | 104 | 2017-08-15 | 2222222222
   3 | CCC  |  65 | MUMBAI | 101 | 2017-08-17 | 3333333333
   4 | DDD  |  80 | PUNE   | 101 | 2017-08-17 | 4444444444
   5 | EEE  |  90 | NAGAR  | 102 | 2022-08-14 | 5555555555
(5 rows)


mydb=# INSERT INTO Student VALUES(6, 'FFF', 70, 'BANGLORE', 102, '2022-07-14');
INSERT 0 1
mydb=# SELECT * from Student;
 rno | name | per |   city   | tno |   ldate    |  whatsapp
-----+------+-----+----------+-----+------------+------------
   1 | AAA  |  60 | PUNE     | 103 | 2017-08-21 | 1111111111
   2 | BBB  |  70 | DELHI    | 104 | 2017-08-15 | 2222222222
   3 | CCC  |  65 | MUMBAI   | 101 | 2017-08-17 | 3333333333
   4 | DDD  |  80 | PUNE     | 101 | 2017-08-17 | 4444444444
   5 | EEE  |  90 | NAGAR    | 102 | 2022-08-14 | 5555555555
   6 | FFF  |  70 | BANGLORE | 102 | 2022-07-14 |
(6 rows)


mydb=# ALTER TABLE Student ALTER COLUM Whatsapp SET NOT NULL;
ERROR:  syntax error at or near "Whatsapp"
LINE 1: ALTER TABLE Student ALTER COLUM Whatsapp SET NOT NULL;
                                        ^
mydb=# UPDATE Student SET Whatsapp  = '6666666666' WHERE rno = 6;
UPDATE 1
mydb=# SELECT * from Student;
 rno | name | per |   city   | tno |   ldate    |  whatsapp
-----+------+-----+----------+-----+------------+------------
   1 | AAA  |  60 | PUNE     | 103 | 2017-08-21 | 1111111111
   2 | BBB  |  70 | DELHI    | 104 | 2017-08-15 | 2222222222
   3 | CCC  |  65 | MUMBAI   | 101 | 2017-08-17 | 3333333333
   4 | DDD  |  80 | PUNE     | 101 | 2017-08-17 | 4444444444
   5 | EEE  |  90 | NAGAR    | 102 | 2022-08-14 | 5555555555
   6 | FFF  |  70 | BANGLORE | 102 | 2022-07-14 | 6666666666
(6 rows)


mydb=# ALTER TABLE Student ALTER COLUM Whatsapp SET NOT NULL;
ERROR:  syntax error at or near "Whatsapp"
LINE 1: ALTER TABLE Student ALTER COLUM Whatsapp SET NOT NULL;
                                        ^
mydb=# ALTER TABLE Student ALTER COLUMN Whatsapp SET NOT NULL;
ALTER TABLE
mydb=# SELECT * from Student;
 rno | name | per |   city   | tno |   ldate    |  whatsapp
-----+------+-----+----------+-----+------------+------------
   1 | AAA  |  60 | PUNE     | 103 | 2017-08-21 | 1111111111
   2 | BBB  |  70 | DELHI    | 104 | 2017-08-15 | 2222222222
   3 | CCC  |  65 | MUMBAI   | 101 | 2017-08-17 | 3333333333
   4 | DDD  |  80 | PUNE     | 101 | 2017-08-17 | 4444444444
   5 | EEE  |  90 | NAGAR    | 102 | 2022-08-14 | 5555555555
   6 | FFF  |  70 | BANGLORE | 102 | 2022-07-14 | 6666666666
(6 rows)


mydb=# INSERT INTO Student VALUES(6, 'FFF', 70, 'BANGLORE', 102, '2022-07-14');
ERROR:  null value in column "whatsapp" of relation "student" violates not-null constraint
DETAIL:  Failing row contains (6, FFF, 70, BANGLORE, 102, 2022-07-14, null).
mydb=#
mydb=#
mydb=#
mydb=# SELECT * from Student;
 rno | name | per |   city   | tno |   ldate    |  whatsapp
-----+------+-----+----------+-----+------------+------------
   1 | AAA  |  60 | PUNE     | 103 | 2017-08-21 | 1111111111
   2 | BBB  |  70 | DELHI    | 104 | 2017-08-15 | 2222222222
   3 | CCC  |  65 | MUMBAI   | 101 | 2017-08-17 | 3333333333
   4 | DDD  |  80 | PUNE     | 101 | 2017-08-17 | 4444444444
   5 | EEE  |  90 | NAGAR    | 102 | 2022-08-14 | 5555555555
   6 | FFF  |  70 | BANGLORE | 102 | 2022-07-14 | 6666666666
(6 rows)


mydb=# ALTER TABLE Student ADD CONSTRAINT Whatsapp_Number UNIQUE(Whatsapp);
ALTER TABLE
mydb=# INSERT INTO Student VALUES(7, 'FFF', 70, 'BANGLORE', 102, '2022-07-14', '6666666666');
ERROR:  duplicate key value violates unique constraint "whatsapp_number"
DETAIL:  Key (whatsapp)=(6666666666) already exists.
mydb=#
mydb=#
mydb=#
mydb=#
mydb=# INSERT INTO Student VALUES(8, 'FFF', 70, 'BANGLORE', 102, '2022-07-14');
ERROR:  null value in column "whatsapp" of relation "student" violates not-null constraint
DETAIL:  Failing row contains (8, FFF, 70, BANGLORE, 102, 2022-07-14, null).
mydb=#
mydb=#
mydb=# ALTER TABLE Student ADD CHECK(per>= 0 AND per<=100);
ALTER TABLE
mydb=# INSERT INTO Student VALUES(8, 'FFF', -30, 'BANGLORE', 102, '2022-07-14', '8888888888');
ERROR:  new row for relation "student" violates check constraint "student_per_check"
DETAIL:  Failing row contains (8, FFF, -30, BANGLORE, 102, 2022-07-14, 8888888888).
mydb=# SELECT * from Student;
 rno | name | per |   city   | tno |   ldate    |  whatsapp
-----+------+-----+----------+-----+------------+------------
   1 | AAA  |  60 | PUNE     | 103 | 2017-08-21 | 1111111111
   2 | BBB  |  70 | DELHI    | 104 | 2017-08-15 | 2222222222
   3 | CCC  |  65 | MUMBAI   | 101 | 2017-08-17 | 3333333333
   4 | DDD  |  80 | PUNE     | 101 | 2017-08-17 | 4444444444
   5 | EEE  |  90 | NAGAR    | 102 | 2022-08-14 | 5555555555
   6 | FFF  |  70 | BANGLORE | 102 | 2022-07-14 | 6666666666
(6 rows)


mydb=# ALTER TABLE Student ADD CHECK(Whatsapp LIKE '__________');
ALTER TABLE
mydb=#
mydb=#
mydb=# ALTER TABLE Student ALTER COLUMN Whatsapp DROP NOT NULL;
ALTER TABLE
mydb=#
mydb=#
mydb=#
mydb=# ALTER TABLE Student DROP CONSTRAINT Whatsapp_Number;
ALTER TABLE
mydb=#
mydb=#
mydb=# \d student;
                      Table "public.student"
  Column  |         Type          | Collation | Nullable | Default
----------+-----------------------+-----------+----------+---------
 rno      | integer               |           | not null |
 name     | character varying(40) |           | not null |
 per      | double precision      |           |          |
 city     | character varying(40) |           |          |
 tno      | integer               |           |          |
 ldate    | date                  |           |          |
 whatsapp | character varying(10) |           |          |
Indexes:
    "student_pkey" PRIMARY KEY, btree (rno)
Check constraints:
    "student_per_check" CHECK (per >= 0::double precision AND per <= 100::double precision)
    "student_whatsapp_check" CHECK (whatsapp::text ~~ '__________'::text)
Foreign-key constraints:
    "student_tno_fkey" FOREIGN KEY (tno) REFERENCES teacher(tno) ON UPDATE CASCADE ON DELETE CASCADE


