CREATE TABLE [dbo].[Manager_ManagerTotalMonthItem](
	[ManagerTotalMonthItemId] [nvarchar](50) NOT NULL,
	[ManagerTotalMonthId] [nvarchar](50) NOT NULL,
	[ExistenceHiddenDanger] [nvarchar](150) NULL,
	[CorrectiveActions] [nvarchar](150) NULL,
	[PlanCompletedDate] [datetime] NULL,
	[ResponsiMan] [nvarchar](50) NULL,
	[ActualCompledDate] [datetime] NULL,
	[Remark] [nvarchar](200) NULL,
 CONSTRAINT [PK_Manager_ManagerTotalMonthItem] PRIMARY KEY CLUSTERED 
(
	[ManagerTotalMonthItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotalMonthItem', @level2type=N'COLUMN',@level2name=N'ManagerTotalMonthItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月总结ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotalMonthItem', @level2type=N'COLUMN',@level2name=N'ManagerTotalMonthId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'存在隐患' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotalMonthItem', @level2type=N'COLUMN',@level2name=N'ExistenceHiddenDanger'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整改措施' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotalMonthItem', @level2type=N'COLUMN',@level2name=N'CorrectiveActions'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计划完成时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotalMonthItem', @level2type=N'COLUMN',@level2name=N'PlanCompletedDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'责任人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotalMonthItem', @level2type=N'COLUMN',@level2name=N'ResponsiMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实际完成时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotalMonthItem', @level2type=N'COLUMN',@level2name=N'ActualCompledDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_ManagerTotalMonthItem', @level2type=N'COLUMN',@level2name=N'Remark'
GO

ALTER TABLE [dbo].[Manager_ManagerTotalMonthItem]  WITH CHECK ADD  CONSTRAINT [FK_Manager_ManagerTotalMonthItem_Manager_ManagerTotalMonth] FOREIGN KEY([ManagerTotalMonthId])
REFERENCES [dbo].[Manager_ManagerTotalMonth] ([ManagerTotalMonthId])
GO

ALTER TABLE [dbo].[Manager_ManagerTotalMonthItem] CHECK CONSTRAINT [FK_Manager_ManagerTotalMonthItem_Manager_ManagerTotalMonth]
GO


