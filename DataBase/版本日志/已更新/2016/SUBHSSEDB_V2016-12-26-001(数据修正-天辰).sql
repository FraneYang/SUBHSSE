--修正费用类型[天辰]
DELETE FROM Base_CostType
GO
INSERT INTO [dbo].[Base_CostType]([CostTypeId],[CostTypeCode],[CostTypeName])
VALUES ('075044B1-11DF-4EB9-B53F-BCFD34FC865F','A1','基础管理')
GO
INSERT INTO [dbo].[Base_CostType]([CostTypeId],[CostTypeCode],[CostTypeName])
VALUES ('6D994C28-1D0D-4B74-BD35-6C265BFE1ABC','A2','安全技术')
GO
INSERT INTO [dbo].[Base_CostType]([CostTypeId],[CostTypeCode],[CostTypeName])
VALUES ('29F815BC-AA89-4F6B-A587-E26E9773A252','A3','职业健康')
GO
INSERT INTO [dbo].[Base_CostType]([CostTypeId],[CostTypeCode],[CostTypeName])
VALUES ('3CAEA0B1-2B6B-4D19-8A2E-B4736D3031C9','A4','安全防护')
GO
INSERT INTO [dbo].[Base_CostType]([CostTypeId],[CostTypeCode],[CostTypeName])
VALUES ('B30FD695-22BD-41C1-9E7A-47098B48F97A','A5','化工试车')
GO
INSERT INTO [dbo].[Base_CostType]([CostTypeId],[CostTypeCode],[CostTypeName])
VALUES ('97634E12-871C-45DF-834C-A81222C1A0DD','A6','教育培训')
GO
INSERT INTO [dbo].[Base_CostType]([CostTypeId],[CostTypeCode],[CostTypeName])
VALUES ('3B016940-83D8-463B-92B9-0F238720E819','B1','文明施工')
GO
INSERT INTO [dbo].[Base_CostType]([CostTypeId],[CostTypeCode],[CostTypeName])
VALUES ('60FDF403-C886-415A-893E-077E806C398D','B2','临时设施')
GO
INSERT INTO [dbo].[Base_CostType]([CostTypeId],[CostTypeCode],[CostTypeName])
VALUES ('0F07E4CF-82C7-45CD-893E-D0091EDE2EA4','B3','环境保护')
GO

---机具设备 [天辰]
DELETE FROM Base_SpecialEquipment
GO
INSERT INTO dbo.Base_SpecialEquipment(SpecialEquipmentId,SpecialEquipmentCode,SpecialEquipmentName,IsSpecial)
VALUES('AEDD6948-34C5-47D3-9A20-E3035FC669F2','01','锅炉',1)
GO
INSERT INTO dbo.Base_SpecialEquipment(SpecialEquipmentId,SpecialEquipmentCode,SpecialEquipmentName,IsSpecial)
VALUES('D91C6596-467E-46C9-8869-0281EE843335','02','压力容器',1)
GO
INSERT INTO dbo.Base_SpecialEquipment(SpecialEquipmentId,SpecialEquipmentCode,SpecialEquipmentName,IsSpecial)
VALUES('3389A68A-9B69-4CD6-A710-E637FFFAA44D','03','压力管道',1)
GO
INSERT INTO dbo.Base_SpecialEquipment(SpecialEquipmentId,SpecialEquipmentCode,SpecialEquipmentName,IsSpecial)
VALUES('24AD1B5C-5BCD-479D-BD44-4D491FA78C37','04','电梯',1)
GO
INSERT INTO dbo.Base_SpecialEquipment(SpecialEquipmentId,SpecialEquipmentCode,SpecialEquipmentName,IsSpecial)
VALUES('80915A01-982C-450A-B7CE-85354367C901','05','起重机械',1)
GO
INSERT INTO dbo.Base_SpecialEquipment(SpecialEquipmentId,SpecialEquipmentCode,SpecialEquipmentName,IsSpecial)
VALUES('E9AE3995-DB57-4ECF-8C4A-F418778D3D89','06','客运索道',1)
GO
INSERT INTO dbo.Base_SpecialEquipment(SpecialEquipmentId,SpecialEquipmentCode,SpecialEquipmentName,IsSpecial)
VALUES('6ADA9852-93DA-4B06-A99C-9CB6681EF9CE','07','大型游乐设施',1)
GO
INSERT INTO dbo.Base_SpecialEquipment(SpecialEquipmentId,SpecialEquipmentCode,SpecialEquipmentName,IsSpecial)
VALUES('D831BF1F-6C63-41A9-B367-8EAD8DEFA27C','08','场（厂）内专用机动车辆',1)
GO

--培训类型
DELETE FROM Base_TrainType
GO
INSERT INTO [dbo].[Base_TrainType]([TrainTypeId],[TrainTypeCode],[TrainTypeName],[IsAboutSendCard])
VALUES('dfb6a37e-4412-4ba9-ad59-3bc505bc21f7','01','员工入场安全教育',1)
GO
INSERT INTO [dbo].[Base_TrainType]([TrainTypeId],[TrainTypeCode],[TrainTypeName],[IsAboutSendCard])
VALUES('c1a513bb-a547-45b0-944d-b0dd88f06f82','02','管理人员HSSE程序和规定培训',0)
GO
INSERT INTO [dbo].[Base_TrainType]([TrainTypeId],[TrainTypeCode],[TrainTypeName],[IsAboutSendCard])
VALUES('0e7fdf78-eaa0-4d00-a60b-490040bbea18','03','专项安全培训',0)
GO


--培训类别
DELETE FROM Base_TrainLevel
GO
INSERT INTO [dbo].[Base_TrainLevel]([TrainLevelId],[TrainLevelCode],[TrainLevelName])
VALUES('60f3f108-e606-4136-ba72-2398e908bf08','01','一级培训')
GO
INSERT INTO [dbo].[Base_TrainLevel]([TrainLevelId],[TrainLevelCode],[TrainLevelName])
VALUES('19b88e39-cc07-4a6d-bafc-746362c210db','02','二级培训')
GO
INSERT INTO [dbo].[Base_TrainLevel]([TrainLevelId],[TrainLevelCode],[TrainLevelName])
VALUES('aa6cdd20-7152-4b6c-8369-ac1f9f163751','03','三级培训')
GO
INSERT INTO [dbo].[Base_TrainLevel]([TrainLevelId],[TrainLevelCode],[TrainLevelName])
VALUES('de14948e-d3cb-436b-a962-80f1490ee9a9','04','其他')
GO