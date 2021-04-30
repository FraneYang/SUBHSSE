--增加项目隶属单位
ALTER TABLE Base_Project ADD UnitId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目所属单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Project', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

ALTER TABLE [dbo].[Base_Project]  WITH CHECK ADD  CONSTRAINT [FK_Base_Project_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Base_Project] CHECK CONSTRAINT [FK_Base_Project_Base_Unit]
GO

ALTER TABLE SitePerson_SendReceive ADD IsAgree BIT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否同意接收' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_SendReceive', @level2type=N'COLUMN',@level2name=N'IsAgree'
GO

CREATE TABLE [dbo].[Project_SendReceive](
	[SendReceiveId] [nvarchar](50) NOT NULL,
	[UserId] [nvarchar](50) NULL,
	[SendProjectId] [nvarchar](50) NULL,
	[ReceiveProjectId] [nvarchar](50) NULL,
	[SendTime] [datetime] NULL,
	[ReceiveTime] [datetime] NULL,
	[IsAgree] [bit] NULL,
 CONSTRAINT [PK_Project_SendReceive] PRIMARY KEY CLUSTERED 
(
	[SendReceiveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Project_SendReceive]  WITH CHECK ADD  CONSTRAINT [FK_Project_SendReceive_Base_Project] FOREIGN KEY([SendProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Project_SendReceive] CHECK CONSTRAINT [FK_Project_SendReceive_Base_Project]
GO

ALTER TABLE [dbo].[Project_SendReceive]  WITH CHECK ADD  CONSTRAINT [FK_Project_SendReceive_Base_Project1] FOREIGN KEY([ReceiveProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Project_SendReceive] CHECK CONSTRAINT [FK_Project_SendReceive_Base_Project1]
GO

ALTER TABLE [dbo].[Project_SendReceive]  WITH CHECK ADD  CONSTRAINT [FK_Project_SendReceive_Sys_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Project_SendReceive] CHECK CONSTRAINT [FK_Project_SendReceive_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_SendReceive', @level2type=N'COLUMN',@level2name=N'SendReceiveId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目用户id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_SendReceive', @level2type=N'COLUMN',@level2name=N'UserId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'送出项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_SendReceive', @level2type=N'COLUMN',@level2name=N'SendProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_SendReceive', @level2type=N'COLUMN',@level2name=N'ReceiveProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'送出时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_SendReceive', @level2type=N'COLUMN',@level2name=N'SendTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_SendReceive', @level2type=N'COLUMN',@level2name=N'ReceiveTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否同意接收' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_SendReceive', @level2type=N'COLUMN',@level2name=N'IsAgree'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目用户转换表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_SendReceive'
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('DB3F7E51-7700-4B87-A529-3070AA652517','项目用户转换','ProjectData/SendReceive.aspx','PageHeaderFooter',35,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
GO
	--用户项目转换按钮
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B2C62C22-E4F8-4D66-AA53-A1842F95CD2C','DB3F7E51-7700-4B87-A529-3070AA652517','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('62AF7F80-D309-44B4-9101-DE7C8E265955','DB3F7E51-7700-4B87-A529-3070AA652517','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('9E29E5B0-113B-4073-B419-138C8AA972D5','DB3F7E51-7700-4B87-A529-3070AA652517','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('087DF16F-6114-45D9-BD73-DAA5232678EE','DB3F7E51-7700-4B87-A529-3070AA652517','保存',4)  
GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('DB3F7E51-7700-4B87-A529-3070AA652517','项目用户转换','ProjectData/SendReceive.aspx','PageHeaderFooter',35,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('9D4F76A1-CD2E-4E66-B833-49425CD879EB','公司教材库','EduTrain/CompanyTraining.aspx','Page',15,'E26D223B-4CA2-4A6D-82D0-224CC9C8676D','Menu_Resource',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('014E0FD2-7642-4B4C-9C39-A170917DBDBB','9D4F76A1-CD2E-4E66-B833-49425CD879EB','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('86E61D57-8D3C-4C53-AA38-9F3C0D5F1505','9D4F76A1-CD2E-4E66-B833-49425CD879EB','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('93AC7AB0-72E1-4F22-9E4E-8FB29259E582','9D4F76A1-CD2E-4E66-B833-49425CD879EB','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('45507F8A-A7FD-4EEA-AA31-A62B6D2B777E','9D4F76A1-CD2E-4E66-B833-49425CD879EB','保存',4)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('77AE466E-753B-4334-B263-290D94A164CE','9D4F76A1-CD2E-4E66-B833-49425CD879EB','导出',5)
GO


CREATE TABLE [dbo].[Training_CompanyTraining](
	[CompanyTrainingId] [nvarchar](50) NOT NULL,
	[CompanyTrainingCode] [nvarchar](50) NULL,
	[CompanyTrainingName] [nvarchar](100) NULL,
	[SupCompanyTrainingId] [nvarchar](50) NULL,
	[IsEndLever] [bit] NULL,
 CONSTRAINT [PK_Training_CompanyTraining] PRIMARY KEY CLUSTERED 
(
	[CompanyTrainingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司培训资源' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_CompanyTraining'
GO


CREATE TABLE [dbo].[Training_CompanyTrainingItem](
	[CompanyTrainingItemId] [nvarchar](50) NOT NULL,
	[CompanyTrainingId] [nvarchar](50) NULL,
	[CompanyTrainingItemCode] [nvarchar](50) NULL,
	[CompanyTrainingItemName] [nvarchar](100) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_Training_CompanyTrainingItem] PRIMARY KEY CLUSTERED 
(
	[CompanyTrainingItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司培训明细id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_CompanyTrainingItem', @level2type=N'COLUMN',@level2name=N'CompanyTrainingItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司培训主键id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_CompanyTrainingItem', @level2type=N'COLUMN',@level2name=N'CompanyTrainingId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'明细编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_CompanyTrainingItem', @level2type=N'COLUMN',@level2name=N'CompanyTrainingItemCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'明细名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_CompanyTrainingItem', @level2type=N'COLUMN',@level2name=N'CompanyTrainingItemName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_CompanyTrainingItem', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训资源明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_CompanyTrainingItem'
GO

ALTER TABLE [dbo].[Training_CompanyTrainingItem]  WITH CHECK ADD  CONSTRAINT [FK_Training_CompanyTrainingItem_Training_CompanyTraining] FOREIGN KEY([CompanyTrainingId])
REFERENCES [dbo].[Training_CompanyTraining] ([CompanyTrainingId])
GO

ALTER TABLE [dbo].[Training_CompanyTrainingItem] CHECK CONSTRAINT [FK_Training_CompanyTrainingItem_Training_CompanyTraining]
GO



