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


