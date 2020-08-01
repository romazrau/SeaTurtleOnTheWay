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
CREATE SCHEMA Production AUTHORIZATION dbo;
GO
CREATE SCHEMA Sales AUTHORIZATION dbo;
GO
CREATE SCHEMA Activity AUTHORIZATION dbo;
GO
CREATE SCHEMA Chat AUTHORIZATION dbo;
GO
CREATE SCHEMA Club AUTHORIZATION dbo;
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

















