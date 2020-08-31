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



-- 搜尋範例  -----------------------------------------
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





-- 帳號資料與權限結合 + 獲讚    ---  已失效
WITH member AS (  -- 帳號資料與權限結
 select M.*, T.fAccountType as 'account type', T.fAccountAuthority as 'account authority'
 from Member.tMember as M
 LEFT join Member.tAccountType as T
 on M.fAccountTypeId = T.fId
),  likemun as (  -- 讚數統計
 select fGetLikeMemberId, count(fGetLikeMemberId) as likeNum
 from Member.tAccountLikeList
 group by fGetLikeMemberId
)  -- 帳號資料與權限結 + 讚數統計
  select mm.fAccount, mm.fName, mm.fCoins, mm.fIntroduction, mm.[account type], L.likeNum  
  from member as mm
  left join likemun as L
  on mm.fId = L.fGetLikeMemberId;



  --login
  select M.fId, M.fName , T.fAccountType as 'account type' , T.fAccountAuthority as 'account authority'
  from Member.tMember as M
  LEFT join Member.tAccountType as T
  on M.fAccountTypeId = T.fId
  where fAccount = 'guest' AND fPassword = 'badiii7777';

