USE SeaTurtleOnTheWay;
GO


--會員權限
INSERT INTO Member.tAccountType
	( fId,fAccountType, fAccountAuthority )
VALUES
	(0, '管理員', 5),
	(1, '普通會員', 1),
	(2, '公眾人物', 2),
	--大眾人物類
	(3, '白鯨會員', 2),
	--贊助大大
	(4, '白鯨公眾人物', 2),
	(5, '訪客', 0);


---------------------------------------------------------------------------
--社團參與者權限
INSERT INTO Community.tAccessRight
	(fId,fName)
VALUES
	(0, '非會員成員'),
	(1, '審核中'),
	(2, '一般會員'),
	(3, '社團管理者');



--社團狀態
INSERT INTO Community.tStatus
	(fId,fName)
VALUES(0, '停權'),
	(1, '開放'),
	(2, '私密');







---------------------------------------------------------------------------
-- 活動參與者狀態標籤
insert into Activity.tJoinType
	(fId,fJoinName)
values
	(0, '感興趣'),
	(1, '我要參加(候補)'),
	(2, '參加'),
	(3, '退出'),
	(4, '未出席'),
	(5, '完成');


-- 活動狀態標籤
insert into Activity.tActivityType
	(fId,fStatusName)
values
	(0, '待審核'),
	(1, '尚未開始'),
	(2, '進行中'),
	(3, '結算中'),
	(4, '結束');


-- 活動認證狀態標籤
insert into Activity.tAttestType
	(fId, fAttestName, fPayCoin)
values
	(0, '待審核', 0),
	(1, '普通聚會', 0),
	(2, '小海龜活動', 500),
	(3, '白鯨活動', 1000),
	(4, '地球之母活動', 5000);


-- 活動主標籤
insert into Activity.tActivityMainLabel
	(fId, fLabelName)
values
	(0, '其他'),
	(1 , '志工活動'),
	(2, '環境清潔'),
	(3, '自然教育'),
	(4, '二手市集'),
	(5, '運動'),
	(6, '線上活動');


-- 活動標籤
insert into Activity.tActivityLabel
	(fLabelName)
values
	('潛水'),
	('世界地球日'),
	('淨街'),
	('環保'),
	('阿里山'),
	('雲端'),
	('2020'),
	('路跑'),
	('停一下往山林'),
	('斯巴達'),
	('障礙賽'),
	('普悠瑪'),
	('鐵人三項'),
	('黃明志'),
	('虛擬演唱會'),
	('AR'),
	('好想出去走'),
	('高雄'),
	('淨灘'),
	('健行'),
	('金山'),
	('淨海'),
	('一件好事'),
	('Discovery'),
	('衫林溪'),
	('擁抱大自然'),
	('貓咪照顧'),
	('關懷流浪動物'),
	('銀髮族'),
	('公館'),
	('跳蚤市集'),
	('舊衣'),
	('寵物音樂會'),
	('假新聞'),
	('名家系列'),
	('偏鄉教育'),
	('研習營'),
	('教育'),
	('共勉之'),
	('浪浪'),
	('義賣'),
	('領養代替購買'),
	('刺青'),
	('剪髮'),
	('瑜珈'),
	('公益')    ,
	('初學者友善'),
	('周末活動'),
	('古物'),
	('野柳'),
	('環境保護'),
	('師大夜市'),
	('就缺你一個'),
	('海深館'),
	('海洋'),
	('夜宿'),
	('鐵馬'),
	('紅樹林'),
	('二手換物'),
	('油畫'),
	('攝影'),
	('鏡頭'),
	('二手'),
	('珊瑚礁'),
	('海洋關懷'),
	('老樹'),
	('體檢'),
	('Python'),
	('工程師'),
	('復育'),
	('生態教室'),
	('生態導覽'),
	('天使秘境'),
	('夢湖'),
	('關渡'),
	('自然生態'),
	('志工'),
	('認識自己的城市'),
	('綠色生活'),
	('習慣成自然'),
	('回收再利用'),
	('手作'),
	('親子'),
	
	('運動顧環保'),
	('plogging');
	     


