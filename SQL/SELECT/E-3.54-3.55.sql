--嵌套查询
--一个SELECT-FROM-WHERE语句称为一个查询块
--将一个查询块嵌套在另一个查询块的WHERE子句或HAVING短语的条件中的查询称为嵌套查询

SELECT *	                           /*外层查询/父查询*/
FROM Student
WHERE Sno IN
	(SELECT Sno        /*内层查询/子查询*/
	FROM SC
	WHERE Cno= '2');


--不相关子查询
SELECT Sno, Sname, Sdept
FROM Student
WHERE Sdept  IN
	(SELECT Sdept
	FROM Student
	WHERE Sname= '刘晨');


--相关子查询
SELECT Sno, Cno
FROM    SC  x
WHERE Grade >=(	SELECT AVG(Grade) 
				FROM  SC y
				WHERE y.Sno=x.Sno);
