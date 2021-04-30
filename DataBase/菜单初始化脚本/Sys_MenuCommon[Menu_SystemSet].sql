--系统设置菜单 MenuType=Menu_SystemSet
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('8IDKGJE2-09B1-4607-BC6D-865CE48F0002','单位设置','SysManage/Unit.aspx','Layers',10,'0','Menu_SystemSet',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('31451999-CA49-469D-8E92-508FA7BC2A7E','8IDKGJE2-09B1-4607-BC6D-865CE48F0002','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('854573A7-18BE-41CB-BFBD-16952826EF14','8IDKGJE2-09B1-4607-BC6D-865CE48F0002','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('039D73FD-9BFD-49E3-AB36-1D635FD70AFD','8IDKGJE2-09B1-4607-BC6D-865CE48F0002','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('E940FAB0-FA0C-447A-9C83-9F6082074274','8IDKGJE2-09B1-4607-BC6D-865CE48F0002','保存',4)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('EBAD373C-8EB4-49A1-91F6-6794FFCAF9B6','角色管理','SysManage/RoleList.aspx','GroupGear',20,'0','Menu_SystemSet',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('70F31237-279D-4C39-A448-285F0B0E0C1C','EBAD373C-8EB4-49A1-91F6-6794FFCAF9B6','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('32D49C37-5A14-4B4B-8F3F-BF7CBE0122D5','EBAD373C-8EB4-49A1-91F6-6794FFCAF9B6','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('9D9B3B9A-4CE4-44B6-92F1-AFBD777B642D','EBAD373C-8EB4-49A1-91F6-6794FFCAF9B6','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('ED564170-0875-4F2E-B23D-7B04B2C3A3C4','EBAD373C-8EB4-49A1-91F6-6794FFCAF9B6','保存',4)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('E6F0167E-B0FD-4A32-9C47-25FB9E0FDC4E','用户信息','SysManage/UserList.aspx','User',30,'0','Menu_SystemSet',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('8E95FDBC-1936-4BD6-B442-AADE27F6C1DE','E6F0167E-B0FD-4A32-9C47-25FB9E0FDC4E','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('DB2139E6-7D81-467F-A3E8-A461A4F6F674','E6F0167E-B0FD-4A32-9C47-25FB9E0FDC4E','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('79702203-7596-4AB8-BD76-5964393813AB','E6F0167E-B0FD-4A32-9C47-25FB9E0FDC4E','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('C744FB32-3437-4C53-90E0-F0AFA20542B0','E6F0167E-B0FD-4A32-9C47-25FB9E0FDC4E','保存',4)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('BAB254FA-C879-4463-B9DE-387C241A8623','修改密码','SysManage/UpdatePassword.aspx','PageKey',40,'0','Menu_SystemSet',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('00BCD912-6275-40A2-8CB1-591389118DA9','BAB254FA-C879-4463-B9DE-387C241A8623','编辑',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('1F9897F0-0D3A-441A-B62B-7CC4852807C1','BAB254FA-C879-4463-B9DE-387C241A8623','重置',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('5554D845-879C-47B7-AD8D-DF0B23D749CC','BAB254FA-C879-4463-B9DE-387C241A8623','保存',3)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('2231022B-3519-42FC-A2E6-1DB9A98039DD','角色授权','SysManage/RolePower.aspx','UserKey',50,'0','Menu_SystemSet',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('2F8858BE-1EA0-40AC-ACE1-739D1872FC89','2231022B-3519-42FC-A2E6-1DB9A98039DD','保存',1)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('0C67F4A8-1BE7-40BE-9621-B02A28FD13ED','报表设计','ReportPrint/PrintDesigner.aspx','PageWhiteExcel',60,'0','Menu_SystemSet',1,0)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('E4BFDCFD-2B1F-49C5-B02B-1C91BFFAAC6E','环境设置','SysManage/SysConstSet.aspx','Cog',70,'0','Menu_SystemSet',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('E2D59A77-5E9A-4340-8B94-86D04738F907','E4BFDCFD-2B1F-49C5-B02B-1C91BFFAAC6E','保存',1)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('6EDFBE24-9419-4E73-AC2E-CAD30A754A73','数据同步','SysManage/Synchronization.aspx','DatabaseRefresh',80,'0','Menu_SystemSet',1,0)
GO