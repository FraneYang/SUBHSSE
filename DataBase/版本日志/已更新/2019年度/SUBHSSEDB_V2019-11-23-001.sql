--班前会 新增单位ID
ALTER TABLE Meeting_ClassMeeting ADD UnitId nvarchar(50) null
go
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_ClassMeeting', @level2type=N'COLUMN',@level2name=N'UnitId'
GO
ALTER TABLE [dbo].[Meeting_ClassMeeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_ClassMeeting_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO
ALTER TABLE [dbo].[Meeting_ClassMeeting] CHECK CONSTRAINT [FK_Meeting_ClassMeeting_Base_Unit]
GO
update Meeting_ClassMeeting set UnitId=(select unitid from Sys_User a where a.UserId=Meeting_ClassMeeting.CompileMan)
go
--班前会 新增单位ID
ALTER TABLE Meeting_ClassMeeting ADD TeamGroupId nvarchar(50) null
go
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'班组ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_ClassMeeting', @level2type=N'COLUMN',@level2name=N'TeamGroupId'
GO
ALTER TABLE [dbo].[Meeting_ClassMeeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_ClassMeeting_ProjectData_TeamGroup] FOREIGN KEY([TeamGroupId])
REFERENCES [dbo].[ProjectData_TeamGroup] ([TeamGroupId])
GO
ALTER TABLE [dbo].[Meeting_ClassMeeting] CHECK CONSTRAINT [FK_Meeting_ClassMeeting_ProjectData_TeamGroup]
GO

--其他会议 新增单位ID
ALTER TABLE Meeting_AttendMeeting ADD UnitId nvarchar(50) null
go
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_AttendMeeting', @level2type=N'COLUMN',@level2name=N'UnitId'
GO
ALTER TABLE [dbo].[Meeting_AttendMeeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_AttendMeeting_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO
ALTER TABLE [dbo].[Meeting_AttendMeeting] CHECK CONSTRAINT [FK_Meeting_AttendMeeting_Base_Unit]
GO
update Meeting_AttendMeeting set UnitId=(select unitid from Sys_User a where a.UserId=Meeting_AttendMeeting.CompileMan)
go

--月例会 新增单位ID
ALTER TABLE Meeting_MonthMeeting ADD UnitId nvarchar(50) null
go
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_MonthMeeting', @level2type=N'COLUMN',@level2name=N'UnitId'
GO
ALTER TABLE [dbo].[Meeting_MonthMeeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_MonthMeeting_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO
ALTER TABLE [dbo].[Meeting_MonthMeeting] CHECK CONSTRAINT [FK_Meeting_MonthMeeting_Base_Unit]
GO
update Meeting_MonthMeeting set UnitId=(select unitid from Sys_User a where a.UserId=Meeting_MonthMeeting.CompileMan)
go
--专题会 新增单位ID
ALTER TABLE Meeting_SpecialMeeting ADD UnitId nvarchar(50) null
go
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_SpecialMeeting', @level2type=N'COLUMN',@level2name=N'UnitId'
GO
ALTER TABLE [dbo].[Meeting_SpecialMeeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_SpecialMeeting_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO
ALTER TABLE [dbo].[Meeting_SpecialMeeting] CHECK CONSTRAINT [FK_Meeting_SpecialMeeting_Base_Unit]
GO
update Meeting_SpecialMeeting set UnitId=(select unitid from Sys_User a where a.UserId=Meeting_SpecialMeeting.CompileMan)
go
--周例会 新增单位ID
ALTER TABLE Meeting_WeekMeeting ADD UnitId nvarchar(50) null
go
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_WeekMeeting', @level2type=N'COLUMN',@level2name=N'UnitId'
GO
ALTER TABLE [dbo].[Meeting_WeekMeeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_WeekMeeting_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO
ALTER TABLE [dbo].[Meeting_WeekMeeting] CHECK CONSTRAINT [FK_Meeting_WeekMeeting_Base_Unit]
GO
update Meeting_WeekMeeting set UnitId=(select unitid from Sys_User a where a.UserId=Meeting_WeekMeeting.CompileMan)
go

ALTER TABLE [dbo].[License_BreakGround] DROP CONSTRAINT [FK_License_BreakGround_Sys_User4]
GO
ALTER TABLE License_BreakGround ALTER COLUMN NextManId NVARCHAR(500) NULL
GO

ALTER TABLE [dbo].[License_FireWork] DROP CONSTRAINT [FK_License_FireWork_Sys_User4]
GO
ALTER TABLE License_FireWork ALTER COLUMN NextManId NVARCHAR(500) NULL
GO

ALTER TABLE [dbo].[License_HeightWork] DROP CONSTRAINT [FK_License_HeightWork_Sys_User4]
GO
ALTER TABLE License_HeightWork ALTER COLUMN NextManId NVARCHAR(500) NULL
GO

ALTER TABLE [dbo].[License_LiftingWork] DROP CONSTRAINT [FK_License_LiftingWork_Sys_User4]
GO
ALTER TABLE License_LiftingWork ALTER COLUMN NextManId NVARCHAR(500) NULL
GO

ALTER TABLE [dbo].[License_LimitedSpace] DROP CONSTRAINT [FK_License_LimitedSpace_Sys_User4]
GO
ALTER TABLE License_LimitedSpace ALTER COLUMN NextManId NVARCHAR(500) NULL
GO

ALTER TABLE [dbo].[License_NightWork] DROP CONSTRAINT [FK_License_NightWork_Sys_User4]
GO
ALTER TABLE License_NightWork ALTER COLUMN NextManId NVARCHAR(500) NULL
GO

ALTER TABLE [dbo].[License_OpenCircuit] DROP CONSTRAINT [FK_License_OpenCircuit_Sys_User4]
GO
ALTER TABLE License_OpenCircuit ALTER COLUMN NextManId NVARCHAR(500) NULL
GO

ALTER TABLE [dbo].[License_RadialWork] DROP CONSTRAINT [FK_License_RadialWork_Sys_User4]
GO
ALTER TABLE License_RadialWork ALTER COLUMN NextManId NVARCHAR(500) NULL
GO

-- 流程表新增组号、组内序号字段
ALTER TABLE Sys_MenuFlowOperate ADD GroupNum INT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuFlowOperate', @level2type=N'COLUMN',@level2name=N'GroupNum'
GO
ALTER TABLE License_FlowOperate ADD GroupNum INT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FlowOperate', @level2type=N'COLUMN',@level2name=N'GroupNum'
GO

ALTER TABLE Sys_MenuFlowOperate ADD OrderNum INT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组内序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_MenuFlowOperate', @level2type=N'COLUMN',@level2name=N'OrderNum'
GO
ALTER TABLE License_FlowOperate ADD OrderNum INT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组内序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FlowOperate', @level2type=N'COLUMN',@level2name=N'OrderNum'
GO
UPDATE Sys_MenuFlowOperate SET GroupNum=1
GO
UPDATE Sys_MenuFlowOperate SET OrderNum=1
GO

UPDATE License_FlowOperate SET GroupNum=1
GO
UPDATE License_FlowOperate SET OrderNum=1
GO

--删除 作业票流程
DELETE FROM Sys_MenuFlowOperate WHERE MENUID IN ('2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B',
'DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9',
'AEC9166D-1C91-45F0-8BFE-D3D0479A28C7',
'F72FF20B-D3EB-46A5-97F7-C99B2473A140',
'4E607E83-41FC-4F49-B26F-A21CFE38328F',
'755C6AC9-2E38-4D4F-AF33-33CB1744A907',
'7BBAE649-7B00-4475-A911-BFE3A37AC55B',
'A1BE3AB6-9D4A-41E7-8870-E73423165451')
GO
--动火作业票
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('0c1a6c13-1cb8-45e8-a415-d93c4f2dd4c0','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B',1,1,1,'施工单位安全人员意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('211e7843-7986-4fd3-80ef-a0d01c0d1261','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B',2,1,1,'总包单位安全人员意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('ac7d5fec-6bfe-4fbe-b385-1617691fa13f','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B',3,1,1,'总包单位专业工程师意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('d8477641-40ef-485e-92b7-3c5ddce7b9ce','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B',3,1,2,'总包单位施工经理意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('10cdd8f4-2d0b-42c1-88ca-d611f7f66d2f','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B',3,2,1,'监理单位意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('d74202f4-355c-4c58-86bd-8588479a66bc','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B',3,2,2,'业主单位意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('dc0fc1b6-f9bf-4810-94fb-473e8f9721d5','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B',4,1,1,'完成',1)
GO
--高处作业票
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('817F4373-5A30-4197-9793-5ACB0152E80F','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9',1,1,1,'施工单位安全人员意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('BF3A7FAD-6265-4228-ACB4-03DCA3581270','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9',2,1,1,'总包单位安全人员意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('A71C71E1-9BAB-4AF6-A0DC-BFF18299FFEA','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9',3,1,1,'总包单位专业工程师意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('6630FC39-44FB-4B50-BA0D-7DEDB628F5EE','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9',3,1,2,'总包单位施工经理意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('6203E470-7D7A-48B4-9E18-B1080E94EE4C','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9',3,2,1,'监理单位意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('8597338C-F2EF-462C-9E4D-79620DF3FF7A','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9',3,2,2,'业主单位意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('45CAC29E-986E-4FCE-BE6F-C1FE085A0AD6','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9',4,1,1,'完成',1)
GO
--受限空间作业票
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('034452AD-92AB-4956-ACF6-BE89FE01BECE','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7',1,1,1,'施工单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('A0F4DE31-59C6-4DF9-B6AB-B559BC70FCAB','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7',2,1,1,'总包单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('A41B5815-8D40-4EB7-89EC-2A5E18D8EE8A','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7',3,1,1,'总包单位专业工程师意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('B72FAA80-D647-41EB-89B7-0A4A48DC53ED','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7',3,1,2,'总包单位施工经理意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('345D81F5-7D00-4852-AC4D-11C6A7AAE749','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7',3,2,1,'监理单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('AE47F6FA-6D25-40F8-9713-F004296CD084','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7',3,2,2,'业主单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('B34C3254-91A5-45B9-8592-CBE7BCA2AF60','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7',4,1,1,'完成',1)
GO
--射线作业票
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('FD0271ED-6CAB-4FC2-8645-E530F0724A79','F72FF20B-D3EB-46A5-97F7-C99B2473A140',1,1,1,'施工单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('98448443-8BB2-4D29-B174-FF0EADD4711D','F72FF20B-D3EB-46A5-97F7-C99B2473A140',2,1,1,'总包单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('EAC9F894-0ED7-49D3-A397-88B53E5C1D74','F72FF20B-D3EB-46A5-97F7-C99B2473A140',3,1,1,'总包单位专业工程师意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('E5CE0A69-CF76-4685-A164-7F665DA26627','F72FF20B-D3EB-46A5-97F7-C99B2473A140',3,1,2,'总包单位施工经理意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('9E7AED69-34C9-4EEB-9E0B-68B22423D5E6','F72FF20B-D3EB-46A5-97F7-C99B2473A140',3,2,1,'监理单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('51DE33BA-7876-4F1D-9077-2DA68092FED3','F72FF20B-D3EB-46A5-97F7-C99B2473A140',3,2,2,'业主单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('1D75313C-8C94-416B-84CE-37A41E376A76','F72FF20B-D3EB-46A5-97F7-C99B2473A140',4,1,1,'完成',1)
GO
--断路(占道)作业票
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('FE783A32-17ED-4BFC-917B-413C8DB246CC','4E607E83-41FC-4F49-B26F-A21CFE38328F',1,1,1,'施工单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('EEA2A984-C229-48A5-972B-1D99D2C18475','4E607E83-41FC-4F49-B26F-A21CFE38328F',2,1,1,'总包单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('D0C91634-29A7-43E2-98A3-62FA148AA517','4E607E83-41FC-4F49-B26F-A21CFE38328F',3,1,1,'总包单位专业工程师意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('13FE0C64-AE97-47E9-8637-6904A87ECCE9','4E607E83-41FC-4F49-B26F-A21CFE38328F',3,1,2,'总包单位施工经理意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('E1DF6AA4-B876-4A5C-A837-9963C9486E7C','4E607E83-41FC-4F49-B26F-A21CFE38328F',3,2,1,'监理单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('C020FDEB-CDAA-4141-A36D-C61ECE95E8DE','4E607E83-41FC-4F49-B26F-A21CFE38328F',3,2,2,'业主单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('6BA6D160-3D1C-4333-92E1-996A3F13AECC','4E607E83-41FC-4F49-B26F-A21CFE38328F',4,1,1,'完成',1)
GO
--动土作业票
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('755C6AC9-2E38-4D4F-AF33-33CB1744A9071','755C6AC9-2E38-4D4F-AF33-33CB1744A907',1,1,1,'施工单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('755C6AC9-2E38-4D4F-AF33-33CB1744A9072','755C6AC9-2E38-4D4F-AF33-33CB1744A907',2,1,1,'总包单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('755C6AC9-2E38-4D4F-AF33-33CB1744A9073','755C6AC9-2E38-4D4F-AF33-33CB1744A907',3,1,1,'总包单位专业工程师意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('755C6AC9-2E38-4D4F-AF33-33CB1744A9074','755C6AC9-2E38-4D4F-AF33-33CB1744A907',3,1,2,'总包单位施工经理意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('755C6AC9-2E38-4D4F-AF33-33CB1744A9075','755C6AC9-2E38-4D4F-AF33-33CB1744A907',3,2,1,'监理单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('755C6AC9-2E38-4D4F-AF33-33CB1744A9076','755C6AC9-2E38-4D4F-AF33-33CB1744A907',3,2,2,'业主单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('755C6AC9-2E38-4D4F-AF33-33CB1744A9077','755C6AC9-2E38-4D4F-AF33-33CB1744A907',4,1,1,'完成',1)
GO
--夜间施工作业票
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('7BBAE649-7B00-4475-A911-BFE3A37AC55B1','7BBAE649-7B00-4475-A911-BFE3A37AC55B',1,1,1,'施工单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('7BBAE649-7B00-4475-A911-BFE3A37AC55B2','7BBAE649-7B00-4475-A911-BFE3A37AC55B',2,1,1,'总包单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('7BBAE649-7B00-4475-A911-BFE3A37AC55B3','7BBAE649-7B00-4475-A911-BFE3A37AC55B',3,1,1,'总包单位专业工程师意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('7BBAE649-7B00-4475-A911-BFE3A37AC55B4','7BBAE649-7B00-4475-A911-BFE3A37AC55B',3,1,2,'总包单位施工经理意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('7BBAE649-7B00-4475-A911-BFE3A37AC55B5','7BBAE649-7B00-4475-A911-BFE3A37AC55B',3,2,1,'监理单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('7BBAE649-7B00-4475-A911-BFE3A37AC55B6','7BBAE649-7B00-4475-A911-BFE3A37AC55B',3,2,2,'业主单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('7BBAE649-7B00-4475-A911-BFE3A37AC55B7','7BBAE649-7B00-4475-A911-BFE3A37AC55B',4,1,1,'完成',1)
GO
--吊装作业票
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('A1BE3AB6-9D4A-41E7-8870-E734231654511','A1BE3AB6-9D4A-41E7-8870-E73423165451',1,1,1,'施工单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('A1BE3AB6-9D4A-41E7-8870-E734231654512','A1BE3AB6-9D4A-41E7-8870-E73423165451',2,1,1,'总包单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('A1BE3AB6-9D4A-41E7-8870-E734231654513','A1BE3AB6-9D4A-41E7-8870-E73423165451',3,1,1,'总包单位专业工程师意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('A1BE3AB6-9D4A-41E7-8870-E734231654514','A1BE3AB6-9D4A-41E7-8870-E73423165451',3,1,2,'总包单位施工经理意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('A1BE3AB6-9D4A-41E7-8870-E734231654515','A1BE3AB6-9D4A-41E7-8870-E73423165451',3,2,1,'监理单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('A1BE3AB6-9D4A-41E7-8870-E734231654516','A1BE3AB6-9D4A-41E7-8870-E73423165451',3,2,2,'业主单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,GroupNum,OrderNum,AuditFlowName,IsFlowEnd)
VALUES('A1BE3AB6-9D4A-41E7-8870-E734231654517','A1BE3AB6-9D4A-41E7-8870-E73423165451',4,1,1,'完成',1)
GO

--新增用户浏览表
CREATE TABLE [dbo].[Sys_UserRead](
	[UserReadId] [nvarchar](50) NOT NULL,
	[UserId] [nvarchar](50) NULL,
	[MenuId] [nvarchar](50) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[DataId] [nvarchar](50) NULL,
	[ReadTime] [datetime] NULL,
 CONSTRAINT [PK_Sys_UserRead] PRIMARY KEY CLUSTERED 
(
	[UserReadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Sys_UserRead]  WITH CHECK ADD  CONSTRAINT [FK_Sys_UserRead_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Sys_UserRead] CHECK CONSTRAINT [FK_Sys_UserRead_Base_Project]
GO

ALTER TABLE [dbo].[Sys_UserRead]  WITH CHECK ADD  CONSTRAINT [FK_Sys_UserRead_Sys_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Sys_UserRead] CHECK CONSTRAINT [FK_Sys_UserRead_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserRead', @level2type=N'COLUMN',@level2name=N'UserReadId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserRead', @level2type=N'COLUMN',@level2name=N'UserId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserRead', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserRead', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单据ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserRead', @level2type=N'COLUMN',@level2name=N'DataId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserRead', @level2type=N'COLUMN',@level2name=N'ReadTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户浏览表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_UserRead'
GO