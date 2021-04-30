UPDATE Sys_MenuProjectA SET SortIndex=35 WHERE MenuId='9EFF1A0F-87AA-43E7-83B0-79EEAAC8848E'
GO
--������˵��ۡ������ϸ
ALTER TABLE CostGoods_CostManageItem ADD AuditCounts INT NULL
GO
ALTER TABLE CostGoods_CostManageItem ADD AuditPriceMoney DECIMAL(18,2) NULL
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManageItem', @level2type=N'COLUMN',@level2name=N'AuditCounts'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��˵��ۣ�Ԫ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManageItem', @level2type=N'COLUMN',@level2name=N'AuditPriceMoney'
GO

--���ݽ�����
CREATE TABLE [dbo].[Sys_DataExchange](
	[DataID] [int] NOT NULL,
	[GetTime] [datetime] NULL,
	[MessageText] [nvarchar](max) NULL,
	[FromSystem] [nvarchar](50) NULL,
	[ToSystem] [nvarchar](50) NULL,
	[IsUpdate] [bit] NULL,
 CONSTRAINT [PK_Sys_DataExchange] PRIMARY KEY CLUSTERED 
(
	[DataID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Sys_DataExchange] ADD  CONSTRAINT [DF_Sys_DataExchange_DataID]  DEFAULT ((0)) FOR [DataID]
GO

ALTER TABLE [dbo].[Sys_DataExchange] ADD  CONSTRAINT [DF_Sys_DataExchange_IsUpdate]  DEFAULT ((0)) FOR [IsUpdate]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_DataExchange', @level2type=N'COLUMN',@level2name=N'DataID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȡʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_DataExchange', @level2type=N'COLUMN',@level2name=N'GetTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_DataExchange', @level2type=N'COLUMN',@level2name=N'MessageText'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Դϵͳ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_DataExchange', @level2type=N'COLUMN',@level2name=N'FromSystem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ϵͳ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_DataExchange', @level2type=N'COLUMN',@level2name=N'ToSystem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_DataExchange', @level2type=N'COLUMN',@level2name=N'IsUpdate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ݽ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_DataExchange'
GO

--�������ݽ���id
ALTER TABLE Base_Project ADD FromProjectId nvarchar(50) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ݽ�����ĿID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Project', @level2type=N'COLUMN',@level2name=N'FromProjectId'
GO

ALTER TABLE Base_Unit ADD FromUnitId nvarchar(50) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ݽ��յ�λID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Unit', @level2type=N'COLUMN',@level2name=N'FromUnitId'
GO

ALTER TABLE SitePerson_Person ADD FromPersonId nvarchar(50) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ݽ�����ԱID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'FromPersonId'
GO

ALTER TABLE EduTrain_TrainRecord ADD FromRecordId nvarchar(50) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ݽ�����ѵID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecord', @level2type=N'COLUMN',@level2name=N'FromRecordId'
GO

ALTER TABLE EduTrain_TrainRecord ALTER COLUMN Remark NVARCHAR(2000) NULL
GO

/****** Object:  Table [dbo].[EduTrain_TrainTest]    Script Date: 2019/7/5 16:00:29 ******/
DROP TABLE [dbo].[EduTrain_TrainTest]
GO

/****** Object:  Table [dbo].[EduTrain_TrainTest]    Script Date: 2019/7/5 16:00:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EduTrain_TrainTest](
	[TrainTestId] [nvarchar](50) NOT NULL,
	[TrainingId] [nvarchar](50) NOT NULL,
	[ExamNo] [nvarchar](50) NULL,
	[GroupNo] [nvarchar](10) NULL,
	[CourseID] [nvarchar](50) NULL,
	[COrder] [int] NULL,
	[QsnCode] [nvarchar](50) NULL,
	[QsnId] [nvarchar](50) NULL,
	[QsnContent] [nvarchar](2000) NULL,
	[QsnFileName] [nvarchar](200) NULL,
	[QsnAnswer] [nvarchar](500) NULL,
	[QsnCategory] [nvarchar](10) NULL,
	[QsnKind] [nvarchar](10) NULL,
	[Description] [nvarchar](500) NULL,
	[QsnImportant] [nvarchar](10) NULL,
	[Analysis] [nvarchar](500) NULL,
	[UploadTime] [datetime] NULL,
 CONSTRAINT [PK_EduTrain_TrainTest] PRIMARY KEY CLUSTERED 
(
	[TrainTestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[EduTrain_TrainTest]  WITH CHECK ADD  CONSTRAINT [FK_EduTrain_TrainTest_EduTrain_TrainRecord] FOREIGN KEY([TrainingId])
REFERENCES [dbo].[EduTrain_TrainRecord] ([TrainingId])
GO

ALTER TABLE [dbo].[EduTrain_TrainTest] CHECK CONSTRAINT [FK_EduTrain_TrainTest_EduTrain_TrainRecord]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'TrainTestId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ��¼ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'TrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ծ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'ExamNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'GroupNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�γ�ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'CourseID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'COrder'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'QsnCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'QsnId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'QsnContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ļ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'QsnFileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'QsnAnswer'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ࣨ1-�����⣬2-��ý���⣬3-ͼƬ�⣩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'QsnCategory'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������� ��1-��ѡ��2-��ѡ��3-�жϣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'QsnKind'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'˵��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'Description'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ҫ�̶ȣ�0-���ף�1-һ�㣬2-���ѣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'QsnImportant'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'Analysis'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϴ�ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'UploadTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest'
GO



CREATE TABLE [dbo].[EduTrain_TrainPersonRecord](
	[ID] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[EmpName] [nvarchar](50) NULL,
	[IdentifyId] [nvarchar](50) NULL,
	[CategoryName] [nvarchar](20) NULL,
	[RecordId] [nvarchar](50) NULL,
	[DepartId] [nvarchar](50) NULL,
	[DepartName] [nvarchar](150) NULL,
	[TrainPeriod] [nvarchar](10) NULL,
	[TotalScore] [nvarchar](10) NULL,
	[PassScore] [nvarchar](10) NULL,
	[Score] [nvarchar](10) NULL,
	[IsPass] [bit] NULL,
	[GroupNo] [nvarchar](10) NULL,
	[ExamNo] [nvarchar](50) NULL,
	[ExamCount] [nvarchar](10) NULL,
	[DeviceNo] [nvarchar](20) NULL,
	[OwnerDepartId] [nvarchar](50) NULL,
	[Answers] [nvarchar](500) NULL,
	[RecordName] [nvarchar](200) NULL,
	[TrainType] [nvarchar](50) NULL,
	[PaperMode] [nvarchar](50) NULL,
	[TrainMode] [nvarchar](50) NULL,
	[TrainPrincipal] [nvarchar](50) NULL,
	[TrainStartDate] [datetime] NULL,
	[TrainEndDate] [datetime] NULL,
	[TrainContent] [nvarchar](500) NULL,
	[TrainDescript] [nvarchar](2000) NULL,
 CONSTRAINT [PK_EduTrain_TrainPersonRecord] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[EduTrain_TrainPersonRecord]  WITH CHECK ADD  CONSTRAINT [FK_EduTrain_TrainPersonRecord_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[EduTrain_TrainPersonRecord] CHECK CONSTRAINT [FK_EduTrain_TrainPersonRecord_Base_Project]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ա������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'EmpName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'֤������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'IdentifyId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'CategoryName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ��¼ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'RecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'DepartId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'DepartName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵѧʱ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'TrainPeriod'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ܷ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'TotalScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ɼ�(-1����ô���ѵ�޿���,����Ϊʵ�ʳɼ�)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'Score'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�ϸ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'IsPass'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������κ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'GroupNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ծ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'ExamNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Դ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'ExamCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�豸���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'DeviceNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Ŀ��Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'OwnerDepartId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'Answers'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ��¼����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'RecordName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'TrainType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'PaperMode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ��ʽ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'TrainMode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'TrainPrincipal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ��ʼʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'TrainStartDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'TrainEndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'TrainContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ��ϸ��Ϣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'TrainDescript'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѵ��Ա��¼(���ɽӿڱ���)��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord'
GO
