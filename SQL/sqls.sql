-- 常用指令集
---------------------------------------
USE SeaTurtleOnTheWay;
GO
	

---    刪除資料表用
DELETE FROM  Member.tMember;
DELETE FROM  Activity.tActivity;
DELETE FROM  Community.tCommunity;
DELETE FROM  Community.tMemberList;
DELETE FROM  Community.tPost;
DELETE FROM  Activity.tActivity;
DELETE FROM Activity.tActivityLabel


-- 搜尋範例  --------------------------------------------------
--整個資料庫
select * from Member.tMember;  


-- 選定特定欄位
select fid, fName, fMail from Member.tMember;


-- 設定排序與選取範圍
select fid, fName, fMail 
from Member.tMember
order by fId desc                       --用fId，倒敘排列
OFFSET 5 ROWS FETCH NEXT 2 ROWS ONLY ;  --跳過 5 行，回傳 2 行


-- 增加搜尋條件，與設定別名
 select M.fId, M.fName
 from Member.tMember as M                               --as 進行命名
 where fAccount = 'guest' AND fPassword = 'badiii7777'; --條件


-- 資料表合併，Left join，帳號資料與權限結合
select M.fId, M.fAccount, 
       T.fAccountType as 'account type',          --Join來的欄位要重新命名
	   T.fAccountAuthority as 'account authority' --Join來的欄位要重新命名
from Member.tMember as M             --主資料表設別名
LEFT join Member.tAccountType as T   --Join來的表要設別名
on M.fAccountTypeId = T.fId;         --Join參考，tMember.fAccountTypeId = tAccountType.fId


-- 計算數目，會員參加了幾個社團
select list.fMemberId, count(list.fCommunityId) as '參加了幾個社團'  --count計算
from Community.tMemberList as list   
group by list.fMemberId;           --根據誰做計算


-- 計算數目，增加條件，注意計算的條件用having，不同於搜尋的where
select list.fMemberId, count(list.fCommunityId) as '參加了幾個社團'  --count計算
from Community.tMemberList as list   
group by list.fMemberId              --根據誰做計算
having count(list.fCommunityId) > 2; --條件大於3的


-- 大魔王，多資料表合併輸出
WITH member AS (  
   -- 資料表合併，Left join，帳號資料與權限結合
   select M.fId, M.fAccount, 
       T.fAccountType as 'account type',          --Join來的欄位要重新命名
	   T.fAccountAuthority as 'account authority' --Join來的欄位要重新命名
   from Member.tMember as M             --主資料表設別名
   LEFT join Member.tAccountType as T   --Join來的表要設別名
   on M.fAccountTypeId = T.fId        --Join參考，tMember.fAccountTypeId = tAccountType.fId
),  countMun as (  
   -- 計算數目，會員參加了幾個社團
   select list.fMemberId, count(list.fCommunityId) as '參加了幾個社團'  --count計算
   from Community.tMemberList as list   
   group by list.fMemberId          --根據誰做計算
)  -- 帳號資料與權限結 + 會員參加了幾個社團
   -- 根據前兩個with的資料表做合併
  select mm.*, cm.*   
  from member as mm
  left join countMun as cm
  on mm.fId = cm.fMemberId;   --根據 member id 合併 


  -- 大魔王，繼續延伸
  WITH member AS (  
   -- 資料表合併，Left join，帳號資料與權限結合
   select M.fId, M.fAccount, 
       T.fAccountType as 'account type',          --Join來的欄位要重新命名
	   T.fAccountAuthority as 'account authority'   --Join來的欄位要重新命名
   from Member.tMember as M                       --主資料表設別名
   left join Member.tAccountType as T     --Join來的表要設別名
   on M.fAccountTypeId = T.fId            --Join參考，tMember.fAccountTypeId = tAccountType.fId
), countMun AS (  
   -- 計算數目，會員參加了幾個社團
   select list.fMemberId, count(list.fCommunityId) as '參加了幾個社團'  --count計算
   from Community.tMemberList as list   
   group by list.fMemberId             --根據誰做計算
), memberWithComNum AS (
   -- 帳號資料與權限結 + 會員參加了幾個社團
   -- 根據前兩個with的資料表做合併
  select mm.*, cm.*   
  from member as mm
  left join countMun as cm
  on mm.fId = cm.fMemberId  --根據 member id 合併
) 
  -- 查看會員類別有多少成員、及參加了多少社團
  select  [account type], 
          count(fAccount) as '有幾位成員',
		  sum([參加了幾個社團]) as '總共參加了多少社團'
  from memberWithComNum
  group by [account type]





  -- 新增 範例 -----------------
  INSERT INTO Member.tAccountType( fId, fAccountType, fAccountAuthority)  
               VALUES ( 20, '尊爵不凡中二海龜', 2), 
			          ( 21, '海龜吃水母', 2) 


  -- 修改範例 ------------
  UPDATE Member.tAccountType 
  SET fAccountAuthority = 1,  fAccountType='中二海龜'  --更改欄位
  WHERE fId = 20                                       --條件




  -- 刪除語法 -----------
  DELETE FROM Member.tAccountType  
  WHERE fId =  21


