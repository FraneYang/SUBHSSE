
CREATE TABLE [dbo].[TC_CostStatistic](
	[CostStatisticCode] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Months] [datetime] NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_TC_CostStatistic] PRIMARY KEY CLUSTERED 
(
	[CostStatisticCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TC_CostStatistic', @level2type=N'COLUMN',@level2name=N'CostStatisticCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TC_CostStatistic', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月份' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TC_CostStatistic', @level2type=N'COLUMN',@level2name=N'Months'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TC_CostStatistic', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TC_CostStatistic', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'费用汇总表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TC_CostStatistic'
GO

ALTER TABLE [dbo].[TC_CostStatistic]  WITH CHECK ADD  CONSTRAINT [FK_TC_CostStatistic_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[TC_CostStatistic] CHECK CONSTRAINT [FK_TC_CostStatistic_Base_Project]
GO

ALTER TABLE [dbo].[TC_CostStatistic]  WITH CHECK ADD  CONSTRAINT [FK_TC_CostStatistic_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[TC_CostStatistic] CHECK CONSTRAINT [FK_TC_CostStatistic_Sys_User]
GO



CREATE TABLE [dbo].[TC_CostStatisticDetail](
	[CostStatisticDetailId] [nvarchar](50) NOT NULL,
	[CostStatisticCode] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[A1] [money] NULL,
	[YA1] [money] NULL,
	[PA1] [money] NULL,
	[A2] [money] NULL,
	[YA2] [money] NULL,
	[PA2] [money] NULL,
	[A3] [money] NULL,
	[YA3] [money] NULL,
	[PA3] [money] NULL,
	[A4] [money] NULL,
	[YA4] [money] NULL,
	[PA4] [money] NULL,
	[A5] [money] NULL,
	[YA5] [money] NULL,
	[PA5] [money] NULL,
	[A6] [money] NULL,
	[YA6] [money] NULL,
	[PA6] [money] NULL,
	[A] [money] NULL,
	[YA] [money] NULL,
	[PA] [money] NULL,
	[B1] [money] NULL,
	[YB1] [money] NULL,
	[PB1] [money] NULL,
	[B2] [money] NULL,
	[YB2] [money] NULL,
	[PB2] [money] NULL,
	[B3] [money] NULL,
	[YB3] [money] NULL,
	[PB3] [money] NULL,
	[B] [money] NULL,
	[YB] [money] NULL,
	[PB] [money] NULL,
	[AB] [money] NULL,
	[YAB] [money] NULL,
	[PAB] [money] NULL,
 CONSTRAINT [PK_TC_CostStatisticDetail] PRIMARY KEY CLUSTERED 
(
	[CostStatisticDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TC_CostStatisticDetail', @level2type=N'COLUMN',@level2name=N'CostStatisticDetailId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'外键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TC_CostStatisticDetail', @level2type=N'COLUMN',@level2name=N'CostStatisticCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TC_CostStatisticDetail', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'费用汇总明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TC_CostStatisticDetail'
GO


CREATE PROCEDURE [dbo].[SpGetNewNumber]
 @tableName varchar(100),/*表名*/
 @columnName varchar(100),/*列名*/
 @projectId  varchar(50),
 @prefix varchar(25),/*流水号编码前缀*/
 @returnVal nvarchar(30) output
AS
/*获取各模块的流水号*/
declare 
        @sql nvarchar(500),
        @old nvarchar(50),
        @newid varchar(50),
        @maxId nvarchar(30)/*已分配的最大值*/
select @sql=N'SELECT @maxId=MAX('+@columnName+') from '+@tableName+' where ProjectId = '''+@projectId+''' and  ' + @columnName+' like ' + '''%' + @prefix + '%'''
EXEC sp_executesql @sql, N'@maxId nvarchar(30) OUTPUT', @maxId OUTPUT 
set @old=@maxId

IF(@old is null)
BEGIN
set @newid=@prefix+'00001'
END

ELSE
BEGIN
set @newid = (select max(right(@old,5)))+1
set @newid = @prefix +right('00000'+@newid,5)
END

SET @returnVal=@newid

GO



