--SQL_Lec_08.sql

/*
CREATE TABLE table_name{
	colomn_name data_type [constraint],
	Roll_No 	int
};
*/

create table employee(Employee_ID int primary key, Employee_Name varchar(30), Employee_salary float, Employee_Department varchar(20));


--How to insert data in the table???

--INSERT INTO table_name values(vaal1, val2,....., valn);

INSERT INTO employee VALUES(101, 'Rushikesh Shinde', 50000, 'Computer');
INSERT INTO employee VALUES(102, 'Abhishek Gadge', 60000, 'Computer');
INSERT INTO employee VALUES(103, 'Vaishnav Tapse', 40000, 'Mechanical');
INSERT INTO employee VALUES(104, 'Shiv Mohite', 30000, 'Sevil');
INSERT INTO employee VALUES(105, 'Sachin Kathmande', 70000, 'E&TC');

SELECT * FROM employee;
+-------------+------------------+-----------------+---------------------+
| Employee_ID | Employee_Name    | Employee_salary | Employee_Department |
+-------------+------------------+-----------------+---------------------+
|         101 | Rushikesh Shinde |           50000 | Computer            |
|         102 | Abhishek Gadge   |           60000 | Computer            |
|         103 | Vaishnav Tapse   |           40000 | Mechanical          |
|         104 | Shiv Mohite      |           30000 | Sevil               |
|         105 | Sachin Kathmande |           70000 | E&TC                |
+-------------+------------------+-----------------+---------------------+
