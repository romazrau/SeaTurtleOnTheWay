USE SeaTurtleOnTheWay;
GO



--會員
INSERT INTO Member.tMember
	( fAccount, fPassword, fName, fBirthdate, fMail,
	fAddress, fCity, fCeilphoneNumber, fCoins,
	fPhotoPath, fAccountTypeId, fIntroduction )
VALUES
	('root', 'FAlonDAfaISgood666', '管理員', '2000/02/20', 'cycle2link@gmail.com',
		'復興南路一段390號2樓', '台北市', 0989859112, 100000,
		null, 0, '沙漠中一無所有，一無所有非人所求也。'),
	('guest', 'badiii7777', '訪客', '2000/02/20', 'cycle2link@gmail.com',
		'復興南路一段390號2樓', '台北市', 0989859112, 0,
		null, 5, '沙漠中一無所有，一無所有非人所求也。'),
	('romazrau', '55688app', '饒孝天', '2000/02/20', 'A222222222@gmail.com',
		'南港區南港路2段222號2樓之2', '台北市', 0989859112, 2222,
		'member/id1.jpg', 1, '沙漠中一無所有，一無所有非人所求也。'),
	('AndyKao123', 'j123456789', '郭安迪', '1987/08/07', 'O222132435@gmail.com',
		'南投縣魚池鄉富錦路33-1號', '南投縣', 0934999444, 2567,
		'member/id2.jpeg', 2, '幻想拯救世界的積極環保人士一枚'),
	('Wwill', 'w134667', '王威比', '1988/02/19', 'A125453792@gmail.com',
		'中山區民生東路二段78號3樓', '台北市', 0913345168, 3700,
		'member/id3.jpg', 1, '佛系環保人士，盡量隨身攜帶環保餐具，偶爾還是會不爭氣地拿塑膠吸管，淨灘其實蠻好玩的，大家都是有趣的人∼'),
	('JL1992', 'ss66789', '劉日', '1992/01/29', 'F229842651@hotmail.com',
		'板橋區中山路二段87號', '新北市', 0921021027, 9999,
		'member/id4.jpeg', 1, '安安你好'),
	('aaa123', 'ww8787', '陳佑銘', '1993/09/06', 'A122465898@gmail.com',
		'台北市大安區和平東路二段106號11樓', '台北市', 0926324123, 6666,
		null, 1, '這個會員沒有留下什麼'),
	('ddd555', 'ddd888', '蟑笑犬', '2012/4/1', 'A123456789@gmail.com',
		'台北市中山區林森北路372號2樓', '台北市', 0987948787, 1200,
		null, 1, '你好 我是跳級生'),
	('monokuma', 'monokuma', '黑白熊', '1989/6/15', 'monokuma@gmail.com',
		'新北市板橋區新站路28號', '台北市', 0963125487, 1200,
		'member/id5.png', 1, '讓大家都絕望吧!!!'),
	('intensecattw', 'intensecattw', '過激貓', '1990/8/20', 'intensecattw@gmail.com',
		'台中市大雅區永和路124-5號', '台中市', 0958714895, 1200,
		'member/id6.png', 1, '過激就是一切'),
	('Makoto161', 'Makoto161', '苗木誠', '1992/2/05', 'Makoto161@gmail.com',
		'桃園市桃園區長沙街', '桃園市', 0932888168, 1200,
		'member/id7.png', 1, '超高校級的「希望」'),
	('Kirigiri917', 'Kirigiri917', '霧切', '1993/3/07', 'Kirigiri917@gmail.com',
		'新北市中和區中山路三段122號', '新北市', 0977123587, 1200,
		'member/id8.png', 1, '超高校級的「偵探」'),
	('Nanami314', 'Nanami314', '七海', '1991/3/14', 'Nanami314@gmail.com',
		'宜蘭縣宜蘭市縣政北路2號', '宜蘭縣', 0912555369, 1200,
		'member/id9.png', 1, '超高校級的「遊戲玩家」'),
	('ufo999', 'st666666', '林邁克', '1963/11/08', 'ufo999@hotmail.com',
		'台中市西屯區文華路60號', '台中市', 0966956132, 166,
		null, 1, '地方角頭'),
	('D0922343434', 'A123456789', '蘇菲', '2002/09/03', 'D0922343434@gmail.com',
		'台中市北屯區四平路236號', '台中市', 0922343434, 50,
		null, 1, '熱愛棒球，家旁邊就是棒球場'),
	('light5964', 'Fccasood666', '熊貓', '1998/02/20', 'light5964@gmail.com',
		'高雄市新興區南台路73巷1號', '高雄市', 0912456897, 100000,
		null, 2, '土生土長高雄人'),
	('sasd1348t', 'FAlonD997x', '柯林頓', '1983/01/02', 'sasd1348t@gmail.com',
		'高雄市三民區力行路67-39', '高雄市', 0933565789, 1450,
		null, 1, '邊緣人'),
	('soopaaa111', 'ssapo66', '管理員', '2000/02/20', 'soopaaa111@gmail.com',
		'高雄市前鎮區草衙中街46巷15-1', '高雄市', 0978159666, 870,
		null, 2, '手搖飲愛好者'),
	('Daenerys333', 'Daenerys123456', 'Daenerys', '1985/05/12', 'Daenerys1985@gmail.com',
		'中正區中華路二段307巷', '台北市', 0985635214, 4589,
		'member/id10.jpg', 2, '丹妮莉絲·坦格利安（Daenerys Targaryen）是喬治·R·R·馬丁（George R. R. Martin）的《冰與火之歌》系列小說中的虛構人物，以及英國女演員艾米莉亞·克拉克（Emilia Clarke）飾演的電視改編劇《權力遊戲》。'
		),
	('Tyrion333', 'Tyrion123456', 'Tyrion', '1987/05/23', 'Tyrion1985@gmail.com',
		'大安區師大路39巷', '台北市', 0985635214, 209,
		'member/id11.jpg', 2, '提利昂·蘭尼斯特（Tyrion Lannister）的暱稱是Halfman或Imp，後來又改名為Hugor Hill，是美國作家喬治·R·R·馬丁（George RR Martin）的《冰與火之歌》（A Song of Ice and Fire）系列小說中的虛構人物。'
		),
	('Cersei333', 'Cersei123456', 'Cersei', '1968/11/23', 'Cersei1968@gmail.com',
		'大安區羅斯福路四段1號', '台北市', 0985625414, 22245,
		'member/id12.jpg', 2, '瑟曦·蘭尼斯特（Cersei Lannister）是美國作家喬治·R·R·馬丁（George R. R. Martin）創作的《冰與火之歌》系列奇幻小說中的虛構人物，其電視改編版《權力遊戲》由英國女演員琳娜·海莉（Lena Headey）飾演。'
		),
	('Arya333', 'Arya123456', 'Arya', '1992/04/23', 'Arya1992@gmail.com',
		'松山區南京東路四段2號', '台北市', 0912525414, 1225,
		'member/id13.jpg', 2, '艾麗婭·史塔克（Arya Stark）是美國作家喬治·R·R·馬丁（George R. R. Martin）的《冰與火之歌》史詩般的奇幻小說系列中的虛構人物。'
		),
	('Jaime333', 'Jaime123456', 'Jaime', '1969/12/23', 'Jaime1969@gmail.com',
		'大安區臨江街40巷1弄', '台北市', 0985652525, 300,
		'member/id14.jpg', 2, '詹姆·蘭尼斯特（Jaime Lannister）是美國作家喬治·R·R·馬丁（George R. R. Martin）創作的《冰與火之歌》系列奇幻小說中的虛構角色，其電視改編本是《權力遊戲》。'
		)
;






---------------------------------------------------------------------------------------
--  社團 
INSERT INTO Community.tCommunity
	( fName, fStatusId, fDate, fInfo, fImgPath)
VALUES('北區淨灘團', 1, '2020/4/16', '活動地區以北北基為主，開放大家投票討論下一次淨灘地點∼', ''),
	('熱血跑步魂', 1, '2020/7/23', '跑步是為了找到內心的平靜，生命要過得好也是如此。', ''),
	('寶寶長大拉', 1, '2020/1/11', '明明東西還很新，快拿出來給下一個需要的寶寶', ''),
	('一時暴雷一時爽', 2, '2020/5/2', '一直暴雷一直爽', ''),
	('我要當流浪動物義工救援團隊', 1, '2020/7/01', '我要當流浪動物義工救援團隊需要真正以實際行動幫助流浪動物的您來參加我們行列，希望能集合大家力量以真正實際行動關懷流浪動物，我們也願意跟任何關懷流浪動物團體一起配合成長。', 'community/02.jpg'),
	('北部地區志工活動資訊交流站', 1, '2020/8/16', '這裡是一個提供所有社會大眾、服務性社團、志工團隊、志工運用單位相互交流的平台！', 'community/01.jpg'),
	('農業栽培交流', 1, '2020/8/16', '農業技術交流都可以彼此分享', ''),
	('鳥類辨識與特性觀察探討', 1, '2020/9/20', '愛好鳥類的社團，鼓勵團員從網路互動中學習如何辨識鳥類，以及分享觀察心得。', ''),
	('How to Save the World by 2030', 1, '2020/03/30', 'The influx of life-changing technologies has and is transforming the world as we know it by the seconds. Whether it’s the latest developments in artificial intelligence or quantum computing, we’re constantly reminded the vital role technology plays in making society richer, smarter, and more efficient. However, one aspect that often goes under the radar escapes a mention here is the impact tech is having on the environment, and how - if at all - it can prevent any further damage to the planet.', 'community/03.jpg'),
	('用Javascript改變Cimate Change', 1, '2020/01/01', '宅宅的逆襲,我們用Javascript為環境盡一份心力', 'community/04.jpg')
;

INSERT INTO Community.tMemberList
	(fCommunityId,fMemberId,fJoinDate,fAccessRightId)
VALUES(1, 2, '2020/4/16', 3),
	(1, 3, '2020/4/18', 2),
	(1, 4, '2020/4/20', 2),
	(1, 6, '2020/4/16', 2),
	(1, 7, '2020/7/30', 3),
	(2, 2, '2020/7/30', 2),
	(2, 4, '2020/7/30', 2),
	(2, 5, '2020/7/30', 2),
	(2, 6, '2020/7/30', 3),
	(2, 7, '2020/7/30', 2),
	(5, 10, '2020/7/18', 1),
	(5, 9, '2020/7/19', 2),
	(6, 12, '2020/7/22', 1),
	(6, 13, '2020/7/22', 2),
	(9, 21, '2020/02/09', 3),
	(9, 22, '2020/09/09', 2),
	(9, 23, '2020/03/09', 2),
	(9, 10, '2020/09/01', 0),
	(10, 20, '2020/05/23', 3),
	(10, 22, '2020/09/09', 2),
	(10, 23, '2020/03/09', 2),
	(9, 15, '2020/09/01', 0),
	(9, 16, '2020/09/15', 0);

---------------------------------------------------------------------------------------
--  社團文章
INSERT INTO Community.tPost
	( fMemberId, fCommunityId, fPostTime, fContent, fImgPaths )
VALUES
	(10, 5, '2020/7/30 13:05', '有一隻路邊浪浪，在固定點已餵食一段時間，目前遭遇困境，因浪浪徘徊地點的那戶人家強烈反彈，周遭只有他一戶人家，認為我們常餵食造成狗狗在他家徘徊造成他們不便，浪浪年紀偏大，餵食了兩三年還不讓人摸祂，目前不知道該怎麼辦？家裡不方便養狗，想幫浪浪移地點浪浪又不給碰，也不知道新地點牠喜不喜歡，地點在台南善化，不知道有沒有人可以收留牠或幫忙移到新地點讓牠可以有遮風避雨的地方，我們可以繼續提供糧食飼料看醫生的錢都沒關係，謝謝', null),
	(9, 5, '2020/9/01 16:23', '在安南區頂安街 看到這隻混種梗犬（像雪納瑞）在路上迷航，好幾度差點被車撞，靠近看眼睛似乎已退化看不清楚，身上穿了兩件衣服 一件掉了一半拖在身上。  當下載著小孩幫不上他什麼忙，後來他轉進巷內了', 'community_article/01.jpg'),
	(12, 6, '2020/9/11 12:15', '台北市政府水利工程處第四期生態志工開始招募囉！凡是對水文、自然生態、環境保育、導覽解說、棲地維護有興趣的朋友，歡迎大家的加入唷！', 'community_article/02.jpg'),
	(13, 6, '2020/9/13 08:20', '【第十二屆全國健康日 一日乖孫志工大募集！】缺服務學習時數和志工服務證明書嗎？希望有更多社區服務經驗，充實暑期生活？熱心公益，想為國人健康貢獻一己之力？現正招募「一日乖孫志工」，協助民眾量測腰圍及血壓！第十二屆「全國健康日」於全台 7-ELEVEN 千禧血壓站門市 舉辦免費代謝症候群健檢活動當志工服務之餘還能回去應用活動所學，關心家人的健康！【來當志工可以...】拿到志工服務證明書！(服務時數 6 或 8 小時)免費線上教育訓練，學習如何量測和認識健康標準值！可以實際接觸社區民眾，練習如何從事健康服務，經驗難得！特別歡迎高中職及大專院校學生報名參加！', 'community_article/03.jpg'),
	(12, 6, '2020/08/02 10:54', '[愛無國界，心手相連 -- 空中志工訓練會]在路上看到身心障礙者，因為不知道該不該協助而猶豫不前。你有過這樣的經驗嗎？身心障礙類別十分多元，在未詢問與不了解身心障礙者的狀況下，冒昧的協助反而容易使他們受傷或不知所措。那我們要如何知道身心障礙者需不需要協助，以及要如何提供協助呢？現在有機會，能讓我們更了解他們的需求！邀請您，報名參與伊甸與馬來西亞雙福殘障自強發展協會合辦的空中志工訓練會，透過講師分享、障礙體驗活動來認識不同障別，培養更正面的服務心態。時間：8 月 22 日、23 日 09:00-17:30願我們都用更體貼的方式，實踐助人的意願！', 'community_article/03.jpg'),
	(5, 2, '2020/07/31 07:05', '[揪團]參加國家地理頻道世界地球日賽事,挑戰組，歡迎設有一同報名', null),
	(6, 3, '2020/08/08 22:58', '可以請教一下嗎?真的不知道要怎麼教育我的寶貝他已經沒有爸爸的事實。孩子兩歲多而已，而他也似乎漸漸習慣沒有父親這個東西。 自從6月，那個人渣因為所做的那些違背婚姻違背道德的事件被一一揭發，他索性選擇逃走不面對，後來逃回澎湖過他想要的逍遙的日子', null),
	(4, 5, '2020/08/19 10:23', '[送養] 可愛小黑喵,因為目前還在救更小的貓兩隻、準備結紮的母貓一隻，空間有限，希望有緣人收狀態 穩定的黑輪、米血 有興趣可以找我看更多照片', null),
	(8, 5, '2020/08/28 14:02', '[認養]昨天被棄養在宮廟的小幼,40天大的小男生 沉穩乖巧 神明看顧著的孩子 預計20天後打第一劑預防針,開放認養', null),
	(7, 4, '2020/08/21 23:13', '館長開直播身中兩槍，救護車來了補充說明 好像是上次騷擾他那個館長說 這次如果不幸救不回來請大家繼續弘揚他的精神', null),
	(18, 9, '2020/07/08 08:13', '[Covid19武漢肺炎]超過四百萬人確診的2019新型冠狀病毒/武漢肺炎(2019-nCoV)仍壟罩全球，感謝台灣政府與民眾共同防疫有成，至今已經超過一個月無本土病例，令人振奮。而立法院在5/8通過了追加1500億紓困振興特別預算，台灣已經從防疫、紓困慢慢走向振興階段。在台灣諸多關注「綠色紓困」的公民團體聲明下，立法院在1500億的紓困預算增加了排除條款，這筆納稅人的救急錢不補助知法犯法的新增建違章工廠，並要求經濟部應會同相關機關，建立完整查核機制，確保工廠紓困僅提供給合法工廠以及既有未登記工廠。雖然團體希望讓既存的未登記工廠於納管後再行紓困，遺憾未能通過決議；不過，這仍是謹守法律界線的第一步，也是綠色紓困第一階段的重要概念——零傷害原則。', 'community_article/05.jpg'),
	(18, 21, '2020/08/08 09:30', '綠色保育_聆賞黃嘴角鴞的嘹亮夜鳴!都市人要接受保育觀念相對容易，但生活在山野、依靠農業維生的西寶居民，卻是站在保育與生計衝突的第一線。「以前，蔬果要碩大又沒蟲咬才賣得掉。田地有蟲、有草，代表農民不認真。」張榮城回憶做慣行耕作的期間，多位農友為了讓作物長得又大又美，在長期噴灑農藥後英年早逝。而野生動物對農作造成威脅，擅於捕獵的太魯閣族人便設下陷阱，以絕後患。', 'community_article/06.jpg'),
	(18, 18, '2020/08/15 14:22', '[照片分享]活動美照', 'community_article/07.jpg'),
	(19, 19, '2020/06/31 11:22', '隨著網絡的發展、大數據時代的來臨，獲取資料、整理資料，甚至到資料驅動決策已經是企業不可或缺的基礎競爭能力了。而在2020年CIO加值型策略採用中，與數據相關的決策佔了超過一半，透過資料獲取商業價值，帶來的效益遠超過我們想像，所以說資料是新的石油不容置疑。', 'community_article/08.jpg'),
	(19, 22, '2020/07/16 07:34', '[新聞]IT救地球！這款程式碼能守護「亞馬遜」 工程機械一進森林就關機,還記得去年亞馬遜發生大火多日，也讓全球的人意識到大自然的脆弱，那麼有沒有什麼方法能夠阻止天災呢？也許，靠著科技，我們能夠獲得一點解答。
               當時亞馬遜、印尼飽受野火之苦，但現在還是有不少森林仍持續被砍伐破壞，現在全球就有三分之一的森林面臨消失的危機。這些森林的消失或破壞生態系平衡，讓全球暖化的情況加劇，更影響人類的糧食生產、經濟發展等。
               那該如何保護森林？如果那些破壞森林的器具停擺，森林就不會遭到大規模的破壞了，對吧？所以，知名的數位行銷代理商AKQA就與多個非政府組織(NGO)合作，開發了一款名為「Code of Conscience」的軟體，只要工程機械安裝了這個軟體，進到自然保護區時，就會自動停擺、無法運作，讓森林免於被破壞的危機。
               據AKQA的描述，Code of Conscience會自動抓取聯合國裡的有關自然保護區的相關資訊，同時結合工程機具內的GPS定位系統，一旦這些機具進入自然保護區，Code of Conscience就會阻止機具運作。
               另外，AKQA與NGO也開發一款內建Code of Conscience的晶片，讓款式老舊、沒有GPS定位系統的工程機具也可以在進入森林後「自動關機」。他們將嵌有該晶片的木造玩偶送給全球前十大工程機去製造商的CEO，期盼他們能在機具中植入Code of Conscience。Native Brazilian領導人Chief Raoni Metuktire表示，由衷希望全球工程機具製造商都能夠加入保護森林的行動。
               AKQA表示，森林砍伐已經是全球性議題，而藉由Code of Conscience讓重機械製造商能變成解決問題方案的其中一環。另外，這在經濟上也是可行的，雖然Code of Conscience會讓這些產商少掉一些訂單，但全球環境保護意識持續高漲，植入Code of Conscience的製造商將會引來更多組織的支持。
               目前AKQA已跟多個NGO成功開發出Code of Conscience，他們之後的目標，是希望通過國家立法，要求工程機具都裝有Code of Conscience，藉此剝奪工程機具破壞森林的能力，保護全球環境。', 'community_article/09.jpg')


---------------------------------------------------------------------------------------
--  活動
insert into Activity.tActivity
	(fActName,fCreatDate,fActivityDate,fActivityEndDate,fMemberId,fIntroduction,
	fImgPath, fActLabelID, fMaxLimit,fMinLimit,fActAttestId,fActTypeId,fActLocation, fCoordinateX, fCoordinateY)
values('2020國家地理路跑-世界地球日50週年', '2020/03/09', '2020/08/09 12:00', '2020/08/09 14:00:00' , 4, 'https://www.eventpal.com.tw/FOAS/actions/ActivityIndex.action?showTabContent&seqno=9db4bc32-d8ef-473f-8bcd-e17840edab64',
		'', 2, 100, 10, 0, 0, '台北', 25.071874, 121.5802),
	--'路跑','世界地球日',null,null,null),
	('魚取漁囚 - 守護海洋行動體驗特展', '2020/03/09', '2020/08/09 12:00:00', '2020/08/09 14:00:00', 4, 'https://www.google.com',
		'', 3, Null, Null, 0, 0, '基隆', 25.007839, 121.494713),
	--'守護海洋','世界地球日',null,null,null),
	('Plogging淨街慢跑-迪化街', '2020/02/13', '2020/07/19 13:00:00', '2020/07/19 16:00:00', 4, 'https://blog.decathlon.tw/running/sport-knowledge/plogging',
		'', 2, 80, 5, 0, 2, '台北', 25.133756, 121.36425),
	--'守護海洋','世界地球日',null,null,null),
	('環保潛水隊-隊員招募中', '2020/04/22', '2020/09/01 10:00:00', '2020/08/09 14:00:00', 4, 'https://news.ltn.com.tw/news/local/paper/1286949',
		'', 0, 30, Null, 0, 2, '台東', 25.283227, 121.525955),
	--'潛水','環保','海洋垃圾','培訓',null),
	('臉部平權運動臺北國道馬拉松', '2020/05/01', '2020/09/06 18:00:00', '2020/09/06 20:00:00', 4, 'https://www.sportsnet.org.tw/20200308_web/',
		'', 2, 50, Null, 0, 2, '台北', 24.979212, 121.624832),
	--'潛水',null,null,null,null),
	('世界環境清潔日 相約海洋淨灘', '2020/06/12', '2020/08/26 20:00:00', '2020/08/26 22:00:00', 4, 'http://letsdoittaiwan.tw/2018worldcleanupday/coastline/',
		'', 1, 10, Null, 0, 2, '台東', 25.230442, 121.645088),
	--'淨灘',null,null,null,null),
	('天母二手市集', '2020/09/07', '2020/09/01 12:00:00', '2020/09/01 15:00:00', 4, 'https://vivawei.tw/tianmu-market/',
		'', 4, 150, 20, 0, 2, '台北', 25.117735, 121.528873),
	--,'二手市集','跳蚤市場','挖寶趣','斷捨離',null),
	('鳥兒哪裡去八里濕地野鳥觀察', '2020/08/01', '2020/08/02 16:00:00', '2020/08/02 20:00:00', 1, 'https://www.google.com',
		'', 3, 20, Null, 0, 0, '新北', 25.116668, 121.383476),
	--,'鳥類觀察','生態觀察','踏青',null,null),
	('城市獵人-富陽生態公園夜觀', '2020/08/10', '2020/08/20 17:00:00', '2020/08/20 21:00:00', 1, 'https://www.google.com',
		'', 3, 20, Null, 0, 0, '新北', 25.0151, 121.5593),
	--'鳥類觀察','生態觀察','踏青',null,null),
	('大風吹，吹什麼? 園藝寶貝交換活動', '2020/06/10', '2020/08/13 10:00:00', '2020/08/13 18:00:00', 1, 'https://www.google.com',
		'', 4, Null, Null, 0, 4, '新北', 24.161435, 120.670738),
	--'園藝','二手市集','花卉',null,null),
	('荒野保護協會【2020工作假期】萬里工作日', '2020/06/15', '2020/08/08 11:00:00', '2020/08/08 14:30:00', 5, 'https://www.sow.org.tw/civicrm/event/info?reset=1&id=9075',
		'', 3, Null, 5, 0, 0, '新北', 25.178855, 121.673241),
	--'荒野保護協會','環保','棲地工作',null,null),
	('【愛海無距~誰是沙害者】~ 2020國際淨灘行動', '2020/07/27', '2020/08/16 10:00:00', '2020/08/16 14:00:00', 5, 'https://www.sow.org.tw/civicrm/event/info?reset=1&id=9568',
		'', 1, 60, 15, 0, 1, '新北', 24.175516, 120.475388),
	--'荒野保護協會','環保','棲地工作',null,null),
	('2020筏子溪常態性淨溪', '2020/06/02', '2020/09/06 18:00:00', '2020/09/06 20:00:00', 5, 'https://www.sow.org.tw/civicrm/event/info?reset=1&id=9374',
		'', 1, 30, Null, 0, 0, '花蓮', 24.152464, 120.621943),
	--'淨溪','荒野保護協會','環保','踏青','環保行動'),
	('2020植樹', '2020/05/03', '2020/09/01 13:00:00', '2020/09/01 19:00:00' , 6, 'https://udn.com/news/story/7324/4400884',
		'', 3, 20, Null, 0, 0, '台中', 24.167682, 120.755196),
	--'環保','城市綠洲',null,null,null),
	('PUMA環保愛地球 ', '2020/06/06', '2020/08/09 11:00:00', '2020/08/09 15:00:00', 6, 'https://www.puma-nightrun.com.tw/competition_info.php',
		'', 4, 50, Null, 0, 1, '花蓮', 24.193377, 120.732193),
	--'環保','路跑',null,null,null),
	('換換二手衣物換換愛', '2020/10/20', '2020/09/11 12:30:00', '2020/09/11 18:00:00', 2, 'https://www.google.com',
		'', 4, null, 20, 0, 0, '彰化', 24.17301, 120.665932),
	--'換物','二手','交流','環保愛地球','環保小尖兵'),
	('綠的手作坊-漂流木新生命', '2020/09/07', '2020/08/31 10:00:00', '2020/08/31 14:00:00', 2, 'https://www.google.com',
		'', 1, 5, Null, 0, 0, '高雄', 24.20309, 120.618896),
	--'漂流木','環保','手作','環境行動','環保愛地球'),
	('篇鄉關懷，愛心捐物', '2020/05/04', '2020/08/09 15:30:00', '2020/08/09 18:30:00', 2, 'https://www.google.com',
		'', 4, null, Null, 0, 4, '高雄', 24.11126, 120.642929),
	--'原民','捐物','愛心關懷','環保行動','環保愛地球');
	('2020 阿里山雲端路跑', '2020/08/28', '2020/09/20 05:00:00', '2020/09/20 08:30:00', 14, 'https://www.eventpal.com.tw/FOAS/actions/ActivityIndex.action?showTabContent&seqno=b234ff30-f785-4ab3-be7a-499c07ace84f',
		'activity/2020阿里山路跑.jpg', 5, 50, 10, 1, 1, '阿里山國家森林遊樂區外停車廣場(中油阿里山新站旁)(台18線87K處)', 23.5112991, 120.8014838),
	--'阿里山','雲端','2020','路跑')
	('2020 停一下往山林跑系列活動', '2020-07-03', '2020-08-30 5:00', '2020-08-30 7:00', 11, 'https://www.beclass.com/rid=2343bed5ea8dd0635bd5',
		'activity/停一下往山林.jpg', 5, 80, 10, 2, 3, '真武山受玄宮', 24.9088265, 121.5346265),
	--'停一下往山林','路跑')
	('台灣斯巴達障礙跑競賽 - TRAIL 越野跑', '2020-08-30', '2020-10-09 7:30', '2020-10-09 14:30', 10, 'https://kwankwan.kktix.cc/events/10ntcspartan-1qrq',
		'activity/斯巴達.jpg', 5, 100, 20, 3, 1, '新北貢寮', 25.0519184, 121.9204032),
	--'路跑','斯巴達','障礙賽')
	('2020 普悠瑪鐵人三項', '2020-09-10', '2020-10-17 4:40', '2020-10-17 13:00', 9, 'https://bao-ming.com/eb/www/reg.php?activitysn=3985',
		'activity/普悠瑪.jpg', 5, 70, 20, 0, 1, '臺東市森林公園活水湖', 22.7652163, 121.1625769),
	--'路跑','普悠瑪','鐵人三項')
	('好想出去走走。高雄 x 黃明志虛擬演唱會', '2020-05-21', '2020-06-22 20:00', '2020-06-22 22:00', 6, '黃明志的首場線上虛擬演唱會在6/2 晚上8點 正式開唱! 這是黃明志跟高雄市政府觀光局、Yahoo TV 的共同合作 透過 Yahoo TV 全新的 AR 虛擬技術，將他的歌曲結合景點 完成這場相當特別的演出 所以這不只是一場演唱會 更是特別的高雄之旅！',
		'activity/好想走走.jpg', 6, 3000, 5, 3, 4, '線上活動', 1, 1),
	--'黃明志','虛擬演唱會','AR','好想出去走','高雄')
	('2020 Hood to Coast 環保朝聖之路 - 金山淨灘健行', '2020-08-01', '2020-09-12 7:30', '2020-09-12 12:00', 10, '我們將於金山青年活動中心集合，並舉行行前講座，更加深入瞭解環境與「淨灘」的核心意義。接著，一起漫步至下寮海灘，開始協助整理海岸。達成任務後，我們將繼續朝聖之路——前往神秘海岸！一路健行、欣賞風景後回到起點，進行最後的紀念帆布袋絹印。',
		'activity/金山淨灘.jpg', 2, 15, 5, 1, 3, '金山青年活動中心', 25.2261073, 121.6400034),
	--'淨灘','健行','金山','環保')
	('海岸環境教育淨灘活動', '2020-07-22', '2020-09-06 14:30', '2020-09-06 17:00', 13, 'https://www.beclass.com/rid=2443d6a5f30feb5a3e56',
		'activity/海洋環境教育淨灘.jpg', 3, 50, 5, 1, 4, '新北市淡水區六塊厝沙灘', 25.2262509, 121.572151),
	--'淨灘')
	('Discovery 一件好事救海洋 - 基隆淨海', '2020-06-23', '2020-08-15 09:00', '2020-08-15 12:00', 6, 'https://www.discoverychannel.com.tw/saveocean/cleansea.html',
		'activity/基隆淨海.png', 2, 20, 5, 1, 4, '潮境公園', 25.1436376, 121.8009826),
	--'淨海','一件好事','Discovery')
	('杉林溪 - 環教課程：穿林訪花 (擁抱大自然)', '2020-07-11', '2020-09-01 09:00', '2020-09-01 12:00', 13, '環境教育主題: 環境倫理與責任    自然保育    環境科學     資源保育     永續發展  ---------------------------------------------------------------------- 環境教育分段 能力指標 1-2-3 察覺生活周遭人文歷史與生態環境的變遷。3-1-2 能具有好奇心，體認人類在生態中的角色，以及自然環境與人的相互關係。3-2-2 培養對自然環境的熱愛與對戶外活動的興趣，建立個人對自然環境的責任感。3-4-4 願意依循環保簡樸與健康的理念於日常生活與消費行為。教學目標: 1. 認識欣賞中海拔森林步道特色動植物。2. 體認生物與花卉間的依存關係，我們人類應該如何做才能使得環境能永遠維持下去。3. 能理解並落實無痕山林的理念。',
		'activity/衫林溪.jpg', 3, 15, 5, 1, 3, '杉林溪森林生態渡假園區', 23.6394745, 120.7900232),
	--'衫林溪','擁抱大自然')
	('陪他找家 - 貓咪照顧志工', '2020-08-03', '2020-09-01 10:00', '2020-09-30 13:00', 10, 'https://harvest365.org/events/8127',
		'activity/貓咪志工.jpg', 1, 20, 5, 2, 2, '咪可思關懷流浪動物協會', 25.0580828, 121.4829843),
	--'貓咪照顧','關懷流浪動物')
	('愛自在銀髮俱樂部志工', '2020-06-20', '2020-08-17 10:00', '2020-08-31 16:00', 12, 'https://harvest365.org/events/8114',
		'activity/愛自在.jpg', 1, 30, 5, 2, 3, '臺北市中山區南京東路二段 160 號 7 樓', 25.0517348, 121.5322653),
	--'銀髮族')
	('公館市集報名', '2020-08-22', '2020-09-05 17:00', '2020-09-06 22:00', 11, '公館二手市集規則價錢撇步注意事項方法一次報給第一次擺攤的你！公館多次擺攤心得經驗分享，煩惱著買太多衣服都穿不到，家裡太多物品都用不到丟掉可惜，擺攤不難只要有想賣的衣物、小物品都可以帶來，新舊都好，只要有人喜歡有人買，我是為了籌出去玩的旅費，偶爾會和阿倫到公館市集擺攤，這市集每個禮拜六日都有! 這篇教導大家如何報名、一些細節、撇步，供你們參考囉~',
		'activity/公館市集.jpg', 4, 30, 5, 2, 3, '公館創意跳蚤市集', 25.0148355, 121.5299176),
	--'公館','跳蚤市集')
	('Enjoy癮舊衣二手市集', '2020-09-20', '2020-09-28 17:00', '2020-09-28 22:00', 10, '1. 本市集提供二手物品買賣的平台，所有交易皆須符合法令規範，若有違法請買賣雙方自行負相關責任。2. 報名的攤友們若臨時有事不克前來，請於7天前告知主辦單位，否則不予退款。3. 我們只希望有誠意的賣家來出清自己的美物，請不要拿批發的商品來販售，若被發現將列為拒絕往來戶。4. 請注意自身安全及保管好財物，以及身體狀況，有任何問題請自行負責。5. 每個攤位都有自己的主人，請勿掠過城池侵犯到別人的領地(包含公共區域)。6. 本二手市集活動若因故取消，可於公布取消後3天內來訊申請退款。 7. 請勿使用小蜜蜂叫賣8. 請勿販售無密封包裝的食物，並不得試吃9. 若遇天氣預報有颱風等情形，會視情況將活動延期10. 結束擺攤時請將垃圾清潔乾淨。11. 人行道切勿長時間停車，若遭開罰請自行負責。12. 主辦單位保有活動異動及未盡事宜補充權利。',
		'activity/舊衣市集.jpg', 4, 30, 5, 2, 1, '科工館南館', 22.6399149, 120.3205988),
	--'舊衣')
	('夜宿屏東海深館', '2020-08-30', '2020-09-20 18:30', '2020-09-21 18:00', 20, '夜宿海生館並非單純在展缸旁就寢的活動；在正式就寢之前，將由專業的解說人員全程帶領，深入瞭解海生館的點點滴滴。於導覽中認識海洋生態及大眾眼中的海生館；至後場參觀魚缸上方的飼育區，認識飼育員的工作內容及環境，並親自餵食海洋生物；時至夜幕低垂，將再次進入展區，於夜間探索海洋生物們的夜生活。各項活動皆是為夜宿來賓專屬設置，包含了戶外潮間帶生態觀察、特別加演的大洋池餵食，以及海洋生態課程等等，都是您專屬的體驗內容。【夜宿體驗】夜宿海生館活動為兩天一夜的生態體驗遊程，全程包括了海生館兩日入館參觀體驗、六項夜宿海生館體驗遊程、餐食服務將提供當天晚餐、宵夜、次日早餐，以及依所選場域與海洋生物共眠。提醒您:海生館配合中央防疫政策即日(8/23)起將強制落實口罩佩戴事宜，無佩戴者不開放入館！',
		'activity/01.jpg', 3, 10, null, 1, 0, '屏東', 22.046296, 120.698884),
	--'海深館','海洋','夜宿'）
	('金色水岸單車遊', '2020-09-08', '2020-09-20 08:00', '2020-09-20 18:00', 23, '金色水岸自行車行！因為淡水河面映著夕陽所反射出的金色柔柔波光，因此這條自行車道被取名為「金色水岸自行車道」，沿線美麗的風景與知名的觀光景點，使其美名不脛而走。單車遊客能飽覽淡水的人文與自然景觀，路況多屬平坦路段、騎乘時舒適度佳，適合一般大眾攜家帶眷在此騎車及紓解壓力，部分路段樹蔭與遮蔽物較少，提醒單車遊客一定要做好防曬的準備。關渡站 、竹圍站 、紅樹林站都開放非摺疊式自行車進出，自己帶單車的遊客記得從這幾個捷運站出入喔。' ,
		'activity/02.jpg', 3, null, null, 1, '淡水', 25.169239, 121.441418),
	--'鐵馬','紅樹林')
	('一起油畫與二手畫具交易', '2020-09-01', '2020-09-15 14:00', '2020-09-15 18:00', 19, '一起畫畫吧！自帶畫筆與顏料，可順便交易二手的寶貝們唷！',
		'activity/03.jpg', 4, 10, null, 1, 0, '台北', 25.048008, 121.520018),
	--'二手換物','油畫')
	('攝影聚會與鏡頭交易＿大稻埕', '2020-09-02', '2020-10-01 07:30', '2020-10-01 15:00', 16, '歡迎攝影愛好者！活動當天以大稻埕街景為主題拍照交流,拍照結束後有交流時間可以互相買賣鏡頭及相機相關產品',
		'activity/04.jpg', 4, null, null, 1, 0, '台北', 25.059670, 121.513308),
	--'攝影','鏡頭','二手')
	('珊瑚礁體檢志工招募', '2020-08-30', '2020-10-23 10:30', '2020-10-23 17:00', 18, '夯潛水的你，歡迎加入珊瑚礁體檢志工讓潛水活動成為愛海洋的力量，更接近、更了解水下世界的美麗和窘境。希望透過珊瑚礁體檢數據和行動讓社會大眾更加認識平常看不見的海底珊瑚世界及其存在的重要性！',
		'activity/05.jpg', 1, 2, null, 2, 1, '基隆', 25.151071, 121.801049),
	('老樹體檢志工', '2020-09-09', '2020-10-30 08:30', '2020-10-30 17:30', 18, '老樹志工的服務主要是觀察台南市列管在案的老樹狀態。列管的老樹由志工去認養。老樹有每月健檢表，志工們定期觀察後傳到農業局，通報樹的狀況。像颱風來了，樹木斷枝或連根拔起，就要通報。',
		'activity/06.jpg', 1, 10, null, 2, 0, '台南', 23.009596, 120.226742),
	--'老樹','健檢'）
	('線上Python初學者交流', '2020-07-30', '2020-08-29 10:00', '2020-08-29 13:30', 20, '如果對投資深感興趣、想實際操作如何使用Python爬取歷年股價資訊，歡迎來小聚和我們交流唷！',
		'activity/07.jpg', 6, null, null, 1, 3, null, null, null)
,












---------------------------------------------------------------------------------------
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
	('舊衣');






---------------------------------------------------------------------------------------


insert into sMessage.tMessage
	(fMemberID,fContent)
VALUES(1, '成功加入社團'),
	(1, '已加入活動'),
	(2, '成功加入社團'),
	(4, '活動人數不足,活動未成立'),
	(3, '成功加入社團'),
	(5, '等待審核請稍後~')