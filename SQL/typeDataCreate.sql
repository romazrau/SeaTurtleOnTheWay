-- 建立固定type 資料用
USE SeaTurtleMarket;
GO

-- create Member.AccountType data
INSERT INTO Member.AccountType ( accountTypeId,accountType, accountAuthority ) 
VALUES (1,'普通會員', 0), 
       (2,'認證會員', 1),     --大眾人物類
       (3,'白鯨會員', 1),     --贊助大大
       (4,'白鯨認證會員', 1),
	   (0,'太陽神', 3);
