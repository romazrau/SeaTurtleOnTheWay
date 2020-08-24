-- 常用指令集
---------------------------------------
USE SeaTurtleOnTheWay;
GO
	

-- 帳號資料與權限結合
select M.*, T.fAccountType as 'account type', T.fAccountAuthority as 'account authority'
from Member.tMember as M
LEFT join Member.tAccountType as T
on M.fAccountTypeId = T.fId;


-- 帳號資料與權限結合 + 獲讚
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

