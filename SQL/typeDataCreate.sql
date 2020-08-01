-- 建立固定type 資料用
---------------------------------------
USE SeaTurtleOnTheWay;
GO

-- create Member.tAccountType data
INSERT INTO Member.tAccountType ( fId,fAccountType, fAccountAuthority ) 
VALUES (0,'管理員', 3),
       (1,'普通會員', 0), 
       (2,'公眾人物', 1),     --大眾人物類
       (3,'白鯨會員', 1),     --贊助大大
       (4,'白鯨公眾人物', 1);
