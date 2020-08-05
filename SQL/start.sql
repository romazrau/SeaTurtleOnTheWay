-- 刪除已存在的
use master;
GO
IF DB_ID(N'SeaTurtleMarket') IS NOT NULL DROP DATABASE SeaTurtleOnTheWay;
GO
--失敗請手動刪除，SeaTurtleMarket資料庫右鍵 > 刪除 > 勾選取消已存在連線 > 確認

---------------------------------------------------------------------
-- Create empty database SeaTurtleMarket
CREATE DATABASE SeaTurtleOnTheWay;
GO

USE SeaTurtleOnTheWay;
GO

---------------------------------------------------------------------
-- Create Schemas

CREATE SCHEMA Member AUTHORIZATION dbo;
GO
CREATE SCHEMA Community AUTHORIZATION dbo;
GO


---------------------------------------------------------------------
-- Create empty tables
---------------------------------------------------------------------
-- Create table Member.tAccountType
CREATE TABLE Member.tAccountType
(
  fId               INT           NOT NULL,
  fAccountType      NVARCHAR(10)  NOT NULL,
  fAccountAuthority TINYINT       NOT NULL,
  CONSTRAINT PK_AccountType PRIMARY KEY(fId),
  CONSTRAINT AK_accountType UNIQUE(fAccountType)  --設定唯一資料行
);


-- Create table Member.tMember
CREATE TABLE Member.tMember
(
  fId              INT           NOT NULL  IDENTITY(1,1),  --IDENTITY 自動填值
  fAccount         NCHAR(50)     NOT NULL,
  fPassword        CHAR(50)      NOT NULL,            --視加密技術調整
  fName            NVARCHAR(50)  NOT NULL,
  fBirthdate       DATE          NOT NULL,
  fIdentifyId      CHAR(10)      NOT NULL,
  fAddress         NVARCHAR(60)  NOT NULL,
  fCity            NVARCHAR(20)  NOT NULL,
  fCeilphoneNumber INT           NOT NULL,
  fCoins           INT           NOT NULL,
  fGender          NVARCHAR(10)  NULL,  --fEducation       NVARCHAR(50)  NULL,
  fIntroduction    NVARCHAR(MAX) NULL,
  fAccountTypeId   INT           NOT NULL,
  fPhotoPath       NCHAR(200)    NULL,
  CONSTRAINT PK_Member PRIMARY KEY(fId),   --設定為Primary Key
  CONSTRAINT FK_Member_AccountTypeId FOREIGN KEY(fAccountTypeId)  --設定Foreign Key
    REFERENCES Member.tAccountType(fId),
  CONSTRAINT CHK_birthdate CHECK(fBirthdate <= CAST(SYSDATETIME() AS DATE)),
  CONSTRAINT AK_account    UNIQUE(fAccount)  --設定唯一資料行
);
CREATE NONCLUSTERED INDEX idx_nc_city           ON Member.tMember(fCity);   --非叢集建立
CREATE NONCLUSTERED INDEX idx_nc_accountTypeId  ON Member.tMember(fAccountTypeId);
CREATE NONCLUSTERED INDEX idx_nc_account        ON Member.tMember(fAccount);



-- Create table Member.tAccountLikeList
CREATE TABLE Member.tAccountLikeList
(
  fId                 INT   NOT NULL  IDENTITY(1,1),
  fGetLikeMemberId    INT   NOT NULL,
  fGiveLikeMemberId   INT   NOT NULL,
  CONSTRAINT FK_AccountLikeList_Member_get  FOREIGN KEY(fGetLikeMemberId)  
    REFERENCES Member.tMember(fID),
  CONSTRAINT FK_AccountLikeList_Member_give FOREIGN KEY(fGiveLikeMemberId)  
    REFERENCES Member.tMember(fID)
);



-------Community-----------------------------------------------------------------------------------------------------------------------------------
--社團狀態
CREATE TABLE Community.tStatus
(
 fId     INT             NOT NULL,
 fName   NVARCHAR(50)    NOT NULL,
 CONSTRAINT PK_Status     PRIMARY KEY(fId),
 CONSTRAINT AK_statusname UNIQUE(fName)
)

--社團
CREATE TABLE Community.tCommunity
(
 fId         INT               NOT NULL IDENTITY(1,1),
 fName       NVARCHAR(50)      NOT NULL,
 fDate       DATE              NOT NULL,
 fInfo       NVARCHAR(MAX)     NOT NULL,
 fStatusId   INT               NOT NULL,
 fImgPath    NCHAR(200)        NOT NULL,
 CONSTRAINT PK_Community PRIMARY KEY(fId),
 CONSTRAINT FK_Community_Status FOREIGN KEY(fStatusId)
   REFERENCES Community.tStatus(fId),
 CONSTRAINT AK_name UNIQUE(fName)
);


--社團成員權限
CREATE TABLE Community.tAccessRight
(
 fId     INT             NOT NULL,
 fName   NVARCHAR(50)    NOT NULL,
 CONSTRAINT PK_AccessRight      PRIMARY KEY(fId),
 CONSTRAINT AK_accessrightname  UNIQUE(fName)
)

--社團成員
CREATE TABLE Community.tMemberList
(
 fId               INT               NOT NULL IDENTITY(1,1),
 fCommunityId      INT               NOT NULL,
 fMemberId         INT               NOT NULL,
 fJoinDate         SMALLDATETIME     NOT NULL,
 fAccessRightId    INT               NOT NULL,
 PRIMARY KEY(fId),
 CONSTRAINT FK_Community_Community_Member FOREIGN KEY(fCommunityId)
   REFERENCES Community.tCommunity(fId), --取得社團id為fk
 FOREIGN KEY(fMemberId)
   REFERENCES Member.tMember(fId), --還沒連結Member Table，取得會員帳號為fk
 CONSTRAINT FK_Community_AccessRight FOREIGN KEY(fAccessRightId)
   REFERENCES Community.tAccessRight(fId), --取得權限id為fk
);



--社團文章
CREATE TABLE Community.tPost
(
 fId             INT             NOT NULL IDENTITY(1,1),
 fMemberId       INT             NOT NULL,  --or null決定會員是否能在非社團內PO文 (非在社團的人發文前就擋下)
 fCommunityId    INT             NOT NULL, 
 fPostTime       SMALLDATETIME   NOT NULL,
 fContent        NVARCHAR(MAX)   NULL,
 fImgPath        NCHAR(200)      NULL,
 CONSTRAINT PK_Post PRIMARY KEY(fId),
 FOREIGN KEY(fMemberId)
   REFERENCES Member.tMember(fId),   --取得(社團成員帳號or會員帳號)讓發文帳號為fk
 CONSTRAINT FK_Community_Community_Post FOREIGN KEY(fCommunityId)
   REFERENCES Community.tCommunity(fId) --取得社團名稱為fk
)


--文章留言
CREATE TABLE Community.tReply
(
 fId              INT             NOT NULL IDENTITY(1,1),
 fPostId          INT             NOT NULL,
 fReplyMemberId  INT             NOT NULL,
 fReplyTime       SMALLDATETIME   NOT NULL,
 fContent         NVARCHAR(MAX)   NOT NULL,
 CONSTRAINT PK_Reply PRIMARY KEY(fId),
 CONSTRAINT FK_Community_Post FOREIGN KEY(fPostId)
   REFERENCES Community.tPost(fId), --取得主文ID為fK
 FOREIGN KEY(fReplyMemberId)
   REFERENCES Member.tMember(fId), --取得(社團成員帳號or會員帳號)讓發文帳號為fk
)

--新增回覆留言的資料表
CREATE TABLE Community.tFeedback
(
 fId                 INT             NOT NULL IDENTITY(1,1),
 fReplyId            INT             NOT NULL,
 fFeedbackMemberId   INT             NOT NULL,
 fFeedbackTime       SMALLDATETIME   NOT NULL,
 fContent            NVARCHAR(MAX)   NOT NULL,
 CONSTRAINT PK_Feedback PRIMARY KEY(fId),
 FOREIGN KEY(fReplyId)
   REFERENCES Community.tReply(fId), 
 FOREIGN KEY(fFeedbackMemberId)
   REFERENCES Member.tMember(fId), --取得(社團成員帳號or會員帳號)讓發文帳號為fk
)













