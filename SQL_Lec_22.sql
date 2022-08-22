--EXTRACT


CREATE TABLE Customer(cid int primary key, cname varchar(30), caddress varchar(50), city varchar(30), state varchar(30));

INSERT INTO Customer VALUES(1, 'AAA', 'Sangvi', 'PUNE', 'Maharashtra');
INSERT INTO Customer VALUES(2, 'BBB', 'Aundh', 'Banglore', 'Karnataka');
INSERT INTO Customer VALUES(3, 'CCC', 'Nigdi', 'Kochi', 'Kerala');
INSERT INTO Customer VALUES(4, 'DDD', 'Bandra', 'Mumbai', 'Maharashtra');

CREATE TABLE corder(oid int primary key, odate DATE, oamount float, cid int REFERENCES Customer(cid) ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO corder VALUES(101, '2022-01-05', 543, 2);
INSERT INTO corder VALUES(102, '2022-03-05', 700, 4);
INSERT INTO corder VALUES(103, '2022-01-15', 400, 1);
INSERT INTO corder VALUES(104, '2022-03-20', 120, 2);


--Q.1 List name of customer who belong to maharashtra sate, sorted on city.
--Ans: 

SELECT cname from Customer WHERE state = 'Maharashtra' Order by city;


mydb=# SELECT cname from Customer WHERE state = 'Maharashtra' Order by city;

 cname
-------
 DDD
 AAA
(2 rows)

--Q.2 What are the name of all customer who placed orders between '2022-01-01' to '2022-01-31'.
--Ans: 

SELECT cname FROM Customer, corder WHERE Customer.cid = corder.cid AND odate BETWEEN '2022-01-01' AND '2022-01-31';

mydb=# SELECT cname FROM Customer, corder WHERE Customer.cid = corder.cid AND odate BETWEEN '2022-01-01' AND '2022-01-31';
 cname
-------
 AAA
 BBB
(2 rows)

--Q.3 List name of the customers who gave oredres in the month of march.
--Ans: 

SELECT cname FROM Customer, corder WHERE Customer.cid = corder.cid AND EXTRACT(MONTH from odate) = 3;

mydb=# SELECT cname FROM Customer, corder WHERE Customer.cid = corder.cid AND EXTRACT(MONTH from odate) = 3;
 cname
-------
 BBB
 DDD
(2 rows)


--Q.4 How many income in the month march?
--Ans:

SELECT sum(oamount) from corder WHERE EXTRACT(MONTH FROM odate) = 3; 

mydb=# SELECT sum(oamount) from corder WHERE EXTRACT(MONTH FROM odate) = 3; 
 sum
-----
 820
(1 row)


--Q.5 How much income in the year 2022?
--Ans: 

SELECT sum(oamount) from corder WHERE EXTRACT(YEAR FROM odate) = 2022;

mydb=# SELECT sum(oamount) from corder WHERE EXTRACT(YEAR FROM odate) = 2022;
 sum
------
 1763
(1 row)


--Q.6 How much of amount ordred by customer "BBB"?
--Ans : 
 
 SELECT sum(oamount) FROM Customer, corder WHERE Customer.cid = corder.cid AND cname = 'BBB';


mydb=# \dt
          List of relations
 Schema |   Name   | Type  |  Owner
--------+----------+-------+----------
 public | bride    | table | postgres
 public | customer | table | postgres
 public | groom    | table | postgres
 public | student  | table | postgres
 public | teacher  | table | postgres
(5 rows)


mydb=# SELECT * FROM groom;
 gno | name
-----+------
   1 | AAA
   2 | BBB
   3 | CCC
   4 | DDD
(4 rows)


mydb=# SELECT * FROM bride;
 bno | name | gno |   mdate
-----+------+-----+------------
 101 | PPP  |   3 | 2017-01-27
 102 | QQQ  |   1 | 2017-01-05
 103 | RRR  |   4 | 2017-01-10
 104 | SSS  |   2 | 2017-01-15
(4 rows)


mydb=# SELECT EXRACT(MONTH from mdate) FROM bride;
ERROR:  syntax error at or near "from"
LINE 1: SELECT EXRACT(MONTH from mdate) FROM bride;
                            ^
mydb=# SELECT EXTRACT(MONTH from mdate) FROM bride;
 extract
---------
       1
       1
       1
       1
(4 rows)


mydb=# SELECT EXTRACT(MONTH from mdate) AS Month FROM bride;
 month
-------
     1
     1
     1
     1
(4 rows)


mydb=# DROP TABLE bride;
DROP TABLE
mydb=# \dt
          List of relations
 Schema |   Name   | Type  |  Owner
--------+----------+-------+----------
 public | customer | table | postgres
 public | groom    | table | postgres
 public | student  | table | postgres
 public | teacher  | table | postgres
(4 rows)


mydb=# CREATE TABLE bride(bno int primary key, name varchar(10), gno int REFERENCES groom(gno) ON DELETE CASCADE ON UPDATE CASCADE UNIQUE, mdate DATE);
CREATE TABLE
mydb=#
mydb=#
mydb=# INSERT INTO bride VALUES(101, 'PPP', 3, '2017-01-27');
INSERT 0 1
mydb=# INSERT INTO bride VALUES(102, 'QQQ', 1, '2020-06-05');
INSERT 0 1
mydb=# INSERT INTO bride VALUES(103, 'RRR', 4, '2020-08-10');
INSERT 0 1
mydb=# INSERT INTO bride VALUES(104, 'SSS', 2, '2020-05-15');
INSERT 0 1
mydb=#
mydb=# SELECT * FROM bride;
 bno | name | gno |   mdate
-----+------+-----+------------
 101 | PPP  |   3 | 2017-01-27
 102 | QQQ  |   1 | 2020-06-05
 103 | RRR  |   4 | 2020-08-10
 104 | SSS  |   2 | 2020-05-15
(4 rows)


mydb=# SELECT EXTRACT(MONTH from mdate) AS Month FROM bride;
 month
-------
     1
     6
     8
     5
(4 rows)


mydb=# SELECT EXTRACT(DAY from mdate) AS DAY FROM bride;ide;
 day
-----
  27
   5
  10
  15
(4 rows)


ERROR:  syntax error at or near "ide"
LINE 1: ide;
        ^
mydb=# SELECT EXTRACT(DAY from mdate) AS DAY FROM bride;
 day
-----
  27
   5
  10
  15
(4 rows)


mydb=# SELECT EXTRACT(YEAR from mdate) AS YEAR FROM bride;
 year
------
 2017
 2020
 2020
 2020
(4 rows)


mydb=# SELECT count(*) FROM bride;
 count
-------
     4
(1 row)


mydb=# SELECT count(*) FROM bride WHERE EXTRACT(YEAR FROM mdate) = 2020;
 count
-------
     3
(1 row)


mydb=# SELECT count(*) FROM bride WHERE EXTRACT(MONTH FROM mdate) = 6;
 count
-------
     1
(1 row)


mydb=# \dt
          List of relations
 Schema |   Name   | Type  |  Owner
--------+----------+-------+----------
 public | bride    | table | postgres
 public | customer | table | postgres
 public | groom    | table | postgres
 public | student  | table | postgres
 public | teacher  | table | postgres
(5 rows)


mydb=# SELECT * FROM customer;
 cno |        cname        |   caddress
-----+---------------------+--------------
 101 | Rushikesh Shinde    | Ane
 103 | Abhishek Suvarnakar | Chikhali
 102 | Dnyaneshwari        | Rajgurunagar
 104 | Abhishek            | Gadge
 105 | Sachin              | Pune
(5 rows)


mydb=# drop table customer;
DROP TABLE
mydb=# \dt
          List of relations
 Schema |  Name   | Type  |  Owner
--------+---------+-------+----------
 public | bride   | table | postgres
 public | groom   | table | postgres
 public | student | table | postgres
 public | teacher | table | postgres
(4 rows)


mydb=# CREATE TABLE Customer(cid int primary key, cname varchar(30), caddress varchar(50), city varchar(30), state varchar(30));
CREATE TABLE
mydb=#
mydb=#
mydb=#
mydb=# CREATE TABLE Order(oid int primary key, odate DATE, oamount float, cid int REFERENCES Customer(cid) ON DELETE CASCADE ON UPDATE CASCADE);
ERROR:  syntax error at or near "Order"
LINE 1: CREATE TABLE Order(oid int primary key, odate DATE, oamount ...
                     ^
                ^
mydb=# CREATE TABLE corder(oid int primary key, odate DATE, oamount float, cid int REFERENCES Customer(cid) ON DELETE CASCADE ON UPDATE CASCADE);
CREATE TABLE
mydb=#
mydb=#
mydb=# SELECT * from customer;
 cid | cname | caddress | city | state
-----+-------+----------+------+-------
(0 rows)


mydb=# SELECT * FROM corder;
 oid | odate | oamount | cid
-----+-------+---------+-----
(0 rows)


mydb=# INSERT INTO Customer VALUES(1, 'AAA', 'Sangvi', 'PUNE', 'Maharashtra');
INSERT 0 1
mydb=# INSERT INTO Customer VALUES(2, 'BBB', 'Aundh', 'Banglore', 'Karnataka');
INSERT 0 1
mydb=# INSERT INTO Customer VALUES(3, 'CCC', 'Nigdi', 'Kochi', 'Kerala');
INSERT 0 1
mydb=# INSERT INTO Customer VALUES(4, 'DDD', 'Bandra', 'Mumbai', 'Maharashtra');
INSERT 0 1
mydb=#
mydb=#
mydb=#
mydb=#
mydb=# INSERT INTO corder VALUES(101, '2022-01-05', 543, 2);
INSERT 0 1
mydb=# INSERT INTO corder VALUES(102, '2022-03-05', 700, 4);
INSERT 0 1
mydb=# INSERT INTO corder VALUES(103, '2022-01-15', 400, 1);
INSERT 0 1
mydb=# INSERT INTO corder VALUES(104, '2022-03-20', 120, 2);
INSERT 0 1
mydb=#
mydb=#
mydb=#
mydb=# SELECT * FROM Customer;
 cid | cname | caddress |   city   |    state
-----+-------+----------+----------+-------------
   1 | AAA   | Sangvi   | PUNE     | Maharashtra
   2 | BBB   | Aundh    | Banglore | Karnataka
   3 | CCC   | Nigdi    | Kochi    | Kerala
   4 | DDD   | Bandra   | Mumbai   | Maharashtra
(4 rows)


mydb=# SELECT * FROM corder;
 oid |   odate    | oamount | cid
-----+------------+---------+-----
 101 | 2022-01-05 |     543 |   2
 102 | 2022-03-05 |     700 |   4
 103 | 2022-01-15 |     400 |   1
 104 | 2022-03-20 |     120 |   2
(4 rows)


mydb=# SELECT cname from Customer WHERE state = 'Maharashtra' Order by city;

 cname
-------
 DDD
 AAA
(2 rows)


mydb=# SELECT cname from Customer WHERE state = 'Maharashtra' Order by state;
 cname
-------
 AAA
 DDD
(2 rows)


mydb=# SELECT cname FROM Customer, corder WHERE Customer.cid = corder.cid AND odate BETWEEN '2022-01-01' AND '2022-01-31';
 cname
-------
 AAA
 BBB
(2 rows)


mydb=# SELECT cname FROM Customer, corder WHERE Customer.cid = corder.cid AND EXTRACT(MONTH from odate) = 3;
 cname
-------
 BBB
 DDD
(2 rows)


mydb=# SELECT * FROM Customer;
 cid | cname | caddress |   city   |    state
-----+-------+----------+----------+-------------
   1 | AAA   | Sangvi   | PUNE     | Maharashtra
   2 | BBB   | Aundh    | Banglore | Karnataka
   3 | CCC   | Nigdi    | Kochi    | Kerala
   4 | DDD   | Bandra   | Mumbai   | Maharashtra
(4 rows)


mydb=# SELECT * FROM corder;
 oid |   odate    | oamount | cid
-----+------------+---------+-----
 101 | 2022-01-05 |     543 |   2
 102 | 2022-03-05 |     700 |   4
 103 | 2022-01-15 |     400 |   1
 104 | 2022-03-20 |     120 |   2
(4 rows)


mydb=# SELECT sum(oamount) from corder;
 sum
------
 1763
(1 row)


mydb=# SELECT sum(oamount) from corder WHERE EXTRACT(MONTH FROM odate) = 3; 
 sum
-----
 820
(1 row)


mydb=# SELECT sum(oamount) from corder WHERE EXTRACT(YEAR FROM odate) = 2022;
 sum
------
 1763
(1 row)


                ^
HINT:  Perhaps you meant to reference the column "corder.oamount".
mydb=# SELECT sum(oamont) FROM Customer, corder WHERE Customer.cid = corder.cid AND cname = 'BBB';
ERROR:  column "oamont" does not exist
LINE 1: SELECT sum(oamont) FROM Customer, corder WHERE Customer.cid ...
                   ^
HINT:  Perhaps you meant to reference the column "corder.oamount".
mydb=#
mydb=#
mydb=#
mydb=# SELECT sum(oamount) FROM Customer, corder WHERE Customer.cid = corder.cid AND cname = 'BBB';
 sum
-----
 663
(1 row)


mydb=#


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--Assignment Quetion:
--Company(cid, cproduct, cname, region, state)
--dealer(dno, dname, daddress, dcity)
--CD(cid, dno)

--Company & dealer are related with many to amny relationship.

--Create a Relational Database for the above and convert it in 3 NF & solve the following queries-

--Q.1 List dealer of Company "HP"

--Q.2 Count no. of Dealer from city 'Pune'
 
--Q.3 Delete Record of dealer whose dealership by 'HP'

DELETE FROM Dealer WHERE dno IN(SELECT dno FROM company, dealer, CD WHERE Company.cid = CD.cid AND Dealer.dno = CD.dno AND cname = 'HP');