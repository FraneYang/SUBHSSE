alter table Check_IncentiveNotice add RewardType nchar(1) null
GO
alter table Check_ViolationPerson add HandleStep nchar(1) null
GO
--��������
INSERT INTO Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES ('1F1F8341-5E14-4F3C-BD77-561FBC6B0109','1','��ȫ���ǽ�',1,'RewardType')
GO
INSERT INTO Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES ('49B56FFB-8153-43F6-8650-DE23DD353C38','2','����ʱ���¹ʽ�',2,'RewardType')
GO
INSERT INTO Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES ('C5C64861-30C6-4FB2-B24D-4D81BF18981A','3','��ȫĿ����ֽ�',3,'RewardType')
GO
INSERT INTO Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES ('4DCEF45B-878F-4724-A76B-7AFFF22A4169','4','��������',4,'RewardType')
GO
--Υ����Ա�����ʩ
INSERT INTO Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES ('F28541A9-6C13-4506-9E42-B081F6820CE9','1','��Ա����',1,'ViolationPersonHandleStep')
GO
INSERT INTO Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES ('C5F4198D-FCAF-4EB2-ABBD-8DB609CA8AB9','2','��Ա����',2,'ViolationPersonHandleStep')
GO
--ɾ�����˱��Ӧ�ƻ��������ϵ
ALTER TABLE [dbo].[SafetyData_SafetyDataCheckItem] DROP CONSTRAINT [FK_SafetyData_SafetyDataCheckItem_SafetyData_SafetyDataPlan]
GO
UPDATE  Sys_MenuProjectA SET MenuName='���Ű�ȫ�����ϱ�',SortIndex=250,SuperMenu='0' WHERE MenuId='C554E471-B740-4559-B543-E00F247289FD'
GO
UPDATE  Sys_MenuProjectB SET MenuName='���Ű�ȫ�����ϱ�',SortIndex=250,SuperMenu='0' WHERE MenuId='C554E471-B740-4559-B543-E00F247289FD'
GO
UPDATE dbo.Sys_Const SET ConstValue='6',SortIndex=6 WHERE ID='3C8DEDE0-E6C5-41C0-9113-9FD2DEEC3FC2'
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('01E3D64E-A302-429F-B22B-ADF5B650A73B','5','���걨',5,'SafetyDataCheckType')
GO