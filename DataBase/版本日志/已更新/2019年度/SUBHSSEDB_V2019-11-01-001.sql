--HSE��־
CREATE TABLE [dbo].[Project_HSEDiary](
[HSEDiaryId] [nvarchar](50) NOT NULL,
[ProjectId] [nvarchar](50) NULL,
[DiaryDate] [datetime] NULL,
[UserId] [nvarchar](50) NULL,
[DailySummary] [nvarchar](500) NULL,
[TomorrowPlan] [nvarchar](500) NULL,
CONSTRAINT [PK_Project_HSEDiary] PRIMARY KEY CLUSTERED 
(
[HSEDiaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Project_HSEDiary]  WITH CHECK ADD  CONSTRAINT [FK_Project_HSEDiary_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Project_HSEDiary] CHECK CONSTRAINT [FK_Project_HSEDiary_Base_Project]
GO

ALTER TABLE [dbo].[Project_HSEDiary]  WITH CHECK ADD  CONSTRAINT [FK_Project_HSEDiary_Sys_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Project_HSEDiary] CHECK CONSTRAINT [FK_Project_HSEDiary_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_HSEDiary', @level2type=N'COLUMN',@level2name=N'HSEDiaryId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_HSEDiary', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_HSEDiary', @level2type=N'COLUMN',@level2name=N'DiaryDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�û�ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_HSEDiary', @level2type=N'COLUMN',@level2name=N'UserId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����С��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_HSEDiary', @level2type=N'COLUMN',@level2name=N'DailySummary'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ռƻ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_HSEDiary', @level2type=N'COLUMN',@level2name=N'TomorrowPlan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE��־��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Project_HSEDiary'
GO

DELETE FROM Sys_ButtonToMenu WHERE MenuId='4B932BFC-8B17-4474-8CBE-5FCA25CD6D15'
GO
DELETE FROM Sys_MenuProjectA WHERE MenuId='4B932BFC-8B17-4474-8CBE-5FCA25CD6D15'
GO
DELETE FROM Sys_MenuProjectB WHERE MenuId='4B932BFC-8B17-4474-8CBE-5FCA25CD6D15'
GO

DELETE FROM Sys_ButtonToMenu WHERE MenuId='A3507DF7-F972-44F9-91BF-02E378F64653'
GO
DELETE FROM Sys_MenuProjectA WHERE MenuId='A3507DF7-F972-44F9-91BF-02E378F64653'
GO
DELETE FROM Sys_MenuProjectB WHERE MenuId='A3507DF7-F972-44F9-91BF-02E378F64653'
GO

DELETE FROM Sys_ButtonToMenu WHERE MenuId='8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72'
GO
DELETE FROM Sys_MenuProjectA WHERE MenuId='8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72'
GO
DELETE FROM Sys_MenuProjectB WHERE MenuId='8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72'
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72','����ʦHSE��־','Manager/HSEDiary.aspx','PageHeaderFooter',160,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO
--����ʦHSE��־
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('5E9CE851-9CCE-4B7E-9DFA-9575B2D22413','8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('52E28127-F078-424F-917E-A7C41D8A1C72','8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4A662B9D-8564-423D-8312-9B697A0A79FA','8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4FA1A85E-CA18-41A4-8B5C-FC2C494647C1','8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72','����',4) 
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('C2BF5762-6E52-4E36-BA72-7BE5C7C88C18','8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72','�ύ',5)  
GO
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72','����ʦHSE��־','Manager/HSEDiary.aspx','PageHeaderFooter',160,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO

ALTER TABLE License_FlowOperate ADD ProjectId NVARCHAR(50) NULL
GO