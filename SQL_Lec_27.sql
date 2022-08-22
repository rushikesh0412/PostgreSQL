--LEFT JOIN - RIGHT JOIN - FULL OUTER JOIN



--LEFT JOIN

CREATE TABLE ATAB(ano int primary key, city varchar(10));
INSERT INTO ATAB VALUES(1, 'PUNE');
INSERT INTO ATAB VALUES(2, 'MUMBAI');
INSERT INTO ATAB VALUES(3, 'BANGLORE');
INSERT INTO ATAB VALUES(4, 'DELHI');
INSERT INTO ATAB VALUES(5, 'MUMBAI');



CREATE TABLE BTAB(bno int primary key, city varchar(10));
INSERT INTO BTAB VALUES(101, 'MUMBAI');
INSERT INTO BTAB VALUES(102, 'PUNE');
INSERT INTO BTAB VALUES(103, 'SATARA');
INSERT INTO BTAB VALUES(104, 'SOLAPUR');
INSERT INTO BTAB VALUES(105, 'MUMBAI');


----------------------------------------------------------------------------------------------------------

LEFT JOIN: 
	SELECT * FROM ATAB LEFT JOIN BTAB ON ATAB.city = BTAB.city;


	SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB LEFT JOIN BTAB ON ATAB.city = BTAB.city;


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


mydb=# SELECT * FROM ATAB LEFT JOIN BTAB ON ATAB.city = BTAB.city;
 ano |   city   | bno |  city
-----+----------+-----+--------
   3 | BANGLORE |     |
   4 | DELHI    |     |
   2 | MUMBAI   | 101 | MUMBAI
   2 | MUMBAI   | 105 | MUMBAI
   5 | MUMBAI   | 101 | MUMBAI
   5 | MUMBAI   | 105 | MUMBAI
   1 | PUNE     | 102 | PUNE
(7 rows)


mydb=# SELECT * FROM ATAB LEFT JOIN BTAB ON BTAB.city = ATAB.city;
 ano |   city   | bno |  city
-----+----------+-----+--------
   3 | BANGLORE |     |
   4 | DELHI    |     |
   2 | MUMBAI   | 101 | MUMBAI
   2 | MUMBAI   | 105 | MUMBAI
   5 | MUMBAI   | 101 | MUMBAI
   5 | MUMBAI   | 105 | MUMBAI
   1 | PUNE     | 102 | PUNE
(7 rows)


mydb=# SELECT * FROM BTAB LEFT JOIN ATAB ON ATAB.city = BTAB.city;
 bno |  city   | ano |  city
-----+---------+-----+--------
 101 | MUMBAI  |   2 | MUMBAI
 101 | MUMBAI  |   5 | MUMBAI
 105 | MUMBAI  |   2 | MUMBAI
 105 | MUMBAI  |   5 | MUMBAI
 102 | PUNE    |   1 | PUNE
 103 | SATARA  |     |
 104 | SOLAPUR |     |
(7 rows)


mydb=# SELECT * FROM ATAB LEFT JOIN BTAB ON ATAB.city = BTAB.city WHERE bno IS NULL;
 ano |   city   | bno | city
-----+----------+-----+------
   3 | BANGLORE |     |
   4 | DELHI    |     |
(2 rows)


mydb=# SELECT * FROM ATAB LEFT JOIN BTAB ON ATAB.city = BTAB.city WHERE bno IS NOT NULL;
 ano |  city  | bno |  city
-----+--------+-----+--------
   2 | MUMBAI | 101 | MUMBAI
   5 | MUMBAI | 101 | MUMBAI
   2 | MUMBAI | 105 | MUMBAI
   5 | MUMBAI | 105 | MUMBAI
   1 | PUNE   | 102 | PUNE
(5 rows)


mydb=#

---------------------------------------------------------------------------------------------------------------

RIGHT JOIN


	SELECT * FROM ATAB RIGHT JOIN BTAB ON ATAB.city = BTAB.city;


	SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB RIGHT JOIN BTAB ON ATAB.city = BTAB.city;


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


mydb=# SELECT * FROM ATAB RIGHT JOIN BTAB ON ATAB.city = BTAB.city;
 ano |  city  | bno |  city
-----+--------+-----+---------
   2 | MUMBAI | 101 | MUMBAI
   5 | MUMBAI | 101 | MUMBAI
   2 | MUMBAI | 105 | MUMBAI
   5 | MUMBAI | 105 | MUMBAI
   1 | PUNE   | 102 | PUNE
     |        | 103 | SATARA
     |        | 104 | SOLAPUR
(7 rows)


mydb=# SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB RIGHT JOIN BTAB ON ATAB.city = BTAB.city;
 ano |  city  | bno |  city
-----+--------+-----+---------
   2 | MUMBAI | 101 | MUMBAI
   5 | MUMBAI | 101 | MUMBAI
   2 | MUMBAI | 105 | MUMBAI
   5 | MUMBAI | 105 | MUMBAI
   1 | PUNE   | 102 | PUNE
     |        | 103 | SATARA
     |        | 104 | SOLAPUR
(7 rows)


mydb=# SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB RIGHT JOIN BTAB ON ATAB.city = BTAB.city WHERE ano IS NULL;
 ano | city | bno |  city
-----+------+-----+---------
     |      | 103 | SATARA
     |      | 104 | SOLAPUR
(2 rows)


mydb=# SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB RIGHT JOIN BTAB ON ATAB.city = BTAB.city WHERE ano IS NOT NULL;
 ano |  city  | bno |  city
-----+--------+-----+--------
   2 | MUMBAI | 101 | MUMBAI
   2 | MUMBAI | 105 | MUMBAI
   5 | MUMBAI | 101 | MUMBAI
   5 | MUMBAI | 105 | MUMBAI
   1 | PUNE   | 102 | PUNE
(5 rows)


mydb=#

------------------------------------------------------------------------------------------------------------------

--FULL OUTER JOIN

mydb=# SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB FULL OUTER JOIN BTAB ON ATAB.city = BTAB.city;
 ano |   city   | bno |  city
-----+----------+-----+---------
   3 | BANGLORE |     |
   4 | DELHI    |     |
   2 | MUMBAI   | 101 | MUMBAI
   2 | MUMBAI   | 105 | MUMBAI
   5 | MUMBAI   | 101 | MUMBAI
   5 | MUMBAI   | 105 | MUMBAI
   1 | PUNE     | 102 | PUNE
     |          | 103 | SATARA
     |          | 104 | SOLAPUR
(9 rows)



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



mydb=# SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB FULL JOIN BTAB ON ATAB.city = BTAB.city;
 ano |   city   | bno |  city
-----+----------+-----+---------
   3 | BANGLORE |     |
   4 | DELHI    |     |
   2 | MUMBAI   | 101 | MUMBAI
   2 | MUMBAI   | 105 | MUMBAI
   5 | MUMBAI   | 101 | MUMBAI
   5 | MUMBAI   | 105 | MUMBAI
   1 | PUNE     | 102 | PUNE
     |          | 103 | SATARA
     |          | 104 | SOLAPUR
(9 rows)


mydb=# SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB FULL JOIN BTAB ON ATAB.city = BTAB.city WHERE ano IS NULL AND bno IS NULL;
 ano | city | bno | city
-----+------+-----+------
(0 rows)


mydb=# SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB FULL JOIN BTAB ON ATAB.city = BTAB.city WHERE ano IS NULL OR bno IS NULL;
 ano |   city   | bno |  city
-----+----------+-----+---------
   3 | BANGLORE |     |
   4 | DELHI    |     |
     |          | 103 | SATARA
     |          | 104 | SOLAPUR
(4 rows)


