

--NATURAL JOIN

SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB INNER JOIN BTAB ON ATAB.city = BTAB.city;

SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB, BTAB WHERE ATAB.city = BTAB.city;


--When we have multiple common column 
SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB NATURAL JOIN BTAB;

mydb=# SELECT * FROM ATAB;
 ano |   city
-----+----------
   1 | PUNE
   2 | MUMBAI
   3 | BANGLORE
   4 | DELHI
   5 | MUMBAI
(5 rows)


mydb=# SELECT * FROM BTAB;
 bno |  city
-----+---------
 101 | MUMBAI
 102 | PUNE
 103 | SATARA
 104 | SOLAPUR
 105 | MUMBAI
(5 rows)


mydb=# SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB INNER JOIN BTAB ON ATAB.city = BTAB.city;
 ano |  city  | bno |  city
-----+--------+-----+--------
   2 | MUMBAI | 101 | MUMBAI
   2 | MUMBAI | 105 | MUMBAI
   5 | MUMBAI | 101 | MUMBAI
   5 | MUMBAI | 105 | MUMBAI
   1 | PUNE   | 102 | PUNE
(5 rows)


mydb=#
mydb=# SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB, BTAB WHERE ATAB.city = BTAB.city;
 ano |  city  | bno |  city
-----+--------+-----+--------
   2 | MUMBAI | 101 | MUMBAI
   2 | MUMBAI | 105 | MUMBAI
   5 | MUMBAI | 101 | MUMBAI
   5 | MUMBAI | 105 | MUMBAI
   1 | PUNE   | 102 | PUNE
(5 rows)


mydb=#
mydb=# SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB NATURAL JOIN BTAB;
 ano |  city  | bno |  city
-----+--------+-----+--------
   2 | MUMBAI | 101 | MUMBAI
   2 | MUMBAI | 105 | MUMBAI
   5 | MUMBAI | 101 | MUMBAI
   5 | MUMBAI | 105 | MUMBAI
   1 | PUNE   | 102 | PUNE
(5 rows)


mydb=#





--CROSS JOIN
-----------------------------------------------------------------
SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB CROSS JOIN BTAB;

mydb=# SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB CROSS JOIN BTAB;
 ano |   city   | bno |  city
-----+----------+-----+---------
   1 | PUNE     | 101 | MUMBAI
   1 | PUNE     | 102 | PUNE
   1 | PUNE     | 103 | SATARA
   1 | PUNE     | 104 | SOLAPUR
   1 | PUNE     | 105 | MUMBAI
   2 | MUMBAI   | 101 | MUMBAI
   2 | MUMBAI   | 102 | PUNE
   2 | MUMBAI   | 103 | SATARA
   2 | MUMBAI   | 104 | SOLAPUR
   2 | MUMBAI   | 105 | MUMBAI
   3 | BANGLORE | 101 | MUMBAI
   3 | BANGLORE | 102 | PUNE
   3 | BANGLORE | 103 | SATARA
   3 | BANGLORE | 104 | SOLAPUR
   3 | BANGLORE | 105 | MUMBAI
   4 | DELHI    | 101 | MUMBAI
   4 | DELHI    | 102 | PUNE
   4 | DELHI    | 103 | SATARA
   4 | DELHI    | 104 | SOLAPUR
   4 | DELHI    | 105 | MUMBAI
   5 | MUMBAI   | 101 | MUMBAI
   5 | MUMBAI   | 102 | PUNE
   5 | MUMBAI   | 103 | SATARA
   5 | MUMBAI   | 104 | SOLAPUR
   5 | MUMBAI   | 105 | MUMBAI
(25 rows)



--SELF JOIN

mydb=# SELECT * FROM ATAB SELF JOIN ATAB;
ERROR:  syntax error at or near ";"
LINE 1: SELECT * FROM ATAB SELF JOIN ATAB;
                                         ^
                ^
mydb=# SELECT * FROM ATAB AS T1 INNER JOIN ATAB AS T2 ON T1.city = T2.city;
 ano |   city   | ano |   city
-----+----------+-----+----------
   3 | BANGLORE |   3 | BANGLORE
   4 | DELHI    |   4 | DELHI
   2 | MUMBAI   |   2 | MUMBAI
   2 | MUMBAI   |   5 | MUMBAI
   5 | MUMBAI   |   2 | MUMBAI
   5 | MUMBAI   |   5 | MUMBAI
   1 | PUNE     |   1 | PUNE
(7 rows)


mydb=#
mydb=# SELECT * FROM ATAB AS T1 INNER JOIN ATAB AS T2 ON T1.city = T2.city ORDER BY T1.city;
 ano |   city   | ano |   city
-----+----------+-----+----------
   3 | BANGLORE |   3 | BANGLORE
   4 | DELHI    |   4 | DELHI
   2 | MUMBAI   |   2 | MUMBAI
   2 | MUMBAI   |   5 | MUMBAI
   5 | MUMBAI   |   2 | MUMBAI
   5 | MUMBAI   |   5 | MUMBAI
   1 | PUNE     |   1 | PUNE
(7 rows)




























mydb=# SELECT * FROM ATAB;
 ano |   city
-----+----------
   1 | PUNE
   2 | MUMBAI
   3 | BANGLORE
   4 | DELHI
   5 | MUMBAI
(5 rows)


mydb=# SELECT * FROM BTAB;
 bno |  city
-----+---------
 101 | MUMBAI
 102 | PUNE
 103 | SATARA
 104 | SOLAPUR
 105 | MUMBAI
(5 rows)


mydb=# SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB INNER JOIN BTAB ON ATAB.city = BTAB.city;
 ano |  city  | bno |  city
-----+--------+-----+--------
   2 | MUMBAI | 101 | MUMBAI
   2 | MUMBAI | 105 | MUMBAI
   5 | MUMBAI | 101 | MUMBAI
   5 | MUMBAI | 105 | MUMBAI
   1 | PUNE   | 102 | PUNE
(5 rows)


mydb=#
mydb=# SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB, BTAB WHERE ATAB.city = BTAB.city;
 ano |  city  | bno |  city
-----+--------+-----+--------
   2 | MUMBAI | 101 | MUMBAI
   2 | MUMBAI | 105 | MUMBAI
   5 | MUMBAI | 101 | MUMBAI
   5 | MUMBAI | 105 | MUMBAI
   1 | PUNE   | 102 | PUNE
(5 rows)


mydb=#
mydb=# SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB NATURAL JOIN BTAB;
 ano |  city  | bno |  city
-----+--------+-----+--------
   2 | MUMBAI | 101 | MUMBAI
   2 | MUMBAI | 105 | MUMBAI
   5 | MUMBAI | 101 | MUMBAI
   5 | MUMBAI | 105 | MUMBAI
   1 | PUNE   | 102 | PUNE
(5 rows)


mydb=# SELECT * FROM ATAB, BTAB;
 ano |   city   | bno |  city
-----+----------+-----+---------
   1 | PUNE     | 101 | MUMBAI
   1 | PUNE     | 102 | PUNE
   1 | PUNE     | 103 | SATARA
   1 | PUNE     | 104 | SOLAPUR
   1 | PUNE     | 105 | MUMBAI
   2 | MUMBAI   | 101 | MUMBAI
   2 | MUMBAI   | 102 | PUNE
   2 | MUMBAI   | 103 | SATARA
   2 | MUMBAI   | 104 | SOLAPUR
   2 | MUMBAI   | 105 | MUMBAI
   3 | BANGLORE | 101 | MUMBAI
   3 | BANGLORE | 102 | PUNE
   3 | BANGLORE | 103 | SATARA
   3 | BANGLORE | 104 | SOLAPUR
   3 | BANGLORE | 105 | MUMBAI
   4 | DELHI    | 101 | MUMBAI
   4 | DELHI    | 102 | PUNE
   4 | DELHI    | 103 | SATARA
   4 | DELHI    | 104 | SOLAPUR
   4 | DELHI    | 105 | MUMBAI
   5 | MUMBAI   | 101 | MUMBAI
   5 | MUMBAI   | 102 | PUNE
   5 | MUMBAI   | 103 | SATARA
   5 | MUMBAI   | 104 | SOLAPUR
   5 | MUMBAI   | 105 | MUMBAI
(25 rows)


mydb=# SELECT * FROM ATAB, BTAB WHERE ATAB.city = BTAB.city;
 ano |  city  | bno |  city
-----+--------+-----+--------
   2 | MUMBAI | 101 | MUMBAI
   2 | MUMBAI | 105 | MUMBAI
   5 | MUMBAI | 101 | MUMBAI
   5 | MUMBAI | 105 | MUMBAI
   1 | PUNE   | 102 | PUNE
(5 rows)


mydb=# SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB CROSS JOIN BTAB;
 ano |   city   | bno |  city
-----+----------+-----+---------
   1 | PUNE     | 101 | MUMBAI
   1 | PUNE     | 102 | PUNE
   1 | PUNE     | 103 | SATARA
   1 | PUNE     | 104 | SOLAPUR
   1 | PUNE     | 105 | MUMBAI
   2 | MUMBAI   | 101 | MUMBAI
   2 | MUMBAI   | 102 | PUNE
   2 | MUMBAI   | 103 | SATARA
   2 | MUMBAI   | 104 | SOLAPUR
   2 | MUMBAI   | 105 | MUMBAI
   3 | BANGLORE | 101 | MUMBAI
   3 | BANGLORE | 102 | PUNE
   3 | BANGLORE | 103 | SATARA
   3 | BANGLORE | 104 | SOLAPUR
   3 | BANGLORE | 105 | MUMBAI
   4 | DELHI    | 101 | MUMBAI
   4 | DELHI    | 102 | PUNE
   4 | DELHI    | 103 | SATARA
   4 | DELHI    | 104 | SOLAPUR
   4 | DELHI    | 105 | MUMBAI
   5 | MUMBAI   | 101 | MUMBAI
   5 | MUMBAI   | 102 | PUNE
   5 | MUMBAI   | 103 | SATARA
   5 | MUMBAI   | 104 | SOLAPUR
   5 | MUMBAI   | 105 | MUMBAI
(25 rows)


mydb=# SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB NATURAL JOIN BTAB;
 ano |  city  | bno |  city
-----+--------+-----+--------
   2 | MUMBAI | 101 | MUMBAI
   2 | MUMBAI | 105 | MUMBAI
   5 | MUMBAI | 101 | MUMBAI
   5 | MUMBAI | 105 | MUMBAI
   1 | PUNE   | 102 | PUNE
(5 rows)


mydb=# SELECT * FROM ATAB NATURAL JOIN BTAB;
  city  | ano | bno
--------+-----+-----
 MUMBAI |   2 | 101
 MUMBAI |   2 | 105
 MUMBAI |   5 | 101
 MUMBAI |   5 | 105
 PUNE   |   1 | 102
(5 rows)


mydb=# SELECT * FROM ATAB SELF JOIN ATAB;
ERROR:  syntax error at or near ";"
LINE 1: SELECT * FROM ATAB SELF JOIN ATAB;
                                         ^
mydb=# SELECT * FOM ATAB AS T1 INNER JOIN ATAB AS T2 ON T1.city = T2.city;
ERROR:  syntax error at or near "FOM"
LINE 1: SELECT * FOM ATAB AS T1 INNER JOIN ATAB AS T2 ON T1.city = T...
                 ^
mydb=# SELECT * FROM ATAB AS T1 INNER JOIN ATAB AS T2 ON T1.city = T2.city;
 ano |   city   | ano |   city
-----+----------+-----+----------
   3 | BANGLORE |   3 | BANGLORE
   4 | DELHI    |   4 | DELHI
   2 | MUMBAI   |   2 | MUMBAI
   2 | MUMBAI   |   5 | MUMBAI
   5 | MUMBAI   |   2 | MUMBAI
   5 | MUMBAI   |   5 | MUMBAI
   1 | PUNE     |   1 | PUNE
(7 rows)


mydb=# SELECT * FROM ATAB AS T1 INNER JOIN ATAB AS T2 ON T1.city = T2.city ORDER BY T1.city;
 ano |   city   | ano |   city
-----+----------+-----+----------
   3 | BANGLORE |   3 | BANGLORE
   4 | DELHI    |   4 | DELHI
   2 | MUMBAI   |   2 | MUMBAI
   2 | MUMBAI   |   5 | MUMBAI
   5 | MUMBAI   |   2 | MUMBAI
   5 | MUMBAI   |   5 | MUMBAI
   1 | PUNE     |   1 | PUNE
(7 rows)


mydb=#


CREATE TABLE Student(rno int primary key NOT NULL, name varchar(30), phno varchar(10), per float);