----��3����

--������
create database SPJbase
use SPJbase


--������
create table s                 --����s��
(
sno varchar(5) primary key,
sname varchar(10) not null,
status int not null,
city varchar(10) not null
)
create table p                 --����p��
(
pno varchar(5) primary key,
pname varchar(10) not null,
color varchar(50) not null,
weight int not null
)
create table j                 --����j��
(
jno varchar(5) primary key,
jname varchar(10) not null,
city varchar(10) not null
)
create table spj               --����spj��
(
sno varchar(5),
pno varchar(10) not null,
jno varchar(10) not null,
qty int  not null 
)



--��������

insert into s values('s1','����',20,'���')   --����S��
insert into s values('s2','ʢ��',10,'����')
insert into s values('s3','������',30,'����')
insert into s values('s4','��̩ʢ',20,'���')
insert into s values('s5','Ϊ��',30,'�Ϻ�')
select * from s

insert into p values('p1','��ĸ','��',12)     --����P��
insert into p values('p2','��˨','��',17)
insert into p values('p3','��˿��','��',14)
insert into p values('p4','��˿��','��',14)
insert into p values('p5','͹��','��',40)
insert into p values('p6','����','��',30)
select * from p

insert into j values('j1','����','����')      --����J��
insert into j values('j2','һ��','����')
insert into j values('j3','���ɳ�','���')
insert into j values('j4','�촬��','���')
insert into j values('j5','������','��ɽ')
insert into j values('j6','���ߵ糧','����')
insert into j values('j7','�뵼�峧','�Ͼ�')
select * from j

insert into spj values('s1','p1','j1',200)   --����spj��
insert into spj values('s1','p1','j3',100)
insert into spj values('s1','p1','j4',700)
insert into spj values('s1','p2','j2',100)
insert into spj values('s2','p3','j1',400)
insert into spj values('s2','p3','j2',200)
insert into spj values('s2','p3','j4',500)
insert into spj values('s2','p3','j5',400)
insert into spj values('s2','p5','j1',400)
insert into spj values('s2','p5','j2',100)
insert into spj values('s3','p1','j1',200)
insert into spj values('s3','p3','j1',200)
insert into spj values('s4','p5','j1',100)
insert into spj values('s4','p6','j3',300)
insert into spj values('s4','p6','j4',200)
insert into spj values('s5','p2','j4',100)
insert into spj values('s5','p3','j1',200)
insert into spj values('s5','p6','j2',200)
insert into spj values('s5','p6','j4',500)
select * from spj

---------------------------------------------------------------------------------------------------------------------------------


--��4����

----(1)��
select distinct sno from spj where jno ='j1'

----(2)��
select distinct sno from spj where jno ='j1'and pno='p1'

----(3)��
select distinct sno 
from spj 
where jno ='j1'
      and pno in
         (select pno 
          from p 
          where color='��')

----(4)��
select jno
from j
where not exists
(select *
 from spj,s,p
 where spj.jno=j.jno
   and spj.sno=s.sno
   and spj.pno=p.pno
   and s.city='���'
   and p.color='hong');

----(5)��
SELECT JNO 
FROM SPJ SPJX
WHERE NOT EXISTS
	(SELECT *
	FROM SPJ SPJY
	WHERE SPJY.SNO='S1'AND NOT EXISTS
	(SELECT *
	FROM SPJ SPJZ
	WHERE SPJZ.SNO=SPJX.SNO
	AND SPJZ.CNO=SPJY.CNO))



---------------------------------------------------------------------------------------------------------------------------------


--��5����

----(1)��
select sname,city from s 

----(2)��
select pname,color,weight from p

(3)
SELECT JNO
FROM SPJ
WHERE SNO='S1';
(4)
SELECT P.PNAME,SPJ.QTY
FROM SPJ,P
WHERE SPJ.PNO=P.PNO AND JNO='J2';
(5)
SELECT DISTINCT PNO
FROM SPJ
WHERE SNO IN
	(SELECT SNO
	FROM S
	WHERE CITY='�Ϻ�');

----(6)��
select jname from j where jno in(select jno from spj where sno in(select sno from s where city='�Ϻ�'))

----(7)��
select jno
from j
where not exists
       (select *
        from spj,s
        where spj.jno=j.jno and spj.sno=s.sno and s.city='���'

----(8)��
update p set color='��' where color='��'

----(9)��
update spj 
set sno='S3'
WHERE SNO='S5' AND PNO='P6'AND JNO='J4'

----(10)��
DELETE 
FROM S
WHERE SNO='S2';

DELETE 
FROM SPJ
WHERE SNO='S2';

----(11)��
insert into spj values ('s2','p4','j6',200)


------------------------------------------------------------------------------------------------------------------------------

--��11����

CREATE VIEW J1_SPJ
AS
SELECT SNO,PNO,QTY
FROM SPJ
WHERE JNO='J1'
(1)
SELECT PNO,QTY
FROM J1_SPJ
(2)
SELECT PNO,QTY
FROM J1_SPJ
WHERE SNO='S1'

------------------------------------------------------------------------------------------------------------------------------

--��12����

----(1)��
grant insert on  s to ���� with grant option  

                                
----(2)��
grant update(qty),select on spj to ������


