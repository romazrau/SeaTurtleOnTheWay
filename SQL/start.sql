

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
  CONSTRAINT AK_accountType UNIQUE(fAccountType)  --�]�w�ߤ@��Ʀ�
);


-- Create table Member.tMember
CREATE TABLE Member.tMember
(
  fId              INT           NOT NULL  IDENTITY(1,1),  --IDENTITY �۰ʶ��
  fAccount         NCHAR(50)     NOT NULL,
  fPassword        CHAR(50)      NOT NULL,            --���[�K�޳N�վ�
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
  CONSTRAINT PK_Member PRIMARY KEY(fId),   --�]�w��Primary Key
  CONSTRAINT FK_Member_AccountTypeId FOREIGN KEY(fAccountTypeId)  --�]�wForeign Key
    REFERENCES Member.tAccountType(fId),
  CONSTRAINT AK_account    UNIQUE(fAccount)  --�]�w�ߤ@��Ʀ�
);
CREATE NONCLUSTERED INDEX idx_nc_city           ON Member.tMember(fCity);   --�D�O���إ�
CREATE NONCLUSTERED INDEX idx_nc_accountTypeId  ON Member.tMember(fAccountTypeId);
CREATE NONCLUSTERED INDEX idx_nc_account        ON Member.tMember(fAccount);





-------Community-----------------------------------------------------------------------------------------------------------------------------------
--���Ϊ��A
CREATE TABLE Community.tStatus
(
 fId     INT             NOT NULL,
 fName   NVARCHAR(50)    NOT NULL,
 CONSTRAINT PK_Status     PRIMARY KEY(fId),
 CONSTRAINT AK_statusname UNIQUE(fName)
)


--���Τ���
CREATE TABLE Community.tCommunityClass
(
  fId          INT              NOT NULL,
  fName        NVARCHAR(50)     NOT NULL,
  CONSTRAINT PK_ActivityMainLabel PRIMARY KEY(fId),
  UNIQUE(fName),
);





--����
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


--���Φ����v��
CREATE TABLE Community.tAccessRight
(
 fId     INT             NOT NULL,
 fName   NVARCHAR(50)    NOT NULL,
 CONSTRAINT PK_AccessRight      PRIMARY KEY(fId),
 CONSTRAINT AK_accessrightname  UNIQUE(fName)
)

--���Φ���
CREATE TABLE Community.tMemberList
(
 fId               INT               NOT NULL IDENTITY(1,1),
 fCommunityId      INT               NOT NULL,
 fMemberId         INT               NOT NULL,
 fJoinDate         NCHAR(50)         NOT NULL,
 fAccessRightId    INT               NOT NULL,
 PRIMARY KEY(fId),
 CONSTRAINT FK_Community_Community_Member FOREIGN KEY(fCommunityId)
   REFERENCES Community.tCommunity(fId), --���o����id��fk
 FOREIGN KEY(fMemberId)
   REFERENCES Member.tMember(fId), --�٨S�s��Member Table�A���o�|���b����fk
 CONSTRAINT FK_Community_AccessRight FOREIGN KEY(fAccessRightId)
   REFERENCES Community.tAccessRight(fId), --���o�v��id��fk
);



--���Τ峹
CREATE TABLE Community.tPost
(
 fId             INT             NOT NULL IDENTITY(1,1),
 fMemberId       INT             NOT NULL,  --or null�M�w�|���O�_��b�D���Τ�PO�� (�D�b���Ϊ��H�o��e�N�פU)
 fCommunityId    INT             NOT NULL, 
 fPostTime       NCHAR(50)       NOT NULL,
 fContent        NVARCHAR(MAX)   NULL,
 fImgPaths       NCHAR(2040)      NULL,
 CONSTRAINT PK_Post PRIMARY KEY(fId),
 FOREIGN KEY(fMemberId)
   REFERENCES Member.tMember(fId),   --���o(���Φ����b��or�|���b��)���o��b����fk
 CONSTRAINT FK_Community_Community_Post FOREIGN KEY(fCommunityId)
   REFERENCES Community.tCommunity(fId) --���o���ΦW�٬�fk
)


--�峹�d��
CREATE TABLE Community.tReply
(
 fId              INT             NOT NULL IDENTITY(1,1),
 fPostId          INT             NOT NULL,
 fReplyMemberId   INT             NOT NULL,
 fReplyTime       NCHAR(50)       NOT NULL,
 fContent         NVARCHAR(MAX)   NOT NULL,
 CONSTRAINT PK_Reply PRIMARY KEY(fId),
 CONSTRAINT FK_Community_Post FOREIGN KEY(fPostId)
   REFERENCES Community.tPost(fId), --���o�D��ID��fK
 FOREIGN KEY(fReplyMemberId)
   REFERENCES Member.tMember(fId), --���o(���Φ����b��or�|���b��)���o��b����fk
)

--�s�W�^�Яd������ƪ�
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
   REFERENCES Member.tMember(fId), --���o(���Φ����b��or�|���b��)���o��b����fk
)




-------Activity-----------------------------------------------------------------------------------------------------------------------------------
-- ���ʰѻP�̪��A����
CREATE TABLE Activity.tJoinType
(
  fId               INT              NOT NULL, 
  fJoinName         NVARCHAR(50)     NOT NULL,
  CONSTRAINT PK_JoinType    PRIMARY KEY(fId),
  CONSTRAINT AK_joinname    UNIQUE(fJoinName),
);

-- ���ʻ{�Ҫ��A���Ҽ���
CREATE TABLE Activity.tAttestType
(
  fId               INT              NOT NULL,
  fAttestName       NVARCHAR(50)     NOT NULL,
  fPayCoin          INT              NOT NULL,
  CONSTRAINT PK_AttestType  PRIMARY KEY(fId),
  CONSTRAINT AK_attestname  UNIQUE(fAttestName),
);


-- ���ʪ��A����
CREATE TABLE Activity.tActivityType
(
  fId               INT              NOT NULL,
  fStatusName       NVARCHAR(50)     NOT NULL,
  CONSTRAINT PK_ActivityType  PRIMARY KEY(fId),
  CONSTRAINT AK_statusname    UNIQUE(fStatusName ),
);


-- ���ʥD����
CREATE TABLE Activity.tActivityMainLabel
(
  fId               INT              NOT NULL,
  fLabelName        NVARCHAR(50)     NOT NULL,
  CONSTRAINT PK_ActivityMainLabel PRIMARY KEY(fId),
  UNIQUE(fLabelName ),
);


-- ���ʤp����
CREATE TABLE Activity.tActivityLabel
(
  fId               INT              NOT NULL    IDENTITY(1,1),
  fLabelName        NVARCHAR(50)     NOT NULL,
  CONSTRAINT PK_ActivityLabel PRIMARY KEY(fId),
  UNIQUE(fLabelName ),
);


-- ����
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


-- ���ʰѥ[��
CREATE TABLE Activity.tJoinList
(
  fId               INT           NOT NULL  IDENTITY(1,1),
  fActivityId       INT           NOT NULL,
  fMemberId         INT           NOT NULL,
  fJoinTime         NCHAR(50)     NOT NULL,
  fJoinTypeId       INT           NOT NULL
  PRIMARY KEY(fId),
  CONSTRAINT FK_JoinList_Activity FOREIGN KEY(fActivityId)  --�]�wForeign Key
    REFERENCES Activity.tActivity(fId),
  CONSTRAINT FK_JoinList_JoinType FOREIGN KEY(fJoinTypeId)  --�]�wForeign Key
    REFERENCES Activity.tJoinType(fId),
  FOREIGN KEY(fMemberId)  
    REFERENCES Member.tMember(fId),
);



-- ���ʤp���ҦC��
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





-- ���ʯd��
CREATE TABLE Activity.tActivityMessage
(
  fId               INT           NOT NULL  IDENTITY(1,1),
  fActivityId       INT           NOT NULL,
  fMemberId         INT           NOT NULL,
  fContent          NVARCHAR(MAX) NOT NULL,
  fTime             NCHAR(50)     NOT NULL,
  fReplyerId        INT           NULL
  CONSTRAINT PK_ActivityMessage PRIMARY KEY(fId),
  CONSTRAINT FK_ActivityMessage_AttestType FOREIGN KEY(fActivityId)  --�]�wForeign Key
    REFERENCES Activity.tAttestType(fId),
  FOREIGN KEY(fMemberId)  
    REFERENCES Member.tMember(fId),
  FOREIGN KEY(fReplyerId)  
    REFERENCES Activity.tActivityMessage(fId),
);


--���ʷj�M����
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


--���ʵ���
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

