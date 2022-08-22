

--Attendence(rno, date, time)
			101 2022-02-06 18:06:32


CREATE TABLE Attendence(rno int, date DATE, time TIME);

--OR

CREATE TABLE Attendence(rno int, date DATE, time TIMESTAMPTZ);

INSERT INTO Attendence VALUES(101, '2022-06-03', '18:11:07');
INSERT INTO Attendence VALUES(102, '2022-06-03', '18:20:15');
INSERT INTO Attendence VALUES(103, '2022-06-03', '18:30:00');


INSERT INTO Attendence VALUES(104, CURRENT_DATE, CURRENT_TIME);

INSERT INTO Attendence VALUES(105, CURRENT_DATE, CURRENT_TIME(0));

SELECT CURRENT_TIME;

SELECT LOCALTIME;


tdemo(t1 TIMESTAMP, t2 TIMESTAMPTZ);

TIMESTAMP --> DATE+TIME
TIMESTAMPTZ --> DATE + TIME + ZONE

CREATE TABLE tDemo(t1 TIMESTAMP, t2 TIMESTAMPTZ);

INSERT INTO tDemo VALUES(CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);




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


mydb=#
mydb=# SELECT * FROM Student;
 rno | name | per |   city   | tno |   ldate    |  whatsapp
-----+------+-----+----------+-----+------------+------------
   1 | AAA  |  60 | PUNE     | 103 | 2017-08-21 | 1111111111
   2 | BBB  |  70 | DELHI    | 104 | 2017-08-15 | 2222222222
   3 | CCC  |  65 | MUMBAI   | 101 | 2017-08-17 | 3333333333
   4 | DDD  |  80 | PUNE     | 101 | 2017-08-17 | 4444444444
   5 | EEE  |  90 | NAGAR    | 102 | 2022-08-14 | 5555555555
   6 | FFF  |  70 | BANGLORE | 102 | 2022-07-14 | 6666666666
(6 rows)


mydb=# CREATE TABLE Attendence(rno int, date DATE, , time TIME);
ERROR:  syntax error at or near ","
LINE 1: CREATE TABLE Attendence(rno int, date DATE, , time TIME);
                                                    ^
mydb=# CREATE TABLE Attendence(rno int, date DATE, time TIME);
CREATE TABLE
mydb=#
mydb=#
mydb=# INSERT INTO Attendence VALUES(101, '2022-06-03', '18:11:07');
INSERT 0 1
mydb=# INSERT INTO Attendence VALUES(102, '2022-06-03', '18:20:15');
INSERT 0 1
mydb=# INSERT INTO Attendence VALUES(103, '2022-06-03', '18:30:00');
INSERT 0 1
mydb=#
mydb=#
mydb=# SELECT * FROM Attendence;
 rno |    date    |   time
-----+------------+----------
 101 | 2022-06-03 | 18:11:07
 102 | 2022-06-03 | 18:20:15
 103 | 2022-06-03 | 18:30:00
(3 rows)


mydb=# SELECT EXTRACT(HOURSE FROM time) FROM Attendence;
ERROR:  "time" units "hourse" not recognized
mydb=# SELECT EXTRACT(HOURS FROM time) FROM Attendence;
 extract
---------
      18
      18
      18
(3 rows)


mydb=# SELECT EXTRACT(MINUTES FROM time) FROM Attendence;
 extract
---------
      11
      20
      30
(3 rows)


mydb=# SELECT EXTRACT(SECONDS FROM time) FROM Attendence;
  extract
-----------
  7.000000
 15.000000
  0.000000
(3 rows)


mydb=# INSERT INTO Attendence VALUES(103, '2022-06-03', '27:30:00');
ERROR:  date/time field value out of range: "27:30:00"
LINE 1: INSERT INTO Attendence VALUES(103, '2022-06-03', '27:30:00')...
                                                         ^
mydb=# INSERT INTO Attendence VALUES(103, '2022-14-03', '18:30:00');
ERROR:  date/time field value out of range: "2022-14-03"
LINE 1: INSERT INTO Attendence VALUES(103, '2022-14-03', '18:30:00')...
                                           ^
HINT:  Perhaps you need a different "datestyle" setting.
mydb=#
mydb=#
mydb=#
mydb=#
mydb=# INSERT INTO Attendence VALUES(104, CURRENT_DATE, CURRENT_TIME);
INSERT 0 1
mydb=# SELECT * FROM Attendence;
 rno |    date    |      time
-----+------------+-----------------
 101 | 2022-06-03 | 18:11:07
 102 | 2022-06-03 | 18:20:15
 103 | 2022-06-03 | 18:30:00
 104 | 2022-06-14 | 20:37:15.039443
(4 rows)


mydb=# INSERT INTO Attendence VALUES(105, CURRENT_DATE, CURRENT_TIME(0));
INSERT 0 1
mydb=# SELECT * FROM Attendence;
 rno |    date    |      time
-----+------------+-----------------
 101 | 2022-06-03 | 18:11:07
 102 | 2022-06-03 | 18:20:15
 103 | 2022-06-03 | 18:30:00
 104 | 2022-06-14 | 20:37:15.039443
 105 | 2022-06-14 | 20:38:18
(5 rows)


mydb=# SELECT CURRENT_TIME;
     current_time
-----------------------
 20:39:08.201197+05:30
(1 row)


mydb=# SELECT LOCALTIME;
    localtime
-----------------
 20:41:15.274854
(1 row)


mydb=# SELECT LOCALTIME(0);
 localtime
-----------
 20:41:38
(1 row)


mydb=# SELECT CURRENT_TIME(0);
  current_time
----------------
 20:41:57+05:30
(1 row)


mydb=# SELECT time'10:00' - time '02:00';
 ?column?
----------
 08:00:00
(1 row)


mydb=# SELECT time'10:00' - time '02:00' AS result;
  result
----------
 08:00:00
(1 row)


mydb=# SELECT time'10:00' - time '14:00' AS result;
  result
-----------
 -04:00:00
(1 row)


mydb=# SELECT time'10:15:12' - time '10:09:13' AS result;
  result
----------
 00:05:59
(1 row)


mydb=# SELECT LOCALTIME:
mydb-# :
mydb-# ;
ERROR:  syntax error at or near ":"
LINE 1: SELECT LOCALTIME:
                        ^
mydb=# SELECT LOCALTIME;
    localtime
-----------------
 20:46:04.020941
(1 row)


mydb=# SELECT LOCALTIME + interval '2 hours' AS Result;
     result
-----------------
 22:47:05.099419
(1 row)


mydb=# CREATE TABLE tDemo(t1 TIMESTAMP, t2 TIMESTAMPTZ);
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


mydb=# SELECT * FROM tDemo;
 t1 | t2
----+----
(0 rows)


mydb=# INSERT INTO tDemo VALUES(CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT 0 1
mydb=# SELECT * FROM tDemo;
             t1             |                t2
----------------------------+----------------------------------
 2022-06-14 20:53:10.807222 | 2022-06-14 20:53:10.807222+05:30
(1 row)


mydb=# SELECT CURRENT_TIMESTAMP;
       current_timestamp
--------------------------------
 2022-06-14 20:53:51.6171+05:30
(1 row)


mydb=# INSERT INTO tDemo VALUES(CURRENT_TIMESTAMP(0), CURRENT_TIMESTAMP(0));
INSERT 0 1
mydb=# SELECT * FROM tDemo;
             t1             |                t2
----------------------------+----------------------------------
 2022-06-14 20:53:10.807222 | 2022-06-14 20:53:10.807222+05:30
 2022-06-14 20:54:44        | 2022-06-14 20:54:44+05:30
(2 rows)


mydb=#


