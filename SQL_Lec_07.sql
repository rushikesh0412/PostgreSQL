mysql.text



show databases;

create database testdb;

use testdb;

 create table person(personID int, lastName varchar(255), firstName varchar(255), address varchar(255), city varchar(255));

 show tables;


 select * from person;

 insert into person values('101', 'Shinde' , 'Rushi', 'Ane tail junnar dist. Pune', 'Pune');
 insert into person values('102', 'Takalkar' , 'Dnyaneshwari', 'Ane tail junnar dist. Pune', 'Pune');
 insert into person values('103', 'Suvarnakar' , 'Abhishek', 'chikhli dist. Pune', 'Pune');


select * from person;

----------------------------------------------------------------------------------------------------------------------------------

mysql> use testdb;
Database changed
mysql> show tables;
+------------------+
| Tables_in_testdb |
+------------------+
| person           |
+------------------+
1 row in set (0.00 sec)

mysql> select * from person;
+----------+------------+--------------+----------------------------+------+
| personID | lastName   | firstName    | address                    | city |
+----------+------------+--------------+----------------------------+------+
|      101 | Shinde     | Rushi        | Ane tail junnar dist. Pune | Pune |
|      102 | Takalkar   | Dnyaneshwari | Ane tail junnar dist. Pune | Pune |
|      103 | Suvarnakar | Abhishek     | chikhli dist. Pune         | Pune |
+----------+------------+--------------+----------------------------+------+
3 rows in set (0.01 sec)




----------------------------------------------------------------------------------------------------------------------------------


create database infosys;

use infosys;

create table employee(Employee_ID int primary key, 
                        Employee_Name varchar(30), 
                        Employee_salary float,
                        Employee_Department varchar(20)
                    );


INSERT INTO employee VALUES(101, 'Rushikesh Shinde', 50000, 'Computer');
INSERT INTO employee VALUES(102, 'Abhishek Gadge', 60000, 'Computer');
INSERT INTO employee VALUES(103, 'Vaishnav Tapse', 40000, 'Mechanical');
INSERT INTO employee VALUES(104, 'Shiv Mohite', 30000, 'Sevil');
INSERT INTO employee VALUES(105, 'Sachin Kathmande', 70000, 'E&TC');

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


