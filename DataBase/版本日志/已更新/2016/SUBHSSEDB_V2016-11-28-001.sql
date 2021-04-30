ALTER TABLE [dbo].[Manager_TrainSort] DROP CONSTRAINT [FK_Manager_TrainSort_Base_TrainType]
GO
ALTER TABLE Manager_TrainSort DROP COLUMN TrainTypeId
GO
ALTER TABLE Manager_TrainSort ADD TrainTypeName NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'≈‡—µ¿‡–Õ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_TrainSort', @level2type=N'COLUMN',@level2name=N'TrainTypeName'
GO