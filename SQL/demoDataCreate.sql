-- 建立 Deom 資料用
---------------------------------------
USE SeaTurtleOnTheWay;
GO

--清空資料表
--DELETE FROM Member.Member;


-- create Member.tMember data
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





-------  Community  -----------------------------
INSERT INTO Community.tCommunity( fName, fStatusId, fDate, fInfo, fImgPath)
VALUES('北區淨灘團',0,'2020/4/16','活動地區以北北基為主，開放大家投票討論下一次淨灘地點～', ''),
      ('熱血跑步魂',1,'2020/7/23','跑步是為了找到內心的平靜，生命要過得好也是如此。', ''),
	  ('寶寶長大拉',0,'2020/1/11','明明東西還很新，快拿出來給下一個需要的寶寶', ''),
	  ('一時暴雷一時爽',2,'2020/5/2','一直暴雷一直爽', '');
