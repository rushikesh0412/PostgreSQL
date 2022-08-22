

--reletional database

CREATE TABLE Student(
						rno int primary key,
						name varchar(30) NOT NULL,
						per float,
						city varchar(20) NOT NULL
					);
CREATE TABLE Teacher(
						tno int primary key,
						name varchar(30) NOT NULL,
						salary float,
						city varchar(20) NOT NULL
					);
CREATE TABLE ST(
						rno int REFERENCES Student(rno) ON DELETE CASCADE ON UPDATE CASCADE,
						tno int REFERENCES Teacher(tno) ON DELETE CASCADE ON UPDATE CASCADE,
						ldate DATE
				);





mydb=# \dt
Did not find any relations.
mydb=# CREATE TABLE Student(
mydb(#                                          rno int primary key,
mydb(#                                          name varchar(30) NOT NULL,
mydb(#                                          per float,
mydb(#                                          city varchar(20) NOT NULL
mydb(#                                  );
CREATE TABLE
mydb=# CREATE TABLE Teacher(
mydb(#                                          tno int primary key,
mydb(#                                          name varchar(30) NOT NULL,
mydb(#                                          salary float,
mydb(#                                          city varchar(20) NOT NULL
mydb(#                                  );
CREATE TABLE
mydb=# CREATE TABLE ST(
mydb(#                                          rno int REFERENCES Student(rno) ON DELETE CASCADE ON UPDATE CASCADE,
mydb(#                                          tno int REFERENCES Teacher(tno) ON DELETE CASCADE ON UPDATE CASCADE,
mydb(#                                          ldate DATE
mydb(#                          );
CREATE TABLE
mydb=# \dt
          List of relations
 Schema |  Name   | Type  |  Owner
--------+---------+-------+----------
 public | st      | table | postgres
 public | student | table | postgres
 public | teacher | table | postgres
(3 rows)


mydb=# SELECT * FROM Student;
 rno | name | per | city
-----+------+-----+------
(0 rows)


mydb=# SELECT * FROM Teacher;
 tno | name | salary | city
-----+------+--------+------
(0 rows)


mydb=# SELECT * FROM ST;
 rno | tno | ldate
-----+-----+-------
(0 rows)


mydb=# DROP TABLE Student;
ERROR:  cannot drop table student because other objects depend on it
DETAIL:  constraint st_rno_fkey on table st depends on table student
HINT:  Use DROP ... CASCADE to drop the dependent objects too.
mydb=#
mydb=#
mydb=# DROP TABLE ST;
DROP TABLE
mydb=# DROP TABLE Student;
DROP TABLE
mydb=# DROP TABLE Teacher;
DROP TABLE
mydb=# \dt
Did not find any relations.
mydb=#