-- 刪除已存在的
use master;
IF DB_ID(N'SeaTurtleMarket') IS NOT NULL DROP DATABASE SeaTurtleMarket;
--失敗請手動刪除，SeaTurtleMarket資料庫右鍵 > 刪除 > 勾選取消已存在連線 > 確認

---------------------------------------------------------------------
-- Create empty database SeaTurtleMarket
CREATE DATABASE SeaTurtleMarket;
GO

USE SeaTurtleMarket;
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
-- Create table Member.accountType
CREATE TABLE Member.AccountType
(
  accountTypeId    INT           NOT NULL,
  accountType      NVARCHAR(10)  NOT NULL,
  accountAuthority TINYINT       NOT NULL,
  CONSTRAINT PK_accountTypeId PRIMARY KEY(accountTypeId),
  CONSTRAINT AK_accountType UNIQUE(accountType)  --設定唯一資料行
);


-- Create table Member.Member
CREATE TABLE Member.Member
(
  account         NCHAR(20)    NOT NULL,
  password        CHAR(20)     NOT NULL,            --視加密技術調整
  name            NVARCHAR(10) NOT NULL,
  birthdate       DATE         NOT NULL,
  identifyId      CHAR(10)     NOT NULL,
  address         NVARCHAR(60) NOT NULL,
  city            NVARCHAR(15) NOT NULL,
  ceilphoneNumber INT          NOT NULL,
  coins           INT          NOT NULL,
  gender          NVARCHAR(5)  NULL,
  education       NVARCHAR(15) NULL,
  introduction    NVARCHAR(MAX)NULL,
  accountTypeId   INT          NOT NULL,
  CONSTRAINT PK_Member PRIMARY KEY(account),  --設定為Primary Key
  CONSTRAINT FK_Member_AccountType FOREIGN KEY(accountTypeId)  --設定Foreign Key
    REFERENCES Member.AccountType(accountTypeId),
  CONSTRAINT CHK_birthdate CHECK(birthdate <= CAST(SYSDATETIME() AS DATE))
);
CREATE NONCLUSTERED INDEX idx_nc_city  ON Member.Member(city);   --非叢集建立
CREATE NONCLUSTERED INDEX idx_nc_accountTypeId  ON Member.Member(accountTypeId);
















