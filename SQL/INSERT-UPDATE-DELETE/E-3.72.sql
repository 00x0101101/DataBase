--第一步：建表
CREATE  TABLE  Dept_age
( Sdept     CHAR(15),                     /*系名*/
 Avg_age SMALLINT);          	/*学生平均年龄*/
 
--第二步：插入数据
INSERT
INTO  Dept_age(Sdept,Avg_age)
SELECT  Sdept,AVG(Sage)
FROM     Student
GROUP BY Sdept;

SELECT * FROM Dept_age
