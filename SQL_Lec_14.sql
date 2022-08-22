--              <--Second topper in the list of Student-->



mydb=# SELECT max(per) FROM Person WHERE per IN (SELECT per FROM Person where per < (Select max(per) FROM Person) ORDER BY per DESC);
 max
-----
  89
(1 row)


mydb=# SELECT * FROM Person WHERE per = (SELECT max(per) FROM Person WHERE per IN (SELECT per FROM Person where per < (Select max(per) FROM Person) ORDER BY per DESC));
 rno | name | per |  city
-----+------+-----+--------
 102 | BBB  |  89 | Mumbai
(1 row)


--How to find 3rd topper in the list of student

mydb=# Select max(per) FROM Person;
 max
-----
  98
(1 row)


mydb=# SELECT per FROM Person WHERE per < (Select max(per) FROM Person);
 per
-----
  56
  89
  78
  46
  64
  70
  84
(7 rows)


mydb=# SELECT per FROM Person WHERE per < (Select max(per) FROM Person) ORDER BY per;
 per
-----
  46
  56
  64
  70
  78
  84
  89
(7 rows)


mydb=# SELECT per FROM Person WHERE per < (Select max(per) FROM Person) ORDER BY per DESC;
 per
-----
  89
  84
  78
  70
  64
  56
  46
(7 rows)


mydb=# SELECT max(per) FROM person WHERE per IN (SELECT per FROM Person WHERE per < (Select max(per) FROM Person) ORDER BY per DESC);
 max
-----
  89
(1 row)


mydb=# SELECT per FROM Person WHERE per < (SELECT max(per) FROM person WHERE per IN (SELECT per FROM Person WHERE per < (Select max(per) FROM Person) ORDER BY per DESC));
 per
-----
  56
  78
  46
  64
  70
  84
(6 rows)


mydb=# SELECT per FROM Person WHERE per < (SELECT max(per) FROM person WHERE per IN (SELECT per FROM Person WHERE per < (Select max(per) FROM Person) ORDER BY per DESC)) ORDER BY per DESC;
 per
-----
  84
  78
  70
  64
  56
  46
(6 rows)


mydb=# SELECT max(per) FROM person WHERE per IN (SELECT per FROM Person WHERE per < (SELECT max(per) FROM person WHERE per IN (SELECT per FROM Person WHERE per < (Select max(per) FROM Person) ORDER BY per DESC)) ORDER BY per DESC);
 max
-----
  84
(1 row)


mydb=# SELECT * FROM Person WHERE per = (SELECT max(per) FROM person WHERE per IN (SELECT per FROM Person WHERE per < (SELECT max(per) FROM person WHERE per IN (SELECT per FROM Person WHERE per < (Select max(per) FROM Person) ORDER BY per DESC)) ORDER BY per DESC));
 rno | name | per | city
-----+------+-----+------
 107 | EEE  |  84 | PUNE
(1 row)



--UPDATE

    -->UPDATE table_name SET colomn_name = value, colomn_name= value.....  Where condition;



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


mydb=# UPDATE Student SET per = per+5;
UPDATE 7
mydb=# SELECT * FROM Student;
 rno |       name       |    phno    |        per
-----+------------------+------------+--------------------
 103 | Mayur Shinde     | 7887885695 |                 50
 104 | Dnyaneshwari     | 9373881264 |  87.55999755859375
 101 | Rushikesh        | 8668388724 | 100.44999694824219
 102 | Rushikesh Shinde | 9552772017 |  90.66000366210938
 106 | Sonal            | 45896524   |                 94
 105 | abhishek         | 458574521  |                 69
 107 | Sonal            | 45896524   |                 75
(7 rows)


mydb=# UPDATE Student SET per = per-5;
UPDATE 7
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


mydb=# UPDATE Student SET per = per+5 WHERE rno = 103;
UPDATE 1
mydb=# SELECT * FROM Student;
 rno |       name       |    phno    |        per
-----+------------------+------------+-------------------
 104 | Dnyaneshwari     | 9373881264 | 82.55999755859375
 101 | Rushikesh        | 8668388724 | 95.44999694824219
 102 | Rushikesh Shinde | 9552772017 | 85.66000366210938
 106 | Sonal            | 45896524   |                89
 105 | abhishek         | 458574521  |                64
 107 | Sonal            | 45896524   |                70
 103 | Mayur Shinde     | 7887885695 |                50
(7 rows)







mydb=# UPDATE Student SET per = per-5;
UPDATE 7
mydb=# UPDATE Student SET per = per-5;
UPDATE 7





mydb=# SELECT * FROM Student;
 rno |       name       |    phno    |        per
-----+------------------+------------+-------------------
 104 | Dnyaneshwari     | 9373881264 | 67.55999755859375
 101 | Rushikesh        | 8668388724 | 80.44999694824219
 102 | Rushikesh Shinde | 9552772017 | 70.66000366210938
 106 | Sonal            | 45896524   |                74
 105 | abhishek         | 458574521  |                49
 107 | Sonal            | 45896524   |                55
 103 | Mayur Shinde     | 7887885695 |                35
(7 rows)


mydb=# UPDATE Student SET per = 40 WHERE per<40;
UPDATE 1
mydb=# SELECT * FROM Student;
 rno |       name       |    phno    |        per
-----+------------------+------------+-------------------
 104 | Dnyaneshwari     | 9373881264 | 67.55999755859375
 101 | Rushikesh        | 8668388724 | 80.44999694824219
 102 | Rushikesh Shinde | 9552772017 | 70.66000366210938
 106 | Sonal            | 45896524   |                74
 105 | abhishek         | 458574521  |                49
 107 | Sonal            | 45896524   |                55
 103 | Mayur Shinde     | 7887885695 |                40
(7 rows)




--RETURNING Clause
----------------------
--If i want to "see" which records are targetted by UPDATE Query then I will use RETURNING Clause.



mydb=# Update Student SET per = 100 WHERE per >= 70 RETURNING *;
 rno |       name       |    phno    | per
-----+------------------+------------+-----
 101 | Rushikesh        | 8668388724 | 100
 102 | Rushikesh Shinde | 9552772017 | 100
 106 | Sonal            | 45896524   | 100
(3 rows)


UPDATE 3
mydb=# SELECT * FROM Student;
 rno |       name       |    phno    |        per
-----+------------------+------------+-------------------
 104 | Dnyaneshwari     | 9373881264 | 67.55999755859375
 105 | abhishek         | 458574521  |                49
 107 | Sonal            | 45896524   |                55
 103 | Mayur Shinde     | 7887885695 |                40
 101 | Rushikesh        | 8668388724 |               100
 102 | Rushikesh Shinde | 9552772017 |               100
 106 | Sonal            | 45896524   |               100
(7 rows)


mydb=# UPDATE Student SET per = 86 WHERE per= 100;
UPDATE 3
mydb=# SELECT * FROM Student;
 rno |       name       |    phno    |        per
-----+------------------+------------+-------------------
 104 | Dnyaneshwari     | 9373881264 | 67.55999755859375
 105 | abhishek         | 458574521  |                49
 107 | Sonal            | 45896524   |                55
 103 | Mayur Shinde     | 7887885695 |                40
 101 | Rushikesh        | 8668388724 |                86
 102 | Rushikesh Shinde | 9552772017 |                86
 106 | Sonal            | 45896524   |                86
(7 rows)
