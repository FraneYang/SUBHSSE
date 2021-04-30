--项目菜单B MenuType=Menu_ProjectB

--项目策划
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('28D9F51A-BA52-47B6-87A0-D063FC075C7B','项目策划','','LorryGo',10,'0','Menu_Project',0,0)
GO
	--项目设置
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('E82B690B-F662-4B4E-8340-6C4B8ECA44CC','组织建设','','BuildingKey',10,'28D9F51A-BA52-47B6-87A0-D063FC075C7B','Menu_Project',0,0)
	GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('0C3386D2-8F86-40AC-94F6-EE0100324FDD','项目信息','ProjectData/ProjectSet.aspx','PageHeaderFooter',10,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
		GO     

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('D24ACD3C-086C-4AC8-9AFA-16D48893215E','项目状态及软件关闭','ProjectData/ProjectShutdown.aspx','PageHeaderFooter',15,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('64690369-3049-4009-82EE-437DF2E606BA','项目单位','ProjectData/ProjectUnit.aspx','PageHeaderFooter',20,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('CDB80E91-61A8-4E4D-BA97-3ADDC3208B66','项目用户','ProjectData/ProjectUser.aspx','PageHeaderFooter',30,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('DB3F7E51-7700-4B87-A529-3070AA652517','项目用户转换','ProjectData/SendReceive.aspx','PageHeaderFooter',35,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('2C970C89-8C69-4A6C-B832-8A64B8A701CA','班组信息','ProjectData/TeamGroup.aspx','PageHeaderFooter',40,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('CBA3833A-C705-4B4E-A4A7-ACC27D0ECDCE','作业区域','ProjectData/WorkArea.aspx','PageHeaderFooter',50,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
		GO
				
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('09769041-79BB-4456-8DF1-45548E72E423','规则设置','ProjectData/CodeTemplateRule.aspx','PageHeaderFooter',60,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('44140854-701D-4D67-AD8E-AA8DD48B6D6A','移动端首页','ProjectData/ProjectPageData.aspx','PageHeaderFooter',70,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('F266456A-991F-45A3-BCD6-CF2515D71E39','项目地图','ProjectData/ProjectMap.aspx','PageHeaderFooter',80,'E82B690B-F662-4B4E-8340-6C4B8ECA44CC','Menu_Project',1,0)
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
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('C8AC9BBB-6E6E-4871-BADC-7963EB1CCAA8','安全管理组织机构','SecuritySystem/SafetyManageOrganization.aspx','PageHeaderFooter',10,'7CCA86F7-E43F-438F-AAB6-CA2661FBB362','Menu_Project',1,0)
		GO
    --危险源管理
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('9A3212F8-2392-4F21-A8C7-FF5EE3B191F1','危险源管理','','FolderError',20,'28D9F51A-BA52-47B6-87A0-D063FC075C7B','Menu_Project',0,0)
	GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('762F0BF9-471B-4115-B35E-03A26C573877','环境因素识别与评价','Hazard/EnvironmentalRiskList.aspx','PageHeaderFooter',10,'9A3212F8-2392-4F21-A8C7-FF5EE3B191F1','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('EDC50857-7762-4498-83C6-5BDE85036BAB','职业健康安全危险源辨识与评价','Hazard/HazardList.aspx','PageHeaderFooter',20,'9A3212F8-2392-4F21-A8C7-FF5EE3B191F1','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('257C220C-A821-4710-864A-63BA146109B2','项目现场重大HSE因素控制措施一览表','Hazard/MajorHazardList.aspx','PageHeaderFooter',25,'9A3212F8-2392-4F21-A8C7-FF5EE3B191F1','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('F6A6D53A-150E-43DB-A3C4-6FA18E9401E9','风险提示','Hazard/HazardPrompt.aspx','PageHeaderFooter',30,'9A3212F8-2392-4F21-A8C7-FF5EE3B191F1','Menu_Project',1,0)
		GO		

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('E22F555A-D41C-4F5F-9734-39B578957732','其他危险源辨识文件','Hazard/OtherHazard.aspx','PageHeaderFooter',60,'9A3212F8-2392-4F21-A8C7-FF5EE3B191F1','Menu_Project',1,0)
		GO
		    
	--施工依据
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('A0D8A8F7-EF3A-4F81-B9C1-F9F2ECD63360','施工依据','','Lock',30,'28D9F51A-BA52-47B6-87A0-D063FC075C7B','Menu_Project',0,0)
	GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('C85CCDFC-E721-4B9D-B73F-F83C7578EE9B','法律法规辨识','InformationProject/LawRegulationIdentify.aspx','PageHeaderFooter',10,'A0D8A8F7-EF3A-4F81-B9C1-F9F2ECD63360','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('28B0235F-3DB5-4C15-A7E3-6F5DF52C8FDC','标准规范辨识','InformationProject/ConstructionStandardIdentify.aspx','PageHeaderFooter',20,'A0D8A8F7-EF3A-4F81-B9C1-F9F2ECD63360','Menu_Project',1,0)
		GO
    
	--实施计划/管理规定
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('E38EE43D-C526-493F-A177-712BA9B22291','安全实施计划','','ApplicationSideBoxes',40,'28D9F51A-BA52-47B6-87A0-D063FC075C7B','Menu_Project',0,0)
	GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('CBC47C8B-141C-446B-90D9-CE8F5AE66CE4','安全实施计划','ActionPlan/ActionPlanList.aspx','PageHeaderFooter',10,'E38EE43D-C526-493F-A177-712BA9B22291','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('9BEB66C0-E6DE-44DD-94F6-5C7433E6DE62','实施计划总结','ActionPlan/ActionPlanSummary.aspx','PageHeaderFooter',20,'E38EE43D-C526-493F-A177-712BA9B22291','Menu_Project',1,0)
		GO
		 --/管理规定
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('7944B1C6-636B-4AD8-980C-A2F6D44883D3','安全管理规定','','TableColumn',45,'28D9F51A-BA52-47B6-87A0-D063FC075C7B','Menu_Project',0,0)
	GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('775EFCF4-DE5C-46E9-8EA3-B16270E2F6A6','安全管理规定','ActionPlan/ManagerRule.aspx','PageHeaderFooter',20,'7944B1C6-636B-4AD8-980C-A2F6D44883D3','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('703D90A7-C40B-4753-943B-8A59AABDC043','管理规定清单','ActionPlan/ManagerRuleList.aspx','PageHeaderFooter',30,'7944B1C6-636B-4AD8-980C-A2F6D44883D3','Menu_Project',1,0)
		GO
--运行控制
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('2A9D8CBC-137F-4199-A426-728F5D63FF2F','运行控制','','Book',20,'0','Menu_Project',0,0)
GO

	--现场施工动态管理
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('2A00CDCC-129C-4875-9663-2A2718394D88','现场施工动态管理','','Overlays',5,'2A9D8CBC-137F-4199-A426-728F5D63FF2F','Menu_Project',0,0)
	GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('5B22A9E3-4701-4F49-9405-846B3E63F43B','现场施工动态','SiteConstruction/ConstructionDynamic.aspx','PageHeaderFooter',10,'2A00CDCC-129C-4875-9663-2A2718394D88','Menu_Project',1,0)
		GO
		
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('FD1F5E74-4843-4F6B-B893-8A16D26443D9','月度计划','SiteConstruction/MonthPlan.aspx','PageHeaderFooter',20,'2A00CDCC-129C-4875-9663-2A2718394D88','Menu_Project',1,0)
		GO   
	--违章曝光台管理
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('01D70BDC-DE60-4611-A203-C2D479AEF70F','现场施工动态管理','','ScriptEdit',9,'2A9D8CBC-137F-4199-A426-728F5D63FF2F','Menu_Project',0,0)
	GO	

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('09186AA8-991C-49F0-9D46-5C798D54FE0B','违章曝光台','InformationProject/Exposure.aspx','PageHeaderFooter',10,'01D70BDC-DE60-4611-A203-C2D479AEF70F','Menu_Project',1,0)
		GO

	--现场人员/资质
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('26FDE187-F2EE-41D0-95EA-4E8E026F19E5','现场人员/资质','','UserB',10,'2A9D8CBC-137F-4199-A426-728F5D63FF2F','Menu_Project',0,0)
	GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('DFDFEDA3-FECB-40DA-9216-C67B48002A8A','施工分包资质','QualityAudit/SubUnitQuality.aspx','PageHeaderFooter',10,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('03BAA34B-87D2-4479-9E69-10DD4A62A2A8','采购供货厂家管理','QualityAudit/InUnit.aspx','PageHeaderFooter',20,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('EBEA762D-1F46-47C5-9EAD-759E13D9B41C','特殊岗位人员资质','QualityAudit/PersonQuality.aspx','PageHeaderFooter',30,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('2DEDD752-8BAF-43CD-933D-932AF9AF2F58','特殊机具设备资质','QualityAudit/EquipmentQuality.aspx','PageHeaderFooter',40,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('BFD62699-47F0-49FA-AD39-FAEE8A6C3313','一般机具设备资质','QualityAudit/GeneralEquipmentQuality.aspx','PageHeaderFooter',50,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('874B4232-E0AD-41CD-8C66-8A7FF2D79358','项目安全协议清单','QualityAudit/ProjectRecord.aspx','PageHeaderFooter',60,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('750F5074-45B9-470E-AE1E-6204957421E6','安全人员资质','QualityAudit/SafePersonQuality.aspx','PageHeaderFooter',70,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
		GO
        
        INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
        VALUES('07435F23-F87D-4F52-B32C-A3DA95B10DA2','管理人员资质','QualityAudit/ManagePersonQuality.aspx','PageHeaderFooter',80,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
        GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('AD6FC259-CF40-41C7-BA3F-15AC50C1DD20','人员信息','SitePerson/PersonList.aspx','PageHeaderFooter',90,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('06F7E687-51B3-4357-BD6D-E6AEFC0E3975','人员项目转换','SitePerson/SendReceive.aspx','PageHeaderFooter',95,'EE260447-028F-46AF-8864-9A5DC9DAA5BD','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('8F15D3BE-BE21-4A6F-AD5C-2BBECEE46149','人工时日报','SitePerson/DayReport.aspx','PageHeaderFooter',100,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('6C97E014-AF13-46E5-ADB2-03D327C560EC','人工时月报','SitePerson/MonthReport.aspx','PageHeaderFooter',110,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('7ACB0CB1-15D8-4E8E-A54D-0CDC5F69B39A','发卡管理','SitePerson/SendCard.aspx','PageHeaderFooter',120,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('12F7123B-C2ED-4011-9859-83260AC91F09','现场人员考勤管理','SitePerson/PersonInfo.aspx','PageHeaderFooter',130,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
		GO
		
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('7D36E853-CC79-48B9-9E7F-E34797B4E87E','现场人员考勤统计','SitePerson/PersonStatistic.aspx','PageHeaderFooter',140,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
		GO
		
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('846565DD-89FC-4191-A71B-5CBEA2BE00E0','人员变化','SitePerson/PersonChange.aspx','PageHeaderFooter',150,'26FDE187-F2EE-41D0-95EA-4E8E026F19E5','Menu_Project',1,0)
		GO
	--教育培训
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('6A0506EB-05CE-4BB3-9BA9-866389F01E1C','教育培训','','ReportUser',20,'2A9D8CBC-137F-4199-A426-728F5D63FF2F','Menu_Project',0,0)
	GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('1182E353-FAB9-4DB1-A1EC-F41A00892128','培训记录','EduTrain/TrainRecord.aspx','PageHeaderFooter',10,'6A0506EB-05CE-4BB3-9BA9-866389F01E1C','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('F81E3F54-B3A9-4DDB-9C8C-1574317E040F','人员培训查询','EduTrain/TrainFind.aspx','PageHeaderFooter',20,'6A0506EB-05CE-4BB3-9BA9-866389F01E1C','Menu_Project',1,0)
		GO

	--例会管理
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('5309E7E0-395E-4F11-8F5E-D52E11526A2A','例会管理','','Note',30,'2A9D8CBC-137F-4199-A426-728F5D63FF2F','Menu_Project',0,0)
	GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('5236B1D9-8B57-495E-8644-231DF5D066CE','安全周例会','Meeting/WeekMeeting.aspx','PageHeaderFooter',10,'5309E7E0-395E-4F11-8F5E-D52E11526A2A','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('D5DD5EBD-A5F2-4A43-BA4C-E9A242B43684','安全月例会','Meeting/MonthMeeting.aspx','PageHeaderFooter',20,'5309E7E0-395E-4F11-8F5E-D52E11526A2A','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('BB6CEC48-283B-46AD-BEDD-F964D261698F','安全专题会议','Meeting/SpecialMeeting.aspx','PageHeaderFooter',30,'5309E7E0-395E-4F11-8F5E-D52E11526A2A','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('B2DA78EF-EECA-4AF4-9FAC-ECCFF1D6E459','其他会议记录','Meeting/AttendMeeting.aspx','PageHeaderFooter',40,'5309E7E0-395E-4F11-8F5E-D52E11526A2A','Menu_Project',1,0)
		GO
		
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('F8ADCDBC-AAAD-4884-9935-2B63562E4779','班前会','Meeting/ClassMeeting.aspx','PageHeaderFooter',50,'5309E7E0-395E-4F11-8F5E-D52E11526A2A','Menu_Project',1,0)
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

	--安全技术
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('5FF7BBD8-3E0A-4C90-8976-AFF5CE7E17A5','安全技术','','ApplicationOsxDouble',40,'2A9D8CBC-137F-4199-A426-728F5D63FF2F','Menu_Project',0,0)
	GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('D5F6DFAA-4051-4E0E-818B-2A45F985C5A4','方案模板','Solution/SolutionTemplate.aspx','PageHeaderFooter',10,'5FF7BBD8-3E0A-4C90-8976-AFF5CE7E17A5','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('9B42977B-FA0B-48EF-8616-D53FC14E5127','施工方案/审查','Solution/ConstructSolution.aspx','PageHeaderFooter',20,'5FF7BBD8-3E0A-4C90-8976-AFF5CE7E17A5','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('5B3D3F7B-9B50-4927-B131-11D13D4D1C19','危大工程施工方案清单','Solution/LargerHazardList.aspx','PageHeaderFooter',30,'5FF7BBD8-3E0A-4C90-8976-AFF5CE7E17A5','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('27DE7248-C4FF-4288-BBAC-11CB8741AD67','专家论证清单','Solution/ExpertArgumentList.aspx','PageHeaderFooter',40,'5FF7BBD8-3E0A-4C90-8976-AFF5CE7E17A5','Menu_Project',1,0)
		GO

	--应急响应管理
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('B6FBD6B6-F9A0-49B1-87F9-160748162131','应急响应管理','','SmartphoneDisk',50,'2A9D8CBC-137F-4199-A426-728F5D63FF2F','Menu_Project',0,0)
	GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('ABD84F93-A84E-448C-8A67-AB0FE4E8D10C','应急预案管理清单','Emergency/EmergencyList.aspx','PageHeaderFooter',10,'B6FBD6B6-F9A0-49B1-87F9-160748162131','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('CF5516F7-0735-44EF-9A6D-46FABF8EBC6E','应急演练开展情况','Emergency/DrillRecordList.aspx','PageHeaderFooter',20,'B6FBD6B6-F9A0-49B1-87F9-160748162131','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('39244F05-0D9E-4750-B12E-CEA5E11338A8','应急物资管理','Emergency/EmergencySupply.aspx','PageHeaderFooter',30,'B6FBD6B6-F9A0-49B1-87F9-160748162131','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('6FDF9DAE-2161-4F67-931F-85DEAFC3842A','应急队伍与培训','Emergency/EmergencyTeamAndTrain.aspx','PageHeaderFooter',40,'B6FBD6B6-F9A0-49B1-87F9-160748162131','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('A95A7C98-C186-4418-9C41-BD7775D85284','应急响应记录与评价','Emergency/EmergencyResponseRecord.aspx','PageHeaderFooter',50,'B6FBD6B6-F9A0-49B1-87F9-160748162131','Menu_Project',1,0)
		GO

--监测与测量
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('4651F6E3-8177-4669-A4D0-B92E0A69DB1F','监测与测量','','Bricks',30,'0','Menu_Project',0,0)
GO

	--检查管理
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('467A0CB9-737D-4451-965E-869EBC3A4BD6','检查管理','','FolderFind',10,'4651F6E3-8177-4669-A4D0-B92E0A69DB1F','Menu_Project',0,0)
	GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('9CEB4059-5826-4B8C-923C-6FE4131ED636','检查项目设置','Check/CheckItemSet.aspx','PageHeaderFooter',10,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('9F6FB863-4001-49BD-A748-66009891D13C','日常巡检','Check/CheckDay.aspx','PageHeaderFooter',20,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('0E30F917-0C51-4C45-BD19-981039CA44F5','日常巡检（五环）','Check/CheckDayWH.aspx','PageHeaderFooter',22,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('38FBBA77-8B35-470C-90EE-6861E6DDE03F','日常巡检(记录)','Check/CheckDayXA.aspx','PageHeaderFooter',25,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('1B08048F-93ED-4E84-AE65-DB7917EA2DFB','专项检查','Check/CheckSpecial.aspx','PageHeaderFooter',30,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('C198EBA8-9E23-4654-92E1-09C61105C522','综合检查','Check/CheckColligation.aspx','PageHeaderFooter',40,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('9212291A-FBC5-4F6D-A5F6-60BFF4E30F6F','开工前检查','Check/CheckWork.aspx','PageHeaderFooter',50,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('0D23A707-ADA0-4C2B-9665-611134243529','季节性/节假日检查','Check/CheckHoliday.aspx','PageHeaderFooter',60,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		GO
		
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('0038D764-D628-46F0-94FF-D0A22C3C45A3','隐患整改通知单','Check/RectifyNotice.aspx','PageHeaderFooter',80,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('C3B6B222-44DC-46F3-B783-B1FC0F743C48','隐患整改单(赛鼎)','Check/RectifyNotices.aspx','PageHeaderFooter',70,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('29F27641-06ED-435A-9F9B-FCE6366801BE','安全监督检查整改','Hazard/ProjectSuperviseCheckRectify.aspx','PageHeaderFooter',82,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		GO
		
		--INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		--VALUES('A6B2879F-73CD-490C-8843-1F2F25D6EC61','危险观察登记','Hazard/HazardRegister.aspx','PageHeaderFooter',73,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		--GO
			
		--INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		--VALUES('08BBEB1C-00CB-4929-95E1-1FED0E8FDA77','危险观察整改','Hazard/RegistrationHandle.aspx','PageHeaderFooter',75,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		--GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('B6BE5FE0-CB84-47FF-A6C3-5AD9E1CCE079','隐患巡检（手机端）','Check/Registration.aspx','PageHeaderFooter',85,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('9B2F84A8-50EB-49F1-A876-E2BE1524A941','隐患巡检记录（手机端）','Check/RegistrationRecord.aspx','PageHeaderFooter',87,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('17C25222-FDFD-469E-9AEE-33058FF1A3EE','汇总清单','Check/SummaryList.aspx','PageHeaderFooter',88,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('C81DB7ED-165E-4C69-86B0-A3AAE37059FE','工程暂停令','Check/PauseNotice.aspx','PageHeaderFooter',90,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('96F21A83-6871-4CC4-8901-1B99C376395C','奖励通知单','Check/IncentiveNotice.aspx','PageHeaderFooter',100,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('C13F1CE7-DAEF-4604-A13F-192621D28DF5','奖励统计','Check/IncentiveNoticeStatistics.aspx','PageHeaderFooter',15,'012DF857-AD6B-49AA-87A8-030CD5F66D4C','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('755F1C1D-2178-47D8-9F82-A501B53A2436','处罚通知单','Check/PunishNotice.aspx','PageHeaderFooter',110,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('CCD0E55B-300A-454B-8559-155ADAD386AE','处罚统计','Check/PunishNoticeStatistics.aspx','PageHeaderFooter',115,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('06958288-96F4-4291-909A-FFC2FC76814D','违规人员记录','Check/ViolationPerson.aspx','PageHeaderFooter',120,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('9A034CAD-C7D5-4DE4-9FF5-828D35FFEE28','获奖证书或奖杯','Check/HSECertificate.aspx','PageHeaderFooter',130,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('F910062E-98B0-486F-A8BD-D5B0035F808F','监理整改通知单','Check/SupervisionNotice.aspx','PageHeaderFooter',140,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('F057C207-4549-48AE-B838-A1920E5709D8','联系单','Check/ContactList.aspx','PageHeaderFooter',150,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
		GO
	--出入场管理
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('28C8EDB9-F1C2-4287-8013-28A976B093E2','出入场管理','','Lorry',20,'4651F6E3-8177-4669-A4D0-B92E0A69DB1F','Menu_Project',0,0)
	GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('3E167389-4775-4AC3-9D31-2E570682EDA1','特种设备机具入场报批','InApproveManager/EquipmentIn.aspx','PageHeaderFooter',10,'28C8EDB9-F1C2-4287-8013-28A976B093E2','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('A4832598-E3D4-4906-88E5-A3886A85FC5A','特种设备机具出场报批','InApproveManager/EquipmentOut.aspx','PageHeaderFooter',20,'28C8EDB9-F1C2-4287-8013-28A976B093E2','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('06EA1483-7397-46DD-818D-56911EA7B679','一般设备机具入场报批','InApproveManager/GeneralEquipmentIn.aspx','PageHeaderFooter',30,'28C8EDB9-F1C2-4287-8013-28A976B093E2','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('56F241A9-0AA3-4EDB-8C5C-999C487C06DA','一般设备机具出场报批','InApproveManager/GeneralEquipmentOut.aspx','PageHeaderFooter',40,'28C8EDB9-F1C2-4287-8013-28A976B093E2','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('32CA471B-86FD-420F-8DAA-FF16B5BEBBB4','普通货物入场报批','InApproveManager/GoodsIn.aspx','PageHeaderFooter',50,'28C8EDB9-F1C2-4287-8013-28A976B093E2','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('ADD37E84-923C-4AFA-BE37-670B40ABF0F7','普通货物出场报批','InApproveManager/GoodsOut.aspx','PageHeaderFooter',60,'28C8EDB9-F1C2-4287-8013-28A976B093E2','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('33327576-D346-45C9-9C97-805EB0C92EF2','气瓶入场报批','InApproveManager/GasCylinderIn.aspx','PageHeaderFooter',70,'28C8EDB9-F1C2-4287-8013-28A976B093E2','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('CB107947-AE48-466B-87F5-58BCA72FE1AC','气瓶出场报批','InApproveManager/GasCylinderOut.aspx','PageHeaderFooter',80,'28C8EDB9-F1C2-4287-8013-28A976B093E2','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('3D12E3FD-5AC3-485A-A39F-08689234450A','特种车辆入场审批','InApproveManager/CarIn.aspx','PageHeaderFooter',90,'28C8EDB9-F1C2-4287-8013-28A976B093E2','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('7087F8BB-DC8C-4A77-8E16-232E0B8481D2','普通车辆入场审批','InApproveManager/GeneralCarIn.aspx','PageHeaderFooter',100,'28C8EDB9-F1C2-4287-8013-28A976B093E2','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('42E7E869-67EA-446E-A910-BE7BF95EDC00','特种设备审批','InApproveManager/EquipmentQualityIn.aspx','PageHeaderFooter',110,'28C8EDB9-F1C2-4287-8013-28A976B093E2','Menu_Project',1,0)
		GO

    --作业许可证管理
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('473A87D2-1365-4A68-BD38-06F312F81BC2','作业许可管理','','MapError',30,'4651F6E3-8177-4669-A4D0-B92E0A69DB1F','Menu_Project',0,0)
	GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('0E9B7084-D021-4CA3-B9D2-9CBAA27A571B','现场作业许可证','License/LicenseManager.aspx','PageHeaderFooter',10,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('915F5AB2-CDCA-4025-A462-AC873D8FB037','新开项目作业许可证','License/SecurityLicense.aspx','PageHeaderFooter',20,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('9703D711-85DA-4A0B-B08B-70F791418696','施工机具、安全设施检查验收','License/EquipmentSafetyList.aspx','PageHeaderFooter',30,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('49485F7E-8E71-4EED-87B4-BF6CC180C69C','安全技术交底','License/HSETechnical.aspx','PageHeaderFooter',40,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B','动火作业票','License/FireWork.aspx','PageHeaderFooter',50,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9','高处作业票','License/HeightWork.aspx','PageHeaderFooter',60,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('AEC9166D-1C91-45F0-8BFE-D3D0479A28C7','受限空间作业票','License/LimitedSpace.aspx','PageHeaderFooter',70,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('F72FF20B-D3EB-46A5-97F7-C99B2473A140','射线作业票','License/RadialWork.aspx','PageHeaderFooter',80,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('4E607E83-41FC-4F49-B26F-A21CFE38328F','断路(占道)作业票','License/OpenCircuit.aspx','PageHeaderFooter',90,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('755C6AC9-2E38-4D4F-AF33-33CB1744A907','动土作业票','License/BreakGround.aspx','PageHeaderFooter',100,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('7BBAE649-7B00-4475-A911-BFE3A37AC55B','夜间施工作业票','License/NightWork.aspx','PageHeaderFooter',110,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('A1BE3AB6-9D4A-41E7-8870-E73423165451','吊装作业票','License/LiftingWork.aspx','PageHeaderFooter',120,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
		GO
	--HSSE行政管理
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('D58B9DEC-A09B-45B0-BD54-18592119BB49','行政管理','','Box',40,'4651F6E3-8177-4669-A4D0-B92E0A69DB1F','Menu_Project',0,0)
	GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('A25EB19A-F06E-4AAF-A589-E2B8F7FA7857','行政管理检查记录','Administrative/ManageCheck.aspx','PageHeaderFooter',20,'D58B9DEC-A09B-45B0-BD54-18592119BB49','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('CF82805A-84BE-400A-B939-83F7612D76F5','现场车辆管理','Administrative/CarManager.aspx','PageHeaderFooter',30,'D58B9DEC-A09B-45B0-BD54-18592119BB49','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('754C23CA-F1BC-4F44-9D34-B185099EDCA0','现场驾驶员管理','Administrative/DriverManager.aspx','PageHeaderFooter',40,'D58B9DEC-A09B-45B0-BD54-18592119BB49','Menu_Project',1,0)
		GO
		--INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		--VALUES('D55ACBCB-DE1C-4180-BA7D-3353C51D2B5F','职业健康管理','Administrative/HealthManage.aspx','PageHeaderFooter',40,'D58B9DEC-A09B-45B0-BD54-18592119BB49','Menu_Project',1,0)
		--GO

--项目级
--职业健康
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('7788B48E-8D80-4B22-BBD5-6192758E5DFC','职业健康','','FolderHeart',50,'4651F6E3-8177-4669-A4D0-B92E0A69DB1F','Menu_Project',0,0)
	GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('DD5E76FC-C45E-4F4F-8889-A2F4703F93DD','危害检测','OccupationHealth/HazardDetection.aspx','Page',10,'7788B48E-8D80-4B22-BBD5-6192758E5DFC','Menu_Project',1,0)
		GO
	
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('9EACCED2-B646-489C-84AD-1C22066F00AE','体检管理','OccupationHealth/PhysicalExamination.aspx','Page',20,'7788B48E-8D80-4B22-BBD5-6192758E5DFC','Menu_Project',1,0)
		GO
	
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('775B77C0-E28D-4746-BCFE-F3E927D515A8','职业病事故','OccupationHealth/OccupationalDiseaseAccident.aspx','Page',30,'7788B48E-8D80-4B22-BBD5-6192758E5DFC','Menu_Project',1,0)
		GO
	
		--环境保护
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('E765DADB-B7BF-4F01-AFBC-F20E9D2F62D6','环境保护','','BoxWorld',60,'4651F6E3-8177-4669-A4D0-B92E0A69DB1F','Menu_Project',0,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('342B5DEA-ECE1-46A4-BAA6-F0DB5276C769','环境监测数据','Environmental/EnvironmentalMonitoring.aspx','Page',10,'E765DADB-B7BF-4F01-AFBC-F20E9D2F62D6','Menu_Project',1,0)
		GO
	
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('74F23370-56D8-426E-822D-5E367F620546','突发环境事件','Environmental/UnexpectedEnvironmental.aspx','Page',20,'E765DADB-B7BF-4F01-AFBC-F20E9D2F62D6','Menu_Project',1,0)
		GO
		
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('3EF6E488-21D2-47BB-AA33-4FB0E9FED606','环境事件应急预案','Environmental/EnvironmentalEmergencyPlan.aspx','Page',30,'E765DADB-B7BF-4F01-AFBC-F20E9D2F62D6','Menu_Project',1,0)
		GO
		
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('97DCAFD1-DDA5-48B4-8E2D-E82702BA899B','环评报告','Environmental/EIAReport.aspx','Page',40,'E765DADB-B7BF-4F01-AFBC-F20E9D2F62D6','Menu_Project',1,0)
		GO
		

	--HSSE评价
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('D3576E49-DBC9-43EA-9822-EA5F4D96CA24','HSSE评价','','PagePaintbrush',70,'4651F6E3-8177-4669-A4D0-B92E0A69DB1F','Menu_Project',0,0)
	GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('EED8DBEE-83F6-4B5B-8382-AF40EB66B0A9','分包方绩效评价','Perfomance/PerfomanceRecord.aspx','PageHeaderFooter',10,'D3576E49-DBC9-43EA-9822-EA5F4D96CA24','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('1320A6D8-713B-43D4-BB00-CDA3DE6D24CB','个人绩效评价','Perfomance/PersonPerfomance.aspx','PageHeaderFooter',20,'D3576E49-DBC9-43EA-9822-EA5F4D96CA24','Menu_Project',1,0)
		GO

	--费用/物资管理
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('20ECB69E-28C4-4FAC-941A-15F446AEB634','安全投入费用','','ApplicationViewTile',80,'4651F6E3-8177-4669-A4D0-B92E0A69DB1F','Menu_Project',0,0)
	GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('EEE7CBBE-2EFB-4D64-96A6-A932E20FF9DB','安全费用计划','CostGoods/Expense.aspx','PageHeaderFooter',10,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('0C311396-C859-40B0-9D72-6A8B20733002','安全费用支出','CostGoods/CostSmallDetail.aspx','PageHeaderFooter',20,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId, MenuName, Url, Icon, SortIndex, SuperMenu, MenuType, IsEnd, IsUnit)
		VALUES('6FBF4B7D-21D2-4013-9465-12AC093109D4','HSE措施费使用计划','CostGoods/MeasuresPlan.aspx','PageHeaderFooter',21,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId, MenuName, Url, Icon, SortIndex, SuperMenu, MenuType, IsEnd, IsUnit)
		VALUES('9EFF1A0F-87AA-43E7-83B0-79EEAAC8848E','HSE费用投入登记','CostGoods/PayRegistration.aspx','PageHeaderFooter',22,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('FF68C697-B058-4687-A98F-71C591650E02','分包商HSE费用申请','CostGoods/CostManage.aspx','PageHeaderFooter',30,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('E7B8059B-304B-47C6-90C8-D88E4A3EC506','分包商HSE费用投入登记','CostGoods/SubPayRegistration.aspx','PageHeaderFooter',31,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('19C1370F-92C0-4E31-87B4-8BADA74113E4','合同HSE费用及支付台账','CostGoods/CostLedger.aspx','PageHeaderFooter',40,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('6488F005-95F2-4D49-BC95-6DF4C9B23F3D','安全分包费用','CostGoods/HSSECostUnitManage.aspx','PageHeaderFooter',50,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('0051CA27-83A3-4CAD-8A0B-64C4DFE3944C','安全分包费用审核','CostGoods/HSSECostUnitManageAudit.aspx','PageHeaderFooter',51,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
		GO	
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('8B71C8C4-0738-4D5F-8916-57FF3197709C','安全分包费用核定','CostGoods/HSSECostUnitManageRatified.aspx','PageHeaderFooter',52,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
		GO	
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('5C74F09D-FDE3-4995-A1D6-0549A8693940','安全费用管理','CostGoods/HSSECostManage.aspx','PageHeaderFooter',60,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
		GO
		--INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		--VALUES('89B42B7B-8AEE-4199-923E-81A602FC77E0','费用统计表','CostGoods/TC_Cost.aspx','PageHeaderFooter',50,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
		--GO

	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('E0B25140-82DF-43EB-9A76-6D56C128E41D','安全费用管理','','TableMultiple',80,'4651F6E3-8177-4669-A4D0-B92E0A69DB1F','Menu_Project',0,0)
	GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('3DC61C8A-7C54-49E0-96C4-DED9CC6BFD0B','HSSE物资管理','CostGoods/GoodsManage.aspx','PageHeaderFooter',60,'E0B25140-82DF-43EB-9A76-6D56C128E41D','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('FDA02FCA-4E23-469E-AB26-2D625D0E579A','物资入库管理','CostGoods/GoodsIn.aspx','PageHeaderFooter',70,'E0B25140-82DF-43EB-9A76-6D56C128E41D','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('881D6FE5-C281-4DA8-80CD-D7C6624796FC','物资出库管理','CostGoods/GoodsOut.aspx','PageHeaderFooter',80,'E0B25140-82DF-43EB-9A76-6D56C128E41D','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('B97B1C46-25B0-477B-9925-B6AB1D45204E','物资库存管理','CostGoods/GoodsStock.aspx','PageHeaderFooter',90,'E0B25140-82DF-43EB-9A76-6D56C128E41D','Menu_Project',1,0)
		GO
						
--HSSE事故处理/预防
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('0ED3E0CC-75E0-4FF3-8832-067217A6CD4D','事故处理/预防','','FolderBell',40,'0','Menu_Project',0,0)
GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('FB5C66FF-3BFB-490F-A14F-0DD5B5A4D110','HSSE事故(对人员)记录','Accident/AccidentPersonRecord.aspx','PageHeaderFooter',10,'0ED3E0CC-75E0-4FF3-8832-067217A6CD4D','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('9A9D6805-6C98-46E4-943E-130C4A3EB9A2','HSSE事故(含未遂)处理','Accident/AccidentHandle.aspx','PageHeaderFooter',20,'0ED3E0CC-75E0-4FF3-8832-067217A6CD4D','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('27C681E5-135A-414F-9FC2-D86D27805E6A','事故报告登记','Accident/AccidentReport.aspx','PageHeaderFooter',30,'0ED3E0CC-75E0-4FF3-8832-067217A6CD4D','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('B0A341A2-954A-4E24-BFC3-53D7F50628EE','事故调查处理报告','Accident/AccidentReportOther.aspx','PageHeaderFooter',40,'0ED3E0CC-75E0-4FF3-8832-067217A6CD4D','Menu_Project',1,0)
		GO  

--资料归类
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('FB475BB2-0E67-4E61-9B28-3F7F585D3796','资料归类','','BoxPicture',50,'0','Menu_Project',0,0)
GO

	--管理工作报告
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('03235B30-960D-4FCF-99F7-97773A2EE108','管理工作报告','','ApplicationViewColumns',10,'FB475BB2-0E67-4E61-9B28-3F7F585D3796','Menu_Project',0,0)
	GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('AE118E9C-C309-43B7-A198-8CA90A8D98EB','管理周报','Manager/ManagerWeek.aspx','PageHeaderFooter',10,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('5D006DDC-3AED-4E5A-8597-3C972D96F983','管理月报','Manager/ManagerMonth.aspx','PageHeaderFooter',20,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('363EB208-7BB1-4A55-85F3-2501B2F10B45','安全管理月报','Manager/ManagerMonthB.aspx','PageHeaderFooter',25,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
		GO
		INSERT INTO Sys_MenuProjectB (MenuId,MenuName,Url,Icon,SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)  
		VALUES('68A52EEA-2661-4CB0-9382-A36AA5DCC480','HSE管理月报','Manager/ManagerMonthC.aspx','PageHeaderFooter',26,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('A97295B1-86C5-45F6-B8EC-A520E8CF3A4B','项目HSE绩效管理报告','Manager/PerformanceManagementReport.aspx','PageHeaderFooter',27,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
		GO
		-- 安全生产月报（东华月报）
		INSERT INTO Sys_MenuProjectB (MenuId,MenuName,Url,Icon,SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)  
		VALUES('E18AF205-9C5B-40F8-B77B-B30C31B10BB5','安全生产月报','Manager/ManagerMonthD.aspx','PageHeaderFooter',27,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
		GO
		INSERT INTO Sys_MenuProjectB(MenuId,MenuName,Url,Icon,SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)  
		VALUES('D0EC3002-E1FA-457D-AC3B-4C7B2D71DD82','月报(赛鼎)','Manager/ManagerMonth_SeDin.aspx','PageHeaderFooter',28,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('28668BD9-3E14-438F-8BEE-24BAF6031B63','管理季报','Manager/ManagerQuarterly.aspx','PageHeaderFooter',30,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('88AE0EF8-D29E-409F-A154-CCA3999B00AE','HSSE完工报告','Manager/CompletionReport.aspx','PageHeaderFooter',40,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('3ADE41A3-4B0E-4D36-ABFF-ABB94519A943','管理工作总结','Manager/ManagerTotal.aspx','PageHeaderFooter',50,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('A9190CE2-EA31-421F-B733-8824B8A64EE2','现场HSSE工作顾客评价','Manager/ManagerPerformance.aspx','PageHeaderFooter',60,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('EF920FED-70A4-4789-B5DE-2F8220EEEF72','HSSE月总结','Manager/ManagerTotalMonth.aspx','PageHeaderFooter',70,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('BD19F5D9-24EA-483D-B734-25B65A5ECDB1','工程现场环境与职业健康月报','Manager/Health.aspx','PageHeaderFooter',80,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('04A15594-9DCA-46A3-9224-4DEAA0BC556E','分包商HSSE周报','Manager/SubManagerWeek.aspx','PageHeaderFooter',90,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('71519DDC-9FF1-4C05-9B31-F249B3ED0106','分包商HSSE月报','Manager/SubManagerMonth.aspx','PageHeaderFooter',100,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
		VALUES('54A3E23A-DAC7-484B-8C97-40AD785688FC','企业安全管理资料','SafetyData/ProjectSafetyData.aspx','PageHeaderFooter',110,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
		VALUES('75088181-ACE2-4CBE-90F9-DB043D46F04A','企业安全管理资料考核','SafetyData/ProjectSafetyDataCheck.aspx','PageHeaderFooter',120,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
		GO			
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('3E077A36-EC12-4FC7-B685-1F439291C9B8','HSE日志暨管理数据收集','Manager/HSSELog.aspx','PageHeaderFooter',130,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('E763BC17-EC0D-4AB3-A388-EC7F734B56F2','HSE经理暨HSE工程师细则','Manager/HSSELogMonth.aspx','PageHeaderFooter',140,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
		GO	
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('AB03E11C-8174-4B83-90F4-D07A3D933E1D','分包商上传周报','Manager/SubUploadWeek.aspx','PageHeaderFooter',145,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('BD16BE8D-0F4D-4C80-A4D7-707156B541B8','安全文件上报','Manager/ProjectSafeReport.aspx','PageHeaderFooter',150,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
		GO
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('8E5B4A8E-B06E-4C8A-A2C8-1091A9BCAF72','工程师HSE日志','Manager/HSEDiary.aspx','PageHeaderFooter',160,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
		GO
		
			--安全管理资料
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('5BB670AD-CCAA-4004-B931-70C5879A968B','安全管理资料','','ApplicationViewColumns',215,'0','Menu_Project',0,0)
GO

	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
	VALUES('BC3B7C4A-D69C-45CA-A951-98F4F64191BB','安全管理资料','SafetyDataE/ProjectSafetyDataE.aspx','PageHeaderFooter',10,'5BB670AD-CCAA-4004-B931-70C5879A968B','Menu_Project',1,0)
	GO

	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
	VALUES('8F2E3B63-8B98-44FC-8353-7F09DA86A463','安全管理资料考核','SafetyDataE/ProjectSafetyDataECheck.aspx','PageHeaderFooter',20,'5BB670AD-CCAA-4004-B931-70C5879A968B','Menu_Project',1,0)
	GO


	--信息管理
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('66DFD649-FBC2-463F-BD1A-04095D713C8E','信息管理','','ComputerMagnify',20,'FB475BB2-0E67-4E61-9B28-3F7F585D3796','Menu_Project',0,0)
	GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('B06EC998-60D2-4CBF-8080-9F000A1595AA','管理通知','InformationProject/Notice.aspx','PageHeaderFooter',10,'66DFD649-FBC2-463F-BD1A-04095D713C8E','Menu_Project',1,0)
		GO
		
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('16092FE7-938B-4713-8084-4FBFA030F386','HSSE宣传活动','InformationProject/PromotionalActivities.aspx','PageHeaderFooter',20,'66DFD649-FBC2-463F-BD1A-04095D713C8E','Menu_Project',1,0)
		GO
		
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('B58179BE-FE6E-4E91-84FC-D211E4692354','项目图片','InformationProject/Picture.aspx','PageHeaderFooter',40,'66DFD649-FBC2-463F-BD1A-04095D713C8E','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('4F5C00F3-DA7D-4B2D-B1EF-310DFFCA77DD','一般来文管理','InformationProject/ReceiveFileManager.aspx','PageHeaderFooter',50,'66DFD649-FBC2-463F-BD1A-04095D713C8E','Menu_Project',1,0)
		GO

	--定稿文件
	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('4EBDBF0A-53FC-4B86-BE6E-D6C16985A613','定稿文件','','PageHeaderFooter',30,'FB475BB2-0E67-4E61-9B28-3F7F585D3796','Menu_Project',0,0)
	GO
	
		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('C5354813-7B1E-4155-8EE8-D349BF2F18F4','业主管理文档','FinalFileManage/OwnerFinalFile.aspx','PageHeaderFooter',10,'4EBDBF0A-53FC-4B86-BE6E-D6C16985A613','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('719DA0D3-FA59-4A03-B6E0-6663A211956F','监理管理文档','FinalFileManage/FinalFileList.aspx','PageHeaderFooter',20,'4EBDBF0A-53FC-4B86-BE6E-D6C16985A613','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('B1C694BB-EF35-49B6-AEE4-0C5CA6803208','其他管理文档','FinalFileManage/OtherDocumentList.aspx','PageHeaderFooter',30,'4EBDBF0A-53FC-4B86-BE6E-D6C16985A613','Menu_Project',1,0)
		GO

		INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
		VALUES('24D6B764-7B91-46EB-9D80-A6073FC5720D','已定稿文件','FinalFileManage/HSEFinalFileList.aspx','PageHeaderFooter',40,'4EBDBF0A-53FC-4B86-BE6E-D6C16985A613','Menu_Project',1,0)
		GO

	

	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('05C6C2AF-3B0B-4BF0-A8CE-1FC15DAC3C54','项目文件夹','InformationProject/ProjectFolder.aspx','PageHeaderFooter',50,'FB475BB2-0E67-4E61-9B28-3F7F585D3796','Menu_Project',1,0)
	GO

	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('C69B7409-BE1E-4754-AC90-57B56EEE198B','文件柜A(检查类)','InformationProject/FileCabinetA.aspx','PageHeaderFooter',60,'FB475BB2-0E67-4E61-9B28-3F7F585D3796','Menu_Project',1,0)
	GO

	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('200019A4-E24F-4C87-8C52-9970F78DBF73','文件柜B(内业)','InformationProject/FileCabinetB.aspx','PageHeaderFooter',70,'FB475BB2-0E67-4E61-9B28-3F7F585D3796','Menu_Project',1,0)
	GO

	--INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	--VALUES('0D5571B4-6B74-4782-8050-53529AEA5E98','信息统计','InformationProject/InfoStatistic.aspx','PageHeaderFooter',80,'FB475BB2-0E67-4E61-9B28-3F7F585D3796','Menu_Project',1,0)
	--GO

--安全分析
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('14DD34F2-0682-48D6-A199-108297A9825E','安全分析','','ChartCurve',60,'0','Menu_Project',0,0)
GO
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('C763FEE5-B703-481A-BBDB-C85CE9B7846A','隐患分析(手机端)','InformationAnalysis/HazardAnalyse.aspx','PageHeaderFooter',10,'14DD34F2-0682-48D6-A199-108297A9825E','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('14C42C8E-8D3D-4D30-AA56-4F96828610AD','危险因素分析','InformationAnalysis/CheckAnalysis.aspx','PageHeaderFooter',20,'14DD34F2-0682-48D6-A199-108297A9825E','Menu_Project',1,0)
GO


--安全上报报表
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('C554E471-B740-4559-B543-E00F247289FD','集团安全报表上报','','Report',40,'0','Menu_Project',0,0)
GO

	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('6E7DC075-A7AF-4E42-8F8B-0174EFDD54A1','百万工时安全统计月报','InformationProject/MillionsMonthlyReport.aspx','PageHeaderFooter',10,'C554E471-B740-4559-B543-E00F247289FD','Menu_Project',1,0)
	GO

	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('38E948BA-E043-4E89-9038-0CE1B508FA19','职工伤亡事故原因分析报','InformationProject/AccidentCauseReport.aspx','PageHeaderFooter',20,'C554E471-B740-4559-B543-E00F247289FD','Menu_Project',1,0)
	GO

	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('8B17DC64-A4B9-4283-B7A1-D2E944205FA5','安全生产数据季报','InformationProject/SafetyQuarterlyReport.aspx','PageHeaderFooter',30,'C554E471-B740-4559-B543-E00F247289FD','Menu_Project',1,0)
	GO

	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('0CDFC1BE-0796-4817-ADB8-7A0B48655E00','应急演练开展情况季报','InformationProject/DrillConductedQuarterlyReport.aspx','PageHeaderFooter',40,'C554E471-B740-4559-B543-E00F247289FD','Menu_Project',1,0)
	GO

	INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('0973EE1C-CD2A-4116-BD67-1ABAD71D6C7C','应急演练工作计划半年报','InformationProject/DrillPlanHalfYearReport.aspx','PageHeaderFooter',50,'C554E471-B740-4559-B543-E00F247289FD','Menu_Project',1,0)
	GO