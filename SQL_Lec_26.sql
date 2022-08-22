

--JOIN

CREATE TABLE ATAB(ano int primary key, city varchar(10));
INSERT INTO ATAB VALUES(1, 'PUNE');
INSERT INTO ATAB VALUES(2, 'MUMBAI');
INSERT INTO ATAB VALUES(3, 'BANGLORE');
INSERT INTO ATAB VALUES(4, 'DELHI');



CREATE TABLE BTAB(bno int primary key, city varchar(10));
INSERT INTO BTAB VALUES(101, 'MUMBAI');
INSERT INTO BTAB VALUES(102, 'PUNE');
INSERT INTO BTAB VALUES(103, 'SATARA');
INSERT INTO BTAB VALUES(104, 'SOLAPUR');


INNER JOIN:
SQL 1:
 	SELECT * FROM ATAB, BTAB WHERE ATAB.city = BTAB.city;
SQL 2:
 	SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB INNER JOIN BTAB ON ATAB.city = BTAB.city;

 	The inner join examine each ow in the first table(ATAB). It compares the value in city column of ATAB with city column of BTAB. 
 	If the values are equal then join ceates a new row that contains from both tables and adds this new row in result set.



mydb=# CREATE TABLE ATAB(ano int primary key, city varchar(10));
CREATE TABLE
mydb=# INSERT INTO ATAB VALUES(1, 'PUNE');
INSERT 0 1
mydb=# INSERT INTO ATAB VALUES(2, 'MUMBAI');
INSERT 0 1
mydb=# INSERT INTO ATAB VALUES(3, 'BANGLORE');
INSERT 0 1
mydb=# INSERT INTO ATAB VALUES(4, 'DELHI');
INSERT 0 1
mydb=#
mydb=#
mydb=# CREATE TABLE BTAB(bno int primary key, city varchar(10));
CREATE TABLE           ^
mydb=#
mydb=#
mydb=# INSERT INTO BTAB VALUES(101, 'MUMBAI');
INSERT 0 1
mydb=# INSERT INTO BTAB VALUES(102, 'PUNE');
INSERT 0 1
mydb=# INSERT INTO BTAB VALUES(103, 'SATARA');
INSERT 0 1
mydb=# INSERT INTO BTAB VALUES(104, 'SOLAPUR');
INSERT 0 1
mydb=#
mydb=#
mydb=# SELECT * FROM ATAB, BTAB WHERE ATAB.city = BTAB.city;
 ano |  city  | bno |  city
-----+--------+-----+--------
   2 | MUMBAI | 101 | MUMBAI
   1 | PUNE   | 102 | PUNE
(2 rows)


mydb=# INSERT INTO BTAB VALUES(105, 'MUMBAI');
INSERT 0 1
mydb=# SELECT * FROM ATAB, BTAB WHERE ATAB.city = BTAB.city;
 ano |  city  | bno |  city
-----+--------+-----+--------
   2 | MUMBAI | 101 | MUMBAI
   2 | MUMBAI | 105 | MUMBAI
   1 | PUNE   | 102 | PUNE
(3 rows)


mydb=# SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB INNER JOIN BTAB;
ERROR:  syntax error at or near ";"
LINE 1: ...CT ano, ATAB.city, bno, BTAB.city FROM ATAB INNER JOIN BTAB;
                                                                      ^
mydb=# SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB INNER JOIN BTAB ON AT
AB.city = BTAB.city;
 ano |  city  | bno |  city
-----+--------+-----+--------
   2 | MUMBAI | 101 | MUMBAI
   2 | MUMBAI | 105 | MUMBAI
   1 | PUNE   | 102 | PUNE
(3 rows)


mydb=# SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB INNER JOIN BTAB ON ATAB.ano = BTAB.bno;
 ano | city | bno | city
-----+------+-----+------
(0 rows)


mydb=# SELECT ano, bno FROM ATAB INNER JOIN BTAB ON ATAB.city = BTAB.city;
 ano | bno
-----+-----
   2 | 101
   2 | 105
   1 | 102
(3 rows)


mydb=# INSERT INTO ATAB VALUES(5, 'MUMBAI');
INSERT 0 1
mydb=# SELECT ano, ATAB.city, bno, BTAB.city FROM ATAB INNER JOIN BTAB ON ATAB.city = BTAB.city;
 ano |  city  | bno |  city
-----+--------+-----+--------
   2 | MUMBAI | 101 | MUMBAI
   2 | MUMBAI | 105 | MUMBAI
   5 | MUMBAI | 101 | MUMBAI
   5 | MUMBAI | 105 | MUMBAI
   1 | PUNE   | 102 | PUNE
(5 rows)


mydb=# (SELECT city FROM ATAB) UNION (SELECT city FROM BTAB);
   city
----------
 DELHI
 SATARA
 MUMBAI
 SOLAPUR
 BANGLORE
 PUNE
(6 rows)


mydb=#