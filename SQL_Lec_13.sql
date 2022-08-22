CREATE TABLE Person(rno int primary key, Name  varchar(20) NOT NULL, Per float , City varchar(20));

INSERT INTO Person VALUES(101, 'AAA', 56, 'PUNE');
INSERT INTO Person VALUES(102, 'BBB', 89, 'Mumbai');
INSERT INTO Person VALUES(103, 'CCC', 78, 'Nagar');
INSERT INTO Person VALUES(104, 'AAA', 46, 'Banglore');
INSERT INTO Person VALUES(105, 'DDD', 64, 'Punjab');
INSERT INTO Person VALUES(106, 'CCC', 70, 'Mumbai');
INSERT INTO Person VALUES(107, 'EEE', 84, 'PUNE');
INSERT INTO Person VALUES(108, 'FFF', 98, 'Mumbai');



mydb=# Select * from Person;
 rno | name | per |   city
-----+------+-----+----------
 101 | AAA  |  56 | PUNE
 102 | BBB  |  89 | Mumbai
 103 | CCC  |  78 | Nagar
 104 | AAA  |  46 | Banglore
 105 | DDD  |  64 | Punjab
 106 | CCC  |  70 | Mumbai
 107 | EEE  |  84 | PUNE
 108 | FFF  |  98 | Mumbai
(8 rows)



mydb=# SELECT * FROM Person WHERE per= (SELECT min(per) FROM PERSON);
 rno | name | per |   city
-----+------+-----+----------
 104 | AAA  |  46 | Banglore
(1 row)



mydb=# SELECT * FROM Person WHERE per >= (SELECT avg(per) FROM PERSON);
 rno | name | per |  city
-----+------+-----+--------
 102 | BBB  |  89 | Mumbai
 103 | CCC  |  78 | Nagar
 107 | EEE  |  84 | PUNE
 108 | FFF  |  98 | Mumbai
(4 rows)





SELECT count(*) FROM Person WHERE per<40;

mydb=# SELECT count(*) FROM Person WHERE per<40;
 count
-------
     0
(1 row)


mydb=# SELECT count(DISTINCT name) FROM Person;
 count
-------
     6
(1 row)



mydb=# SELECT count(DISTINCT City) FROM Person;
 count
-------
     5
(1 row)


mydb=# SELECT DISTINCT City FROM Person;
   city
----------
 Mumbai
 PUNE
 Banglore
 Nagar
 Punjab
(5 rows)

mydb=# SELECT max(per) from Person GROUP BY city;
 max
-----
  98
  84
  46
  78
  64
(5 rows)



mydb=# SELECT City, max(per) from Person GROUP BY city;
   city   | max
----------+-----
 Mumbai   |  98
 PUNE     |  84
 Banglore |  46
 Nagar    |  78
 Punjab   |  64
(5 rows)

mydb=# SELECT City, max(per) AS MAX_Per from Person GROUP BY city ORDER BY City ASC;
   city   | max_per
----------+---------
 Banglore |      46
 Mumbai   |      98
 Nagar    |      78
 PUNE     |      84
 Punjab   |      64
(5 rows)


mydb=# SELECT City, max(per) AS MAX_Per from Person GROUP BY city ORDER BY City DESC;
   city   | max_per
----------+---------
 Punjab   |      64
 PUNE     |      84
 Nagar    |      78
 Mumbai   |      98
 Banglore |      46
(5 rows)



mydb=# SELECT City, count(*) AS Number_OF_Student From Person GROUP BY City;
   city   | number_of_student
----------+-------------------
 Mumbai   |                 3
 PUNE     |                 2
 Banglore |                 1
 Nagar    |                 1
 Punjab   |                 1
(5 rows)



mydb=# SELECT City, max(per) AS Topper From Person GROUP BY City HAVING City LIKE 'P%';
  city  | topper
--------+--------
 PUNE   |     84
 Punjab |     64
(2 rows)
--Less complexity

mydb=# SELECT City, max(per) AS Topper From Person WHERE City LIKE 'P%' GROUP BY City;
  city  | topper
--------+--------
 PUNE   |     84
 Punjab |     64
(2 rows)
--More Complexity



mydb=# SELECT City, count(*) AS Number_OF_Student From Person GROUP BY City HAVING count(*) >= 2;
  city  | number_of_student
--------+-------------------
 Mumbai |                 3
 PUNE   |                 2
(2 rows)


--HAVING

mydb=# SELECT City, max(per) From Person GROUP BY City HAVING max(per) > 60;
  city  | max
--------+-----
 Mumbai |  98
 PUNE   |  84
 Nagar  |  78
 Punjab |  64
(4 rows)


mydb=# SELECT City, max(per) From Person WHERE per>60 GROUP BY City;
  city  | max
--------+-----
 Mumbai |  98
 PUNE   |  84
 Nagar  |  78
 Punjab |  64
(4 rows)



mydb=# SELECT * FROM Person ORDER BY per;
 rno | name | per |   city
-----+------+-----+----------
 104 | AAA  |  46 | Banglore
 101 | AAA  |  56 | PUNE
 105 | DDD  |  64 | Punjab
 106 | CCC  |  70 | Mumbai
 103 | CCC  |  78 | Nagar
 107 | EEE  |  84 | PUNE
 102 | BBB  |  89 | Mumbai
 108 | FFF  |  98 | Mumbai
(8 rows)



--ORDER BY 

mydb=# SELECT * FROM Person ORDER BY per DESC;
 rno | name | per |   city
-----+------+-----+----------
 108 | FFF  |  98 | Mumbai
 102 | BBB  |  89 | Mumbai
 107 | EEE  |  84 | PUNE
 103 | CCC  |  78 | Nagar
 106 | CCC  |  70 | Mumbai
 105 | DDD  |  64 | Punjab
 101 | AAA  |  56 | PUNE
 104 | AAA  |  46 | Banglore
(8 rows)


--FETCH

mydb=# SELECT * FROM Person ORDER BY per DESC FETCH FIRST 3 ROW ONLY;
 rno | name | per |  city
-----+------+-----+--------
 108 | FFF  |  98 | Mumbai
 102 | BBB  |  89 | Mumbai
 107 | EEE  |  84 | PUNE
(3 rows)



mydb=# SELECT * FROM Person ORDER BY per ASC FETCH FIRST 3 ROW ONLY;
 rno | name | per |   city
-----+------+-----+----------
 104 | AAA  |  46 | Banglore
 101 | AAA  |  56 | PUNE
 105 | DDD  |  64 | Punjab
(3 rows)



mydb=# SELECT * FROM Person ORDER BY per DESC LIMIT 3;
 rno | name | per |  city
-----+------+-----+--------
 108 | FFF  |  98 | Mumbai
 102 | BBB  |  89 | Mumbai
 107 | EEE  |  84 | PUNE
(3 rows)



mydb=# SELECT * FROM Person ORDER BY per ASC OFFSET 5 ROWS FETCH FIRST 3 ROW ONLY;
 rno | name | per |  city
-----+------+-----+--------
 107 | EEE  |  84 | PUNE
 102 | BBB  |  89 | Mumbai
 108 | FFF  |  98 | Mumbai
(3 rows)



mydb=# SELECT * FROM Person ORDER BY per DESC FETCH FIRST 1 ROW ONLY;
 rno | name | per |  city
-----+------+-----+--------
 108 | FFF  |  98 | Mumbai
(1 row)


mydb=# SELECT * FROM Person WHERE per = (SELECT max(per) FROM Person);
 rno | name | per |  city
-----+------+-----+--------
 108 | FFF  |  98 | Mumbai
(1 row)



mydb=# SELECT * FROM Person ORDER BY per DESC OFFSET 2 ROWS FETCH FIRST 1 ROW ONLY;
 rno | name | per | city
-----+------+-----+------
 107 | EEE  |  84 | PUNE
(1 row)


mydb=# SELECT * FROM Person where per < (Select max(per) FROM Person) ORDER BY per DESC;
 rno | name | per |   city
-----+------+-----+----------
 102 | BBB  |  89 | Mumbai
 107 | EEE  |  84 | PUNE
 103 | CCC  |  78 | Nagar
 106 | CCC  |  70 | Mumbai
 105 | DDD  |  64 | Punjab
 101 | AAA  |  56 | PUNE
 104 | AAA  |  46 | Banglore
(7 rows)