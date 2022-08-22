


SELECT * FROM Student;
 rno |       name       |    phno    |        per
-----+------------------+------------+-------------------
 103 | Mayur Shinde     | 7887885695 |                45
 104 | Dnyaneshwari     | 9373881264 | 82.55999755859375
 101 | Rushikesh        | 8668388724 | 95.44999694824219
 102 | Rushikesh Shinde | 9552772017 | 85.66000366210938
 105 | abhishek         | 458574521  |                89
 106 | Sonal            | 45896524   |                89
 107 | Sonal            | 45896524   |                89
(7 rows)


mydb=# UPDATE Student set per = 64 WHERE rno = 105;
UPDATE 1
mydb=# SELECT * FROM Student;
 rno |       name       |    phno    |        per
-----+------------------+------------+-------------------
 103 | Mayur Shinde     | 7887885695 |                45
 104 | Dnyaneshwari     | 9373881264 | 82.55999755859375
 101 | Rushikesh        | 8668388724 | 95.44999694824219
 102 | Rushikesh Shinde | 9552772017 | 85.66000366210938
 106 | Sonal            | 45896524   |                89
 107 | Sonal            | 45896524   |                89
 105 | abhishek         | 458574521  |                64
(7 rows)



mydb=# UPDATE Student set per = 70 WHERE rno = 107;
UPDATE 1
mydb=# SELECT * FROM Student;
 rno |       name       |    phno    |        per
-----+------------------+------------+-------------------
 103 | Mayur Shinde     | 7887885695 |                45
 104 | Dnyaneshwari     | 9373881264 | 82.55999755859375
 101 | Rushikesh        | 8668388724 | 95.44999694824219
 102 | Rushikesh Shinde | 9552772017 | 85.66000366210938
 106 | Sonal            | 45896524   |                89
 105 | abhishek         | 458574521  |                64
 107 | Sonal            | 45896524   |                70
(7 rows)



mydb=# SELECT * FROM Student WHERE per>60 and per<70;
 rno |   name   |   phno    | per
-----+----------+-----------+-----
 105 | abhishek | 458574521 |  64
(1 row)



mydb=# SELECT * FROM Student WHERE per BETWEEN 60 and 70;
 rno |   name   |   phno    | per
-----+----------+-----------+-----
 105 | abhishek | 458574521 |  64
 107 | Sonal    | 45896524  |  70
(2 rows)


mydb=# SELECT * FROM Student WHERE per BETWEEN 60 and 69.99;
 rno |   name   |   phno    | per
-----+----------+-----------+-----
 105 | abhishek | 458574521 |  64
(1 row)


mydb=# SELECT * FROM Student WHERE name >= 'Dnyaneshwari' and name<= 'Sonal';
 rno |       name       |    phno    |        per
-----+------------------+------------+-------------------
 103 | Mayur Shinde     | 7887885695 |                45
 104 | Dnyaneshwari     | 9373881264 | 82.55999755859375
 101 | Rushikesh        | 8668388724 | 95.44999694824219
 102 | Rushikesh Shinde | 9552772017 | 85.66000366210938
 106 | Sonal            | 45896524   |                89
 107 | Sonal            | 45896524   |                70
(6 rows)




mydb=# SELECT * FROM Student WHERE name BETWEEN 'Dnyaneshwari' and 'Sonal';
 rno |       name       |    phno    |        per
-----+------------------+------------+-------------------
 103 | Mayur Shinde     | 7887885695 |                45
 104 | Dnyaneshwari     | 9373881264 | 82.55999755859375
 101 | Rushikesh        | 8668388724 | 95.44999694824219
 102 | Rushikesh Shinde | 9552772017 | 85.66000366210938
 106 | Sonal            | 45896524   |                89
 107 | Sonal            | 45896524   |                70
(6 rows)



--MySQL

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| infosys            |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| testdb             |
| world              |
+--------------------+
8 rows in set (0.02 sec)

mysql> use testdb;
Database changed
mysql> show tables;
+------------------+
| Tables_in_testdb |
+------------------+
| person           |
+------------------+
1 row in set (0.01 sec)

mysql> SELECT * FROM person;
+----------+------------+--------------+----------------------------+------+
| personID | lastName   | firstName    | address                    | city |
+----------+------------+--------------+----------------------------+------+
|      101 | Shinde     | Rushi        | Ane tail junnar dist. Pune | Pune |
|      102 | Takalkar   | Dnyaneshwari | Ane tail junnar dist. Pune | Pune |
|      103 | Suvarnakar | Abhishek     | chikhli dist. Pune         | Pune |
+----------+------------+--------------+----------------------------+------+
3 rows in set (0.00 sec)

mysql> INSERT INTO Person VALUES(104, 'Takalkar','Sonal', 'Rajgurunagar', 'Mumbai');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Person VALUES(105, 'Gadge','Nikhil', 'kalyan', 'Mumbai');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Person VALUES(106, 'Kulkarni','Pratik', 'pandharpur', 'Nagar');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Person VALUES(107, 'Shinde','Rushikesh', 'RCB', 'Banglore');
Query OK, 1 row affected (0.01 sec)



mysql> SELECT * FROM person;
+----------+------------+--------------+----------------------------+----------+
| personID | lastName   | firstName    | address                    | city     |
+----------+------------+--------------+----------------------------+----------+
|      101 | Shinde     | Rushi        | Ane tail junnar dist. Pune | Pune     |
|      102 | Takalkar   | Dnyaneshwari | Ane tail junnar dist. Pune | Pune     |
|      103 | Suvarnakar | Abhishek     | chikhli dist. Pune         | Pune     |
|      104 | Takalkar   | Sonal        | Rajgurunagar               | Mumbai   |
|      105 | Gadge      | Nikhil       | kalyan                     | Mumbai   |
|      106 | Kulkarni   | Pratik       | pandharpur                 | Nagar    |
|      107 | Shinde     | Rushikesh    | RCB                        | Banglore |
+----------+------------+--------------+----------------------------+----------+
7 rows in set (0.00 sec)



--OR

mysql> SELECT * FROM Person WHERE City='Pune' OR City = 'Mumbai';
+----------+------------+--------------+----------------------------+--------+
| personID | lastName   | firstName    | address                    | city   |
+----------+------------+--------------+----------------------------+--------+
|      101 | Shinde     | Rushi        | Ane tail junnar dist. Pune | Pune   |
|      102 | Takalkar   | Dnyaneshwari | Ane tail junnar dist. Pune | Pune   |
|      103 | Suvarnakar | Abhishek     | chikhli dist. Pune         | Pune   |
|      104 | Takalkar   | Sonal        | Rajgurunagar               | Mumbai |
|      105 | Gadge      | Nikhil       | kalyan                     | Mumbai |
+----------+------------+--------------+----------------------------+--------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM Person WHERE City!='Pune' AND City != 'Mumbai';
+----------+----------+-----------+------------+----------+
| personID | lastName | firstName | address    | city     |
+----------+----------+-----------+------------+----------+
|      106 | Kulkarni | Pratik    | pandharpur | Nagar    |
|      107 | Shinde   | Rushikesh | RCB        | Banglore |
+----------+----------+-----------+------------+----------+
2 rows in set (0.00 sec)




--IN

mysql> SELECT * FROM Person WHERE City IN ('Pune', 'Mumbai');
+----------+------------+--------------+----------------------------+--------+
| personID | lastName   | firstName    | address                    | city   |
+----------+------------+--------------+----------------------------+--------+
|      101 | Shinde     | Rushi        | Ane tail junnar dist. Pune | Pune   |
|      102 | Takalkar   | Dnyaneshwari | Ane tail junnar dist. Pune | Pune   |
|      103 | Suvarnakar | Abhishek     | chikhli dist. Pune         | Pune   |
|      104 | Takalkar   | Sonal        | Rajgurunagar               | Mumbai |
|      105 | Gadge      | Nikhil       | kalyan                     | Mumbai |
+----------+------------+--------------+----------------------------+--------+
5 rows in set (0.00 sec)

--NOT IN


mysql> SELECT * FROM Person WHERE City NOT IN ('Pune', 'Mumbai');
+----------+----------+-----------+------------+----------+
| personID | lastName | firstName | address    | city     |
+----------+----------+-----------+------------+----------+
|      106 | Kulkarni | Pratik    | pandharpur | Nagar    |
|      107 | Shinde   | Rushikesh | RCB        | Banglore |
+----------+----------+-----------+------------+----------+
2 rows in set (0.00 sec)


mysql> SELECT * FROM Person WHERE City LIKE 'P%';
+----------+------------+--------------+----------------------------+------+
| personID | lastName   | firstName    | address                    | city |
+----------+------------+--------------+----------------------------+------+
|      101 | Shinde     | Rushi        | Ane tail junnar dist. Pune | Pune |
|      102 | Takalkar   | Dnyaneshwari | Ane tail junnar dist. Pune | Pune |
|      103 | Suvarnakar | Abhishek     | chikhli dist. Pune         | Pune |
+----------+------------+--------------+----------------------------+------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Person WHERE City LIKE 'P%E';
+----------+------------+--------------+----------------------------+------+
| personID | lastName   | firstName    | address                    | city |
+----------+------------+--------------+----------------------------+------+
|      101 | Shinde     | Rushi        | Ane tail junnar dist. Pune | Pune |
|      102 | Takalkar   | Dnyaneshwari | Ane tail junnar dist. Pune | Pune |
|      103 | Suvarnakar | Abhishek     | chikhli dist. Pune         | Pune |
+----------+------------+--------------+----------------------------+------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Person WHERE City LIKE '_U%E';
+----------+------------+--------------+----------------------------+------+
| personID | lastName   | firstName    | address                    | city |
+----------+------------+--------------+----------------------------+------+
|      101 | Shinde     | Rushi        | Ane tail junnar dist. Pune | Pune |
|      102 | Takalkar   | Dnyaneshwari | Ane tail junnar dist. Pune | Pune |
|      103 | Suvarnakar | Abhishek     | chikhli dist. Pune         | Pune |
+----------+------------+--------------+----------------------------+------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Person WHERE City LIKE '_U%';
+----------+------------+--------------+----------------------------+--------+
| personID | lastName   | firstName    | address                    | city   |
+----------+------------+--------------+----------------------------+--------+
|      101 | Shinde     | Rushi        | Ane tail junnar dist. Pune | Pune   |
|      102 | Takalkar   | Dnyaneshwari | Ane tail junnar dist. Pune | Pune   |
|      103 | Suvarnakar | Abhishek     | chikhli dist. Pune         | Pune   |
|      104 | Takalkar   | Sonal        | Rajgurunagar               | Mumbai |
|      105 | Gadge      | Nikhil       | kalyan                     | Mumbai |
+----------+------------+--------------+----------------------------+--------+
5 rows in set (0.00 sec)



mysql> SELECT * FROM Person WHERE City LIKE '_____';
+----------+----------+-----------+------------+-------+
| personID | lastName | firstName | address    | city  |
+----------+----------+-----------+------------+-------+
|      106 | Kulkarni | Pratik    | pandharpur | Nagar |
+----------+----------+-----------+------------+-------+
1 row in set (0.00 sec)

mysql> SELECT * FROM Person WHERE City LIKE '____';
+----------+------------+--------------+----------------------------+------+
| personID | lastName   | firstName    | address                    | city |
+----------+------------+--------------+----------------------------+------+
|      101 | Shinde     | Rushi        | Ane tail junnar dist. Pune | Pune |
|      102 | Takalkar   | Dnyaneshwari | Ane tail junnar dist. Pune | Pune |
|      103 | Suvarnakar | Abhishek     | chikhli dist. Pune         | Pune |
+----------+------------+--------------+----------------------------+------+
3 rows in set (0.00 sec)


mysql> SELECT * FROM Person WHERE City LIKE '_%';
+----------+------------+--------------+----------------------------+----------+
| personID | lastName   | firstName    | address                    | city     |
+----------+------------+--------------+----------------------------+----------+
|      101 | Shinde     | Rushi        | Ane tail junnar dist. Pune | Pune     |
|      102 | Takalkar   | Dnyaneshwari | Ane tail junnar dist. Pune | Pune     |
|      103 | Suvarnakar | Abhishek     | chikhli dist. Pune         | Pune     |
|      104 | Takalkar   | Sonal        | Rajgurunagar               | Mumbai   |
|      105 | Gadge      | Nikhil       | kalyan                     | Mumbai   |
|      106 | Kulkarni   | Pratik       | pandharpur                 | Nagar    |
|      107 | Shinde     | Rushikesh    | RCB                        | Banglore |
+----------+------------+--------------+----------------------------+----------+
7 rows in set (0.00 sec)