ALTER TABLE Sys_FlowOperate ADD ProjectId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_FlowOperate', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO
ALTER TABLE [dbo].[Sys_FlowOperate]  WITH CHECK ADD  CONSTRAINT [FK_Sys_FlowOperate_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Sys_FlowOperate] CHECK CONSTRAINT [FK_Sys_FlowOperate_Base_Project]
GO

ALTER TABLE Sys_FlowOperate ADD Url NVARCHAR(500) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ݴ���·��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_FlowOperate', @level2type=N'COLUMN',@level2name=N'Url'
GO

ALTER TABLE dbo.Base_WorkPost ADD PostType nchar(1) null
ALTER TABLE dbo.Base_WorkPost ADD IsHsse bit null
ALTER TABLE dbo.SitePerson_Person ADD SendCardNo nvarchar(50) null
GO

--������:��λ����
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('0B705F90-BB2B-4C22-A336-90C0B677A95A','1','һ������λ',1,'PostType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('89164C32-F817-4082-B646-F950769C91C4','2','������ҵ��Ա',2,'PostType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('67B9987E-38B2-42C3-B0A7-678426DD0E93','3','һ����ҵ��λ',3,'PostType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('6CDB171F-59C9-4B60-92FE-2AFFDF115D6D','4','���ֹ�����Ա',4,'PostType')
GO

--������:�˹�ʱ�±��Ƿ�ƽ����ȡֵ
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('CF93B8A3-16EB-4872-9859-C10ECE287E11','1','�˹�ʱ�±��Ƿ�ƽ����ȡֵ',1,'IsMonthReportGetAVG')
GO


--��λ�б�
CREATE VIEW [dbo].[View_Base_WorkPost]  AS 
/*��λ�б���ͼ*/
SELECT workPost.WorkPostId, 
workPost.WorkPostName, 
workPost.WorkPostCode, 
workPost.Remark,
workPost.PostType,
workPost.IsHsse,
case workPost.IsHsse when 1 then '��' else '��' end as IsHsseStr,
const.ConstText as PostTypeName
FROM dbo.Base_WorkPost AS workPost
LEFT JOIN Sys_Const AS const ON const.ConstValue = workPost.PostType and const.GroupId='PostType'

GO


CREATE VIEW [dbo].[View_SitePerson_Person]
AS
SELECT Person.PersonId,
Person.CardNo,
Person.PersonName,
(Case Person.Sex WHEN '1' THEN '��' WHEN '2' THEN 'Ů' ELSE '' END) AS Sex, 
Person.IdentityCard, 
Person.Address, 
Person.ProjectId, 
Person.UnitId, 
Person.TeamGroupId, 
Person.WorkAreaId, 
Person.WorkPostId, 
Person.CertificateId, 
Person.CertificateCode, 
Person.CertificateLimitTime, 
Person.InTime, 
Person.OutTime, 
Person.OutResult, 
Person.Telephone, 
Person.PositionId, 
Person.PostTitleId, 
Person.PhotoUrl, 
(CASE Person.IsUsed WHEN 'TRUE' THEN '��' ELSE '��' END) AS IsUsed, 
(CASE Person.IsCardUsed WHEN 'TRUE' THEN '��' ELSE '��' END) AS IsCardUsed, 
Person.PersonIndex,
Project.ProjectCode,
Project.ProjectName,
Unit.UnitCode,
Unit.UnitName,
TeamGroup.TeamGroupName,
WorkArea.WorkAreaCode,
WorkArea.WorkAreaName,
Post.WorkPostName,
Certificat.CertificateName,
Position.PositionName,
Title.PostTitleName
FROM SitePerson_Person AS Person
LEFT JOIN Base_Project AS Project ON Project.ProjectId=Person.ProjectId
LEFT JOIN Base_Unit AS Unit ON Unit.UnitId = Person.UnitId
LEFT JOIN ProjectData_TeamGroup AS TeamGroup ON TeamGroup.TeamGroupId=Person.TeamGroupId
LEFT JOIN ProjectData_WorkArea AS WorkArea ON WorkArea.WorkAreaId = Person.WorkAreaId
LEFT JOIN Base_WorkPost AS Post ON Post.WorkPostId = Person.WorkPostId
LEFT JOIN Base_Certificate AS Certificat ON Certificat.CertificateId=Person.CertificateId
LEFT JOIN Base_Position AS Position ON Position.PositionId = Person.PositionId
Left JOIN Base_PostTitle AS Title ON Title.PostTitleId = Person.PostTitleId

GO


Create PROCEDURE [dbo].[SpGetNewCode3ByProjectId]
 @tableName varchar(50),/*����*/
 @columnName varchar(50),/*����*/
 @projectId nvarchar(50),/*��Ŀ*/
 @prefix varchar(50),/*��ˮ�ű���ǰ׺*/
 @returnVal nvarchar(50) output
AS
/*��ȡһ���µ���ˮ�ţ�����λ�����ӣ�*/
declare 
        @sql nvarchar(500),
        @old nvarchar(50),
        @newid varchar(50),
        @maxId nvarchar(50)/*�ѷ�������ֵ*/
select @sql=N'SELECT @maxId=MAX('+@columnName+') from '+@tableName+' where ProjectId = ''' + @projectId + ''' and   ' + @columnName+' like ' + '''' + @prefix + '%'''
EXEC sp_executesql @sql, N'@maxId nvarchar(50) OUTPUT', @maxId OUTPUT 
set @old=@maxId

IF(@old is null)
BEGIN
set @newid=@prefix+'001'
END

ELSE
BEGIN
set @newid = (select max(right(@old,3)))+1
set @newid = @prefix +right('000'+@newid,3)
END

SET @returnVal=@newid

GO



CREATE TABLE [dbo].[Base_TrainType](
	[TrainTypeId] [nvarchar](50) NOT NULL,
	[TrainTypeCode] [nvarchar](50) NULL,
	[TrainTypeName] [nvarchar](50) NULL,
	[Remark] [nvarchar](500) NULL,
	[IsAboutSendCard] [bit] NULL,
 CONSTRAINT [PK_Base_TrainType] PRIMARY KEY CLUSTERED 
(
	[TrainTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_TrainType', @level2type=N'COLUMN',@level2name=N'TrainTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_TrainType', @level2type=N'COLUMN',@level2name=N'TrainTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_TrainType', @level2type=N'COLUMN',@level2name=N'TrainTypeName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_TrainType', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_TrainType', @level2type=N'COLUMN',@level2name=N'IsAboutSendCard'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_TrainType'
GO

CREATE TABLE [dbo].[Base_TrainLevel](
	[TrainLevelId] [nvarchar](50) NOT NULL,
	[TrainLevelCode] [nvarchar](50) NULL,
	[TrainLevelName] [nvarchar](50) NULL,
	[Remark] [nvarchar](500) NULL,
 CONSTRAINT [PK_Base_TrainLevel] PRIMARY KEY CLUSTERED 
(
	[TrainLevelId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_TrainLevel', @level2type=N'COLUMN',@level2name=N'TrainLevelId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_TrainLevel', @level2type=N'COLUMN',@level2name=N'TrainLevelCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_TrainLevel', @level2type=N'COLUMN',@level2name=N'TrainLevelName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_TrainLevel', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_TrainLevel'
GO

CREATE TABLE [dbo].[EduTrain_TrainRecord](
	[TrainingId] [nvarchar](50) NOT NULL,
	[TrainingCode] [nvarchar](50) NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[TrainTitle] [nvarchar](200) NULL,
	[TrainContent] [nvarchar](500) NULL,
	[TrainStartDate] [datetime] NULL,
	[TrainEndDate] [datetime] NULL,
	[TeachHour] [numeric](9, 1) NULL,
	[TeachMan] [nvarchar](50) NULL,
	[TeachAddress] [nvarchar](100) NULL,
	[Remark] [nvarchar](150) NULL,
	[TrainTypeId] [nvarchar](50) NULL,
	[TrainLevelId] [nvarchar](50) NULL,
	[AttachUrl] [nvarchar](1000) NULL,
	[UnitIds] [nvarchar](800) NULL,
	[States] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
 CONSTRAINT [PK_EduTrain_Training] PRIMARY KEY CLUSTERED 
(
	[TrainingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ѵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecord', @level2type=N'COLUMN',@level2name=N'TrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecord', @level2type=N'COLUMN',@level2name=N'TrainingCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecord', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecord', @level2type=N'COLUMN',@level2name=N'TrainContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ��ʼ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecord', @level2type=N'COLUMN',@level2name=N'TrainStartDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecord', @level2type=N'COLUMN',@level2name=N'TrainEndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ѧʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecord', @level2type=N'COLUMN',@level2name=N'TeachHour'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ڿ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecord', @level2type=N'COLUMN',@level2name=N'TeachMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ڿε�ַ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecord', @level2type=N'COLUMN',@level2name=N'TeachAddress'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecord', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecord', @level2type=N'COLUMN',@level2name=N'TrainTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecord', @level2type=N'COLUMN',@level2name=N'TrainLevelId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ��λIds' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecord', @level2type=N'COLUMN',@level2name=N'UnitIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecord', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecord', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ѵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecord'
GO

ALTER TABLE [dbo].[EduTrain_TrainRecord]  WITH CHECK ADD  CONSTRAINT [FK_EduTrain_Training_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[EduTrain_TrainRecord] CHECK CONSTRAINT [FK_EduTrain_Training_Base_Project]
GO

ALTER TABLE [dbo].[EduTrain_TrainRecord]  WITH CHECK ADD  CONSTRAINT [FK_EduTrain_TrainRecord_Base_TrainLevel] FOREIGN KEY([TrainLevelId])
REFERENCES [dbo].[Base_TrainLevel] ([TrainLevelId])
GO

ALTER TABLE [dbo].[EduTrain_TrainRecord] CHECK CONSTRAINT [FK_EduTrain_TrainRecord_Base_TrainLevel]
GO

ALTER TABLE [dbo].[EduTrain_TrainRecord]  WITH CHECK ADD  CONSTRAINT [FK_EduTrain_TrainRecord_Base_TrainType] FOREIGN KEY([TrainTypeId])
REFERENCES [dbo].[Base_TrainType] ([TrainTypeId])
GO

ALTER TABLE [dbo].[EduTrain_TrainRecord] CHECK CONSTRAINT [FK_EduTrain_TrainRecord_Base_TrainType]
GO


CREATE TABLE [dbo].[EduTrain_TrainRecordDetail](
	[TrainDetailId] [nvarchar](50) NOT NULL,
	[TrainingId] [nvarchar](50) NOT NULL,
	[PersonId] [nvarchar](50) NOT NULL,
	[CheckScore] [numeric](9, 1) NULL,
	[CheckResult] [bit] NOT NULL,
 CONSTRAINT [PK_EduTrain_TrainDetail] PRIMARY KEY CLUSTERED 
(
	[TrainDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ѵ��ϸ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecordDetail', @level2type=N'COLUMN',@level2name=N'TrainDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ѵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecordDetail', @level2type=N'COLUMN',@level2name=N'TrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ա' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecordDetail', @level2type=N'COLUMN',@level2name=N'PersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Գɼ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecordDetail', @level2type=N'COLUMN',@level2name=N'CheckScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���˽��(true-�ϸ�false-���ϸ�)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecordDetail', @level2type=N'COLUMN',@level2name=N'CheckResult'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ѵ��ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecordDetail'
GO

ALTER TABLE [dbo].[EduTrain_TrainRecordDetail]  WITH CHECK ADD  CONSTRAINT [FK_EduTrain_TrainDetail_EduTrain_Training] FOREIGN KEY([TrainingId])
REFERENCES [dbo].[EduTrain_TrainRecord] ([TrainingId])
GO

ALTER TABLE [dbo].[EduTrain_TrainRecordDetail] CHECK CONSTRAINT [FK_EduTrain_TrainDetail_EduTrain_Training]
GO


CREATE TABLE [dbo].[SitePerson_Checking](
	[CheckingId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[CardNo] [nvarchar](20) NULL,
	[WorkAreaId] [nvarchar](50) NULL,
	[IdentityCard] [nvarchar](18) NULL,
	[IntoOutTime] [datetime] NULL,
	[IntoOut] [char](1) NULL,
	[Address] [nvarchar](50) NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_SitePerson_Checking] PRIMARY KEY CLUSTERED 
(
	[CheckingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Checking', @level2type=N'COLUMN',@level2name=N'CheckingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Checking', @level2type=N'COLUMN',@level2name=N'CardNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Checking', @level2type=N'COLUMN',@level2name=N'WorkAreaId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���֤' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Checking', @level2type=N'COLUMN',@level2name=N'IdentityCard'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ֳ�ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Checking', @level2type=N'COLUMN',@level2name=N'IntoOutTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������1-����2-����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Checking', @level2type=N'COLUMN',@level2name=N'IntoOut'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ص�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Checking', @level2type=N'COLUMN',@level2name=N'Address'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ա���ڱ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Checking'
GO

ALTER TABLE [dbo].[SitePerson_Checking]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_Checking_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SitePerson_Checking] CHECK CONSTRAINT [FK_SitePerson_Checking_Base_Project]
GO

ALTER TABLE [dbo].[SitePerson_Checking]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_Checking_ProjectData_WorkArea] FOREIGN KEY([WorkAreaId])
REFERENCES [dbo].[ProjectData_WorkArea] ([WorkAreaId])
GO

ALTER TABLE [dbo].[SitePerson_Checking] CHECK CONSTRAINT [FK_SitePerson_Checking_ProjectData_WorkArea]
GO


CREATE TABLE [dbo].[SitePerson_DayReport](
	[DayReportId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[TotalPersonWorkTime] [decimal](18, 2) NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_SitePerson_DayReport] PRIMARY KEY CLUSTERED 
(
	[DayReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReport', @level2type=N'COLUMN',@level2name=N'DayReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReport', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReport', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReport', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۼ��˹�ʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReport', @level2type=N'COLUMN',@level2name=N'TotalPersonWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ձ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReport'
GO

ALTER TABLE [dbo].[SitePerson_DayReport]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_DayReport_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SitePerson_DayReport] CHECK CONSTRAINT [FK_SitePerson_DayReport_Base_Project]
GO

ALTER TABLE [dbo].[SitePerson_DayReport]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_DayReport_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[SitePerson_DayReport] CHECK CONSTRAINT [FK_SitePerson_DayReport_Sys_User]
GO


CREATE TABLE [dbo].[SitePerson_DayReportDetail](
	[DayReportDetailId] [nvarchar](50) NOT NULL,
	[DayReportId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[WorkTime] [decimal](18, 2) NULL,
	[CheckPersonNum] [int] NULL,
	[RealPersonNum] [decimal](18, 2) NULL,
	[PersonWorkTime] [decimal](18, 2) NULL,
	[TotalPersonWorkTime] [decimal](18, 2) NULL,
	[Remark] [nvarchar](100) NULL,
	[StaffData] [nvarchar](2000) NULL,
	[DayNum] [decimal](18, 2) NULL,
	[YearPersonWorkTime] [int] NULL,
 CONSTRAINT [PK_SitePerson_DayReportDetail] PRIMARY KEY CLUSTERED 
(
	[DayReportDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail', @level2type=N'COLUMN',@level2name=N'DayReportDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail', @level2type=N'COLUMN',@level2name=N'DayReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail', @level2type=N'COLUMN',@level2name=N'CheckPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail', @level2type=N'COLUMN',@level2name=N'RealPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˹�ʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail', @level2type=N'COLUMN',@level2name=N'PersonWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۼ��˹�ʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail', @level2type=N'COLUMN',@level2name=N'TotalPersonWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ա���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail', @level2type=N'COLUMN',@level2name=N'StaffData'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail', @level2type=N'COLUMN',@level2name=N'DayNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ۼ��˹�ʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail', @level2type=N'COLUMN',@level2name=N'YearPersonWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ձ���ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportDetail'
GO

ALTER TABLE [dbo].[SitePerson_DayReportDetail]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_DayReportDetail_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[SitePerson_DayReportDetail] CHECK CONSTRAINT [FK_SitePerson_DayReportDetail_Base_Unit]
GO

ALTER TABLE [dbo].[SitePerson_DayReportDetail]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_DayReportDetail_SitePerson_DayReport] FOREIGN KEY([DayReportId])
REFERENCES [dbo].[SitePerson_DayReport] ([DayReportId])
GO

ALTER TABLE [dbo].[SitePerson_DayReportDetail] CHECK CONSTRAINT [FK_SitePerson_DayReportDetail_SitePerson_DayReport]
GO


CREATE TABLE [dbo].[SitePerson_DayReportUnitDetail](
	[DayReportUnitDetailId] [nvarchar](50) NOT NULL,
	[DayReportDetailId] [nvarchar](50) NULL,
	[PostId] [nvarchar](50) NULL,
	[CheckPersonNum] [int] NULL,
	[RealPersonNum] [int] NULL,
	[PersonWorkTime] [decimal](18, 2) NULL,
	[Remark] [nvarchar](200) NULL,
 CONSTRAINT [PK_SitePerson_DayReportUnitDetail] PRIMARY KEY CLUSTERED 
(
	[DayReportUnitDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ��ϸ�˹�ʱid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportUnitDetail', @level2type=N'COLUMN',@level2name=N'DayReportUnitDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˹���ϸid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportUnitDetail', @level2type=N'COLUMN',@level2name=N'DayReportDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportUnitDetail', @level2type=N'COLUMN',@level2name=N'PostId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportUnitDetail', @level2type=N'COLUMN',@level2name=N'CheckPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportUnitDetail', @level2type=N'COLUMN',@level2name=N'RealPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˹�ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportUnitDetail', @level2type=N'COLUMN',@level2name=N'PersonWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportUnitDetail', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˹�ʱ�±���λ��ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_DayReportUnitDetail'
GO

ALTER TABLE [dbo].[SitePerson_DayReportUnitDetail]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_DayReportUnitDetail_Base_WorkPost] FOREIGN KEY([PostId])
REFERENCES [dbo].[Base_WorkPost] ([WorkPostId])
GO

ALTER TABLE [dbo].[SitePerson_DayReportUnitDetail] CHECK CONSTRAINT [FK_SitePerson_DayReportUnitDetail_Base_WorkPost]
GO

ALTER TABLE [dbo].[SitePerson_DayReportUnitDetail]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_DayReportUnitDetail_SitePerson_DayReportDetail] FOREIGN KEY([DayReportDetailId])
REFERENCES [dbo].[SitePerson_DayReportDetail] ([DayReportDetailId])
GO

ALTER TABLE [dbo].[SitePerson_DayReportUnitDetail] CHECK CONSTRAINT [FK_SitePerson_DayReportUnitDetail_SitePerson_DayReportDetail]
GO


CREATE TABLE [dbo].[SitePerson_MonthReport](
	[MonthReportId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[TotalPersonWorkTime] [decimal](18, 2) NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_SitePerson_MonthReport] PRIMARY KEY CLUSTERED 
(
	[MonthReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReport', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReport', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReport', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReport', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۼ��˹�ʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReport', @level2type=N'COLUMN',@level2name=N'TotalPersonWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����±�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReport'
GO

ALTER TABLE [dbo].[SitePerson_MonthReport]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_MonthReport_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SitePerson_MonthReport] CHECK CONSTRAINT [FK_SitePerson_MonthReport_Base_Project]
GO

ALTER TABLE [dbo].[SitePerson_MonthReport]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_MonthReport_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[SitePerson_MonthReport] CHECK CONSTRAINT [FK_SitePerson_MonthReport_Sys_User]
GO


CREATE TABLE [dbo].[SitePerson_MonthReportDetail](
	[MonthReportDetailId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[WorkTime] [decimal](18, 2) NULL,
	[CheckPersonNum] [int] NULL,
	[RealPersonNum] [decimal](18, 2) NULL,
	[PersonWorkTime] [decimal](18, 2) NULL,
	[TotalPersonWorkTime] [decimal](18, 2) NULL,
	[Remark] [nvarchar](100) NULL,
	[StaffData] [nvarchar](2000) NULL,
	[DayNum] [decimal](18, 2) NULL,
	[YearPersonWorkTime] [int] NULL,
 CONSTRAINT [PK_SitePerson_MonthReportDetail] PRIMARY KEY CLUSTERED 
(
	[MonthReportDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReportDetail', @level2type=N'COLUMN',@level2name=N'MonthReportDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReportDetail', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReportDetail', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReportDetail', @level2type=N'COLUMN',@level2name=N'CheckPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReportDetail', @level2type=N'COLUMN',@level2name=N'RealPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˹�ʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReportDetail', @level2type=N'COLUMN',@level2name=N'PersonWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۼ��˹�ʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReportDetail', @level2type=N'COLUMN',@level2name=N'TotalPersonWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReportDetail', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ա���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReportDetail', @level2type=N'COLUMN',@level2name=N'StaffData'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReportDetail', @level2type=N'COLUMN',@level2name=N'DayNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ۼ��˹�ʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReportDetail', @level2type=N'COLUMN',@level2name=N'YearPersonWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����±���ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReportDetail'
GO

ALTER TABLE [dbo].[SitePerson_MonthReportDetail]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_MonthReportDetail_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[SitePerson_MonthReportDetail] CHECK CONSTRAINT [FK_SitePerson_MonthReportDetail_Base_Unit]
GO

ALTER TABLE [dbo].[SitePerson_MonthReportDetail]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_MonthReportDetail_SitePerson_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[SitePerson_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[SitePerson_MonthReportDetail] CHECK CONSTRAINT [FK_SitePerson_MonthReportDetail_SitePerson_MonthReport]
GO


CREATE TABLE [dbo].[SitePerson_MonthReportUnitDetail](
	[MonthReportUnitDetailId] [nvarchar](50) NOT NULL,
	[MonthReportDetailId] [nvarchar](50) NULL,
	[PostId] [nvarchar](50) NULL,
	[CheckPersonNum] [int] NULL,
	[RealPersonNum] [int] NULL,
	[PersonWorkTime] [decimal](18, 2) NULL,
	[Remark] [nvarchar](200) NULL,
 CONSTRAINT [PK_SitePerson_MonthReportUnitDetail] PRIMARY KEY CLUSTERED 
(
	[MonthReportUnitDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ��ϸ�˹�ʱid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReportUnitDetail', @level2type=N'COLUMN',@level2name=N'MonthReportUnitDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˹���ϸid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReportUnitDetail', @level2type=N'COLUMN',@level2name=N'MonthReportDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReportUnitDetail', @level2type=N'COLUMN',@level2name=N'PostId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReportUnitDetail', @level2type=N'COLUMN',@level2name=N'CheckPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReportUnitDetail', @level2type=N'COLUMN',@level2name=N'RealPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˹�ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReportUnitDetail', @level2type=N'COLUMN',@level2name=N'PersonWorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReportUnitDetail', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˹�ʱ�±���λ��ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_MonthReportUnitDetail'
GO

ALTER TABLE [dbo].[SitePerson_MonthReportUnitDetail]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_MonthReportUnitDetail_Base_WorkPost] FOREIGN KEY([PostId])
REFERENCES [dbo].[Base_WorkPost] ([WorkPostId])
GO

ALTER TABLE [dbo].[SitePerson_MonthReportUnitDetail] CHECK CONSTRAINT [FK_SitePerson_MonthReportUnitDetail_Base_WorkPost]
GO

ALTER TABLE [dbo].[SitePerson_MonthReportUnitDetail]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_MonthReportUnitDetail_SitePerson_MonthReportDetail] FOREIGN KEY([MonthReportDetailId])
REFERENCES [dbo].[SitePerson_MonthReportDetail] ([MonthReportDetailId])
GO

ALTER TABLE [dbo].[SitePerson_MonthReportUnitDetail] CHECK CONSTRAINT [FK_SitePerson_MonthReportUnitDetail_SitePerson_MonthReportDetail]
GO

Create VIEW [dbo].[View_EduTrain_TrainFind]
AS
SELECT person.CardNo,person.PersonName,pu.ProjectId, unit.UnitId, unit.UnitName, post.WorkPostName, train.TrainTitle, 
       train.TrainStartDate,train.TrainEndDate, train.TrainTypeId,train.TeachHour,tt.TrainTypeName, trainDetail.CheckScore, trainDetail.CheckResult, 
       pu.UnitType
from  dbo.EduTrain_TrainRecordDetail trainDetail left join
      dbo.EduTrain_TrainRecord train ON train.TrainingId = trainDetail.TrainingId left join
      dbo.SitePerson_Person person ON person.PersonId = trainDetail.PersonId left join
      dbo.Base_WorkPost post ON post.WorkPostId = Person.WorkPostId left join
      dbo.Base_Unit unit ON unit.UnitId = person.UnitId left join
	  dbo.Project_ProjectUnit pu ON pu.UnitId = unit.UnitId left join
	  dbo.Base_TrainType tt ON tt.TrainTypeId=train.TrainTypeId
	  
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'r = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_EduTrain_TrainFind'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_EduTrain_TrainFind'
GO


--��ѵ��¼��ϸ�б�
CREATE VIEW [dbo].[View_EduTrain_TrainRecordDetail]  AS 
/*��ѵ��¼��ϸ�б���ͼ*/
SELECT trainRecordDetail.TrainDetailId, 
trainRecordDetail.TrainingId, 
trainRecordDetail.PersonId, 
trainRecordDetail.CheckScore,
trainRecordDetail.CheckResult,
unit.UnitName,
person.PersonName
FROM dbo.EduTrain_TrainRecordDetail AS trainRecordDetail
LEFT JOIN dbo.SitePerson_Person AS person ON person.PersonId = trainRecordDetail.PersonId
LEFT JOIN dbo.Base_Unit AS unit ON unit.UnitId=person.UnitId

GO


CREATE VIEW [dbo].[View_SitePerson_Checking]
AS
/*��Ա������ͼ*/
SELECT ch.CheckingId,ch.CardNo,ch.ProjectId,person.IdentityCard,ch.WorkAreaId,ch.IntoOutTime,ch.IntoOut,
       ch.[Address],area.WorkAreaName,person.PersonName,person.UnitId,unit.UnitName,ch.States
from  dbo.SitePerson_Checking ch 
      left join dbo.SitePerson_Person person on ch.CardNo=person.CardNo
      left join dbo.ProjectData_WorkArea area on ch.WorkAreaId=area.WorkAreaId
      left join dbo.Base_Unit unit on person.UnitId=unit.UnitId


GO




CREATE view [dbo].[View_SitePerson_DayReportUnitDetail]
as
/******�˹�ʱ�±���λ��ϸ�б�******/
SELECT dayReportUnitDetail.DayReportUnitDetailId
	,dayReportUnitDetail.DayReportDetailId
	,dayReportUnitDetail.PostId
	,dayReportUnitDetail.CheckPersonNum
	,dayReportUnitDetail.RealPersonNum
	,dayReportUnitDetail.PersonWorkTime
	,dayReportUnitDetail.Remark
	,Post.WorkPostName
	,Post.PostType
	,Post.WorkPostCode
  FROM SitePerson_DayReportUnitDetail AS  dayReportUnitDetail  
  LEFT JOIN Base_WorkPost AS Post ON Post.WorkPostId = dayReportUnitDetail.PostId 


GO


CREATE view [dbo].[View_SitePerson_MonthReportUnitDetail]
as
/******�˹�ʱ�±���λ��ϸ�б�******/
SELECT dayReportUnitDetail.MonthReportUnitDetailId
	,dayReportUnitDetail.MonthReportDetailId
	,dayReportUnitDetail.PostId
	,dayReportUnitDetail.CheckPersonNum
	,dayReportUnitDetail.RealPersonNum
	,dayReportUnitDetail.PersonWorkTime
	,dayReportUnitDetail.Remark
	,Post.WorkPostName
	,Post.PostType
	,Post.WorkPostCode
  FROM SitePerson_MonthReportUnitDetail AS  dayReportUnitDetail  
  LEFT JOIN Base_WorkPost AS Post ON Post.WorkPostId = dayReportUnitDetail.PostId 


GO


ALTER VIEW [dbo].[View_SitePerson_Person]
AS
SELECT Person.PersonId,
Person.CardNo,
Person.PersonName,
(Case Person.Sex WHEN '1' THEN '��' WHEN '2' THEN 'Ů' ELSE '' END) AS Sex, 
Person.IdentityCard, 
Person.Address, 
Person.ProjectId, 
Person.UnitId, 
Person.TeamGroupId, 
Person.WorkAreaId, 
Person.WorkPostId, 
Person.CertificateId, 
Person.CertificateCode, 
Person.CertificateLimitTime, 
Person.InTime, 
Person.OutTime, 
Person.OutResult, 
Person.Telephone, 
Person.PositionId, 
Person.PostTitleId, 
Person.PhotoUrl, 
(CASE Person.IsUsed WHEN 'TRUE' THEN '��' ELSE '��' END) AS IsUsed, 
(CASE Person.IsCardUsed WHEN 'TRUE' THEN '��' ELSE '��' END) AS IsCardUsed, 
Person.PersonIndex,
Project.ProjectCode,
Project.ProjectName,
Unit.UnitCode,
Unit.UnitName,
TeamGroup.TeamGroupName,
WorkArea.WorkAreaCode,
WorkArea.WorkAreaName,
Post.WorkPostName,
Certificat.CertificateName,
Position.PositionName,
Title.PostTitleName
FROM SitePerson_Person AS Person
LEFT JOIN Base_Project AS Project ON Project.ProjectId=Person.ProjectId
LEFT JOIN Base_Unit AS Unit ON Unit.UnitId = Person.UnitId
LEFT JOIN ProjectData_TeamGroup AS TeamGroup ON TeamGroup.TeamGroupId=Person.TeamGroupId
LEFT JOIN ProjectData_WorkArea AS WorkArea ON WorkArea.WorkAreaId = Person.WorkAreaId
LEFT JOIN Base_WorkPost AS Post ON Post.WorkPostId = Person.WorkPostId
LEFT JOIN Base_Certificate AS Certificat ON Certificat.CertificateId=Person.CertificateId
LEFT JOIN Base_Position AS Position ON Position.PositionId = Person.PositionId
Left JOIN Base_PostTitle AS Title ON Title.PostTitleId = Person.PostTitleId


GO


CREATE PROCEDURE [dbo].[SpPersonStatistic]
@ProjectId nvarchar(50),
@StartTime nvarchar(15),
@EndTime nvarchar(15)
AS
BEGIN
select u.UnitName,w.WorkAreaName,post.WorkPostName,PersonCount 
from
	(select UnitId,WorkareaId,PostId,COUNT(*) as PersonCount
	from 
		(select distinct CardNo ,
		(select UnitId from SitePerson_Person where CardNo = SitePerson_Checking.CardNo) as UnitId,
		(select isnull(workpostid,'') from SitePerson_Person where CardNo = SitePerson_Checking.CardNo) as PostId,
		(select isnull(workareaid,'') from SitePerson_Person where CardNo = SitePerson_Checking.CardNo) as WorkareaId,
		CONVERT(date,intoouttime) as CheckDate from SitePerson_Checking) pc
	where CheckDate>=@StartTime and CheckDate <=@EndTime
	group by UnitId,workareaid,PostId) p
left join Base_Unit u on u.unitId=p.UnitId
left join Project_ProjectUnit pu on pu.UnitId = u.UnitId
left join ProjectData_WorkArea w on w.WorkAreaId=p.WorkAreaId
left join Base_WorkPost post on post.WorkPostId=p.PostId
where pu.ProjectId = @ProjectId
order by UnitName,WorkAreaName,post.workPostCode
END


GO

CREATE VIEW [dbo].[HSSE_View_SendCard]
AS
select distinct person.PersonId,person.CardNo,person.PersonName,person.IdentityCard,unit.UnitName,
       person.UnitId, post.WorkPostName, work.WorkAreaName,person.ProjectId
from dbo.SitePerson_Person person
left join dbo.Base_Unit unit on unit.UnitId=person.UnitId
left join dbo.Base_WorkPost post on post.WorkPostId=person.WorkPostId
left join dbo.ProjectData_WorkArea work on work.WorkAreaId=person.WorkAreaId 
where SendCardNo is null 
GO

	
CREATE TABLE [dbo].[QualityAudit_EquipmentQuality](
	[EquipmentQualityId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[EquipmentQualityCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[SpecialEquipmentId] [nvarchar](50) NOT NULL,
	[EquipmentQualityName] [nvarchar](50) NULL,
	[SizeModel] [nvarchar](50) NULL,
	[FactoryCode] [nvarchar](50) NULL,
	[CertificateCode] [nvarchar](50) NULL,
	[CheckDate] [datetime] NULL,
	[LimitDate] [datetime] NOT NULL,
	[InDate] [datetime] NULL,
	[OutDate] [datetime] NULL,
	[ApprovalPerson] [nvarchar](20) NULL,
	[CarNum] [nvarchar](50) NULL,
	[Remark] [nvarchar](500) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_QualityAudit_EquipmentQuality] PRIMARY KEY CLUSTERED 
(
	[EquipmentQualityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'EquipmentQualityId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'EquipmentQualityCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ֻ����豸����Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'SpecialEquipmentId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'EquipmentQualityName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ͺ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'SizeModel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'FactoryCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϸ�֤���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'CertificateCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'CheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ч����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'LimitDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�볡ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'InDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'OutDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'ApprovalPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'CarNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQuality', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������豸����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_EquipmentQuality'
GO

ALTER TABLE [dbo].[QualityAudit_EquipmentQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_EquipmentQuality_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[QualityAudit_EquipmentQuality] CHECK CONSTRAINT [FK_QualityAudit_EquipmentQuality_Base_Project]
GO

ALTER TABLE [dbo].[QualityAudit_EquipmentQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_EquipmentQuality_Base_SpecialEquipment] FOREIGN KEY([SpecialEquipmentId])
REFERENCES [dbo].[Base_SpecialEquipment] ([SpecialEquipmentId])
GO

ALTER TABLE [dbo].[QualityAudit_EquipmentQuality] CHECK CONSTRAINT [FK_QualityAudit_EquipmentQuality_Base_SpecialEquipment]
GO

ALTER TABLE [dbo].[QualityAudit_EquipmentQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_EquipmentQuality_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[QualityAudit_EquipmentQuality] CHECK CONSTRAINT [FK_QualityAudit_EquipmentQuality_Base_Unit]
GO

ALTER TABLE [dbo].[QualityAudit_EquipmentQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_EquipmentQuality_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[QualityAudit_EquipmentQuality] CHECK CONSTRAINT [FK_QualityAudit_EquipmentQuality_Sys_User]
GO




CREATE TABLE [dbo].[QualityAudit_GeneralEquipmentQuality](
	[GeneralEquipmentQualityId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[GeneralEquipmentQualityCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[SpecialEquipmentId] [nvarchar](50) NOT NULL,
	[EquipmentCount] [int] NULL,
	[IsQualified] [bit] NULL,
	[Remark] [nvarchar](500) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_QualityAudit_GeneralEquipmentQuality] PRIMARY KEY CLUSTERED 
(
	[GeneralEquipmentQualityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_GeneralEquipmentQuality', @level2type=N'COLUMN',@level2name=N'GeneralEquipmentQualityId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_GeneralEquipmentQuality', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_GeneralEquipmentQuality', @level2type=N'COLUMN',@level2name=N'GeneralEquipmentQualityCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_GeneralEquipmentQuality', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����豸����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_GeneralEquipmentQuality', @level2type=N'COLUMN',@level2name=N'SpecialEquipmentId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_GeneralEquipmentQuality', @level2type=N'COLUMN',@level2name=N'EquipmentCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�ϸ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_GeneralEquipmentQuality', @level2type=N'COLUMN',@level2name=N'IsQualified'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_GeneralEquipmentQuality', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_GeneralEquipmentQuality', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_GeneralEquipmentQuality', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'һ������豸����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_GeneralEquipmentQuality'
GO

ALTER TABLE [dbo].[QualityAudit_GeneralEquipmentQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_GeneralEquipmentQuality_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[QualityAudit_GeneralEquipmentQuality] CHECK CONSTRAINT [FK_QualityAudit_GeneralEquipmentQuality_Base_Project]
GO

ALTER TABLE [dbo].[QualityAudit_GeneralEquipmentQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_GeneralEquipmentQuality_Base_SpecialEquipment] FOREIGN KEY([SpecialEquipmentId])
REFERENCES [dbo].[Base_SpecialEquipment] ([SpecialEquipmentId])
GO

ALTER TABLE [dbo].[QualityAudit_GeneralEquipmentQuality] CHECK CONSTRAINT [FK_QualityAudit_GeneralEquipmentQuality_Base_SpecialEquipment]
GO

ALTER TABLE [dbo].[QualityAudit_GeneralEquipmentQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_GeneralEquipmentQuality_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[QualityAudit_GeneralEquipmentQuality] CHECK CONSTRAINT [FK_QualityAudit_GeneralEquipmentQuality_Base_Unit]
GO

ALTER TABLE [dbo].[QualityAudit_GeneralEquipmentQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_GeneralEquipmentQuality_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[QualityAudit_GeneralEquipmentQuality] CHECK CONSTRAINT [FK_QualityAudit_GeneralEquipmentQuality_Sys_User]
GO




CREATE TABLE [dbo].[QualityAudit_InUnit](
	[InUnitId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[InUnitCode] [nvarchar](50) NOT NULL,
	[ManufacturerName] [nvarchar](100) NULL,
	[HSEMan] [nvarchar](20) NULL,
	[HeadTel] [nvarchar](20) NULL,
	[InDate] [datetime] NULL,
	[PersonCount] [int] NULL,
	[TrainNum] [int] NULL,
	[OutDate] [datetime] NULL,
	[BadgesIssued] [nvarchar](50) NULL,
	[JobTicketValidity] [datetime] NULL,
	[TrainRecordsUrl] [nvarchar](500) NULL,
	[PlanUrl] [nvarchar](500) NULL,
	[TemporaryPersonUrl] [nvarchar](500) NULL,
	[InPersonTrainUrl] [nvarchar](500) NULL,
	[Accommodation] [nvarchar](500) NULL,
	[OperationTicket] [nvarchar](500) NULL,
	[LaborSituation] [nvarchar](500) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_QualityAudit_InUnit] PRIMARY KEY CLUSTERED 
(
	[InUnitId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_InUnit', @level2type=N'COLUMN',@level2name=N'InUnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_InUnit', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_InUnit', @level2type=N'COLUMN',@level2name=N'InUnitCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_InUnit', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����˼���ȫԱ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_InUnit', @level2type=N'COLUMN',@level2name=N'HSEMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����˵绰' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_InUnit', @level2type=N'COLUMN',@level2name=N'HeadTel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�볡ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_InUnit', @level2type=N'COLUMN',@level2name=N'InDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ա����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_InUnit', @level2type=N'COLUMN',@level2name=N'PersonCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_InUnit', @level2type=N'COLUMN',@level2name=N'TrainNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�볡ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_InUnit', @level2type=N'COLUMN',@level2name=N'OutDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ؿ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_InUnit', @level2type=N'COLUMN',@level2name=N'BadgesIssued'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵƱ��Ч��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_InUnit', @level2type=N'COLUMN',@level2name=N'JobTicketValidity'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ��¼����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_InUnit', @level2type=N'COLUMN',@level2name=N'TrainRecordsUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������������鸽��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_InUnit', @level2type=N'COLUMN',@level2name=N'PlanUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ʱ������Ա��ѵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_InUnit', @level2type=N'COLUMN',@level2name=N'TemporaryPersonUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����볡��ȫ��Ա��ѵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_InUnit', @level2type=N'COLUMN',@level2name=N'InPersonTrainUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ס�޼��ϰ೵�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_InUnit', @level2type=N'COLUMN',@level2name=N'Accommodation'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ������ҵƱ�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_InUnit', @level2type=N'COLUMN',@level2name=N'OperationTicket'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ͱ���Ʒ���������Ѻ�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_InUnit', @level2type=N'COLUMN',@level2name=N'LaborSituation'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_InUnit', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_InUnit', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

ALTER TABLE [dbo].[QualityAudit_InUnit]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_InUnit_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[QualityAudit_InUnit] CHECK CONSTRAINT [FK_QualityAudit_InUnit_Base_Project]
GO




CREATE TABLE [dbo].[QualityAudit_ManagePersonQuality](
	[ManagePersonQualityId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[ManagePersonQualityCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[PersonId] [nvarchar](50) NOT NULL,
	[WorkPostId] [nvarchar](50) NULL,
	[CertificateNo] [nvarchar](50) NOT NULL,
	[CertificateName] [nvarchar](50) NOT NULL,
	[Grade] [nvarchar](50) NULL,
	[SendUnit] [nvarchar](50) NOT NULL,
	[SendDate] [datetime] NOT NULL,
	[LimitDate] [datetime] NOT NULL,
	[LateCheckDate] [datetime] NULL,
	[ApprovalPerson] [nvarchar](50) NULL,
	[Remark] [nvarchar](500) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_QualityAudit_ManagePersonQuality] PRIMARY KEY CLUSTERED 
(
	[ManagePersonQualityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQuality', @level2type=N'COLUMN',@level2name=N'ManagePersonQualityId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQuality', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQuality', @level2type=N'COLUMN',@level2name=N'ManagePersonQualityCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQuality', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ԱID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQuality', @level2type=N'COLUMN',@level2name=N'PersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQuality', @level2type=N'COLUMN',@level2name=N'WorkPostId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'֤����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQuality', @level2type=N'COLUMN',@level2name=N'CertificateNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'֤������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQuality', @level2type=N'COLUMN',@level2name=N'CertificateName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQuality', @level2type=N'COLUMN',@level2name=N'Grade'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��֤��λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQuality', @level2type=N'COLUMN',@level2name=N'SendUnit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��֤ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQuality', @level2type=N'COLUMN',@level2name=N'SendDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ч����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQuality', @level2type=N'COLUMN',@level2name=N'LimitDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����������� ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQuality', @level2type=N'COLUMN',@level2name=N'LateCheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��֤������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQuality', @level2type=N'COLUMN',@level2name=N'ApprovalPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQuality', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQuality', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQuality', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Ա����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ManagePersonQuality'
GO

ALTER TABLE [dbo].[QualityAudit_ManagePersonQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_ManagePersonQuality_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[QualityAudit_ManagePersonQuality] CHECK CONSTRAINT [FK_QualityAudit_ManagePersonQuality_Base_Project]
GO

ALTER TABLE [dbo].[QualityAudit_ManagePersonQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_ManagePersonQuality_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[QualityAudit_ManagePersonQuality] CHECK CONSTRAINT [FK_QualityAudit_ManagePersonQuality_Base_Unit]
GO

ALTER TABLE [dbo].[QualityAudit_ManagePersonQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_ManagePersonQuality_Base_WorkPost] FOREIGN KEY([WorkPostId])
REFERENCES [dbo].[Base_WorkPost] ([WorkPostId])
GO

ALTER TABLE [dbo].[QualityAudit_ManagePersonQuality] CHECK CONSTRAINT [FK_QualityAudit_ManagePersonQuality_Base_WorkPost]
GO

ALTER TABLE [dbo].[QualityAudit_ManagePersonQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_ManagePersonQuality_SitePerson_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[SitePerson_Person] ([PersonId])
GO

ALTER TABLE [dbo].[QualityAudit_ManagePersonQuality] CHECK CONSTRAINT [FK_QualityAudit_ManagePersonQuality_SitePerson_Person]
GO

ALTER TABLE [dbo].[QualityAudit_ManagePersonQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_ManagePersonQuality_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[QualityAudit_ManagePersonQuality] CHECK CONSTRAINT [FK_QualityAudit_ManagePersonQuality_Sys_User]
GO




CREATE TABLE [dbo].[QualityAudit_PersonQuality](
	[PersonQualityId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[PersonQualityCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[PersonId] [nvarchar](50) NOT NULL,
	[WorkPostId] [nvarchar](50) NULL,
	[CertificateNo] [nvarchar](50) NULL,
	[CertificateName] [nvarchar](50) NULL,
	[Grade] [nvarchar](50) NULL,
	[SendUnit] [nvarchar](50) NULL,
	[SendDate] [datetime] NULL,
	[LimitDate] [datetime] NULL,
	[LateCheckDate] [datetime] NULL,
	[ApprovalPerson] [nvarchar](10) NULL,
	[Remark] [nvarchar](500) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_QualityAudit_PersonQuality] PRIMARY KEY CLUSTERED 
(
	[PersonQualityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'PersonQualityId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ա���ʼ�¼���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'PersonQualityCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ԱId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'PersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'WorkPostId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ظ�֤����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'CertificateNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ظ�֤������ ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'CertificateName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'Grade'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��֤��λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'SendUnit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��֤ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'SendDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ч����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'LimitDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'LateCheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��֤������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_PersonQuality', @level2type=N'COLUMN',@level2name=N'ApprovalPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����λ��Ա����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_PersonQuality'
GO

ALTER TABLE [dbo].[QualityAudit_PersonQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_PersonQuality_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[QualityAudit_PersonQuality] CHECK CONSTRAINT [FK_QualityAudit_PersonQuality_Base_Project]
GO

ALTER TABLE [dbo].[QualityAudit_PersonQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_PersonQuality_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[QualityAudit_PersonQuality] CHECK CONSTRAINT [FK_QualityAudit_PersonQuality_Base_Unit]
GO

ALTER TABLE [dbo].[QualityAudit_PersonQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_PersonQuality_Base_WorkPost] FOREIGN KEY([WorkPostId])
REFERENCES [dbo].[Base_WorkPost] ([WorkPostId])
GO

ALTER TABLE [dbo].[QualityAudit_PersonQuality] CHECK CONSTRAINT [FK_QualityAudit_PersonQuality_Base_WorkPost]
GO

ALTER TABLE [dbo].[QualityAudit_PersonQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_PersonQuality_SitePerson_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[SitePerson_Person] ([PersonId])
GO

ALTER TABLE [dbo].[QualityAudit_PersonQuality] CHECK CONSTRAINT [FK_QualityAudit_PersonQuality_SitePerson_Person]
GO

ALTER TABLE [dbo].[QualityAudit_PersonQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_PersonQuality_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[QualityAudit_PersonQuality] CHECK CONSTRAINT [FK_QualityAudit_PersonQuality_Sys_User]
GO




CREATE TABLE [dbo].[QualityAudit_ProjectRecord](
	[ProjectRecordId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[ProjectRecordCode] [nvarchar](50) NOT NULL,
	[ProjectRecordName] [nvarchar](200) NOT NULL,
	[Remark] [nvarchar](500) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_QualityAudit_ProjectRecord] PRIMARY KEY CLUSTERED 
(
	[ProjectRecordId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ProjectRecord', @level2type=N'COLUMN',@level2name=N'ProjectRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ProjectRecord', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ProjectRecord', @level2type=N'COLUMN',@level2name=N'ProjectRecordCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ProjectRecord', @level2type=N'COLUMN',@level2name=N'ProjectRecordName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ProjectRecord', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ProjectRecord', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_ProjectRecord', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

ALTER TABLE [dbo].[QualityAudit_ProjectRecord]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_ProjectRecord_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[QualityAudit_ProjectRecord] CHECK CONSTRAINT [FK_QualityAudit_ProjectRecord_Base_Project]
GO

ALTER TABLE [dbo].[QualityAudit_ProjectRecord]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_ProjectRecord_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[QualityAudit_ProjectRecord] CHECK CONSTRAINT [FK_QualityAudit_ProjectRecord_Sys_User]
GO



CREATE TABLE [dbo].[QualityAudit_SafePersonQuality](
	[SafePersonQualityId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[SafePersonQualityCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[PersonId] [nvarchar](50) NOT NULL,
	[WorkPostId] [nvarchar](50) NULL,
	[CertificateNo] [nvarchar](50) NOT NULL,
	[CertificateName] [nvarchar](50) NOT NULL,
	[Grade] [nvarchar](50) NULL,
	[SendUnit] [nvarchar](50) NOT NULL,
	[SendDate] [datetime] NOT NULL,
	[LimitDate] [datetime] NOT NULL,
	[LateCheckDate] [datetime] NULL,
	[ApprovalPerson] [nvarchar](50) NULL,
	[Remark] [nvarchar](500) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_QualityAudit_SafePersonQuality] PRIMARY KEY CLUSTERED 
(
	[SafePersonQualityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'SafePersonQualityId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'SafePersonQualityCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ԱID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'PersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'WorkPostId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'֤����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'CertificateNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'֤������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'CertificateName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'Grade'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��֤��λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'SendUnit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��֤ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'SendDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ч����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'LimitDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����������� ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'LateCheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��֤������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'ApprovalPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ��Ա����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SafePersonQuality'
GO

ALTER TABLE [dbo].[QualityAudit_SafePersonQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_SafePersonQuality_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[QualityAudit_SafePersonQuality] CHECK CONSTRAINT [FK_QualityAudit_SafePersonQuality_Base_Project]
GO

ALTER TABLE [dbo].[QualityAudit_SafePersonQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_SafePersonQuality_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[QualityAudit_SafePersonQuality] CHECK CONSTRAINT [FK_QualityAudit_SafePersonQuality_Base_Unit]
GO

ALTER TABLE [dbo].[QualityAudit_SafePersonQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_SafePersonQuality_Base_WorkPost] FOREIGN KEY([WorkPostId])
REFERENCES [dbo].[Base_WorkPost] ([WorkPostId])
GO

ALTER TABLE [dbo].[QualityAudit_SafePersonQuality] CHECK CONSTRAINT [FK_QualityAudit_SafePersonQuality_Base_WorkPost]
GO

ALTER TABLE [dbo].[QualityAudit_SafePersonQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_SafePersonQuality_SitePerson_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[SitePerson_Person] ([PersonId])
GO

ALTER TABLE [dbo].[QualityAudit_SafePersonQuality] CHECK CONSTRAINT [FK_QualityAudit_SafePersonQuality_SitePerson_Person]
GO

ALTER TABLE [dbo].[QualityAudit_SafePersonQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_SafePersonQuality_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[QualityAudit_SafePersonQuality] CHECK CONSTRAINT [FK_QualityAudit_SafePersonQuality_Sys_User]
GO




CREATE TABLE [dbo].[QualityAudit_SubUnitQuality](
	[SubUnitQualityId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NULL,
	[SubUnitQualityCode] [nvarchar](50) NULL,
	[SubUnitQualityName] [nvarchar](100) NULL,
	[BusinessLicense] [nvarchar](50) NULL,
	[BL_EnableDate] [datetime] NULL,
	[BL_ScanUrl] [nvarchar](500) NULL,
	[OrganCode] [nvarchar](50) NULL,
	[O_EnableDate] [datetime] NULL,
	[O_ScanUrl] [nvarchar](500) NULL,
	[Certificate] [nvarchar](50) NULL,
	[C_EnableDate] [datetime] NULL,
	[C_ScanUrl] [nvarchar](500) NULL,
	[QualityLicense] [nvarchar](50) NULL,
	[QL_EnableDate] [datetime] NULL,
	[QL_ScanUrl] [nvarchar](500) NULL,
	[HSELicense] [nvarchar](50) NULL,
	[H_EnableDate] [datetime] NULL,
	[H_ScanUrl] [nvarchar](500) NULL,
	[SecurityLicense] [nvarchar](50) NULL,
	[SL_EnableDate] [datetime] NULL,
	[SL_ScanUrl] [nvarchar](500) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_QualityAudit_SubUnitQuality] PRIMARY KEY CLUSTERED 
(
	[SubUnitQualityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'SubUnitQualityId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ������ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'SubUnitQualityCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ�����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'SubUnitQualityName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ӫҵִ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'BusinessLicense'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ӫҵִ����Ч��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'BL_EnableDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ӫҵִ��ɨ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'BL_ScanUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'OrganCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����������Ч��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'O_EnableDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������ɨ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'O_ScanUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����֤��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'Certificate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����֤����Ч��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'C_EnableDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����֤��ɨ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'C_ScanUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ϵ��֤֤��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'QualityLicense'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ϵ��֤֤����Ч��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'QL_EnableDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ϵ֤��ɨ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'QL_ScanUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE��ϵ��֤֤��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'HSELicense'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE��ϵ��֤֤����Ч��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'H_EnableDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE��ϵ��֤֤��ɨ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'H_ScanUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ�������֤' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'SecurityLicense'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ�������֤��Ч��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'SL_EnableDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ���֤ɨ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'SL_ScanUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QualityAudit_SubUnitQuality'
GO

ALTER TABLE [dbo].[QualityAudit_SubUnitQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_SubUnitQuality_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[QualityAudit_SubUnitQuality] CHECK CONSTRAINT [FK_QualityAudit_SubUnitQuality_Base_Project]
GO

ALTER TABLE [dbo].[QualityAudit_SubUnitQuality]  WITH CHECK ADD  CONSTRAINT [FK_QualityAudit_SubUnitQuality_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[QualityAudit_SubUnitQuality] CHECK CONSTRAINT [FK_QualityAudit_SubUnitQuality_Base_Unit]
GO


