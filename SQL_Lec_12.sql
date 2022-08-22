


mydb=# select max(per) from student;
        max
-------------------
 95.44999694824219
(1 row)


mydb=# select min(per) from student;
 min
-----
  45
(1 row)


mydb=# select avg(per) from student;
       avg
------------------
 75.9528568812779
(1 row)


mydb=# select count(per) from student;
 count
-------
     7
(1 row)




mydb=# select max(per) as Topper_Persent from student;
  topper_persent
-------------------
 95.44999694824219
(1 row)


mydb=# select avg(per) as Average_Persentage from student;
 average_persentage
--------------------
   75.9528568812779
(1 row)




mydb=# select min(per), max(per), sum(per), avg(per), count(per) from student;
 min |        max        |        sum        |       avg        | count
-----+-------------------+-------------------+------------------+-------
  45 | 95.44999694824219 | 531.6699981689453 | 75.9528568812779 |     7
(1 row)



mydb=# select count(*) from student;
 count
-------
     7
(1 row)

























