-- 月报（赛鼎月报）
	INSERT INTO Sys_MenuProjectA (MenuId,MenuName,Url,Icon,SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)  
	VALUES('D0EC3002-E1FA-457D-AC3B-4C7B2D71DD82','月报(赛鼎)','Manager/ManagerMonth_SeDin.aspx','PageHeaderFooter',28,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	--月报(赛鼎)按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('59C189FA-E27D-460D-88DA-AC61F6BA6062','D0EC3002-E1FA-457D-AC3B-4C7B2D71DD82','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E84228D9-7327-4586-B5A8-267620B3EA25','D0EC3002-E1FA-457D-AC3B-4C7B2D71DD82','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4033C100-21CB-446F-BDE0-41332908B06E','D0EC3002-E1FA-457D-AC3B-4C7B2D71DD82','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('09F07B51-BBE0-4A85-903D-4F9C47BC280C','D0EC3002-E1FA-457D-AC3B-4C7B2D71DD82','保存',4)  
	GO

	INSERT INTO Sys_MenuProjectB(MenuId,MenuName,Url,Icon,SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)  
	VALUES('D0EC3002-E1FA-457D-AC3B-4C7B2D71DD82','月报(赛鼎)','Manager/ManagerMonth_SeDin.aspx','PageHeaderFooter',28,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
ALTER TABLE Meeting_ClassMeeting ADD AttentPersonNum INT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参会人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_ClassMeeting', @level2type=N'COLUMN',@level2name=N'AttentPersonNum'
GO
--update SitePerson_Person set WorkPostId='4a72bd32-46ed-4aa1-b8a0-4f51444a3a91' 
--where WorkPostId='2AE2A7BF-B991-4AE5-A09F-8C1F88154764'
--go
--update SitePerson_DayReportUnitDetail set PostId='4a72bd32-46ed-4aa1-b8a0-4f51444a3a91' 
--where PostId='2AE2A7BF-B991-4AE5-A09F-8C1F88154764'
--go
--update SitePerson_MonthReportUnitDetail set PostId='4a72bd32-46ed-4aa1-b8a0-4f51444a3a91' 
--where PostId='2AE2A7BF-B991-4AE5-A09F-8C1F88154764'
--go
----delete from Base_WorkPost where  WorkPostId='2AE2A7BF-B991-4AE5-A09F-8C1F88154764'
----go
