--��������������ڶ�ʵ�ʵ�����ɾ����©ɾ�������ݣ��ʺϸ���ִ�У�

--ְҵΣ��
DELETE FROM Sys_FlowOperate 
WHERE MenuId='DD5E76FC-C45E-4F4F-8889-A2F4703F93DD' 
AND DataId NOT IN (SELECT FileId FROM OccupationHealth_HazardDetection)
GO

--������
DELETE FROM Sys_FlowOperate 
WHERE MenuId='9EACCED2-B646-489C-84AD-1C22066F00AE' 
AND DataId NOT IN (SELECT FileId FROM OccupationHealth_PhysicalExamination)
GO

--ְҵ���¹�
DELETE FROM Sys_FlowOperate 
WHERE MenuId='775B77C0-E28D-4746-BCFE-F3E927D515A8' 
AND DataId NOT IN (SELECT FileId FROM OccupationHealth_OccupationalDiseaseAccident)
GO


--�����������
DELETE FROM Sys_FlowOperate 
WHERE MenuId='342B5DEA-ECE1-46A4-BAA6-F0DB5276C769' 
AND DataId NOT IN (SELECT FileId FROM Environmental_EnvironmentalMonitoring)
GO

--ͻ�������¼�
DELETE FROM Sys_FlowOperate 
WHERE MenuId='74F23370-56D8-426E-822D-5E367F620546' 
AND DataId NOT IN (SELECT FileId FROM Environmental_UnexpectedEnvironmental)
GO

--�����¼�Ӧ��Ԥ��
DELETE FROM Sys_FlowOperate 
WHERE MenuId='3EF6E488-21D2-47BB-AA33-4FB0E9FED606' 
AND DataId NOT IN (SELECT FileId FROM Environmental_EnvironmentalEmergencyPlan)
GO

--��������
DELETE FROM Sys_FlowOperate 
WHERE MenuId='97DCAFD1-DDA5-48B4-8E2D-E82702BA899B' 
AND DataId NOT IN (SELECT FileId FROM Environmental_EIAReport)
GO


--���˼�Ч����
DELETE FROM Sys_FlowOperate 
WHERE MenuId='1320A6D8-713B-43D4-BB00-CDA3DE6D24CB' 
AND DataId NOT IN (SELECT PersonPerfomanceId FROM Perfomance_PersonPerfomance)
GO

--�ְ���Ч����
DELETE FROM Sys_FlowOperate 
WHERE MenuId='EED8DBEE-83F6-4B5B-8382-AF40EB66B0A9' 
AND DataId NOT IN (SELECT PerfomanceRecordId FROM Perfomance_PerfomanceRecord)
GO

--HSSE���ʹ���
DELETE FROM Sys_FlowOperate 
WHERE MenuId='3DC61C8A-7C54-49E0-96C4-DED9CC6BFD0B' 
AND DataId NOT IN (SELECT GoodsManageId FROM CostGoods_GoodsManage)
GO

--����������
DELETE FROM Sys_FlowOperate 
WHERE MenuId='FDA02FCA-4E23-469E-AB26-2D625D0E579A' 
AND DataId NOT IN (SELECT GoodsInId FROM CostGoods_GoodsIn)
GO

--���ʳ������
DELETE FROM Sys_FlowOperate 
WHERE MenuId='881D6FE5-C281-4DA8-80CD-D7C6624796FC' 
AND DataId NOT IN (SELECT GoodsOutId FROM CostGoods_GoodsOut)
GO

--�˹�ʱ�ձ�
DELETE FROM Sys_FlowOperate 
WHERE MenuId='8F15D3BE-BE21-4A6F-AD5C-2BBECEE46149' 
AND DataId NOT IN (SELECT DayReportId FROM SitePerson_DayReport)
GO

--�ְ�����
DELETE FROM Sys_FlowOperate 
WHERE MenuId='FF68C697-B058-4687-A98F-71C591650E02' 
AND DataId NOT IN (SELECT CostManageId FROM CostGoods_CostManage)
GO


--��ͨ�����볡����
DELETE FROM Sys_FlowOperate 
WHERE MenuId='7087F8BB-DC8C-4A77-8E16-232E0B8481D2' 
AND DataId NOT IN (SELECT GeneralCarInId FROM InApproveManager_GeneralCarIn)
GO
