ALTER TABLE Training_TestPlan ADD CandidatesNum INT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ӧ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'CandidatesNum'
GO
ALTER TABLE Training_TestPlan ADD SelectedNum INT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ѡ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Training_TestPlan', @level2type=N'COLUMN',@level2name=N'SelectedNum'
GO