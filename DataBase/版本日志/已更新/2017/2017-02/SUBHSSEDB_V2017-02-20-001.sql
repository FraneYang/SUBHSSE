ALTER TABLE Manager_HSSELog ADD Num11 INT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人工时数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_HSSELog', @level2type=N'COLUMN',@level2name=N'Num11'
GO
ALTER TABLE Manager_HSSELog DROP COLUMN Contents11
GO
