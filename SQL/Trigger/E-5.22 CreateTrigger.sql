
--CREATE TABLE StudentInsertLog
--(
--Numbers INT
--)

IF(OBJECT_ID('Student_Count') is not null)        -- �ж���Ϊ Student_Count �Ĵ������Ƿ����
DROP TRIGGER Student_Count        -- ɾ��������
GO

CREATE TRIGGER Student_Count
ON Student  	         
AFTER
INSERT
AS 
    INSERT INTO StudentInsertLog(Numbers)
	  SELECT COUNT(*) FROM Student
