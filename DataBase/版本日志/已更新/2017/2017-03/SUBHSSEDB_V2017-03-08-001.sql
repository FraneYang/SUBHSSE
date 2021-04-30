CREATE TABLE [dbo].[SitePerson_PersonInOut](
	[PersonInOutId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[PersonId] [nvarchar](50) NULL,
	[IsIn] [bit] NULL,
	[ChangeTime] [datetime] NULL,
 CONSTRAINT [PK_SitePerson_PersonInOut] PRIMARY KEY CLUSTERED 
(
	[PersonInOutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[SitePerson_PersonInOut]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_PersonInOut_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SitePerson_PersonInOut] CHECK CONSTRAINT [FK_SitePerson_PersonInOut_Base_Project]
GO

ALTER TABLE [dbo].[SitePerson_PersonInOut]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_PersonInOut_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[SitePerson_PersonInOut] CHECK CONSTRAINT [FK_SitePerson_PersonInOut_Base_Unit]
GO

ALTER TABLE [dbo].[SitePerson_PersonInOut]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_PersonInOut_SitePerson_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[SitePerson_Person] ([PersonId])
GO

ALTER TABLE [dbo].[SitePerson_PersonInOut] CHECK CONSTRAINT [FK_SitePerson_PersonInOut_SitePerson_Person]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'现场人员出入id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_PersonInOut', @level2type=N'COLUMN',@level2name=N'PersonInOutId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'true-入场；false-出场' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_PersonInOut', @level2type=N'COLUMN',@level2name=N'IsIn'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出入场时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_PersonInOut', @level2type=N'COLUMN',@level2name=N'ChangeTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'现场人员出入表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_PersonInOut'
GO


