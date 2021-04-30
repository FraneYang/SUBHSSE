alter table dbo.Technique_ProjectSolutionTemplete alter column TempleteType nvarchar(50)
go	

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('179F286B-6DF8-414E-947F-82267076D4C8','施工方案类型*','BaseInfo/SolutionTempleteType.aspx','BookNext',270,'0','Menu_BaseInfo',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('BE742EF1-6E96-44E4-ACB1-D964D6572B3D','179F286B-6DF8-414E-947F-82267076D4C8','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('52793AC6-30FF-41AA-BF79-28EFB059459F','179F286B-6DF8-414E-947F-82267076D4C8','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('7E604782-870D-4C48-A8DE-F072F54CAF2B','179F286B-6DF8-414E-947F-82267076D4C8','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('98B1B662-629F-4702-BAAC-F6E8C75DC641','179F286B-6DF8-414E-947F-82267076D4C8','保存',4)   
GO


CREATE TABLE [dbo].[Base_SolutionTempleteType](
	[SolutionTempleteTypeCode] [nvarchar](50) NOT NULL,
	[SolutionTempleteTypeName] [nvarchar](50) NULL,
	[Remark] [nvarchar](500) NULL,
	[SortIndex] [int] NULL,
 CONSTRAINT [PK_Base_SolutionTempleteType_1] PRIMARY KEY CLUSTERED 
(
	[SolutionTempleteTypeCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_SolutionTempleteType', @level2type=N'COLUMN',@level2name=N'SolutionTempleteTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_SolutionTempleteType', @level2type=N'COLUMN',@level2name=N'SolutionTempleteTypeName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_SolutionTempleteType', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工方案模板类型表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_SolutionTempleteType'
GO




INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('1','地基处理',NULL,1)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('2','打桩',NULL,2)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('3','基坑支护与降水工程',NULL,3)  
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('4','土方开挖工程',NULL,4)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('5','模板工程',NULL,5)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('6','基础施工',NULL,6)	   
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('7','钢筋混凝土结构',NULL,7)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('8','地下管道',NULL,8)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('9','钢结构',NULL,9)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('10','设备安装',NULL,10)   
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('11','大型起重吊装工程',NULL,11)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('12','脚手架工程',NULL,12)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('13','机械安装',NULL,13)   
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('14','管道安装',NULL,14)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('15','电气仪表安装',NULL,15)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('16','防腐保温防火',NULL,16) 
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('17','拆除',NULL,17)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('18','爆破工程',NULL,18)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('19','试压',NULL,19)   
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('20','吹扫',NULL,20)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('21','试车',NULL,21)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('22','试车方案',NULL,22)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('23','无损检测',NULL,23)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('90','全部标准',NULL,90)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('91','其它',NULL,91)
GO

--环境危险源评价明细列表
ALTER VIEW [dbo].[View_Hazard_EnvironmentalRiskItem]  AS 
/*环境危险源评价明细列表视图*/
SELECT riskItem.EnvironmentalRiskItemId, 
	riskItem.EnvironmentalRiskListId, 
	riskItem.EType, 
	riskItem.ActivePoint,
	riskItem.EnvironmentalFactors,
	riskItem.AValue,
	riskItem.BValue,
	riskItem.CValue,
	riskItem.DValue,
	riskItem.EValue,
	(ISNULL(riskItem.AValue,0) + ISNULL(riskItem.BValue,0)+ ISNULL(riskItem.CValue,0)+ ISNULL(riskItem.DValue,0)+ ISNULL(riskItem.EValue,0)) AS ZValue1,
	riskItem.FValue,riskItem.GValue,(ISNULL(riskItem.FValue,0) + ISNULL(riskItem.GValue,0)) AS ZValue2,
	riskItem.SmallType,
	riskItem.IsImportant,
	riskItem.Code,
	Sys_ConstEType.ConstText AS ETypeName,
	Sys_ConstESmallType.ConstText AS SmallTypeName
	,riskItem.EnvironmentalId
	,riskItem.ControlMeasures
	,riskItem.Remark
FROM dbo.Hazard_EnvironmentalRiskItem AS riskItem
LEFT JOIN Sys_Const AS  Sys_ConstEType  ON riskItem.EType=Sys_ConstEType.ConstValue and Sys_ConstEType.GroupId='EnvironmentalType'
LEFT JOIN Sys_Const AS Sys_ConstESmallType ON riskItem.SmallType=Sys_ConstESmallType.ConstValue and Sys_ConstESmallType.GroupId='EnvironmentalSmallType'


GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('499E23C1-057C-4B04-B92A-973B1DACD546','安全制度','HSSESystem/SafetyInstitution.aspx','Page',30,'2572CDC8-BA26-4C74-B6F7-CB3D63E91E72','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('6FBBD758-50F5-4CE0-92C5-C257F9BAF6E9','499E23C1-057C-4B04-B92A-973B1DACD546','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('AE12A59C-9C6E-4567-B968-3D24126E28E0','499E23C1-057C-4B04-B92A-973B1DACD546','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B4FD39CE-F8ED-4FE7-A9B7-BCB0223ECE71','499E23C1-057C-4B04-B92A-973B1DACD546','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('EF6103C1-B51E-4DC3-8B80-2AF1F18D907B','499E23C1-057C-4B04-B92A-973B1DACD546','保存',4)
GO


CREATE TABLE [dbo].[HSSESystem_SafetyInstitution](
	[SafetyInstitutionId] [nvarchar](50) NOT NULL,
	[SafetyInstitutionName] [nvarchar](50) NULL,
	[EffectiveDate] [datetime] NULL,
	[Scope] [nvarchar](500) NULL,
	[Remark] [nvarchar](1000) NULL,
	[FileContents] [nvarchar](max) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
 CONSTRAINT [PK_HSSESystem_SafetyInstitution] PRIMARY KEY CLUSTERED 
(
	[SafetyInstitutionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSESystem_SafetyInstitution', @level2type=N'COLUMN',@level2name=N'SafetyInstitutionId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'制度名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSESystem_SafetyInstitution', @level2type=N'COLUMN',@level2name=N'SafetyInstitutionName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSESystem_SafetyInstitution', @level2type=N'COLUMN',@level2name=N'EffectiveDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用范围' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSESystem_SafetyInstitution', @level2type=N'COLUMN',@level2name=N'Scope'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSESystem_SafetyInstitution', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSESystem_SafetyInstitution', @level2type=N'COLUMN',@level2name=N'FileContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本部安全制度表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSESystem_SafetyInstitution'
GO




