CREATE TABLE [dbo].[SitePerson_SendReceive](
	[SendReceiveId] [nvarchar](50) NOT NULL,
	[PersonId] [nvarchar](50) NULL,
	[SendProjectId] [nvarchar](50) NULL,
	[ReceiveProjectId] [nvarchar](50) NULL,
	[SendTime] [datetime] NULL,
	[ReceiveTime] [datetime] NULL,
 CONSTRAINT [PK_SitePerson_SendReceive] PRIMARY KEY CLUSTERED 
(
	[SendReceiveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[SitePerson_SendReceive]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_SendReceive_Base_Project] FOREIGN KEY([SendProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SitePerson_SendReceive] CHECK CONSTRAINT [FK_SitePerson_SendReceive_Base_Project]
GO

ALTER TABLE [dbo].[SitePerson_SendReceive]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_SendReceive_Base_Project1] FOREIGN KEY([ReceiveProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SitePerson_SendReceive] CHECK CONSTRAINT [FK_SitePerson_SendReceive_Base_Project1]
GO

ALTER TABLE [dbo].[SitePerson_SendReceive]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_SendReceive_SitePerson_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[SitePerson_Person] ([PersonId])
GO

ALTER TABLE [dbo].[SitePerson_SendReceive] CHECK CONSTRAINT [FK_SitePerson_SendReceive_SitePerson_Person]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_SendReceive', @level2type=N'COLUMN',@level2name=N'SendReceiveId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_SendReceive', @level2type=N'COLUMN',@level2name=N'PersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'送出项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_SendReceive', @level2type=N'COLUMN',@level2name=N'SendProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_SendReceive', @level2type=N'COLUMN',@level2name=N'ReceiveProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'送出时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_SendReceive', @level2type=N'COLUMN',@level2name=N'SendTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_SendReceive', @level2type=N'COLUMN',@level2name=N'ReceiveTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员项目转换表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_SendReceive'
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('06F7E687-51B3-4357-BD6D-E6AEFC0E3975','人员项目转换','SitePerson/SendReceive.aspx','PageHeaderFooter',15,'EE260447-028F-46AF-8864-9A5DC9DAA5BD','Menu_Project',1,0)
GO
	--人员项目转换按钮
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('2D4C48F6-514F-41EA-9811-409299260B5D','06F7E687-51B3-4357-BD6D-E6AEFC0E3975','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('DA3D9F8E-296B-4C96-A553-2F00C60D2E65','06F7E687-51B3-4357-BD6D-E6AEFC0E3975','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('658E098B-3D47-4CAD-B6B0-C3019AD9EC1B','06F7E687-51B3-4357-BD6D-E6AEFC0E3975','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('55291096-18A1-406C-8A5F-3BFB309CA189','06F7E687-51B3-4357-BD6D-E6AEFC0E3975','保存',4)  
GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('06F7E687-51B3-4357-BD6D-E6AEFC0E3975','人员项目转换','SitePerson/SendReceive.aspx','PageHeaderFooter',95,'EE260447-028F-46AF-8864-9A5DC9DAA5BD','Menu_Project',1,0)
GO