

-- 1-1 Relationship

CREATE TABLE groom(gno int primary key, name varchar(30));

INSERT INTO groom VALUES(1,'AAA');
INSERT INTO groom VALUES(2,'BBB');
INSERT INTO groom VALUES(3,'CCC');
INSERT INTO groom VALUES(4,'DDD');


CREATE TABLE bride(bno int primary key, name varchar(10), gno int REFERENCES groom(gno) ON DELETE CASCADE ON UPDATE CASCADE UNIQUE, mdate DATE);


INSERT INTO bride VALUES(101, 'PPP', 3, '2017-01-27');
INSERT INTO bride VALUES(102, 'QQQ', 1, '2020-06-05');
INSERT INTO bride VALUES(103, 'RRR', 4, '2020-08-10');
INSERT INTO bride VALUES(104, 'SSS', 2, '2020-05-15');



SELECT groom.name AS groom_name, bride.name AS bride_name FROM groom, bride WHERE groom.gno = bride.gno;



SELECT groom.name AS groom_name, bride.name AS bride_name FROM groom, bride WHERE groom.gno = bride.gno AND mdate BETWEEN '2017-01-23' AND '2017-01-30';



--Q. Hiw many marraige happen during covid.
-------------------------------------------------------------------
 SELECT count(*) FROM bride WHERE mdate BETWEEN '2017-01-23' AND '2017-01-30';



mydb=# \dt
          List of relations
 Schema |   Name   | Type  |  Owner
--------+----------+-------+----------
 public | customer | table | postgres
 public | student  | table | postgres
 public | teacher  | table | postgres
(3 rows)


mydb=# CREATE TABLE groom(gno int primary key, name varchar(30));
CREATE TABLE
mydb=#
mydb=#
mydb=#
mydb=# CREATE TABLE bride(bno int primary key, name varchar(10), gno int REFERENCES groom(gno) ON DELETE CASCADE ON UPDATE CASCADE UNIQUE, mdate DATE);
CREATE TABLE
mydb=#
mydb=#
mydb=# INSERT INTO groom VALUES(1,'AAA');
INSERT 0 1
mydb=# INSERT INTO groom VALUES(2,'BBB');
INSERT 0 1
mydb=# INSERT INTO groom VALUES(3,'CCC');
INSERT 0 1
mydb=# INSERT INTO groom VALUES(4,'DDD');
INSERT 0 1
mydb=#
mydb=#
mydb=#
mydb=# INSERT INTO bride VALUES(101, 'PPP', 3, '2017-01-27');
INSERT 0 1
mydb=# INSERT INTO bride VALUES(102, 'QQQ', 1, '2017-01-05');
INSERT 0 1
mydb=# INSERT INTO bride VALUES(103, 'RRR', 4, '2017-01-10');
INSERT 0 1
mydb=# INSERT INTO bride VALUES(104, 'SSS', 2, '2017-01-15');
INSERT 0 1
mydb=#
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


mydb=# INSERT INTO bride VALUES(105, 'TTT', 3, '2022-05-27');
ERROR:  duplicate key value violates unique constraint "bride_gno_key"
DETAIL:  Key (gno)=(3) already exists.
mydb=#
mydb=#
mydb=# SELECT groom.name, bride.name FROM groom, bride WHERE groom.gno = bride.gno;
 name | name
------+------
 CCC  | PPP
 AAA  | QQQ
 DDD  | RRR
 BBB  | SSS
(4 rows)


mydb=# SELECT groom.name AS groom_name, bride.name AS bride_name FROM groom, bride WHERE groom.gno = bride.gno;
 groom_name | bride_name
------------+------------
 CCC        | PPP
 AAA        | QQQ
 DDD        | RRR
 BBB        | SSS
(4 rows)


mydb=# SELECT groom.name AS groom_name, bride.name AS bride_name FROM groom, bride WHERE groom.gno = bride.gno AND mdate BETWEEN '2017-01-23' AND '2017-01-30';
 groom_name | bride_name
------------+------------
 CCC        | PPP
(1 row)


mydb=# SELECT count(*) FROM groom, bride WHERE groom.gno = bride.gno AND mdate BETWEEN '2017-01-23' AND '2017-01-30';
 count
-------
     1
(1 row)


mydb=# SELECT count(*) FROM bride WHERE mdate BETWEEN '2017-01-23' AND '2017-01-30';
 count
-------
     1
(1 row)


mydb=#


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 Country(con_code, Nname, Capital)
 Population(pop_code, population_count)

 Country & Population are related one to one relationship.
 Create RDB & solve the following Quries.

 1. List heighest population country
 2. Give name & Population of country whose capital is Delhi.
 3. List name of all country whose population is greater than 50,00,000.