-- 帳號資料與權限結合
select M.*, T.accountType as 'account type', T.accountAuthority as 'account authority'
from Member.Member as M
LEFT join Member.AccountType as T
on M.accountTypeId = T.accountTypeId;