INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('D24ACD3C-086C-4AC8-9AFA-16D48893215E','项目状态及软件关闭','ProjectData/ProjectShutdown.aspx','PageHeaderFooter',15,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('0E77225D-70A1-4463-9062-2F901A670B59','D24ACD3C-086C-4AC8-9AFA-16D48893215E','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('CC3D7F7E-326E-42E1-AC8A-B2E646172683','D24ACD3C-086C-4AC8-9AFA-16D48893215E','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('F5EA25D1-F61B-4C36-BBF4-C50D3DE553C1','D24ACD3C-086C-4AC8-9AFA-16D48893215E','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B0D84243-E170-4D2E-952E-7C3FEB70C73B','D24ACD3C-086C-4AC8-9AFA-16D48893215E','保存',4)  
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('76FEA4F3-FD2A-4A89-A36A-75FCF114C7A5','D24ACD3C-086C-4AC8-9AFA-16D48893215E','提交',5)  
GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('D24ACD3C-086C-4AC8-9AFA-16D48893215E','项目状态及软件关闭','ProjectData/ProjectShutdown.aspx','PageHeaderFooter',15,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
GO

UPDATE Sys_MenuProjectA SET MenuName='事故报告登记' WHERE MenuId='27C681E5-135A-414F-9FC2-D86D27805E6A'
GO
UPDATE Sys_MenuProjectB SET MenuName='事故报告登记' WHERE MenuId='27C681E5-135A-414F-9FC2-D86D27805E6A'
GO
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('B0A341A2-954A-4E24-BFC3-53D7F50628EE','事故调查处理报告','Accident/AccidentReportOther.aspx','PageHeaderFooter',40,'0ED3E0CC-75E0-4FF3-8832-067217A6CD4D','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('60305549-BDF5-4B5B-BB96-7E1BC763DEBC','B0A341A2-954A-4E24-BFC3-53D7F50628EE','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('FBBF7D77-3A8C-4889-A7AB-22C2B5877145','B0A341A2-954A-4E24-BFC3-53D7F50628EE','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('C733D043-BD3E-470B-9E6B-A4C5CB77FC43','B0A341A2-954A-4E24-BFC3-53D7F50628EE','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('5B72AE42-35B6-4660-B1A0-E1A158B96A62','B0A341A2-954A-4E24-BFC3-53D7F50628EE','保存',4)  
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('87266AFC-C72D-475F-A711-5CDE37A905C7','B0A341A2-954A-4E24-BFC3-53D7F50628EE','提交',5)  
GO
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('B0A341A2-954A-4E24-BFC3-53D7F50628EE','事故调查处理报告','Accident/AccidentReportOther.aspx','PageHeaderFooter',40,'0ED3E0CC-75E0-4FF3-8832-067217A6CD4D','Menu_Project',1,0)
GO  


UPDATE Sys_MenuProjectA SET MenuName='安全费用计划' WHERE MenuId='EEE7CBBE-2EFB-4D64-96A6-A932E20FF9DB'
GO
UPDATE Sys_MenuProjectB SET MenuName='安全费用计划' WHERE MenuId='EEE7CBBE-2EFB-4D64-96A6-A932E20FF9DB'
GO

UPDATE Sys_MenuProjectA SET MenuName='安全费用支出' WHERE MenuId='0C311396-C859-40B0-9D72-6A8B20733002'
GO
UPDATE Sys_MenuProjectB SET MenuName='安全费用支出' WHERE MenuId='0C311396-C859-40B0-9D72-6A8B20733002'
GO
ALTER TABLE Base_Project ADD ProjectState CHAR(1) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目状态(1-施工中；2-暂停中；3-已完工)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Project', @level2type=N'COLUMN',@level2name=N'ProjectState'
GO

ALTER TABLE Base_Project DROP COLUMN IsEnd
GO
ALTER TABLE Base_Project DROP COLUMN IsBuild
GO
ALTER TABLE Base_Project DROP COLUMN UpState
GO

--ALTER TABLE [dbo].[Project_ProjectUser]  WITH CHECK ADD  CONSTRAINT [FK_Project_ProjectUser_Sys_Role] FOREIGN KEY([RoleId])
--REFERENCES [dbo].[Sys_Role] ([RoleId])
--GO

--ALTER TABLE [dbo].[Project_ProjectUser] CHECK CONSTRAINT [FK_Project_ProjectUser_Sys_Role]
--GO

