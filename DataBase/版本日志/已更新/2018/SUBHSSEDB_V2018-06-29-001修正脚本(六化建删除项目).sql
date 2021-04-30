
delete from InApproveManager_EquipmentIn where ProjectId='d532c980-f87c-4057-be65-dc968ccb672b'
delete from InApproveManager_EquipmentOut where ProjectId='d532c980-f87c-4057-be65-dc968ccb672b'
delete from ActionPlan_ManagerRule where ProjectId='d532c980-f87c-4057-be65-dc968ccb672b'
delete from ManagementReport_ReportRemind where ProjectId='d532c980-f87c-4057-be65-dc968ccb672b'
delete from InformationProject_FileCabinetAItem where FileCabinetAId 
in (select FileCabinetAId from InformationProject_FileCabinetA where ProjectId='d532c980-f87c-4057-be65-dc968ccb672b')
delete from InformationProject_FileCabinetA where ProjectId='d532c980-f87c-4057-be65-dc968ccb672b'
delete from SecuritySystem_SafetyInstitution where ProjectId='d532c980-f87c-4057-be65-dc968ccb672b'
delete from CostGoods_ExpenseDetail where ExpenseId in
( select ExpenseId from CostGoods_Expense where ProjectId='d532c980-f87c-4057-be65-dc968ccb672b')
delete from CostGoods_Expense where ProjectId='d532c980-f87c-4057-be65-dc968ccb672b'

delete from Sys_CodeRecords where ProjectId='d532c980-f87c-4057-be65-dc968ccb672b'
delete from ActionPlan_ActionPlanList where ProjectId='d532c980-f87c-4057-be65-dc968ccb672b'
delete from Sys_FlowOperate where ProjectId='d532c980-f87c-4057-be65-dc968ccb672b'
delete from SecuritySystem_SafetyManageOrganization where ProjectId='d532c980-f87c-4057-be65-dc968ccb672b'

delete from Check_ProjectCheckItemDetail where CheckItemSetId in
(select  CheckItemSetId from Check_ProjectCheckItemSet where ProjectId='d532c980-f87c-4057-be65-dc968ccb672b')
delete from Check_ProjectCheckItemSet where ProjectId='d532c980-f87c-4057-be65-dc968ccb672b'
delete from Sys_Log where ProjectId='d532c980-f87c-4057-be65-dc968ccb672b'

delete from Base_Project where ProjectId='d532c980-f87c-4057-be65-dc968ccb672b'