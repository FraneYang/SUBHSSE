ALTER TABLE Supervise_SubUnitReportItem ALTER COLUMN ReportContent NVARCHAR(1000) NULL
GO

UPDATE Sys_MenuCommon SET MenuName='��ҵ��ȫ�ļ��ϱ�' WHERE MenuId='3D1CFA31-96A9-496E-9A94-318670C9D658'
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('0987D15D-3A2B-4B59-953A-A30B661E225A','��ҵ��ȫ��������','','ApplicationForm',105,'0','Menu_Server',0,0)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
VALUES('60E00925-3357-441E-BD2F-2DF8C91BDDE6','��ҵ��ȫ������������','SafetyData/SafetyData.aspx','ApplicationForm',10,'0987D15D-3A2B-4B59-953A-A30B661E225A','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('35B96704-27A3-4D0F-B901-6A3BFF3B30C6','60E00925-3357-441E-BD2F-2DF8C91BDDE6','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('462AC76D-0A1E-4C72-91B1-4D54D889D574','60E00925-3357-441E-BD2F-2DF8C91BDDE6','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('2218FED0-A83E-472D-B522-05184F4F6AB4','60E00925-3357-441E-BD2F-2DF8C91BDDE6','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('F21DA753-FBD4-4340-9B1C-A0CD9991933A','60E00925-3357-441E-BD2F-2DF8C91BDDE6','����',4)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
VALUES('039BD08A-9C38-4C28-81EE-A6CA86F580B2','��ҵ��ȫ�������Ͽ��˼ƻ�','SafetyData/SafetyDataPlan.aspx','ApplicationFormMagnify',20,'0987D15D-3A2B-4B59-953A-A30B661E225A','Menu_Server',1,0)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
VALUES('74A51BC9-EE10-4534-A4A7-37889B07753C','��Ŀ��ҵ��ȫ��������','SafetyData/ProjectSafetyData.aspx','ApplicationFormMagnify',30,'0987D15D-3A2B-4B59-953A-A30B661E225A','Menu_Server',1,0)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
VALUES('2A405839-FD14-4398-8AEE-48B44BFDA1F6','��ҵ��ȫ�������Ͽ���','SafetyData/SafetyDataCheck.aspx','ApplicationFormEdit',40,'0987D15D-3A2B-4B59-953A-A30B661E225A','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B0AB1506-96FD-4AB3-96C7-BD4E1673C47B','2A405839-FD14-4398-8AEE-48B44BFDA1F6','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('9378264A-F377-46EA-8457-34EFE3336F00','2A405839-FD14-4398-8AEE-48B44BFDA1F6','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('6BD90B0F-4EAF-4141-9381-38120EB00664','2A405839-FD14-4398-8AEE-48B44BFDA1F6','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('08A89FC7-5774-4150-9224-FF19A08046F2','2A405839-FD14-4398-8AEE-48B44BFDA1F6','����',4)
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
VALUES('54A3E23A-DAC7-484B-8C97-40AD785688FC','��ҵ��ȫ��������','SafetyData/ProjectSafetyData.aspx','ApplicationCascade',110,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('59450BEB-93FC-4CD6-9E27-FFF647121142','54A3E23A-DAC7-484B-8C97-40AD785688FC','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('5CAECBB0-B1A5-48AA-B5FB-C8F82CD46728','54A3E23A-DAC7-484B-8C97-40AD785688FC','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('2AE4A0D4-1ACE-4806-9F4C-5D7B6DE07EF6','54A3E23A-DAC7-484B-8C97-40AD785688FC','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('031B6847-25E5-4275-942D-7A4B09D99385','54A3E23A-DAC7-484B-8C97-40AD785688FC','����',4)
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
VALUES('75088181-ACE2-4CBE-90F9-DB043D46F04A','��ҵ��ȫ�������Ͽ���','SafetyData/ProjectSafetyDataCheck.aspx','ApplicationCascade',120,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B332AEB1-80CF-43BD-8A9C-A5AC020D2AD6','75088181-ACE2-4CBE-90F9-DB043D46F04A','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('82E1D7D1-5CF9-4984-9188-8FE2DFF7A1E0','75088181-ACE2-4CBE-90F9-DB043D46F04A','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('70F3999B-430B-4830-AA93-CB790FCD2449','75088181-ACE2-4CBE-90F9-DB043D46F04A','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('6DA17047-0816-459E-BA4D-B9EC25DEF5F4','75088181-ACE2-4CBE-90F9-DB043D46F04A','����',4)
GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
VALUES('54A3E23A-DAC7-484B-8C97-40AD785688FC','��ҵ��ȫ��������','SafetyData/ProjectSafetyData.aspx','ApplicationCascade',110,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
VALUES('75088181-ACE2-4CBE-90F9-DB043D46F04A','��ҵ��ȫ�������Ͽ���','SafetyData/ProjectSafetyDataCheck.aspx','ApplicationCascade',120,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO


CREATE TABLE [dbo].[SafetyData_SafetyData](
	[SafetyDataId] [nvarchar](50) NOT NULL,
	[MenuId] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](100) NULL,
	[Score] [int] NULL,
	[Digit] [int] NULL,
	[SupSafetyDataId] [nvarchar](50) NULL,
	[IsEndLever] [bit] NULL,
 CONSTRAINT [PK_SafetyData_SafetyData] PRIMARY KEY CLUSTERED 
(
	[SafetyDataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ��ȫ��������id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyData', @level2type=N'COLUMN',@level2name=N'SafetyDataId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyData', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ��ȫ����������Դ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyData', @level2type=N'COLUMN',@level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ��ȫ������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyData', @level2type=N'COLUMN',@level2name=N'Title'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyData', @level2type=N'COLUMN',@level2name=N'Score'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ˮ��λ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyData', @level2type=N'COLUMN',@level2name=N'Digit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�ĩ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyData', @level2type=N'COLUMN',@level2name=N'IsEndLever'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ��ȫ�������ϱ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyData'
GO

CREATE TABLE [dbo].[SafetyData_SafetyDataItem](
	[SafetyDataItemId] [nvarchar](50) NOT NULL,
	[SafetyDataId] [nvarchar](50) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[SortIndex] [int] NULL,
	[Title] [nvarchar](100) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[Remark] [nvarchar](500) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
	[IsMenu] [bit] NULL,
	[Url] [nvarchar](500) NULL,
 CONSTRAINT [PK_SafetyData_SafetyDataItem] PRIMARY KEY CLUSTERED 
(
	[SafetyDataItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[SafetyData_SafetyDataItem]  WITH CHECK ADD  CONSTRAINT [FK_SafetyData_SafetyDataItem_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SafetyData_SafetyDataItem] CHECK CONSTRAINT [FK_SafetyData_SafetyDataItem_Base_Project]
GO

ALTER TABLE [dbo].[SafetyData_SafetyDataItem]  WITH CHECK ADD  CONSTRAINT [FK_SafetyData_SafetyDataItem_SafetyData_SafetyData] FOREIGN KEY([SafetyDataId])
REFERENCES [dbo].[SafetyData_SafetyData] ([SafetyDataId])
GO

ALTER TABLE [dbo].[SafetyData_SafetyDataItem] CHECK CONSTRAINT [FK_SafetyData_SafetyDataItem_SafetyData_SafetyData]
GO

ALTER TABLE [dbo].[SafetyData_SafetyDataItem]  WITH CHECK ADD  CONSTRAINT [FK_SafetyData_SafetyDataItem_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[SafetyData_SafetyDataItem] CHECK CONSTRAINT [FK_SafetyData_SafetyDataItem_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ��ȫ����������ϸ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataItem', @level2type=N'COLUMN',@level2name=N'SafetyDataItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataItem', @level2type=N'COLUMN',@level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataItem', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataItem', @level2type=N'COLUMN',@level2name=N'Title'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ļ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataItem', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataItem', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataItem', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataItem', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataItem', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�˵��ļ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataItem', @level2type=N'COLUMN',@level2name=N'IsMenu'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�·��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataItem', @level2type=N'COLUMN',@level2name=N'Url'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ��ȫ����������ϸ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataItem'
GO




CREATE TABLE [dbo].[SafetyData_SafetyDataCheck](
	[SafetyDataCheckId] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](100) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CompileDate] [datetime] NULL,
	[CompileMan] [nvarchar](50) NULL,
 CONSTRAINT [PK_SafetyData_SafetyDataCheck] PRIMARY KEY CLUSTERED 
(
	[SafetyDataCheckId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[SafetyData_SafetyDataCheck]  WITH CHECK ADD  CONSTRAINT [FK_SafetyData_SafetyDataCheck_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[SafetyData_SafetyDataCheck] CHECK CONSTRAINT [FK_SafetyData_SafetyDataCheck_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ��ȫ����������ϸid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheck', @level2type=N'COLUMN',@level2name=N'SafetyDataCheckId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheck', @level2type=N'COLUMN',@level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheck', @level2type=N'COLUMN',@level2name=N'Title'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ʼ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheck', @level2type=N'COLUMN',@level2name=N'StartDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheck', @level2type=N'COLUMN',@level2name=N'EndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheck', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƶ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheck', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ��ȫ�������Ͽ��˱�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheck'
GO



CREATE TABLE [dbo].[SafetyData_SafetyDataCheckProject](
	[SafetyDataCheckProjectId] [nvarchar](50) NOT NULL,
	[SafetyDataCheckId] [nvarchar](50) NULL,
	[ProjectId] [nvarchar](50) NULL,
 CONSTRAINT [PK_SafetyData_SafetyDataCheckProject] PRIMARY KEY CLUSTERED 
(
	[SafetyDataCheckProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[SafetyData_SafetyDataCheckProject]  WITH CHECK ADD  CONSTRAINT [FK_SafetyData_SafetyDataCheckProject_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SafetyData_SafetyDataCheckProject] CHECK CONSTRAINT [FK_SafetyData_SafetyDataCheckProject_Base_Project]
GO

ALTER TABLE [dbo].[SafetyData_SafetyDataCheckProject]  WITH CHECK ADD  CONSTRAINT [FK_SafetyData_SafetyDataCheckProject_SafetyData_SafetyDataCheck] FOREIGN KEY([SafetyDataCheckId])
REFERENCES [dbo].[SafetyData_SafetyDataCheck] ([SafetyDataCheckId])
GO

ALTER TABLE [dbo].[SafetyData_SafetyDataCheckProject] CHECK CONSTRAINT [FK_SafetyData_SafetyDataCheckProject_SafetyData_SafetyDataCheck]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ��ȫ����������ϸid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheckProject', @level2type=N'COLUMN',@level2name=N'SafetyDataCheckProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheckProject', @level2type=N'COLUMN',@level2name=N'SafetyDataCheckId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheckProject', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ��ȫ�������Ͽ�����Ŀ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheckProject'
GO



CREATE TABLE [dbo].[SafetyData_SafetyDataCheckItem](
	[SafetyDataCheckItemId] [nvarchar](50) NOT NULL,
	[SafetyDataCheckProjectId] [nvarchar](50) NULL,
	[SafetyDataId] [nvarchar](50) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[ReminderDate] [datetime] NULL,
	[SubmitDate] [datetime] NULL,
	[ShouldScore] [int] NULL,
	[RealScore] [int] NULL,
	[State] [char](1) NULL,
 CONSTRAINT [PK_SafetyData_SafetyDataCheckItem] PRIMARY KEY CLUSTERED 
(
	[SafetyDataCheckItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[SafetyData_SafetyDataCheckItem]  WITH CHECK ADD  CONSTRAINT [FK_SafetyData_SafetyDataCheckItem_SafetyData_SafetyData] FOREIGN KEY([SafetyDataId])
REFERENCES [dbo].[SafetyData_SafetyData] ([SafetyDataId])
GO

ALTER TABLE [dbo].[SafetyData_SafetyDataCheckItem] CHECK CONSTRAINT [FK_SafetyData_SafetyDataCheckItem_SafetyData_SafetyData]
GO

ALTER TABLE [dbo].[SafetyData_SafetyDataCheckItem]  WITH CHECK ADD  CONSTRAINT [FK_SafetyData_SafetyDataCheckItem_SafetyData_SafetyDataCheckProject] FOREIGN KEY([SafetyDataCheckProjectId])
REFERENCES [dbo].[SafetyData_SafetyDataCheckProject] ([SafetyDataCheckProjectId])
GO

ALTER TABLE [dbo].[SafetyData_SafetyDataCheckItem] CHECK CONSTRAINT [FK_SafetyData_SafetyDataCheckItem_SafetyData_SafetyDataCheckProject]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ��ȫ����������ϸid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheckItem', @level2type=N'COLUMN',@level2name=N'SafetyDataCheckItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Ŀ��id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheckItem', @level2type=N'COLUMN',@level2name=N'SafetyDataCheckProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ��ȫ������������id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheckItem', @level2type=N'COLUMN',@level2name=N'SafetyDataId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ʼ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheckItem', @level2type=N'COLUMN',@level2name=N'StartDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheckItem', @level2type=N'COLUMN',@level2name=N'EndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheckItem', @level2type=N'COLUMN',@level2name=N'ReminderDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ύ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheckItem', @level2type=N'COLUMN',@level2name=N'SubmitDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ӧ�÷�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheckItem', @level2type=N'COLUMN',@level2name=N'ShouldScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬��0-δ��ʱδ����1-δ��ʱ����2-��ʱδ����3-��ʱ�󴫣�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheckItem', @level2type=N'COLUMN',@level2name=N'State'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ҵ��ȫ�������Ͽ�����ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheckItem'
GO


