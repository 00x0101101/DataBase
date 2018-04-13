
IF (exists (select * from sys.objects where name = 'Proc_TRANSFER'))
    DROP PROCEDURE Proc_TRANSFER
GO
CREATE PROCEDURE Proc_TRANSFER 
@inAccount INT,@outAccount  INT,@amount FLOAT
 /*����洢����TRANSFER������Ϊת���˻���ת���˻���ת�˶��*/
AS
BEGIN TRANSACTION TRANS   
   	DECLARE		/*�������*/
	@totalDepositOut Float,
	@totalDepositIn Float,
	@inAccountnum INT;
	 /*���ת���˻������ */     
	SELECT @totalDepositOut = total FROM Account	WHERE accountnum = @outAccount;
	/*���ת���˻������ڻ��˻���û�д��*/
	IF @totalDepositOut IS NULL               	   
		BEGIN
			PRINT 'ת���˻������ڻ��˻���û�д��'
			ROLLBACK TRANSACTION TRANS; 	   /*�ع�����*/
			RETURN;
		END;
	/*����˻�����*/
	IF @totalDepositOut < @amount     	
		BEGIN
			PRINT '�˻�����'
			ROLLBACK TRANSACTION TRANS; 				/*�ع�����*/
			RETURN;
		END
	/*���ת���˻���״̬ */  
	SELECT @inAccountnum = accountnum  FROM Account	WHERE accountnum = @inAccount;
	/*���ת���˻�������*/ 
	IF @inAccountnum IS NULL   		                       
		BEGIN
			PRINT 'ת���˻�������'
			ROLLBACK TRANSACTION TRANS; 	         	 		/*�ع�����*/
			RETURN;
		END;
	/*���������û���쳣����ʼת�ˡ�*/ 
	BEGIN
		UPDATE Account SET total = total - @amount	WHERE	accountnum = @outAccount; /* �޸�ת���˻�����ȥת���� */
		UPDATE Account SET total = total + @amount	WHERE   accountnum = @inAccount; /* �޸�ת���˻�������ת��� */
		PRINT 'ת����ɣ���ȡ�����п�'
		COMMIT TRANSACTION TRANS;                       	/* �ύת������ */
		RETURN;
	END
