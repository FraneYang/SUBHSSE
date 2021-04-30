--������:��������
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('96D3669D-9496-4BAB-9EC3-B2A835AD6285','1','��',1,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('985A299C-E63F-46B9-A533-A5CFACBFF430','2','����',2,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('61174112-CA6B-46C6-8751-C6E31DB1C1F0','3','��',3,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('C3A2DDFE-CFC3-4ECE-B2FD-6688965DE684','4','����',4,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('E4EF7E95-1CA7-4462-8762-1177E5B617A3','5','������',5,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('79739C15-08CC-4F94-A486-AF3E88BB6981','6','���ѩ',6,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('454AAE20-A665-47AA-A7B1-40A405874753','7','С��',7,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('91EFD90C-6380-4DFA-B4EE-7AF4CAA79669','8','����',8,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('9F9736ED-B8C0-455E-85DE-138522416C52','9','����',9,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('B0639D12-530D-42C0-827D-D90A70561A00','10','����',10,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('A71E625C-1A48-40C2-B012-9C3CDA705244','11','��ѩ',11,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('B2E53A18-462C-4081-AE25-7E578C96B11B','12','Сѩ',12,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('F72F69AE-2955-4A36-88AD-0DEC30510F31','13','��ѩ',13,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('22A603C1-2E8B-4948-8200-7429A3C285D8','14','��ѩ',14,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('8A6BD09C-5ED7-4BEF-A16E-A0103FAC06FD','15','��ѩ',15,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('14EE260C-7055-4779-98FB-A05315B8E3DD','16','��',16,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('552AD25B-9029-46E3-9D27-32262F9DBF75','17','ɳ����',17,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('D62673F3-C602-441E-A340-4731811C9019','18','����',18,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('BFA7547B-3732-4BBD-A972-A6FF8322E57E','19','��ɳ',19,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('46797BDA-AF10-46F1-91D5-7B91B21BD951','20','��',20,'Weather')
GO



--������:�����ʩ
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('3DB4A7BE-A9AC-47E9-9C63-E3804F6782A9','1','��������',1,'HandleStep')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('A875A010-92E6-49DD-9825-20B50101FA5D','2','��ͷ����',2,'HandleStep')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('ACAC4FB5-4466-4089-A059-71A7A5572288','3','��������֪ͨ��',3,'HandleStep')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('4957AD1E-9BE5-4A7F-8E16-3B7D02BFB895','4','HSSE����֪ͨ��',4,'HandleStep')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('A661BAF8-6F61-4DB7-B152-FC3339F11E6D','5','��ʱ����',5,'HandleStep')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('70E31BBD-C01B-4D7F-8F0E-D1E56B84B091','6','����',6,'HandleStep')
GO

CREATE TABLE [dbo].[Check_CheckDay](
	[CheckDayId] [nvarchar](50) NOT NULL,
	[CheckDayCode] [nvarchar](50) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[WeatherId] [nvarchar](50) NULL,
	[CheckPerson] [nvarchar](50) NULL,
	[CheckTime] [datetime] NULL,
	[DaySummary] [nvarchar](max) NULL,
	[ScanUrl] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Check_CheckDay_1] PRIMARY KEY CLUSTERED 
(
	[CheckDayId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDay', @level2type=N'COLUMN',@level2name=N'CheckDayId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ճ�Ѳ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDay', @level2type=N'COLUMN',@level2name=N'CheckDayCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDay', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDay', @level2type=N'COLUMN',@level2name=N'WeatherId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDay', @level2type=N'COLUMN',@level2name=N'CheckPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDay', @level2type=N'COLUMN',@level2name=N'CheckTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����������С��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDay', @level2type=N'COLUMN',@level2name=N'DaySummary'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ճ�Ѳ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDay'
GO

ALTER TABLE [dbo].[Check_CheckDay]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckDay_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Check_CheckDay] CHECK CONSTRAINT [FK_Check_CheckDay_Base_Project]
GO












CREATE TABLE [dbo].[Check_CheckDayDetail](
	[CheckDayDetailId] [nvarchar](50) NOT NULL,
	[CheckDayId] [nvarchar](50) NULL,
	[CheckItem] [nvarchar](50) NULL,
	[CheckItemType] [nvarchar](50) NULL,
	[Unqualified] [nvarchar](500) NULL,
	[CheckArea] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[HandleStep] [nvarchar](50) NULL,
	[CompleteStatus] [nvarchar](200) NULL,
	[RectifyNoticeId] [nvarchar](50) NULL,
	[LimitedDate] [datetime] NULL,
	[CompletedDate] [datetime] NULL,
	[Suggestions] [nvarchar](500) NULL,
 CONSTRAINT [PK_Check_CheckDayDetail] PRIMARY KEY CLUSTERED 
(
	[CheckDayDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ϸ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayDetail', @level2type=N'COLUMN',@level2name=N'CheckDayDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ճ�Ѳ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayDetail', @level2type=N'COLUMN',@level2name=N'CheckDayId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayDetail', @level2type=N'COLUMN',@level2name=N'CheckItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayDetail', @level2type=N'COLUMN',@level2name=N'CheckItemType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ϸ��������������ʩ ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayDetail', @level2type=N'COLUMN',@level2name=N'Unqualified'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��� ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayDetail', @level2type=N'COLUMN',@level2name=N'CheckArea'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ε�λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayDetail', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ʩ��������������������֪ͨ������Ա���桢��Ա������HSSE����֪ͨ����������ͣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayDetail', @level2type=N'COLUMN',@level2name=N'HandleStep'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������������true-�ǣ�false-�� ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayDetail', @level2type=N'COLUMN',@level2name=N'CompleteStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ʩ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayDetail', @level2type=N'COLUMN',@level2name=N'Suggestions'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۺϼ����ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayDetail'
GO

ALTER TABLE [dbo].[Check_CheckDayDetail]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckDayDetail_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Check_CheckDayDetail] CHECK CONSTRAINT [FK_Check_CheckDayDetail_Base_Unit]
GO

ALTER TABLE [dbo].[Check_CheckDayDetail]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckDayDetail_ProjectData_WorkArea] FOREIGN KEY([CheckArea])
REFERENCES [dbo].[ProjectData_WorkArea] ([WorkAreaId])
GO

ALTER TABLE [dbo].[Check_CheckDayDetail] CHECK CONSTRAINT [FK_Check_CheckDayDetail_ProjectData_WorkArea]
GO













CREATE TABLE [dbo].[Check_CheckSpecial](
	[CheckSpecialId] [nvarchar](50) NOT NULL,
	[CheckSpecialCode] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[CheckPerson] [nvarchar](50) NULL,
	[CheckTime] [datetime] NULL,
	[ScanUrl] [nvarchar](1000) NULL,
	[DaySummary] [nvarchar](max) NULL,
	[PartInUnits] [nvarchar](1000) NULL,
	[PartInPersons] [nvarchar](200) NULL,
	[CheckAreas] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Check_CheckSpecial_1] PRIMARY KEY CLUSTERED 
(
	[CheckSpecialId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ר������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckSpecialCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���뵥λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'PartInUnits'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Ա' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'PartInPersons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckAreas'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۺϼ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecial'
GO

ALTER TABLE [dbo].[Check_CheckSpecial]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckSpecial_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Check_CheckSpecial] CHECK CONSTRAINT [FK_Check_CheckSpecial_Base_Project]
GO















CREATE TABLE [dbo].[Check_CheckSpecialDetail](
	[CheckSpecialDetailId] [nvarchar](50) NOT NULL,
	[CheckSpecialId] [nvarchar](50) NULL,
	[CheckItem] [nvarchar](200) NULL,
	[CheckItemType] [nvarchar](50) NULL,
	[Unqualified] [nvarchar](100) NULL,
	[CheckArea] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[CompleteStatus] [nvarchar](200) NULL,
	[LimitedDate] [datetime] NULL,
	[CompletedDate] [datetime] NULL,
	[Suggestions] [nvarchar](500) NULL,
	[HandleStep] [nvarchar](1000) NULL,
	[RectifyNoticeId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Check_CheckSpecialDetail] PRIMARY KEY CLUSTERED 
(
	[CheckSpecialDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ϸ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecialDetail', @level2type=N'COLUMN',@level2name=N'CheckSpecialDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ճ�Ѳ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecialDetail', @level2type=N'COLUMN',@level2name=N'CheckSpecialId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecialDetail', @level2type=N'COLUMN',@level2name=N'CheckItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecialDetail', @level2type=N'COLUMN',@level2name=N'CheckItemType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ϸ��������������ʩ ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecialDetail', @level2type=N'COLUMN',@level2name=N'Unqualified'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��� ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecialDetail', @level2type=N'COLUMN',@level2name=N'CheckArea'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ε�λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecialDetail', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������������true-�ǣ�false-�� ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecialDetail', @level2type=N'COLUMN',@level2name=N'CompleteStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ʩ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecialDetail', @level2type=N'COLUMN',@level2name=N'Suggestions'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ʩ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecialDetail', @level2type=N'COLUMN',@level2name=N'HandleStep'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۺϼ����ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecialDetail'
GO

ALTER TABLE [dbo].[Check_CheckSpecialDetail]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckSpecialDetail_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Check_CheckSpecialDetail] CHECK CONSTRAINT [FK_Check_CheckSpecialDetail_Base_Unit]
GO

ALTER TABLE [dbo].[Check_CheckSpecialDetail]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckSpecialDetail_ProjectData_WorkArea] FOREIGN KEY([CheckArea])
REFERENCES [dbo].[ProjectData_WorkArea] ([WorkAreaId])
GO

ALTER TABLE [dbo].[Check_CheckSpecialDetail] CHECK CONSTRAINT [FK_Check_CheckSpecialDetail_ProjectData_WorkArea]
GO
















CREATE TABLE [dbo].[Check_CheckColligation](
	[CheckColligationId] [nvarchar](50) NOT NULL,
	[CheckColligationCode] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[CheckType] [char](1) NULL,
	[CheckPerson] [nvarchar](50) NULL,
	[CheckTime] [datetime] NULL,
	[ScanUrl] [nvarchar](1000) NULL,
	[DaySummary] [nvarchar](max) NULL,
	[PartInUnits] [nvarchar](400) NULL,
	[PartInPersons] [nvarchar](200) NULL,
	[CheckAreas] [nvarchar](200) NULL,
 CONSTRAINT [PK_Check_CheckColligation_1] PRIMARY KEY CLUSTERED 
(
	[CheckColligationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���뵥λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckColligation', @level2type=N'COLUMN',@level2name=N'PartInUnits'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Ա' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckColligation', @level2type=N'COLUMN',@level2name=N'PartInPersons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckColligation', @level2type=N'COLUMN',@level2name=N'CheckAreas'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۺϼ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckColligation'
GO

ALTER TABLE [dbo].[Check_CheckColligation]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckColligation_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Check_CheckColligation] CHECK CONSTRAINT [FK_Check_CheckColligation_Base_Project]
GO












CREATE TABLE [dbo].[Check_CheckColligationDetail](
	[CheckColligationDetailId] [nvarchar](50) NOT NULL,
	[CheckColligationId] [nvarchar](50) NULL,
	[CheckItem] [nvarchar](200) NULL,
	[CheckItemType] [nvarchar](50) NULL,
	[Unqualified] [nvarchar](100) NULL,
	[CheckArea] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[HandleStep] [nvarchar](1000) NULL,
	[CompleteStatus] [nvarchar](200) NULL,
	[LimitedDate] [datetime] NULL,
	[CompletedDate] [datetime] NULL,
	[RectifyNoticeId] [nvarchar](50) NULL,
	[Suggestions] [nvarchar](500) NULL,
 CONSTRAINT [PK_Check_CheckColligationDetail] PRIMARY KEY CLUSTERED 
(
	[CheckColligationDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckColligationDetail', @level2type=N'COLUMN',@level2name=N'CheckItemType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ϸ��������������ʩ ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckColligationDetail', @level2type=N'COLUMN',@level2name=N'Unqualified'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��� ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckColligationDetail', @level2type=N'COLUMN',@level2name=N'CheckArea'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ε�λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckColligationDetail', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ʩ��������������������֪ͨ������Ա���桢��Ա������HSSE����֪ͨ����������ͣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckColligationDetail', @level2type=N'COLUMN',@level2name=N'HandleStep'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������������true-�ǣ�false-�� ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckColligationDetail', @level2type=N'COLUMN',@level2name=N'CompleteStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ʩ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckColligationDetail', @level2type=N'COLUMN',@level2name=N'Suggestions'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۺϼ����ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckColligationDetail'
GO

ALTER TABLE [dbo].[Check_CheckColligationDetail]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckColligationDetail_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Check_CheckColligationDetail] CHECK CONSTRAINT [FK_Check_CheckColligationDetail_Base_Unit]
GO

ALTER TABLE [dbo].[Check_CheckColligationDetail]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckColligationDetail_ProjectData_WorkArea] FOREIGN KEY([CheckArea])
REFERENCES [dbo].[ProjectData_WorkArea] ([WorkAreaId])
GO

ALTER TABLE [dbo].[Check_CheckColligationDetail] CHECK CONSTRAINT [FK_Check_CheckColligationDetail_ProjectData_WorkArea]
GO










CREATE TABLE [dbo].[Check_CheckWork](
	[CheckWorkId] [nvarchar](50) NOT NULL,
	[CheckWorkCode] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Area] [nvarchar](200) NULL,
	[CheckTime] [datetime] NULL,
	[MainUnitPerson] [nvarchar](500) NULL,
	[SubUnits] [nvarchar](500) NULL,
	[SubUnitPerson] [nvarchar](500) NULL,
	[MainUnitDeputy] [nvarchar](50) NULL,
	[SubUnitDeputy] [nvarchar](50) NULL,
	[MainUnitDeputyDate] [datetime] NULL,
	[SubUnitDeputyDate] [datetime] NULL,
	[AttachUrl] [nvarchar](150) NULL,
	[IsCompleted] [bit] NULL,
 CONSTRAINT [PK_Check_CheckWork_1] PRIMARY KEY CLUSTERED 
(
	[CheckWorkId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWork', @level2type=N'COLUMN',@level2name=N'CheckWorkCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWork', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��鵥λ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWork', @level2type=N'COLUMN',@level2name=N'Area'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWork', @level2type=N'COLUMN',@level2name=N'CheckTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����λ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWork', @level2type=N'COLUMN',@level2name=N'MainUnitPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�μӷְ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWork', @level2type=N'COLUMN',@level2name=N'SubUnits'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʩ���ְ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWork', @level2type=N'COLUMN',@level2name=N'SubUnitPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����λ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWork', @level2type=N'COLUMN',@level2name=N'MainUnitDeputy'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʩ���ְ�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWork', @level2type=N'COLUMN',@level2name=N'SubUnitDeputy'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����λ����ǩ��ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWork', @level2type=N'COLUMN',@level2name=N'MainUnitDeputyDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ��̴���ǩ��ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWork', @level2type=N'COLUMN',@level2name=N'SubUnitDeputyDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�ջ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWork', @level2type=N'COLUMN',@level2name=N'IsCompleted'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ǰHSE����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWork'
GO

ALTER TABLE [dbo].[Check_CheckWork]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckWork_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Check_CheckWork] CHECK CONSTRAINT [FK_Check_CheckWork_Base_Project]
GO













CREATE TABLE [dbo].[Check_CheckWorkDetail](
	[CheckWorkDetailId] [nvarchar](50) NOT NULL,
	[CheckWorkId] [nvarchar](50) NULL,
	[CheckItem] [nvarchar](50) NULL,
	[CheckResult] [ntext] NULL,
	[CheckOpinion] [ntext] NULL,
	[CheckStation] [ntext] NULL,
	[HandleResult] [ntext] NULL,
 CONSTRAINT [PK_Check_CheckWorkDetail] PRIMARY KEY CLUSTERED 
(
	[CheckWorkDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWorkDetail', @level2type=N'COLUMN',@level2name=N'CheckWorkDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWorkDetail', @level2type=N'COLUMN',@level2name=N'CheckWorkId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWorkDetail', @level2type=N'COLUMN',@level2name=N'CheckItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWorkDetail', @level2type=N'COLUMN',@level2name=N'CheckResult'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWorkDetail', @level2type=N'COLUMN',@level2name=N'CheckOpinion'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��֤���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWorkDetail', @level2type=N'COLUMN',@level2name=N'CheckStation'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Ľ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWorkDetail', @level2type=N'COLUMN',@level2name=N'HandleResult'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ǰHSE�����ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWorkDetail'
GO












CREATE TABLE [dbo].[Check_CheckHoliday](
	[CheckHolidayId] [nvarchar](50) NOT NULL,
	[CheckHolidayCode] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Area] [nvarchar](200) NULL,
	[CheckTime] [datetime] NULL,
	[MainUnitPerson] [nvarchar](500) NULL,
	[SubUnits] [nvarchar](500) NULL,
	[SubUnitPerson] [nvarchar](500) NULL,
	[MainUnitDeputy] [nvarchar](50) NULL,
	[SubUnitDeputy] [nvarchar](50) NULL,
	[MainUnitDeputyDate] [datetime] NULL,
	[SubUnitDeputyDate] [datetime] NULL,
	[AttachUrl] [nvarchar](150) NULL,
	[IsCompleted] [bit] NULL,
 CONSTRAINT [PK_Check_CheckHoliday_1] PRIMARY KEY CLUSTERED 
(
	[CheckHolidayId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHoliday', @level2type=N'COLUMN',@level2name=N'CheckHolidayCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHoliday', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��鵥λ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHoliday', @level2type=N'COLUMN',@level2name=N'Area'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHoliday', @level2type=N'COLUMN',@level2name=N'CheckTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����λ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHoliday', @level2type=N'COLUMN',@level2name=N'MainUnitPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�μӷְ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHoliday', @level2type=N'COLUMN',@level2name=N'SubUnits'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʩ���ְ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHoliday', @level2type=N'COLUMN',@level2name=N'SubUnitPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����λ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHoliday', @level2type=N'COLUMN',@level2name=N'MainUnitDeputy'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʩ���ְ�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHoliday', @level2type=N'COLUMN',@level2name=N'SubUnitDeputy'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����λ����ǩ��ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHoliday', @level2type=N'COLUMN',@level2name=N'MainUnitDeputyDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ��̴���ǩ��ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHoliday', @level2type=N'COLUMN',@level2name=N'SubUnitDeputyDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�ջ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHoliday', @level2type=N'COLUMN',@level2name=N'IsCompleted'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������/�ڼ��ռ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHoliday'
GO

ALTER TABLE [dbo].[Check_CheckHoliday]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckHoliday_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Check_CheckHoliday] CHECK CONSTRAINT [FK_Check_CheckHoliday_Base_Project]
GO













CREATE TABLE [dbo].[Check_CheckHolidayDetail](
	[CheckHolidayDetailId] [nvarchar](50) NOT NULL,
	[CheckHolidayId] [nvarchar](50) NULL,
	[CheckItem] [nvarchar](50) NULL,
	[CheckResult] [ntext] NULL,
	[CheckOpinion] [ntext] NULL,
	[CheckStation] [ntext] NULL,
	[HandleResult] [ntext] NULL,
 CONSTRAINT [PK_Check_CheckHolidayDetail] PRIMARY KEY CLUSTERED 
(
	[CheckHolidayDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHolidayDetail', @level2type=N'COLUMN',@level2name=N'CheckHolidayDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHolidayDetail', @level2type=N'COLUMN',@level2name=N'CheckHolidayId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHolidayDetail', @level2type=N'COLUMN',@level2name=N'CheckItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHolidayDetail', @level2type=N'COLUMN',@level2name=N'CheckResult'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHolidayDetail', @level2type=N'COLUMN',@level2name=N'CheckOpinion'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��֤���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHolidayDetail', @level2type=N'COLUMN',@level2name=N'CheckStation'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Ľ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHolidayDetail', @level2type=N'COLUMN',@level2name=N'HandleResult'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������/�ڼ��ռ����ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHolidayDetail'
GO













--�ճ�Ѳ����ϸ�б�
CREATE VIEW [dbo].[View_Check_CheckDayDetail]  AS 
/*�ճ�Ѳ����ϸ�б���ͼ*/
SELECT checkDayDetail.CheckDayDetailId, 
checkDayDetail.CheckDayId, 
checkDayDetail.CheckItem, 
checkDayDetail.CheckItemType,
checkDayDetail.Unqualified,
checkDayDetail.CheckArea,
checkDayDetail.UnitId,
checkDayDetail.HandleStep,
checkDayDetail.CompleteStatus,
checkDayDetail.LimitedDate,
checkDayDetail.CompletedDate,
checkDayDetail.Suggestions,
checkItemDetail.CheckContent as CheckItemStr,
workArea.WorkAreaName,
unit.UnitName,
const.ConstText as HandleStepStr
FROM dbo.Check_CheckDayDetail AS checkDayDetail
LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail ON checkItemDetail.CheckItemDetailId=checkDayDetail.CheckItem
LEFT JOIN dbo.ProjectData_WorkArea AS workArea ON workArea.WorkAreaId=checkDayDetail.CheckArea
LEFT JOIN dbo.Base_Unit AS unit ON unit.UnitId=checkDayDetail.UnitId
LEFT JOIN Sys_Const AS const ON const.ConstValue = checkDayDetail.HandleStep and const.GroupId='HandleStep'










GO










--ר������ϸ�б�
Create VIEW [dbo].[View_Check_CheckSpecialDetail]  AS 
/*ר������ϸ�б���ͼ*/
SELECT checkSpecialDetail.CheckSpecialDetailId, 
checkSpecialDetail.CheckSpecialId, 
checkSpecialDetail.CheckItem, 
checkSpecialDetail.CheckItemType,
checkSpecialDetail.Unqualified,
checkSpecialDetail.CheckArea,
checkSpecialDetail.UnitId,
checkSpecialDetail.HandleStep,
checkSpecialDetail.CompleteStatus,
checkSpecialDetail.LimitedDate,
checkSpecialDetail.CompletedDate,
checkSpecialDetail.Suggestions,
checkItemDetail.CheckContent as CheckItemStr,
workArea.WorkAreaName,
unit.UnitName,
const.ConstText as HandleStepStr
FROM dbo.Check_CheckSpecialDetail AS checkSpecialDetail
LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail ON checkItemDetail.CheckItemDetailId=checkSpecialDetail.CheckItem
LEFT JOIN dbo.ProjectData_WorkArea AS workArea ON workArea.WorkAreaId=checkSpecialDetail.CheckArea
LEFT JOIN dbo.Base_Unit AS unit ON unit.UnitId=checkSpecialDetail.UnitId
LEFT JOIN Sys_Const AS const ON const.ConstValue = checkSpecialDetail.HandleStep and const.GroupId='HandleStep'











GO











--�ۺϴ�����ϸ�б�
Create VIEW [dbo].[View_Check_CheckColligationDetail]  AS 
/*�ۺϴ�����ϸ�б���ͼ*/
SELECT checkColligationDetail.CheckColligationDetailId, 
checkColligationDetail.CheckColligationId, 
checkColligationDetail.CheckItem, 
checkColligationDetail.CheckItemType,
checkColligationDetail.Unqualified,
checkColligationDetail.CheckArea,
checkColligationDetail.UnitId,
checkColligationDetail.HandleStep,
checkColligationDetail.CompleteStatus,
checkColligationDetail.LimitedDate,
checkColligationDetail.CompletedDate,
checkColligationDetail.Suggestions,
checkItemDetail.CheckContent as CheckItemStr,
workArea.WorkAreaName,
unit.UnitName,
const.ConstText as HandleStepStr
FROM dbo.Check_CheckColligationDetail AS checkColligationDetail
LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail ON checkItemDetail.CheckItemDetailId=checkColligationDetail.CheckItem
LEFT JOIN dbo.ProjectData_WorkArea AS workArea ON workArea.WorkAreaId=checkColligationDetail.CheckArea
LEFT JOIN dbo.Base_Unit AS unit ON unit.UnitId=checkColligationDetail.UnitId
LEFT JOIN Sys_Const AS const ON const.ConstValue = checkColligationDetail.HandleStep and const.GroupId='HandleStep'












GO












--����ǰ�����ϸ�б�
CREATE VIEW [dbo].[View_Check_CheckWorkDetail]  AS 
/*����ǰ�����ϸ�б���ͼ*/
SELECT checkWorkDetail.CheckWorkDetailId, 
checkWorkDetail.CheckWorkId, 
checkWorkDetail.CheckItem, 
checkWorkDetail.CheckResult,
checkWorkDetail.CheckOpinion,
checkWorkDetail.CheckStation,
checkWorkDetail.HandleResult,
checkItemDetail.CheckContent as CheckItemStr
FROM dbo.Check_CheckWorkDetail AS checkWorkDetail
LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail ON checkItemDetail.CheckItemDetailId=checkWorkDetail.CheckItem











GO












--������/�ڼ��ռ����ϸ�б�
CREATE VIEW [dbo].[View_Check_CheckHolidayDetail]  AS 
/*������/�ڼ��ռ����ϸ�б���ͼ*/
SELECT checkHolidayDetail.CheckHolidayDetailId, 
checkHolidayDetail.CheckHolidayId, 
checkHolidayDetail.CheckItem, 
checkHolidayDetail.CheckResult,
checkHolidayDetail.CheckOpinion,
checkHolidayDetail.CheckStation,
checkHolidayDetail.HandleResult,
checkItemDetail.CheckContent as CheckItemStr
FROM dbo.Check_CheckHolidayDetail AS checkHolidayDetail
LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail ON checkItemDetail.CheckItemDetailId=checkHolidayDetail.CheckItem












GO














CREATE PROCEDURE [dbo].[SpCheckDayStatistic]     
@ProjectId nvarchar(50),
@StartTime nvarchar(15)=null,        
@EndTime nvarchar(15)=null         
AS      
BEGIN    

SELECT 	CheckDayDetail.CheckDayDetailId
	,CheckDay.CheckDayId
	,CheckDay.CheckDayId+','+ISNULL(CheckDayDetail.CheckDayDetailId,'') AS NewChcekId
	,CodeRecords.Code AS CheckDayCode
	,Checks.CheckCount
	,WorkArea.WorkAreaName
	,Unit.UnitName
	,CheckDayDetail.CompleteStatus
	,CONVERT(varchar(100), CheckDayDetail.LimitedDate, 23) as LimitedDate
	,CheckDayDetail.CompletedDate
	,CheckDay.CheckPerson
	,CONVERT(varchar(100), CheckDay.CheckTime, 23) as CheckTime
	--,CheckDay.CheckTime
	,CheckDayDetail.CheckItemType
	,CheckDayDetail.CheckItem
	,CheckDayDetail.HandleStep
from Check_CheckDay AS CheckDay 
LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckDay.CheckDayId=CodeRecords.DataId
LEFT JOIN Check_CheckDayDetail  AS CheckDayDetail on CheckDayDetail.CheckDayId = CheckDay.CheckDayId    
LEFT JOIN ProjectData_WorkArea AS WorkArea on WorkArea.WorkAreaId=CheckDayDetail.CheckArea        
LEFT JOIN Base_Unit AS Unit on Unit.UnitId=CheckDayDetail.UnitId        
LEFT JOIN (SELECT COUNT(*)  AS CheckCount, CheckDayId 
			FROM Check_CheckDayDetail GROUP BY CheckDayId) AS Checks ON Checks.CheckDayId = CheckDay.CheckDayId 

WHERE  (@StartTime is null or CheckDay.CheckTime>=@StartTime) 
		and (@EndTime is null or CheckDay.CheckTime <=@EndTime ) 
		and CheckDay.ProjectId=@ProjectId

order by CheckDayCode desc
   
END





GO











CREATE PROCEDURE [dbo].[SpCheckSpecialStatistic]     
@ProjectId nvarchar(50),
@StartTime nvarchar(15)=null,        
@EndTime nvarchar(15)=null         
AS      
BEGIN    

SELECT 	CheckSpecialDetail.CheckSpecialDetailId
	,CheckSpecial.CheckSpecialId
	,CheckSpecial.CheckSpecialId+','+ISNULL(CheckSpecialDetail.CheckSpecialDetailId,'') AS NewChcekId
	,CodeRecords.Code AS CheckSpecialCode
	,Checks.CheckCount
	,WorkArea.WorkAreaName
	,Unit.UnitName
	,CheckSpecialDetail.CompleteStatus
	,CONVERT(varchar(100), CheckSpecialDetail.LimitedDate, 23) as LimitedDate
	,CheckSpecialDetail.CompletedDate
	,CheckSpecial.CheckPerson
	,user1.UserName as CheckPersonName
	,CONVERT(varchar(100), CheckSpecial.CheckTime, 23) as CheckTime
	--,CheckSpecial.CheckTime
	,CheckSpecialDetail.CheckItemType
	,CheckSpecialDetail.CheckItem
	,CheckSpecialDetail.HandleStep
from Check_CheckSpecial AS CheckSpecial 
LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckSpecial.CheckSpecialId=CodeRecords.DataId
LEFT JOIN Sys_User AS user1 ON CheckSpecial.CheckPerson=user1.UserId
LEFT JOIN Check_CheckSpecialDetail  AS CheckSpecialDetail on CheckSpecialDetail.CheckSpecialId = CheckSpecial.CheckSpecialId    
LEFT JOIN ProjectData_WorkArea AS WorkArea on WorkArea.WorkAreaId=CheckSpecialDetail.CheckArea        
LEFT JOIN Base_Unit AS Unit on Unit.UnitId=CheckSpecialDetail.UnitId        
LEFT JOIN (SELECT COUNT(*)  AS CheckCount, CheckSpecialId 
			FROM Check_CheckSpecialDetail GROUP BY CheckSpecialId) AS Checks ON Checks.CheckSpecialId = CheckSpecial.CheckSpecialId 

WHERE  (@StartTime is null or CheckSpecial.CheckTime>=@StartTime) 
		and (@EndTime is null or CheckSpecial.CheckTime <=@EndTime ) 
		and CheckSpecial.ProjectId=@ProjectId

order by CheckSpecialCode desc
   
END





GO
















Create PROCEDURE [dbo].[SpCheckColligationStatistic]     
@ProjectId nvarchar(50),
@StartTime nvarchar(15)=null,        
@EndTime nvarchar(15)=null         
AS      
BEGIN    

SELECT 	CheckColligationDetail.CheckColligationDetailId
	,CheckColligation.CheckColligationId
	,CheckColligation.CheckColligationId+','+ISNULL(CheckColligationDetail.CheckColligationDetailId,'') AS NewChcekId
	,CodeRecords.Code AS CheckColligationCode
	,Checks.CheckCount
	,WorkArea.WorkAreaName
	,Unit.UnitName
	,CheckColligationDetail.CompleteStatus
	,CONVERT(varchar(100), CheckColligationDetail.LimitedDate, 23) as LimitedDate
	,CheckColligationDetail.CompletedDate
	,CheckColligation.CheckPerson
	,user1.UserName as CheckPersonName
	,CONVERT(varchar(100), CheckColligation.CheckTime, 23) as CheckTime
	--,CheckColligation.CheckTime
	,CheckColligationDetail.CheckItemType
	,CheckColligationDetail.CheckItem
	,CheckColligationDetail.HandleStep
from Check_CheckColligation AS CheckColligation 
LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckColligation.CheckColligationId=CodeRecords.DataId
LEFT JOIN Sys_User AS user1 ON CheckColligation.CheckPerson=user1.UserId
LEFT JOIN Check_CheckColligationDetail  AS CheckColligationDetail on CheckColligationDetail.CheckColligationId = CheckColligation.CheckColligationId    
LEFT JOIN ProjectData_WorkArea AS WorkArea on WorkArea.WorkAreaId=CheckColligationDetail.CheckArea        
LEFT JOIN Base_Unit AS Unit on Unit.UnitId=CheckColligationDetail.UnitId        
LEFT JOIN (SELECT COUNT(*)  AS CheckCount, CheckColligationId 
			FROM Check_CheckColligationDetail GROUP BY CheckColligationId) AS Checks ON Checks.CheckColligationId = CheckColligation.CheckColligationId 

WHERE  (@StartTime is null or CheckColligation.CheckTime>=@StartTime) 
		and (@EndTime is null or CheckColligation.CheckTime <=@EndTime ) 
		and CheckColligation.ProjectId=@ProjectId

order by CheckColligationCode desc
   
END





GO














CREATE TABLE [dbo].[Check_RectifyNotice](
	[RectifyNoticeId] [nvarchar](50) NOT NULL,
	[RectifyNoticeCode] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[CheckArea] [nvarchar](500) NULL,
	[CheckedTime] [datetime] NULL,
	[WrongContent] [nvarchar](max) NULL,
	[SignPerson] [nvarchar](50) NULL,
	[RectifyLimit] [datetime] NULL,
	[CompleteStatus] [nvarchar](max) NULL,
	[DutyPerson] [nvarchar](50) NULL,
	[CompleteDate] [datetime] NULL,
	[IsRectify] [bit] NULL,
	[CheckPerson] [nvarchar](50) NULL,
	[AttachUrl1] [nvarchar](1000) NULL,
	[AttachUrl2] [nvarchar](1000) NULL,
	[AttachUrl3] [nvarchar](1000) NULL,
	[ChangeContent] [nvarchar](2000) NULL,
	[HSEManager] [nvarchar](50) NULL,
	[ChangeDate] [datetime] NULL,
	[CheckDate] [datetime] NULL,
	[CheckStation] [nvarchar](max) NULL,
 CONSTRAINT [PK_Check_RectifyNotice_1] PRIMARY KEY CLUSTERED 
(
	[RectifyNoticeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotice', @level2type=N'COLUMN',@level2name=N'RectifyNoticeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotice', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotice', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotice', @level2type=N'COLUMN',@level2name=N'CheckArea'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ܼ�ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotice', @level2type=N'COLUMN',@level2name=N'CheckedTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ�������ݼ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotice', @level2type=N'COLUMN',@level2name=N'WrongContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ǩ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotice', @level2type=N'COLUMN',@level2name=N'SignPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotice', @level2type=N'COLUMN',@level2name=N'RectifyLimit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Ĵ�ʩ�������������ε�λ��д��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotice', @level2type=N'COLUMN',@level2name=N'CompleteStatus'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotice', @level2type=N'COLUMN',@level2name=N'DutyPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotice', @level2type=N'COLUMN',@level2name=N'CompleteDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ��������(true-�ǣ�false-��)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotice', @level2type=N'COLUMN',@level2name=N'IsRectify'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ܰ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotice', @level2type=N'COLUMN',@level2name=N'CheckPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����·�������ܶ��ţ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotice', @level2type=N'COLUMN',@level2name=N'AttachUrl1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������֪ͨ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotice'
GO

ALTER TABLE [dbo].[Check_RectifyNotice]  WITH CHECK ADD  CONSTRAINT [FK_Check_RectifyNotice_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Check_RectifyNotice] CHECK CONSTRAINT [FK_Check_RectifyNotice_Base_Project]
GO

ALTER TABLE [dbo].[Check_RectifyNotice]  WITH CHECK ADD  CONSTRAINT [FK_Check_RectifyNotice_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Check_RectifyNotice] CHECK CONSTRAINT [FK_Check_RectifyNotice_Base_Unit]
GO












CREATE TABLE [dbo].[Check_RectifyNoticeDetail](
	[RectifyNoticeDetailId] [nvarchar](50) NOT NULL,
	[RectifyNoticeId] [nvarchar](50) NULL,
	[CheckItem] [nvarchar](50) NULL,
	[CheckItemType] [nvarchar](50) NULL,
	[Unqualified] [nvarchar](500) NULL,
	[CheckArea] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[Suggestions] [nvarchar](500) NULL,
 CONSTRAINT [PK_Check_RectifyNoticeDetail] PRIMARY KEY CLUSTERED 
(
	[RectifyNoticeDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ϸ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticeDetail', @level2type=N'COLUMN',@level2name=N'RectifyNoticeDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ճ�Ѳ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticeDetail', @level2type=N'COLUMN',@level2name=N'RectifyNoticeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticeDetail', @level2type=N'COLUMN',@level2name=N'CheckItem'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticeDetail', @level2type=N'COLUMN',@level2name=N'CheckItemType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ϸ��������������ʩ ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticeDetail', @level2type=N'COLUMN',@level2name=N'Unqualified'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��� ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticeDetail', @level2type=N'COLUMN',@level2name=N'CheckArea'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ε�λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticeDetail', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ʩ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticeDetail', @level2type=N'COLUMN',@level2name=N'Suggestions'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۺϼ����ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticeDetail'
GO

ALTER TABLE [dbo].[Check_RectifyNoticeDetail]  WITH CHECK ADD  CONSTRAINT [FK_Check_RectifyNoticeDetail_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Check_RectifyNoticeDetail] CHECK CONSTRAINT [FK_Check_RectifyNoticeDetail_Base_Unit]
GO

ALTER TABLE [dbo].[Check_RectifyNoticeDetail]  WITH CHECK ADD  CONSTRAINT [FK_Check_RectifyNoticeDetail_ProjectData_WorkArea] FOREIGN KEY([CheckArea])
REFERENCES [dbo].[ProjectData_WorkArea] ([WorkAreaId])
GO

ALTER TABLE [dbo].[Check_RectifyNoticeDetail] CHECK CONSTRAINT [FK_Check_RectifyNoticeDetail_ProjectData_WorkArea]
GO
















--�������ĵ���ϸ�б�
CREATE VIEW [dbo].[View_Check_RectifyNoticeDetail]  AS 
/*�������ĵ���ϸ�б���ͼ*/
SELECT rectifyNoticeDetail.RectifyNoticeDetailId, 
rectifyNoticeDetail.RectifyNoticeId, 
rectifyNoticeDetail.CheckItem, 
rectifyNoticeDetail.CheckItemType,
rectifyNoticeDetail.Unqualified,
rectifyNoticeDetail.CheckArea,
rectifyNoticeDetail.UnitId,
rectifyNoticeDetail.Suggestions,
checkItemDetail.CheckContent as CheckItemStr,
workArea.WorkAreaName,
unit.UnitName
FROM dbo.Check_RectifyNoticeDetail AS rectifyNoticeDetail
LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail ON checkItemDetail.CheckItemDetailId=rectifyNoticeDetail.CheckItem
LEFT JOIN dbo.ProjectData_WorkArea AS workArea ON workArea.WorkAreaId=rectifyNoticeDetail.CheckArea
LEFT JOIN dbo.Base_Unit AS unit ON unit.UnitId=rectifyNoticeDetail.UnitId











GO
















CREATE TABLE [dbo].[Check_PauseNotice](
	[PauseNoticeId] [nvarchar](50) NOT NULL,
	[PauseNoticeCode] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[SignPerson] [nvarchar](50) NULL,
	[ProjectPlace] [nvarchar](200) NULL,
	[WrongContent] [nvarchar](150) NULL,
	[PauseTime] [datetime] NULL,
	[PauseContent] [nvarchar](150) NULL,
	[OneContent] [nvarchar](150) NULL,
	[SecondContent] [nvarchar](150) NULL,
	[ThirdContent] [nvarchar](150) NULL,
	[ProjectHeadConfirm] [nvarchar](50) NULL,
	[IsConfirm] [bit] NULL,
	[ConfirmDate] [datetime] NULL,
	[AttachUrl] [nvarchar](400) NULL,
 CONSTRAINT [PK_Check_PauseNotice] PRIMARY KEY CLUSTERED 
(
	[PauseNoticeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ͣ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PauseNotice', @level2type=N'COLUMN',@level2name=N'PauseNoticeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PauseNotice', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PauseNotice', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PauseNotice', @level2type=N'COLUMN',@level2name=N'SignPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���̲�λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PauseNotice', @level2type=N'COLUMN',@level2name=N'ProjectPlace'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ��������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PauseNotice', @level2type=N'COLUMN',@level2name=N'WrongContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ͣʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PauseNotice', @level2type=N'COLUMN',@level2name=N'PauseTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ͣ��ҵ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PauseNotice', @level2type=N'COLUMN',@level2name=N'PauseContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��һ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PauseNotice', @level2type=N'COLUMN',@level2name=N'OneContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ڶ�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PauseNotice', @level2type=N'COLUMN',@level2name=N'SecondContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PauseNotice', @level2type=N'COLUMN',@level2name=N'ThirdContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ����ǩ��ȷ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PauseNotice', @level2type=N'COLUMN',@level2name=N'ProjectHeadConfirm'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�ȷ�ϣ�true-�ǣ�false-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PauseNotice', @level2type=N'COLUMN',@level2name=N'IsConfirm'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ǩ��ȷ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PauseNotice', @level2type=N'COLUMN',@level2name=N'ConfirmDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����·�������ܶ��ţ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PauseNotice', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ͣ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_PauseNotice'
GO

ALTER TABLE [dbo].[Check_PauseNotice]  WITH CHECK ADD  CONSTRAINT [FK_Check_PauseNotice_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Check_PauseNotice] CHECK CONSTRAINT [FK_Check_PauseNotice_Base_Project]
GO

ALTER TABLE [dbo].[Check_PauseNotice]  WITH CHECK ADD  CONSTRAINT [FK_Check_PauseNotice_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Check_PauseNotice] CHECK CONSTRAINT [FK_Check_PauseNotice_Base_Unit]
GO


CREATE TABLE [dbo].[InformationProject_Picture](
	[PictureId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[ContentDef] [nvarchar](800) NULL,
	[PictureType] [char](1) NULL,
	[UploadDate] [datetime] NULL,
 CONSTRAINT [PK_InformationProject_Picture] PRIMARY KEY CLUSTERED 
(
	[PictureId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Picture', @level2type=N'COLUMN',@level2name=N'PictureId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Picture', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ͼƬ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Picture', @level2type=N'COLUMN',@level2name=N'Title'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ҫ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Picture', @level2type=N'COLUMN',@level2name=N'ContentDef'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ͼƬ����(1-Hse����2-Hse��ȫ��3-ְҵ������4-����������5-������ѵ)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Picture', @level2type=N'COLUMN',@level2name=N'PictureType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϴ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Picture', @level2type=N'COLUMN',@level2name=N'UploadDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' ��ĿͼƬ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Picture'
GO

ALTER TABLE [dbo].[InformationProject_Picture]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_Picture_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InformationProject_Picture] CHECK CONSTRAINT [FK_InformationProject_Picture_Base_Project]
GO




CREATE TABLE [dbo].[Base_ViolationRule](
	[ViolationRuleId] [int] NOT NULL,
	[ViolationRule] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_ViolationRule] PRIMARY KEY CLUSTERED 
(
	[ViolationRuleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_ViolationRule', @level2type=N'COLUMN',@level2name=N'ViolationRuleId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Υ�´���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_ViolationRule', @level2type=N'COLUMN',@level2name=N'ViolationRule'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Υ�´����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_ViolationRule'
GO


		 

CREATE TABLE [dbo].[Administrative_CheckTypeSet](
	[CheckTypeCode] [nvarchar](50) NOT NULL,
	[CheckTypeContent] [nvarchar](150) NULL,
	[SupCheckTypeCode] [nvarchar](50) NULL,
	[SortIndex] [int] NULL,
	[IsEndLevel] [bit] NULL,
 CONSTRAINT [PK_Administrative_CheckTypeSet] PRIMARY KEY CLUSTERED 
(
	[CheckTypeCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_CheckTypeSet', @level2type=N'COLUMN',@level2name=N'CheckTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_CheckTypeSet', @level2type=N'COLUMN',@level2name=N'CheckTypeContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϼ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_CheckTypeSet', @level2type=N'COLUMN',@level2name=N'SupCheckTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_CheckTypeSet', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�ĩ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_CheckTypeSet', @level2type=N'COLUMN',@level2name=N'IsEndLevel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����������������ñ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_CheckTypeSet'
GO



CREATE TABLE [dbo].[Administrative_ManageCheck](
	[ManageCheckId] [nvarchar](50) NOT NULL,
	[ManageCheckCode] [nvarchar](30) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[CheckTypeCode] [nvarchar](50) NULL,
	[SupplyCheck] [nvarchar](150) NULL,
	[IsSupplyCheck] [bit] NULL,
	[ViolationRule] [int] NULL,
	[ToViolationHandleCode] [nvarchar](30) NULL,
	[CheckPerson] [nvarchar](50) NULL,
	[CheckTime] [datetime] NULL,
	[VerifyPerson] [nvarchar](50) NULL,
	[VerifyTime] [datetime] NULL,
 CONSTRAINT [PK_Administrative_ManageCheck] PRIMARY KEY CLUSTERED 
(
	[ManageCheckId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_ManageCheck', @level2type=N'COLUMN',@level2name=N'ManageCheckId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_ManageCheck', @level2type=N'COLUMN',@level2name=N'ManageCheckCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_ManageCheck', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_ManageCheck', @level2type=N'COLUMN',@level2name=N'CheckTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_ManageCheck', @level2type=N'COLUMN',@level2name=N'SupplyCheck'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ񲹳��飨true-�ǣ�false-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_ManageCheck', @level2type=N'COLUMN',@level2name=N'IsSupplyCheck'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Υ�´���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_ManageCheck', @level2type=N'COLUMN',@level2name=N'ViolationRule'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ӦΥ�´�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_ManageCheck', @level2type=N'COLUMN',@level2name=N'ToViolationHandleCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ˣ����ܶ��ˣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_ManageCheck', @level2type=N'COLUMN',@level2name=N'CheckPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_ManageCheck', @level2type=N'COLUMN',@level2name=N'CheckTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��֤�ˣ����ܶ��ˣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_ManageCheck', @level2type=N'COLUMN',@level2name=N'VerifyPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��֤ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_ManageCheck', @level2type=N'COLUMN',@level2name=N'VerifyTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_ManageCheck'
GO

ALTER TABLE [dbo].[Administrative_ManageCheck]  WITH CHECK ADD  CONSTRAINT [FK_Administrative_ManageCheck_Administrative_CheckTypeSet] FOREIGN KEY([CheckTypeCode])
REFERENCES [dbo].[Administrative_CheckTypeSet] ([CheckTypeCode])
GO

ALTER TABLE [dbo].[Administrative_ManageCheck] CHECK CONSTRAINT [FK_Administrative_ManageCheck_Administrative_CheckTypeSet]
GO

ALTER TABLE [dbo].[Administrative_ManageCheck]  WITH CHECK ADD  CONSTRAINT [FK_Administrative_ManageCheck_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Administrative_ManageCheck] CHECK CONSTRAINT [FK_Administrative_ManageCheck_Base_Project]
GO

ALTER TABLE [dbo].[Administrative_ManageCheck]  WITH CHECK ADD  CONSTRAINT [FK_Administrative_ManageCheck_Base_ViolationRule] FOREIGN KEY([ViolationRule])
REFERENCES [dbo].[Base_ViolationRule] ([ViolationRuleId])
GO

ALTER TABLE [dbo].[Administrative_ManageCheck] CHECK CONSTRAINT [FK_Administrative_ManageCheck_Base_ViolationRule]
GO




CREATE TABLE [dbo].[Administrative_ManageCheckItem](
	[ManageCheckItemId] [nvarchar](50) NOT NULL,
	[ManageCheckId] [nvarchar](50) NOT NULL,
	[CheckTypeCode] [nvarchar](50) NULL,
	[IsCheck] [bit] NULL,
 CONSTRAINT [PK_Administrative_ManageCheckDetail] PRIMARY KEY CLUSTERED 
(
	[ManageCheckItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_ManageCheckItem', @level2type=N'COLUMN',@level2name=N'ManageCheckItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_ManageCheckItem', @level2type=N'COLUMN',@level2name=N'ManageCheckId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����Ŀ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_ManageCheckItem', @level2type=N'COLUMN',@level2name=N'CheckTypeCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_ManageCheckItem', @level2type=N'COLUMN',@level2name=N'IsCheck'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������������ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_ManageCheckItem'
GO

ALTER TABLE [dbo].[Administrative_ManageCheckItem]  WITH CHECK ADD  CONSTRAINT [FK_Administrative_ManageCheckDetail_Administrative_ManageCheck] FOREIGN KEY([ManageCheckId])
REFERENCES [dbo].[Administrative_ManageCheck] ([ManageCheckId])
GO

ALTER TABLE [dbo].[Administrative_ManageCheckItem] CHECK CONSTRAINT [FK_Administrative_ManageCheckDetail_Administrative_ManageCheck]
GO

ALTER TABLE [dbo].[Administrative_ManageCheckItem]  WITH CHECK ADD  CONSTRAINT [FK_Administrative_ManageCheckItem_Administrative_CheckTypeSet] FOREIGN KEY([CheckTypeCode])
REFERENCES [dbo].[Administrative_CheckTypeSet] ([CheckTypeCode])
GO

ALTER TABLE [dbo].[Administrative_ManageCheckItem] CHECK CONSTRAINT [FK_Administrative_ManageCheckItem_Administrative_CheckTypeSet]
GO
