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


--社團參與者權限
INSERT INTO Community.tAccessRight(fId,fName)
VALUES (1,'審核中'),
	   (2,'一般會員'),
	   (3,'社團管理者');
	   --(0,'非會員成員'),

--社團狀態
INSERT INTO Community.tStatus(fId,fName)
VALUES(0,'開放'),
      (1,'半開放'),
	  (2,'私密');



