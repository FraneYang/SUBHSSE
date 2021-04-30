CREATE TABLE [dbo].[SitePerson_PersonInOutNumber](
	[PersonInOutNumberId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[InOutDate] [datetime] NOT NULL,
	[PersonNum] [int] NULL,
	[WorkHours] [int] NULL,
 CONSTRAINT [PK_SitePerson_PersonInOutNumber] PRIMARY KEY CLUSTERED 
(
	[PersonInOutNumberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SitePerson_PersonInOutNumber] ADD  CONSTRAINT [DF_SitePerson_PersonInOutNumber_PersonNum]  DEFAULT ((0)) FOR [PersonNum]
GO

ALTER TABLE [dbo].[SitePerson_PersonInOutNumber] ADD  CONSTRAINT [DF_SitePerson_PersonInOutNumber_WorkHours]  DEFAULT ((0)) FOR [WorkHours]
GO

ALTER TABLE [dbo].[SitePerson_PersonInOutNumber]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_PersonInOutNumber_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SitePerson_PersonInOutNumber] CHECK CONSTRAINT [FK_SitePerson_PersonInOutNumber_Base_Project]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_PersonInOutNumber', @level2type=N'COLUMN',@level2name=N'PersonInOutNumberId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_PersonInOutNumber', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_PersonInOutNumber', @level2type=N'COLUMN',@level2name=N'InOutDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_PersonInOutNumber', @level2type=N'COLUMN',@level2name=N'PersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人工时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_PersonInOutNumber', @level2type=N'COLUMN',@level2name=N'WorkHours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出入人数及工时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_PersonInOutNumber'
GO

ALTER TABLE Check_RectifyNotices ADD CompleteManId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'CompleteManId'
GO
ALTER TABLE [dbo].[Check_RectifyNotices]  WITH CHECK ADD  CONSTRAINT [FK_Check_RectifyNotices_Sys_User3] FOREIGN KEY([CompleteManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO
ALTER TABLE [dbo].[Check_RectifyNotices] CHECK CONSTRAINT [FK_Check_RectifyNotices_Sys_User3]
GO

ALTER TABLE Check_RectifyNotices ADD CheckManNames NVARCHAR(2000) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'CheckManNames'
GO

ALTER TABLE Check_RectifyNotices ADD HiddenHazardType NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隐患类型（1-一般；2-较大；3-重大）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'HiddenHazardType'
GO
ALTER TABLE Check_RectifyNotices ADD SignPersonIsAgree Bit NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总包单位项目安全经理是否同意' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'SignPersonIsAgree'
GO
ALTER TABLE Check_RectifyNotices ADD ProfessionalEngineerId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专业工程师ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'ProfessionalEngineerId'
GO
ALTER TABLE [dbo].[Check_RectifyNotices]  WITH CHECK ADD  CONSTRAINT [FK_Check_RectifyNotices_Sys_User4] FOREIGN KEY([ProfessionalEngineerId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO
ALTER TABLE [dbo].[Check_RectifyNotices] CHECK CONSTRAINT [FK_Check_RectifyNotices_Sys_User4]
GO

ALTER TABLE Check_RectifyNotices ADD ProfessionalEngineerTime1 DATETIME NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专业工程师抄送日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'ProfessionalEngineerTime1'
GO
ALTER TABLE Check_RectifyNotices ADD ProfessionalEngineerTime2 DATETIME NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专业工程师抄送日期2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'ProfessionalEngineerTime2'
GO

ALTER TABLE Check_RectifyNotices ADD ConstructionManagerId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工经理ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'ConstructionManagerId'
GO
ALTER TABLE [dbo].[Check_RectifyNotices]  WITH CHECK ADD  CONSTRAINT [FK_Check_RectifyNotices_Sys_User5] FOREIGN KEY([ConstructionManagerId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO
ALTER TABLE [dbo].[Check_RectifyNotices] CHECK CONSTRAINT [FK_Check_RectifyNotices_Sys_User5]
GO

ALTER TABLE Check_RectifyNotices ADD ConstructionManagerTime1 DATETIME NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工经理抄送日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'ConstructionManagerTime1'
GO
ALTER TABLE Check_RectifyNotices ADD ConstructionManagerTime2 DATETIME NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工经理抄送日期2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'ConstructionManagerTime2'
GO

ALTER TABLE Check_RectifyNotices ADD ProjectManagerId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目经理ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'ProjectManagerId'
GO
ALTER TABLE [dbo].[Check_RectifyNotices]  WITH CHECK ADD  CONSTRAINT [FK_Check_RectifyNotices_Sys_User6] FOREIGN KEY([ProjectManagerId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO
ALTER TABLE [dbo].[Check_RectifyNotices] CHECK CONSTRAINT [FK_Check_RectifyNotices_Sys_User6]
GO

ALTER TABLE Check_RectifyNotices ADD ProjectManagerTime1 DATETIME NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目经理抄送日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'ProjectManagerTime1'
GO
ALTER TABLE Check_RectifyNotices ADD ProjectManagerTime2 DATETIME NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目经理抄送日期2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'ProjectManagerTime2'
GO

ALTER TABLE Check_RectifyNotices ADD DutyPersonTime DATETIME NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收人接收日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'DutyPersonTime'
GO

ALTER TABLE Check_RectifyNotices ADD UnitHeadManId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工单位负责人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'UnitHeadManId'
GO
ALTER TABLE [dbo].[Check_RectifyNotices]  WITH CHECK ADD  CONSTRAINT [FK_Check_RectifyNotices_Sys_User7] FOREIGN KEY([UnitHeadManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO
ALTER TABLE [dbo].[Check_RectifyNotices] CHECK CONSTRAINT [FK_Check_RectifyNotices_Sys_User7]
GO

ALTER TABLE Check_RectifyNotices ADD UnitHeadManDate NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工单位负责人审核日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'UnitHeadManDate'
GO
ALTER TABLE Check_RectifyNotices ADD UnitHeadManIsAgree Bit NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工单位负责人是否同意' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'UnitHeadManIsAgree'
GO

ALTER TABLE Check_RectifyNotices ADD ReCheckOpinion NVARCHAR(2000) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总包单位复查意见' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'ReCheckOpinion'
GO

ALTER TABLE Check_RectifyNotices ADD States VARCHAR(2) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单据状态（0-待提交；1-待签发；2-待整改；3-待复查；4-已完成）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotices', @level2type=N'COLUMN',@level2name=N'States'
GO

CREATE TABLE [dbo].[Check_RectifyNoticesItem](
	[RectifyNoticesItemId] [nvarchar](50) NOT NULL,
	[RectifyNoticesId] [nvarchar](50) NULL,
	[WrongContent] [nvarchar](3000) NULL,
	[Requirement] [nvarchar](3000) NULL,
	[LimitTime] [datetime] NULL,
	[RectifyResults] [nvarchar](800) NULL,
	[IsRectify] [bit] NULL,
 CONSTRAINT [PK_Check_RectifyNoticesItem] PRIMARY KEY CLUSTERED 
(
	[RectifyNoticesItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Check_RectifyNoticesItem]  WITH CHECK ADD  CONSTRAINT [FK_Check_RectifyNoticesItem_Check_RectifyNotices] FOREIGN KEY([RectifyNoticesId])
REFERENCES [dbo].[Check_RectifyNotices] ([RectifyNoticesId])
GO

ALTER TABLE [dbo].[Check_RectifyNoticesItem] CHECK CONSTRAINT [FK_Check_RectifyNoticesItem_Check_RectifyNotices]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隐患整改单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticesItem', @level2type=N'COLUMN',@level2name=N'RectifyNoticesId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'具体位置及隐患内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticesItem', @level2type=N'COLUMN',@level2name=N'WrongContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改要求' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticesItem', @level2type=N'COLUMN',@level2name=N'Requirement'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改期限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticesItem', @level2type=N'COLUMN',@level2name=N'LimitTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改结果' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticesItem', @level2type=N'COLUMN',@level2name=N'RectifyResults'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否合格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticesItem', @level2type=N'COLUMN',@level2name=N'IsRectify'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隐患整改单明细' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticesItem'
GO


CREATE TABLE [dbo].[Check_RectifyNoticesFlowOperate](
	[FlowOperateId] [nvarchar](50) NOT NULL,
	[RectifyNoticesId] [nvarchar](50) NULL,
	[OperateName] [nvarchar](50) NULL,
	[OperateManId] [nvarchar](50) NULL,
	[OperateTime] [datetime] NULL,
	[IsAgree] [bit] NULL,
	[Opinion] [nvarchar](500) NULL,
	[SignatureUrl] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Check_RectifyNoticesFlowOperate] PRIMARY KEY CLUSTERED 
(
	[FlowOperateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Check_RectifyNoticesFlowOperate]  WITH CHECK ADD  CONSTRAINT [FK_Check_RectifyNoticesFlowOperate_Check_RectifyNotices] FOREIGN KEY([RectifyNoticesId])
REFERENCES [dbo].[Check_RectifyNotices] ([RectifyNoticesId])
GO

ALTER TABLE [dbo].[Check_RectifyNoticesFlowOperate] CHECK CONSTRAINT [FK_Check_RectifyNoticesFlowOperate_Check_RectifyNotices]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticesFlowOperate', @level2type=N'COLUMN',@level2name=N'FlowOperateId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticesFlowOperate', @level2type=N'COLUMN',@level2name=N'RectifyNoticesId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作步骤名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticesFlowOperate', @level2type=N'COLUMN',@level2name=N'OperateName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'意见' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticesFlowOperate', @level2type=N'COLUMN',@level2name=N'Opinion'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticesFlowOperate', @level2type=N'COLUMN',@level2name=N'SignatureUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核意见记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticesFlowOperate'
GO
