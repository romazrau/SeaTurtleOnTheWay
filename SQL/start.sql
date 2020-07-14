-- 刪除已存在的
use master;
IF DB_ID(N'SeaTurtleMarket') IS NOT NULL DROP DATABASE SeaTurtleMarket;

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
CREATE SCHEMA Chat AUTHORIZATION dbo;
GO



---------------------------------------------------------------------
-- Create empty tables
---------------------------------------------------------------------
-- Create table HR.Employees
CREATE TABLE Member.Member
(
  account         INT          NOT NULL IDENTITY,
  password        CHAR(20)     NOT NULL,            --視加密技術調整
  name            NVARCHAR(10) NOT NULL,
  birthdate       DATE         NOT NULL,
  address         NVARCHAR(60) NOT NULL,
  city            NVARCHAR(15) NOT NULL,
  ceilphoneNumber INT		   NOT NULL,
  identifyId      NVARCHAR(10) NOT NULL,
  coins           INT		   NOT NULL,
  gender          NVARCHAR(5)  NULL,
  Education       NVARCHAR(15) NULL,
  Introduction    NVARCHAR(MAX) NULL,
  CONSTRAINT PK_Member PRIMARY KEY(account),
  --CONSTRAINT FK_Employees_Employees FOREIGN KEY(mgrid)
  --  REFERENCES HR.Employees(empid),
  CONSTRAINT CHK_birthdate CHECK(birthdate <= CAST(SYSDATETIME() AS DATE))
);

CREATE NONCLUSTERED INDEX idx_nc_city  ON Member.Member(city);
