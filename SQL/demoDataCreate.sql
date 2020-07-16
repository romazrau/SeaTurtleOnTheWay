-- 建立 Deom 資料用
---------------------------------------
USE SeaTurtleMarket;
GO

--重建資料表
--TRUNCATE TABLE Member.Member;


-- create Member.Member data
INSERT INTO Member.Member ( account, password, name, birthdate, identifyId, 
                            address, city, ceilphoneNumber, coins, 
							gender, education, introduction, accountTypeId ) 
VALUES ('root', '123456789', '阿努比斯', '1999/09/09', 'A123456789', 
        '澎湖縣馬公市171號', '澎湖縣', 0900111222, 21474836,
		null, null, '最高權限管理者', 0), 
		('iampuma', '123456789', 'Puma', '1999/09/09', 'A123456789', 
        '澎湖縣馬公市171號', '澎湖縣', 0900111222, 100,
		null, null, 'I m puma', 1),
		('doggywoofwoof', '123456789', 'Corgi', '1999/09/09', 'A123456789', 
        '澎湖縣馬公市171號', '澎湖縣', 0900111222, 100,
		null, null, 'woof woof', 1),
		('supercutecat', '123456789', 'Corgi', '1999/09/09', 'A123456789', 
        '澎湖縣馬公市171號', '澎湖縣', 0900111222, 100,
		null, null, 'Meooooooooow', 2);


-- create Member.AccountLikeList
INSERT INTO Member.AccountLikeList ( getLikeAccount, giveLikeaccount )
    VALUES ( 'supercutecat', 'iampuma' ),
	       ( 'supercutecat', 'doggywoofwoof' ),
		   ( 'supercutecat', 'root' ),
		   ( 'iampuma' , 'doggywoofwoof');

