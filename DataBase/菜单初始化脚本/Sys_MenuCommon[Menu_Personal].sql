--个人设置菜单 MenuType=Menu_Personal
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('42368A1C-EE84-423D-9003-B0CAD0FF169D','个人信息','Personal/PersonalInfo.aspx','UserHome',10,'0','Menu_Personal',1,0)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('D363BD9D-4DEC-45D8-89C8-B0E49DEF61B4','操作日志','Personal/RunLog.aspx','DateEdit',20,'0','Menu_Personal',1,0)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('A6994B53-6237-4C2B-BDC5-E7E79A1E7F88','个人文件夹','Personal/PersonalFolder.aspx','FolderPageWhite',30,'0','Menu_Personal',1,0)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('3ACE1F4B-9D7F-4923-8668-9B6AA3CA17CA','数据检索','Personal/FileSearch.aspx','FolderFind',40,'0','Menu_Personal',1,0)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('DB4F6793-24F8-4C3F-B6CD-4ACBA38CCB25','手机APP上传内容','Personal/APPFile.aspx','SmartphoneDisk',50,'0','Menu_Personal',1,0)
GO