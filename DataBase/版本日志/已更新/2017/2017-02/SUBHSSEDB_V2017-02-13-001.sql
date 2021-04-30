CREATE TABLE [dbo].[Manager_HSSELog](
	[HSSELogId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[CompileMan] [nvarchar](50) NULL,
	[Weather] [nvarchar](50) NULL,
	[IsVisible] [bit] NULL,
	[Contents11] [nvarchar](2000) NULL,
	[Contents12] [nvarchar](2000) NULL,
	[Contents13] [nvarchar](2000) NULL,
	[Contents21] [nvarchar](2000) NULL,
	[Num21] [int] NULL,
	[Contents22] [nvarchar](2000) NULL,
	[Num22] [int] NULL,
	[Contents23] [nvarchar](2000) NULL,
	[Num23] [int] NULL,
	[Contents24] [nvarchar](2000) NULL,
	[Num24] [int] NULL,
	[Contents25] [nvarchar](2000) NULL,
	[Num25] [int] NULL,
	[Contents26] [nvarchar](2000) NULL,
	[Num26] [int] NULL,
	[Contents27] [nvarchar](2000) NULL,
	[Num27] [int] NULL,
	[Contents28] [nvarchar](2000) NULL,
	[Num28] [int] NULL,
	[Contents29] [nvarchar](2000) NULL,
	[Num29] [int] NULL,
	[Contents210] [nvarchar](2000) NULL,
	[Num210] [int] NULL,
	[Num211] [int] NULL,
	[Contents31] [nvarchar](2000) NULL,
	[Num31] [int] NULL,
	[Contents32] [nvarchar](2000) NULL,
	[Num32] [int] NULL,
	[Contents33] [nvarchar](2000) NULL,
	[Num33] [int] NULL,
	[Contents34] [nvarchar](2000) NULL,
	[Num34] [int] NULL,
	[Contents41] [nvarchar](2000) NULL,
	[Contents42] [nvarchar](2000) NULL,
	[Contents43] [nvarchar](2000) NULL,
	[Contents51] [nvarchar](2000) NULL,
	[Contents52] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Manager_HSSELog] PRIMARY KEY CLUSTERED 
(
	[HSSELogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Manager_HSSELog]  WITH CHECK ADD  CONSTRAINT [FK_Manager_HSSELog_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Manager_HSSELog] CHECK CONSTRAINT [FK_Manager_HSSELog_Base_Project]
GO

ALTER TABLE [dbo].[Manager_HSSELog]  WITH CHECK ADD  CONSTRAINT [FK_Manager_HSSELog_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Manager_HSSELog] CHECK CONSTRAINT [FK_Manager_HSSELog_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'HSSELogId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'天气' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Weather'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否呈现（false-不呈现）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'IsVisible'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Contents11'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Contents12'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Contents13'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Contents21'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Num21'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Contents22'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Num22'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Contents23'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Num23'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Contents24'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Num24'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Contents25'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Num25'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Contents26'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Num26'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Contents27'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Num27'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Contents28'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Num28'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Contents29'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Num29'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Contents210'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Num210'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Num211'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Contents31'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Num31'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Contents32'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Num32'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Contents33'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Num33'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Contents34'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Num34'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Contents41'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Contents42'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Contents43'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Contents51'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Contents52'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE日志表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog'
GO

CREATE TABLE [dbo].[Manager_HSSELogMonth](
	[HSSELogMonthId] [nvarchar](50) NOT NULL,
	[HSSELogMonthCode] [nvarchar](50) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Months] [datetime] NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[ProjectRange] [nvarchar](500) NULL,
	[ManHour] [int] NULL,
	[Rate] [numeric](9, 2) NULL,
	[RealManHour] [numeric](9, 2) NULL,
	[TotalManHour] [numeric](9, 2) NULL,
	[Num1] [int] NULL,
	[Num2] [int] NULL,
	[Num3] [int] NULL,
	[Num4] [int] NULL,
	[Num5] [int] NULL,
	[Num6] [int] NULL,
	[Num7] [int] NULL,
	[Num8] [int] NULL,
	[Num9] [int] NULL,
	[Num10] [int] NULL,
	[Num11] [int] NULL,
	[Num12] [int] NULL,
	[Num13] [int] NULL,
	[Num14] [int] NULL,
	[Num15] [int] NULL,
 CONSTRAINT [PK_Manager_HSSELogMonth] PRIMARY KEY CLUSTERED 
(
	[HSSELogMonthId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Manager_HSSELogMonth]  WITH CHECK ADD  CONSTRAINT [FK_Manager_HSSELogMonth_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Manager_HSSELogMonth] CHECK CONSTRAINT [FK_Manager_HSSELogMonth_Base_Project]
GO

ALTER TABLE [dbo].[Manager_HSSELogMonth]  WITH CHECK ADD  CONSTRAINT [FK_Manager_HSSELogMonth_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Manager_HSSELogMonth] CHECK CONSTRAINT [FK_Manager_HSSELogMonth_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'HSSELogMonthId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'HSSELogMonthCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月份' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'Months'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'责任人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工程范围' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'ProjectRange'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月责任范围内人工日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'ManHour'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'难度系数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'Rate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月折合人工日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'RealManHour'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年度累计人工日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'TotalManHour'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE检查次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'Num1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'隐患整改数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'Num2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业票办理数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'Num3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机械、安全设施验收数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'Num4'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'危险源辨识活动次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'Num5'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急计划方案修编、应急活动次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'Num6'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE培训人次' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'Num7'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE会议数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'Num8'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE宣传活动次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'Num9'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE奖励次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'Num10'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE处罚次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'Num11'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE体系文件修编数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'Num12'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE资质方案核查数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'Num13'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE费用核查次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'Num14'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE文件资料分类上档数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth', @level2type=N'COLUMN',@level2name=N'Num15'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE经理暨HSSE工程师细则表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELogMonth'
GO


INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('3E077A36-EC12-4FC7-B685-1F439291C9B8','HSSE日志暨管理数据收集','Manager/HSSELog.aspx','PageHeaderFooter',130,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO
--HSSE日志暨管理数据收集
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4B932BFC-8B17-4474-8CBE-5FCA25CD6D15','3E077A36-EC12-4FC7-B685-1F439291C9B8','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('516517C5-DE3E-4EC9-BBCB-EC2ACD629773','3E077A36-EC12-4FC7-B685-1F439291C9B8','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('09DF74A8-B5AF-44D0-9F5E-100627AAA2CC','3E077A36-EC12-4FC7-B685-1F439291C9B8','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('233F14D6-6F72-4F1C-BBA6-C76C082AA40C','3E077A36-EC12-4FC7-B685-1F439291C9B8','保存',4)  
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('E763BC17-EC0D-4AB3-A388-EC7F734B56F2','HSSE经理暨HSSE工程师细则','Manager/HSSELogMonth.aspx','PageHeaderFooter',140,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
GO
--HSSE经理暨HSSE工程师细则
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('857B59B4-F1C7-4657-B873-1862ED9B092C','E763BC17-EC0D-4AB3-A388-EC7F734B56F2','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('8D8A003E-4AF8-4623-819D-8AE48B37D4C9','E763BC17-EC0D-4AB3-A388-EC7F734B56F2','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('2ACA2BF2-930D-4474-A076-6462155A8B69','E763BC17-EC0D-4AB3-A388-EC7F734B56F2','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('6819DDC3-5F0C-4690-B9D7-21D842651EBC','E763BC17-EC0D-4AB3-A388-EC7F734B56F2','保存',4)  
GO

UPDATE Sys_MenuProjectB SET Icon='PageHeaderFooter' WHERE MenuId='54A3E23A-DAC7-484B-8C97-40AD785688FC'
GO
UPDATE Sys_MenuProjectB SET Icon='PageHeaderFooter' WHERE MenuId='75088181-ACE2-4CBE-90F9-DB043D46F04A'
GO
UPDATE Sys_MenuProjectA SET Icon='PageHeaderFooter' WHERE MenuId='54A3E23A-DAC7-484B-8C97-40AD785688FC'
GO
UPDATE Sys_MenuProjectA SET Icon='PageHeaderFooter' WHERE MenuId='75088181-ACE2-4CBE-90F9-DB043D46F04A'
GO

ALTER TABLE Hazard_HazardSelectedItem ALTER COLUMN HazardListTypeId NVARCHAR(50) NULL
GO
ALTER TABLE Hazard_HazardSelectedItem ALTER COLUMN HelperMethod NVARCHAR(50) NULL
GO
ALTER TABLE Hazard_HazardSelectedItem ALTER COLUMN HazardLevel NVARCHAR(50) NULL
GO
ALTER TABLE Hazard_HazardSelectedItem ALTER COLUMN WorkStage NVARCHAR(50) NULL
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId, MenuName, Url, Icon, SortIndex, SuperMenu, MenuType, IsEnd, IsUnit)
VALUES('6FBF4B7D-21D2-4013-9465-12AC093109D4','安全措施费使用计划','CostGoods/MeasuresPlan.aspx','PageHeaderFooter',21,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId, MenuId, ButtonName, SortIndex)
VALUES('EC539E34-1408-4DF4-913F-F4661C476434','6FBF4B7D-21D2-4013-9465-12AC093109D4','增加',1)	
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId, MenuId, ButtonName, SortIndex)
VALUES('D6E4AA9A-D4AE-410C-AB1F-0DF6DB409701','6FBF4B7D-21D2-4013-9465-12AC093109D4','修改',2)   
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId, MenuId, ButtonName, SortIndex)
VALUES('DE0207C7-825B-483A-AAC0-3A9776220513','6FBF4B7D-21D2-4013-9465-12AC093109D4','删除',3)   
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId, MenuId, ButtonName, SortIndex)
VALUES('D7E08A31-95C4-4DA1-8FDB-3F66D5390777','6FBF4B7D-21D2-4013-9465-12AC093109D4','保存',4)
GO
INSERT INTO dbo.Sys_MenuProjectA(MenuId, MenuName, Url, Icon, SortIndex, SuperMenu, MenuType, IsEnd, IsUnit)
VALUES('9EFF1A0F-87AA-43E7-83B0-79EEAAC8848E','安全费用投入登记','CostGoods/PayRegistration.aspx','PageHeaderFooter',22,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId, MenuId, ButtonName, SortIndex)
VALUES('79C89EF4-1AF3-4988-AD14-34FDC37B664D','9EFF1A0F-87AA-43E7-83B0-79EEAAC8848E','增加',1)	
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId, MenuId, ButtonName, SortIndex)
VALUES('09BC266D-B0C8-4C66-A388-9CAADCF6BB66','9EFF1A0F-87AA-43E7-83B0-79EEAAC8848E','修改',2)   
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId, MenuId, ButtonName, SortIndex)
VALUES('5C8792E2-0C7E-4F40-A556-F363D5EB54EE','9EFF1A0F-87AA-43E7-83B0-79EEAAC8848E','删除',3)   
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId, MenuId, ButtonName, SortIndex)
VALUES('03F0E7F1-0CC6-4B12-BB6F-865C0A1930CD','9EFF1A0F-87AA-43E7-83B0-79EEAAC8848E','保存',4)
GO

CREATE TABLE [dbo].[CostGoods_MeasuresPlan](
	[MeasuresPlanId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[MeasuresPlanCode] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[FileContents] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_CostGoods_MeasuresPlan] PRIMARY KEY CLUSTERED 
(
	[MeasuresPlanId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_MeasuresPlan', @level2type=N'COLUMN',@level2name=N'MeasuresPlanId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_MeasuresPlan', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_MeasuresPlan', @level2type=N'COLUMN',@level2name=N'MeasuresPlanCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_MeasuresPlan', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_MeasuresPlan', @level2type=N'COLUMN',@level2name=N'FileContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_MeasuresPlan', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_MeasuresPlan', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全措施费使用计划' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_MeasuresPlan'
GO

ALTER TABLE [dbo].[CostGoods_MeasuresPlan]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_MeasuresPlan_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[CostGoods_MeasuresPlan] CHECK CONSTRAINT [FK_CostGoods_MeasuresPlan_Base_Project]
GO

ALTER TABLE [dbo].[CostGoods_MeasuresPlan]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_MeasuresPlan_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[CostGoods_MeasuresPlan] CHECK CONSTRAINT [FK_CostGoods_MeasuresPlan_Base_Unit]
GO

ALTER TABLE [dbo].[CostGoods_MeasuresPlan]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_MeasuresPlan_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[CostGoods_MeasuresPlan] CHECK CONSTRAINT [FK_CostGoods_MeasuresPlan_Sys_User]
GO

CREATE TABLE [dbo].[CostGoods_PayRegistration](
	[PayRegistrationId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[PayDate] [datetime] NULL,
	[SMonthType1_1] [decimal](18, 2) NULL,
	[SMainApproveType1_1] [decimal](18, 2) NULL,
	[SMonthType1_2] [decimal](18, 2) NULL,
	[SMainApproveType1_2] [decimal](18, 2) NULL,
	[SMonthType1_3] [decimal](18, 2) NULL,
	[SMainApproveType1_3] [decimal](18, 2) NULL,
	[SMonthType1_4] [decimal](18, 2) NULL,
	[SMainApproveType1_4] [decimal](18, 2) NULL,
	[SMonthType1_5] [decimal](18, 2) NULL,
	[SMainApproveType1_5] [decimal](18, 2) NULL,
	[SMonthType1_6] [decimal](18, 2) NULL,
	[SMainApproveType1_6] [decimal](18, 2) NULL,
	[SMonthType1_7] [decimal](18, 2) NULL,
	[SMainApproveType1_7] [decimal](18, 2) NULL,
	[SMonthType1_8] [decimal](18, 2) NULL,
	[SMainApproveType1_8] [decimal](18, 2) NULL,
	[SMonthType1_9] [decimal](18, 2) NULL,
	[SMainApproveType1_9] [decimal](18, 2) NULL,
	[SMonthType1_10] [decimal](18, 2) NULL,
	[SMainApproveType1_10] [decimal](18, 2) NULL,
	[SMonthType1_11] [decimal](18, 2) NULL,
	[SMainApproveType1_11] [decimal](18, 2) NULL,
	[SMonthType1_12] [decimal](18, 2) NULL,
	[SMainApproveType1_12] [decimal](18, 2) NULL,
	[SMonthType1_13] [decimal](18, 2) NULL,
	[SMainApproveType1_13] [decimal](18, 2) NULL,
	[SMonthType1_14] [decimal](18, 2) NULL,
	[SMainApproveType1_14] [decimal](18, 2) NULL,
	[SMonthType1_15] [decimal](18, 2) NULL,
	[SMainApproveType1_15] [decimal](18, 2) NULL,
	[SMonthType1_16] [decimal](18, 2) NULL,
	[SMainApproveType1_16] [decimal](18, 2) NULL,
	[SMonthType2_1] [decimal](18, 2) NULL,
	[SMainApproveType2_1] [decimal](18, 2) NULL,
	[SMonthType2_2] [decimal](18, 2) NULL,
	[SMainApproveType2_2] [decimal](18, 2) NULL,
	[SMonthType2_3] [decimal](18, 2) NULL,
	[SMainApproveType2_3] [decimal](18, 2) NULL,
	[SMonthType2_4] [decimal](18, 2) NULL,
	[SMainApproveType2_4] [decimal](18, 2) NULL,
	[SMonthType3_1] [decimal](18, 2) NULL,
	[SMainApproveType3_1] [decimal](18, 2) NULL,
	[SMonthType3_2] [decimal](18, 2) NULL,
	[SMainApproveType3_2] [decimal](18, 2) NULL,
	[SMonthType3_3] [decimal](18, 2) NULL,
	[SMainApproveType3_3] [decimal](18, 2) NULL,
	[SMonthType3_4] [decimal](18, 2) NULL,
	[SMainApproveType3_4] [decimal](18, 2) NULL,
	[SMonthType3_5] [decimal](18, 2) NULL,
	[SMainApproveType3_5] [decimal](18, 2) NULL,
	[SMonthType3_6] [decimal](18, 2) NULL,
	[SMainApproveType3_6] [decimal](18, 2) NULL,
	[SMonthType4_1] [decimal](18, 2) NULL,
	[SMainApproveType4_1] [decimal](18, 2) NULL,
	[SMonthType4_2] [decimal](18, 2) NULL,
	[SMainApproveType4_2] [decimal](18, 2) NULL,
	[SMonthType4_3] [decimal](18, 2) NULL,
	[SMainApproveType4_3] [decimal](18, 2) NULL,
	[SMonthType4_4] [decimal](18, 2) NULL,
	[SMainApproveType4_4] [decimal](18, 2) NULL,
	[SMonthType4_5] [decimal](18, 2) NULL,
	[SMainApproveType4_5] [decimal](18, 2) NULL,
	[SMonthType4_6] [decimal](18, 2) NULL,
	[SMainApproveType4_6] [decimal](18, 2) NULL,
	[SMonthType4_7] [decimal](18, 2) NULL,
	[SMainApproveType4_7] [decimal](18, 2) NULL,
	[SMonthType4_8] [decimal](18, 2) NULL,
	[SMainApproveType4_8] [decimal](18, 2) NULL,
	[SMonthType4_9] [decimal](18, 2) NULL,
	[SMainApproveType4_9] [decimal](18, 2) NULL,
	[SMonthType4_10] [decimal](18, 2) NULL,
	[SMainApproveType4_10] [decimal](18, 2) NULL,
	[SMonthType4_11] [decimal](18, 2) NULL,
	[SMainApproveType4_11] [decimal](18, 2) NULL,
	[SMonthType4_12] [decimal](18, 2) NULL,
	[SMainApproveType4_12] [decimal](18, 2) NULL,
	[SMonthType4_13] [decimal](18, 2) NULL,
	[SMainApproveType4_13] [decimal](18, 2) NULL,
	[SMonthType4_14] [decimal](18, 2) NULL,
	[SMainApproveType4_14] [decimal](18, 2) NULL,
	[SMonthType4_15] [decimal](18, 2) NULL,
	[SMainApproveType4_15] [decimal](18, 2) NULL,
	[SMonthType4_16] [decimal](18, 2) NULL,
	[SMainApproveType4_16] [decimal](18, 2) NULL,
	[SMonthType4_17] [decimal](18, 2) NULL,
	[SMainApproveType4_17] [decimal](18, 2) NULL,
	[SMonthType4_18] [decimal](18, 2) NULL,
	[SMainApproveType4_18] [decimal](18, 2) NULL,
	[SMonthType4_19] [decimal](18, 2) NULL,
	[SMainApproveType4_19] [decimal](18, 2) NULL,
	[SMonthType4_20] [decimal](18, 2) NULL,
	[SMainApproveType4_20] [decimal](18, 2) NULL,
	[SMonthType4_21] [decimal](18, 2) NULL,
	[SMainApproveType4_21] [decimal](18, 2) NULL,
	[SMonthType4_22] [decimal](18, 2) NULL,
	[SMainApproveType4_22] [decimal](18, 2) NULL,
	[SMonthType4_23] [decimal](18, 2) NULL,
	[SMainApproveType4_23] [decimal](18, 2) NULL,
	[SMonthType4_24] [decimal](18, 2) NULL,
	[SMainApproveType4_24] [decimal](18, 2) NULL,
	[SMonthType4_25] [decimal](18, 2) NULL,
	[SMainApproveType4_25] [decimal](18, 2) NULL,
	[SMonthType4_26] [decimal](18, 2) NULL,
	[SMainApproveType4_26] [decimal](18, 2) NULL,
	[SMonthType4_27] [decimal](18, 2) NULL,
	[SMainApproveType4_27] [decimal](18, 2) NULL,
	[SMonthType4_28] [decimal](18, 2) NULL,
	[SMainApproveType4_28] [decimal](18, 2) NULL,
	[SMonthType4_29] [decimal](18, 2) NULL,
	[SMainApproveType4_29] [decimal](18, 2) NULL,
	[SMonthType4_30] [decimal](18, 2) NULL,
	[SMainApproveType4_30] [decimal](18, 2) NULL,
	[SMonthType4_31] [decimal](18, 2) NULL,
	[SMainApproveType4_31] [decimal](18, 2) NULL,
	[SMonthType4_32] [decimal](18, 2) NULL,
	[SMainApproveType4_32] [decimal](18, 2) NULL,
	[SMonthType4_33] [decimal](18, 2) NULL,
	[SMainApproveType4_33] [decimal](18, 2) NULL,
	[SMonthType4_34] [decimal](18, 2) NULL,
	[SMainApproveType4_34] [decimal](18, 2) NULL,
	[SMonthType4_35] [decimal](18, 2) NULL,
	[SMainApproveType4_35] [decimal](18, 2) NULL,
	[SMonthType4_36] [decimal](18, 2) NULL,
	[SMainApproveType4_36] [decimal](18, 2) NULL,
	[SMonthType4_37] [decimal](18, 2) NULL,
	[SMainApproveType4_37] [decimal](18, 2) NULL,
	[SMonthType4_38] [decimal](18, 2) NULL,
	[SMainApproveType4_38] [decimal](18, 2) NULL,
	[SMonthType4_39] [decimal](18, 2) NULL,
	[SMainApproveType4_39] [decimal](18, 2) NULL,
	[SMonthType4_40] [decimal](18, 2) NULL,
	[SMainApproveType4_40] [decimal](18, 2) NULL,
	[SMonthType5_1] [decimal](18, 2) NULL,
	[SMainApproveType5_1] [decimal](18, 2) NULL,
	[SMonthType5_2] [decimal](18, 2) NULL,
	[SMainApproveType5_2] [decimal](18, 2) NULL,
	[SMonthType5_3] [decimal](18, 2) NULL,
	[SMainApproveType5_3] [decimal](18, 2) NULL,
	[SMonthType5_4] [decimal](18, 2) NULL,
	[SMainApproveType5_4] [decimal](18, 2) NULL,
	[SMonthType5_5] [decimal](18, 2) NULL,
	[SMainApproveType5_5] [decimal](18, 2) NULL,
	[SMonthType5_6] [decimal](18, 2) NULL,
	[SMainApproveType5_6] [decimal](18, 2) NULL,
	[SMonthType6_1] [decimal](18, 2) NULL,
	[SMainApproveType6_1] [decimal](18, 2) NULL,
	[SMonthType6_2] [decimal](18, 2) NULL,
	[SMainApproveType6_2] [decimal](18, 2) NULL,
	[SMonthType6_3] [decimal](18, 2) NULL,
	[SMainApproveType6_3] [decimal](18, 2) NULL,
	[TMonthType1_1] [decimal](18, 2) NULL,
	[TMainApproveType1_1] [decimal](18, 2) NULL,
	[TMonthType1_2] [decimal](18, 2) NULL,
	[TMainApproveType1_2] [decimal](18, 2) NULL,
	[TMonthType1_3] [decimal](18, 2) NULL,
	[TMainApproveType1_3] [decimal](18, 2) NULL,
	[TMonthType1_4] [decimal](18, 2) NULL,
	[TMainApproveType1_4] [decimal](18, 2) NULL,
	[TMonthType1_5] [decimal](18, 2) NULL,
	[TMainApproveType1_5] [decimal](18, 2) NULL,
	[TMonthType1_6] [decimal](18, 2) NULL,
	[TMainApproveType1_6] [decimal](18, 2) NULL,
	[TMonthType1_7] [decimal](18, 2) NULL,
	[TMainApproveType1_7] [decimal](18, 2) NULL,
	[TMonthType1_8] [decimal](18, 2) NULL,
	[TMainApproveType1_8] [decimal](18, 2) NULL,
	[TMonthType1_9] [decimal](18, 2) NULL,
	[TMainApproveType1_9] [decimal](18, 2) NULL,
	[TMonthType1_10] [decimal](18, 2) NULL,
	[TMainApproveType1_10] [decimal](18, 2) NULL,
	[TMonthType1_11] [decimal](18, 2) NULL,
	[TMainApproveType1_11] [decimal](18, 2) NULL,
	[TMonthType2_1] [decimal](18, 2) NULL,
	[TMainApproveType2_1] [decimal](18, 2) NULL,
	[TMonthType2_2] [decimal](18, 2) NULL,
	[TMainApproveType2_2] [decimal](18, 2) NULL,
	[TMonthType2_3] [decimal](18, 2) NULL,
	[TMainApproveType2_3] [decimal](18, 2) NULL,
	[TMonthType2_4] [decimal](18, 2) NULL,
	[TMainApproveType2_4] [decimal](18, 2) NULL,
	[TMonthType2_5] [decimal](18, 2) NULL,
	[TMainApproveType2_5] [decimal](18, 2) NULL,
	[TMonthType2_6] [decimal](18, 2) NULL,
	[TMainApproveType2_6] [decimal](18, 2) NULL,
	[TMonthType2_7] [decimal](18, 2) NULL,
	[TMainApproveType2_7] [decimal](18, 2) NULL,
	[TMonthType2_8] [decimal](18, 2) NULL,
	[TMainApproveType2_8] [decimal](18, 2) NULL,
	[TMonthType2_9] [decimal](18, 2) NULL,
	[TMainApproveType2_9] [decimal](18, 2) NULL,
	[State] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_CostGoods_PayRegistration] PRIMARY KEY CLUSTERED 
(
	[PayRegistrationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[CostGoods_PayRegistration]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_PayRegistration_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[CostGoods_PayRegistration] CHECK CONSTRAINT [FK_CostGoods_PayRegistration_Base_Project]
GO

ALTER TABLE [dbo].[CostGoods_PayRegistration]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_PayRegistration_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[CostGoods_PayRegistration] CHECK CONSTRAINT [FK_CostGoods_PayRegistration_Base_Unit]
GO

ALTER TABLE [dbo].[CostGoods_PayRegistration]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_PayRegistration_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[CostGoods_PayRegistration] CHECK CONSTRAINT [FK_CostGoods_PayRegistration_Sys_User]
GO


