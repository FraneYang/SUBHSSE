----���޿ռ���ҵƱ��
CREATE TABLE [dbo].[License_LimitedSpace](
	[LimitedSpaceId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[LicenseCode] [nvarchar](50) NULL,
	[ApplyUnitId] [nvarchar](50) NULL,
	[ApplyManId] [nvarchar](50) NULL,
	[ApplyDate] [datetime] NULL,
	[WorkPalce] [nvarchar](300) NULL,
	[FireWatchManId] [nvarchar](50) NULL,
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
 CONSTRAINT [PK_License_LimitedSpace] PRIMARY KEY CLUSTERED 
(
	[LimitedSpaceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[License_LimitedSpace]  WITH CHECK ADD  CONSTRAINT [FK_License_LimitedSpace_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[License_LimitedSpace] CHECK CONSTRAINT [FK_License_LimitedSpace_Base_Project]
GO

ALTER TABLE [dbo].[License_LimitedSpace]  WITH CHECK ADD  CONSTRAINT [FK_License_LimitedSpace_Base_Unit] FOREIGN KEY([ApplyUnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[License_LimitedSpace] CHECK CONSTRAINT [FK_License_LimitedSpace_Base_Unit]
GO

ALTER TABLE [dbo].[License_LimitedSpace]  WITH CHECK ADD  CONSTRAINT [FK_License_LimitedSpace_Sys_User] FOREIGN KEY([ApplyManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_LimitedSpace] CHECK CONSTRAINT [FK_License_LimitedSpace_Sys_User]
GO

ALTER TABLE [dbo].[License_LimitedSpace]  WITH CHECK ADD  CONSTRAINT [FK_License_LimitedSpace_Sys_User1] FOREIGN KEY([FireWatchManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_LimitedSpace] CHECK CONSTRAINT [FK_License_LimitedSpace_Sys_User1]
GO

ALTER TABLE [dbo].[License_LimitedSpace]  WITH CHECK ADD  CONSTRAINT [FK_License_LimitedSpace_Sys_User2] FOREIGN KEY([CancelManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_LimitedSpace] CHECK CONSTRAINT [FK_License_LimitedSpace_Sys_User2]
GO

ALTER TABLE [dbo].[License_LimitedSpace]  WITH CHECK ADD  CONSTRAINT [FK_License_LimitedSpace_Sys_User3] FOREIGN KEY([CloseManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_LimitedSpace] CHECK CONSTRAINT [FK_License_LimitedSpace_Sys_User3]
GO

ALTER TABLE [dbo].[License_LimitedSpace]  WITH CHECK ADD  CONSTRAINT [FK_License_LimitedSpace_Sys_User4] FOREIGN KEY([NextManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_LimitedSpace] CHECK CONSTRAINT [FK_License_LimitedSpace_Sys_User4]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���޿ռ�����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LimitedSpace', @level2type=N'COLUMN',@level2name=N'LimitedSpaceId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LimitedSpace', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LimitedSpace', @level2type=N'COLUMN',@level2name=N'LicenseCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���뵥ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LimitedSpace', @level2type=N'COLUMN',@level2name=N'ApplyUnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LimitedSpace', @level2type=N'COLUMN',@level2name=N'ApplyManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LimitedSpace', @level2type=N'COLUMN',@level2name=N'ApplyDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ�ص�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LimitedSpace', @level2type=N'COLUMN',@level2name=N'WorkPalce'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�໤��ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LimitedSpace', @level2type=N'COLUMN',@level2name=N'FireWatchManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ��ʼʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LimitedSpace', @level2type=N'COLUMN',@level2name=N'ValidityStartTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LimitedSpace', @level2type=N'COLUMN',@level2name=N'ValidityEndTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LimitedSpace', @level2type=N'COLUMN',@level2name=N'WorkMeasures'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ȡ����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LimitedSpace', @level2type=N'COLUMN',@level2name=N'CancelManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ȡ��ԭ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LimitedSpace', @level2type=N'COLUMN',@level2name=N'CancelReasons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ȡ��ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LimitedSpace', @level2type=N'COLUMN',@level2name=N'CancelTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ر���ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LimitedSpace', @level2type=N'COLUMN',@level2name=N'CloseManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ر�ԭ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LimitedSpace', @level2type=N'COLUMN',@level2name=N'CloseReasons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ر�ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LimitedSpace', @level2type=N'COLUMN',@level2name=N'CloseTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬(0-���ύ��1-����У�2-�����ɣ�3-�رգ�-1ȡ��)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LimitedSpace', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�²�������ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LimitedSpace', @level2type=N'COLUMN',@level2name=N'NextManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���޿ռ���ҵƱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LimitedSpace'
GO

--������ҵƱ��
CREATE TABLE [dbo].[License_RadialWork](
	[RadialWorkId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[LicenseCode] [nvarchar](50) NULL,
	[ApplyUnitId] [nvarchar](50) NULL,
	[ApplyManId] [nvarchar](50) NULL,
	[ApplyDate] [datetime] NULL,
	[RadialType] [nvarchar](50) NULL,
	[WorkLeaderId] [nvarchar](50) NULL,
	[WorkLeaderTel] [nvarchar](50) NULL,
	[ValidityStartTime] [datetime] NULL,
	[ValidityEndTime] [datetime] NULL,
	[WorkPalce] [nvarchar](300) NULL,
	[WorkMeasures] [nvarchar](500) NULL,
	[FireWatchManId] [nvarchar](50) NULL,
	[WatchManContact] [nvarchar](50) NULL,
	[CancelManId] [nvarchar](50) NULL,
	[CancelReasons] [nvarchar](200) NULL,
	[CancelTime] [datetime] NULL,
	[CloseManId] [nvarchar](50) NULL,
	[CloseReasons] [nvarchar](200) NULL,
	[CloseTime] [datetime] NULL,
	[States] [varchar](2) NULL,
	[NextManId] [nvarchar](50) NULL,
 CONSTRAINT [PK_License_RadialWork] PRIMARY KEY CLUSTERED 
(
	[RadialWorkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[License_RadialWork]  WITH CHECK ADD  CONSTRAINT [FK_License_RadialWork_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[License_RadialWork] CHECK CONSTRAINT [FK_License_RadialWork_Base_Project]
GO

ALTER TABLE [dbo].[License_RadialWork]  WITH CHECK ADD  CONSTRAINT [FK_License_RadialWork_Base_Unit] FOREIGN KEY([ApplyUnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[License_RadialWork] CHECK CONSTRAINT [FK_License_RadialWork_Base_Unit]
GO

ALTER TABLE [dbo].[License_RadialWork]  WITH CHECK ADD  CONSTRAINT [FK_License_RadialWork_Sys_User] FOREIGN KEY([ApplyManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_RadialWork] CHECK CONSTRAINT [FK_License_RadialWork_Sys_User]
GO

ALTER TABLE [dbo].[License_RadialWork]  WITH CHECK ADD  CONSTRAINT [FK_License_RadialWork_Sys_User1] FOREIGN KEY([FireWatchManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_RadialWork] CHECK CONSTRAINT [FK_License_RadialWork_Sys_User1]
GO

ALTER TABLE [dbo].[License_RadialWork]  WITH CHECK ADD  CONSTRAINT [FK_License_RadialWork_Sys_User2] FOREIGN KEY([CancelManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_RadialWork] CHECK CONSTRAINT [FK_License_RadialWork_Sys_User2]
GO

ALTER TABLE [dbo].[License_RadialWork]  WITH CHECK ADD  CONSTRAINT [FK_License_RadialWork_Sys_User3] FOREIGN KEY([CloseManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_RadialWork] CHECK CONSTRAINT [FK_License_RadialWork_Sys_User3]
GO

ALTER TABLE [dbo].[License_RadialWork]  WITH CHECK ADD  CONSTRAINT [FK_License_RadialWork_Sys_User4] FOREIGN KEY([NextManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_RadialWork] CHECK CONSTRAINT [FK_License_RadialWork_Sys_User4]
GO

ALTER TABLE [dbo].[License_RadialWork]  WITH CHECK ADD  CONSTRAINT [FK_License_RadialWork_Sys_User5] FOREIGN KEY([WorkLeaderId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_RadialWork] CHECK CONSTRAINT [FK_License_RadialWork_Sys_User5]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'RadialWorkId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'LicenseCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���뵥ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'ApplyUnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'ApplyManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'ApplyDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������ͣ�������/�����ߣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'RadialType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ������ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'WorkLeaderId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����˵绰' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'WorkLeaderTel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ��ʼʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'ValidityStartTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'ValidityEndTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ�ص�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'WorkPalce'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ���뼰��Ӱ������/��λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'WorkMeasures'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�໤��ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'FireWatchManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�໤�˵绰' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'WatchManContact'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ȡ����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'CancelManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ȡ��ԭ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'CancelReasons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ȡ��ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'CancelTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ر���ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'CloseManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ر�ԭ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'CloseReasons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ر�ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'CloseTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬(0-���ύ��1-����У�2-�����ɣ�3-�رգ�-1ȡ��)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�²�������ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork', @level2type=N'COLUMN',@level2name=N'NextManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ҵƱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_RadialWork'
GO

--��·��ռ������ҵƱ
CREATE TABLE [dbo].[License_OpenCircuit](
	[OpenCircuitId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[LicenseCode] [nvarchar](50) NULL,
	[ApplyUnitId] [nvarchar](50) NULL,
	[ApplyManId] [nvarchar](50) NULL,
	[ApplyDate] [datetime] NULL,
	[WorkPalce] [nvarchar](300) NULL,
	[WorkMeasures] [nvarchar](500) NULL,
	[ValidityStartTime] [datetime] NULL,
	[ValidityEndTime] [datetime] NULL,
	[RoadName] [nvarchar](50) NULL,
	[SafeMeasures] [nvarchar](500) NULL,
	[CancelManId] [nvarchar](50) NULL,
	[CancelReasons] [nvarchar](200) NULL,
	[CancelTime] [datetime] NULL,
	[CloseManId] [nvarchar](50) NULL,
	[CloseReasons] [nvarchar](200) NULL,
	[CloseTime] [datetime] NULL,
	[States] [varchar](2) NULL,
	[NextManId] [nvarchar](50) NULL,
 CONSTRAINT [PK_License_OpenCircuit] PRIMARY KEY CLUSTERED 
(
	[OpenCircuitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[License_OpenCircuit]  WITH CHECK ADD  CONSTRAINT [FK_License_OpenCircuit_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[License_OpenCircuit] CHECK CONSTRAINT [FK_License_OpenCircuit_Base_Project]
GO

ALTER TABLE [dbo].[License_OpenCircuit]  WITH CHECK ADD  CONSTRAINT [FK_License_OpenCircuit_Base_Unit] FOREIGN KEY([ApplyUnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[License_OpenCircuit] CHECK CONSTRAINT [FK_License_OpenCircuit_Base_Unit]
GO

ALTER TABLE [dbo].[License_OpenCircuit]  WITH CHECK ADD  CONSTRAINT [FK_License_OpenCircuit_Sys_User] FOREIGN KEY([ApplyManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_OpenCircuit] CHECK CONSTRAINT [FK_License_OpenCircuit_Sys_User]
GO

ALTER TABLE [dbo].[License_OpenCircuit]  WITH CHECK ADD  CONSTRAINT [FK_License_OpenCircuit_Sys_User2] FOREIGN KEY([CancelManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_OpenCircuit] CHECK CONSTRAINT [FK_License_OpenCircuit_Sys_User2]
GO

ALTER TABLE [dbo].[License_OpenCircuit]  WITH CHECK ADD  CONSTRAINT [FK_License_OpenCircuit_Sys_User3] FOREIGN KEY([CloseManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_OpenCircuit] CHECK CONSTRAINT [FK_License_OpenCircuit_Sys_User3]
GO

ALTER TABLE [dbo].[License_OpenCircuit]  WITH CHECK ADD  CONSTRAINT [FK_License_OpenCircuit_Sys_User4] FOREIGN KEY([NextManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_OpenCircuit] CHECK CONSTRAINT [FK_License_OpenCircuit_Sys_User4]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_OpenCircuit', @level2type=N'COLUMN',@level2name=N'OpenCircuitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_OpenCircuit', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_OpenCircuit', @level2type=N'COLUMN',@level2name=N'LicenseCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���뵥ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_OpenCircuit', @level2type=N'COLUMN',@level2name=N'ApplyUnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_OpenCircuit', @level2type=N'COLUMN',@level2name=N'ApplyManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_OpenCircuit', @level2type=N'COLUMN',@level2name=N'ApplyDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ�ص�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_OpenCircuit', @level2type=N'COLUMN',@level2name=N'WorkPalce'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_OpenCircuit', @level2type=N'COLUMN',@level2name=N'WorkMeasures'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ч�ڿ�ʼʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_OpenCircuit', @level2type=N'COLUMN',@level2name=N'ValidityStartTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ч�ڽ���ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_OpenCircuit', @level2type=N'COLUMN',@level2name=N'ValidityEndTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ռ�õ�·����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_OpenCircuit', @level2type=N'COLUMN',@level2name=N'RoadName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ��ʩ��ʹ�õĹ�����˵��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_OpenCircuit', @level2type=N'COLUMN',@level2name=N'SafeMeasures'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ȡ����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_OpenCircuit', @level2type=N'COLUMN',@level2name=N'CancelManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ȡ��ԭ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_OpenCircuit', @level2type=N'COLUMN',@level2name=N'CancelReasons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ȡ��ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_OpenCircuit', @level2type=N'COLUMN',@level2name=N'CancelTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ر���ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_OpenCircuit', @level2type=N'COLUMN',@level2name=N'CloseManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ر�ԭ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_OpenCircuit', @level2type=N'COLUMN',@level2name=N'CloseReasons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ر�ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_OpenCircuit', @level2type=N'COLUMN',@level2name=N'CloseTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬(0-���ύ��1-����У�2-�����ɣ�3-�رգ�-1ȡ��)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_OpenCircuit', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�²�������ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_OpenCircuit', @level2type=N'COLUMN',@level2name=N'NextManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��·(ռ��)��ҵƱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_OpenCircuit'
GO
