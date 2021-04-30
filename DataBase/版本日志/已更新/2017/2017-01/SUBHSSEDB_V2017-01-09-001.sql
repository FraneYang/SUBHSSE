CREATE TABLE [dbo].[Manager_AccidentDetailSortB](
	[AccidentDetailSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[Abstract] [nvarchar](20) NULL,
	[AccidentType] [nvarchar](20) NULL,
	[PeopleNum] [int] NULL,
	[WorkingHoursLoss] [decimal](18, 1) NULL,
	[EconomicLoss] [decimal](18, 2) NULL,
	[AccidentDate] [datetime] NULL,
 CONSTRAINT [PK_Manager_AccidentDetailSortB] PRIMARY KEY CLUSTERED 
(
	[AccidentDetailSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentDetailSortB', @level2type=N'COLUMN',@level2name=N'AccidentDetailSortId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentDetailSortB', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ҫ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentDetailSortB', @level2type=N'COLUMN',@level2name=N'Abstract'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�¹�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentDetailSortB', @level2type=N'COLUMN',@level2name=N'AccidentType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentDetailSortB', @level2type=N'COLUMN',@level2name=N'PeopleNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ʱ��ʧ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentDetailSortB', @level2type=N'COLUMN',@level2name=N'WorkingHoursLoss'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ʧ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentDetailSortB', @level2type=N'COLUMN',@level2name=N'EconomicLoss'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentDetailSortB', @level2type=N'COLUMN',@level2name=N'AccidentDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±��¹�̨�˱�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentDetailSortB'
GO

ALTER TABLE [dbo].[Manager_AccidentDetailSortB]  WITH CHECK ADD  CONSTRAINT [FK_Manager_AccidentDetailSortB_Manager_MonthReportB] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportB] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_AccidentDetailSortB] CHECK CONSTRAINT [FK_Manager_AccidentDetailSortB_Manager_MonthReportB]
GO


CREATE TABLE [dbo].[Manager_CostAnalyse](
	[AnalyseId] [nvarchar](50) NOT NULL,
	[Months] [datetime] NULL,
	[Analyse] [numeric](9, 2) NULL,
	[TotalRealCostMoney] [money] NULL,
	[Manhours] [int] NULL,
	[ProjectId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Manager_CostAnalyse] PRIMARY KEY CLUSTERED 
(
	[AnalyseId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CostAnalyse', @level2type=N'COLUMN',@level2name=N'AnalyseId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�·�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CostAnalyse', @level2type=N'COLUMN',@level2name=N'Months'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˹�ʱ��Ͷ�밲ȫ���ñ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CostAnalyse', @level2type=N'COLUMN',@level2name=N'Analyse'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˹�ʱ��Ͷ�밲ȫ���ñ��ʱ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CostAnalyse'
GO


CREATE PROCEDURE [dbo].[sp_CostAnalyse]
@ProjectId nvarchar(50),
@StartTime nvarchar(15),
@EndTime nvarchar(15)
AS
BEGIN
select CAST(DATEPART(YEAR,c.Months) as varchar(5)) + '-'+CAST(DATEPART(MONTH,c.Months) as varchar(5)) as '�·�',c.TotalRealCostMoney as 'Ͷ�밲ȫ����',c.Manhours as '�����˹�ʱ',c.Analyse as '�˹�ʱ��Ͷ�밲ȫ���ñ���' from dbo.Manager_CostAnalyse c
 where c.Months>=@StartTime and c.Months <=@EndTime and c.ProjectId=@ProjectId
 order by c.Months
END


GO


--��ȫ���ݻ���
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('EDRF6YUJ-SDEW-2389-DW31-23D42D966YUJ','��ȫ���ݻ���','Manager/ManagerStatistic.aspx','PageHeaderFooter',27,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO

--�˹�ʱ��Ͷ�밲ȫ���ñ��ʷ���
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('4RYM5TYF-3DBA-4727-B3E8-FB21F3EDDF4R','�˹�ʱ��Ͷ�밲ȫ���ñ��ʷ���','Manager/ManagerAnalyse.aspx','PageHeaderFooter',29,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO

alter table dbo.Accident_AccidentReport add EconomicOtherLoss decimal(18,2) null
alter table dbo.Accident_AccidentReportOther add EconomicOtherLoss decimal(18,2) null
GO

