alter table Check_IncentiveNotice add RewardType nchar(1) null
GO
alter table Check_ViolationPerson add HandleStep nchar(1) null
GO
--奖励类型
INSERT INTO Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES ('1F1F8341-5E14-4F3C-BD77-561FBC6B0109','1','安全明星奖',1,'RewardType')
GO
INSERT INTO Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES ('49B56FFB-8153-43F6-8650-DE23DD353C38','2','百万工时无事故奖',2,'RewardType')
GO
INSERT INTO Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES ('C5C64861-30C6-4FB2-B24D-4D81BF18981A','3','安全目标兑现奖',3,'RewardType')
GO
INSERT INTO Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES ('4DCEF45B-878F-4724-A76B-7AFFF22A4169','4','其它奖励',4,'RewardType')
GO
--违规人员处理措施
INSERT INTO Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES ('F28541A9-6C13-4506-9E42-B081F6820CE9','1','人员警告',1,'ViolationPersonHandleStep')
GO
INSERT INTO Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES ('C5F4198D-FCAF-4EB2-ABBD-8DB609CA8AB9','2','人员开除',2,'ViolationPersonHandleStep')
GO
--删除考核表对应计划表外键关系
ALTER TABLE [dbo].[SafetyData_SafetyDataCheckItem] DROP CONSTRAINT [FK_SafetyData_SafetyDataCheckItem_SafetyData_SafetyDataPlan]
GO
UPDATE  Sys_MenuProjectA SET MenuName='集团安全报表上报',SortIndex=250,SuperMenu='0' WHERE MenuId='C554E471-B740-4559-B543-E00F247289FD'
GO
UPDATE  Sys_MenuProjectB SET MenuName='集团安全报表上报',SortIndex=250,SuperMenu='0' WHERE MenuId='C554E471-B740-4559-B543-E00F247289FD'
GO
UPDATE dbo.Sys_Const SET ConstValue='6',SortIndex=6 WHERE ID='3C8DEDE0-E6C5-41C0-9113-9FD2DEEC3FC2'
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('01E3D64E-A302-429F-B22B-ADF5B650A73B','5','半年报',5,'SafetyDataCheckType')
GO