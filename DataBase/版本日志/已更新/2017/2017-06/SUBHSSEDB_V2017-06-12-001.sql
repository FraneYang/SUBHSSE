
CREATE TABLE [dbo].[Inspection_RegistrationRecord](
	[RegistrationRecordId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[RegistrationIds] [nvarchar](2000) NULL,
	[CheckDate] [datetime] NULL,
	[CheckPerson] [nvarchar](50) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_Inspection_RegistrationRecord] PRIMARY KEY CLUSTERED 
(
	[RegistrationRecordId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspection_RegistrationRecord', @level2type=N'COLUMN',@level2name=N'RegistrationRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspection_RegistrationRecord', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'明细表Ids' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspection_RegistrationRecord', @level2type=N'COLUMN',@level2name=N'RegistrationIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'巡检日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspection_RegistrationRecord', @level2type=N'COLUMN',@level2name=N'CheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'巡检人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspection_RegistrationRecord', @level2type=N'COLUMN',@level2name=N'CheckPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隐患巡检记录（手机端）表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspection_RegistrationRecord'
GO

ALTER TABLE [dbo].[Inspection_RegistrationRecord]  WITH CHECK ADD  CONSTRAINT [FK_Inspection_RegistrationRecord_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Inspection_RegistrationRecord] CHECK CONSTRAINT [FK_Inspection_RegistrationRecord_Base_Project]
GO

ALTER TABLE [dbo].[Inspection_RegistrationRecord]  WITH CHECK ADD  CONSTRAINT [FK_Inspection_RegistrationRecord_Sys_User] FOREIGN KEY([CheckPerson])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Inspection_RegistrationRecord] CHECK CONSTRAINT [FK_Inspection_RegistrationRecord_Sys_User]
GO


CREATE VIEW [dbo].[View_RegistrationRecord]
/*手机APP隐患巡检记录列表视图*/
AS
SELECT h.RegistrationRecordId,
    h.ProjectId,
	h.RegistrationIds,            
	(select convert(varchar(100),h.CheckDate,23)+' '+(select datename(weekday,h.CheckDate))) as Date,
	h.CheckDate,
	user1.UserName as CheckPersonMan,
	h.CheckPerson,
	h.CompileMan,
	h.CompileDate
FROM dbo.Inspection_RegistrationRecord AS h
LEFT JOIN dbo.Sys_User AS user1 ON user1.UserId =h.CheckPerson


GO


INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('9B2F84A8-50EB-49F1-A876-E2BE1524A941','隐患巡检记录（手机端）','Check/RegistrationRecord.aspx','PageHeaderFooter',77,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
GO 
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex) VALUES('7B86E1DE-2FB2-425A-9EFC-D8D722398FD5','9B2F84A8-50EB-49F1-A876-E2BE1524A941','保存',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex) VALUES('D9B87691-CB09-484C-9557-250030628E04','9B2F84A8-50EB-49F1-A876-E2BE1524A941','删除',2)
GO
    
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('9B2F84A8-50EB-49F1-A876-E2BE1524A941','隐患巡检记录（手机端）','Check/RegistrationRecord.aspx','PageHeaderFooter',87,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
GO