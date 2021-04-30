ALTER TABLE SafetyData_SafetyDataPlan ADD ReminderDate DATETIME NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提醒日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan', @level2type=N'COLUMN',@level2name=N'ReminderDate'
GO
ALTER TABLE SafetyData_SafetyDataPlan ADD SubmitDate DATETIME NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提交日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan', @level2type=N'COLUMN',@level2name=N'SubmitDate'
GO
ALTER TABLE SafetyData_SafetyDataPlan ADD ShouldScore DECIMAL(19,1) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应得分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan', @level2type=N'COLUMN',@level2name=N'ShouldScore'
GO

ALTER TABLE SafetyData_SafetyDataPlan ADD RealScore DECIMAL(19,1) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实际得分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataPlan', @level2type=N'COLUMN',@level2name=N'RealScore'
GO

INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('6476423F-C459-47FB-952F-38894DC28308','039BD08A-9C38-4C28-81EE-A6CA86F580B2','修改',2)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('1EBA5027-3873-4861-ACB4-DA1B4A0236EF','039BD08A-9C38-4C28-81EE-A6CA86F580B2','保存',4)
GO

DELETE FROM Sys_ButtonToMenu WHERE MenuId='2A405839-FD14-4398-8AEE-48B44BFDA1F6'
GO
DELETE FROM Sys_MenuCommon WHERE MenuId='2A405839-FD14-4398-8AEE-48B44BFDA1F6'
GO
UPDATE Sys_MenuCommon SET SortIndex=30 WHERE MenuId='74A51BC9-EE10-4534-A4A7-37889B07753C'
GO

INSERT Sys_Const (ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES ('3803E407-C4DA-43BE-98E6-93E890F743A1',5,'E',5,'ProjectType')
GO
UPDATE Sys_MenuCommon SET Icon='Folder' WHERE MenuId ='0987D15D-3A2B-4B59-953A-A30B661E225A'
GO
UPDATE Sys_MenuCommon SET MenuName='资料目录设置',Icon='Page' WHERE MenuId ='60E00925-3357-441E-BD2F-2DF8C91BDDE6'
GO
UPDATE Sys_MenuCommon SET MenuName='考核计划总表',Icon='Page' WHERE MenuId ='039BD08A-9C38-4C28-81EE-A6CA86F580B2'
GO
UPDATE Sys_MenuCommon SET MenuName='项目上报资料',Icon='Page' WHERE MenuId ='74A51BC9-EE10-4534-A4A7-37889B07753C'
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('08E34E86-1B8C-410A-AB73-16203001D79D','E项目安全管理资料','','FolderFont',108,'0','Menu_Server',0,0)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
VALUES('5786468C-3EB3-4219-8121-70F603E48A1A','资料目录设置','SafetyDataE/SafetyDataE.aspx','Page',10,'08E34E86-1B8C-410A-AB73-16203001D79D','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('1F355556-CAC1-4807-AB08-12905F91D8C8','5786468C-3EB3-4219-8121-70F603E48A1A','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('0D7F6045-5134-4488-864F-718BF7A40E2D','5786468C-3EB3-4219-8121-70F603E48A1A','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('E2F7BB56-5AB8-48E7-8902-A1657124F71E','5786468C-3EB3-4219-8121-70F603E48A1A','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('CB03AB3B-8EF0-4FF9-B915-90DD1E4E5046','5786468C-3EB3-4219-8121-70F603E48A1A','保存',4)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
VALUES('F29C7286-446D-49CC-AB6B-40CA48132CB8','考核计划总表','SafetyDataE/SafetyDataEPlan.aspx','Page',20,'08E34E86-1B8C-410A-AB73-16203001D79D','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('A1801284-3E01-4E0D-AF9A-6BB78C96CEB6','F29C7286-446D-49CC-AB6B-40CA48132CB8','删除',1)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('663453EB-E9A0-489E-A619-7B4B30FB2F60','F29C7286-446D-49CC-AB6B-40CA48132CB8','修改',2)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('D84F0E99-B880-4DED-B5AA-44016A5E36DC','F29C7286-446D-49CC-AB6B-40CA48132CB8','保存',4)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('612AAAE8-4178-4E46-9AD7-EA471611D5C0','F29C7286-446D-49CC-AB6B-40CA48132CB8','增加',1)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
VALUES('CDEFCAB5-328C-406B-9551-435250C84D1D','项目上报资料','SafetyDataE/ProjectSafetyDataE.aspx','Page',30,'08E34E86-1B8C-410A-AB73-16203001D79D','Menu_Server',1,0)
GO

CREATE TABLE [dbo].[SafetyDataE_SafetyDataE](
	[SafetyDataEId] [nvarchar](50) NOT NULL,
	[MenuId] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](100) NULL,
	[Score] [decimal](19, 1) NULL,
	[Digit] [int] NULL,
	[SupSafetyDataEId] [nvarchar](50) NULL,
	[IsEndLever] [bit] NULL,
	[Remark] [nvarchar](500) NULL,
	[CheckType] [nvarchar](10) NULL,
	[CheckTypeValue1] [int] NULL,
	[CheckTypeValue2] [int] NULL,
	[IsCheck] [bit] NULL,
 CONSTRAINT [PK_SafetyDataE_SafetyDataE] PRIMARY KEY CLUSTERED 
(
	[SafetyDataEId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'企业安全管理资料id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataE', @level2type=N'COLUMN',@level2name=N'SafetyDataEId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataE', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'企业安全管理资料资源编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataE', @level2type=N'COLUMN',@level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'企业安全管理资料名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataE', @level2type=N'COLUMN',@level2name=N'Title'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataE', @level2type=N'COLUMN',@level2name=N'Score'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单据流水号位数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataE', @level2type=N'COLUMN',@level2name=N'Digit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否末级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataE', @level2type=N'COLUMN',@level2name=N'IsEndLever'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataE', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表考核类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataE', @level2type=N'COLUMN',@level2name=N'CheckType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表考核类型值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataE', @level2type=N'COLUMN',@level2name=N'CheckTypeValue1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表考核类型值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataE', @level2type=N'COLUMN',@level2name=N'CheckTypeValue2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'E项目安全管理资料表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataE'
GO



CREATE TABLE [dbo].[SafetyDataE_SafetyDataEItem](
	[SafetyDataEItemId] [nvarchar](50) NOT NULL,
	[SafetyDataEId] [nvarchar](50) NULL,
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
	[SubmitDate] [datetime] NULL,
 CONSTRAINT [PK_SafetyDataE_SafetyDataEItem] PRIMARY KEY CLUSTERED 
(
	[SafetyDataEItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[SafetyDataE_SafetyDataEItem]  WITH CHECK ADD  CONSTRAINT [FK_SafetyDataE_SafetyDataEItem_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SafetyDataE_SafetyDataEItem] CHECK CONSTRAINT [FK_SafetyDataE_SafetyDataEItem_Base_Project]
GO

ALTER TABLE [dbo].[SafetyDataE_SafetyDataEItem]  WITH CHECK ADD  CONSTRAINT [FK_SafetyDataE_SafetyDataEItem_SafetyDataE_SafetyDataE] FOREIGN KEY([SafetyDataEId])
REFERENCES [dbo].[SafetyDataE_SafetyDataE] ([SafetyDataEId])
GO

ALTER TABLE [dbo].[SafetyDataE_SafetyDataEItem] CHECK CONSTRAINT [FK_SafetyDataE_SafetyDataEItem_SafetyDataE_SafetyDataE]
GO

ALTER TABLE [dbo].[SafetyDataE_SafetyDataEItem]  WITH CHECK ADD  CONSTRAINT [FK_SafetyDataE_SafetyDataEItem_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[SafetyDataE_SafetyDataEItem] CHECK CONSTRAINT [FK_SafetyDataE_SafetyDataEItem_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'企业安全管理资料明细主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEItem', @level2type=N'COLUMN',@level2name=N'SafetyDataEItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEItem', @level2type=N'COLUMN',@level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEItem', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEItem', @level2type=N'COLUMN',@level2name=N'Title'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEItem', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEItem', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEItem', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEItem', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEItem', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否菜单文件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEItem', @level2type=N'COLUMN',@level2name=N'IsMenu'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEItem', @level2type=N'COLUMN',@level2name=N'Url'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提交时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEItem', @level2type=N'COLUMN',@level2name=N'SubmitDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'E项目安全管理资料明细' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEItem'
GO


CREATE TABLE [dbo].[SafetyDataE_SafetyDataEPlan](
	[SafetyDataEPlanId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[SafetyDataEId] [nvarchar](50) NULL,
	[CheckDate] [datetime] NULL,
	[RealStartDate] [datetime] NULL,
	[RealEndDate] [datetime] NULL,
	[Score] [decimal](19, 1) NULL,
	[Remark] [nvarchar](500) NULL,
	[ReminderDate] [datetime] NULL,
	[SubmitDate] [datetime] NULL,
	[ShouldScore] [decimal](19, 1) NULL,
	[RealScore] [decimal](19, 1) NULL,
 CONSTRAINT [PK_SafetyDataE_SafetyDataEPlan] PRIMARY KEY CLUSTERED 
(
	[SafetyDataEPlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SafetyDataE_SafetyDataEPlan]  WITH CHECK ADD  CONSTRAINT [FK_SafetyDataE_SafetyDataEPlan_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SafetyDataE_SafetyDataEPlan] CHECK CONSTRAINT [FK_SafetyDataE_SafetyDataEPlan_Base_Project]
GO

ALTER TABLE [dbo].[SafetyDataE_SafetyDataEPlan]  WITH CHECK ADD  CONSTRAINT [FK_SafetyDataE_SafetyDataEPlan_SafetyDataE_SafetyDataE] FOREIGN KEY([SafetyDataEId])
REFERENCES [dbo].[SafetyDataE_SafetyDataE] ([SafetyDataEId])
GO

ALTER TABLE [dbo].[SafetyDataE_SafetyDataEPlan] CHECK CONSTRAINT [FK_SafetyDataE_SafetyDataEPlan_SafetyDataE_SafetyDataE]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考核计划总表主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEPlan', @level2type=N'COLUMN',@level2name=N'SafetyDataEPlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEPlan', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考核项id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEPlan', @level2type=N'COLUMN',@level2name=N'SafetyDataEId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考核截至日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEPlan', @level2type=N'COLUMN',@level2name=N'CheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实际考核日期开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEPlan', @level2type=N'COLUMN',@level2name=N'RealStartDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实际考核日期结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEPlan', @level2type=N'COLUMN',@level2name=N'RealEndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEPlan', @level2type=N'COLUMN',@level2name=N'Score'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEPlan', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提醒日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEPlan', @level2type=N'COLUMN',@level2name=N'ReminderDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提交日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEPlan', @level2type=N'COLUMN',@level2name=N'SubmitDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应得分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEPlan', @level2type=N'COLUMN',@level2name=N'ShouldScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实际得分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEPlan', @level2type=N'COLUMN',@level2name=N'RealScore'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'E项目考核计划总表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyDataE_SafetyDataEPlan'
GO

CREATE VIEW [dbo].[View_SafetyDataE_SafetyDataEPlan] 
AS 
/*E项目安全计划表视图*/
SELECT SafetyDataEPlan.SafetyDataEPlanId
      ,SafetyDataEPlan.ProjectId
	  ,Project.ProjectName
      ,SafetyDataEPlan.SafetyDataEId
	  ,SafetyDataE.Title
	  ,SafetyDataE.Code
	  ,convert(varchar(7),SafetyDataEPlan.CheckDate,120) AS CheckMonth 
      ,SafetyDataEPlan.CheckDate
      ,SafetyDataEPlan.RealStartDate
      ,SafetyDataEPlan.RealEndDate
      ,SafetyDataEPlan.Score
      ,SafetyDataEPlan.Remark
FROM SafetyDataE_SafetyDataEPlan AS SafetyDataEPlan
LEFT JOIN SafetyDataE_SafetyDataE AS SafetyDataE ON SafetyDataEPlan.SafetyDataEId =SafetyDataE.SafetyDataEId
LEFT JOIN Base_Project AS Project ON SafetyDataEPlan.ProjectId =Project.ProjectId

GO

	--安全管理资料
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('5BB670AD-CCAA-4004-B931-70C5879A968B','安全管理资料','','ApplicationViewColumns',215,'0','Menu_Project',0,0)
GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
	VALUES('BC3B7C4A-D69C-45CA-A951-98F4F64191BB','安全管理资料','SafetyDataE/ProjectSafetyDataE.aspx','PageHeaderFooter',10,'5BB670AD-CCAA-4004-B931-70C5879A968B','Menu_Project',1,0)
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
	VALUES('8F2E3B63-8B98-44FC-8353-7F09DA86A463','安全管理资料考核','SafetyDataE/ProjectSafetyDataECheck.aspx','PageHeaderFooter',20,'5BB670AD-CCAA-4004-B931-70C5879A968B','Menu_Project',1,0)
	GO

	--安全管理资料
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('5BB670AD-CCAA-4004-B931-70C5879A968B','安全管理资料','','ApplicationViewColumns',215,'0','Menu_Project',0,0)
GO

	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
	VALUES('BC3B7C4A-D69C-45CA-A951-98F4F64191BB','安全管理资料','SafetyDataE/ProjectSafetyDataE.aspx','PageHeaderFooter',10,'5BB670AD-CCAA-4004-B931-70C5879A968B','Menu_Project',1,0)
	GO

	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
	VALUES('8F2E3B63-8B98-44FC-8353-7F09DA86A463','安全管理资料考核','SafetyDataE/ProjectSafetyDataECheck.aspx','PageHeaderFooter',20,'5BB670AD-CCAA-4004-B931-70C5879A968B','Menu_Project',1,0)
	GO


ALTER VIEW [dbo].[View_NewDynamic] 
AS
SELECT PersonQuality.PersonId AS Id
	,'特岗人员资质' AS Type, ( '[' + ISNULL(Person.CardNo,'') +']'+ Person.PersonName +'已过期，项目：'+ Project.ProjectName) AS Name
	,PersonQuality.LimitDate AS Date
	,'~/QualityAudit/PersonQualityEdit.aspx?PersonId={0}' AS Url
	,Project.ProjectId 
FROM QualityAudit_PersonQuality AS PersonQuality
	LEFT JOIN SitePerson_Person AS Person ON Person.PersonId = PersonQuality.PersonId
	LEFT JOIN Base_Project AS Project ON Person.ProjectId =Project.ProjectId
	LEFT JOIN Base_WorkPost AS WorkPost ON Person.WorkPostId =WorkPost.WorkPostId
WHERE PersonQuality.LimitDate<=GETDATE() and (Project.ProjectState is null or Project.ProjectState='1')
AND (GETDATE()< Person.OutTime OR Person.OutTime IS NULL) AND WorkPost.PostType= '2'

UNION
SELECT PersonQuality.PersonId AS Id
	,'特岗人员资质' AS Type, ( '[' + ISNULL(Person.CardNo,'') +']'+ Person.PersonName +'还有'+CAST(DATEDIFF(DAY,PersonQuality.LimitDate,GETDATE())AS NVARCHAR(5))+'天过期，项目：'+ Project.ProjectName) AS Name
	,PersonQuality.LimitDate AS Date
	,'~/QualityAudit/PersonQualityEdit.aspx?PersonId={0}' AS Url
	,Project.ProjectId 
FROM QualityAudit_PersonQuality AS PersonQuality
	LEFT JOIN SitePerson_Person AS Person ON Person.PersonId = PersonQuality.PersonId
	LEFT JOIN Base_Project AS Project ON Person.ProjectId =Project.ProjectId
	LEFT JOIN Base_WorkPost AS WorkPost ON Person.WorkPostId =WorkPost.WorkPostId
WHERE PersonQuality.LimitDate>GETDATE() and PersonQuality.LimitDate<= dateadd(month,1, GETDATE())  and (Project.ProjectState is null or Project.ProjectState='1')
AND (GETDATE()< Person.OutTime OR Person.OutTime IS NULL) AND WorkPost.PostType= '2'

UNION

SELECT EquipmentQuality.EquipmentQualityId
	,'特种设备资质', EquipmentQuality.EquipmentQualityName+'已过期，项目：'+ Project.ProjectName
	,EquipmentQuality.LimitDate
	,'~/QualityAudit/EquipmentQualityEdit.aspx?EquipmentQualityId={0}' AS Url 
	,Project.ProjectId
FROM QualityAudit_EquipmentQuality AS EquipmentQuality 
	LEFT JOIN Base_SpecialEquipment AS SpecialEquipment ON SpecialEquipment.SpecialEquipmentId = EquipmentQuality.SpecialEquipmentId
	LEFT JOIN Base_Project AS Project ON EquipmentQuality.ProjectId =Project.ProjectId
WHERE EquipmentQuality.LimitDate< GETDATE() and (Project.ProjectState is null or Project.ProjectState='1')
	AND (GETDATE()< EquipmentQuality.OutDate OR EquipmentQuality.OutDate IS NULL)

UNION
SELECT EquipmentQuality.EquipmentQualityId
	,'特种设备资质', EquipmentQuality.EquipmentQualityName+'还有'+CAST(DATEDIFF(DAY,GETDATE(),EquipmentQuality.LimitDate) AS NVARCHAR(5))+'天过期，项目：'+ Project.ProjectName
	,EquipmentQuality.LimitDate
	,'~/QualityAudit/EquipmentQualityEdit.aspx?EquipmentQualityId={0}' AS Url 
	,Project.ProjectId
FROM QualityAudit_EquipmentQuality AS EquipmentQuality 
	LEFT JOIN Base_SpecialEquipment AS SpecialEquipment ON SpecialEquipment.SpecialEquipmentId = EquipmentQuality.SpecialEquipmentId
	LEFT JOIN Base_Project AS Project ON EquipmentQuality.ProjectId =Project.ProjectId
WHERE EquipmentQuality.LimitDate >  GETDATE() and EquipmentQuality.LimitDate < dateadd(month,1, GETDATE()) and (Project.ProjectState is null or Project.ProjectState='1')
	AND (GETDATE()< EquipmentQuality.OutDate OR EquipmentQuality.OutDate IS NULL)

UNION
SELECT CarManager.CarManagerId
	,'现场车辆管理', CarName+'年检已过期，项目：'+ Project.ProjectName
	,CarManager.LastYearCheckDate
	,'~/Administrative/CarManagerView.aspx?CarManagerId={0}' AS Url 
	,Project.ProjectId
FROM Administrative_CarManager AS CarManager 
	LEFT JOIN Base_Project AS Project ON CarManager.ProjectId =Project.ProjectId
WHERE CarManager.LastYearCheckDate<=GETDATE() and (Project.ProjectState is null or Project.ProjectState='1')

UNION
SELECT CarManager.CarManagerId
	,'现场车辆管理', CarName+'保险已过期，项目：'+ Project.ProjectName
	,CarManager.InsuranceDate
	,'~/Administrative/CarManagerView.aspx?CarManagerId={0}' AS Url 
	,Project.ProjectId
FROM Administrative_CarManager AS CarManager 
	LEFT JOIN Base_Project AS Project ON CarManager.ProjectId =Project.ProjectId
WHERE CarManager.InsuranceDate<=GETDATE() and (Project.ProjectState is null or Project.ProjectState='1')

UNION
SELECT DriverManager.DriverManagerId
	,'驾驶员管理', DriverName+'年检已过期，项目：'+ Project.ProjectName
	,DriverManager.CheckDate
	,'~/Administrative/DriverManagerView.aspx?DriverManagerId={0}' AS Url 
	,Project.ProjectId
FROM Administrative_DriverManager AS DriverManager 
	LEFT JOIN Base_Project AS Project ON DriverManager.ProjectId =Project.ProjectId
WHERE DriverManager.CheckDate<=GETDATE() and (Project.ProjectState is null or Project.ProjectState='1')

UNION
SELECT LicenseManager.LicenseManagerId
	,'作业许可证', LicenseManagerCode+'已过期，项目：'+ Project.ProjectName
	,LicenseManager.EndDate
	,'~/License/LicenseManagerView.aspx?LicenseManagerId={0}' AS Url 
	,Project.ProjectId
FROM License_LicenseManager AS LicenseManager 
	LEFT JOIN Base_Project AS Project ON LicenseManager.ProjectId =Project.ProjectId
WHERE LicenseManager.EndDate<=GETDATE() AND  DATEADD(DAY,1,LicenseManager.EndDate)>=GETDATE() and (Project.ProjectState is null or Project.ProjectState='1')

UNION
SELECT PunishNotice.PunishNoticeId
	,'处罚通知单', PunishNoticeCode+'未响应，项目：'+ Project.ProjectName
	,PunishNotice.PunishNoticeDate
	,'~/Check/PunishNoticeEdit.aspx?PunishNoticeId={0}' AS Url 
	,Project.ProjectId
FROM Check_PunishNotice AS PunishNotice 
	LEFT JOIN Base_Project AS Project ON PunishNotice.ProjectId =Project.ProjectId
	LEFT JOIN AttachFile AS AttachFile ON PunishNotice.PunishNoticeId =AttachFile.ToKeyId
WHERE AttachFile.ToKeyId IS NULL AND PunishNotice.States='2' and (Project.ProjectState is null or Project.ProjectState='1')

UNION
SELECT item.HazardListId
	,'危险源辩识评价', hList.HazardCode+'未响应，项目：'+ Project.ProjectName
	,hl.CompileDate
	,'~/Hazard/Response.aspx?HazardListId={0}' AS Url 
	,Project.ProjectId
FROM Hazard_HazardSelectedItem AS item 
	left join dbo.Hazard_HazardList hl on item.HazardListId=hl.HazardListId
	left join dbo.Technique_HazardList hList on item.HazardId=hList.HazardId
	LEFT JOIN Base_Project AS Project ON hl.ProjectId =Project.ProjectId
WHERE item.IsResponse = 0 AND dateadd(wk,item.PromptTime,hl.CompileDate)<=GETDATE() and (Project.ProjectState is null or Project.ProjectState='1')

UNION
SELECT item.EnvironmentalRiskListId
	,'重要环境危险因素:', item.EnvironmentalFactors+'提示，项目：'+ Project.ProjectName
	,hl.CompileDate
	,'~/Hazard/EnvironmentalRiskListView.aspx?EnvironmentalRiskListId={0}' AS Url 
	,Project.ProjectId
FROM Hazard_EnvironmentalRiskItem AS item 
	left join dbo.Hazard_EnvironmentalRiskList hl on item.EnvironmentalRiskListId=hl.EnvironmentalRiskListId
	LEFT JOIN Base_Project AS Project ON hl.ProjectId =Project.ProjectId
WHERE item.IsImportant = 1 AND DATEADD(DAY,7,hl.IdentificationDate) > GETDATE()
and (Project.ProjectState is null or Project.ProjectState='1') and hl.States='2'

UNION
SELECT Project.ProjectId
	,'项目安全资料','【'+CAST(COUNT(*) AS nvarchar(50))+'】条超期未报。项目：'+ Project.ProjectName
	,GETDATE()
	,'' AS Url 
	,Project.ProjectId
FROM SafetyData_SafetyDataPlan AS SafetyDataPlan 
	LEFT JOIN Base_Project AS Project ON SafetyDataPlan.ProjectId =Project.ProjectId
WHERE SafetyDataPlan.SubmitDate IS NULL  AND Project.ProjectType !='5' AND 
SafetyDataPlan.RealEndDate<=GETDATE() and (Project.ProjectState is null or Project.ProjectState='1')
GROUP BY Project.ProjectId,Project.ProjectName
UNION
SELECT Project.ProjectId
	,'E项目安全资料','【'+CAST(COUNT(*) AS nvarchar(50))+'】条超期未报。项目：'+ Project.ProjectName
	,GETDATE()
	,'' AS Url 
	,Project.ProjectId
FROM SafetyDataE_SafetyDataEPlan AS SafetyDataEPlan 
	LEFT JOIN Base_Project AS Project ON SafetyDataEPlan.ProjectId =Project.ProjectId
WHERE SafetyDataEPlan.SubmitDate IS NULL AND Project.ProjectType='5' AND
SafetyDataEPlan.RealEndDate<=GETDATE() and (Project.ProjectState is null or Project.ProjectState='1')
GROUP BY Project.ProjectId,Project.ProjectName
GO