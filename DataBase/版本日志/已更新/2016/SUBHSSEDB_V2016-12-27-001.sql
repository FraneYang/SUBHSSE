-- 管理月报B
INSERT INTO Sys_MenuCommon (MenuId,MenuName,Url,Icon,SortIndex,SuperMenu,MenuType,IsEnd)  
VALUES('363EB208-7BB1-4A55-85F3-2501B2F10B45','管理月报B','Manager/ManagerMonthB.aspx','PageHeaderFooter',25,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1)
GO
--管理月报B按钮
INSERT INTO Sys_ButtonToMenu (ButtonToMenuId,MenuId,ButtonName,SortIndex)  
VALUES('DC9D383A-A025-46A4-83B1-45DE3D557CE4','363EB208-7BB1-4A55-85F3-2501B2F10B45','增加',1)
GO
INSERT INTO Sys_ButtonToMenu (ButtonToMenuId,MenuId,ButtonName,SortIndex)  
VALUES('7843500D-F955-4567-8504-65AD0B420425','363EB208-7BB1-4A55-85F3-2501B2F10B45','修改',2)
GO
INSERT INTO Sys_ButtonToMenu (ButtonToMenuId,MenuId,ButtonName,SortIndex)  
VALUES('7B97D1AF-7FD2-4461-A270-E48999F68FEF','363EB208-7BB1-4A55-85F3-2501B2F10B45','删除',3)
GO
INSERT INTO Sys_ButtonToMenu (ButtonToMenuId,MenuId,ButtonName,SortIndex)  
VALUES('88B6B84A-C6B3-4F26-A888-A5803286D31C','363EB208-7BB1-4A55-85F3-2501B2F10B45','保存',4)
GO

-- 总部管理月报B
INSERT INTO Sys_MenuCommon (MenuId,MenuName,Url,Icon,SortIndex,SuperMenu,MenuType,IsEnd)  
VALUES('B995396A-B01C-4F03-858A-FFDC853BA4B8','管理月报B','ManagementReport/MonthReportB.aspx','BorderDraw',15,'70E51ABF-81C8-49CB-89AC-CF0542A201D6','Menu_Server',1)
GO
--总部管理月报B按钮
INSERT INTO Sys_ButtonToMenu (ButtonToMenuId,MenuId,ButtonName,SortIndex)  
VALUES('3CCFF0D8-AD10-467C-9C90-F2AD0853EBF1','B995396A-B01C-4F03-858A-FFDC853BA4B8','增加',1)
GO
INSERT INTO Sys_ButtonToMenu (ButtonToMenuId,MenuId,ButtonName,SortIndex)  
VALUES('49A82E21-9EF5-4346-9C12-8E6B668F1D28','B995396A-B01C-4F03-858A-FFDC853BA4B8','修改',2)
GO
INSERT INTO Sys_ButtonToMenu (ButtonToMenuId,MenuId,ButtonName,SortIndex)  
VALUES('E2141097-2F61-4B3E-9BC5-968D824A53C9','B995396A-B01C-4F03-858A-FFDC853BA4B8','删除',3)
GO
INSERT INTO Sys_ButtonToMenu (ButtonToMenuId,MenuId,ButtonName,SortIndex)  
VALUES('832D9BEB-BDA9-4327-850D-8C0820D2F99F','B995396A-B01C-4F03-858A-FFDC853BA4B8','保存',4)
GO

CREATE TABLE [dbo].[Manager_MonthReportB](
	[MonthReportId] [nvarchar](50) NOT NULL,
	[MonthReportCode] [nvarchar](50) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Months] [datetime] NULL,
	[MonthReportDate] [datetime] NULL,
	[ReportMan] [nvarchar](50) NULL,
	[Manhours] [int] NULL,
	[TotalManhours] [int] NULL,
	[HseManhours] [int] NULL,
	[TotalHseManhours] [int] NULL,
	[NoStartDate] [datetime] NULL,
	[NoEndDate] [datetime] NULL,
	[AccidentReview] [nvarchar](3000) NULL,
	[AccidentNum] [int] NULL,
	[AccidentRateA] [numeric](9, 2) NULL,
	[AccidentRateB] [numeric](9, 2) NULL,
	[HseActiveReview] [nvarchar](3000) NULL,
	[HseActiveKey] [nvarchar](3000) NULL,
	[SafetyManhours] [int] NULL,
	[TotalManNum] [int] NULL,
	[AccidentRateC] [numeric](9, 2) NULL,
	[AccidentRateD] [numeric](9, 2) NULL,
	[AccidentRateE] [numeric](9, 2) NULL,
	[PlanCost] [money] NULL,
	[RealCost] [money] NULL,
	[TotalRealCost] [money] NULL,
	[LargerHazardNun] [int] NULL,
	[IsArgumentLargerHazardNun] [int] NULL,
 CONSTRAINT [PK_Manager_ManagerMonthB] PRIMARY KEY CLUSTERED 
(
	[MonthReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportB', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportB', @level2type=N'COLUMN',@level2name=N'MonthReportCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportB', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月份' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportB', @level2type=N'COLUMN',@level2name=N'Months'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportB', @level2type=N'COLUMN',@level2name=N'MonthReportDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报告人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportB', @level2type=N'COLUMN',@level2name=N'ReportMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当月完成人工时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportB', @level2type=N'COLUMN',@level2name=N'Manhours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计人工时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportB', @level2type=N'COLUMN',@level2name=N'TotalManhours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当月Hse人工时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportB', @level2type=N'COLUMN',@level2name=N'HseManhours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'无事故开始日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportB', @level2type=N'COLUMN',@level2name=N'NoStartDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'无事故截止日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportB', @level2type=N'COLUMN',@level2name=N'NoEndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故综述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportB', @level2type=N'COLUMN',@level2name=N'AccidentReview'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故频率A' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportB', @level2type=N'COLUMN',@level2name=N'AccidentRateA'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故频率B' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportB', @level2type=N'COLUMN',@level2name=N'AccidentRateB'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月HSE活动综述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportB', @level2type=N'COLUMN',@level2name=N'HseActiveReview'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下月HSE活动重点关注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportB', @level2type=N'COLUMN',@level2name=N'HseActiveKey'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理月表（B）主表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportB'
GO

ALTER TABLE [dbo].[Manager_MonthReportB]  WITH CHECK ADD  CONSTRAINT [FK_Manager_ManagerMonthB_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Manager_MonthReportB] CHECK CONSTRAINT [FK_Manager_ManagerMonthB_Base_Project]
GO

ALTER TABLE [dbo].[Manager_MonthReportB]  WITH CHECK ADD  CONSTRAINT [FK_Manager_ManagerMonthB_Sys_User] FOREIGN KEY([ReportMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Manager_MonthReportB] CHECK CONSTRAINT [FK_Manager_ManagerMonthB_Sys_User]
GO

CREATE TABLE [dbo].[Manager_AccidentSortB](
	[AccidentSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[AccidentType] [nvarchar](50) NULL,
	[TypeFlag] [char](1) NULL,
	[Number] [int] NULL,
	[TotalNum] [int] NULL,
	[PersonNum] [int] NULL,
	[TotalPersonNum] [int] NULL,
	[LoseHours] [int] NULL,
	[TotalLoseHours] [int] NULL,
	[LoseMoney] [money] NULL,
	[TotalLoseMoney] [money] NULL,
 CONSTRAINT [PK_Manager_AccidentSortB] PRIMARY KEY CLUSTERED 
(
	[AccidentSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSortB', @level2type=N'COLUMN',@level2name=N'AccidentSortId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSortB', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSortB', @level2type=N'COLUMN',@level2name=N'AccidentType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标志(1-对应损失工时,2-对应损失金额)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSortB', @level2type=N'COLUMN',@level2name=N'TypeFlag'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSortB', @level2type=N'COLUMN',@level2name=N'Number'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计发生次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSortB', @level2type=N'COLUMN',@level2name=N'TotalNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'损失工时(当月)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSortB', @level2type=N'COLUMN',@level2name=N'LoseHours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计损失工时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSortB', @level2type=N'COLUMN',@level2name=N'TotalLoseHours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'损失金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSortB', @level2type=N'COLUMN',@level2name=N'LoseMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计损失金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSortB', @level2type=N'COLUMN',@level2name=N'TotalLoseMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告事故分类表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_AccidentSortB'
GO

ALTER TABLE [dbo].[Manager_AccidentSortB]  WITH CHECK ADD  CONSTRAINT [FK_Manager_AccidentSortB_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportB] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_AccidentSortB] CHECK CONSTRAINT [FK_Manager_AccidentSortB_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_CheckSortB](
	[CheckSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[CheckType] [nvarchar](30) NULL,
	[CheckNumber] [int] NULL,
	[TotalCheckNum] [int] NULL,
	[ViolationNumber] [int] NULL,
	[TotalViolationNum] [int] NULL,
 CONSTRAINT [PK_Manager_CheckSortB] PRIMARY KEY CLUSTERED 
(
	[CheckSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSortB', @level2type=N'COLUMN',@level2name=N'CheckSortId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSortB', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全检查类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSortB', @level2type=N'COLUMN',@level2name=N'CheckType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查次数(当月)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSortB', @level2type=N'COLUMN',@level2name=N'CheckNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总检查次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSortB', @level2type=N'COLUMN',@level2name=N'TotalCheckNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'违章数量(当月)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSortB', @level2type=N'COLUMN',@level2name=N'ViolationNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总违章数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSortB', @level2type=N'COLUMN',@level2name=N'TotalViolationNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告HSE检查情况表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_CheckSortB'
GO

ALTER TABLE [dbo].[Manager_CheckSortB]  WITH CHECK ADD  CONSTRAINT [FK_Manager_CheckSortB_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportB] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_CheckSortB] CHECK CONSTRAINT [FK_Manager_CheckSortB_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_IncentiveSortB](
	[IncentiveSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[IncentiveType] [nvarchar](30) NULL,
	[BigType] [char](1) NULL,
	[TypeFlag] [char](1) NULL,
	[IncentiveMoney] [money] NULL,
	[TotalIncentiveMoney] [money] NULL,
	[IncentiveNumber] [int] NULL,
	[TotalIncentiveNumber] [int] NULL,
 CONSTRAINT [PK_Manager_IncentiveSortB] PRIMARY KEY CLUSTERED 
(
	[IncentiveSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSortB', @level2type=N'COLUMN',@level2name=N'IncentiveSortId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSortB', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖惩类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSortB', @level2type=N'COLUMN',@level2name=N'IncentiveType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'大类（1-奖 励，2-处 罚）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSortB', @level2type=N'COLUMN',@level2name=N'BigType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标志(1-对应金额,2-次数)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSortB', @level2type=N'COLUMN',@level2name=N'TypeFlag'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖惩金额（当月）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSortB', @level2type=N'COLUMN',@level2name=N'IncentiveMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计奖惩金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSortB', @level2type=N'COLUMN',@level2name=N'TotalIncentiveMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖惩次数（当月）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSortB', @level2type=N'COLUMN',@level2name=N'IncentiveNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'累计奖惩次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSortB', @level2type=N'COLUMN',@level2name=N'TotalIncentiveNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告HSE奖惩情况表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_IncentiveSortB'
GO

ALTER TABLE [dbo].[Manager_IncentiveSortB]  WITH CHECK ADD  CONSTRAINT [FK_Manager_IncentiveSortB_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportB] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_IncentiveSortB] CHECK CONSTRAINT [FK_Manager_IncentiveSortB_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_ManhoursSortB](
	[ManhoursSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[PersonTotal] [int] NULL,
	[ManhoursTotal] [int] NULL,
	[TotalManhoursTotal] [int] NULL,
 CONSTRAINT [PK_Manager_ManhoursSortB] PRIMARY KEY CLUSTERED 
(
	[ManhoursSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主健' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManhoursSortB', @level2type=N'COLUMN',@level2name=N'ManhoursSortId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManhoursSortB', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManhoursSortB', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'员工总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManhoursSortB', @level2type=N'COLUMN',@level2name=N'PersonTotal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完成人工时(当月)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManhoursSortB', @level2type=N'COLUMN',@level2name=N'ManhoursTotal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告人工时分类表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManhoursSortB'
GO

ALTER TABLE [dbo].[Manager_ManhoursSortB]  WITH CHECK ADD  CONSTRAINT [FK_Manager_ManhoursSortB_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Manager_ManhoursSortB] CHECK CONSTRAINT [FK_Manager_ManhoursSortB_Base_Unit]
GO

ALTER TABLE [dbo].[Manager_ManhoursSortB]  WITH CHECK ADD  CONSTRAINT [FK_Manager_ManhoursSortB_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportB] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_ManhoursSortB] CHECK CONSTRAINT [FK_Manager_ManhoursSortB_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_MeetingSortB](
	[MeetingSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[MeetingType] [nvarchar](30) NULL,
	[MeetingNumber] [int] NULL,
	[TotalMeetingNum] [int] NULL,
	[MeetingPersonNumber] [int] NULL,
	[TotalMeetingPersonNum] [int] NULL,
 CONSTRAINT [PK_Manager_MeetingSortB] PRIMARY KEY CLUSTERED 
(
	[MeetingSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会议类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MeetingSortB', @level2type=N'COLUMN',@level2name=N'MeetingType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会议次数（当月）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MeetingSortB', @level2type=N'COLUMN',@level2name=N'MeetingNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总会议次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MeetingSortB', @level2type=N'COLUMN',@level2name=N'TotalMeetingNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参加人数（当月）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MeetingSortB', @level2type=N'COLUMN',@level2name=N'MeetingPersonNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总参加人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MeetingSortB', @level2type=N'COLUMN',@level2name=N'TotalMeetingPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告HSE会议情况表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MeetingSortB'
GO

ALTER TABLE [dbo].[Manager_MeetingSortB]  WITH CHECK ADD  CONSTRAINT [FK_Manager_MeetingSortB_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportB] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_MeetingSortB] CHECK CONSTRAINT [FK_Manager_MeetingSortB_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_TrainSortB](
	[TrainSortId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[TrainType] [nvarchar](30) NULL,
	[TrainNumber] [int] NULL,
	[TotalTrainNum] [int] NULL,
	[TrainPersonNumber] [int] NULL,
	[TotalTrainPersonNum] [int] NULL,
 CONSTRAINT [PK_Manager_TrainSortB] PRIMARY KEY CLUSTERED 
(
	[TrainSortId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainSortB', @level2type=N'COLUMN',@level2name=N'TrainSortId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainSortB', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainSortB', @level2type=N'COLUMN',@level2name=N'TrainType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训次数（当月）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainSortB', @level2type=N'COLUMN',@level2name=N'TrainNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总培训次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainSortB', @level2type=N'COLUMN',@level2name=N'TotalTrainNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训人数（当月）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainSortB', @level2type=N'COLUMN',@level2name=N'TrainPersonNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总培训人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainSortB', @level2type=N'COLUMN',@level2name=N'TotalTrainPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月报告HSE培训情况表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainSortB'
GO

ALTER TABLE [dbo].[Manager_TrainSortB]  WITH CHECK ADD  CONSTRAINT [FK_Manager_TrainSortB_Manager_MonthReport] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[Manager_MonthReportB] ([MonthReportId])
GO

ALTER TABLE [dbo].[Manager_TrainSortB] CHECK CONSTRAINT [FK_Manager_TrainSortB_Manager_MonthReport]
GO

CREATE TABLE [dbo].[Manager_HeadMonthReportB](
	[HeadMonthReportId] [nvarchar](50) NOT NULL,
	[MonthReportCode] [nvarchar](50) NULL,
	[Months] [datetime] NULL,
	[ReportUnitName] [nvarchar](50) NULL,
	[ReportDate] [datetime] NULL,
	[ReportMan] [nvarchar](20) NULL,
	[CheckMan] [nvarchar](20) NULL,
	[AllSumHseManhours] [int] NULL,
	[AllSumTotalHseManhours] [int] NULL,
 CONSTRAINT [PK_Manager_HeadMonthReport] PRIMARY KEY CLUSTERED 
(
	[HeadMonthReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HeadMonthReportB', @level2type=N'COLUMN',@level2name=N'HeadMonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HeadMonthReportB', @level2type=N'COLUMN',@level2name=N'MonthReportCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月份' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HeadMonthReportB', @level2type=N'COLUMN',@level2name=N'Months'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'填报单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HeadMonthReportB', @level2type=N'COLUMN',@level2name=N'ReportUnitName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'填报日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HeadMonthReportB', @level2type=N'COLUMN',@level2name=N'ReportDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'填报人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HeadMonthReportB', @level2type=N'COLUMN',@level2name=N'ReportMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审核人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HeadMonthReportB', @level2type=N'COLUMN',@level2name=N'CheckMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总部月报告统计表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HeadMonthReportB'
GO
ALTER TABLE dbo.Accident_AccidentReport ADD	AccidentReportName NVARCHAR(30)
ALTER TABLE dbo.Accident_AccidentReport ADD	AccidentTypeId NVARCHAR(50)
ALTER TABLE dbo.Accident_AccidentReport ADD	Abstract NVARCHAR(20)	
ALTER TABLE dbo.Accident_AccidentReport ADD	AccidentDate DATETIME																 
ALTER TABLE dbo.Accident_AccidentReport ADD	WorkAreaId NVARCHAR(50)	
ALTER TABLE dbo.Accident_AccidentReport ADD	PeopleNum INT	  
ALTER TABLE dbo.Accident_AccidentReport ADD	WorkingHoursLoss DECIMAL(18,1)	 
ALTER TABLE dbo.Accident_AccidentReport ADD	EconomicLoss DECIMAL(18,2)    
ALTER TABLE dbo.Accident_AccidentReport ADD	ReportMan NVARCHAR(50)   
ALTER TABLE dbo.Accident_AccidentReport ADD	ReporterUnit NVARCHAR(50)	   	   
ALTER TABLE dbo.Accident_AccidentReport ADD	ReportDate DATETIME																	   	   	   
ALTER TABLE dbo.Accident_AccidentReport ADD	ProcessDescription NVARCHAR(500)													   	   	   
ALTER TABLE dbo.Accident_AccidentReport ADD	EmergencyMeasures NVARCHAR(500)
GO
ALTER TABLE [dbo].[Accident_AccidentReport]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentReport_Base_AccidentType] FOREIGN KEY([AccidentTypeId])
REFERENCES [dbo].[Base_AccidentType] ([AccidentTypeId])
GO

ALTER TABLE [dbo].[Accident_AccidentReport] CHECK CONSTRAINT [FK_Accident_AccidentReport_Base_AccidentType]
GO
ALTER TABLE [dbo].[Accident_AccidentReport]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentReport_ProjectData_WorkArea] FOREIGN KEY([WorkAreaId])
REFERENCES [dbo].[ProjectData_WorkArea] ([WorkAreaId])
GO

ALTER TABLE [dbo].[Accident_AccidentReport] CHECK CONSTRAINT [FK_Accident_AccidentReport_ProjectData_WorkArea]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故报告名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport', @level2type=N'COLUMN',@level2name=N'AccidentReportName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故类型Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport', @level2type=N'COLUMN',@level2name=N'AccidentTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提要' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport', @level2type=N'COLUMN',@level2name=N'Abstract'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport', @level2type=N'COLUMN',@level2name=N'AccidentDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生区域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport', @level2type=N'COLUMN',@level2name=N'WorkAreaId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport', @level2type=N'COLUMN',@level2name=N'PeopleNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工时损失' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport', @level2type=N'COLUMN',@level2name=N'WorkingHoursLoss'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经济损失' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport', @level2type=N'COLUMN',@level2name=N'EconomicLoss'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报告人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport', @level2type=N'COLUMN',@level2name=N'ReportMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报告人单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport', @level2type=N'COLUMN',@level2name=N'ReporterUnit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报告时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport', @level2type=N'COLUMN',@level2name=N'ReportDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故过程描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport', @level2type=N'COLUMN',@level2name=N'ProcessDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'紧急措施' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport', @level2type=N'COLUMN',@level2name=N'EmergencyMeasures'
GO





CREATE TABLE [dbo].[Accident_AccidentReportOther](
	[AccidentReportOtherId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[AccidentReportOtherCode] [nvarchar](50) NULL,
	[AccidentReportOtherName] [nvarchar](50) NULL,
	[AccidentTypeId] [nvarchar](50) NULL,
	[Abstract] [nvarchar](20) NULL,
	[AccidentDate] [datetime] NULL,
	[WorkAreaId] [nvarchar](50) NULL,
	[PeopleNum] [int] NULL,
	[UnitId] [nvarchar](50) NULL,
	[WorkingHoursLoss] [decimal](18, 1) NULL,
	[EconomicLoss] [decimal](18, 2) NULL,
	[ReportMan] [nvarchar](50) NULL,
	[ReporterUnit] [nvarchar](50) NULL,
	[ReportDate] [datetime] NULL,
	[ProcessDescription] [nvarchar](500) NULL,
	[EmergencyMeasures] [nvarchar](500) NULL,
	[ImmediateCause] [nvarchar](500) NULL,
	[IndirectReason] [nvarchar](500) NULL,
	[CorrectivePreventive] [nvarchar](500) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Accident_AccidentReportOther] PRIMARY KEY CLUSTERED 
(
	[AccidentReportOtherId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'AccidentReportOtherId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'AccidentReportOtherCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'AccidentReportOtherName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'AccidentTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提要' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'Abstract'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'AccidentDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生区域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'WorkAreaId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'PeopleNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故责任单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工时损失' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'WorkingHoursLoss'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经济损失' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'EconomicLoss'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报告人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'ReportMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报告人单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'ReporterUnit'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报告时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'ReportDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故过程描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'ProcessDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'紧急措施' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'EmergencyMeasures'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'直接原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'ImmediateCause'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'间接原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'IndirectReason'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改及预防措施' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'CorrectivePreventive'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报告编制' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故调查处理报告' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOther'
GO

ALTER TABLE [dbo].[Accident_AccidentReportOther]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentReportOther_Base_AccidentType] FOREIGN KEY([AccidentTypeId])
REFERENCES [dbo].[Base_AccidentType] ([AccidentTypeId])
GO

ALTER TABLE [dbo].[Accident_AccidentReportOther] CHECK CONSTRAINT [FK_Accident_AccidentReportOther_Base_AccidentType]
GO

ALTER TABLE [dbo].[Accident_AccidentReportOther]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentReportOther_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Accident_AccidentReportOther] CHECK CONSTRAINT [FK_Accident_AccidentReportOther_Base_Project]
GO

ALTER TABLE [dbo].[Accident_AccidentReportOther]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentReportOther_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Accident_AccidentReportOther] CHECK CONSTRAINT [FK_Accident_AccidentReportOther_Base_Unit]
GO

ALTER TABLE [dbo].[Accident_AccidentReportOther]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentReportOther_ProjectData_WorkArea] FOREIGN KEY([WorkAreaId])
REFERENCES [dbo].[ProjectData_WorkArea] ([WorkAreaId])
GO

ALTER TABLE [dbo].[Accident_AccidentReportOther] CHECK CONSTRAINT [FK_Accident_AccidentReportOther_ProjectData_WorkArea]
GO

ALTER TABLE [dbo].[Accident_AccidentReportOther]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentReportOther_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Accident_AccidentReportOther] CHECK CONSTRAINT [FK_Accident_AccidentReportOther_Sys_User]
GO




CREATE TABLE [dbo].[Accident_AccidentReportOtherItem](
	[AccidentReportOtherItemId] [nvarchar](50) NOT NULL,
	[AccidentReportOtherId] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NULL,
	[PersonId] [nvarchar](50) NULL,
	[PositionId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Accident_AccidentReportOtherItem] PRIMARY KEY CLUSTERED 
(
	[AccidentReportOtherItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOtherItem', @level2type=N'COLUMN',@level2name=N'AccidentReportOtherItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故调查处理报告Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOtherItem', @level2type=N'COLUMN',@level2name=N'AccidentReportOtherId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOtherItem', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOtherItem', @level2type=N'COLUMN',@level2name=N'PersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOtherItem', @level2type=N'COLUMN',@level2name=N'PositionId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调查组成员表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReportOtherItem'
GO

ALTER TABLE [dbo].[Accident_AccidentReportOtherItem]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentReportOtherItem_Accident_AccidentReportOther] FOREIGN KEY([AccidentReportOtherId])
REFERENCES [dbo].[Accident_AccidentReportOther] ([AccidentReportOtherId])
GO

ALTER TABLE [dbo].[Accident_AccidentReportOtherItem] CHECK CONSTRAINT [FK_Accident_AccidentReportOtherItem_Accident_AccidentReportOther]
GO

ALTER TABLE [dbo].[Accident_AccidentReportOtherItem]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentReportOtherItem_Base_Position] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Base_Position] ([PositionId])
GO

ALTER TABLE [dbo].[Accident_AccidentReportOtherItem] CHECK CONSTRAINT [FK_Accident_AccidentReportOtherItem_Base_Position]
GO

ALTER TABLE [dbo].[Accident_AccidentReportOtherItem]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentReportOtherItem_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Accident_AccidentReportOtherItem] CHECK CONSTRAINT [FK_Accident_AccidentReportOtherItem_Base_Unit]
GO

ALTER TABLE [dbo].[Accident_AccidentReportOtherItem]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentReportOtherItem_SitePerson_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[SitePerson_Person] ([PersonId])
GO

ALTER TABLE [dbo].[Accident_AccidentReportOtherItem] CHECK CONSTRAINT [FK_Accident_AccidentReportOtherItem_SitePerson_Person]
GO



CREATE TABLE [dbo].[Base_ProjectSate](
	[ProjectStateId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[ProjectState] [char](1) NULL,
	[OldProjectState] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[ShutdownDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Base_ProjectSate] PRIMARY KEY CLUSTERED 
(
	[ProjectStateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Base_ProjectSate]  WITH CHECK ADD  CONSTRAINT [FK_Base_ProjectSate_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Base_ProjectSate] CHECK CONSTRAINT [FK_Base_ProjectSate_Base_Project]
GO

ALTER TABLE [dbo].[Base_ProjectSate]  WITH CHECK ADD  CONSTRAINT [FK_Base_ProjectSate_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Base_ProjectSate] CHECK CONSTRAINT [FK_Base_ProjectSate_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_ProjectSate', @level2type=N'COLUMN',@level2name=N'ProjectStateId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_ProjectSate', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请项目状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_ProjectSate', @level2type=N'COLUMN',@level2name=N'ProjectState'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'原项目状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_ProjectSate', @level2type=N'COLUMN',@level2name=N'OldProjectState'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_ProjectSate', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_ProjectSate', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态生效时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_ProjectSate', @level2type=N'COLUMN',@level2name=N'ShutdownDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单据状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_ProjectSate', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目状态表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_ProjectSate'
GO


ALTER TABLE Check_CheckDayDetail ADD CheckContent NVARCHAR(500) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项目内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayDetail', @level2type=N'COLUMN',@level2name=N'CheckContent'
GO
ALTER TABLE Check_CheckDayDetail ADD WorkArea NVARCHAR(500) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查区域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckDayDetail', @level2type=N'COLUMN',@level2name=N'WorkArea'
GO

ALTER TABLE Check_CheckSpecialDetail ADD CheckContent NVARCHAR(500) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项目内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecialDetail', @level2type=N'COLUMN',@level2name=N'CheckContent'
GO
ALTER TABLE Check_CheckSpecialDetail ADD WorkArea NVARCHAR(500) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查区域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecialDetail', @level2type=N'COLUMN',@level2name=N'WorkArea'
GO

ALTER TABLE Check_CheckColligationDetail ADD CheckContent NVARCHAR(500) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项目内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckColligationDetail', @level2type=N'COLUMN',@level2name=N'CheckContent'
GO
ALTER TABLE Check_CheckColligationDetail ADD WorkArea NVARCHAR(500) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查区域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckColligationDetail', @level2type=N'COLUMN',@level2name=N'WorkArea'
GO
ALTER TABLE Check_CheckWorkDetail ADD CheckContent NVARCHAR(500) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项目内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWorkDetail', @level2type=N'COLUMN',@level2name=N'CheckContent'
GO
ALTER TABLE Check_CheckWorkDetail ADD WorkArea NVARCHAR(500) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查区域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWorkDetail', @level2type=N'COLUMN',@level2name=N'WorkArea'
GO
ALTER TABLE Check_CheckHolidayDetail ADD CheckContent NVARCHAR(500) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项目内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHolidayDetail', @level2type=N'COLUMN',@level2name=N'CheckContent'
GO
ALTER TABLE Check_CheckHolidayDetail ADD WorkArea NVARCHAR(500) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查区域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHolidayDetail', @level2type=N'COLUMN',@level2name=N'WorkArea'
GO
ALTER VIEW [dbo].[View_Check_CheckDayDetail] 
AS 
/*日常巡检明细列表视图*/
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
checkDayDetail.WorkArea,
unit.UnitName,
const.ConstText as HandleStepStr
FROM dbo.Check_CheckDayDetail AS checkDayDetail
LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail ON checkItemDetail.CheckItemDetailId=checkDayDetail.CheckItem
--LEFT JOIN dbo.ProjectData_WorkArea AS workArea ON workArea.WorkAreaId=checkDayDetail.CheckArea
LEFT JOIN dbo.Base_Unit AS unit ON unit.UnitId=checkDayDetail.UnitId
LEFT JOIN Sys_Const AS const ON const.ConstValue = checkDayDetail.HandleStep and const.GroupId='HandleStep'
GO

ALTER PROCEDURE [dbo].[SpCheckDayStatistic]     
@ProjectId nvarchar(50),
@StartTime nvarchar(15)=null,        
@EndTime nvarchar(15)=null,
@States char(1)=null         
AS      
BEGIN    

SELECT 	CheckDayDetail.CheckDayDetailId
	,CheckDay.CheckDayId
	,CheckDay.CheckDayId+','+ISNULL(CheckDayDetail.CheckDayDetailId,'') AS NewChcekId
	,CodeRecords.Code AS CheckDayCode
	,Checks.CheckCount
	,CheckDayDetail.WorkArea
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
	,(CASE WHEN CheckDay.States='0' OR CheckDay.States IS NULL THEN '待['+Users.UserName+']提交' WHEN CheckDay.States='2' THEN '审核/审批完成' ELSE '待['+OperateUser.UserName+']办理' END) AS  FlowOperateName
from Check_CheckDay AS CheckDay 
LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckDay.CheckDayId=CodeRecords.DataId
LEFT JOIN Check_CheckDayDetail  AS CheckDayDetail on CheckDayDetail.CheckDayId = CheckDay.CheckDayId    
--LEFT JOIN ProjectData_WorkArea AS WorkArea on WorkArea.WorkAreaId=CheckDayDetail.CheckArea        
LEFT JOIN Base_Unit AS Unit on Unit.UnitId=CheckDayDetail.UnitId        
LEFT JOIN (SELECT COUNT(*)  AS CheckCount, CheckDayId 
			FROM Check_CheckDayDetail GROUP BY CheckDayId) AS Checks ON Checks.CheckDayId = CheckDay.CheckDayId 
LEFT JOIN Sys_FlowOperate AS FlowOperate ON CheckDay.CheckDayId=FlowOperate.DataId AND FlowOperate.IsClosed <> 1
LEFT JOIN Sys_User AS OperateUser ON FlowOperate.OperaterId=OperateUser.UserId
LEFT JOIN Sys_User AS Users ON CheckDay.CompileMan=Users.UserId
WHERE  (@StartTime is null or CheckDay.CheckTime>=@StartTime) 
		and (@EndTime is null or CheckDay.CheckTime <=@EndTime ) 
		and CheckDay.ProjectId=@ProjectId
		and (@States is null or CheckDay.States=@States) 

order by CheckDayCode desc
   
END
GO


ALTER VIEW [dbo].[View_Check_CheckSpecialDetail]  AS 
/*专项检查明细列表视图*/
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
checkSpecialDetail.CheckContent as CheckItemStr,
checkSpecialDetail.WorkArea,
unit.UnitName,
const.ConstText as HandleStepStr
FROM dbo.Check_CheckSpecialDetail AS checkSpecialDetail
LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail ON checkItemDetail.CheckItemDetailId=checkSpecialDetail.CheckItem
--LEFT JOIN dbo.ProjectData_WorkArea AS workArea ON workArea.WorkAreaId=checkSpecialDetail.CheckArea
LEFT JOIN dbo.Base_Unit AS unit ON unit.UnitId=checkSpecialDetail.UnitId
LEFT JOIN Sys_Const AS const ON const.ConstValue = checkSpecialDetail.HandleStep and const.GroupId='HandleStep'

GO

ALTER TABLE Check_CheckSpecial ADD CheckType CHAR(1) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckSpecial', @level2type=N'COLUMN',@level2name=N'CheckType'
GO


ALTER PROCEDURE [dbo].[SpCheckSpecialStatistic]     
@ProjectId nvarchar(50),
@StartTime nvarchar(15)=null,        
@EndTime nvarchar(15)=null,
@States char(1)=null            
AS      
BEGIN    

SELECT 	CheckSpecialDetail.CheckSpecialDetailId
	,CheckSpecial.CheckSpecialId
	,CheckSpecial.CheckSpecialId+','+ISNULL(CheckSpecialDetail.CheckSpecialDetailId,'') AS NewChcekId
	,CodeRecords.Code AS CheckSpecialCode
	,Checks.CheckCount
	,CheckSpecialDetail.WorkArea
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
	,(CASE WHEN CheckSpecial.CheckType ='0' THEN '周检' WHEN CheckSpecial.CheckType ='1' THEN '月检' ELSE '其它' END)  AS CheckTypeName
	,(CASE WHEN CheckSpecial.States='0' OR CheckSpecial.States IS NULL THEN '待['+Users.UserName+']提交' WHEN CheckSpecial.States='2' THEN '审核/审批完成' ELSE '待['+OperateUser.UserName+']办理' END) AS  FlowOperateName
from Check_CheckSpecial AS CheckSpecial 
LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckSpecial.CheckSpecialId=CodeRecords.DataId
LEFT JOIN Sys_User AS user1 ON CheckSpecial.CheckPerson=user1.UserId
LEFT JOIN Check_CheckSpecialDetail  AS CheckSpecialDetail on CheckSpecialDetail.CheckSpecialId = CheckSpecial.CheckSpecialId    
--LEFT JOIN ProjectData_WorkArea AS WorkArea on WorkArea.WorkAreaId=CheckSpecialDetail.CheckArea        
LEFT JOIN Base_Unit AS Unit on Unit.UnitId=CheckSpecialDetail.UnitId        
LEFT JOIN (SELECT COUNT(*)  AS CheckCount, CheckSpecialId 
			FROM Check_CheckSpecialDetail GROUP BY CheckSpecialId) AS Checks ON Checks.CheckSpecialId = CheckSpecial.CheckSpecialId 
LEFT JOIN Sys_FlowOperate AS FlowOperate ON CheckSpecial.CheckSpecialId=FlowOperate.DataId AND FlowOperate.IsClosed <> 1
LEFT JOIN Sys_User AS OperateUser ON FlowOperate.OperaterId=OperateUser.UserId
LEFT JOIN Sys_User AS Users ON CheckSpecial.CompileMan=Users.UserId
WHERE  (@StartTime is null or CheckSpecial.CheckTime>=@StartTime) 
		and (@EndTime is null or CheckSpecial.CheckTime <=@EndTime ) 
		and CheckSpecial.ProjectId=@ProjectId
		and (@States is null or CheckSpecial.States=@States) 

order by CheckSpecialCode desc
   
END
GO


ALTER VIEW [dbo].[View_Check_CheckColligationDetail]  AS 
/*综合大检查明细列表视图*/
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
checkColligationDetail.CheckContent as CheckItemStr,
checkColligationDetail.WorkArea,
unit.UnitName,
const.ConstText as HandleStepStr
FROM dbo.Check_CheckColligationDetail AS checkColligationDetail
LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail ON checkItemDetail.CheckItemDetailId=checkColligationDetail.CheckItem
--LEFT JOIN dbo.ProjectData_WorkArea AS workArea ON workArea.WorkAreaId=checkColligationDetail.CheckArea
LEFT JOIN dbo.Base_Unit AS unit ON unit.UnitId=checkColligationDetail.UnitId
LEFT JOIN Sys_Const AS const ON const.ConstValue = checkColligationDetail.HandleStep and const.GroupId='HandleStep'

GO


ALTER PROCEDURE [dbo].[SpCheckColligationStatistic]     
@ProjectId nvarchar(50),
@StartTime nvarchar(15)=null,        
@EndTime nvarchar(15)=null,
@States char(1)=null          
AS      
BEGIN    

SELECT 	CheckColligationDetail.CheckColligationDetailId
	,CheckColligation.CheckColligationId
	,CheckColligation.CheckColligationId+','+ISNULL(CheckColligationDetail.CheckColligationDetailId,'') AS NewChcekId
	,CodeRecords.Code AS CheckColligationCode
	,Checks.CheckCount
	,CheckColligationDetail.WorkArea
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
	,(CASE WHEN CheckColligation.CheckType ='0' THEN '周检' WHEN CheckColligation.CheckType ='1' THEN '月检' ELSE '其它' END)  AS CheckTypeName
	,(CASE WHEN CheckColligation.States='0' OR CheckColligation.States IS NULL THEN '待['+Users.UserName+']提交' WHEN CheckColligation.States='2' THEN '审核/审批完成' ELSE '待['+OperateUser.UserName+']办理' END) AS  FlowOperateName
from Check_CheckColligation AS CheckColligation 
LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckColligation.CheckColligationId=CodeRecords.DataId
LEFT JOIN Sys_User AS user1 ON CheckColligation.CheckPerson=user1.UserId
LEFT JOIN Check_CheckColligationDetail  AS CheckColligationDetail on CheckColligationDetail.CheckColligationId = CheckColligation.CheckColligationId    
--LEFT JOIN ProjectData_WorkArea AS WorkArea on WorkArea.WorkAreaId=CheckColligationDetail.CheckArea        
LEFT JOIN Base_Unit AS Unit on Unit.UnitId=CheckColligationDetail.UnitId        
LEFT JOIN (SELECT COUNT(*)  AS CheckCount, CheckColligationId 
			FROM Check_CheckColligationDetail GROUP BY CheckColligationId) AS Checks ON Checks.CheckColligationId = CheckColligation.CheckColligationId 
LEFT JOIN Sys_FlowOperate AS FlowOperate ON CheckColligation.CheckColligationId=FlowOperate.DataId AND FlowOperate.IsClosed <> 1
LEFT JOIN Sys_User AS OperateUser ON FlowOperate.OperaterId=OperateUser.UserId
LEFT JOIN Sys_User AS Users ON CheckColligation.CompileMan=Users.UserId
WHERE  (@StartTime is null or CheckColligation.CheckTime>=@StartTime) 
		and (@EndTime is null or CheckColligation.CheckTime <=@EndTime ) 
		and CheckColligation.ProjectId=@ProjectId
		and (@States is null or CheckColligation.States=@States) 

order by CheckColligationCode desc
   
END

GO

ALTER TABLE Check_CheckWork ADD IsAgree BIT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否同意开工' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckWork', @level2type=N'COLUMN',@level2name=N'IsAgree'
GO

ALTER VIEW [dbo].[View_Check_CheckWorkDetail]  
AS 
/*开工前检查明细列表视图*/
SELECT checkWorkDetail.CheckWorkDetailId, 
checkWorkDetail.CheckWorkId, 
checkWorkDetail.CheckItem, 
checkWorkDetail.CheckResult,
checkWorkDetail.CheckOpinion,
checkWorkDetail.CheckStation,
checkWorkDetail.HandleResult,
checkWorkDetail.CheckContent as CheckItemStr
FROM dbo.Check_CheckWorkDetail AS checkWorkDetail
LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail 
ON checkItemDetail.CheckItemDetailId=checkWorkDetail.CheckItem
GO


ALTER VIEW [dbo].[View_Check_CheckHolidayDetail]  
AS 
/*季节性/节假日检查明细列表视图*/
SELECT checkHolidayDetail.CheckHolidayDetailId, 
checkHolidayDetail.CheckHolidayId, 
checkHolidayDetail.CheckItem, 
checkHolidayDetail.CheckResult,
checkHolidayDetail.CheckOpinion,
checkHolidayDetail.CheckStation,
checkHolidayDetail.HandleResult,
checkHolidayDetail.CheckContent as CheckItemStr
FROM dbo.Check_CheckHolidayDetail AS checkHolidayDetail
LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail
ON checkItemDetail.CheckItemDetailId=checkHolidayDetail.CheckItem

GO

ALTER TABLE Check_CheckHoliday ADD Evaluate NVARCHAR(50) NULL
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckHoliday', @level2type=N'COLUMN',@level2name=N'Evaluate'
GO
ALTER TABLE Check_RectifyNoticeDetail ADD CheckContent NVARCHAR(500) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查项目内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNoticeDetail', @level2type=N'COLUMN',@level2name=N'CheckContent'
GO

ALTER TABLE Check_RectifyNotice ADD RectifyType NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隐患类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotice', @level2type=N'COLUMN',@level2name=N'RectifyType'
GO

ALTER TABLE Check_RectifyNotice ADD RectifyState NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隐患状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_RectifyNotice', @level2type=N'COLUMN',@level2name=N'RectifyState'
GO

ALTER VIEW [dbo].[View_Check_RectifyNoticeDetail]  
AS 
/*隐患整改单明细列表视图*/
SELECT rectifyNoticeDetail.RectifyNoticeDetailId, 
rectifyNoticeDetail.RectifyNoticeId, 
rectifyNoticeDetail.CheckItem, 
rectifyNoticeDetail.CheckItemType,
rectifyNoticeDetail.Unqualified,
rectifyNoticeDetail.CheckArea,
rectifyNoticeDetail.UnitId,
rectifyNoticeDetail.Suggestions,
rectifyNoticeDetail.CheckContent as CheckItemStr,
workArea.WorkAreaName,
unit.UnitName
FROM dbo.Check_RectifyNoticeDetail AS rectifyNoticeDetail
LEFT JOIN dbo.Check_ProjectCheckItemDetail AS checkItemDetail ON checkItemDetail.CheckItemDetailId=rectifyNoticeDetail.CheckItem
LEFT JOIN dbo.ProjectData_WorkArea AS workArea ON workArea.WorkAreaId=rectifyNoticeDetail.CheckArea
LEFT JOIN dbo.Base_Unit AS unit ON unit.UnitId=rectifyNoticeDetail.UnitId
GO

ALTER TABLE Base_LicenseType ADD  LicenseContents NVARCHAR(MAX) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_LicenseType', @level2type=N'COLUMN',@level2name=N'LicenseContents'
GO