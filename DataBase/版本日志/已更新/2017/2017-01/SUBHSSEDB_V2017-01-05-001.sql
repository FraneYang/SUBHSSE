--�¹ʱ���Ǽ�����
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('EE478687-FF37-4531-AE38-DAFFE072BE2E','1','�����¹�',1,'AccidentReportRegistration')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('E1105CD8-0D4E-465D-9308-2E5F30554FBB','2','�����¹�',2,'AccidentReportRegistration')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('3DF2B822-0500-49BC-AAA3-C677207197A2','3','�����¹�',3,'AccidentReportRegistration')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4EBBCAEF-4C9F-4E81-A5C8-E8AA130C4313','4','�����¹�',4,'AccidentReportRegistration')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('1C91EBD2-5847-4048-BA04-783F5AC57E43','5','��ը�¹�',5,'AccidentReportRegistration')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('94640254-AE35-476A-8D97-D9BAB8F579ED','6','��·��ͨ�¹�',6,'AccidentReportRegistration')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('7E691F85-A2D4-4594-BCAE-07672ABFDDF3','7','��е�豸�¹�',7,'AccidentReportRegistration')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('69870C2A-36B4-4393-B30C-34E8D0465F35','8','������Ⱦ�¹�',8,'AccidentReportRegistration')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('450D1F05-894B-4294-AF44-E109D2E38575','9','ְҵ��',9,'AccidentReportRegistration')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('B0D5283D-1194-4422-A6BA-637438566AE3','10','�����¹�',10,'AccidentReportRegistration')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('1AAED3B1-E295-4281-B679-54602C817871','11','�����¹�',11,'AccidentReportRegistration')
GO

--�¹ʵ��鴦��������
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('80468578-B20E-43EF-A3CD-6CA5EAFE888E','1','���������¹�',1,'AccidentInvestigationProcessingReport')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('00A65E81-71A1-40BD-8AF0-8D4D2081F9AB','2','ҽ�ƴ���',2,'AccidentInvestigationProcessingReport')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('AB715230-3B72-472E-A002-7712A420147D','3','�ֳ����ã����ȣ�',3,'AccidentInvestigationProcessingReport')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('5C0F3EE5-454D-4A49-9097-92E2CEBA9336','4','δ���¹�',4,'AccidentInvestigationProcessingReport')
GO

alter table dbo.Accident_AccidentReport drop constraint FK_Accident_AccidentReport_Base_AccidentType
GO
alter table dbo.Accident_AccidentReportOther drop constraint FK_Accident_AccidentReportOther_Base_AccidentType
GO


CREATE TABLE [dbo].[Manager_HseCostB](
	[HseCostId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[PlanCostA] [money] NULL,
	[PlanCostB] [money] NULL,
	[RealCostA] [money] NULL,
	[ProjectRealCostA] [money] NULL,
	[RealCostB] [money] NULL,
	[ProjectRealCostB] [money] NULL,
	[RealCostAB] [money] NULL,
	[ProjectRealCostAB] [money] NULL,
 CONSTRAINT [PK_Manager_HseCostB] PRIMARY KEY CLUSTERED 
(
	[HseCostId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HseCostB', @level2type=N'COLUMN',@level2name=N'HseCostId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HseCostB', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HseCostB', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HseCostB', @level2type=N'COLUMN',@level2name=N'PlanCostA'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʵ��֧��(����)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HseCostB', @level2type=N'COLUMN',@level2name=N'RealCostA'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ʵ��֧��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HseCostB', @level2type=N'COLUMN',@level2name=N'ProjectRealCostA'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±���HSE������ʩ���ñ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HseCostB'
GO

ALTER TABLE [dbo].[Manager_HseCostB]  WITH CHECK ADD  CONSTRAINT [FK_Manager_HseCostB_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Manager_HseCostB] CHECK CONSTRAINT [FK_Manager_HseCostB_Base_Unit]
GO

ALTER TABLE [dbo].[Manager_HseCostB]  WITH CHECK ADD  CONSTRAINT [FK_Manager_HseCostB_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportB] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_HseCostB] CHECK CONSTRAINT [FK_Manager_HseCostB_Manager_MonthReport]
GO


