--Delete Record???



mysql> SELECT * FROM employee;
+-------------+------------------+-----------------+---------------------+
| Employee_ID | Employee_Name    | Employee_salary | Employee_Department |
+-------------+------------------+-----------------+---------------------+
|         101 | Rushikesh Shinde |           50000 | Computer            |
|         102 | Abhishek Gadge   |           60000 | Computer            |
|         103 | Vaishnav Tapse   |           40000 | Mechanical          |
|         104 | Shiv Mohite      |           30000 | Sevil               |
|         105 | Sachin Kathmande |           70000 | E&TC                |
+-------------+------------------+-----------------+---------------------+
5 rows in set (0.01 sec)


--How to delete record from table???

/*DELETE FROM table_name WHERE col_name = value;*/

mysql> DELETE FROM employee WHERE Employee_ID = 103;
Query OK, 1 row affected (0.02 sec)

mysql> SELECT * FROM Employee;
+-------------+------------------+-----------------+---------------------+
| Employee_ID | Employee_Name    | Employee_salary | Employee_Department |
+-------------+------------------+-----------------+---------------------+
|         101 | Rushikesh Shinde |           50000 | Computer            |
|         102 | Abhishek Gadge   |           60000 | Computer            |
|         104 | Shiv Mohite      |           30000 | Sevil               |
|         105 | Sachin Kathmande |           70000 | E&TC                |
+-------------+------------------+-----------------+---------------------+
4 rows in set (0.01 sec)


SELECT Employee_Name, Employee_ID FROM employee;
+------------------+-------------+
| Employee_Name    | Employee_ID |
+------------------+-------------+
| Rushikesh Shinde |         101 |
| Abhishek Gadge   |         102 |
| Vaishnav Tapse   |         103 |
| Shiv Mohite      |         104 |
| Sachin Kathmande |         105 |
+------------------+-------------+
5 rows in set (0.00 sec)



INSERT INTO employee(Employee_ID, Employee_Name, Employee_Department) VALUES(106, 'Rushi Shinde', 'Computer');
Query OK, 1 row affected (0.02 sec)

mysql> SELECT * FROM Employee;
+-------------+------------------+-----------------+---------------------+
| Employee_ID | Employee_Name    | Employee_salary | Employee_Department |
+-------------+------------------+-----------------+---------------------+
|         101 | Rushikesh Shinde |           50000 | Computer            |
|         102 | Abhishek Gadge   |           60000 | Computer            |
|         103 | Vaishnav Tapse   |           40000 | Mechanical          |
|         104 | Shiv Mohite      |           30000 | Sevil               |
|         105 | Sachin Kathmande |           70000 | E&TC                |
|         106 | Rushi Shinde     |            NULL | Computer            |
+-------------+------------------+-----------------+---------------------+
6 rows in set (0.01 sec)




--How to Update Record???

UPDATE employee SET Employee_salary = 48960 WHERE Employee_ID = 103;


mysql> UPDATE employee SET Employee_salary = 48960 WHERE Employee_ID = 103;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM Employee;
+-------------+------------------+-----------------+---------------------+
| Employee_ID | Employee_Name    | Employee_salary | Employee_Department |
+-------------+------------------+-----------------+---------------------+
|         101 | Rushikesh Shinde |           50000 | Computer            |
|         102 | Abhishek Gadge   |           60000 | Computer            |
|         103 | Vaishnav Tapse   |           48960 | Mechanical          |
|         104 | Shiv Mohite      |           30000 | Sevil               |
|         105 | Sachin Kathmande |           70000 | E&TC                |
|         106 | Rushi Shinde     |            NULL | Computer            |
+-------------+------------------+-----------------+---------------------+
6 rows in set (0.01 sec)


mysql> DROP TABLE Employee;
Query OK, 0 rows affected (0.06 sec)



--NOT NULL

CREATE TABLE employee(Employee_ID int primary key, Employee_Name varchar(30) NOT NULL, Employee_salary float, Employee_Department varchar(20));


mysql> create table employee(Employee_ID int primary key, Employee_Name varchar(30) NOT NULL, Employee_salary float, Employee_Department varchar(20));
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO employee VALUES(101, 'Rushikesh Shinde', 50000, 'Computer');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO employee VALUES(102, 'Abhishek Gadge', 60000, 'Computer');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO employee VALUES(103, 'Vaishnav Tapse', 40000, 'Mechanical');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO employee VALUES(104, 'Shiv Mohite', 30000, 'Sevil');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO employee VALUES(105, 'Sachin Kathmande', 70000, 'E&TC');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM Employee;
+-------------+------------------+-----------------+---------------------+
| Employee_ID | Employee_Name    | Employee_salary | Employee_Department |
+-------------+------------------+-----------------+---------------------+
|         101 | Rushikesh Shinde |           50000 | Computer            |
|         102 | Abhishek Gadge   |           60000 | Computer            |
|         103 | Vaishnav Tapse   |           40000 | Mechanical          |
|         104 | Shiv Mohite      |           30000 | Sevil               |
|         105 | Sachin Kathmande |           70000 | E&TC                |
+-------------+------------------+-----------------+---------------------+
5 rows in set (0.00 sec)



--Constraint

CREATE TABLE Student(Roll_No int primary key, Student_Name varchar(30) NOT NULL, Persent float CHECK(Persent>=0 and Persent<=100), City varchar(10) NOT NULL);


INSERT INTO Student VALUES(101, 'Rushikesh Shinde', 86.45, 'Pune');
INSERT INTO Student VALUES(102, 'Abhishek Gadge', 85.79, 'Pune');
INSERT INTO Student VALUES(103, 'Pratik Kulkarni', 96.45, 'Pandharpur');
INSERT INTO Student VALUES(104, 'Vaishnav Tapse', 76.75, 'Pune');
INSERT INTO Student VALUES(105, 'Rahul Machhi', 89.48, 'Mumbai');



mysql> INSERT INTO Student VALUES(101, 'Rushikesh Shinde', 86.45, 'Pune');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Student VALUES(102, 'Abhishek Gadge', 85.79, 'Pune');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Student VALUES(103, 'Pratik Kulkarni', 96.45, 'Pandharpur');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Student VALUES(104, 'Vaishnav Tapse', 76.75, 'Pune');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Student VALUES(105, 'Rahul Machhi', 89.48, 'Mumbai');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM Student;
+---------+------------------+---------+------------+
| Roll_No | Student_Name     | Persent | City       |
+---------+------------------+---------+------------+
|     101 | Rushikesh Shinde |   86.45 | Pune       |
|     102 | Abhishek Gadge   |   85.79 | Pune       |
|     103 | Pratik Kulkarni  |   96.45 | Pandharpur |
|     104 | Vaishnav Tapse   |   76.75 | Pune       |
|     105 | Rahul Machhi     |   89.48 | Mumbai     |
+---------+------------------+---------+------------+
5 rows in set (0.00 sec)


--If you gave persent greater than 100 or less than 0 then

mysql> INSERT INTO Student VALUES(105, 'Rahul Machhi', 268, 'Mumbai');
ERROR 3819 (HY000): Check constraint 'student_chk_1' is violated.




--If you gave null value in name colomn
mysql> INSERT INTO Student VALUES(105, NULL, 268, 'Mumbai');
ERROR 1048 (23000): Column 'Student_Name' cannot be null


--If you gave duplicate ID then
INSERT INTO Student VALUES(105, 'Rahul Machhi', 268, 'Mumbai');
ERROR 3819 (HY000): Check constraint 'student_chk_1' is violated.
