alter table dbo.Technique_ProjectSolutionTemplete alter column TempleteType nvarchar(50)
go	

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('179F286B-6DF8-414E-947F-82267076D4C8','ʩ����������*','BaseInfo/SolutionTempleteType.aspx','BookNext',270,'0','Menu_BaseInfo',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('BE742EF1-6E96-44E4-ACB1-D964D6572B3D','179F286B-6DF8-414E-947F-82267076D4C8','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('52793AC6-30FF-41AA-BF79-28EFB059459F','179F286B-6DF8-414E-947F-82267076D4C8','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('7E604782-870D-4C48-A8DE-F072F54CAF2B','179F286B-6DF8-414E-947F-82267076D4C8','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('98B1B662-629F-4702-BAAC-F6E8C75DC641','179F286B-6DF8-414E-947F-82267076D4C8','����',4)   
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_SolutionTempleteType', @level2type=N'COLUMN',@level2name=N'SolutionTempleteTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_SolutionTempleteType', @level2type=N'COLUMN',@level2name=N'SolutionTempleteTypeName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_SolutionTempleteType', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʩ������ģ�����ͱ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_SolutionTempleteType'
GO




INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('1','�ػ�����',NULL,1)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('2','��׮',NULL,2)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('3','����֧���뽵ˮ����',NULL,3)  
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('4','�������ڹ���',NULL,4)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('5','ģ�幤��',NULL,5)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('6','����ʩ��',NULL,6)	   
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('7','�ֽ�������ṹ',NULL,7)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('8','���¹ܵ�',NULL,8)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('9','�ֽṹ',NULL,9)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('10','�豸��װ',NULL,10)   
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('11','�������ص�װ����',NULL,11)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('12','���ּܹ���',NULL,12)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('13','��е��װ',NULL,13)   
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('14','�ܵ���װ',NULL,14)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('15','�����Ǳ�װ',NULL,15)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('16','�������·���',NULL,16) 
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('17','���',NULL,17)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('18','���ƹ���',NULL,18)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('19','��ѹ',NULL,19)   
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('20','��ɨ',NULL,20)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('21','�Գ�',NULL,21)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('22','�Գ�����',NULL,22)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('23','������',NULL,23)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('90','ȫ����׼',NULL,90)
INSERT INTO dbo.Base_SolutionTempleteType(SolutionTempleteTypeCode, SolutionTempleteTypeName, Remark,SortIndex)
VALUES('91','����',NULL,91)
GO

--����Σ��Դ������ϸ�б�
ALTER VIEW [dbo].[View_Hazard_EnvironmentalRiskItem]  AS 
/*����Σ��Դ������ϸ�б���ͼ*/
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
VALUES('499E23C1-057C-4B04-B92A-973B1DACD546','��ȫ�ƶ�','HSSESystem/SafetyInstitution.aspx','Page',30,'2572CDC8-BA26-4C74-B6F7-CB3D63E91E72','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('6FBBD758-50F5-4CE0-92C5-C257F9BAF6E9','499E23C1-057C-4B04-B92A-973B1DACD546','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('AE12A59C-9C6E-4567-B968-3D24126E28E0','499E23C1-057C-4B04-B92A-973B1DACD546','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B4FD39CE-F8ED-4FE7-A9B7-BCB0223ECE71','499E23C1-057C-4B04-B92A-973B1DACD546','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('EF6103C1-B51E-4DC3-8B80-2AF1F18D907B','499E23C1-057C-4B04-B92A-973B1DACD546','����',4)
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

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSESystem_SafetyInstitution', @level2type=N'COLUMN',@level2name=N'SafetyInstitutionId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƶ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSESystem_SafetyInstitution', @level2type=N'COLUMN',@level2name=N'SafetyInstitutionName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSESystem_SafetyInstitution', @level2type=N'COLUMN',@level2name=N'EffectiveDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʹ�÷�Χ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSESystem_SafetyInstitution', @level2type=N'COLUMN',@level2name=N'Scope'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSESystem_SafetyInstitution', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ı�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSESystem_SafetyInstitution', @level2type=N'COLUMN',@level2name=N'FileContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ȫ�ƶȱ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HSSESystem_SafetyInstitution'
GO




