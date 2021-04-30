UPDATE Sys_MenuProjectA SET SortIndex=35 WHERE MenuId='9EFF1A0F-87AA-43E7-83B0-79EEAAC8848E'
GO
--增加审核单价、审核明细
ALTER TABLE CostGoods_CostManageItem ADD AuditCounts INT NULL
GO
ALTER TABLE CostGoods_CostManageItem ADD AuditPriceMoney DECIMAL(18,2) NULL
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManageItem', @level2type=N'COLUMN',@level2name=N'AuditCounts'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核单价（元）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_CostManageItem', @level2type=N'COLUMN',@level2name=N'AuditPriceMoney'
GO

--数据交换表
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_DataExchange', @level2type=N'COLUMN',@level2name=N'DataID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提取时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_DataExchange', @level2type=N'COLUMN',@level2name=N'GetTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_DataExchange', @level2type=N'COLUMN',@level2name=N'MessageText'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来源系统' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_DataExchange', @level2type=N'COLUMN',@level2name=N'FromSystem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收系统' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_DataExchange', @level2type=N'COLUMN',@level2name=N'ToSystem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否更新' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_DataExchange', @level2type=N'COLUMN',@level2name=N'IsUpdate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据交换表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_DataExchange'
GO

--新增数据接收id
ALTER TABLE Base_Project ADD FromProjectId nvarchar(50) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据接收项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Project', @level2type=N'COLUMN',@level2name=N'FromProjectId'
GO

ALTER TABLE Base_Unit ADD FromUnitId nvarchar(50) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据接收单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Unit', @level2type=N'COLUMN',@level2name=N'FromUnitId'
GO

ALTER TABLE SitePerson_Person ADD FromPersonId nvarchar(50) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据接收人员ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'FromPersonId'
GO

ALTER TABLE EduTrain_TrainRecord ADD FromRecordId nvarchar(50) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据接收培训ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainRecord', @level2type=N'COLUMN',@level2name=N'FromRecordId'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'TrainTestId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'TrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试卷编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'ExamNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试批次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'GroupNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'课程ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'CourseID'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'COrder'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'QsnCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题库id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'QsnId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试题内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'QsnContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'题库文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'QsnFileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'QsnAnswer'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试题分类（1-文字题，2-多媒体题，3-图片题）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'QsnCategory'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试题类型 （1-单选，2-多选，3-判断）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'QsnKind'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'Description'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重要程度（0-容易，1-一般，2-困难）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'QsnImportant'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试题解析' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'Analysis'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上传时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest', @level2type=N'COLUMN',@level2name=N'UploadTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训试题表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainTest'
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'员工名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'EmpName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'证件号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'IdentifyId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工种名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'CategoryName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训记录ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'RecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'DepartId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'DepartName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训学时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'TrainPeriod'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'TotalScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成绩(-1代表该次培训无考试,否则为实际成绩)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'Score'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否合格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'IsPass'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试批次号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'GroupNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试卷编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'ExamNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考试次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'ExamCount'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'DeviceNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属项目部Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'OwnerDepartId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答案' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'Answers'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训记录名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'RecordName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'TrainType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出卷类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'PaperMode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'TrainMode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训负责人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'TrainPrincipal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'TrainStartDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'TrainEndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'TrainContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训详细信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord', @level2type=N'COLUMN',@level2name=N'TrainDescript'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训人员记录(博晟接口备用)表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EduTrain_TrainPersonRecord'
GO
