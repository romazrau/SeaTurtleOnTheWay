-- 建立 Deom 資料用
---------------------------------------
USE SeaTurtleOnTheWay;
GO

--清空資料表
--DELETE FROM Member.Member;


---------------------------------------------------------------------------------------
-- 會員
INSERT INTO Member.tMember ( fAccount, fPassword, fName, fBirthdate, fIdentifyId, 
                            fAddress, fCity, fCeilphoneNumber, fCoins, 
							fGender, fPhotoPath, fAccountTypeId, fIntroduction ) 
VALUES ('romazrau', '55688app', '饒孝天', '2000/02/20', 'A222222222', 
        '南港區南港路2段222號2樓之2', '台北市', 0989859112, 2222,
		'女', 'member/id1.jpg', 1, '沙漠中一無所有，一無所有非人所求也。'), 
		('AndyKao123', 'j123456789', '郭安迪', '1987/08/07', 'O222132435', 
        '南投縣魚池鄉富錦路33-1號', '南投縣', 0934999444, 2567,
		'男', 'member/id2.jpeg', 2,'幻想拯救世界的積極環保人士一枚'),
		('Wwill', 'w134667', '王威比', '1988/02/19', 'A125453792', 
        '中山區民生東路二段78號3樓', '台北市', 0913345168, 3700,
		null, 'member/id3.jpg', 1, '佛系環保人士，盡量隨身攜帶環保餐具，偶爾還是會不爭氣地拿塑膠吸管，淨灘其實蠻好玩的，大家都是有趣的人～'),
		('JL1992', 'ss66789', '劉日', '1992/01/29', 'F229842651', 
        '板橋區中山路二段87號', '新北市', 0921021027, 9999,
		null, 'member/id4.jpeg', 1, '安安你好'),
		('aaa123', 'ww8787', '陳佑銘', '1993/09/06', 'A122465898', 
        '台北市大安區和平東路二段106號11樓', '台北市', 0926324123, 6666,
		'男', null, 1, '這個會員沒有留下什麼'),
		('ddd555', 'ddd888', '蟑笑犬', '2012/4/1', 'A123456789', 
        '台北市中山區林森北路372號2樓', '台北市', 0987948787, 1200,
		'男',  null, 1, '你好 我是跳級生');


-- create Member.tAccountLikeList
INSERT INTO Member.tAccountLikeList ( fGetLikeMemberId, fGiveLikeMemberId )
    VALUES ( 3 , 1 ),
	       ( 3 , 2 ),
		   ( 3 , 4 ),
		   ( 4 , 3 );




---------------------------------------------------------------------------------------
--  社團 
INSERT INTO Community.tCommunity( fName, fStatusId, fDate, fInfo, fImgPath)
VALUES('北區淨灘團',0,'2020/4/16','活動地區以北北基為主，開放大家投票討論下一次淨灘地點～', ''),
      ('熱血跑步魂',1,'2020/7/23','跑步是為了找到內心的平靜，生命要過得好也是如此。', ''),
	  ('寶寶長大拉',0,'2020/1/11','明明東西還很新，快拿出來給下一個需要的寶寶', ''),
	  ('一時暴雷一時爽',2,'2020/5/2','一直暴雷一直爽', '');




---------------------------------------------------------------------------------------
--  活動
insert into Activity.tActivity(fActName,fCreatDate,fActivityDate,fCommunityId,fMemberId,fIntroduction,
            fLimit,fActAttestId,fActTypeId,fActLocation, fCoordinateX, fCoordinateY)  
			-- fActLabelID1,fActLabelID2,fActLabelID3,fActLabelID4,fActLabelID5,fActLocation )
values('2020國家地理路跑-世界地球日50週年','2020/03/09','2020/08/09', null ,4,'https://www.eventpal.com.tw/FOAS/actions/ActivityIndex.action?showTabContent&seqno=9db4bc32-d8ef-473f-8bcd-e17840edab64',
        100,0,0,'台北', 0, 0),
		--'路跑','世界地球日',null,null,null),
	  ('魚取漁囚 - 守護海洋行動體驗特展','2020/03/09','2020/08/09', null, 4,'https://www.google.com',
        Null,0,0,'基隆', 0, 0),
		--'守護海洋','世界地球日',null,null,null),
      ('Plogging淨街慢跑-迪化街','2020/02/13','2020/07/18', null, 4,'https://blog.decathlon.tw/running/sport-knowledge/plogging',
        80,0,2,'台北', 0, 0),
		--'守護海洋','世界地球日',null,null,null),
	  ('環保潛水隊-隊員招募中','2020/04/22','2020/08/03',  null, 4,'https://news.ltn.com.tw/news/local/paper/1286949',
        30,0,2,'台東', 0, 0),
		--'潛水','環保','海洋垃圾','培訓',null),
	  ('臉部平權運動臺北國道馬拉松','2020/05/01','2020/09/06', null, 4,'https://www.sportsnet.org.tw/20200308_web/',
        50,0,2,'台北', 0, 0),
		--'潛水',null,null,null,null),
	  ('世界環境清潔日 相約海洋淨灘','2020/06/12','2020/09/15', null, 4,'http://letsdoittaiwan.tw/2018worldcleanupday/coastline/',
        10,0,2,'台東', 0, 0),
		--'淨灘',null,null,null,null),
	  ('天母二手市集','2020/09/07','2020/10/13', null, 4,'https://vivawei.tw/tianmu-market/',
        150,0,2,'台北', 0, 0), --,'二手市集','跳蚤市場','挖寶趣','斷捨離',null),
	  ('鳥兒哪裡去八里濕地野鳥觀察','2020/08/01','2020/08/22', null, 1,'https://www.google.com',
        20,0,0,'新北', 0, 0), --,'鳥類觀察','生態觀察','踏青',null,null),
	  ('城市獵人-富陽生態公園夜觀','2020/08/10','2020/10/10', 0, 1,'https://www.google.com',
        20,0,0,'新北', 0, 0), --'鳥類觀察','生態觀察','踏青',null,null),
      ('大風吹，吹什麼? 園藝寶貝交換活動','2020/06/10','2020/07/20', 0, 1,'https://www.google.com',
        Null,0,4,'新北', 0, 0), --'園藝','二手市集','花卉',null,null),
	  ('荒野保護協會【2020工作假期】萬里工作日','2020/06/15','2020/08/08',1,5,'https://www.sow.org.tw/civicrm/event/info?reset=1&id=9075',
        Null,0,0,'新北', 0, 0), --'荒野保護協會','環保','棲地工作',null,null),
	  ('【愛海無距~誰是沙害者】~ 2020國際淨灘行動','2020/07/27','2020/09/19',0,5,'https://www.sow.org.tw/civicrm/event/info?reset=1&id=9568',
        60,0,1,'新北', 0, 0), --'荒野保護協會','環保','棲地工作',null,null),
	  ('2020筏子溪常態性淨溪','2020/06/02','2020/08/01',1,5,'https://www.sow.org.tw/civicrm/event/info?reset=1&id=9374',
        30,0,0,'花蓮', 0, 0),  --'淨溪','荒野保護協會','環保','踏青','環保行動'),
	  ('2020植樹','2020/05/03','2020/06/30',1,6,'https://udn.com/news/story/7324/4400884',
        20,0,0,'台中', 0, 0),  --'環保','城市綠洲',null,null,null),
	  ('PUMA環保愛地球 ','2020/06/06','2020/08/30',0,6,'https://www.puma-nightrun.com.tw/competition_info.php',
        50,0,1,'花蓮', 0, 0),  --'環保','路跑',null,null,null),
	  ('換換二手衣物換換愛','2020/10/20','2020/11/08',0,2,'https://www.google.com',
        null,0,0,'彰化', 0, 0),  --'換物','二手','交流','環保愛地球','環保小尖兵'),
	  ('綠的手作坊-漂流木新生命','2020/09/07','2020/10/01',0,2,'https://www.google.com',
        15,0,0,'高雄', 0, 0),  --'漂流木','環保','手作','環境行動','環保愛地球'),
	  ('篇鄉關懷，愛心捐物','2020/05/04','2020/08/06',1,2,'https://www.google.com',
        null,0,4,'高雄', 0, 0)   --'原民','捐物','愛心關懷','環保行動','環保愛地球')
	  



