

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
CREATE SCHEMA Activity AUTHORIZATION dbo;
GO
CREATE SCHEMA sMessage AUTHORIZATION dbo;
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
  fBirthdate       NCHAR(50)     NOT NULL,
  fMail            NVARCHAR(100) NOT NULL,
  fAddress         NVARCHAR(60)  NOT NULL,
  fCity            NVARCHAR(20)  NOT NULL,
  fCeilphoneNumber NCHAR(50)     NOT NULL,
  fCoins           INT           NOT NULL,
  fGender          NVARCHAR(10)  NULL,  --fEducation       NVARCHAR(50)  NULL,
  fIntroduction    NVARCHAR(MAX) NULL,
  fAccountTypeId   INT           NOT NULL,
  fPhotoPath       NCHAR(200)    NULL,
  CONSTRAINT PK_Member PRIMARY KEY(fId),   --設定為Primary Key
  CONSTRAINT FK_Member_AccountTypeId FOREIGN KEY(fAccountTypeId)  --設定Foreign Key
    REFERENCES Member.tAccountType(fId),
  CONSTRAINT AK_account    UNIQUE(fAccount)  --設定唯一資料行
);
CREATE NONCLUSTERED INDEX idx_nc_city           ON Member.tMember(fCity);   --非叢集建立
CREATE NONCLUSTERED INDEX idx_nc_accountTypeId  ON Member.tMember(fAccountTypeId);
CREATE NONCLUSTERED INDEX idx_nc_account        ON Member.tMember(fAccount);





-------Community-----------------------------------------------------------------------------------------------------------------------------------
--社團狀態
CREATE TABLE Community.tStatus
(
 fId     INT             NOT NULL,
 fName   NVARCHAR(50)    NOT NULL,
 CONSTRAINT PK_Status     PRIMARY KEY(fId),
 CONSTRAINT AK_statusname UNIQUE(fName)
)


--社團分類
CREATE TABLE Community.tCommunityClass
(
  fId          INT              NOT NULL,
  fName        NVARCHAR(50)     NOT NULL,
  CONSTRAINT PK_ActivityMainLabel PRIMARY KEY(fId),
  UNIQUE(fName),
);





--社團
CREATE TABLE Community.tCommunity
(
 fId         INT               NOT NULL IDENTITY(1,1),
 fName       NVARCHAR(50)      NOT NULL,
 fDate       NCHAR(50)         NOT NULL,
 fInfo       NVARCHAR(MAX)     NOT NULL,
 fStatusId   INT               NOT NULL,
 fImgPath    NCHAR(200)        NOT NULL,
 fClassId    INT               NOT NULL,
 CONSTRAINT PK_Community PRIMARY KEY(fId),
 CONSTRAINT FK_Community_Status FOREIGN KEY(fStatusId)
   REFERENCES Community.tStatus(fId),
 CONSTRAINT AK_name UNIQUE(fName),
 FOREIGN KEY(fClassId)
   REFERENCES Community.tCommunityClass(fId),
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
 fJoinDate         NCHAR(50)         NOT NULL,
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
 fPostTime       NCHAR(50)       NOT NULL,
 fContent        NVARCHAR(MAX)   NULL,
 fImgPaths       NCHAR(2040)      NULL,
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
 fReplyMemberId   INT             NOT NULL,
 fReplyTime       NCHAR(50)       NOT NULL,
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
 fFeedbackTime       NCHAR(50)       NOT NULL,
 fContent            NVARCHAR(MAX)   NOT NULL,
 CONSTRAINT PK_Feedback PRIMARY KEY(fId),
 FOREIGN KEY(fReplyId)
   REFERENCES Community.tReply(fId), 
 FOREIGN KEY(fFeedbackMemberId)
   REFERENCES Member.tMember(fId), --取得(社團成員帳號or會員帳號)讓發文帳號為fk
)




-------Activity-----------------------------------------------------------------------------------------------------------------------------------
-- 活動參與者狀態標籤
CREATE TABLE Activity.tJoinType
(
  fId               INT              NOT NULL, 
  fJoinName         NVARCHAR(50)     NOT NULL,
  CONSTRAINT PK_JoinType    PRIMARY KEY(fId),
  CONSTRAINT AK_joinname    UNIQUE(fJoinName),
);

-- 活動認證狀態標籤標籤
CREATE TABLE Activity.tAttestType
(
  fId               INT              NOT NULL,
  fAttestName       NVARCHAR(50)     NOT NULL,
  fPayCoin          INT              NOT NULL,
  CONSTRAINT PK_AttestType  PRIMARY KEY(fId),
  CONSTRAINT AK_attestname  UNIQUE(fAttestName),
);


-- 活動狀態標籤
CREATE TABLE Activity.tActivityType
(
  fId               INT              NOT NULL,
  fStatusName       NVARCHAR(50)     NOT NULL,
  CONSTRAINT PK_ActivityType  PRIMARY KEY(fId),
  CONSTRAINT AK_statusname    UNIQUE(fStatusName ),
);


-- 活動主標籤
CREATE TABLE Activity.tActivityMainLabel
(
  fId               INT              NOT NULL,
  fLabelName        NVARCHAR(50)     NOT NULL,
  CONSTRAINT PK_ActivityMainLabel PRIMARY KEY(fId),
  UNIQUE(fLabelName ),
);


-- 活動小標籤
CREATE TABLE Activity.tActivityLabel
(
  fId               INT              NOT NULL    IDENTITY(1,1),
  fLabelName        NVARCHAR(50)     NOT NULL,
  CONSTRAINT PK_ActivityLabel PRIMARY KEY(fId),
  UNIQUE(fLabelName ),
);


-- 活動
CREATE TABLE Activity.tActivity
(
  fId               INT           NOT NULL  IDENTITY(1,1),
  fActName          NVARCHAR(50)  NOT NULL,
  fCreatDate        NCHAR(50)     NOT NULL,
  fActivityDate     NCHAR(50)     NOT NULL,
  fActivityEndDate  NCHAR(50)     NOT NULL,
  fCommunityId      INT           NULL,
  fMemberId         INT           NOT NULL,
  fIntroduction     NVARCHAR(MAX) NOT NULL,
  fMaxLimit		    INT           NULL,
  fMinLimit         INT           NULL,
  fActAttestId      INT           NOT NULL, 
  fActTypeId        INT           NOT NULL,
  fActLocation      NVARCHAR(100) NOT NULL,
  fCoordinateX      NCHAR(100)    NOT NULL,
  fCoordinateY      NCHAR(100)    NOT NULL,
  fActLabelId       INT           NOT NULL,
  fImgPath          NCHAR(200)    NOT NULL,
  CONSTRAINT PK_Activity PRIMARY KEY(fId),
  CONSTRAINT FK_Activity_AttestType FOREIGN KEY(fActAttestId)  
    REFERENCES Activity.tAttestType(fId),
  CONSTRAINT FK_Activity_ActivityType FOREIGN KEY(fActTypeId)  
    REFERENCES Activity.tActivityType(fId),
  FOREIGN KEY(fMemberId)  
    REFERENCES Member.tMember(fId),
  FOREIGN KEY(fActLabelId)  
    REFERENCES Activity.tActivityMainLabel(fId),
);


-- 活動參加者
CREATE TABLE Activity.tJoinList
(
  fId               INT           NOT NULL  IDENTITY(1,1),
  fActivityId       INT           NOT NULL,
  fMemberId         INT           NOT NULL,
  fJoinTime         NCHAR(50)     NOT NULL,
  fJoinTypeId       INT           NOT NULL
  PRIMARY KEY(fId),
  CONSTRAINT FK_JoinList_Activity FOREIGN KEY(fActivityId)  --設定Foreign Key
    REFERENCES Activity.tActivity(fId),
  CONSTRAINT FK_JoinList_JoinType FOREIGN KEY(fJoinTypeId)  --設定Foreign Key
    REFERENCES Activity.tJoinType(fId),
  FOREIGN KEY(fMemberId)  
    REFERENCES Member.tMember(fId),
);



-- 活動小標籤列表
CREATE TABLE Activity.tActivityHadLabel
(
  fId               INT           NOT NULL,
  fActivityId       INT           NOT NULL,
  tActivityLabelId         INT           NOT NULL,
  PRIMARY KEY(fId),
  FOREIGN KEY(fActivityId) 
    REFERENCES Activity.tActivity(fId),
  FOREIGN KEY(tActivityLabelId) 
    REFERENCES Activity.tActivityLabel(fId),
);





-- 活動留言
CREATE TABLE Activity.tActivityMessage
(
  fId               INT           NOT NULL  IDENTITY(1,1),
  fActivityId       INT           NOT NULL,
  fMemberId         INT           NOT NULL,
  fContent          NVARCHAR(MAX) NOT NULL,
  fTime             NCHAR(50)     NOT NULL,
  fReplyerId        INT           NULL
  CONSTRAINT PK_ActivityMessage PRIMARY KEY(fId),
  CONSTRAINT FK_ActivityMessage_AttestType FOREIGN KEY(fActivityId)  --設定Foreign Key
    REFERENCES Activity.tAttestType(fId),
  FOREIGN KEY(fMemberId)  
    REFERENCES Member.tMember(fId),
  FOREIGN KEY(fReplyerId)  
    REFERENCES Activity.tActivityMessage(fId),
);


--活動搜尋紀錄
CREATE TABLE Activity.tSearchList
(
  fId               INT           NOT NULL,
  fActivityId       INT           NOT NULL,
  fMemberId         INT           NOT NULL,
  fSearchTime       NCHAR(50)     NOT NULL,
  PRIMARY KEY(fId),
  FOREIGN KEY(fMemberId)  
    REFERENCES Member.tMember(fId),
  FOREIGN KEY(fActivityId) 
    REFERENCES Activity.tActivity(fId),
);


--活動評分
CREATE TABLE Activity.tScore
(
  fId               INT           NOT NULL,
  fMemberID         INT           NOT NULL,
  fActivityId       INT           NOT NULL,
  fScoreLevel       TINYINT       NOT NULL,
  PRIMARY KEY(fId),
  FOREIGN KEY(fMemberId)  
    REFERENCES Member.tMember(fId),
  FOREIGN KEY(fActivityId) 
    REFERENCES Activity.tActivity(fId),
);

CREATE TABLE sMessage.tMessage
(
  fId               INT             NOT NULL IDENTITY(1,1),
  fMemberID         INT             NOT NULL,
  fContent          NVARCHAR(MAX)   NOT NULL,
  PRIMARY KEY(fId),
  FOREIGN KEY(fMemberId)  
    REFERENCES Member.tMember(fId),
);

