UPDATE Sys_MenuCommon SET MenuName='项目安全管理资料' WHERE MenuId='0987D15D-3A2B-4B59-953A-A30B661E225A'
GO
UPDATE Sys_MenuCommon SET MenuName='安全管理资料设置' WHERE MenuId='60E00925-3357-441E-BD2F-2DF8C91BDDE6'
GO
UPDATE Sys_MenuCommon SET MenuName='安全管理资料考核计划' WHERE MenuId='039BD08A-9C38-4C28-81EE-A6CA86F580B2'
GO
UPDATE Sys_MenuCommon SET MenuName='项目安全管理资料' WHERE MenuId='74A51BC9-EE10-4534-A4A7-37889B07753C'
GO
UPDATE Sys_MenuCommon SET MenuName='安全管理资料考核' WHERE MenuId='2A405839-FD14-4398-8AEE-48B44BFDA1F6'
GO

UPDATE Sys_MenuProjectA SET MenuName='安全管理资料' WHERE MenuId='54A3E23A-DAC7-484B-8C97-40AD785688FC'
GO
UPDATE Sys_MenuProjectA SET MenuName='安全管理资料考核' WHERE MenuId='75088181-ACE2-4CBE-90F9-DB043D46F04A'
GO

UPDATE Sys_MenuProjectB SET MenuName='安全管理资料' WHERE MenuId='54A3E23A-DAC7-484B-8C97-40AD785688FC'
GO
UPDATE Sys_MenuProjectB SET MenuName='安全管理资料考核' WHERE MenuId='75088181-ACE2-4CBE-90F9-DB043D46F04A'
GO
UPDATE SafetyData_SafetyData SET CheckType=NULL,CheckTypeValue1=NULL,CheckTypeValue2=NULL WHERE IsEndLever=0
GO

ALTER TABLE SafetyData_SafetyDataCheckItem ADD CheckDate DATETIME NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考核节点（截至日期）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheckItem', @level2type=N'COLUMN',@level2name=N'CheckDate'
GO

/****** Object:  View [dbo].[View_SafetyDataCheckEditList]    Script Date: 2017/1/17 14:30:17 ******/
DROP VIEW [dbo].[View_SafetyDataCheckEditList]
GO
ALTER TABLE Manager_ManagerTotalMonth ADD MonthContent2 NVARCHAR(MAX) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月主要完成HSE工作量数据统计' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotalMonth', @level2type=N'COLUMN',@level2name=N'MonthContent2'
GO
ALTER TABLE Manager_ManagerTotalMonth ADD MonthContent3 NVARCHAR(MAX) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月具体HSE工作开展情况（包括不可接受风险与控制情况）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotalMonth', @level2type=N'COLUMN',@level2name=N'MonthContent3'
GO
ALTER TABLE Manager_ManagerTotalMonth ADD MonthContent4 NVARCHAR(MAX) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月HSE工作存在问题与处理（或拟采取对策）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotalMonth', @level2type=N'COLUMN',@level2name=N'MonthContent4'
GO
ALTER TABLE Manager_ManagerTotalMonth ADD MonthContent5 NVARCHAR(MAX) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下月工作计划' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotalMonth', @level2type=N'COLUMN',@level2name=N'MonthContent5'
GO
ALTER TABLE Manager_ManagerTotalMonth ADD MonthContent6 NVARCHAR(MAX) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其他' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotalMonth', @level2type=N'COLUMN',@level2name=N'MonthContent6'
GO

UPDATE dbo.Sys_MenuCommon SET Url='Manager/ManagerTotalMonthServer.aspx' WHERE MenuId='8051C9AA-801D-4001-9CB6-833CB407A169'
GO