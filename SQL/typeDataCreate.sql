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


---------------------------------------------------------------------------
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


---------------------------------------------------------------------------
-- 活動參與者狀態標籤
insert into Activity.tJoinType(fId,fJoinName)
values (0,'感興趣'),  (1,'我要參加(候補)'),  (2,'參加'),  
       (3,'退出'),    (4,'未出席'),         (5,'完成');


-- 活動狀態標籤
insert into Activity.tActivityType(fId,fStatusName)
values (0,'待審核'), (1,'尚未開始'), (2,'進行中'), (3,'結算中'), (4,'結束');


-- 活動認證狀態標籤
insert into Activity.tAttestType(fId, fAttestName, fPayCoin)
values (0,'待審核', 0), (1, '普通聚會', 0), (2, '小海龜活動', 500), 
       (3,'白鯨活動', 1000), (4, '地球之母活動', 5000);


-- 活動主標籤
insert into Activity.tActivityMainLabel(fId, fLabelName)
values (0, '其他'),(1 , '淨灘'), (2, '路跑'), (3, '環境教育'), (4, '二手市集');


-- 活動標籤
insert into Activity.tActivityLabel(fLabelName)
values ('潛水'), ('世界地球日'), ('淨街'), ('環保');


---------------------------------------------------------------------------
-- 訂單狀態
Insert Into Sales.tOrdersStatus (fId,fStatus) 
Values (1,'訂單成立'),
       (2,'訂單取消'),
       (3,'商品待出貨'),
       (4,'商品已出貨'),
       (5,'商品已送達'),
       (6,'訂單已結算');

-- 交貨方式
Insert Into Product.tDelivery (fId,fDelivery) 
Values (1,'面交'),
       (2,'郵寄'),
       (3,'宅配'),
       (4,'7-11店到店'),
       (5,'全家店到店'),
       (6,'OK店到店'),
       (7,'萊爾富店到店'),
	   (8,'面交+郵寄'),
	   (9,'面交+宅配'),
	   (10,'面交+7-11店到店'),
	   (11,'面交+全家店到店'),
	   (12,'面交+OK店到店'),
	   (13,'面交+萊爾富店到店'),
	   (14,'郵寄+宅配'),
	   (15,'郵寄+7-11店到店'),
	   (16,'郵寄+全家店到店'),
	   (17,'郵寄+OK店到店'),
	   (18,'郵寄+萊爾富店到店'),
	   (19,'宅配+7-11店到店'),
	   (20,'宅配+全家店到店'),
	   (21,'宅配+OK店到店'),
	   (22,'宅配+萊爾富店到店'),
	   (23,'7-11店到店+全家店到店'),
	   (24,'7-11店到店+OK店到店'),
	   (25,'7-11店到店+萊爾富店到店'),
	   (26,'全家店到店+OK店到店'),
	   (27,'全家店到店+萊爾富店到店'),
	   (28,'OK店到店+萊爾富店到店');