-- 常用指令集
---------------------------------------
USE SeaTurtleOnTheWay;
GO
	

-- 帳號資料與權限結合
select M.*, T.accountType as 'account type', T.accountAuthority as 'account authority'
from Member.Member as M
LEFT join Member.AccountType as T
on M.accountTypeId = T.accountTypeId;


-- 帳號資料與權限結合 + 獲讚
WITH member AS (  -- 帳號資料與權限結
 select M.*, T.accountType as 'account type', T.accountAuthority as 'account authority'
 from Member.Member as M
 LEFT join Member.AccountType as T
 on M.accountTypeId = T.accountTypeId
),  likemun as (  -- 讚數統計
 select getLikeAccount, count(getLikeAccount) as likeNum
 from Member.AccountLikeList
 group by getLikeAccount
)  -- 帳號資料與權限結 + 讚數統計
  select mm.account, mm.name, mm.coins, mm.introduction, mm.[account type], L.likeNum  
  from member as mm
  left join likemun as L
  on mm.account = L.getLikeAccount;
