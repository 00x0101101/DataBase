
--等值连接
SELECT  Student.*, SC.*
FROM     Student, SC
WHERE  Student.Sno = SC.Sno;


--自然连接
SELECT  Student.Sno,Sname,Ssex,Sage,Sdept,Cno,Grade
FROM     Student,SC
WHERE  Student.Sno = SC.Sno;


--等值连接
SELECT  *
FROM     Student, SC
WHERE  Student.Sno = SC.Sno;
