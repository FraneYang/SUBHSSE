--动土作业票
CREATE TABLE [dbo].[License_BreakGround](
	[BreakGroundId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[LicenseCode] [nvarchar](50) NULL,
	[ApplyUnitId] [nvarchar](50) NULL,
	[ApplyManId] [nvarchar](50) NULL,
	[ApplyDate] [datetime] NULL,
	[WorkPalce] [nvarchar](300) NULL,
	[WorkDepth] [nvarchar](50) NULL,
	[ValidityStartTime] [datetime] NULL,
	[ValidityEndTime] [datetime] NULL,
	[WorkMeasures] [nvarchar](500) NULL,
	[CancelManId] [nvarchar](50) NULL,
	[CancelReasons] [nvarchar](200) NULL,
	[CancelTime] [datetime] NULL,
	[CloseManId] [nvarchar](50) NULL,
	[CloseReasons] [nvarchar](200) NULL,
	[CloseTime] [datetime] NULL,
	[States] [varchar](2) NULL,
	[NextManId] [nvarchar](50) NULL,
 CONSTRAINT [PK_License_BreakGround] PRIMARY KEY CLUSTERED 
(
	[BreakGroundId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[License_BreakGround]  WITH CHECK ADD  CONSTRAINT [FK_License_BreakGround_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[License_BreakGround] CHECK CONSTRAINT [FK_License_BreakGround_Base_Project]
GO

ALTER TABLE [dbo].[License_BreakGround]  WITH CHECK ADD  CONSTRAINT [FK_License_BreakGround_Base_Unit] FOREIGN KEY([ApplyUnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[License_BreakGround] CHECK CONSTRAINT [FK_License_BreakGround_Base_Unit]
GO

ALTER TABLE [dbo].[License_BreakGround]  WITH CHECK ADD  CONSTRAINT [FK_License_BreakGround_Sys_User] FOREIGN KEY([ApplyManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_BreakGround] CHECK CONSTRAINT [FK_License_BreakGround_Sys_User]
GO

ALTER TABLE [dbo].[License_BreakGround]  WITH CHECK ADD  CONSTRAINT [FK_License_BreakGround_Sys_User2] FOREIGN KEY([CancelManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_BreakGround] CHECK CONSTRAINT [FK_License_BreakGround_Sys_User2]
GO

ALTER TABLE [dbo].[License_BreakGround]  WITH CHECK ADD  CONSTRAINT [FK_License_BreakGround_Sys_User3] FOREIGN KEY([CloseManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_BreakGround] CHECK CONSTRAINT [FK_License_BreakGround_Sys_User3]
GO

ALTER TABLE [dbo].[License_BreakGround]  WITH CHECK ADD  CONSTRAINT [FK_License_BreakGround_Sys_User4] FOREIGN KEY([NextManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_BreakGround] CHECK CONSTRAINT [FK_License_BreakGround_Sys_User4]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_BreakGround', @level2type=N'COLUMN',@level2name=N'BreakGroundId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_BreakGround', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_BreakGround', @level2type=N'COLUMN',@level2name=N'LicenseCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_BreakGround', @level2type=N'COLUMN',@level2name=N'ApplyUnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_BreakGround', @level2type=N'COLUMN',@level2name=N'ApplyManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_BreakGround', @level2type=N'COLUMN',@level2name=N'ApplyDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业地点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_BreakGround', @level2type=N'COLUMN',@level2name=N'WorkPalce'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开挖深度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_BreakGround', @level2type=N'COLUMN',@level2name=N'WorkDepth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_BreakGround', @level2type=N'COLUMN',@level2name=N'ValidityStartTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_BreakGround', @level2type=N'COLUMN',@level2name=N'ValidityEndTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业内容、机具及安全措施' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_BreakGround', @level2type=N'COLUMN',@level2name=N'WorkMeasures'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取消人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_BreakGround', @level2type=N'COLUMN',@level2name=N'CancelManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取消原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_BreakGround', @level2type=N'COLUMN',@level2name=N'CancelReasons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取消时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_BreakGround', @level2type=N'COLUMN',@level2name=N'CancelTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关闭人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_BreakGround', @level2type=N'COLUMN',@level2name=N'CloseManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关闭原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_BreakGround', @level2type=N'COLUMN',@level2name=N'CloseReasons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关闭时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_BreakGround', @level2type=N'COLUMN',@level2name=N'CloseTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态(0-待提交；1-审核中；2-审核完成；3-关闭；-1取消)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_BreakGround', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下步办理人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_BreakGround', @level2type=N'COLUMN',@level2name=N'NextManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'动土作业票表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_BreakGround'
GO

--夜间施工作业票
CREATE TABLE [dbo].[License_NightWork](
	[NightWorkId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[LicenseCode] [nvarchar](50) NULL,
	[ApplyUnitId] [nvarchar](50) NULL,
	[ApplyManId] [nvarchar](50) NULL,
	[ApplyDate] [datetime] NULL,
	[WorkPalce] [nvarchar](300) NULL,
	[WorkMeasures] [nvarchar](500) NULL,
	[ValidityStartTime] [datetime] NULL,
	[ValidityEndTime] [datetime] NULL,
	[WorkLeaderId] [nvarchar](50) NULL,
	[WorkLeaderTel] [nvarchar](50) NULL,
	[SafeLeaderId] [nvarchar](50) NULL,
	[SafeLeaderTel] [nvarchar](50) NULL,
	[CancelManId] [nvarchar](50) NULL,
	[CancelReasons] [nvarchar](200) NULL,
	[CancelTime] [datetime] NULL,
	[CloseManId] [nvarchar](50) NULL,
	[CloseReasons] [nvarchar](200) NULL,
	[CloseTime] [datetime] NULL,
	[States] [varchar](2) NULL,
	[NextManId] [nvarchar](50) NULL,
 CONSTRAINT [PK_License_NightWork] PRIMARY KEY CLUSTERED 
(
	[NightWorkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[License_NightWork]  WITH CHECK ADD  CONSTRAINT [FK_License_NightWork_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[License_NightWork] CHECK CONSTRAINT [FK_License_NightWork_Base_Project]
GO

ALTER TABLE [dbo].[License_NightWork]  WITH CHECK ADD  CONSTRAINT [FK_License_NightWork_Base_Unit] FOREIGN KEY([ApplyUnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[License_NightWork] CHECK CONSTRAINT [FK_License_NightWork_Base_Unit]
GO

ALTER TABLE [dbo].[License_NightWork]  WITH CHECK ADD  CONSTRAINT [FK_License_NightWork_Sys_User] FOREIGN KEY([ApplyManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_NightWork] CHECK CONSTRAINT [FK_License_NightWork_Sys_User]
GO

ALTER TABLE [dbo].[License_NightWork]  WITH CHECK ADD  CONSTRAINT [FK_License_NightWork_Sys_User1] FOREIGN KEY([WorkLeaderId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_NightWork] CHECK CONSTRAINT [FK_License_NightWork_Sys_User1]
GO

ALTER TABLE [dbo].[License_NightWork]  WITH CHECK ADD  CONSTRAINT [FK_License_NightWork_Sys_User2] FOREIGN KEY([CancelManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_NightWork] CHECK CONSTRAINT [FK_License_NightWork_Sys_User2]
GO

ALTER TABLE [dbo].[License_NightWork]  WITH CHECK ADD  CONSTRAINT [FK_License_NightWork_Sys_User3] FOREIGN KEY([CloseManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_NightWork] CHECK CONSTRAINT [FK_License_NightWork_Sys_User3]
GO

ALTER TABLE [dbo].[License_NightWork]  WITH CHECK ADD  CONSTRAINT [FK_License_NightWork_Sys_User4] FOREIGN KEY([NextManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_NightWork] CHECK CONSTRAINT [FK_License_NightWork_Sys_User4]
GO

ALTER TABLE [dbo].[License_NightWork]  WITH CHECK ADD  CONSTRAINT [FK_License_NightWork_Sys_User5] FOREIGN KEY([SafeLeaderId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_NightWork] CHECK CONSTRAINT [FK_License_NightWork_Sys_User5]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'NightWorkId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'LicenseCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'ApplyUnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'ApplyManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'ApplyDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业地点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'WorkPalce'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'WorkMeasures'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'ValidityStartTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'ValidityEndTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'现场施工负责人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'WorkLeaderId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'现场施工负责人联系方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'WorkLeaderTel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'现场安全负责人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'SafeLeaderId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'现场安全负责人联系方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'SafeLeaderTel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取消人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'CancelManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取消原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'CancelReasons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取消时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'CancelTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关闭人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'CloseManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关闭原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'CloseReasons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关闭时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'CloseTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态(0-待提交；1-审核中；2-审核完成；3-关闭；-1取消)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下步办理人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork', @level2type=N'COLUMN',@level2name=N'NextManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'夜间施工作业票表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_NightWork'
GO
--吊装作业
CREATE TABLE [dbo].[License_LiftingWork](
	[LiftingWorkId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[LicenseCode] [nvarchar](50) NULL,
	[ApplyUnitId] [nvarchar](50) NULL,
	[ApplyManId] [nvarchar](50) NULL,
	[ApplyDate] [datetime] NULL,
	[WorkPalce] [nvarchar](300) NULL,
	[WorkLevel] [nvarchar](50) NULL,
	[ValidityStartTime] [datetime] NULL,
	[ValidityEndTime] [datetime] NULL,
	[WorkMeasures] [nvarchar](500) NULL,
	[CraneCapacity] [nvarchar](200) NULL,
	[CancelManId] [nvarchar](50) NULL,
	[CancelReasons] [nvarchar](200) NULL,
	[CancelTime] [datetime] NULL,
	[CloseManId] [nvarchar](50) NULL,
	[CloseReasons] [nvarchar](200) NULL,
	[CloseTime] [datetime] NULL,
	[States] [varchar](2) NULL,
	[NextManId] [nvarchar](50) NULL,
 CONSTRAINT [PK_License_LiftingWork] PRIMARY KEY CLUSTERED 
(
	[LiftingWorkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[License_LiftingWork]  WITH CHECK ADD  CONSTRAINT [FK_License_LiftingWork_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[License_LiftingWork] CHECK CONSTRAINT [FK_License_LiftingWork_Base_Project]
GO

ALTER TABLE [dbo].[License_LiftingWork]  WITH CHECK ADD  CONSTRAINT [FK_License_LiftingWork_Base_Unit] FOREIGN KEY([ApplyUnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[License_LiftingWork] CHECK CONSTRAINT [FK_License_LiftingWork_Base_Unit]
GO

ALTER TABLE [dbo].[License_LiftingWork]  WITH CHECK ADD  CONSTRAINT [FK_License_LiftingWork_Sys_User] FOREIGN KEY([ApplyManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_LiftingWork] CHECK CONSTRAINT [FK_License_LiftingWork_Sys_User]
GO

ALTER TABLE [dbo].[License_LiftingWork]  WITH CHECK ADD  CONSTRAINT [FK_License_LiftingWork_Sys_User2] FOREIGN KEY([CancelManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_LiftingWork] CHECK CONSTRAINT [FK_License_LiftingWork_Sys_User2]
GO

ALTER TABLE [dbo].[License_LiftingWork]  WITH CHECK ADD  CONSTRAINT [FK_License_LiftingWork_Sys_User3] FOREIGN KEY([CloseManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_LiftingWork] CHECK CONSTRAINT [FK_License_LiftingWork_Sys_User3]
GO

ALTER TABLE [dbo].[License_LiftingWork]  WITH CHECK ADD  CONSTRAINT [FK_License_LiftingWork_Sys_User4] FOREIGN KEY([NextManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_LiftingWork] CHECK CONSTRAINT [FK_License_LiftingWork_Sys_User4]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LiftingWork', @level2type=N'COLUMN',@level2name=N'LiftingWorkId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LiftingWork', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LiftingWork', @level2type=N'COLUMN',@level2name=N'LicenseCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LiftingWork', @level2type=N'COLUMN',@level2name=N'ApplyUnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LiftingWork', @level2type=N'COLUMN',@level2name=N'ApplyManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LiftingWork', @level2type=N'COLUMN',@level2name=N'ApplyDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业地点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LiftingWork', @level2type=N'COLUMN',@level2name=N'WorkPalce'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'级别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LiftingWork', @level2type=N'COLUMN',@level2name=N'WorkLevel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LiftingWork', @level2type=N'COLUMN',@level2name=N'ValidityStartTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LiftingWork', @level2type=N'COLUMN',@level2name=N'ValidityEndTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LiftingWork', @level2type=N'COLUMN',@level2name=N'WorkMeasures'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'起重机能力及索具规格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LiftingWork', @level2type=N'COLUMN',@level2name=N'CraneCapacity'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取消人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LiftingWork', @level2type=N'COLUMN',@level2name=N'CancelManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取消原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LiftingWork', @level2type=N'COLUMN',@level2name=N'CancelReasons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取消时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LiftingWork', @level2type=N'COLUMN',@level2name=N'CancelTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关闭人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LiftingWork', @level2type=N'COLUMN',@level2name=N'CloseManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关闭原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LiftingWork', @level2type=N'COLUMN',@level2name=N'CloseReasons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关闭时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LiftingWork', @level2type=N'COLUMN',@level2name=N'CloseTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态(0-待提交；1-审核中；2-审核完成；3-关闭；-1取消)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LiftingWork', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下步办理人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LiftingWork', @level2type=N'COLUMN',@level2name=N'NextManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'吊装作业票表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LiftingWork'
GO

--获取当前人待办事项
ALTER PROCEDURE [dbo].[Sp_APP_GetToDoItems]     
	@projectId NVARCHAR(50),
	@userId NVARCHAR(200)=NULL
AS  
/*获取当前人待办事项*/          
BEGIN
SELECT HazardRegisterId AS DataId
	,'2FC8AA2A-F421-4174-A05E-2711167AF141' AS MenuId
	,'安全巡检' AS MenuName
	,register.RegisterDef AS Content
	,UserId
	,users.UserName
	,register.RegisterDate AS DataTime
	,CONVERT(varchar(100),register.RegisterDate, 23) AS DataTimeStr
	,'/pages/grow/safe_confirm/' AS UrlStr
FROM HSSE_Hazard_HazardRegister AS register 
LEFT JOIN Sys_User AS users ON users.UserId =@userId
WHERE register.ProjectId=@projectId AND 
((register.states = '1' AND (register.ResponsibleMan =@userId OR register.CCManIds LIKE ('%'+@userId+'%') )) 
OR (register.states = '2' AND register.CheckManId =@userId))		

UNION ALL
SELECT PlanId AS DataId
	,'B782A26B-D85C-4F84-8B45-F7AA47B3159E' AS MenuId
	,'培训计划' AS MenuName
	,PlanName AS Content
	,UserId
	,users.UserName
	,DesignerDate AS DataTime
	,CONVERT(varchar(100),DesignerDate, 23) AS DataTimeStr
	,'/pages/train_task/train_index/main' AS UrlStr
FROM Training_Plan AS ePlan
LEFT JOIN Sys_User AS users ON ePlan.DesignerId= users.UserId 
WHERE ePlan.ProjectId=@projectId AND 
(States = '0' OR States = '1' ) AND ePlan.DesignerId =@userId

UNION ALL
SELECT TestPlanId AS DataId
	,'FAF7F4A4-A4BC-4D94-9E88-0CF5A380DB34' AS MenuId
	,'考试计划' AS MenuName
	,PlanName AS Content
	,UserId
	,users.UserName
	,PlanDate AS DataTime
	,CONVERT(varchar(100),PlanDate, 23) AS DataTimeStr
	,'/pages/train_task/test_list/main' AS UrlStr	
FROM Training_TestPlan AS TPlan
LEFT JOIN Sys_User AS users ON users.UserId =TPlan.PlanManId
WHERE TPlan.ProjectId=@projectId AND 
(States = '0' OR States = '1' ) AND PlanManId =@userId

UNION ALL
SELECT FireWorkId AS DataId
	,'2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B' AS MenuId
	,'动火作业' AS MenuName
	,LicenseCode AS Content
	,UserId
	,users.UserName
	,ApplyDate AS DataTime
	,CONVERT(varchar(100),ApplyDate, 23) AS DataTimeStr
	,(CASE WHEN States = '0' THEN '/pages/job_info/dh_add/main' 
			ELSE '/pages/job_info/dh_approval/main' END) AS UrlStr	
FROM License_FireWork AS License
   LEFT JOIN Sys_User AS users ON users.UserId =License.NextManId
WHERE License.ProjectId=@projectId 
	AND (States = '0' OR States = '1' ) 
	AND License.NextManId =@userId

UNION ALL
SELECT HeightWorkId AS DataId
	,'DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9' AS MenuId
	,'高处作业' AS MenuName
	,LicenseCode AS Content
	,UserId
	,users.UserName
	,ApplyDate AS DataTime
	,CONVERT(varchar(100),ApplyDate, 23) AS DataTimeStr
	,(CASE WHEN States = '0' THEN '/pages/job_info/gc_add/main' 
			ELSE '/pages/job_info/dh_approval/main' END) AS UrlStr	
FROM License_HeightWork AS License
   LEFT JOIN Sys_User AS users ON users.UserId =License.NextManId
WHERE License.ProjectId=@projectId 
	AND (States = '0' OR States = '1' ) 
	AND License.NextManId =@userId

UNION ALL
SELECT LimitedSpaceId AS DataId
	,'AEC9166D-1C91-45F0-8BFE-D3D0479A28C7' AS MenuId
	,'受限空间' AS MenuName
	,LicenseCode AS Content
	,UserId
	,users.UserName
	,ApplyDate AS DataTime
	,CONVERT(varchar(100),ApplyDate, 23) AS DataTimeStr
	,(CASE WHEN States = '0' THEN '/pages/job_info/sxkj_add/main' 
			ELSE '/pages/job_info/dh_approval/main' END) AS UrlStr	
FROM License_LimitedSpace AS License
   LEFT JOIN Sys_User AS users ON users.UserId =License.NextManId
WHERE License.ProjectId=@projectId 
	AND (States = '0' OR States = '1' ) 
	AND License.NextManId =@userId

UNION ALL
SELECT RadialWorkId AS DataId
	,'F72FF20B-D3EB-46A5-97F7-C99B2473A140' AS MenuId
	,'射线作业' AS MenuName
	,LicenseCode AS Content
	,UserId
	,users.UserName
	,ApplyDate AS DataTime
	,CONVERT(varchar(100),ApplyDate, 23) AS DataTimeStr
	,(CASE WHEN States = '0' THEN '/pages/job_info/sx_add/main' 
			ELSE '/pages/job_info/dh_approval/main' END) AS UrlStr	
FROM License_RadialWork AS License
   LEFT JOIN Sys_User AS users ON users.UserId =License.NextManId
WHERE License.ProjectId=@projectId 
	AND (States = '0' OR States = '1' ) 
	AND License.NextManId =@userId

UNION ALL
SELECT OpenCircuitId AS DataId
	,'4E607E83-41FC-4F49-B26F-A21CFE38328F' AS MenuId
	,'断路(占道)' AS MenuName
	,LicenseCode AS Content
	,UserId
	,users.UserName
	,ApplyDate AS DataTime
	,CONVERT(varchar(100),ApplyDate, 23) AS DataTimeStr
	,(CASE WHEN States = '0' THEN '/pages/job_info/dl_add/main' 
			ELSE '/pages/job_info/dh_approval/main' END) AS UrlStr	
FROM License_OpenCircuit AS License
   LEFT JOIN Sys_User AS users ON users.UserId =License.NextManId
WHERE License.ProjectId=@projectId 
	AND (States = '0' OR States = '1' ) 
	AND License.NextManId =@userId

UNION ALL
SELECT BreakGroundId AS DataId
	,'755C6AC9-2E38-4D4F-AF33-33CB1744A907' AS MenuId
	,'动土作业' AS MenuName
	,LicenseCode AS Content
	,UserId
	,users.UserName
	,ApplyDate AS DataTime
	,CONVERT(varchar(100),ApplyDate, 23) AS DataTimeStr
	,(CASE WHEN States = '0' THEN '/pages/job_info/dt_add/main' 
			ELSE '/pages/job_info/dh_approval/main' END) AS UrlStr	
FROM License_BreakGround AS License
   LEFT JOIN Sys_User AS users ON users.UserId =License.NextManId
WHERE License.ProjectId=@projectId 
	AND (States = '0' OR States = '1' ) 
	AND License.NextManId =@userId

UNION ALL
SELECT NightWorkId AS DataId
	,'7BBAE649-7B00-4475-A911-BFE3A37AC55B' AS MenuId
	,'夜间施工' AS MenuName
	,LicenseCode AS Content
	,UserId
	,users.UserName
	,ApplyDate AS DataTime
	,CONVERT(varchar(100),ApplyDate, 23) AS DataTimeStr
	,(CASE WHEN States = '0' THEN '/pages/job_info/yjsg_add/main' 
			ELSE '/pages/job_info/dh_approval/main' END) AS UrlStr	
FROM License_NightWork AS License
   LEFT JOIN Sys_User AS users ON users.UserId =License.NextManId
WHERE License.ProjectId=@projectId 
	AND (States = '0' OR States = '1' ) 
	AND License.NextManId =@userId

UNION ALL
SELECT LiftingWorkId AS DataId
	,'A1BE3AB6-9D4A-41E7-8870-E73423165451' AS MenuId
	,'吊装作业' AS MenuName
	,LicenseCode AS Content
	,UserId
	,users.UserName
	,ApplyDate AS DataTime
	,CONVERT(varchar(100),ApplyDate, 23) AS DataTimeStr
	,(CASE WHEN States = '0' THEN '/pages/job_info/dz_add/main' 
			ELSE '/pages/job_info/dh_approval/main' END) AS UrlStr	
FROM License_LiftingWork AS License
   LEFT JOIN Sys_User AS users ON users.UserId =License.NextManId
WHERE License.ProjectId=@projectId 
	AND (States = '0' OR States = '1' ) 
	AND License.NextManId =@userId
ORDER BY DataTime DESC 
END
GO