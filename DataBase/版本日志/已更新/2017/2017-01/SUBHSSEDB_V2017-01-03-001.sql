--常量表:企业安全管理资料考核类型
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('48A8C791-50EB-449A-B350-0FF77F4D8D44','1','月报',1,'SafetyDataCheckType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('C0451870-70F6-4823-A1B3-9B49CA42B91B','2','季报',2,'SafetyDataCheckType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('69B934E2-A377-4509-BE3D-C344FDA13E4C','3','定时报',3,'SafetyDataCheckType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('5C08FF81-AD70-4391-A42B-01688BD3AD15','4','开工后报',4,'SafetyDataCheckType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('3C8DEDE0-E6C5-41C0-9113-9FD2DEEC3FC2','5','其他',5,'SafetyDataCheckType')
GO

ALTER TABLE SafetyData_SafetyData ADD CheckType NVARCHAR(10) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表考核类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyData', @level2type=N'COLUMN',@level2name=N'CheckType'
GO

ALTER TABLE SafetyData_SafetyData ADD CheckTypeValue1 INT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表考核类型值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyData', @level2type=N'COLUMN',@level2name=N'CheckTypeValue1'
GO
ALTER TABLE SafetyData_SafetyData ADD CheckTypeValue2 INT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报表考核类型值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyData', @level2type=N'COLUMN',@level2name=N'CheckTypeValue2'
GO

INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('54260F45-3072-40DA-AE94-CCA60690FB9A','039BD08A-9C38-4C28-81EE-A6CA86F580B2','删除',1)
GO

ALTER TABLE SafetyData_SafetyDataCheckItem ADD Remark NVARCHAR(500) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheckItem', @level2type=N'COLUMN',@level2name=N'Remark'
GO

ALTER TABLE SafetyData_SafetyDataCheckItem ADD SafetyDataPlanId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划单Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataCheckItem', @level2type=N'COLUMN',@level2name=N'SafetyDataPlanId'
GO

ALTER TABLE [dbo].[SafetyData_SafetyDataCheckItem]  WITH CHECK ADD  CONSTRAINT [FK_SafetyData_SafetyDataCheckItem_SafetyData_SafetyDataPlan] FOREIGN KEY([SafetyDataPlanId])
REFERENCES [dbo].[SafetyData_SafetyDataPlan] ([SafetyDataPlanId])
GO

ALTER TABLE [dbo].[SafetyData_SafetyDataCheckItem] CHECK CONSTRAINT [FK_SafetyData_SafetyDataCheckItem_SafetyData_SafetyDataPlan]
GO

CREATE VIEW [dbo].[View_SafetyDataCheckEditList]  AS 
/*未加入考核表的企业安全管理资料考核计划数据集合*/
SELECT sPlan.SafetyDataPlanId
,sPlan.ProjectId
,sPlan.SafetyDataId
,sPlan.CheckDate
,sPlan.RealStartDate
,sPlan.RealEndDate
,sPlan.Score
,sPlan.Remark
FROM SafetyData_SafetyDataPlan AS sPlan
LEFT JOIN SafetyData_SafetyDataCheckItem AS Item ON sPlan.SafetyDataPlanId =Item.SafetyDataPlanId
WHERE Item.SafetyDataCheckItemId IS NULL

GO

ALTER TABLE SafetyData_SafetyDataItem ADD SubmitDate DATETIME NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提交时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SafetyData_SafetyDataItem', @level2type=N'COLUMN',@level2name=N'SubmitDate'
GO
 
 ALTER TABLE SafetyData_SafetyDataCheckItem DROP COLUMN   State
 GO