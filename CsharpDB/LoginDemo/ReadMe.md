# ʹ��˵��
1. �����ݿ��½���������һ������
'''
CREATE TABLE [dbo].[usertable](
	[userid] [nchar](10) NOT NULL,
	[password] [nchar](10) NOT NULL
)

INSERT INTO [dbo].[usertable] ([userid] ,[password])
     VALUES   ('abc' ,'123')
'''
2. �������ݿ�����Ϊ�Լ������ݿ�
���磺Data Source=.;Initial Catalog=Test;Persist Security Info=True;User ID=sa;Password=sql
3. дdataset����غ���
 ![]()
4. ��д���룬�����ݿ⣬��ɵ�¼��֤���ر����ݿ⡣
5. ����dataset�ĺ����������ɾ�Ĳ顣