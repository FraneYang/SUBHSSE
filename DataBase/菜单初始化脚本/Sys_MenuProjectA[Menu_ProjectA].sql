--项目菜单A MenuType=Menu_ProjectA

--项目设置
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('E82B690B-F662-4B4E-8340-6C4B8ECA44CC','项目设置','','LorryGo',10,'0','Menu_Project',0,0)
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('0C3386D2-8F86-40AC-94F6-EE0100324FDD','项目信息','ProjectData/ProjectSet.aspx','PageHeaderFooter',10,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('E989C82E-FDF3-449A-BFFC-0BB809D8C9B2','0C3386D2-8F86-40AC-94F6-EE0100324FDD','保存',1)
GO                                            

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

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('64690369-3049-4009-82EE-437DF2E606BA','项目单位','ProjectData/ProjectUnit.aspx','PageHeaderFooter',20,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('E1BDCD88-EC6F-4C7F-AB75-E229B14121BA','64690369-3049-4009-82EE-437DF2E606BA','选择',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4971D446-279F-4F53-ADF3-9B8CBD63360C','64690369-3049-4009-82EE-437DF2E606BA','删除',2)
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('CDB80E91-61A8-4E4D-BA97-3ADDC3208B66','项目用户','ProjectData/ProjectUser.aspx','PageHeaderFooter',30,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('A8CA1528-CF6A-4332-98B2-D428803D2D52','CDB80E91-61A8-4E4D-BA97-3ADDC3208B66','选择',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('97223C15-81D1-4174-A755-9DE9E7653C31','CDB80E91-61A8-4E4D-BA97-3ADDC3208B66','删除',2)
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

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('2C970C89-8C69-4A6C-B832-8A64B8A701CA','班组信息','ProjectData/TeamGroup.aspx','PageHeaderFooter',40,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('FE98C62E-B876-4277-BB4B-25A532819DAD','2C970C89-8C69-4A6C-B832-8A64B8A701CA','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('373EBAC3-E347-4C9A-86B1-1E2EFFF1AB12','2C970C89-8C69-4A6C-B832-8A64B8A701CA','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('06A19ADA-F5B4-4170-B486-8756C72C8A94','2C970C89-8C69-4A6C-B832-8A64B8A701CA','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('65820054-A597-4705-BA29-20FA0CD2CF30','2C970C89-8C69-4A6C-B832-8A64B8A701CA','保存',4)  
GO	

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('CBA3833A-C705-4B4E-A4A7-ACC27D0ECDCE','作业区域','ProjectData/WorkArea.aspx','PageHeaderFooter',50,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('BD560DF3-A1A4-44F9-ABC1-B203C627979C','CBA3833A-C705-4B4E-A4A7-ACC27D0ECDCE','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('27034B5A-4669-4A21-B57E-3A0C2FA705A8','CBA3833A-C705-4B4E-A4A7-ACC27D0ECDCE','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('428EBF49-0E46-46F4-A596-734D27B8619D','CBA3833A-C705-4B4E-A4A7-ACC27D0ECDCE','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('05B51CC2-9F00-4ABD-81DF-C20A640FBAE9','CBA3833A-C705-4B4E-A4A7-ACC27D0ECDCE','保存',4)  
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('09769041-79BB-4456-8DF1-45548E72E423','规则设置','ProjectData/CodeTemplateRule.aspx','PageHeaderFooter',60,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('0800A427-1B1C-4BC3-99C1-91F261CF9F74','09769041-79BB-4456-8DF1-45548E72E423','保存',1)
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('44140854-701D-4D67-AD8E-AA8DD48B6D6A','移动端首页','ProjectData/ProjectPageData.aspx','PageHeaderFooter',70,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('C65C5FFF-4EA7-4A5C-9AFA-44B27ED7C5C5','44140854-701D-4D67-AD8E-AA8DD48B6D6A','保存',1)
GO 

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('F266456A-991F-45A3-BCD6-CF2515D71E39','项目地图','ProjectData/ProjectMap.aspx','PageHeaderFooter',80,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('DF9EDDB2-F76D-4CAD-8EBB-4D7D574A82F9','F266456A-991F-45A3-BCD6-CF2515D71E39','保存',1)
GO 


--安全体系
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

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('C8AC9BBB-6E6E-4871-BADC-7963EB1CCAA8','安全管理组织机构','SecuritySystem/SafetyManageOrganization.aspx','PageHeaderFooter',10,'7CCA86F7-E43F-438F-AAB6-CA2661FBB362','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('303A2B5A-1319-4213-A433-E822E6FF22C4','C8AC9BBB-6E6E-4871-BADC-7963EB1CCAA8','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('82818179-C2DA-4B0C-B9B7-1A246EEB79A8','C8AC9BBB-6E6E-4871-BADC-7963EB1CCAA8','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F202E880-CA99-4545-A145-10F037C47C5C','C8AC9BBB-6E6E-4871-BADC-7963EB1CCAA8','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F0474BD9-2E14-4277-92F2-3043ADC0D71C','C8AC9BBB-6E6E-4871-BADC-7963EB1CCAA8','保存',4)  
	GO

--强制性法律法规/标准规定
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('A0D8A8F7-EF3A-4F81-B9C1-F9F2ECD63360','法律法规/标准规范','','Report',20,'0','Menu_Project',0,0)
GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('C85CCDFC-E721-4B9D-B73F-F83C7578EE9B','法律法规辨识','InformationProject/LawRegulationIdentify.aspx','PageHeaderFooter',10,'A0D8A8F7-EF3A-4F81-B9C1-F9F2ECD63360','Menu_Project',1,0)
	GO
	--法律法规辨识按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('177F481F-9364-419C-BF40-6E4FC55B1899','C85CCDFC-E721-4B9D-B73F-F83C7578EE9B','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('1BFD9695-0983-46F5-9740-4ACB2D50C747','C85CCDFC-E721-4B9D-B73F-F83C7578EE9B','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D415E72B-48A2-408C-AAE3-75198F10967B','C85CCDFC-E721-4B9D-B73F-F83C7578EE9B','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A11C663C-A819-4AB8-A507-E5D42C850E00','C85CCDFC-E721-4B9D-B73F-F83C7578EE9B','保存',4)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('28B0235F-3DB5-4C15-A7E3-6F5DF52C8FDC','标准规范清单','InformationProject/ConstructionStandardIdentify.aspx','PageHeaderFooter',20,'A0D8A8F7-EF3A-4F81-B9C1-F9F2ECD63360','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('77EB6FE5-2F19-453C-B2C7-5402BD297694','28B0235F-3DB5-4C15-A7E3-6F5DF52C8FDC','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6A27D312-B2FF-4662-9D63-87F012C40FBB','28B0235F-3DB5-4C15-A7E3-6F5DF52C8FDC','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7D23461D-9C99-4417-A4F0-40780641E7C3','28B0235F-3DB5-4C15-A7E3-6F5DF52C8FDC','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E921FADB-863B-44D9-99F4-86FA53D793C1','28B0235F-3DB5-4C15-A7E3-6F5DF52C8FDC','保存',4)
	GO

	
--HSSE实施计划
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('E38EE43D-C526-493F-A177-712BA9B22291','安全实施计划','','ApplicationSideBoxes',30,'0','Menu_Project',0,0)
GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('CBC47C8B-141C-446B-90D9-CE8F5AE66CE4','安全实施计划','ActionPlan/ActionPlanList.aspx','PageHeaderFooter',10,'E38EE43D-C526-493F-A177-712BA9B22291','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('86502484-9ADE-4B0E-82F7-0FDA3E225BA0','CBC47C8B-141C-446B-90D9-CE8F5AE66CE4','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('426603C4-A67E-41E9-9099-1BFDCCCE68A2','CBC47C8B-141C-446B-90D9-CE8F5AE66CE4','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('563FA95C-1FF9-4B96-8BAC-B48CFE4FD6F6','CBC47C8B-141C-446B-90D9-CE8F5AE66CE4','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7633C334-C848-4B6F-8547-A6BC4DA84093','CBC47C8B-141C-446B-90D9-CE8F5AE66CE4','保存',4)
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
	
 --/管理规定
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('7944B1C6-636B-4AD8-980C-A2F6D44883D3','安全管理规定','','TableColumn',35,'0','Menu_Project',0,0)
GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('775EFCF4-DE5C-46E9-8EA3-B16270E2F6A6','安全管理规定','ActionPlan/ManagerRule.aspx','PageHeaderFooter',20,'7944B1C6-636B-4AD8-980C-A2F6D44883D3','Menu_Project',1,0)
	GO
	--管理规定发布按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('172DBA7C-313D-4EC6-84F8-E26147556A05','775EFCF4-DE5C-46E9-8EA3-B16270E2F6A6','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E83C3555-EF6E-4D9E-B456-E40C2FDE5B4B','775EFCF4-DE5C-46E9-8EA3-B16270E2F6A6','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D7648E84-1446-4125-8056-F739696F6907','775EFCF4-DE5C-46E9-8EA3-B16270E2F6A6','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B753CC1C-D231-4B50-9F87-446B42F09ADB','775EFCF4-DE5C-46E9-8EA3-B16270E2F6A6','保存',4)  
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('10A8CDB5-4ED1-4846-91F3-79B005B75A81','775EFCF4-DE5C-46E9-8EA3-B16270E2F6A6','审核',5)  
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('204EF586-ED77-4B00-A35E-7E16F5652440','775EFCF4-DE5C-46E9-8EA3-B16270E2F6A6','发布',6)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('703D90A7-C40B-4753-943B-8A59AABDC043','管理规定清单','ActionPlan/ManagerRuleList.aspx','PageHeaderFooter',30,'7944B1C6-636B-4AD8-980C-A2F6D44883D3','Menu_Project',1,0)
	GO
	--管理规定清单按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('959627F8-E46C-405F-ABA3-15B30C9416CB','703D90A7-C40B-4753-943B-8A59AABDC043','删除',1)
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
	
	--现场施工动态管理子菜单
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('FD1F5E74-4843-4F6B-B893-8A16D26443D9','月度计划','SiteConstruction/MonthPlan.aspx','PageHeaderFooter',20,'2A00CDCC-129C-4875-9663-2A2718394D88','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('0057EE60-5046-40C6-99A9-82807D8DA587','FD1F5E74-4843-4F6B-B893-8A16D26443D9','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('5B4BB4D3-98A3-4EFB-A7BF-6E57B6FAEA83','FD1F5E74-4843-4F6B-B893-8A16D26443D9','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8534F377-C2C9-4443-AECD-B295E266DAC3','FD1F5E74-4843-4F6B-B893-8A16D26443D9','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('CD95F8E9-9A42-43AA-891C-3BB0F5CDC436','FD1F5E74-4843-4F6B-B893-8A16D26443D9','保存',4)  
	GO
	--违章曝光台管理
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('01D70BDC-DE60-4611-A203-C2D479AEF70F','违章曝光台管理','','ScriptEdit',39,'0','Menu_Project',0,0)
GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('09186AA8-991C-49F0-9D46-5C798D54FE0B','违章曝光台','InformationProject/Exposure.aspx','PageHeaderFooter',10,'01D70BDC-DE60-4611-A203-C2D479AEF70F','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C80C36B2-FD0E-4381-806B-CE348F67B126','09186AA8-991C-49F0-9D46-5C798D54FE0B','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('37977456-943F-4C4D-A7A3-2D1698892545','09186AA8-991C-49F0-9D46-5C798D54FE0B','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('1209D25D-CFCC-4519-B183-D64410A46E22','09186AA8-991C-49F0-9D46-5C798D54FE0B','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('396703EE-68B4-458D-94CF-F0EC8AA92D60','09186AA8-991C-49F0-9D46-5C798D54FE0B','保存',4)	 	
	GO
--现场人员动态管理
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('EE260447-028F-46AF-8864-9A5DC9DAA5BD','现场人员动态管理','','UserB',40,'0','Menu_Project',0,0)
GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('AD6FC259-CF40-41C7-BA3F-15AC50C1DD20','人员信息','SitePerson/PersonList.aspx','PageHeaderFooter',10,'EE260447-028F-46AF-8864-9A5DC9DAA5BD','Menu_Project',1,0)
	GO
		--人员信息按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4A340730-B563-4E34-9F5A-51BD330112EA','AD6FC259-CF40-41C7-BA3F-15AC50C1DD20','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F0D1F9F0-406A-4878-994F-EC1674B2263E','AD6FC259-CF40-41C7-BA3F-15AC50C1DD20','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C0E3570C-B2F0-45D3-A7F2-53334C4C1136','AD6FC259-CF40-41C7-BA3F-15AC50C1DD20','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E99FD3E3-0BE3-4AC8-99E0-C0A081D790A7','AD6FC259-CF40-41C7-BA3F-15AC50C1DD20','保存',4)  
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

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('8F15D3BE-BE21-4A6F-AD5C-2BBECEE46149','人工时日报','SitePerson/DayReport.aspx','PageHeaderFooter',20,'EE260447-028F-46AF-8864-9A5DC9DAA5BD','Menu_Project',1,0)
	GO
	--人工时日报按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C471B96F-B076-4E11-B13D-CCC0646FB155','8F15D3BE-BE21-4A6F-AD5C-2BBECEE46149','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F1D08346-69A1-4340-84FE-FC25FA4B9B59','8F15D3BE-BE21-4A6F-AD5C-2BBECEE46149','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8A26D718-DAE9-4F85-B484-3E428D5894B1','8F15D3BE-BE21-4A6F-AD5C-2BBECEE46149','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('36703209-4CFC-433E-A9C9-7522EA0B49DC','8F15D3BE-BE21-4A6F-AD5C-2BBECEE46149','保存',4) 
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4586AA27-71BD-4126-8320-B9C0DFF8BDD5','8F15D3BE-BE21-4A6F-AD5C-2BBECEE46149','提交',5)  
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('47D1E28F-5214-49D7-9979-63A7912B14A8','8F15D3BE-BE21-4A6F-AD5C-2BBECEE46149','导入',6)  
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('6C97E014-AF13-46E5-ADB2-03D327C560EC','人工时月报','SitePerson/MonthReport.aspx','PageHeaderFooter',30,'EE260447-028F-46AF-8864-9A5DC9DAA5BD','Menu_Project',1,0)
	GO
	--人工时月报按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4A926B8B-D0B0-453D-8761-9F5D46E9EC07','6C97E014-AF13-46E5-ADB2-03D327C560EC','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('FC1C0AAD-778D-4D5D-91D1-F09E90782F23','6C97E014-AF13-46E5-ADB2-03D327C560EC','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('05827A2B-B7D3-41D9-96E8-4FF612489835','6C97E014-AF13-46E5-ADB2-03D327C560EC','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D00D5CEA-5049-4F9C-90B3-A046B8E26225','6C97E014-AF13-46E5-ADB2-03D327C560EC','保存',4)  
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('147A736D-93C0-47A7-A6E3-D17A4AFB213E','6C97E014-AF13-46E5-ADB2-03D327C560EC','提交',5)  
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A3668913-5105-4DF3-9509-588E87BD1E74','6C97E014-AF13-46E5-ADB2-03D327C560EC','导入',6)  
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('7ACB0CB1-15D8-4E8E-A54D-0CDC5F69B39A','发卡管理','SitePerson/SendCard.aspx','PageHeaderFooter',40,'EE260447-028F-46AF-8864-9A5DC9DAA5BD','Menu_Project',1,0)
	GO
	--发卡管理按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('12F7F28F-2752-4318-A039-00D691288877','7ACB0CB1-15D8-4E8E-A54D-0CDC5F69B39A','发卡',1)
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('12F7123B-C2ED-4011-9859-83260AC91F09','现场人员考勤管理','SitePerson/PersonInfo.aspx','PageHeaderFooter',50,'EE260447-028F-46AF-8864-9A5DC9DAA5BD','Menu_Project',1,0)
	GO
	--现场人员考勤管理按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('888B7987-986F-4FDD-AA59-A9087F74F737','12F7123B-C2ED-4011-9859-83260AC91F09','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3FFDE19E-3228-467B-B9C5-F6ADE2E5B187','12F7123B-C2ED-4011-9859-83260AC91F09','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('AB4AC298-51BF-4BAD-9B4C-123A461D8BA0','12F7123B-C2ED-4011-9859-83260AC91F09','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A1CEBD5E-5244-4548-ABE2-4544F24C2868','12F7123B-C2ED-4011-9859-83260AC91F09','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('7D36E853-CC79-48B9-9E7F-E34797B4E87E','现场人员考勤统计','SitePerson/PersonStatistic.aspx','PageHeaderFooter',60,'EE260447-028F-46AF-8864-9A5DC9DAA5BD','Menu_Project',1,0)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('846565DD-89FC-4191-A71B-5CBEA2BE00E0','人员信息','SitePerson/PersonChange.aspx','PageHeaderFooter',70,'EE260447-028F-46AF-8864-9A5DC9DAA5BD','Menu_Project',1,0)
	GO
		--人员信息按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('5F67C054-10CD-4EB2-AD75-C16D53AE8F8F','846565DD-89FC-4191-A71B-5CBEA2BE00E0','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('0E7EA6DF-E1F1-4CF0-B46E-DAD338DB0155','846565DD-89FC-4191-A71B-5CBEA2BE00E0','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('1B416BD6-18C6-4654-A7A4-F44BF5704171','846565DD-89FC-4191-A71B-5CBEA2BE00E0','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4612E4A3-CF56-449E-9A40-F22FADD431C0','846565DD-89FC-4191-A71B-5CBEA2BE00E0','保存',4)  
	GO

--HSSE教育培训
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('6A0506EB-05CE-4BB3-9BA9-866389F01E1C','教育培训与考试','','ReportUser',50,'0','Menu_Project',0,0)
GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('1182E353-FAB9-4DB1-A1EC-F41A00892128','培训记录','EduTrain/TrainRecord.aspx','PageHeaderFooter',10,'6A0506EB-05CE-4BB3-9BA9-866389F01E1C','Menu_Project',1,0)
	GO
	--培训记录按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('545B547C-D9A8-4707-BE8E-F2E0F4D7A409','1182E353-FAB9-4DB1-A1EC-F41A00892128','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3CE4112E-F37B-485B-B197-36307C4547A7','1182E353-FAB9-4DB1-A1EC-F41A00892128','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A4B822D0-37DF-4D02-B24D-DA2298D78B08','1182E353-FAB9-4DB1-A1EC-F41A00892128','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('474A283E-2E73-4F6C-8BA0-A1D5DA8A7865','1182E353-FAB9-4DB1-A1EC-F41A00892128','保存',4)  
	GO


	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('F81E3F54-B3A9-4DDB-9C8C-1574317E040F','人员培训查询','EduTrain/TrainFind.aspx','PageHeaderFooter',20,'6A0506EB-05CE-4BB3-9BA9-866389F01E1C','Menu_Project',1,0)
	GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('B782A26B-D85C-4F84-8B45-F7AA47B3159E','培训计划','EduTrain/Plan.aspx','PageHeaderFooter',30,'6A0506EB-05CE-4BB3-9BA9-866389F01E1C','Menu_Project',1,0)
	GO
	--培训计划按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('183C5CD1-18B6-435A-9ED7-0EA21EFC7CA1','B782A26B-D85C-4F84-8B45-F7AA47B3159E','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('86FC3F6D-C736-41E2-A0E8-2BD8171FAC4A','B782A26B-D85C-4F84-8B45-F7AA47B3159E','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('1CBED8C8-72CF-4BE6-873F-467A08A6859C','B782A26B-D85C-4F84-8B45-F7AA47B3159E','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3663ECFA-469B-4C06-A421-1F2A273F0C05','B782A26B-D85C-4F84-8B45-F7AA47B3159E','保存',4)  
	GO
	
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('E108F75D-89D0-4DCA-8356-A156C328805C','培训任务','EduTrain/Task.aspx','PageHeaderFooter',40,'6A0506EB-05CE-4BB3-9BA9-866389F01E1C','Menu_Project',1,0)
	GO
	--培训任务按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
    VALUES('4973E74E-8B1A-490B-9361-8FB21DDEB986','E108F75D-89D0-4DCA-8356-A156C328805C','增加',1)  
    INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
    VALUES('3DCE4661-7BFF-4AA2-A6A9-3E3CE4637EAD','E108F75D-89D0-4DCA-8356-A156C328805C','修改',2)  
    INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
    VALUES('29077269-07FF-410A-862F-C31BD3C6231D','E108F75D-89D0-4DCA-8356-A156C328805C','删除',3)  
    INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
    VALUES('2010AFB3-9073-4A27-BF46-F769840DA232','E108F75D-89D0-4DCA-8356-A156C328805C','保存',4)  
    GO
    
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('6C314522-AF62-4476-893E-5F42C09C3077','培训试题','EduTrain/TestTrainRecord.aspx','PageHeaderFooter',50,'6A0506EB-05CE-4BB3-9BA9-866389F01E1C','Menu_Project',1,0)
	GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('FAF7F4A4-A4BC-4D94-9E88-0CF5A380DB34','考试计划','EduTrain/TestPlan.aspx','PageHeaderFooter',60,'6A0506EB-05CE-4BB3-9BA9-866389F01E1C','Menu_Project',1,0)
	GO
	--考试计划按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
    VALUES('0099F6A7-8C7D-48D5-B928-3F6F784CC07E','FAF7F4A4-A4BC-4D94-9E88-0CF5A380DB34','增加',1)  
    INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
    VALUES('2FCD1CE6-8D9F-4819-A175-EB1EB8828276','FAF7F4A4-A4BC-4D94-9E88-0CF5A380DB34','修改',2)  
    INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
    VALUES('F3264DC8-F77C-40C1-ADC2-6ABE22C5F3F4','FAF7F4A4-A4BC-4D94-9E88-0CF5A380DB34','删除',3)  
    INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
    VALUES('03E3D2AE-FCFC-46E2-8298-34F35378DDC1','FAF7F4A4-A4BC-4D94-9E88-0CF5A380DB34','保存',4)  
    GO
    
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('0EEB138D-84F9-4686-8CBB-CAEAA6CF1B2A','考试记录','EduTrain/TestRecord.aspx','PageHeaderFooter',70,'6A0506EB-05CE-4BB3-9BA9-866389F01E1C','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('0E5AD303-5911-42DE-8438-161099B396C1','0EEB138D-84F9-4686-8CBB-CAEAA6CF1B2A','保存',4)  

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('6FF941C1-8A00-4A74-8111-C892FC30A8DA','考试统计','EduTrain/TestStatistics.aspx','PageHeaderFooter',80,'6A0506EB-05CE-4BB3-9BA9-866389F01E1C','Menu_Project',1,0)
GO
	
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('1C80EF15-B75B-473D-B190-CE12E4DDA287','模拟考试','EduTrain/ModelTestRecord.aspx','PageHeaderFooter',90,'6A0506EB-05CE-4BB3-9BA9-866389F01E1C','Menu_Project',1,0)
GO


--HSSE资质审核
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('26FDE187-F2EE-41D0-95EA-4E8E026F19E5','资质审核','','CalendarEdit',60,'0','Menu_Project',0,0)
GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('DFDFEDA3-FECB-40DA-9216-C67B48002A8A','施工分包资质','QualityAudit/SubUnitQuality.aspx','PageHeaderFooter',10,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('AD6C4EAA-F1D5-4DD4-9082-BAE8FAB144FA','DFDFEDA3-FECB-40DA-9216-C67B48002A8A','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4A693BD8-3AC4-438B-A820-5DB18FE128D4','DFDFEDA3-FECB-40DA-9216-C67B48002A8A','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6A9E05BC-230F-4380-8CD7-EF63EA5E3981','DFDFEDA3-FECB-40DA-9216-C67B48002A8A','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8A46649C-CFC9-4D55-8808-5EB5F40FEBA6','DFDFEDA3-FECB-40DA-9216-C67B48002A8A','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('03BAA34B-87D2-4479-9E69-10DD4A62A2A8','采购供货厂家管理','QualityAudit/InUnit.aspx','PageHeaderFooter',20,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8A9DF032-04CA-4C2D-AEF3-4F1C3C808A82','03BAA34B-87D2-4479-9E69-10DD4A62A2A8','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('EF9FC7B3-B119-4D59-93DF-12720BEA6A42','03BAA34B-87D2-4479-9E69-10DD4A62A2A8','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('89B5BCDB-DAC7-4327-9E58-5FFE765FB3BA','03BAA34B-87D2-4479-9E69-10DD4A62A2A8','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E853F300-BDB1-4C7B-BDBC-632AB30BFCC0','03BAA34B-87D2-4479-9E69-10DD4A62A2A8','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('EBEA762D-1F46-47C5-9EAD-759E13D9B41C','特殊岗位人员资质','QualityAudit/PersonQuality.aspx','PageHeaderFooter',30,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('AAC0ECF7-7DF1-4C37-9B56-964439ED2EC3','EBEA762D-1F46-47C5-9EAD-759E13D9B41C','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('44AECA34-F28B-4F83-A4CB-454B7AF2333E','EBEA762D-1F46-47C5-9EAD-759E13D9B41C','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A9D66E6B-8A3D-49D9-810E-A44E50D7243A','EBEA762D-1F46-47C5-9EAD-759E13D9B41C','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('00D6205E-7573-43C2-A6C1-AB1BB12529C6','EBEA762D-1F46-47C5-9EAD-759E13D9B41C','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('2DEDD752-8BAF-43CD-933D-932AF9AF2F58','特殊机具设备资质','QualityAudit/EquipmentQuality.aspx','PageHeaderFooter',40,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8D59DB35-73B4-4EFD-A318-84817D47B4D0','2DEDD752-8BAF-43CD-933D-932AF9AF2F58','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4D9E2829-C969-4BBA-A7D0-B608C7B03AF6','2DEDD752-8BAF-43CD-933D-932AF9AF2F58','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('94D5EAE3-2F99-40C1-8179-10DCCE199B08','2DEDD752-8BAF-43CD-933D-932AF9AF2F58','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('34034A73-8758-45A9-99F7-6EA2F270CCA1','2DEDD752-8BAF-43CD-933D-932AF9AF2F58','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('BFD62699-47F0-49FA-AD39-FAEE8A6C3313','一般机具设备资质','QualityAudit/GeneralEquipmentQuality.aspx','PageHeaderFooter',50,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('5108932E-67A0-49D6-8889-129141375754','BFD62699-47F0-49FA-AD39-FAEE8A6C3313','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('25ABFF34-E567-4CFB-9CAA-22692B2C51A8','BFD62699-47F0-49FA-AD39-FAEE8A6C3313','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('59971EF4-637F-48FF-9C44-5E5E3C2F1690','BFD62699-47F0-49FA-AD39-FAEE8A6C3313','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C213E22D-7594-4006-9484-B3F3234AA574','BFD62699-47F0-49FA-AD39-FAEE8A6C3313','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('874B4232-E0AD-41CD-8C66-8A7FF2D79358','项目安全协议清单','QualityAudit/ProjectRecord.aspx','PageHeaderFooter',60,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('638CE52E-79CF-469E-A2D6-0A8219AC0D36','874B4232-E0AD-41CD-8C66-8A7FF2D79358','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F9F54F10-1023-4EE4-A0F6-7BBE503A5DD7','874B4232-E0AD-41CD-8C66-8A7FF2D79358','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4D4ADCC6-36BE-479A-8A23-53E65E0F922F','874B4232-E0AD-41CD-8C66-8A7FF2D79358','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4E7DEF57-C77A-435A-8B86-98270F5F0878','874B4232-E0AD-41CD-8C66-8A7FF2D79358','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('750F5074-45B9-470E-AE1E-6204957421E6','安全人员资质','QualityAudit/SafePersonQuality.aspx','PageHeaderFooter',70,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('FC4B7E03-C828-47D4-8109-B45D4CF4EE2F','750F5074-45B9-470E-AE1E-6204957421E6','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C74266CC-3E7C-460F-8601-019BED545C64','750F5074-45B9-470E-AE1E-6204957421E6','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8B4DAD77-0077-4C7F-9CE1-543AA4DF5CD5','750F5074-45B9-470E-AE1E-6204957421E6','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('800FE3A5-6C0F-40A8-90BC-844CB01939D6','750F5074-45B9-470E-AE1E-6204957421E6','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('07435F23-F87D-4F52-B32C-A3DA95B10DA2','管理人员资质','QualityAudit/ManagePersonQuality.aspx','PageHeaderFooter',80,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('FA200C16-3FDD-40ED-B2ED-986AFF5CD831','07435F23-F87D-4F52-B32C-A3DA95B10DA2','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('18C78AF4-268C-45A2-9315-ED38E715D6D3','07435F23-F87D-4F52-B32C-A3DA95B10DA2','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('11BFA96E-E0C4-408F-8887-B7EF1777D7BB','07435F23-F87D-4F52-B32C-A3DA95B10DA2','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('232B8E89-E3C3-47AF-93AC-BDB75B5211DE','07435F23-F87D-4F52-B32C-A3DA95B10DA2','保存',4)  
	GO

--HSSE许可管理
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('473A87D2-1365-4A68-BD38-06F312F81BC2','作业许可管理','','PageKey',70,'0','Menu_Project',0,0)
GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('0E9B7084-D021-4CA3-B9D2-9CBAA27A571B','现场作业许可证','License/LicenseManager.aspx','PageHeaderFooter',10,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('918DACA1-A573-4953-B982-46BFB8E0C1AC','0E9B7084-D021-4CA3-B9D2-9CBAA27A571B','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('039A974A-6989-44FC-B6CA-177A536ADA30','0E9B7084-D021-4CA3-B9D2-9CBAA27A571B','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E5ADE297-2366-481E-B5F8-43FF2B371CDE','0E9B7084-D021-4CA3-B9D2-9CBAA27A571B','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3AA2CAEC-3021-4EF5-966C-E7DF21F6473D','0E9B7084-D021-4CA3-B9D2-9CBAA27A571B','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('915F5AB2-CDCA-4025-A462-AC873D8FB037','新开项目作业许可证','License/SecurityLicense.aspx','PageHeaderFooter',20,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7F67E0E4-8910-42E1-8DA4-ECD6C82269B7','915F5AB2-CDCA-4025-A462-AC873D8FB037','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('39A4B9FC-37A1-42AC-884F-C8B1CA7FBCAC','915F5AB2-CDCA-4025-A462-AC873D8FB037','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A742F38D-005A-4F69-A35B-1FE68A3D1F7A','915F5AB2-CDCA-4025-A462-AC873D8FB037','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7CEF5018-0BED-40A3-A6BF-1660568ED0F6','915F5AB2-CDCA-4025-A462-AC873D8FB037','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('9703D711-85DA-4A0B-B08B-70F791418696','施工机具、安全设施检查验收','License/EquipmentSafetyList.aspx','PageHeaderFooter',30,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4B602938-51F8-4C97-8FEF-78B08480FF4C','9703D711-85DA-4A0B-B08B-70F791418696','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E05525AB-404D-47CF-97E7-58A6B26D6A89','9703D711-85DA-4A0B-B08B-70F791418696','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('11DB30F8-7C31-45CB-BE9A-9F423181150F','9703D711-85DA-4A0B-B08B-70F791418696','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('1F3CCD70-B060-4799-AC67-DB1535B1E881','9703D711-85DA-4A0B-B08B-70F791418696','保存',4)  
	GO


	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('49485F7E-8E71-4EED-87B4-BF6CC180C69C','安全技术交底','License/HSETechnical.aspx','PageHeaderFooter',40,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
	GO

	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('FF6E6636-3843-4D2A-AEE1-5C7103B98338','49485F7E-8E71-4EED-87B4-BF6CC180C69C','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F9F6B47A-13F4-43C3-B4B0-D0CCB7EE7ABD','49485F7E-8E71-4EED-87B4-BF6CC180C69C','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7D28E0A2-2628-4793-B633-710937352278','49485F7E-8E71-4EED-87B4-BF6CC180C69C','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('365579A1-E597-4567-908B-8D40E019C5DA','49485F7E-8E71-4EED-87B4-BF6CC180C69C','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B','动火作业票','License/FireWork.aspx','PageHeaderFooter',50,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8DB0EAED-B67D-423A-BA13-E7872A11727A','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F0283058-2CCF-4195-AEBC-878A2AE5067F','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('2C3CD3AA-C07D-439F-97BE-FEA20CE512CB','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('BBB22814-70D3-4188-A7F8-8C0FD4557A27','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B','保存',4)  
	GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9','高处作业票','License/HeightWork.aspx','PageHeaderFooter',60,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B3CD11DC-D359-4D60-8DB4-BD095CE52C17','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6D9B6919-0677-4892-9C73-CDD6C124B855','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('044C6FF2-2A30-4E08-88A6-9D85722AD89C','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7C06CD77-402A-4F8C-A41B-1C69301707E5','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9','保存',4)  
	GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('AEC9166D-1C91-45F0-8BFE-D3D0479A28C7','受限空间作业票','License/LimitedSpace.aspx','PageHeaderFooter',70,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('904FD3D2-1520-48FB-BD8F-6BAA000653B7','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7F372BE4-E264-48FB-ACA6-8E7EE41393EC','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('BE6D9AE8-069A-421A-8E3D-F3DDC18FCDB4','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8CC252A0-F098-4FE3-AF21-4A7A7030DC5E','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7','保存',4)  
	GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('F72FF20B-D3EB-46A5-97F7-C99B2473A140','射线作业票','License/RadialWork.aspx','PageHeaderFooter',80,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('107EA8EA-4D8D-410B-B3DE-F0C29E9C3EDC','F72FF20B-D3EB-46A5-97F7-C99B2473A140','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('89010EF9-9E77-49EB-A00D-3142B9FBC29E','F72FF20B-D3EB-46A5-97F7-C99B2473A140','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F5EFEB84-7CCC-406D-ACFA-CA36CB6A8A1D','F72FF20B-D3EB-46A5-97F7-C99B2473A140','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('982333DA-42A2-40A3-8F3D-52BA7DE4E19D','F72FF20B-D3EB-46A5-97F7-C99B2473A140','保存',4)  
	GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('4E607E83-41FC-4F49-B26F-A21CFE38328F','断路(占道)作业票','License/OpenCircuit.aspx','PageHeaderFooter',90,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6D90E4CD-D932-454A-8A8B-54FA3CC22FD4','4E607E83-41FC-4F49-B26F-A21CFE38328F','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('53BF21A8-38DA-4853-A527-8D392B901554','4E607E83-41FC-4F49-B26F-A21CFE38328F','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('06F8CEAB-7AF8-40C5-B6D0-6A91AE562AD7','4E607E83-41FC-4F49-B26F-A21CFE38328F','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C8BE46DF-2553-4A64-BE79-B69712C297A5','4E607E83-41FC-4F49-B26F-A21CFE38328F','保存',4)  
	GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('755C6AC9-2E38-4D4F-AF33-33CB1744A907','动土作业票','License/BreakGround.aspx','PageHeaderFooter',100,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F3D52EF3-104F-42CF-B48A-443FCE5C800D','755C6AC9-2E38-4D4F-AF33-33CB1744A907','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7DFD6886-0F8B-4DA1-9C4B-1847A8B286AF','755C6AC9-2E38-4D4F-AF33-33CB1744A907','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F5F93A18-438F-4A19-982B-7E9E38EB6AE2','755C6AC9-2E38-4D4F-AF33-33CB1744A907','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('32937824-9F35-4C4E-8E13-984E784F8E9C','755C6AC9-2E38-4D4F-AF33-33CB1744A907','保存',4)  
	GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('7BBAE649-7B00-4475-A911-BFE3A37AC55B','夜间施工作业票','License/NightWork.aspx','PageHeaderFooter',110,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B040C80B-4216-4AF8-B9C9-A1303E31CFAC','7BBAE649-7B00-4475-A911-BFE3A37AC55B','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('60241503-BF4B-4159-AFA2-41186CD9329B','7BBAE649-7B00-4475-A911-BFE3A37AC55B','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3A192DC6-2338-4038-ADAD-46FA7364E20F','7BBAE649-7B00-4475-A911-BFE3A37AC55B','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6239BB95-33AF-4B36-97CB-787EF553D35A','7BBAE649-7B00-4475-A911-BFE3A37AC55B','保存',4)  
	GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('A1BE3AB6-9D4A-41E7-8870-E73423165451','吊装作业票','License/LiftingWork.aspx','PageHeaderFooter',120,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('BDC9E201-0C51-4C02-9151-B6DF86CE4C27','A1BE3AB6-9D4A-41E7-8870-E73423165451','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('36EBA247-3051-4213-BD95-89DC948006E1','A1BE3AB6-9D4A-41E7-8870-E73423165451','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('46A93981-2D60-49C3-877A-7B66EBCBC927','A1BE3AB6-9D4A-41E7-8870-E73423165451','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3C5F18F7-459A-4666-B497-9400E637C975','A1BE3AB6-9D4A-41E7-8870-E73423165451','保存',4)  
	GO
--HSSE危险源辨识与评价
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('9A3212F8-2392-4F21-A8C7-FF5EE3B191F1','危险源辨识与评价','','FolderError',80,'0','Menu_Project',0,0)
GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('762F0BF9-471B-4115-B35E-03A26C573877','环境因素识别与评价','Hazard/EnvironmentalRiskList.aspx','PageHeaderFooter',10,'9A3212F8-2392-4F21-A8C7-FF5EE3B191F1','Menu_Project',1,0)
	GO
	--环境危险源辨识与评价按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('25E47331-0E20-47B0-AAC3-926C0444D9C9','762F0BF9-471B-4115-B35E-03A26C573877','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('25705A8C-A734-4D56-8C30-4D08578B37F3','762F0BF9-471B-4115-B35E-03A26C573877','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8485EACC-BEE1-4BED-95CE-A10AA53372D1','762F0BF9-471B-4115-B35E-03A26C573877','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4DEF4A6D-77BD-4192-896D-6AB88BFA8F91','762F0BF9-471B-4115-B35E-03A26C573877','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('EDC50857-7762-4498-83C6-5BDE85036BAB','职业健康安全危险源辨识与评价','Hazard/HazardList.aspx','PageHeaderFooter',20,'9A3212F8-2392-4F21-A8C7-FF5EE3B191F1','Menu_Project',1,0)
	GO
	--危险源辨识与评价清单按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C90FA764-F303-43F6-AC24-2F9E9351C637','EDC50857-7762-4498-83C6-5BDE85036BAB','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('16D438F4-72C7-4765-84DE-4C34867F7760','EDC50857-7762-4498-83C6-5BDE85036BAB','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('51ED8EA2-133F-4277-90C5-6C1F6EB50F8B','EDC50857-7762-4498-83C6-5BDE85036BAB','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('0BF51430-3A6D-483B-9516-89711266E2F5','EDC50857-7762-4498-83C6-5BDE85036BAB','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('94C36333-C22A-499F-B9DB-53EEF77922AE','项目现场重大HSE因素控制措施一览表','Hazard/MajorHazardList.aspx','PageHeaderFooter',25,'9A3212F8-2392-4F21-A8C7-FF5EE3B191F1','Menu_Project',1,0)
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('F6A6D53A-150E-43DB-A3C4-6FA18E9401E9','风险提示','Hazard/HazardPrompt.aspx','PageHeaderFooter',30,'9A3212F8-2392-4F21-A8C7-FF5EE3B191F1','Menu_Project',1,0)
	GO
	--风险提示按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('DA0AEFAB-C5A2-44B8-9956-9F74C26EF803','F6A6D53A-150E-43DB-A3C4-6FA18E9401E9','提示',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('73ED8EDF-6EC2-46BC-B663-18ABF4939D3D','F6A6D53A-150E-43DB-A3C4-6FA18E9401E9','响应',2)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('E22F555A-D41C-4F5F-9734-39B578957732','其他危险源辨识文件','Hazard/OtherHazard.aspx','PageHeaderFooter',60,'9A3212F8-2392-4F21-A8C7-FF5EE3B191F1','Menu_Project',1,0)
	GO
	--其他危险源辨识文件按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6A13DAA6-ABF3-47F8-A931-77E29C842DA2','E22F555A-D41C-4F5F-9734-39B578957732','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A12D8375-1F28-4692-AF5B-3D06E7069E87','E22F555A-D41C-4F5F-9734-39B578957732','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A59B4587-5A06-4E8C-83E1-04495E4FE06D','E22F555A-D41C-4F5F-9734-39B578957732','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('10E7897D-DD1F-4226-B80C-F633C6B5A91A','E22F555A-D41C-4F5F-9734-39B578957732','保存',4)  
	GO
	
--施工方案/方案审查
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('5FF7BBD8-3E0A-4C90-8976-AFF5CE7E17A5','施工方案/审查','','ApplicationOsxDouble',90,'0','Menu_Project',0,0)
GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('D5F6DFAA-4051-4E0E-818B-2A45F985C5A4','方案模板','Solution/SolutionTemplate.aspx','PageHeaderFooter',10,'5FF7BBD8-3E0A-4C90-8976-AFF5CE7E17A5','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F80D89D5-BB42-4351-AB32-29FC36993486','D5F6DFAA-4051-4E0E-818B-2A45F985C5A4','增加',1)	
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('5802D25A-3F6D-427B-8E5D-23501EA97B1E','D5F6DFAA-4051-4E0E-818B-2A45F985C5A4','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('75986270-1BF3-440F-86EA-729E89DC5960','D5F6DFAA-4051-4E0E-818B-2A45F985C5A4','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('367C4E02-4D88-4F25-97D1-99B25DFBFF84','D5F6DFAA-4051-4E0E-818B-2A45F985C5A4','保存',4)
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('9B42977B-FA0B-48EF-8616-D53FC14E5127','施工方案/审查','Solution/ConstructSolution.aspx','PageHeaderFooter',20,'5FF7BBD8-3E0A-4C90-8976-AFF5CE7E17A5','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('BF599860-0519-4472-B057-AE8E17C5080A','9B42977B-FA0B-48EF-8616-D53FC14E5127','增加',1)	
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('BAF5EDEF-64FB-427C-95F9-493AD0B6CA39','9B42977B-FA0B-48EF-8616-D53FC14E5127','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E258D4AA-69AF-4316-AE5C-5A990945D7FE','9B42977B-FA0B-48EF-8616-D53FC14E5127','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D0EE21B5-97CA-4947-87ED-B69B35C94FC5','9B42977B-FA0B-48EF-8616-D53FC14E5127','保存',4)
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('5B3D3F7B-9B50-4927-B131-11D13D4D1C19','危大工程施工方案清单','Solution/LargerHazardList.aspx','PageHeaderFooter',30,'5FF7BBD8-3E0A-4C90-8976-AFF5CE7E17A5','Menu_Project',1,0)
	GO
	--危险性较大的工程清单按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('9EA37C60-6263-4AE6-AAE8-154B9FA9447F','5B3D3F7B-9B50-4927-B131-11D13D4D1C19','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B1014A2E-0BCD-408B-81A9-C3E4710A98EA','5B3D3F7B-9B50-4927-B131-11D13D4D1C19','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7781C020-6B22-4485-8EA2-7A7F5332A152','5B3D3F7B-9B50-4927-B131-11D13D4D1C19','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('27237E97-AB28-4242-B6BC-AF3BA9B73B22','5B3D3F7B-9B50-4927-B131-11D13D4D1C19','保存',4)  
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('27DE7248-C4FF-4288-BBAC-11CB8741AD67','专家论证清单','Solution/ExpertArgumentList .aspx','PageHeaderFooter',40,'5FF7BBD8-3E0A-4C90-8976-AFF5CE7E17A5','Menu_Project',1,0)
	GO
	--专家论证清单按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('36EE636B-630B-4F42-95B5-8E8C3E4029F7','27DE7248-C4FF-4288-BBAC-11CB8741AD67','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4E709EEA-E13A-4268-9096-84B5AE9D6AC4','27DE7248-C4FF-4288-BBAC-11CB8741AD67','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3B00C7C0-6E6A-4C27-B851-0E15AE1C4755','27DE7248-C4FF-4288-BBAC-11CB8741AD67','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4A355C96-1A0B-4CCF-AE28-916A194B06B6','27DE7248-C4FF-4288-BBAC-11CB8741AD67','保存',4)  
	GO

--HSSE检查管理
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('467A0CB9-737D-4451-965E-869EBC3A4BD6','安全检查管理','','FolderFind',100,'0','Menu_Project',0,0)
GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('9CEB4059-5826-4B8C-923C-6FE4131ED636','检查项目设置','Check/CheckItemSet.aspx','PageHeaderFooter',10,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('EBACFFB4-E6F8-4EBB-A76E-237F0B468824','9CEB4059-5826-4B8C-923C-6FE4131ED636','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4CBF167E-2272-4116-A2E2-936C92E05BCD','9CEB4059-5826-4B8C-923C-6FE4131ED636','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('DA582073-1D65-4E9D-8111-F1CA944D6212','9CEB4059-5826-4B8C-923C-6FE4131ED636','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('33C64EFD-3E9D-496F-A327-AC59C5214072','9CEB4059-5826-4B8C-923C-6FE4131ED636','保存',4)
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('9F6FB863-4001-49BD-A748-66009891D13C','日常巡检','Check/CheckDay.aspx','PageHeaderFooter',20,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	--日常巡检按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('25B45E04-F000-407A-B5B0-70B638ABFA7B','9F6FB863-4001-49BD-A748-66009891D13C','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('9B0FF3A8-371A-4FA4-9159-CCFF3FD1052D','9F6FB863-4001-49BD-A748-66009891D13C','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('07CB0D4A-4BFB-47B7-B450-FCCA79462D17','9F6FB863-4001-49BD-A748-66009891D13C','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4569960B-EE8D-40DE-BF9D-4F8B342435CE','9F6FB863-4001-49BD-A748-66009891D13C','保存',4)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('0E30F917-0C51-4C45-BD19-981039CA44F5','日常巡检（五环）','Check/CheckDayWH.aspx','PageHeaderFooter',22,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	--日常巡检按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8BB6E89A-6F4D-4708-B1D5-19E7F9C93DBC','0E30F917-0C51-4C45-BD19-981039CA44F5','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8CC6E923-0363-4834-9791-A9B53D027D0B','0E30F917-0C51-4C45-BD19-981039CA44F5','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('987AE3C6-B374-4BBE-8478-4257D6DFABE5','0E30F917-0C51-4C45-BD19-981039CA44F5','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3CA31AFA-51C4-4B90-89EB-84F0304A5B76','0E30F917-0C51-4C45-BD19-981039CA44F5','保存',4)
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('38FBBA77-8B35-470C-90EE-6861E6DDE03F','日常巡检(记录)','Check/CheckDayXA.aspx','PageHeaderFooter',25,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	--日常巡检按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('5B20746A-19B6-443A-876F-36BC7781AF23','38FBBA77-8B35-470C-90EE-6861E6DDE03F','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6871BDF0-DF82-4DC4-A955-A4273514E937','38FBBA77-8B35-470C-90EE-6861E6DDE03F','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('85C79C78-B586-4652-B0A1-A8944BC61F2E','38FBBA77-8B35-470C-90EE-6861E6DDE03F','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('42BA1A15-60B1-4879-9A62-319271D4B0C3','38FBBA77-8B35-470C-90EE-6861E6DDE03F','保存',4)
	GO

	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('2FC8AA2A-F421-4174-A05E-2711167AF141','安全巡检','HiddenInspection/HiddenRectificationList.aspx','PageHeaderFooter',26,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E831F780-BDC2-4644-B132-40E27518805E','2FC8AA2A-F421-4174-A05E-2711167AF141','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('9112B8B8-50A0-4592-AE06-2AC24E07E20B','2FC8AA2A-F421-4174-A05E-2711167AF141','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3FF03C33-A07D-48CF-A0E2-D7A7542FBD69','2FC8AA2A-F421-4174-A05E-2711167AF141','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('55598440-05EF-4E70-86E6-81317BF19D94','2FC8AA2A-F421-4174-A05E-2711167AF141','保存',4)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('23855EB9-0BB1-4B3E-BA69-3C0222F5E2A4','安全巡检记录','HiddenInspection/HiddenRectificationRecord.aspx','PageHeaderFooter',27,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('020C87A9-3C0A-4FF1-83F0-4F97015D8F43','23855EB9-0BB1-4B3E-BA69-3C0222F5E2A4','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B8609CF6-5D2E-4C9C-AF2A-EF4A2AAF265A','23855EB9-0BB1-4B3E-BA69-3C0222F5E2A4','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('9E976E09-D98E-4577-98D5-908CFD142AE6','23855EB9-0BB1-4B3E-BA69-3C0222F5E2A4','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E1BDC47A-CB50-4210-ACE6-604589BE22F2','23855EB9-0BB1-4B3E-BA69-3C0222F5E2A4','保存',4)
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('1B08048F-93ED-4E84-AE65-DB7917EA2DFB','专项检查','Check/CheckSpecial.aspx','PageHeaderFooter',30,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	--专项检查按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3EE4796E-76D1-4104-9EE8-312708A542AD','1B08048F-93ED-4E84-AE65-DB7917EA2DFB','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('5FA78522-6B94-4CB1-8EDF-3E23337ED49D','1B08048F-93ED-4E84-AE65-DB7917EA2DFB','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('FDFD11E3-76D4-4BDD-B0E9-507E367F95AF','1B08048F-93ED-4E84-AE65-DB7917EA2DFB','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('23EB91A9-77DF-4013-B7E3-76D08CB74C2D','1B08048F-93ED-4E84-AE65-DB7917EA2DFB','保存',4)
	GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('B7A5F84B-843A-4C13-9844-023D8B4A41AC','专项检查','HiddenInspection/CheckSpecial.aspx','PageHeaderFooter',32,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('FFE04B9A-7BAE-4409-ADFA-971954E1BA59','B7A5F84B-843A-4C13-9844-023D8B4A41AC','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('81D6834F-0080-4C80-9A97-FAF9D001E474','B7A5F84B-843A-4C13-9844-023D8B4A41AC','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('52760F7F-08A6-4D2C-94BF-781FFA0DD6BD','B7A5F84B-843A-4C13-9844-023D8B4A41AC','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('28B81B5F-33DF-40EA-866F-0BB1D0422F05','B7A5F84B-843A-4C13-9844-023D8B4A41AC','保存',4)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('1197B868-1152-46E3-9892-0A2C403D4A53','B7A5F84B-843A-4C13-9844-023D8B4A41AC','提交',5)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('00CF924E-70DE-4130-AF7D-58B93E0D3AB7','B7A5F84B-843A-4C13-9844-023D8B4A41AC','审核',6)
	GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('C198EBA8-9E23-4654-92E1-09C61105C522','综合检查','Check/CheckColligation.aspx','PageHeaderFooter',40,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	--综合检查按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C81C9400-BEC9-40B8-8FE9-1343D2FD191E','C198EBA8-9E23-4654-92E1-09C61105C522','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('10423096-BACC-4423-B1F2-3CB12947424D','C198EBA8-9E23-4654-92E1-09C61105C522','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6C659A38-D941-4225-98B1-A60AAC831D6E','C198EBA8-9E23-4654-92E1-09C61105C522','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6886FA5A-7217-4FB2-805A-BD56EB1DD3E5','C198EBA8-9E23-4654-92E1-09C61105C522','保存',4)
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('9212291A-FBC5-4F6D-A5F6-60BFF4E30F6F','开工前检查','Check/CheckWork.aspx','PageHeaderFooter',50,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	--开工前检查按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3EBDF742-4C18-44AA-9D71-8F8573832AD6','9212291A-FBC5-4F6D-A5F6-60BFF4E30F6F','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8FF00FC5-CDD1-4F97-955B-1D5526FF4CB0','9212291A-FBC5-4F6D-A5F6-60BFF4E30F6F','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A5A9321B-1650-4F62-B60A-09ADC2AAEF3C','9212291A-FBC5-4F6D-A5F6-60BFF4E30F6F','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('25BC6C2C-65A7-424D-BD7F-BCEF3FA2F10B','9212291A-FBC5-4F6D-A5F6-60BFF4E30F6F','保存',4)
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('0D23A707-ADA0-4C2B-9665-611134243529','季节性/节假日检查','Check/CheckHoliday.aspx','PageHeaderFooter',60,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('247B76AA-01BF-4A40-BB4C-B3EAF441F538','领导督察(APP)','HiddenInspection/SafeSupervision.aspx','PageHeaderFooter',65,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('784A73D6-BE99-41CF-97CA-EB123EF00825','247B76AA-01BF-4A40-BB4C-B3EAF441F538','删除',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('5221A77B-1891-40E1-AB7B-6D7EE0D7F633','247B76AA-01BF-4A40-BB4C-B3EAF441F538','保存',2)
	GO
	--季节性/节假日检查按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A8504E1D-AE9A-45A3-AEDE-D4DF6B41F4BC','0D23A707-ADA0-4C2B-9665-611134243529','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8EE147D3-C5E0-4A76-954B-AE2ADEA6BB6C','0D23A707-ADA0-4C2B-9665-611134243529','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('BC17AA11-070E-4736-9793-B218CD2B3361','0D23A707-ADA0-4C2B-9665-611134243529','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('889CD8C1-A974-471E-966D-FB33CD7279E1','0D23A707-ADA0-4C2B-9665-611134243529','保存',4)
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('0038D764-D628-46F0-94FF-D0A22C3C45A3','隐患整改通知单','Check/RectifyNotice.aspx','PageHeaderFooter',70,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	--隐患整改单按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E996C6F2-BF9F-40EF-B5EA-6725E9DCDD98','0038D764-D628-46F0-94FF-D0A22C3C45A3','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('87F26F47-DBDB-4B20-A87C-548BAEED7C3A','0038D764-D628-46F0-94FF-D0A22C3C45A3','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D8516883-ED4F-4183-98DA-F1ADEBF08C0B','0038D764-D628-46F0-94FF-D0A22C3C45A3','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D443152A-80BA-44B7-8060-2AC840F94D6C','0038D764-D628-46F0-94FF-D0A22C3C45A3','保存',4)	
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F6743F66-33C9-442D-A693-DEEDD6721C15','0038D764-D628-46F0-94FF-D0A22C3C45A3','审核',5)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('C3B6B222-44DC-46F3-B783-B1FC0F743C48','隐患整改单(赛鼎)','Check/RectifyNotices.aspx','PageHeaderFooter',70,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	--隐患整改单按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7C851AD5-57CB-444E-9246-C0AE4FFEFABB','C3B6B222-44DC-46F3-B783-B1FC0F743C48','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E2EDBEED-D46C-4DCF-AFEE-13EE86EB022E','C3B6B222-44DC-46F3-B783-B1FC0F743C48','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('37813E3D-6509-4F70-A7F9-F6BBA825B827','C3B6B222-44DC-46F3-B783-B1FC0F743C48','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E3C7FF40-5FF7-4937-8C6E-FE8772C5FDEE','C3B6B222-44DC-46F3-B783-B1FC0F743C48','保存',4)	
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F69771B8-5964-4E5F-A628-2E841D996DCD','C3B6B222-44DC-46F3-B783-B1FC0F743C48','审核',5)
	GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('29F27641-06ED-435A-9F9B-FCE6366801BE','安全监督检查整改','Hazard/ProjectSuperviseCheckRectify.aspx','PageHeaderFooter',72,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	--安全监督检查整改
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B6BC2531-A381-4843-9E08-C49EFB3B541B','29F27641-06ED-435A-9F9B-FCE6366801BE','修改',2)	
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('FBBC83E5-DF22-4995-8086-CB7A970CE2D3','29F27641-06ED-435A-9F9B-FCE6366801BE','保存',4)  
	GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('B6BE5FE0-CB84-47FF-A6C3-5AD9E1CCE079','隐患巡检（手机端）','Check/Registration.aspx','PageHeaderFooter',75,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('9B2F84A8-50EB-49F1-A876-E2BE1524A941','隐患巡检记录（手机端）','Check/RegistrationRecord.aspx','PageHeaderFooter',77,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO 
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex) VALUES('7B86E1DE-2FB2-425A-9EFC-D8D722398FD5','9B2F84A8-50EB-49F1-A876-E2BE1524A941','保存',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex) VALUES('D9B87691-CB09-484C-9557-250030628E04','9B2F84A8-50EB-49F1-A876-E2BE1524A941','删除',2)
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('C81DB7ED-165E-4C69-86B0-A3AAE37059FE','工程暂停令','Check/PauseNotice.aspx','PageHeaderFooter',80,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	--工程暂停令按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('FF192B1E-0F55-4DD1-8DB0-497F83375D13','C81DB7ED-165E-4C69-86B0-A3AAE37059FE','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('66BE053B-801A-498A-AC52-8BEDAB9B3587','C81DB7ED-165E-4C69-86B0-A3AAE37059FE','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('CF6630EA-79B3-438A-869A-C7276C05931A','C81DB7ED-165E-4C69-86B0-A3AAE37059FE','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C163212C-C075-49C3-A36A-4624D4C099B1','C81DB7ED-165E-4C69-86B0-A3AAE37059FE','保存',4)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('DFDASFDA-XDER-5TY6-34F6-7UKLPOE31334','C81DB7ED-165E-4C69-86B0-A3AAE37059FE','确认',5)
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
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('CDEA8829-9E6E-4CF3-AC2E-A2800D7C04B6','F910062E-98B0-486F-A8BD-D5B0035F808F','审核',5)	
	GO
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

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('17C25222-FDFD-469E-9AEE-33058FF1A3EE','汇总清单','Check/SummaryList.aspx','PageHeaderFooter',110,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('D322F726-B4D3-4807-BA5F-3ADF91E1F084','巡检分析(图表)','HiddenInspection/RiskAnalysisChart.aspx','PageHeaderFooter',120,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('D0A9B1CC-493F-4CAC-9EC9-C3A89D1D5DB3','管理人员履职情况','HiddenInspection/ManagerPerformance.aspx','PageHeaderFooter',130,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO

    INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('9959896B-67DB-43C8-B1D2-EDAFDD7F5A27','单位违章统计明细表','HiddenInspection/UnitViolationStatistics.aspx','PageHeaderFooter',140,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('3A6E2DC0-3983-4040-BE13-3A6BDA338FED','违章分类占比统计','HiddenInspection/ViolationClassificationStatistics.aspx','PageHeaderFooter',150,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('36FDA642-5BB9-4C29-AFF2-190397242F0A','分包商占比统计','HiddenInspection/SubUnitRateStatistics.aspx','PageHeaderFooter',160,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('710A1A13-89C2-4DBA-B940-99D1B91E8F3E','违章分类比较图','HiddenInspection/ViolationClassificationComparison.aspx','PageHeaderFooter',170,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
	GO
	
	
--HSSE应急响应管理
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('B6FBD6B6-F9A0-49B1-87F9-160748162131','应急响应管理','','SmartphoneDisk',110,'0','Menu_Project',0,0)
GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('ABD84F93-A84E-448C-8A67-AB0FE4E8D10C','应急预案管理清单','Emergency/EmergencyList.aspx','PageHeaderFooter',10,'B6FBD6B6-F9A0-49B1-87F9-160748162131','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('28FDDA2C-E438-4417-8549-CCA1B3D67E7D','ABD84F93-A84E-448C-8A67-AB0FE4E8D10C','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('1EADB502-7AB9-472C-900D-826BF684069E','ABD84F93-A84E-448C-8A67-AB0FE4E8D10C','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('DC7DE20D-0EAE-4DF1-8D45-40C1AD5451F8','ABD84F93-A84E-448C-8A67-AB0FE4E8D10C','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('FF3A90B4-2263-44F4-B3A3-C5B578FEE5A5','ABD84F93-A84E-448C-8A67-AB0FE4E8D10C','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('CF5516F7-0735-44EF-9A6D-46FABF8EBC6E','应急演练开展情况','Emergency/DrillRecordList.aspx','PageHeaderFooter',20,'B6FBD6B6-F9A0-49B1-87F9-160748162131','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('CE534602-08CF-4A49-9F66-D23902677E5D','CF5516F7-0735-44EF-9A6D-46FABF8EBC6E','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('89EC8280-5C57-4076-81FD-35CF9A1C799B','CF5516F7-0735-44EF-9A6D-46FABF8EBC6E','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C3DA4353-8D2A-408B-9BA3-C6F7AE2AA33C','CF5516F7-0735-44EF-9A6D-46FABF8EBC6E','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4B3089B4-C126-49AC-AC14-4E7E4CF31950','CF5516F7-0735-44EF-9A6D-46FABF8EBC6E','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('39244F05-0D9E-4750-B12E-CEA5E11338A8','应急物资管理','Emergency/EmergencySupply.aspx','PageHeaderFooter',30,'B6FBD6B6-F9A0-49B1-87F9-160748162131','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('32CEB359-301B-4F02-8451-07FE45F0D474','39244F05-0D9E-4750-B12E-CEA5E11338A8','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('CA9135C5-19BD-4402-B210-891052FC56A5','39244F05-0D9E-4750-B12E-CEA5E11338A8','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E3C35DC2-EE74-41E2-936A-C2254386A512','39244F05-0D9E-4750-B12E-CEA5E11338A8','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E5F404B4-CA23-4D9A-BDDA-9181BA88B911','39244F05-0D9E-4750-B12E-CEA5E11338A8','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('6FDF9DAE-2161-4F67-931F-85DEAFC3842A','应急队伍与培训','Emergency/EmergencyTeamAndTrain.aspx','PageHeaderFooter',40,'B6FBD6B6-F9A0-49B1-87F9-160748162131','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C63AFB05-B64C-4A00-B0EB-B4148C923A26','6FDF9DAE-2161-4F67-931F-85DEAFC3842A','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8361533D-D2B8-4431-A17C-29F56EC87BD2','6FDF9DAE-2161-4F67-931F-85DEAFC3842A','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('9385B2ED-9659-4432-9348-F9230BF8D1BA','6FDF9DAE-2161-4F67-931F-85DEAFC3842A','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('26DF07A8-FAB0-4D2E-920F-AC9DCEED56A3','6FDF9DAE-2161-4F67-931F-85DEAFC3842A','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('A95A7C98-C186-4418-9C41-BD7775D85284','应急响应记录/评价','Emergency/EmergencyResponseRecord.aspx','PageHeaderFooter',50,'B6FBD6B6-F9A0-49B1-87F9-160748162131','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('74E0E879-540E-46C6-A7BB-ED5C237AE494','A95A7C98-C186-4418-9C41-BD7775D85284','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('25F97BA0-AD9A-4B6D-AC61-0DB48892A318','A95A7C98-C186-4418-9C41-BD7775D85284','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B119AB67-FE2E-4F02-A562-CD213568F1CD','A95A7C98-C186-4418-9C41-BD7775D85284','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8DDCEB71-82FB-4360-8605-AC134DF4D8F9','A95A7C98-C186-4418-9C41-BD7775D85284','保存',4)  
	GO

--HSSE奖惩管理
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('012DF857-AD6B-49AA-87A8-030CD5F66D4C','奖惩管理','','BookOpenMark',120,'0','Menu_Project',0,0)
GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('96F21A83-6871-4CC4-8901-1B99C376395C','奖励通知单','Check/IncentiveNotice.aspx','PageHeaderFooter',10,'012DF857-AD6B-49AA-87A8-030CD5F66D4C','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('0FDF4BFF-8755-4C6C-BCAF-A22C53267D43','96F21A83-6871-4CC4-8901-1B99C376395C','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E7D99772-0A33-4E39-82F4-D394B415D29D','96F21A83-6871-4CC4-8901-1B99C376395C','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F2E90028-5A5C-4D75-883D-6888D6C9ECA4','96F21A83-6871-4CC4-8901-1B99C376395C','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E0330B66-E969-48F3-84B4-883FEDF35E80','96F21A83-6871-4CC4-8901-1B99C376395C','保存',4)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D033B291-60AC-406A-B0C9-9191F1D8F803','96F21A83-6871-4CC4-8901-1B99C376395C','提交',5)
	GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('C13F1CE7-DAEF-4604-A13F-192621D28DF5','奖励统计','Check/IncentiveNoticeStatistics.aspx','PageHeaderFooter',15,'012DF857-AD6B-49AA-87A8-030CD5F66D4C','Menu_Project',1,0)
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('755F1C1D-2178-47D8-9F82-A501B53A2436','处罚通知单','Check/PunishNotice.aspx','PageHeaderFooter',20,'012DF857-AD6B-49AA-87A8-030CD5F66D4C','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('07049F09-0999-43E6-95EA-8A154564786A','755F1C1D-2178-47D8-9F82-A501B53A2436','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('33D6D309-F785-4F04-9E6A-07008A74F81F','755F1C1D-2178-47D8-9F82-A501B53A2436','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('970F4AF0-B796-482A-9172-162E4B8F00D3','755F1C1D-2178-47D8-9F82-A501B53A2436','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4FA97C34-6644-4441-A187-E0A14CFBFA3F','755F1C1D-2178-47D8-9F82-A501B53A2436','保存',4)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('9750F07F-70D6-4018-A909-29870CC11D99','755F1C1D-2178-47D8-9F82-A501B53A2436','提交',5)
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('CCD0E55B-300A-454B-8559-155ADAD386AE','处罚统计','Check/PunishNoticeStatistics.aspx','PageHeaderFooter',25,'012DF857-AD6B-49AA-87A8-030CD5F66D4C','Menu_Project',1,0)
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('06958288-96F4-4291-909A-FFC2FC76814D','违规人员记录','Check/ViolationPerson.aspx','PageHeaderFooter',30,'012DF857-AD6B-49AA-87A8-030CD5F66D4C','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B642CA4A-624D-4615-8F28-1350319B4501','06958288-96F4-4291-909A-FFC2FC76814D','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('971D2C56-DC18-45D4-A965-52BCA6A84C67','06958288-96F4-4291-909A-FFC2FC76814D','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('018C8801-B8EE-46DA-B175-375780870A88','06958288-96F4-4291-909A-FFC2FC76814D','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('778E76F1-1408-46FC-B1B1-B10FE7D28C7F','06958288-96F4-4291-909A-FFC2FC76814D','保存',4)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8859975D-1EBB-461A-BBE9-1AA280C60C66','06958288-96F4-4291-909A-FFC2FC76814D','提交',5)
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('9A034CAD-C7D5-4DE4-9FF5-828D35FFEE28','获奖证书或奖杯','Check/HSECertificate.aspx','PageHeaderFooter',40,'012DF857-AD6B-49AA-87A8-030CD5F66D4C','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('54DCA52C-03C1-47CC-9C1A-6BC0F16F7A20','9A034CAD-C7D5-4DE4-9FF5-828D35FFEE28','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('66FD8548-E74E-406B-856E-A63CB294ECB7','9A034CAD-C7D5-4DE4-9FF5-828D35FFEE28','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('0E8ADFA2-598A-4937-A08E-462F0A590BA5','9A034CAD-C7D5-4DE4-9FF5-828D35FFEE28','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B3ACC1D6-FCF2-4303-8CEF-A05B3CB0BF42','9A034CAD-C7D5-4DE4-9FF5-828D35FFEE28','保存',4)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A076E15F-6990-4BB2-9490-B5313FCA5599','9A034CAD-C7D5-4DE4-9FF5-828D35FFEE28','提交',5)
	GO

--HSSE会议管理
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('5309E7E0-395E-4F11-8F5E-D52E11526A2A','会议管理','','Note',130,'0','Menu_Project',0,0)
GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('5236B1D9-8B57-495E-8644-231DF5D066CE','安全周例会','Meeting/WeekMeeting.aspx','PageHeaderFooter',10,'5309E7E0-395E-4F11-8F5E-D52E11526A2A','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('77455435-6156-4EFF-8131-36ACAF4430D9','5236B1D9-8B57-495E-8644-231DF5D066CE','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('9E8B473C-07B0-4B67-B560-38C0C3E13EFA','5236B1D9-8B57-495E-8644-231DF5D066CE','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('038DC60A-6324-4F98-9FC7-80EBDF64787F','5236B1D9-8B57-495E-8644-231DF5D066CE','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('BC5ED99C-25B0-41AF-BEFC-6B714C3F418E','5236B1D9-8B57-495E-8644-231DF5D066CE','保存',4)  
	GO	

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('D5DD5EBD-A5F2-4A43-BA4C-E9A242B43684','安全月例会','Meeting/MonthMeeting.aspx','PageHeaderFooter',20,'5309E7E0-395E-4F11-8F5E-D52E11526A2A','Menu_Project',1,0)
	GO    
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('CB133FA1-9401-4A36-A358-4A92C69E9A42','D5DD5EBD-A5F2-4A43-BA4C-E9A242B43684','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7259B287-F411-4F7A-BE47-7A341078438A','D5DD5EBD-A5F2-4A43-BA4C-E9A242B43684','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('43834468-92BD-4979-8285-79C4A50C1869','D5DD5EBD-A5F2-4A43-BA4C-E9A242B43684','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('DFFD4D5D-E68D-4B5E-902F-7ED49F3DB791','D5DD5EBD-A5F2-4A43-BA4C-E9A242B43684','保存',4)  
	GO	

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('BB6CEC48-283B-46AD-BEDD-F964D261698F','安全专题会议','Meeting/SpecialMeeting.aspx','PageHeaderFooter',30,'5309E7E0-395E-4F11-8F5E-D52E11526A2A','Menu_Project',1,0)
	GO    
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D4EDFF26-F200-4F5A-A7BA-9318E4A7753C','BB6CEC48-283B-46AD-BEDD-F964D261698F','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('39643945-820C-4191-A76E-2EB754F0F022','BB6CEC48-283B-46AD-BEDD-F964D261698F','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4913D6DF-F6A0-4CA0-992F-BD58FDF58581','BB6CEC48-283B-46AD-BEDD-F964D261698F','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('AA99640E-CE3E-4E84-86A8-D9386BA8E684','BB6CEC48-283B-46AD-BEDD-F964D261698F','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('B2DA78EF-EECA-4AF4-9FAC-ECCFF1D6E459','其他会议记录','Meeting/AttendMeeting.aspx','PageHeaderFooter',40,'5309E7E0-395E-4F11-8F5E-D52E11526A2A','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A4FE0DE0-E102-406E-BB4B-986FD3A53D1B','B2DA78EF-EECA-4AF4-9FAC-ECCFF1D6E459','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F80141AA-D3C2-4551-A985-025A0DA92446','B2DA78EF-EECA-4AF4-9FAC-ECCFF1D6E459','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B1DACCF6-3ABC-4BAB-8254-405C6C79DAD9','B2DA78EF-EECA-4AF4-9FAC-ECCFF1D6E459','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D78E5486-9DD6-4AFF-BB02-3494FFFF4A87','B2DA78EF-EECA-4AF4-9FAC-ECCFF1D6E459','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('F8ADCDBC-AAAD-4884-9935-2B63562E4779','班前会','Meeting/ClassMeeting.aspx','PageHeaderFooter',50,'5309E7E0-395E-4F11-8F5E-D52E11526A2A','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('CFDD3B46-660C-4B48-9365-3D3A2817CBA6','F8ADCDBC-AAAD-4884-9935-2B63562E4779','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E2DE875F-3C1F-4E13-A7AB-1AE0324F8FD9','F8ADCDBC-AAAD-4884-9935-2B63562E4779','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('9232B14D-82F9-463C-BE43-4C135A19739C','F8ADCDBC-AAAD-4884-9935-2B63562E4779','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('CCDAF139-FA43-4C52-960C-CFB9588C9BBF','F8ADCDBC-AAAD-4884-9935-2B63562E4779','保存',4)  
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

--出入场管理
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('28C8EDB9-F1C2-4287-8013-28A976B093E2','出入场管理','','Lorry',140,'0','Menu_Project',0,0)
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('3E167389-4775-4AC3-9D31-2E570682EDA1','特种设备机具入场报批','InApproveManager/EquipmentIn.aspx','PageHeaderFooter',10,'28C8EDB9-F1C2-4287-8013-28A976B093E2','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('85B3B62B-D378-42BC-A278-D5D1DE073115','3E167389-4775-4AC3-9D31-2E570682EDA1','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('EB243F5C-35B4-46A7-A66F-F6B7A315BA40','3E167389-4775-4AC3-9D31-2E570682EDA1','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('16A221DC-2B81-4907-8AFE-39FEC237B921','3E167389-4775-4AC3-9D31-2E570682EDA1','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B8A95E03-9F4B-4D92-935E-795443E14701','3E167389-4775-4AC3-9D31-2E570682EDA1','保存',4)  
GO 

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('A4832598-E3D4-4906-88E5-A3886A85FC5A','特种设备机具出场报批','InApproveManager/EquipmentOut.aspx','PageHeaderFooter',20,'28C8EDB9-F1C2-4287-8013-28A976B093E2','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('C503E998-44A0-4DCF-8B19-01448419FC13','A4832598-E3D4-4906-88E5-A3886A85FC5A','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('1E3BF89F-635F-4987-A05C-58DDDEAF301C','A4832598-E3D4-4906-88E5-A3886A85FC5A','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('5D3267B9-BF36-427E-A893-9ECF0A3B2830','A4832598-E3D4-4906-88E5-A3886A85FC5A','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('28CA31BF-7EAE-4F44-9EED-1EE2139C9B54','A4832598-E3D4-4906-88E5-A3886A85FC5A','保存',4)  
GO	

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('06EA1483-7397-46DD-818D-56911EA7B679','一般设备机具入场报批','InApproveManager/GeneralEquipmentIn.aspx','PageHeaderFooter',30,'28C8EDB9-F1C2-4287-8013-28A976B093E2','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('C6A8945B-AFF2-43E6-B412-D80367B85B9C','06EA1483-7397-46DD-818D-56911EA7B679','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('50A67759-CBF4-465B-9E15-4517C23C0336','06EA1483-7397-46DD-818D-56911EA7B679','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('839C2465-B2FB-42F1-A769-9B67CF588F89','06EA1483-7397-46DD-818D-56911EA7B679','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4212958D-6D4F-40F2-9954-D980A21D6E6C','06EA1483-7397-46DD-818D-56911EA7B679','保存',4)  
GO	

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('56F241A9-0AA3-4EDB-8C5C-999C487C06DA','一般设备机具出场报批','InApproveManager/GeneralEquipmentOut.aspx','PageHeaderFooter',40,'28C8EDB9-F1C2-4287-8013-28A976B093E2','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('E86AE4C7-BB30-4D86-A4C8-5684874D3697','56F241A9-0AA3-4EDB-8C5C-999C487C06DA','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('2FE7ED63-BCFA-4327-93B9-1326950D6B16','56F241A9-0AA3-4EDB-8C5C-999C487C06DA','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('041ECA92-BE18-4624-AB35-5619B840A577','56F241A9-0AA3-4EDB-8C5C-999C487C06DA','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('BD5800BE-EA75-40FE-9567-76613F208E66','56F241A9-0AA3-4EDB-8C5C-999C487C06DA','保存',4)  
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('32CA471B-86FD-420F-8DAA-FF16B5BEBBB4','普通货物入场报批','InApproveManager/GoodsIn.aspx','PageHeaderFooter',50,'28C8EDB9-F1C2-4287-8013-28A976B093E2','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('6A9EAFC9-7626-4630-8014-1EF3B3077527','32CA471B-86FD-420F-8DAA-FF16B5BEBBB4','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('ED6FDFE6-E677-4414-BFD8-45866BC660F1','32CA471B-86FD-420F-8DAA-FF16B5BEBBB4','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('42899F5F-F078-4710-B301-C8A5ECF42AF9','32CA471B-86FD-420F-8DAA-FF16B5BEBBB4','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('869A0353-666C-4F9E-9723-90C0F498BC75','32CA471B-86FD-420F-8DAA-FF16B5BEBBB4','保存',4)  
GO	

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('ADD37E84-923C-4AFA-BE37-670B40ABF0F7','普通货物出场报批','InApproveManager/GoodsOut.aspx','PageHeaderFooter',60,'28C8EDB9-F1C2-4287-8013-28A976B093E2','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('977D27CA-D7CD-4A04-9481-1864123C0B4B','ADD37E84-923C-4AFA-BE37-670B40ABF0F7','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('A6B6C7AB-BECB-491C-BC2D-62B6BAA64F0F','ADD37E84-923C-4AFA-BE37-670B40ABF0F7','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('BD3067C2-0559-4C65-BE5A-5BD0C4CF1A58','ADD37E84-923C-4AFA-BE37-670B40ABF0F7','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('645BD3A4-22A8-4F1E-B094-51D81455483C','ADD37E84-923C-4AFA-BE37-670B40ABF0F7','保存',4)  
GO	

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('33327576-D346-45C9-9C97-805EB0C92EF2','气瓶入场报批','InApproveManager/GasCylinderIn.aspx','PageHeaderFooter',70,'28C8EDB9-F1C2-4287-8013-28A976B093E2','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('A68CCC70-026F-4A52-B365-8F8D654E2F15','33327576-D346-45C9-9C97-805EB0C92EF2','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('D24B9B12-299D-477A-B57C-61AF9F4F08E1','33327576-D346-45C9-9C97-805EB0C92EF2','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('7050B94F-52E9-40B5-9964-760BFA18C631','33327576-D346-45C9-9C97-805EB0C92EF2','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('512EF58A-96CA-410F-BB21-88CDC6608A3C','33327576-D346-45C9-9C97-805EB0C92EF2','保存',4)  
GO	

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('CB107947-AE48-466B-87F5-58BCA72FE1AC','气瓶出场报批','InApproveManager/GasCylinderOut.aspx','PageHeaderFooter',80,'28C8EDB9-F1C2-4287-8013-28A976B093E2','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('39EF2DC0-8689-41DB-9683-1682C2B28054','CB107947-AE48-466B-87F5-58BCA72FE1AC','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('830CA3F1-C7CA-4CE2-B12B-ECC8D5197A6B','CB107947-AE48-466B-87F5-58BCA72FE1AC','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('D3C434EC-37C6-4F42-8D77-72E6FFFF7125','CB107947-AE48-466B-87F5-58BCA72FE1AC','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('3CF445A3-3003-413B-86F8-CA5C806F549C','CB107947-AE48-466B-87F5-58BCA72FE1AC','保存',4)  
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('3D12E3FD-5AC3-485A-A39F-08689234450A','特种车辆入场审批','InApproveManager/CarIn.aspx','PageHeaderFooter',90,'28C8EDB9-F1C2-4287-8013-28A976B093E2','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('AF3D8188-B817-429E-B9E6-807527F6F004','3D12E3FD-5AC3-485A-A39F-08689234450A','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('FB11FA41-CADA-4A9D-A205-D74E4D4E1F0A','3D12E3FD-5AC3-485A-A39F-08689234450A','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('0A859E9B-D7CE-42DC-BC26-B1FC02E7924E','3D12E3FD-5AC3-485A-A39F-08689234450A','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('28315376-2375-491F-A5E9-236090F2F785','3D12E3FD-5AC3-485A-A39F-08689234450A','保存',4)  
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('7087F8BB-DC8C-4A77-8E16-232E0B8481D2','普通车辆入场审批','InApproveManager/GeneralCarIn.aspx','PageHeaderFooter',100,'28C8EDB9-F1C2-4287-8013-28A976B093E2','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('95B995A6-3BCA-4FB3-81C6-C455B097A506','7087F8BB-DC8C-4A77-8E16-232E0B8481D2','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('5C8CD641-66AC-4086-BE27-E535737B1F03','7087F8BB-DC8C-4A77-8E16-232E0B8481D2','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('AF3E29F1-7580-4718-A5EF-27FEA23F2243','7087F8BB-DC8C-4A77-8E16-232E0B8481D2','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('49E98181-2E69-4663-9A20-D699477F617F','7087F8BB-DC8C-4A77-8E16-232E0B8481D2','保存',4)  
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('42E7E869-67EA-446E-A910-BE7BF95EDC00','特种设备审批','InApproveManager/EquipmentQualityIn.aspx','PageHeaderFooter',110,'28C8EDB9-F1C2-4287-8013-28A976B093E2','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('D35987BA-9D37-4CA7-AC4F-350FD15EF6B9','42E7E869-67EA-446E-A910-BE7BF95EDC00','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('BE0A5298-DF4C-4454-B6D2-50DEF46F83EB','42E7E869-67EA-446E-A910-BE7BF95EDC00','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('DCC7BFD0-DBA8-4B85-A88A-E4176C453D24','42E7E869-67EA-446E-A910-BE7BF95EDC00','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('03A9C846-A809-453C-9749-361E0255D5E2','42E7E869-67EA-446E-A910-BE7BF95EDC00','保存',4)  
GO

--HSSE费用/物资管理
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('20ECB69E-28C4-4FAC-941A-15F446AEB634','安全投入费用','','ApplicationViewTile',150,'0','Menu_Project',0,0)
GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('EEE7CBBE-2EFB-4D64-96A6-A932E20FF9DB','安全费用计划','CostGoods/Expense.aspx','PageHeaderFooter',10,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C368F473-C4F7-49C6-820F-BD2024530192','EEE7CBBE-2EFB-4D64-96A6-A932E20FF9DB','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B6263049-6D9D-4276-ADA3-91696C6EE10E','EEE7CBBE-2EFB-4D64-96A6-A932E20FF9DB','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D394F252-4342-4B22-B38C-77446D847CC7','EEE7CBBE-2EFB-4D64-96A6-A932E20FF9DB','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7FB0D534-15CB-4D44-B076-07A1CEA2F945','EEE7CBBE-2EFB-4D64-96A6-A932E20FF9DB','保存',4) 
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7CAEBE24-F058-4A49-B984-771BE5C5D91A','EEE7CBBE-2EFB-4D64-96A6-A932E20FF9DB','提交',5)   
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('0C311396-C859-40B0-9D72-6A8B20733002','安全费用支出','CostGoods/CostSmallDetail.aspx','PageHeaderFooter',20,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('0350BD71-7C72-4483-90E3-A89908174FAA','0C311396-C859-40B0-9D72-6A8B20733002','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('67B1ED33-136C-4554-B21A-D11436E57A0E','0C311396-C859-40B0-9D72-6A8B20733002','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('CA54078C-F2EF-4C88-B222-8CA9A2FF6BD4','0C311396-C859-40B0-9D72-6A8B20733002','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('349D7D73-668D-4DC5-9087-DD5E5D1A1CBB','0C311396-C859-40B0-9D72-6A8B20733002','保存',4) 
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('9BF12C2D-6A82-4B5E-A358-AA2FED75A925','0C311396-C859-40B0-9D72-6A8B20733002','提交',5)   
	GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId, MenuName, Url, Icon, SortIndex, SuperMenu, MenuType, IsEnd, IsUnit)
	VALUES('6FBF4B7D-21D2-4013-9465-12AC093109D4','HSE措施费使用计划','CostGoods/MeasuresPlan.aspx','PageHeaderFooter',21,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId, MenuId, ButtonName, SortIndex)
	VALUES('EC539E34-1408-4DF4-913F-F4661C476434','6FBF4B7D-21D2-4013-9465-12AC093109D4','增加',1)	
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId, MenuId, ButtonName, SortIndex)
	VALUES('D6E4AA9A-D4AE-410C-AB1F-0DF6DB409701','6FBF4B7D-21D2-4013-9465-12AC093109D4','修改',2)   
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId, MenuId, ButtonName, SortIndex)
	VALUES('DE0207C7-825B-483A-AAC0-3A9776220513','6FBF4B7D-21D2-4013-9465-12AC093109D4','删除',3)   
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId, MenuId, ButtonName, SortIndex)
	VALUES('D7E08A31-95C4-4DA1-8FDB-3F66D5390777','6FBF4B7D-21D2-4013-9465-12AC093109D4','保存',4)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('FF68C697-B058-4687-A98F-71C591650E02','分包商HSE费用申请','CostGoods/CostManage.aspx','PageHeaderFooter',30,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('878A7D17-D5DC-42DB-9C15-8613C31ADEBF','FF68C697-B058-4687-A98F-71C591650E02','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('2A95169C-D5C4-4D52-A8FF-6F7CC5451B04','FF68C697-B058-4687-A98F-71C591650E02','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('91187156-F1DE-4471-8BE7-95C476255F2F','FF68C697-B058-4687-A98F-71C591650E02','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B5B94794-863E-4E0D-85E9-86665479CFBD','FF68C697-B058-4687-A98F-71C591650E02','保存',4) 
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('26B751C0-3CD6-49EA-B1DD-FB0BC2FDEA88','FF68C697-B058-4687-A98F-71C591650E02','提交',5)   
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('E7B8059B-304B-47C6-90C8-D88E4A3EC506','分包商HSE费用投入登记','CostGoods/SubPayRegistration.aspx','PageHeaderFooter',31,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('0E064349-CE84-4596-87EE-912EA5C55B7D','E7B8059B-304B-47C6-90C8-D88E4A3EC506','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C57DEBB1-373A-4579-8F29-981764DED690','E7B8059B-304B-47C6-90C8-D88E4A3EC506','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6662F95E-5C87-476A-A499-CE1B159B598A','E7B8059B-304B-47C6-90C8-D88E4A3EC506','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('171791EF-348B-43A8-AF12-96D5B576FDE0','E7B8059B-304B-47C6-90C8-D88E4A3EC506','保存',4) 
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId, MenuName, Url, Icon, SortIndex, SuperMenu, MenuType, IsEnd, IsUnit)
	VALUES('9EFF1A0F-87AA-43E7-83B0-79EEAAC8848E','HSE费用投入登记','CostGoods/PayRegistration.aspx','PageHeaderFooter',35,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId, MenuId, ButtonName, SortIndex)
	VALUES('79C89EF4-1AF3-4988-AD14-34FDC37B664D','9EFF1A0F-87AA-43E7-83B0-79EEAAC8848E','增加',1)	
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId, MenuId, ButtonName, SortIndex)
	VALUES('09BC266D-B0C8-4C66-A388-9CAADCF6BB66','9EFF1A0F-87AA-43E7-83B0-79EEAAC8848E','修改',2)   
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId, MenuId, ButtonName, SortIndex)
	VALUES('5C8792E2-0C7E-4F40-A556-F363D5EB54EE','9EFF1A0F-87AA-43E7-83B0-79EEAAC8848E','删除',3)   
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId, MenuId, ButtonName, SortIndex)
	VALUES('03F0E7F1-0CC6-4B12-BB6F-865C0A1930CD','9EFF1A0F-87AA-43E7-83B0-79EEAAC8848E','保存',4)
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('19C1370F-92C0-4E31-87B4-8BADA74113E4','合同HSE费用及支付台账','CostGoods/CostLedger.aspx','PageHeaderFooter',40,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
	GO
	
	--INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	--VALUES('89B42B7B-8AEE-4199-923E-81A602FC77E0','费用统计表','CostGoods/TC_Cost.aspx','PageHeaderFooter',50,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
	--GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('6488F005-95F2-4D49-BC95-6DF4C9B23F3D','安全分包费用','CostGoods/HSSECostUnitManage.aspx','PageHeaderFooter',50,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E5B144D5-6639-4731-A8BA-DC7A487121E6','6488F005-95F2-4D49-BC95-6DF4C9B23F3D','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('0AB9AF31-C9DC-4038-8904-F25FB31151DB','6488F005-95F2-4D49-BC95-6DF4C9B23F3D','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('ACB91DFF-0D6B-48DF-BE59-D3641ACE2362','6488F005-95F2-4D49-BC95-6DF4C9B23F3D','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('129B8962-3BE2-40E9-B128-903DA4C9179D','6488F005-95F2-4D49-BC95-6DF4C9B23F3D','保存',4) 
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('50D2EFBF-90A8-47A5-AFF5-C4F338B72406','6488F005-95F2-4D49-BC95-6DF4C9B23F3D','提交',5)   
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('0051CA27-83A3-4CAD-8A0B-64C4DFE3944C','安全分包费用审核','CostGoods/HSSECostUnitManageAudit.aspx','PageHeaderFooter',51,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
	GO	
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6F64145E-CF76-4FD9-B10C-CB27B74206EB','0051CA27-83A3-4CAD-8A0B-64C4DFE3944C','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('637B5344-DDE3-4492-BB33-E6BB2CCB1457','0051CA27-83A3-4CAD-8A0B-64C4DFE3944C','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('0534D52C-6F4C-4D10-A2A5-546C54CD3847','0051CA27-83A3-4CAD-8A0B-64C4DFE3944C','保存',4) 
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('5C56F122-7542-4923-BDAD-2805ACB60513','0051CA27-83A3-4CAD-8A0B-64C4DFE3944C','提交',5)   
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('8B71C8C4-0738-4D5F-8916-57FF3197709C','安全分包费用核定','CostGoods/HSSECostUnitManageRatified.aspx','PageHeaderFooter',52,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
	GO	
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('CAFA7B39-EAC9-4598-9D25-C323C2B81F30','8B71C8C4-0738-4D5F-8916-57FF3197709C','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A9638340-852D-4228-B549-84AE906DF974','8B71C8C4-0738-4D5F-8916-57FF3197709C','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B195229D-E533-4CDA-AD59-38FEB98C3773','8B71C8C4-0738-4D5F-8916-57FF3197709C','保存',4) 
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7589C50B-1676-4208-866F-2624CC3D949A','8B71C8C4-0738-4D5F-8916-57FF3197709C','提交',5)   
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('5C74F09D-FDE3-4995-A1D6-0549A8693940','安全费用管理','CostGoods/HSSECostManage.aspx','PageHeaderFooter',60,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B6F8D78C-C271-4BA4-B044-9E567C748CEE','5C74F09D-FDE3-4995-A1D6-0549A8693940','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('BF875EF6-EC0C-4DCB-B7B2-5D7D40D1E195','5C74F09D-FDE3-4995-A1D6-0549A8693940','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('9340F799-A674-4C0D-969F-F04B90BA8B2D','5C74F09D-FDE3-4995-A1D6-0549A8693940','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('191F3862-3DAE-4350-B6A0-C27ADD1FB429','5C74F09D-FDE3-4995-A1D6-0549A8693940','保存',4) 
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('AFF74053-B165-4D4A-BD26-2898DBD8264D','5C74F09D-FDE3-4995-A1D6-0549A8693940','提交',5)   
	GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('E0B25140-82DF-43EB-9A76-6D56C128E41D','安全物资管理','','TableMultiple',155,'0','Menu_Project',0,0)
GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('3DC61C8A-7C54-49E0-96C4-DED9CC6BFD0B','HSSE物资管理','CostGoods/GoodsManage.aspx','PageHeaderFooter',40,'E0B25140-82DF-43EB-9A76-6D56C128E41D','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4D9C8163-E201-463A-9394-267496723221','3DC61C8A-7C54-49E0-96C4-DED9CC6BFD0B','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('858F4F39-367B-4EA2-9DD6-AEDEB11FE9E8','3DC61C8A-7C54-49E0-96C4-DED9CC6BFD0B','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F2123566-2D4D-487F-A7DC-836AAC5153DC','3DC61C8A-7C54-49E0-96C4-DED9CC6BFD0B','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C1D1B607-5D79-417E-80C7-987F16819920','3DC61C8A-7C54-49E0-96C4-DED9CC6BFD0B','保存',4) 
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('9DE31C54-E656-433F-966C-BF355AB91592','3DC61C8A-7C54-49E0-96C4-DED9CC6BFD0B','提交',5)   
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('FDA02FCA-4E23-469E-AB26-2D625D0E579A','物资入库管理','CostGoods/GoodsIn.aspx','PageHeaderFooter',50,'E0B25140-82DF-43EB-9A76-6D56C128E41D','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('0B2B7816-5987-46F2-8B3F-E89D5B2BD7BF','FDA02FCA-4E23-469E-AB26-2D625D0E579A','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('81BCD7ED-0752-48B7-BA73-30838DF6B98F','FDA02FCA-4E23-469E-AB26-2D625D0E579A','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D67421A0-D591-447A-A602-45B7FC67D66F','FDA02FCA-4E23-469E-AB26-2D625D0E579A','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('13F33D1D-0AC5-404C-B079-6E7F2B8CBB64','FDA02FCA-4E23-469E-AB26-2D625D0E579A','保存',4) 
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('528FA5D6-C55A-4BB5-8C28-7225F16B6D4F','FDA02FCA-4E23-469E-AB26-2D625D0E579A','提交',5)   
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('881D6FE5-C281-4DA8-80CD-D7C6624796FC','物资出库管理','CostGoods/GoodsOut.aspx','PageHeaderFooter',60,'E0B25140-82DF-43EB-9A76-6D56C128E41D','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('74FB4EC9-D61F-4EBB-93EB-04F27E6D0476','881D6FE5-C281-4DA8-80CD-D7C6624796FC','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('ECB547F9-3F8B-4B54-A71B-133E765DD010','881D6FE5-C281-4DA8-80CD-D7C6624796FC','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('952DF543-D907-4BD9-A9E6-6A050E12EC12','881D6FE5-C281-4DA8-80CD-D7C6624796FC','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6BE41F7C-B1A3-4284-AF7E-5080016D1AF1','881D6FE5-C281-4DA8-80CD-D7C6624796FC','保存',4) 
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('32D54C92-F05A-47A5-93E4-4845D7C5E2A7','881D6FE5-C281-4DA8-80CD-D7C6624796FC','提交',5)   
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('B97B1C46-25B0-477B-9925-B6AB1D45204E','物资库存管理','CostGoods/GoodsStock.aspx','PageHeaderFooter',70,'E0B25140-82DF-43EB-9A76-6D56C128E41D','Menu_Project',1,0)
	GO

--HSSE行政管理
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('D58B9DEC-A09B-45B0-BD54-18592119BB49','行政管理','','Box',160,'0','Menu_Project',0,0)
GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('A25EB19A-F06E-4AAF-A589-E2B8F7FA7857','行政管理检查记录','Administrative/ManageCheck.aspx','PageHeaderFooter',20,'D58B9DEC-A09B-45B0-BD54-18592119BB49','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('1F103E6A-BDC9-4BA2-AB82-8517B4C20979','A25EB19A-F06E-4AAF-A589-E2B8F7FA7857','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E3B23AC9-9B8B-434A-8530-49251960C4AA','A25EB19A-F06E-4AAF-A589-E2B8F7FA7857','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('289ED7E9-7F60-480C-BA53-B2245C1B8B0E','A25EB19A-F06E-4AAF-A589-E2B8F7FA7857','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('083AD74F-B58C-4D28-942E-AEA0BE5A40B9','A25EB19A-F06E-4AAF-A589-E2B8F7FA7857','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('CF82805A-84BE-400A-B939-83F7612D76F5','现场车辆管理','Administrative/CarManager.aspx','PageHeaderFooter',30,'D58B9DEC-A09B-45B0-BD54-18592119BB49','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D7C5D93D-7D14-4D50-9C7C-0B02C24D24DF','CF82805A-84BE-400A-B939-83F7612D76F5','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('AF6C9207-27AF-4AB7-A4F5-8B4550EA3252','CF82805A-84BE-400A-B939-83F7612D76F5','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6396C01E-600C-456B-B5E9-D0DBA6882729','CF82805A-84BE-400A-B939-83F7612D76F5','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('067BBC0B-19C4-40AB-A8D8-02F655DF45CF','CF82805A-84BE-400A-B939-83F7612D76F5','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('754C23CA-F1BC-4F44-9D34-B185099EDCA0','现场驾驶员管理','Administrative/DriverManager.aspx','PageHeaderFooter',40,'D58B9DEC-A09B-45B0-BD54-18592119BB49','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('DCEA3B66-5828-4073-851E-FD45F39952AF','754C23CA-F1BC-4F44-9D34-B185099EDCA0','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8A6AAAB7-7A14-49D5-BD94-F014AD0F90DB','754C23CA-F1BC-4F44-9D34-B185099EDCA0','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('5D30DE59-0D5E-4829-A2D7-2DF952460134','754C23CA-F1BC-4F44-9D34-B185099EDCA0','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A1E399A7-7E19-4E7E-B38C-789F01C2B817','754C23CA-F1BC-4F44-9D34-B185099EDCA0','保存',4)  
	GO

	--INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	--VALUES('D55ACBCB-DE1C-4180-BA7D-3353C51D2B5F','职业健康管理','Administrative/HealthManage.aspx','PageHeaderFooter',40,'D58B9DEC-A09B-45B0-BD54-18592119BB49','Menu_Project',1,0)
	--GO
	--INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	--VALUES('09983E9C-C2D5-4692-9F52-1974C58DDE48','D55ACBCB-DE1C-4180-BA7D-3353C51D2B5F','增加',1)
	--INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	--VALUES('F6635AC8-DAB6-4638-AFDB-E7DCD18312E2','D55ACBCB-DE1C-4180-BA7D-3353C51D2B5F','修改',2)
	--INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	--VALUES('A7E6E939-4DF4-4FAE-B603-5B86FB4E6EC7','D55ACBCB-DE1C-4180-BA7D-3353C51D2B5F','删除',3)
	--INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	--VALUES('254263A6-C4AB-48FC-BCC7-85376AD7F4CE','D55ACBCB-DE1C-4180-BA7D-3353C51D2B5F','保存',4)  
	--GO

--项目级
--职业健康
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('7788B48E-8D80-4B22-BBD5-6192758E5DFC','职业健康','','FolderHeart',170,'0','Menu_Project',0,0)
GO
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('DD5E76FC-C45E-4F4F-8889-A2F4703F93DD','危害检测','OccupationHealth/HazardDetection.aspx','Page',10,'7788B48E-8D80-4B22-BBD5-6192758E5DFC','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B7F71812-D9D6-4DD6-975C-381ADEF825D1','DD5E76FC-C45E-4F4F-8889-A2F4703F93DD','增加',1)	
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('2455D74E-BB30-4F0E-9460-F95A7D53929A','DD5E76FC-C45E-4F4F-8889-A2F4703F93DD','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B104BB11-EFEF-43CC-B2BE-BB9D12345243','DD5E76FC-C45E-4F4F-8889-A2F4703F93DD','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('DCF32909-0765-42CF-ADE3-9FB844A40097','DD5E76FC-C45E-4F4F-8889-A2F4703F93DD','保存',4)
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('9EACCED2-B646-489C-84AD-1C22066F00AE','体检管理','OccupationHealth/PhysicalExamination.aspx','Page',20,'7788B48E-8D80-4B22-BBD5-6192758E5DFC','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('9595FF45-61B3-4FC1-96E0-49A624089637','9EACCED2-B646-489C-84AD-1C22066F00AE','增加',1)	
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('2478C56C-16B0-4579-A656-8E066361514F','9EACCED2-B646-489C-84AD-1C22066F00AE','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('8A0464D8-A4FB-47FD-9257-86DC72D35DD9','9EACCED2-B646-489C-84AD-1C22066F00AE','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('942F3C5F-428C-4536-8778-6010664D8A53','9EACCED2-B646-489C-84AD-1C22066F00AE','保存',4)
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('775B77C0-E28D-4746-BCFE-F3E927D515A8','职业病事故','OccupationHealth/OccupationalDiseaseAccident.aspx','Page',30,'7788B48E-8D80-4B22-BBD5-6192758E5DFC','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('D9E0A839-F01B-4641-AE27-385578A66E1C','775B77C0-E28D-4746-BCFE-F3E927D515A8','增加',1)	
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('149F44E5-FB3F-4C22-A2F3-33E47BA91D28','775B77C0-E28D-4746-BCFE-F3E927D515A8','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('6EF40206-9C48-41EF-8E20-659B5DECFCB9','775B77C0-E28D-4746-BCFE-F3E927D515A8','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('A88ECE6C-4AFB-4832-BE7C-53D2A5F80C36','775B77C0-E28D-4746-BCFE-F3E927D515A8','保存',4)
GO

--环境保护
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('E765DADB-B7BF-4F01-AFBC-F20E9D2F62D6','环境保护','','BoxWorld',180,'0','Menu_Project',0,0)
GO
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('342B5DEA-ECE1-46A4-BAA6-F0DB5276C769','环境监测数据','Environmental/EnvironmentalMonitoring.aspx','Page',10,'E765DADB-B7BF-4F01-AFBC-F20E9D2F62D6','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('E0F5132F-CB5A-47CA-BFD9-2F80A3E3D9C6','342B5DEA-ECE1-46A4-BAA6-F0DB5276C769','增加',1)	
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B17FB170-149F-45B1-A2A2-24E788602374','342B5DEA-ECE1-46A4-BAA6-F0DB5276C769','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('FFE6A55A-69F6-4578-A148-56526B339042','342B5DEA-ECE1-46A4-BAA6-F0DB5276C769','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('D6DEB64C-C1F4-4122-B1CC-3E86CF39FAD5','342B5DEA-ECE1-46A4-BAA6-F0DB5276C769','保存',4)
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('74F23370-56D8-426E-822D-5E367F620546','突发环境事件','Environmental/UnexpectedEnvironmental.aspx','Page',20,'E765DADB-B7BF-4F01-AFBC-F20E9D2F62D6','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('A3FBCEF7-D4B7-4127-BD6B-2367ABF944A1','74F23370-56D8-426E-822D-5E367F620546','增加',1)	
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('940C46FA-AB77-4AF4-9CB0-7AAA2F7049BC','74F23370-56D8-426E-822D-5E367F620546','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('D59FF325-1B4F-4A93-8854-074441E69961','74F23370-56D8-426E-822D-5E367F620546','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('6786D599-DA01-4025-A8A1-018DAAC4E9F6','74F23370-56D8-426E-822D-5E367F620546','保存',4)
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('3EF6E488-21D2-47BB-AA33-4FB0E9FED606','环境事件应急预案','Environmental/EnvironmentalEmergencyPlan.aspx','Page',30,'E765DADB-B7BF-4F01-AFBC-F20E9D2F62D6','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B65B2953-0F27-408F-B94A-49631445549E','3EF6E488-21D2-47BB-AA33-4FB0E9FED606','增加',1)	
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('AEABF8CE-EC73-47A0-B5AD-4CC0EA239496','3EF6E488-21D2-47BB-AA33-4FB0E9FED606','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('D00C1A62-C6BF-45A3-B33C-CB4A5350B0DB','3EF6E488-21D2-47BB-AA33-4FB0E9FED606','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4DC85196-3453-4219-B664-EB5DF781E10E','3EF6E488-21D2-47BB-AA33-4FB0E9FED606','保存',4)
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('97DCAFD1-DDA5-48B4-8E2D-E82702BA899B','环评报告','Environmental/EIAReport.aspx','Page',40,'E765DADB-B7BF-4F01-AFBC-F20E9D2F62D6','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('CB718586-6C3E-499F-BE88-12C6DC8637BE','97DCAFD1-DDA5-48B4-8E2D-E82702BA899B','增加',1)	
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('651E9DDA-D5C3-4E2D-9D68-039EE3EE3A34','97DCAFD1-DDA5-48B4-8E2D-E82702BA899B','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('ACE9BB27-BCA0-4821-BFEF-70C6F1468994','97DCAFD1-DDA5-48B4-8E2D-E82702BA899B','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('92DBFF3D-2E9B-4E56-8CEC-3F61C9498782','97DCAFD1-DDA5-48B4-8E2D-E82702BA899B','保存',4)
GO

--HSSE事故处理/预防
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('0ED3E0CC-75E0-4FF3-8832-067217A6CD4D','事故处理/预防','','FolderBell',190,'0','Menu_Project',0,0)
GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('FB5C66FF-3BFB-490F-A14F-0DD5B5A4D110','HSSE事故(对人员)记录','Accident/AccidentPersonRecord.aspx','PageHeaderFooter',10,'0ED3E0CC-75E0-4FF3-8832-067217A6CD4D','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E8204BF3-A11E-49DF-9050-FD139A2066D3','FB5C66FF-3BFB-490F-A14F-0DD5B5A4D110','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('2DDE148E-7D2C-4B69-95E6-75EB2CECA230','FB5C66FF-3BFB-490F-A14F-0DD5B5A4D110','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('FB49FA6C-E86A-42BF-8817-26E75723F2FC','FB5C66FF-3BFB-490F-A14F-0DD5B5A4D110','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('CEA44626-51B3-40F6-B807-01AFDCE28B71','FB5C66FF-3BFB-490F-A14F-0DD5B5A4D110','保存',4)  
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('51F01F76-CBD6-45C1-934A-8704D1AF9D58','FB5C66FF-3BFB-490F-A14F-0DD5B5A4D110','提交',5)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('9A9D6805-6C98-46E4-943E-130C4A3EB9A2','HSSE事故(含未遂)处理','Accident/AccidentHandle.aspx','PageHeaderFooter',20,'0ED3E0CC-75E0-4FF3-8832-067217A6CD4D','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C49EFDD8-919B-46F0-A63E-6E1F776D3902','9A9D6805-6C98-46E4-943E-130C4A3EB9A2','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7774BEF9-F68C-498A-822B-DD3062C62E0C','9A9D6805-6C98-46E4-943E-130C4A3EB9A2','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E2E12CCE-D650-42C5-9FDB-E1E97F54CBF1','9A9D6805-6C98-46E4-943E-130C4A3EB9A2','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E42F293A-10E0-42E6-AF66-45C192B06E0E','9A9D6805-6C98-46E4-943E-130C4A3EB9A2','保存',4)  
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('84708579-1EE9-415C-AEB2-B317F3CE2B07','9A9D6805-6C98-46E4-943E-130C4A3EB9A2','提交',5)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('27C681E5-135A-414F-9FC2-D86D27805E6A','事故报告登记','Accident/AccidentReport.aspx','PageHeaderFooter',30,'0ED3E0CC-75E0-4FF3-8832-067217A6CD4D','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C7B30F1A-6CE6-42BB-887B-B9457C7E6A50','27C681E5-135A-414F-9FC2-D86D27805E6A','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('12A1CA23-3B7F-41A3-A61C-181F64B78841','27C681E5-135A-414F-9FC2-D86D27805E6A','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('94F2E0EC-6174-401A-8ADB-1D52EAB040B0','27C681E5-135A-414F-9FC2-D86D27805E6A','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('BD8FD190-7CE8-468B-B097-E455F5165040','27C681E5-135A-414F-9FC2-D86D27805E6A','保存',4)  
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('AC53A3B3-0FB2-40F5-B83B-6A1B345745A1','27C681E5-135A-414F-9FC2-D86D27805E6A','提交',5)  
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

--HSSE绩效评价管理
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('D3576E49-DBC9-43EA-9822-EA5F4D96CA24','绩效评价管理','','ScriptEdit',200,'0','Menu_Project',0,0)
GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('EED8DBEE-83F6-4B5B-8382-AF40EB66B0A9','分包方绩效评价','Perfomance/PerfomanceRecord.aspx','PageHeaderFooter',10,'D3576E49-DBC9-43EA-9822-EA5F4D96CA24','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('601D264A-73B3-42C1-94E0-28F02B46A18C','EED8DBEE-83F6-4B5B-8382-AF40EB66B0A9','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('41AF7AEF-DB32-4E40-B735-F27E8CEDEF9A','EED8DBEE-83F6-4B5B-8382-AF40EB66B0A9','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('CC24B490-8FFE-443E-B814-44D172FA51B3','EED8DBEE-83F6-4B5B-8382-AF40EB66B0A9','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D0054B40-5E49-4587-8DDE-6D3E9CF8E8F8','EED8DBEE-83F6-4B5B-8382-AF40EB66B0A9','保存',4)  
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4BDE5283-8FE6-4010-B094-ADABD66A7014','EED8DBEE-83F6-4B5B-8382-AF40EB66B0A9','提交',5)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('1320A6D8-713B-43D4-BB00-CDA3DE6D24CB','个人绩效评价','Perfomance/PersonPerfomance.aspx','PageHeaderFooter',20,'D3576E49-DBC9-43EA-9822-EA5F4D96CA24','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D87E05A4-8B09-4052-A67E-681CB1FA88AA','1320A6D8-713B-43D4-BB00-CDA3DE6D24CB','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('ED54A56C-6E73-4895-A970-1CA7EC32E3C8','1320A6D8-713B-43D4-BB00-CDA3DE6D24CB','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('5ADB2B7F-7331-4750-8975-6A997CEBB127','1320A6D8-713B-43D4-BB00-CDA3DE6D24CB','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4723EFA9-EAB1-4CA1-84C9-818EB8CACAB3','1320A6D8-713B-43D4-BB00-CDA3DE6D24CB','保存',4)  
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('5FFB0E00-7FA2-4328-A1BA-6C7109A0BEAB','1320A6D8-713B-43D4-BB00-CDA3DE6D24CB','提交',5)  
	GO

	--HSSE管理工作报告
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('03235B30-960D-4FCF-99F7-97773A2EE108','管理工作报告','','ApplicationViewColumns',210,'0','Menu_Project',0,0)
GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('AE118E9C-C309-43B7-A198-8CA90A8D98EB','管理周报','Manager/ManagerWeek.aspx','PageHeaderFooter',10,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('1B660F13-869E-4B86-99F5-ADFC2FD12F4C','AE118E9C-C309-43B7-A198-8CA90A8D98EB','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('FC83427A-1B23-4ADC-A145-827008BFA6E9','AE118E9C-C309-43B7-A198-8CA90A8D98EB','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('0C384BFF-00AD-4E8D-9A92-EC349B42A01A','AE118E9C-C309-43B7-A198-8CA90A8D98EB','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('1D31C627-5DD1-4261-AE37-C61E718437C2','AE118E9C-C309-43B7-A198-8CA90A8D98EB','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('5D006DDC-3AED-4E5A-8597-3C972D96F983','管理月报','Manager/ManagerMonth.aspx','PageHeaderFooter',20,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	--管理月报按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4B10A633-FA57-486C-92D2-5A181E9AE50A','5D006DDC-3AED-4E5A-8597-3C972D96F983','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6048226D-4102-439A-AD3B-643E289CC3D5','5D006DDC-3AED-4E5A-8597-3C972D96F983','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('68DADCD1-6A16-4E70-B0F2-DE9EE389F7D2','5D006DDC-3AED-4E5A-8597-3C972D96F983','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B6466118-F55C-4AFD-BC76-33CA2357E7C6','5D006DDC-3AED-4E5A-8597-3C972D96F983','保存',4)  
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('363EB208-7BB1-4A55-85F3-2501B2F10B45','安全管理月报','Manager/ManagerMonthB.aspx','PageHeaderFooter',25,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	--管理月报按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('DC9D383A-A025-46A4-83B1-45DE3D557CE4','363EB208-7BB1-4A55-85F3-2501B2F10B45','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7843500D-F955-4567-8504-65AD0B420425','363EB208-7BB1-4A55-85F3-2501B2F10B45','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7B97D1AF-7FD2-4461-A270-E48999F68FEF','363EB208-7BB1-4A55-85F3-2501B2F10B45','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('88B6B84A-C6B3-4F26-A888-A5803286D31C','363EB208-7BB1-4A55-85F3-2501B2F10B45','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('A97295B1-86C5-45F6-B8EC-A520E8CF3A4B','项目HSE绩效管理报告','Manager/PerformanceManagementReport.aspx','PageHeaderFooter',27,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('1C8F5159-0B97-4C90-AEE6-EA1777E2A4E8','A97295B1-86C5-45F6-B8EC-A520E8CF3A4B','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('ACB7485B-D3B9-4319-B968-32B8AD10CA97','A97295B1-86C5-45F6-B8EC-A520E8CF3A4B','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('5C9E92DB-A844-4778-B41C-E68A7831BAEC','A97295B1-86C5-45F6-B8EC-A520E8CF3A4B','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8BED9EDE-643A-4390-8C50-32AA0338AC66','A97295B1-86C5-45F6-B8EC-A520E8CF3A4B','保存',4) 
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('288C6A04-456F-4364-B4FE-82C14B8B3CC9','海外工程项目月度HSSE统计表','Manager/ManagerMonthE.aspx','PageHeaderFooter',28,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	--海外工程项目月度HSSE统计表
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('981E7E84-6785-434D-BA81-E2F0CF869EA3','288C6A04-456F-4364-B4FE-82C14B8B3CC9','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F51A6B1B-2E38-4990-8A81-4F77CB8F1C65','288C6A04-456F-4364-B4FE-82C14B8B3CC9','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('83D57F01-C847-48F7-82DF-53557DA27B28','288C6A04-456F-4364-B4FE-82C14B8B3CC9','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A6AA0F3A-2740-4143-9312-1BD39674AD56','288C6A04-456F-4364-B4FE-82C14B8B3CC9','保存',4)  
	GO
	-- 管理月报C
	INSERT INTO Sys_MenuProjectA (MenuId,MenuName,Url,Icon,SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)  
	VALUES('68A52EEA-2661-4CB0-9382-A36AA5DCC480','HSE管理月报','Manager/ManagerMonthC.aspx','PageHeaderFooter',26,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	--管理月报C按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3F7582F7-4561-4AFD-8C6F-935D357E8C8D','68A52EEA-2661-4CB0-9382-A36AA5DCC480','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('574FE513-616B-4E26-87F8-B8DD28E9726F','68A52EEA-2661-4CB0-9382-A36AA5DCC480','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('62C0921F-4289-4D28-8FC0-7CD66D5F62D8','68A52EEA-2661-4CB0-9382-A36AA5DCC480','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('CC9C6111-FAC8-4D92-8C10-63132F6AF586','68A52EEA-2661-4CB0-9382-A36AA5DCC480','保存',4)  
	GO

	-- 安全生产月报（东华月报）
	INSERT INTO Sys_MenuProjectA (MenuId,MenuName,Url,Icon,SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)  
	VALUES('E18AF205-9C5B-40F8-B77B-B30C31B10BB5','安全生产月报','Manager/ManagerMonthD.aspx','PageHeaderFooter',27,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	--安全生产月报（东华月报）按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A3DE3CF0-5D03-4FA7-B8A6-92ED7782BC78','E18AF205-9C5B-40F8-B77B-B30C31B10BB5','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('1E646E62-0D92-449A-818A-F87D07ECD21B','E18AF205-9C5B-40F8-B77B-B30C31B10BB5','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('69876C7A-8206-488F-B44A-671FA21DD795','E18AF205-9C5B-40F8-B77B-B30C31B10BB5','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E5B95B0A-0CE8-4145-971B-839FDCA66C5F','E18AF205-9C5B-40F8-B77B-B30C31B10BB5','保存',4)  
	GO

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

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('28668BD9-3E14-438F-8BEE-24BAF6031B63','管理季报','Manager/ManagerQuarterly.aspx','PageHeaderFooter',30,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	--管理季报按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('63BBE171-67A8-494F-8B23-BD27F4B76647','28668BD9-3E14-438F-8BEE-24BAF6031B63','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('2558EBC4-7C86-4A4C-A69D-24BD44871C12','28668BD9-3E14-438F-8BEE-24BAF6031B63','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B9560652-A6AB-4EAB-9DDD-55BB37A9C584','28668BD9-3E14-438F-8BEE-24BAF6031B63','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('0705FF82-1771-4650-A1D3-D0D281281D76','28668BD9-3E14-438F-8BEE-24BAF6031B63','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('88AE0EF8-D29E-409F-A154-CCA3999B00AE','HSSE完工报告','Manager/CompletionReport.aspx','PageHeaderFooter',40,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	--完工报告按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('00A41B69-D39A-47E2-8C33-97EDD2A2B5CC','88AE0EF8-D29E-409F-A154-CCA3999B00AE','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7CA7DC17-0729-4774-9A0D-07313A8F60CD','88AE0EF8-D29E-409F-A154-CCA3999B00AE','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('11993AC1-03A1-4976-9CB1-A64300F7FC98','88AE0EF8-D29E-409F-A154-CCA3999B00AE','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('DFF29546-138A-4269-9E38-091B5D91FB43','88AE0EF8-D29E-409F-A154-CCA3999B00AE','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('3ADE41A3-4B0E-4D36-ABFF-ABB94519A943','管理工作总结','Manager/ManagerTotal.aspx','PageHeaderFooter',50,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	--工作总结按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4BF5D898-17A6-4AFE-B9A9-AD21C577D15E','3ADE41A3-4B0E-4D36-ABFF-ABB94519A943','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('AF7737C1-6CDD-48A4-8F5E-D4A4F49F6484','3ADE41A3-4B0E-4D36-ABFF-ABB94519A943','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A8622F16-DD6B-4EA5-BA0C-B61789CD4979','3ADE41A3-4B0E-4D36-ABFF-ABB94519A943','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F2989F1B-13DB-4012-BF72-2DE030D422EE','3ADE41A3-4B0E-4D36-ABFF-ABB94519A943','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('A9190CE2-EA31-421F-B733-8824B8A64EE2','现场HSSE工作顾客评价','Manager/ManagerPerformance.aspx','PageHeaderFooter',60,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO	
	--现场HSSE工作顾客评价按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('2B4689BA-FF0C-4FCC-84DA-9565D710C398','A9190CE2-EA31-421F-B733-8824B8A64EE2','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('CB89EE59-431F-4218-B9E5-071DAF55B3FA','A9190CE2-EA31-421F-B733-8824B8A64EE2','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D5B91B10-B522-491C-BA04-0C5BAE1E1E79','A9190CE2-EA31-421F-B733-8824B8A64EE2','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D4E338B0-D0A3-48B3-A39C-1B0F89490F47','A9190CE2-EA31-421F-B733-8824B8A64EE2','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('EF920FED-70A4-4789-B5DE-2F8220EEEF72','HSSE月总结','Manager/ManagerTotalMonth.aspx','PageHeaderFooter',70,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('1FF7A267-D9D5-420C-A3B4-95D1FFFE9AF4','EF920FED-70A4-4789-B5DE-2F8220EEEF72','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('DB00A802-909D-4C69-A2A0-26EA6E8FF59E','EF920FED-70A4-4789-B5DE-2F8220EEEF72','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4BBAA69A-0C52-4DE9-92AF-6F5968C63309','EF920FED-70A4-4789-B5DE-2F8220EEEF72','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('797B3B20-E645-44EC-AD1B-8A335B244870','EF920FED-70A4-4789-B5DE-2F8220EEEF72','保存',4)  
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8544354F-D064-4348-BF39-4EC7CE96B9E4','EF920FED-70A4-4789-B5DE-2F8220EEEF72','提交',5)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('BD19F5D9-24EA-483D-B734-25B65A5ECDB1','工程现场环境与职业健康月报','Manager/Health.aspx','PageHeaderFooter',80,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	--工程现场环境与职业健康月报按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4CAB58E0-594C-4CF5-A31C-C326CCC90FB1','BD19F5D9-24EA-483D-B734-25B65A5ECDB1','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('147A46CC-7969-46CD-BE3C-597BCE14D8D4','BD19F5D9-24EA-483D-B734-25B65A5ECDB1','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D613BDF3-4D18-49D5-997F-CD58D4F2EF3D','BD19F5D9-24EA-483D-B734-25B65A5ECDB1','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('408413DC-5590-4655-A478-2F80FDB97D36','BD19F5D9-24EA-483D-B734-25B65A5ECDB1','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('04A15594-9DCA-46A3-9224-4DEAA0BC556E','分包商HSSE周报','Manager/SubManagerWeek.aspx','PageHeaderFooter',90,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	--分包商HSSE周报按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B549AEE3-A239-4E31-8421-E81397335A56','04A15594-9DCA-46A3-9224-4DEAA0BC556E','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('37848D5A-64C2-4FAF-807B-79F221EF2E57','04A15594-9DCA-46A3-9224-4DEAA0BC556E','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('0601E05B-8743-42C3-B68B-FA3A154BCC51','04A15594-9DCA-46A3-9224-4DEAA0BC556E','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D3039A7B-B817-42C1-AB50-1FBA2EDA3BC5','04A15594-9DCA-46A3-9224-4DEAA0BC556E','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('71519DDC-9FF1-4C05-9B31-F249B3ED0106','分包商HSSE月报','Manager/SubManagerMonth.aspx','PageHeaderFooter',100,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	--分包商HSSE月报按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3BF2CEA8-0C46-4C1A-AA3B-113DE2EA95CF','71519DDC-9FF1-4C05-9B31-F249B3ED0106','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3335A772-BC0E-435E-8C9B-890169CE9F84','71519DDC-9FF1-4C05-9B31-F249B3ED0106','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B603257C-382D-45E1-A472-6899CE133519','71519DDC-9FF1-4C05-9B31-F249B3ED0106','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('95851461-0660-4531-B35A-01E37C76C941','71519DDC-9FF1-4C05-9B31-F249B3ED0106','保存',4)  
	GO
		
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
	VALUES('54A3E23A-DAC7-484B-8C97-40AD785688FC','安全管理资料','SafetyData/ProjectSafetyData.aspx','PageHeaderFooter',110,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('59450BEB-93FC-4CD6-9E27-FFF647121142','54A3E23A-DAC7-484B-8C97-40AD785688FC','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('5CAECBB0-B1A5-48AA-B5FB-C8F82CD46728','54A3E23A-DAC7-484B-8C97-40AD785688FC','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('2AE4A0D4-1ACE-4806-9F4C-5D7B6DE07EF6','54A3E23A-DAC7-484B-8C97-40AD785688FC','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('031B6847-25E5-4275-942D-7A4B09D99385','54A3E23A-DAC7-484B-8C97-40AD785688FC','保存',4)
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
	VALUES('75088181-ACE2-4CBE-90F9-DB043D46F04A','安全管理资料考核','SafetyData/ProjectSafetyDataCheck.aspx','PageHeaderFooter',120,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B332AEB1-80CF-43BD-8A9C-A5AC020D2AD6','75088181-ACE2-4CBE-90F9-DB043D46F04A','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('82E1D7D1-5CF9-4984-9188-8FE2DFF7A1E0','75088181-ACE2-4CBE-90F9-DB043D46F04A','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('70F3999B-430B-4830-AA93-CB790FCD2449','75088181-ACE2-4CBE-90F9-DB043D46F04A','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6DA17047-0816-459E-BA4D-B9EC25DEF5F4','75088181-ACE2-4CBE-90F9-DB043D46F04A','保存',4)
	GO

	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('3E077A36-EC12-4FC7-B685-1F439291C9B8','HSE日志暨管理数据收集','Manager/HSSELog.aspx','PageHeaderFooter',130,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	--HSE日志暨管理数据收集
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4B932BFC-8B17-4474-8CBE-5FCA25CD6D15','3E077A36-EC12-4FC7-B685-1F439291C9B8','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('516517C5-DE3E-4EC9-BBCB-EC2ACD629773','3E077A36-EC12-4FC7-B685-1F439291C9B8','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('09DF74A8-B5AF-44D0-9F5E-100627AAA2CC','3E077A36-EC12-4FC7-B685-1F439291C9B8','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('233F14D6-6F72-4F1C-BBA6-C76C082AA40C','3E077A36-EC12-4FC7-B685-1F439291C9B8','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('E763BC17-EC0D-4AB3-A388-EC7F734B56F2','HSE经理暨HSE工程师细则','Manager/HSSELogMonth.aspx','PageHeaderFooter',140,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	--HSE经理暨HSE工程师细则
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('857B59B4-F1C7-4657-B873-1862ED9B092C','E763BC17-EC0D-4AB3-A388-EC7F734B56F2','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8D8A003E-4AF8-4623-819D-8AE48B37D4C9','E763BC17-EC0D-4AB3-A388-EC7F734B56F2','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('2ACA2BF2-930D-4474-A076-6462155A8B69','E763BC17-EC0D-4AB3-A388-EC7F734B56F2','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6819DDC3-5F0C-4690-B9D7-21D842651EBC','E763BC17-EC0D-4AB3-A388-EC7F734B56F2','保存',4)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('AB03E11C-8174-4B83-90F4-D07A3D933E1D','分包商上传周报','Manager/SubUploadWeek.aspx','PageHeaderFooter',145,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('79E58AA8-3E72-4848-BA59-0D4C6A2BF755','AB03E11C-8174-4B83-90F4-D07A3D933E1D','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A919707F-6823-4861-BADB-6CA7DF12191C','AB03E11C-8174-4B83-90F4-D07A3D933E1D','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6805E59F-66AE-49AF-A969-0C6DCC1B1D66','AB03E11C-8174-4B83-90F4-D07A3D933E1D','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('03529419-183D-4EFA-85C0-279F5555FB3E','AB03E11C-8174-4B83-90F4-D07A3D933E1D','保存',4) 
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('BD16BE8D-0F4D-4C80-A4D7-707156B541B8','项目安全文件','Manager/ProjectSafeReport.aspx','PageHeaderFooter',150,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	--项目安全文件上报
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3E3B3D56-D59B-4F43-9B46-4001273E7985','BD16BE8D-0F4D-4C80-A4D7-707156B541B8','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D19A2B65-55FE-4E3A-BEB8-5C361236AB25','BD16BE8D-0F4D-4C80-A4D7-707156B541B8','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('9945A891-BCCA-4D8A-AEF4-AB4881F84381','BD16BE8D-0F4D-4C80-A4D7-707156B541B8','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B14E5FEC-CEEC-4C9F-BBE8-3102DBA8591C','BD16BE8D-0F4D-4C80-A4D7-707156B541B8','保存',4) 
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B635EB1F-03CD-4816-BC7E-D85400C7DD77','BD16BE8D-0F4D-4C80-A4D7-707156B541B8','提交',5)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72','工程师HSE日志','Manager/HSEDiary.aspx','PageHeaderFooter',160,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	--工程师HSE日志
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('5E9CE851-9CCE-4B7E-9DFA-9575B2D22413','8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('52E28127-F078-424F-917E-A7C41D8A1C72','8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4A662B9D-8564-423D-8312-9B697A0A79FA','8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4FA1A85E-CA18-41A4-8B5C-FC2C494647C1','8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72','保存',4) 
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C2BF5762-6E52-4E36-BA72-7BE5C7C88C18','8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72','提交',5)  
	GO
	
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('5BB670AD-CCAA-4004-B931-70C5879A968B','安全管理资料','','ApplicationViewColumns',215,'0','Menu_Project',0,0)
GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
	VALUES('BC3B7C4A-D69C-45CA-A951-98F4F64191BB','安全管理资料','SafetyDataE/ProjectSafetyDataE.aspx','PageHeaderFooter',10,'5BB670AD-CCAA-4004-B931-70C5879A968B','Menu_Project',1,0)
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
	VALUES('8F2E3B63-8B98-44FC-8353-7F09DA86A463','安全管理资料考核','SafetyDataE/ProjectSafetyDataECheck.aspx','PageHeaderFooter',20,'5BB670AD-CCAA-4004-B931-70C5879A968B','Menu_Project',1,0)
	GO


--HSSE信息管理
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('66DFD649-FBC2-463F-BD1A-04095D713C8E','信息管理','','ComputerMagnify',220,'0','Menu_Project',0,0)
GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('B06EC998-60D2-4CBF-8080-9F000A1595AA','管理通知','InformationProject/Notice.aspx','PageHeaderFooter',10,'66DFD649-FBC2-463F-BD1A-04095D713C8E','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F390A052-5924-4422-8091-689E5517EB49','B06EC998-60D2-4CBF-8080-9F000A1595AA','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A8F9AC0D-768C-4D2E-A3C5-9F69A1567AB5','B06EC998-60D2-4CBF-8080-9F000A1595AA','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('468E7683-D5F4-4A3E-944D-DF0905C64450','B06EC998-60D2-4CBF-8080-9F000A1595AA','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E49BD8A8-C800-484F-869D-1195D4431619','B06EC998-60D2-4CBF-8080-9F000A1595AA','保存',4)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C2780844-FCEA-4A3C-9D60-FCC2046A807A','B06EC998-60D2-4CBF-8080-9F000A1595AA','提交',5)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('0F6E62CF-2ED8-430B-BB74-C6603C8A1B38','B06EC998-60D2-4CBF-8080-9F000A1595AA','发布',6)
	GO
	
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('16092FE7-938B-4713-8084-4FBFA030F386','HSSE宣传活动','InformationProject/PromotionalActivities.aspx','PageHeaderFooter',20,'66DFD649-FBC2-463F-BD1A-04095D713C8E','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D577485B-3228-4D6B-9F6E-CDB537D7727E','16092FE7-938B-4713-8084-4FBFA030F386','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F20E8C37-E077-4FAC-8540-15DD946C3F8F','16092FE7-938B-4713-8084-4FBFA030F386','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('DEE6433C-8AB6-475E-9480-145A4FB85C41','16092FE7-938B-4713-8084-4FBFA030F386','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B6BC7962-0026-41AC-AF51-28249423B835','16092FE7-938B-4713-8084-4FBFA030F386','保存',4)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('EF60727A-9FC3-4A1B-B682-9FFC7F6E918B','16092FE7-938B-4713-8084-4FBFA030F386','提交',5)
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('B58179BE-FE6E-4E91-84FC-D211E4692354','项目图片','InformationProject/Picture.aspx','PageHeaderFooter',40,'66DFD649-FBC2-463F-BD1A-04095D713C8E','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('2B7C6B79-6BE6-4032-BAAD-61998B60FD18','B58179BE-FE6E-4E91-84FC-D211E4692354','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('DA4020F0-BFC6-4BD3-886F-BC40FE0FF6CB','B58179BE-FE6E-4E91-84FC-D211E4692354','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('030CF6D1-7D6A-49A9-AA1A-C514A455AD85','B58179BE-FE6E-4E91-84FC-D211E4692354','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('826A3F40-797E-48C6-96E0-E2B7CE88C948','B58179BE-FE6E-4E91-84FC-D211E4692354','保存',4)  
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E4662F45-D430-4294-BC14-4D1027CC7F7A','B58179BE-FE6E-4E91-84FC-D211E4692354','提交',5)  
	GO


	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('4F5C00F3-DA7D-4B2D-B1EF-310DFFCA77DD','一般来文管理','InformationProject/ReceiveFileManager.aspx','PageHeaderFooter',50,'66DFD649-FBC2-463F-BD1A-04095D713C8E','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D6386C75-FAB4-4188-B5F8-9D10041C811A','4F5C00F3-DA7D-4B2D-B1EF-310DFFCA77DD','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('740D8F89-98A1-4DE2-A818-54024092F441','4F5C00F3-DA7D-4B2D-B1EF-310DFFCA77DD','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D034F64F-0BD3-4C34-91FD-ADDBD7AD09AE','4F5C00F3-DA7D-4B2D-B1EF-310DFFCA77DD','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3E9B53A3-ACC6-4BE2-A02D-948CED42B358','4F5C00F3-DA7D-4B2D-B1EF-310DFFCA77DD','保存',4)  
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('BBABC8E0-FBD0-41C5-8DB9-951CB5C0AC35','4F5C00F3-DA7D-4B2D-B1EF-310DFFCA77DD','提交',5)  
	GO

--项目资料
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('E1BBA25B-DAE5-4CFF-B72A-6C6044917D2B','项目文档资料','','PageHeaderFooter',230,'0','Menu_Project',0,0)
GO

--定稿文件
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('4EBDBF0A-53FC-4B86-BE6E-D6C16985A613','定稿文件','','PageHeaderFooter',20,'E1BBA25B-DAE5-4CFF-B72A-6C6044917D2B','Menu_Project',0,0)
GO
	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('C5354813-7B1E-4155-8EE8-D349BF2F18F4','业主管理文档','FinalFileManage/OwnerFinalFile.aspx','PageHeaderFooter',10,'4EBDBF0A-53FC-4B86-BE6E-D6C16985A613','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('97ED8E64-5B95-4CF9-ABA4-1DB118F89F33','C5354813-7B1E-4155-8EE8-D349BF2F18F4','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('915D3DE7-2170-4A47-81A7-9204311A6D9D','C5354813-7B1E-4155-8EE8-D349BF2F18F4','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F997CF82-39EB-4715-A6C6-E46E5D601541','C5354813-7B1E-4155-8EE8-D349BF2F18F4','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3B69C776-5361-409E-8C05-72BE6103CF47','C5354813-7B1E-4155-8EE8-D349BF2F18F4','保存',4)  
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('DA16F650-28BD-409B-9043-46C822C54861','C5354813-7B1E-4155-8EE8-D349BF2F18F4','提交',5)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('719DA0D3-FA59-4A03-B6E0-6663A211956F','监理管理文档','FinalFileManage/FinalFileList.aspx','PageHeaderFooter',20,'4EBDBF0A-53FC-4B86-BE6E-D6C16985A613','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6E2881DC-99F5-4541-A122-0768A41327BA','719DA0D3-FA59-4A03-B6E0-6663A211956F','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('1A220B0F-892E-4388-9AC6-65B1A4D65156','719DA0D3-FA59-4A03-B6E0-6663A211956F','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B87A7837-4ECC-4CB4-AADD-F16B8A893FFE','719DA0D3-FA59-4A03-B6E0-6663A211956F','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E7A28C77-698E-45FB-B156-718869FECFA6','719DA0D3-FA59-4A03-B6E0-6663A211956F','保存',4)  
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E32AE50E-E7F0-4F0D-B07A-815F7E673D32','719DA0D3-FA59-4A03-B6E0-6663A211956F','提交',5)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('B1C694BB-EF35-49B6-AEE4-0C5CA6803208','其他管理文档','FinalFileManage/OtherDocumentList.aspx','PageHeaderFooter',30,'4EBDBF0A-53FC-4B86-BE6E-D6C16985A613','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('611C9D75-F3D1-4DBE-93EC-934FC127A6E9','B1C694BB-EF35-49B6-AEE4-0C5CA6803208','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('FE032AC1-1EDD-4A9A-9A9C-6ABF8E912CE8','B1C694BB-EF35-49B6-AEE4-0C5CA6803208','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('EDCB0167-F66D-4AB7-95CF-384491894000','B1C694BB-EF35-49B6-AEE4-0C5CA6803208','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D6DEB79C-1C08-41CD-8CF3-B03D507EEB34','B1C694BB-EF35-49B6-AEE4-0C5CA6803208','保存',4)  
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('AAC3A956-D6E7-4CF6-818C-E2F40C55BC3F','B1C694BB-EF35-49B6-AEE4-0C5CA6803208','提交',5)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('24D6B764-7B91-46EB-9D80-A6073FC5720D','已定稿文件','FinalFileManage/HSEFinalFileList.aspx','PageHeaderFooter',40,'4EBDBF0A-53FC-4B86-BE6E-D6C16985A613','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7F800CDC-15C6-45CE-8B88-871EC2CC4874','24D6B764-7B91-46EB-9D80-A6073FC5720D','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8377DC62-0FCD-49D9-8451-DDF34478D57C','24D6B764-7B91-46EB-9D80-A6073FC5720D','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('2C27EE67-1C57-4ACB-ACBE-5D7383C24BA7','24D6B764-7B91-46EB-9D80-A6073FC5720D','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7B1CCC93-0D55-42E8-96CF-8751B81B5EB7','24D6B764-7B91-46EB-9D80-A6073FC5720D','保存',4)  
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('AF07C53F-CF50-4A7D-8A69-471F3135EE3C','24D6B764-7B91-46EB-9D80-A6073FC5720D','提交',5)  
	GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('05C6C2AF-3B0B-4BF0-A8CE-1FC15DAC3C54','项目文件夹','InformationProject/ProjectFolder.aspx','PageHeaderFooter',30,'E1BBA25B-DAE5-4CFF-B72A-6C6044917D2B','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('89557976-D752-4E99-A20F-BE6B702F72ED','05C6C2AF-3B0B-4BF0-A8CE-1FC15DAC3C54','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('A6FA4133-582D-48A6-A0E6-6331A1D22A6B','05C6C2AF-3B0B-4BF0-A8CE-1FC15DAC3C54','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('6B578D4F-3503-408C-8F96-BE99548E7B3C','05C6C2AF-3B0B-4BF0-A8CE-1FC15DAC3C54','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('934F3A64-CC60-45CA-A1E1-C39F14E31310','05C6C2AF-3B0B-4BF0-A8CE-1FC15DAC3C54','保存',4)  
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('C69B7409-BE1E-4754-AC90-57B56EEE198B','文件柜A(检查类)','InformationProject/FileCabinetA.aspx','PageHeaderFooter',40,'E1BBA25B-DAE5-4CFF-B72A-6C6044917D2B','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B7C8AE7D-8A3B-4EA4-B659-A7A0B79064EC','C69B7409-BE1E-4754-AC90-57B56EEE198B','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('DF62F0EB-F3A7-46FC-AB29-E11DF381427F','C69B7409-BE1E-4754-AC90-57B56EEE198B','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('D5ECBE4B-B537-48CD-9114-57B9DB405DFA','C69B7409-BE1E-4754-AC90-57B56EEE198B','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('457A3686-FCA0-406D-97B6-18E2AAD882F2','C69B7409-BE1E-4754-AC90-57B56EEE198B','保存',4)  
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('200019A4-E24F-4C87-8C52-9970F78DBF73','文件柜B(内业)','InformationProject/FileCabinetB.aspx','PageHeaderFooter',50,'E1BBA25B-DAE5-4CFF-B72A-6C6044917D2B','Menu_Project',1,0)
GO

--INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
--VALUES('0D5571B4-6B74-4782-8050-53529AEA5E98','信息统计','InformationProject/InfoStatistic.aspx','PageHeaderFooter',60,'E1BBA25B-DAE5-4CFF-B72A-6C6044917D2B','Menu_Project',1,0)
--GO

--安全分析
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('14DD34F2-0682-48D6-A199-108297A9825E','安全分析','','ChartCurve',240,'0','Menu_Project',0,0)
GO
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('C763FEE5-B703-481A-BBDB-C85CE9B7846A','隐患分析(手机端)','InformationAnalysis/HazardAnalyse.aspx','PageHeaderFooter',10,'14DD34F2-0682-48D6-A199-108297A9825E','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('14C42C8E-8D3D-4D30-AA56-4F96828610AD','危险因素分析','InformationAnalysis/CheckAnalysis.aspx','PageHeaderFooter',20,'14DD34F2-0682-48D6-A199-108297A9825E','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('9AD1D84E-80E1-46B4-A749-E33C9BBB8BB4','日常巡检分析','InformationAnalysis/CheckDayAnalysis.aspx','PageHeaderFooter',30,'14DD34F2-0682-48D6-A199-108297A9825E','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('146C222E-DC61-4B48-9808-40C512EDA922','专项检查分析','InformationAnalysis/CheckSpecialAnalysis.aspx','PageHeaderFooter',40,'14DD34F2-0682-48D6-A199-108297A9825E','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('DD221429-B928-4775-9271-4CC10D486726','综合检查分析','InformationAnalysis/CheckColligationAnalysis.aspx','PageHeaderFooter',50,'14DD34F2-0682-48D6-A199-108297A9825E','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('D42DCCFB-0525-4A27-A770-6BC13019A5A9','开工前检查分析','InformationAnalysis/CheckWorkAnalysis.aspx','PageHeaderFooter',60,'14DD34F2-0682-48D6-A199-108297A9825E','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('2DDDCEDA-1D96-4C3E-8D73-6AD390BDD6AF','季节性/节假日检查分析','InformationAnalysis/CheckHolidayAnalysis.aspx','PageHeaderFooter',70,'14DD34F2-0682-48D6-A199-108297A9825E','Menu_Project',1,0)
GO

--安全上报报表(集团)
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('C554E471-B740-4559-B543-E00F247289FD','安全上报报表','','Report',10,'0','Menu_Project',0,0)
GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('6E7DC075-A7AF-4E42-8F8B-0174EFDD54A1','百万工时安全统计月报','InformationProject/MillionsMonthlyReport.aspx','PageHeaderFooter',10,'C554E471-B740-4559-B543-E00F247289FD','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D36C70D9-2C10-4F90-8A98-F67414480995','6E7DC075-A7AF-4E42-8F8B-0174EFDD54A1','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('94429798-DE9B-4EFB-80A5-3A542B763785','6E7DC075-A7AF-4E42-8F8B-0174EFDD54A1','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E2D0C701-9F2B-4D08-822E-36CE9AA0CAC8','6E7DC075-A7AF-4E42-8F8B-0174EFDD54A1','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('B16B6163-E3DC-47F6-8C9D-36A01C404751','6E7DC075-A7AF-4E42-8F8B-0174EFDD54A1','保存',4)  
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6256E1CA-6F65-4296-A0A1-A22958A8CC9C','6E7DC075-A7AF-4E42-8F8B-0174EFDD54A1','提交',5)  
	GO


	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('38E948BA-E043-4E89-9038-0CE1B508FA19','职工伤亡事故原因分析报','InformationProject/AccidentCauseReport.aspx','PageHeaderFooter',20,'C554E471-B740-4559-B543-E00F247289FD','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('E9C44E20-C942-4815-99D4-17A80BAC5F2A','38E948BA-E043-4E89-9038-0CE1B508FA19','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('2627D518-7BFB-43C0-87EF-4B88113878CB','38E948BA-E043-4E89-9038-0CE1B508FA19','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7FDF7F77-95D1-44DD-AD5A-ED4D9BEB56D8','38E948BA-E043-4E89-9038-0CE1B508FA19','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('12CEBC46-BABF-4873-83B6-3518619FCCA6','38E948BA-E043-4E89-9038-0CE1B508FA19','保存',4)  
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F2966568-EC38-4017-A79C-069F0EBA9C44','38E948BA-E043-4E89-9038-0CE1B508FA19','提交',5)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('8B17DC64-A4B9-4283-B7A1-D2E944205FA5','安全生产数据季报','InformationProject/SafetyQuarterlyReport.aspx','PageHeaderFooter',30,'C554E471-B740-4559-B543-E00F247289FD','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('CEA3F10D-8DF0-4992-BC94-1AB274901005','8B17DC64-A4B9-4283-B7A1-D2E944205FA5','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A07741A0-7EE5-4F1D-9DD8-03BE59A458E7','8B17DC64-A4B9-4283-B7A1-D2E944205FA5','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('0AB93BC2-5CF8-4F2A-B1D6-4949D92F1182','8B17DC64-A4B9-4283-B7A1-D2E944205FA5','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('270BCCE1-7B4B-4C4E-8E47-96BB1062E3F8','8B17DC64-A4B9-4283-B7A1-D2E944205FA5','保存',4)  
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('DCF357FD-5DEE-4184-8068-9EFBA35062C2','8B17DC64-A4B9-4283-B7A1-D2E944205FA5','提交',5)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('0CDFC1BE-0796-4817-ADB8-7A0B48655E00','应急演练开展情况季报','InformationProject/DrillConductedQuarterlyReport.aspx','PageHeaderFooter',40,'C554E471-B740-4559-B543-E00F247289FD','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('CD08D820-FD35-4B81-9BFF-E28E4C741B66','0CDFC1BE-0796-4817-ADB8-7A0B48655E00','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D75AC5E4-1650-4E5E-9CF7-A8A76BF3FB30','0CDFC1BE-0796-4817-ADB8-7A0B48655E00','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('FB2B977E-18E4-4A73-9380-2A15F481B430','0CDFC1BE-0796-4817-ADB8-7A0B48655E00','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('36DEDC18-CF74-4C69-9CB1-395462599C9B','0CDFC1BE-0796-4817-ADB8-7A0B48655E00','保存',4)  
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('89DC3EFF-8B3D-4874-B220-8B00411FE9B9','0CDFC1BE-0796-4817-ADB8-7A0B48655E00','提交',5)  
	GO

	INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('0973EE1C-CD2A-4116-BD67-1ABAD71D6C7C','应急演练工作计划半年报','InformationProject/DrillPlanHalfYearReport.aspx','PageHeaderFooter',50,'C554E471-B740-4559-B543-E00F247289FD','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('00EC4893-885D-4AFF-A926-1B8B6C8E54B9','0973EE1C-CD2A-4116-BD67-1ABAD71D6C7C','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('BCAD42D7-02D6-4664-8C7D-3107D885B1EE','0973EE1C-CD2A-4116-BD67-1ABAD71D6C7C','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C2AF1672-8397-4B65-AB26-6577F0691E03','0973EE1C-CD2A-4116-BD67-1ABAD71D6C7C','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4B4608BA-7CD5-421D-A531-C74AE81BED11','0973EE1C-CD2A-4116-BD67-1ABAD71D6C7C','保存',4)  
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('FC4EA9DB-E19A-4A46-AA5B-17DAB207182B','0973EE1C-CD2A-4116-BD67-1ABAD71D6C7C','提交',5)  
	GO