DROP TABLE IF EXISTS Account;

CREATE TABLE Account
(
accountnum CHAR(3),	-- �����˺�
total FLOAT		-- �˻����
);

INSERT INTO Account VALUES(101,50);
INSERT INTO Account VALUES(102,100);

SELECT * FROM Account