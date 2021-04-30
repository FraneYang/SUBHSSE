--添加五环门禁 单位表
CREATE TABLE [dbo].[t_d_department](
	[DepartmentID] [int] NOT NULL,
	[DepartmentName] [varchar](400) NULL,
	[ParentID] [int] NULL,
	[IsDel] [int] NULL,
	[IsDown] [int] NULL,
	[ParentDepartmentName] [varchar](400) NULL,
	[IsEnable] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[t_d_department] ADD  DEFAULT ((0)) FOR [DepartmentID]
GO

ALTER TABLE [dbo].[t_d_department] ADD  DEFAULT ((0)) FOR [IsDel]
GO

ALTER TABLE [dbo].[t_d_department] ADD  DEFAULT ((0)) FOR [IsDown]
GO

ALTER TABLE [dbo].[t_d_department] ADD  DEFAULT ((0)) FOR [IsEnable]
GO


----添加五环门禁 人员表
CREATE TABLE [dbo].[t_d_employinfo](
	[EmployID] [bigint] NOT NULL,
	[WxEmployID] [bigint] NULL,
	[EmployNO] [varchar](40) NULL,
	[EmployName] [varchar](400) NULL,
	[CardNO] [bigint] NULL,
	[GroupID] [int] NULL,
	[IsAttend] [int] NULL,
	[IsDoor] [int] NULL,
	[BeginDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
	[InPassWord] [varchar](40) NULL,
	[DepartmentName] [varchar](40) NULL,
	[Mailbox] [varchar](200) NULL,
	[Mobilephone] [varchar](40) NULL,
	[WeiXinNO] [varchar](40) NULL,
	[PostName] [varchar](400) NULL,
	[Gender] [int] NULL,
	[IsDown] [int] NULL,
	[IsWxDown] [int] NULL,
	[IDCardNo] [varchar](400) NULL,
	[PlayCardNumber] [int] NULL,
	[PlayCardSum] [int] NULL,
	[UpdataCloud] [int] NULL,
	[Birthday] [varchar](40) NULL,
	[Police] [varchar](200) NULL,
	[Nation] [varchar](20) NULL,
	[Address] [varchar](1000) NULL,
	[UpdateState] [int] NULL,
	[UpdateDateTime] [datetime] NULL,
	[IsSubmarineBack] [int] NULL,
	[OnSiteState] [int] NULL,
	[TimeNumber] [int] NULL,
	[CardTimeRecord] [varchar](400) NULL,
	[ReservedFieldsOne] [varchar](400) NULL,
	[ReservedFieldsTwo] [varchar](400) NULL,
	[ReservedFieldsThree] [varchar](400) NULL,
	[ReservedFieldsFour] [varchar](400) NULL,
	[ReservedFieldsFive] [varchar](400) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[t_d_employinfo] ADD  DEFAULT ((0)) FOR [EmployID]
GO

ALTER TABLE [dbo].[t_d_employinfo] ADD  DEFAULT ((0)) FOR [WxEmployID]
GO

ALTER TABLE [dbo].[t_d_employinfo] ADD  DEFAULT ((0)) FOR [GroupID]
GO

ALTER TABLE [dbo].[t_d_employinfo] ADD  DEFAULT ((1)) FOR [IsAttend]
GO

ALTER TABLE [dbo].[t_d_employinfo] ADD  DEFAULT ((1)) FOR [IsDoor]
GO

ALTER TABLE [dbo].[t_d_employinfo] ADD  DEFAULT ((-1)) FOR [Gender]
GO

ALTER TABLE [dbo].[t_d_employinfo] ADD  DEFAULT ((0)) FOR [IsDown]
GO

ALTER TABLE [dbo].[t_d_employinfo] ADD  DEFAULT ((0)) FOR [IsWxDown]
GO

ALTER TABLE [dbo].[t_d_employinfo] ADD  DEFAULT ((0)) FOR [PlayCardNumber]
GO

ALTER TABLE [dbo].[t_d_employinfo] ADD  DEFAULT ((0)) FOR [PlayCardSum]
GO

ALTER TABLE [dbo].[t_d_employinfo] ADD  DEFAULT ((0)) FOR [UpdataCloud]
GO

ALTER TABLE [dbo].[t_d_employinfo] ADD  DEFAULT ((0)) FOR [UpdateState]
GO

ALTER TABLE [dbo].[t_d_employinfo] ADD  DEFAULT ((0)) FOR [IsSubmarineBack]
GO

ALTER TABLE [dbo].[t_d_employinfo] ADD  DEFAULT ((1)) FOR [OnSiteState]
GO

ALTER TABLE [dbo].[t_d_employinfo] ADD  DEFAULT ((1)) FOR [TimeNumber]
GO


---五环出入记录表
CREATE TABLE [dbo].[t_d_facerecord](
	[ID] [int] NOT NULL,
	[EmployName] [varchar](100) NULL,
	[DepartmentID] [varchar](100) NULL,
	[DepartName] [varchar](100) NULL,
	[AreaID] [varchar](100) NULL,
	[AreaName] [varchar](400) NULL,
	[EmployNO] [varchar](100) NULL,
	[CardID] [bigint] NULL,
	[RoleID] [varchar](100) NULL,
	[DateTimeRecord] [datetime] NULL,
	[RecordDes] [varchar](400) NULL,
	[FaceIP] [varchar](100) NULL,
	[InOrOut] [varchar](40) NULL,
	[Des1] [varchar](400) NULL,
	[Des2] [varchar](400) NULL,
	[Des3] [varchar](400) NULL,
	[Des4] [varchar](400) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[t_d_facerecord] ADD  DEFAULT ((0)) FOR [ID]
GO


CREATE TABLE [dbo].[t_d_EmployInOutRecord](
	[EmployInOutRecordId] [int] NOT NULL,
	[InstallationId] [varchar](100) NULL,
	[InstallationName] [varchar](400) NULL,
	[UnitId] [varchar](100) NULL,
	[UnitName] [varchar](400) NULL,
	[EmployNO] [varchar](40) NULL,
	[EmployName] [varchar](400) NULL,
	[RecordDate] [datetime] NULL,
	[IDCardNo] [varchar](400) NULL,
	[Nation] [varchar](20) NULL,
	[PostName] [varchar](400) NULL,
	[WorkIn1] [datetime] NULL,
	[OffDuty1] [datetime] NULL,
	[WorkIn2] [datetime] NULL,
	[OffDuty2] [datetime] NULL,
	[WorkIn3] [datetime] NULL,
	[OffDuty3] [datetime] NULL,
	[ManHours] [int] NULL,
 CONSTRAINT [PK_t_d_EmployInOutRecord] PRIMARY KEY CLUSTERED 
(
	[EmployInOutRecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[t_d_EmployInOutRecord] ADD  CONSTRAINT [DF_t_d_EmployInOutRecord_int]  DEFAULT ((0)) FOR [EmployInOutRecordId]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'装置ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_d_EmployInOutRecord', @level2type=N'COLUMN',@level2name=N'InstallationId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'装置名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_d_EmployInOutRecord', @level2type=N'COLUMN',@level2name=N'InstallationName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_d_EmployInOutRecord', @level2type=N'COLUMN',@level2name=N'RecordDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'民族' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_d_EmployInOutRecord', @level2type=N'COLUMN',@level2name=N'Nation'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_d_EmployInOutRecord', @level2type=N'COLUMN',@level2name=N'PostName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上班1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_d_EmployInOutRecord', @level2type=N'COLUMN',@level2name=N'WorkIn1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下班1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_d_EmployInOutRecord', @level2type=N'COLUMN',@level2name=N'OffDuty1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上班2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_d_EmployInOutRecord', @level2type=N'COLUMN',@level2name=N'WorkIn2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下班2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_d_EmployInOutRecord', @level2type=N'COLUMN',@level2name=N'OffDuty2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上班3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_d_EmployInOutRecord', @level2type=N'COLUMN',@level2name=N'WorkIn3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下班3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_d_EmployInOutRecord', @level2type=N'COLUMN',@level2name=N'OffDuty3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人工时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_d_EmployInOutRecord', @level2type=N'COLUMN',@level2name=N'ManHours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'员工考勤记录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_d_EmployInOutRecord'
GO



ALTER TABLE Check_PauseNotice ADD UnitWorkId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位工程ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PauseNotice', @level2type=N'COLUMN',@level2name=N'UnitWorkId'
GO

ALTER TABLE License_HSETechnical ADD TechnicalManId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交底人Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HSETechnical', @level2type=N'COLUMN',@level2name=N'TechnicalManId'
GO

ALTER TABLE License_HSETechnical ADD PartTechnicalManIds NVARCHAR(2000) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参加交底人Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HSETechnical', @level2type=N'COLUMN',@level2name=N'PartTechnicalManIds'
GO

ALTER TABLE License_HSETechnical ADD PartTechnicalManNames NVARCHAR(2000) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参加交底人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HSETechnical', @level2type=N'COLUMN',@level2name=N'PartTechnicalManNames'
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('397E64C8-B092-4A6A-B4D6-6B9A525448BD','项目考勤','','ApplicationForm',120,'0','Menu_Server',0,0)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('D0E2C9C6-58FA-4316-B634-65267C709F5E','现场考勤记录','Door/InOutRecord.aspx','Page',10,'397E64C8-B092-4A6A-B4D6-6B9A525448BD','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('6D0CCC58-2152-4D56-A95A-47F19D962E8C','项目人工时','Door/InOutManHours.aspx','Page',20,'397E64C8-B092-4A6A-B4D6-6B9A525448BD','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('C1562943-6B79-438E-B0D7-95CD159360CA','视频监控','Door/VideoMonitor.aspx','Page',30,'397E64C8-B092-4A6A-B4D6-6B9A525448BD','Menu_Server',1,0)
GO
