IF (exists (select * from sys.objects where name = 'proc_cursor'))
    DROP PROCEDURE proc_cursor
GO
CREATE PROCEDURE proc_cursor -- �洢����
AS
DECLARE @Sno char(9)--�������
DECLARE @Sname char(20)--�������

DECLARE mycursor CURSOR FOR select Sno,Sname from Student --�����α�

OPEN mycursor  --���α�

FETCH NEXT FROM mycursor INTO @Sno,@Sname

WHILE(@@FETCH_STATUS=0)  --�������е�����
BEGIN
	PRINT '�α�ɹ�ȡ��һ������:'
	PRINT @Sno
	PRINT @Sname
	PRINT '********************'
	FETCH NEXT FROM mycursor INTO @Sno,@Sname  --ȡ��һ���α�����
END

CLOSE mycursor --�ر��α�

DEALLOCATE mycursor --ɾ���α�
GO

EXEC proc_cursor
GO