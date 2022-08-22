



SELECT Student_Name FROM Student WHERE City = 'Pune';
+------------------+
| Student_Name     |
+------------------+
| Rushikesh Shinde |
| Abhishek Gadge   |
| Vaishnav Tapse   |
+------------------+
3 rows in set (0.00 sec)



mysql> SELECT Student_Name, Persent FROM Student WHERE City = 'Pune';
+------------------+---------+
| Student_Name     | Persent |
+------------------+---------+
| Rushikesh Shinde |   86.45 |
| Abhishek Gadge   |   85.79 |
| Vaishnav Tapse   |   76.75 |
+------------------+---------+
3 rows in set (0.00 sec)


mysql> SELECT Student_Name, Persent, City FROM Student WHERE City = 'Pune';
+------------------+---------+------+
| Student_Name     | Persent | City |
+------------------+---------+------+
| Rushikesh Shinde |   86.45 | Pune |
| Abhishek Gadge   |   85.79 | Pune |
| Vaishnav Tapse   |   76.75 | Pune |
+------------------+---------+------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Student WHERE City = 'Pune';
+---------+------------------+---------+------+
| Roll_No | Student_Name     | Persent | City |
+---------+------------------+---------+------+
|     101 | Rushikesh Shinde |   86.45 | Pune |
|     102 | Abhishek Gadge   |   85.79 | Pune |
|     104 | Vaishnav Tapse   |   76.75 | Pune |
+---------+------------------+---------+------+
3 rows in set (0.00 sec)


mysql> SELECT * FROM Student ORDER BY Persent DESC;
+---------+------------------+---------+------------+
| Roll_No | Student_Name     | Persent | City       |
+---------+------------------+---------+------------+
|     103 | Pratik Kulkarni  |   96.45 | Pandharpur |
|     105 | Rahul Machhi     |   89.48 | Mumbai     |
|     106 | Nikhil Gadge     |   86.89 | Mumbai     |
|     107 | Machhi           |   86.89 | Mumbai     |
|     101 | Rushikesh Shinde |   86.45 | Pune       |
|     102 | Abhishek Gadge   |   85.79 | Pune       |
|     104 | Vaishnav Tapse   |   76.75 | Pune       |
+---------+------------------+---------+------------+
7 rows in set (0.00 sec)



mysql> SELECT * FROM Student ORDER BY Persent;
+---------+------------------+---------+------------+
| Roll_No | Student_Name     | Persent | City       |
+---------+------------------+---------+------------+
|     104 | Vaishnav Tapse   |   76.75 | Pune       |
|     102 | Abhishek Gadge   |   85.79 | Pune       |
|     101 | Rushikesh Shinde |   86.45 | Pune       |
|     106 | Nikhil Gadge     |   86.89 | Mumbai     |
|     107 | Machhi           |   86.89 | Mumbai     |
|     105 | Rahul Machhi     |   89.48 | Mumbai     |
|     103 | Pratik Kulkarni  |   96.45 | Pandharpur |
+---------+------------------+---------+------------+
7 rows in set (0.00 sec)


mysql> UPDATE Student SET Student_Name = 'Rahul Machhi' WHERE Roll_No = 107;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from student;
+---------+------------------+---------+------------+
| Roll_No | Student_Name     | Persent | City       |
+---------+------------------+---------+------------+
|     101 | Rushikesh Shinde |   86.45 | Pune       |
|     102 | Abhishek Gadge   |   85.79 | Pune       |
|     103 | Pratik Kulkarni  |   96.45 | Pandharpur |
|     104 | Vaishnav Tapse   |   76.75 | Pune       |
|     105 | Rahul Machhi     |   89.48 | Mumbai     |
|     106 | Nikhil Gadge     |   86.89 | Mumbai     |
|     107 | Rahul Machhi     |   86.89 | Mumbai     |
+---------+------------------+---------+------------+
7 rows in set (0.00 sec)

mysql> SELECT * FROM Student ORDER BY Persent;
+---------+------------------+---------+------------+
| Roll_No | Student_Name     | Persent | City       |
+---------+------------------+---------+------------+
|     104 | Vaishnav Tapse   |   76.75 | Pune       |
|     102 | Abhishek Gadge   |   85.79 | Pune       |
|     101 | Rushikesh Shinde |   86.45 | Pune       |
|     106 | Nikhil Gadge     |   86.89 | Mumbai     |
|     107 | Rahul Machhi     |   86.89 | Mumbai     |
|     105 | Rahul Machhi     |   89.48 | Mumbai     |
|     103 | Pratik Kulkarni  |   96.45 | Pandharpur |
+---------+------------------+---------+------------+
7 rows in set (0.00 sec)


mysql> SELECT DISTINCT Student_Name FROM Student ORDER BY Student_Name;
+------------------+
| Student_Name     |
+------------------+
| Abhishek Gadge   |
| Nikhil Gadge     |
| Pratik Kulkarni  |
| Rahul Machhi     |
| Rushikesh Shinde |
| Vaishnav Tapse   |
+------------------+
6 rows in set (0.02 sec)


mysql> SELECT DISTINCT City FROM Student ORDER BY City;
+------------+
| City       |
+------------+
| Mumbai     |
| Pandharpur |
| Pune       |
+------------+
3 rows in set (0.00 sec)


mysql> SELECT * FROM Student WHERE Persent>=90 ORDER BY Persent DESC;
+---------+-----------------+---------+------------+
| Roll_No | Student_Name    | Persent | City       |
+---------+-----------------+---------+------------+
|     103 | Pratik Kulkarni |   96.45 | Pandharpur |
+---------+-----------------+---------+------------+
1 row in set (0.01 sec)








