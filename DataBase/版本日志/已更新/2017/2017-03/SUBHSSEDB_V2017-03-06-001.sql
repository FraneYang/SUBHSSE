DELETE FROM Sys_MenuCommon WHERE MenuId = '363EB208-7BB1-4A55-85F3-2501B2F10B45'
GO
DELETE FROM Sys_MenuProjectB WHERE MenuId = '363EB208-7BB1-4A55-85F3-2501B2F10B45'
GO
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('363EB208-7BB1-4A55-85F3-2501B2F10B45','管理月报B','Manager/ManagerMonthB.aspx','PageHeaderFooter',25,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO

UPDATE Sys_MenuProjectA SET MenuName='文件柜A(检查类)' WHERE MenuId='C69B7409-BE1E-4754-AC90-57B56EEE198B'
GO
UPDATE Sys_MenuProjectB SET MenuName='文件柜A(检查类)' WHERE MenuId='C69B7409-BE1E-4754-AC90-57B56EEE198B'
GO
UPDATE Sys_MenuCommon SET MenuName='文件柜A(检查类)' WHERE MenuId='6621CF4A-EAD4-40AF-9FFE-51DA4348C10C'
GO

UPDATE Sys_MenuProjectA SET MenuName='安全实施计划' WHERE MenuId='E38EE43D-C526-493F-A177-712BA9B22291'
GO
UPDATE Sys_MenuProjectB SET MenuName='安全实施计划' WHERE MenuId='E38EE43D-C526-493F-A177-712BA9B22291'
GO

--/管理规定
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('7944B1C6-636B-4AD8-980C-A2F6D44883D3','安全管理规定','','TableColumn',35,'0','Menu_Project',0,0)
GO
UPDATE Sys_MenuProjectA SET SuperMenu='7944B1C6-636B-4AD8-980C-A2F6D44883D3' WHERE MenuId IN ('775EFCF4-DE5C-46E9-8EA3-B16270E2F6A6','703D90A7-C40B-4753-943B-8A59AABDC043')
GO

--/管理规定
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('7944B1C6-636B-4AD8-980C-A2F6D44883D3','安全管理规定','','TableColumn',45,'28D9F51A-BA52-47B6-87A0-D063FC075C7B','Menu_Project',0,0)
GO
UPDATE Sys_MenuProjectB SET SuperMenu='7944B1C6-636B-4AD8-980C-A2F6D44883D3' WHERE MenuId IN ('775EFCF4-DE5C-46E9-8EA3-B16270E2F6A6','703D90A7-C40B-4753-943B-8A59AABDC043')
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('846565DD-89FC-4191-A71B-5CBEA2BE00E0','人员变化','SitePerson/PersonChange.aspx','PageHeaderFooter',70,'EE260447-028F-46AF-8864-9A5DC9DAA5BD','Menu_Project',1,0)
GO
--人员变化按钮
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('5F67C054-10CD-4EB2-AD75-C16D53AE8F8F','846565DD-89FC-4191-A71B-5CBEA2BE00E0','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('0E7EA6DF-E1F1-4CF0-B46E-DAD338DB0155','846565DD-89FC-4191-A71B-5CBEA2BE00E0','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('1B416BD6-18C6-4654-A7A4-F44BF5704171','846565DD-89FC-4191-A71B-5CBEA2BE00E0','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4612E4A3-CF56-449E-9A40-F22FADD431C0','846565DD-89FC-4191-A71B-5CBEA2BE00E0','保存',4)  
GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('846565DD-89FC-4191-A71B-5CBEA2BE00E0','人员变化','SitePerson/PersonChange.aspx','PageHeaderFooter',150,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
GO

UPDATE Sys_MenuProjectA SET MenuName='施工分包资质' WHERE MenuId='DFDFEDA3-FECB-40DA-9216-C67B48002A8A'
GO
UPDATE Sys_MenuProjectB SET MenuName='施工分包资质' WHERE MenuId='DFDFEDA3-FECB-40DA-9216-C67B48002A8A'
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('F910062E-98B0-486F-A8BD-D5B0035F808F','监理整改通知单','Check/SupervisionNotice.aspx','PageHeaderFooter',90,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
GO
--隐患整改单按钮
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('8B326057-8965-456B-93BB-D1F678470B99','F910062E-98B0-486F-A8BD-D5B0035F808F','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('1CCFBDF6-F526-42F5-A7DA-FDF265967D6A','F910062E-98B0-486F-A8BD-D5B0035F808F','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('3A8258DD-A696-4577-A5C9-BCA128547474','F910062E-98B0-486F-A8BD-D5B0035F808F','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('88DA8F60-09ED-44AD-9B9E-84C1A201B364','F910062E-98B0-486F-A8BD-D5B0035F808F','保存',4)	
GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('F910062E-98B0-486F-A8BD-D5B0035F808F','监理整改通知单','Check/SupervisionNotice.aspx','PageHeaderFooter',140,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('F057C207-4549-48AE-B838-A1920E5709D8','联系单','Check/ContactList.aspx','PageHeaderFooter',100,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
GO
--联系单按钮
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('53625131-584E-4C39-86EC-712E79D5BDAB','F057C207-4549-48AE-B838-A1920E5709D8','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('DEB142FE-24B8-4103-8535-42083D306BD5','F057C207-4549-48AE-B838-A1920E5709D8','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('EC47C47C-98D4-4DCB-BD26-88338238884E','F057C207-4549-48AE-B838-A1920E5709D8','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('90B3F11B-D205-4491-BCB8-069E02500AE6','F057C207-4549-48AE-B838-A1920E5709D8','保存',4)	
GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('F057C207-4549-48AE-B838-A1920E5709D8','联系单','Check/ContactList.aspx','PageHeaderFooter',150,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('CCD0E55B-300A-454B-8559-155ADAD386AE','处罚统计','Check/PunishNoticeStatistics.aspx','PageHeaderFooter',25,'012DF857-AD6B-49AA-87A8-030CD5F66D4C','Menu_Project',1,0)
GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('CCD0E55B-300A-454B-8559-155ADAD386AE','处罚统计','Check/PunishNoticeStatistics.aspx','PageHeaderFooter',115,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
GO


UPDATE Sys_MenuProjectA SET MenuName='安全投入费用' WHERE MenuId='20ECB69E-28C4-4FAC-941A-15F446AEB634'
GO
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('E0B25140-82DF-43EB-9A76-6D56C128E41D','安全物资管理','','TableMultiple',155,'0','Menu_Project',0,0)
GO
UPDATE Sys_MenuProjectA SET SuperMenu='E0B25140-82DF-43EB-9A76-6D56C128E41D' 
WHERE MenuId IN ('3DC61C8A-7C54-49E0-96C4-DED9CC6BFD0B','FDA02FCA-4E23-469E-AB26-2D625D0E579A','881D6FE5-C281-4DA8-80CD-D7C6624796FC','B97B1C46-25B0-477B-9925-B6AB1D45204E')
GO

UPDATE Sys_MenuProjectB SET MenuName='安全投入费用' WHERE MenuId='20ECB69E-28C4-4FAC-941A-15F446AEB634'
GO
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('E0B25140-82DF-43EB-9A76-6D56C128E41D','安全物资管理','','TableMultiple',155,'0','Menu_Project',0,0)
GO
UPDATE Sys_MenuProjectB SET SuperMenu='E0B25140-82DF-43EB-9A76-6D56C128E41D' 
WHERE MenuId IN ('3DC61C8A-7C54-49E0-96C4-DED9CC6BFD0B','FDA02FCA-4E23-469E-AB26-2D625D0E579A','881D6FE5-C281-4DA8-80CD-D7C6624796FC','B97B1C46-25B0-477B-9925-B6AB1D45204E')
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('9BEB66C0-E6DE-44DD-94F6-5C7433E6DE62','实施计划总结','ActionPlan/ActionPlanSummary.aspx','PageHeaderFooter',20,'E38EE43D-C526-493F-A177-712BA9B22291','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4246D63F-C784-415F-87F5-5E0DB2409BC9','9BEB66C0-E6DE-44DD-94F6-5C7433E6DE62','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('90EC603D-E75E-4D13-9217-E4455B5396F7','9BEB66C0-E6DE-44DD-94F6-5C7433E6DE62','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('3AB6A513-5F90-43DF-9418-E188624D6AC7','9BEB66C0-E6DE-44DD-94F6-5C7433E6DE62','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('64689667-A110-4031-ADC2-1DC513F0C93C','9BEB66C0-E6DE-44DD-94F6-5C7433E6DE62','保存',4)
GO

INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('9BEB66C0-E6DE-44DD-94F6-5C7433E6DE62','实施计划总结','ActionPlan/ActionPlanSummary.aspx','PageHeaderFooter',20,'E38EE43D-C526-493F-A177-712BA9B22291','Menu_Project',1,0)
GO

--安全活动
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('4C98FD93-2650-4388-83DF-A16AC8A05C94','安全活动','','FlagYellow',135,'0','Menu_Project',0,0)
GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('96CC0F1F-405B-4EE7-87CF-4CAE1FCC9435','主题安全活动','SafetyActivities/ThemeActivities.aspx','PageHeaderFooter',10,'4C98FD93-2650-4388-83DF-A16AC8A05C94','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A42230A4-A957-4402-93E2-9B7E5E7976F8','96CC0F1F-405B-4EE7-87CF-4CAE1FCC9435','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E5F07E26-F91F-45C5-8779-AADECC22D4DA','96CC0F1F-405B-4EE7-87CF-4CAE1FCC9435','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D0FD6FDF-70FB-4659-B47D-73F7FB7EEA99','96CC0F1F-405B-4EE7-87CF-4CAE1FCC9435','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('36E202C8-0C10-4D00-B400-7FE5D3C01A6F','96CC0F1F-405B-4EE7-87CF-4CAE1FCC9435','保存',4)  
	GO	

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('293FD782-7B39-4F0F-A826-CA790A70CCC7','月度安全评比','SafetyActivities/MonthlyRating.aspx','PageHeaderFooter',20,'4C98FD93-2650-4388-83DF-A16AC8A05C94','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4764CAA8-1CAC-4204-9E84-93A5F35D53CF','293FD782-7B39-4F0F-A826-CA790A70CCC7','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D5609082-AFBB-474D-9549-F728C9E859A6','293FD782-7B39-4F0F-A826-CA790A70CCC7','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('5B66F963-B2D5-4F64-846F-5561904A69D2','293FD782-7B39-4F0F-A826-CA790A70CCC7','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('0F976C37-E1F8-4D8A-8DC0-08BE4C858FD3','293FD782-7B39-4F0F-A826-CA790A70CCC7','保存',4)  
	GO	

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('71DA0222-1509-4154-AB39-8E88769C043C','全国安全月','SafetyActivities/SafetyMonth.aspx','PageHeaderFooter',30,'4C98FD93-2650-4388-83DF-A16AC8A05C94','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('BFD212E0-D4C5-4BA0-BC5C-1D897E84515E','71DA0222-1509-4154-AB39-8E88769C043C','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3A016501-9E6D-423D-AA70-59FE66864E28','71DA0222-1509-4154-AB39-8E88769C043C','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E6D88B11-B440-41CB-9DD4-326FD75AEA89','71DA0222-1509-4154-AB39-8E88769C043C','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7A0EB376-FD1F-48EB-9FBD-0ADD17641E77','71DA0222-1509-4154-AB39-8E88769C043C','保存',4)  
	GO	

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('58F5A99C-8104-459F-8934-54C30EE972AA','119消防','SafetyActivities/FireActivities.aspx','PageHeaderFooter',40,'4C98FD93-2650-4388-83DF-A16AC8A05C94','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)	
	VALUES('DE6AE5E2-6F92-46B0-BC8C-44848F4067E9','58F5A99C-8104-459F-8934-54C30EE972AA','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6D0D28BC-2DF1-4DA9-B0B4-094E645D9C2A','58F5A99C-8104-459F-8934-54C30EE972AA','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('0E510B4B-11B3-4167-B719-A841CF0C86B2','58F5A99C-8104-459F-8934-54C30EE972AA','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('EEA08C00-DE72-4298-AFB0-B94166A1A6CA','58F5A99C-8104-459F-8934-54C30EE972AA','保存',4)  
	GO	

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('446D702B-F0C1-4D12-A862-0B8317D95928','其他','SafetyActivities/OtherActivities.aspx','PageHeaderFooter',50,'4C98FD93-2650-4388-83DF-A16AC8A05C94','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)	
	VALUES('9D357CF2-7886-4532-AE0D-374FF8BD84A0','446D702B-F0C1-4D12-A862-0B8317D95928','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7BFE489D-71F0-43BC-A953-8F5BAB4C7572','446D702B-F0C1-4D12-A862-0B8317D95928','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('DBF3B571-115F-4975-B302-640C8228F59F','446D702B-F0C1-4D12-A862-0B8317D95928','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('069C62D4-E1D7-4265-B43D-ACB9D8CD0999','446D702B-F0C1-4D12-A862-0B8317D95928','保存',4)  
	GO	


--安全活动
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('4C98FD93-2650-4388-83DF-A16AC8A05C94','安全活动','','FlagYellow',35,'2A9D8CBC-137F-4199-A426-728F5D63FF2F','Menu_Project',0,0)
GO
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('96CC0F1F-405B-4EE7-87CF-4CAE1FCC9435','主题安全活动','SafetyActivities/ThemeActivities.aspx','PageHeaderFooter',10,'4C98FD93-2650-4388-83DF-A16AC8A05C94','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('293FD782-7B39-4F0F-A826-CA790A70CCC7','月度安全评比','SafetyActivities/MonthlyRating.aspx','PageHeaderFooter',20,'4C98FD93-2650-4388-83DF-A16AC8A05C94','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('71DA0222-1509-4154-AB39-8E88769C043C','全国安全月','SafetyActivities/SafetyMonth.aspx','PageHeaderFooter',30,'4C98FD93-2650-4388-83DF-A16AC8A05C94','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('58F5A99C-8104-459F-8934-54C30EE972AA','119消防','SafetyActivities/FireActivities.aspx','PageHeaderFooter',40,'4C98FD93-2650-4388-83DF-A16AC8A05C94','Menu_Project',1,0)
	GO	
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('446D702B-F0C1-4D12-A862-0B8317D95928','其他','SafetyActivities/OtherActivities.aspx','PageHeaderFooter',50,'4C98FD93-2650-4388-83DF-A16AC8A05C94','Menu_Project',1,0)
	GO


--项目设置
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('7CCA86F7-E43F-438F-AAB6-CA2661FBB362','安全体系','','LayoutContent',15,'0','Menu_Project',0,0)
GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('1EDD072E-473A-4CDB-A2D3-E401C146B2B2','安全组织机构','SecuritySystem/SafetyOrganization.aspx','PageHeaderFooter',10,'7CCA86F7-E43F-438F-AAB6-CA2661FBB362','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('719E1BAE-3782-427F-8403-0E29BE61D7ED','1EDD072E-473A-4CDB-A2D3-E401C146B2B2','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6733849B-7EFB-496C-ACF5-030D899885D7','1EDD072E-473A-4CDB-A2D3-E401C146B2B2','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3D3AA9C2-C9B8-4154-B2EB-58A2396BF5FF','1EDD072E-473A-4CDB-A2D3-E401C146B2B2','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E6942E36-2AF6-4A85-AA7B-216CE31F9461','1EDD072E-473A-4CDB-A2D3-E401C146B2B2','保存',4)  
	GO	

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('21C779D6-269B-4CB7-AFFB-F59958AC0EF0','安全体系','SecuritySystem/SafetySystem.aspx','PageHeaderFooter',20,'7CCA86F7-E43F-438F-AAB6-CA2661FBB362','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('83F5CFA0-8488-4C63-96DB-C7A01D3145EC','21C779D6-269B-4CB7-AFFB-F59958AC0EF0','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('5C60228E-817A-4B0A-AC91-18B86A4A50E9','21C779D6-269B-4CB7-AFFB-F59958AC0EF0','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('9C7C12BD-9403-489C-B8B8-0E56BCF269D3','21C779D6-269B-4CB7-AFFB-F59958AC0EF0','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('FCB26516-9BDB-4E9D-8197-E5124C5D5A7C','21C779D6-269B-4CB7-AFFB-F59958AC0EF0','保存',4)  
	GO	

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('9D04CD8B-575C-4854-B8B0-F90CEEB75815','安全制度','SecuritySystem/SafetyInstitution.aspx','PageHeaderFooter',30,'7CCA86F7-E43F-438F-AAB6-CA2661FBB362','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('12BC8B40-FD7B-410B-B658-4E54DD7BA5A4','9D04CD8B-575C-4854-B8B0-F90CEEB75815','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('1A1D3AF9-28C5-4E82-926B-30643D4146F0','9D04CD8B-575C-4854-B8B0-F90CEEB75815','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3C5C606C-41B8-4915-A0EE-DE98C00D3E19','9D04CD8B-575C-4854-B8B0-F90CEEB75815','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('83E968F1-F8B2-455D-8438-023EF8A9D848','9D04CD8B-575C-4854-B8B0-F90CEEB75815','保存',4)  
	GO	

--安全体系
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('7CCA86F7-E43F-438F-AAB6-CA2661FBB362','安全体系','','LayoutContent',15,'28D9F51A-BA52-47B6-87A0-D063FC075C7B','Menu_Project',0,0)
GO
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('1EDD072E-473A-4CDB-A2D3-E401C146B2B2','安全组织机构','SecuritySystem/SafetyOrganization.aspx','PageHeaderFooter',10,'7CCA86F7-E43F-438F-AAB6-CA2661FBB362','Menu_Project',1,0)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('21C779D6-269B-4CB7-AFFB-F59958AC0EF0','安全体系','SecuritySystem/SafetySystem.aspx','PageHeaderFooter',20,'7CCA86F7-E43F-438F-AAB6-CA2661FBB362','Menu_Project',1,0)
	GO	

	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('9D04CD8B-575C-4854-B8B0-F90CEEB75815','安全制度','SecuritySystem/SafetyInstitution.aspx','PageHeaderFooter',30,'7CCA86F7-E43F-438F-AAB6-CA2661FBB362','Menu_Project',1,0)
	GO

--现场施工动态管理
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('2A00CDCC-129C-4875-9663-2A2718394D88','现场施工动态管理','','Overlays',38,'0','Menu_Project',0,0)
GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('5B22A9E3-4701-4F49-9405-846B3E63F43B','现场施工动态','SiteConstruction/ConstructionDynamic.aspx','PageHeaderFooter',10,'2A00CDCC-129C-4875-9663-2A2718394D88','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3F1B6943-33DF-40F7-AAE8-42C67A60C67B','5B22A9E3-4701-4F49-9405-846B3E63F43B','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E6BDD1E7-7DB5-44E0-A4DD-F82C279787E2','5B22A9E3-4701-4F49-9405-846B3E63F43B','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('DA7C45A8-51D3-422D-8C4E-E5A90BA8ABC6','5B22A9E3-4701-4F49-9405-846B3E63F43B','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('952D411C-02BA-4147-8470-3F09FA7D3344','5B22A9E3-4701-4F49-9405-846B3E63F43B','保存',4)  
	GO

--现场施工动态管理
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('2A00CDCC-129C-4875-9663-2A2718394D88','现场施工动态管理','','Overlays',5,'2A9D8CBC-137F-4199-A426-728F5D63FF2F','Menu_Project',0,0)
GO
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('5B22A9E3-4701-4F49-9405-846B3E63F43B','现场施工动态','SiteConstruction/ConstructionDynamic.aspx','PageHeaderFooter',10,'2A00CDCC-129C-4875-9663-2A2718394D88','Menu_Project',1,0)
	GO

update Sys_MenuProjectA set MenuName='应急演练开展情况' where menuid='CF5516F7-0735-44EF-9A6D-46FABF8EBC6E'
go
update Sys_MenuProjectB set MenuName='应急演练开展情况' where menuid='CF5516F7-0735-44EF-9A6D-46FABF8EBC6E'
GO

CREATE TABLE [dbo].[SecuritySystem_SafetySystem](
	[SafetySystemId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Remark] [nvarchar](1000) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
	[SeeFile] [nvarchar](max) NULL,
 CONSTRAINT [PK_SecuritySystem_SafetySystem] PRIMARY KEY CLUSTERED 
(
	[SafetySystemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[SecuritySystem_SafetySystem]  WITH CHECK ADD  CONSTRAINT [FK_SecuritySystem_SafetySystem_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SecuritySystem_SafetySystem] CHECK CONSTRAINT [FK_SecuritySystem_SafetySystem_Base_Project]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetySystem', @level2type=N'COLUMN',@level2name=N'SafetySystemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetySystem', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetySystem', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetySystem', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件查看' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetySystem', @level2type=N'COLUMN',@level2name=N'SeeFile'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全组织体系表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetySystem'
GO

CREATE TABLE [dbo].[SecuritySystem_SafetyOrganization](
	[SafetyOrganizationId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[Post] [nvarchar](50) NULL,
	[Names] [nvarchar](10) NULL,
	[Telephone] [nvarchar](20) NULL,
	[MobilePhone] [nvarchar](20) NULL,
	[EMail] [nvarchar](50) NULL,
	[Duty] [nvarchar](50) NULL,
	[SortIndex] [nvarchar](50) NULL,
 CONSTRAINT [PK_SecuritySystem_SafetyOrganization] PRIMARY KEY CLUSTERED 
(
	[SafetyOrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[SecuritySystem_SafetyOrganization]  WITH CHECK ADD  CONSTRAINT [FK_SecuritySystem_SafetyOrganization_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SecuritySystem_SafetyOrganization] CHECK CONSTRAINT [FK_SecuritySystem_SafetyOrganization_Base_Project]
GO

ALTER TABLE [dbo].[SecuritySystem_SafetyOrganization]  WITH CHECK ADD  CONSTRAINT [FK_SecuritySystem_SafetyOrganization_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[SecuritySystem_SafetyOrganization] CHECK CONSTRAINT [FK_SecuritySystem_SafetyOrganization_Base_Unit]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyOrganization', @level2type=N'COLUMN',@level2name=N'SafetyOrganizationId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyOrganization', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyOrganization', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyOrganization', @level2type=N'COLUMN',@level2name=N'Post'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyOrganization', @level2type=N'COLUMN',@level2name=N'Telephone'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyOrganization', @level2type=N'COLUMN',@level2name=N'MobilePhone'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyOrganization', @level2type=N'COLUMN',@level2name=N'EMail'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职责' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyOrganization', @level2type=N'COLUMN',@level2name=N'Duty'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyOrganization', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全管理机构表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyOrganization'
GO

CREATE TABLE [dbo].[SecuritySystem_SafetyInstitution](
	[SafetyInstitutionId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Title] [nvarchar](500) NULL,
	[EffectiveDate] [datetime] NULL,
	[Scope] [nvarchar](500) NULL,
	[Remark] [nvarchar](1000) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
	[SeeFile] [nvarchar](max) NULL,
 CONSTRAINT [PK_SecuritySystem_SafetyInstitution] PRIMARY KEY CLUSTERED 
(
	[SafetyInstitutionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[SecuritySystem_SafetyInstitution]  WITH CHECK ADD  CONSTRAINT [FK_SecuritySystem_SafetyInstitution_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SecuritySystem_SafetyInstitution] CHECK CONSTRAINT [FK_SecuritySystem_SafetyInstitution_Base_Project]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyInstitution', @level2type=N'COLUMN',@level2name=N'SafetyInstitutionId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyInstitution', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyInstitution', @level2type=N'COLUMN',@level2name=N'Title'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'适用范围' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyInstitution', @level2type=N'COLUMN',@level2name=N'Scope'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyInstitution', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyInstitution', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件查看' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyInstitution', @level2type=N'COLUMN',@level2name=N'SeeFile'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全制度表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SecuritySystem_SafetyInstitution'
GO


ALTER TABLE Base_Unit ADD IsHide BIT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否隐藏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Unit', @level2type=N'COLUMN',@level2name=N'IsHide'
GO

--培训视图
ALTER VIEW [dbo].[View_EduTrain_TrainFind]
AS
SELECT person.CardNo,person.PersonName,train.ProjectId, unit.UnitId, unit.UnitName, post.WorkPostName, train.TrainTitle, 
       train.TrainStartDate,train.TrainEndDate, train.TrainTypeId,train.TeachHour,tt.TrainTypeName, trainDetail.CheckScore, trainDetail.CheckResult,train.TeachMan, 
       pu.UnitType
from  dbo.EduTrain_TrainRecordDetail trainDetail left join
      dbo.EduTrain_TrainRecord train ON train.TrainingId = trainDetail.TrainingId left join
      dbo.SitePerson_Person person ON person.PersonId = trainDetail.PersonId left join
      dbo.Base_WorkPost post ON post.WorkPostId = Person.WorkPostId left join
      dbo.Base_Unit unit ON unit.UnitId = person.UnitId left join
	  dbo.Project_ProjectUnit pu ON pu.UnitId = unit.UnitId and pu.ProjectId=train.ProjectId left join
	  dbo.Base_TrainType tt ON tt.TrainTypeId=train.TrainTypeId
	  


GO

