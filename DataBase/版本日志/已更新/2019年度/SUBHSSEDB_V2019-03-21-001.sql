--��λ��Ϣ����������Դ
ALTER TABLE Base_Unit ADD DataSources NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Դ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_Unit', @level2type=N'COLUMN',@level2name=N'DataSources'
GO
--�û���Ϣ����������Դ
ALTER TABLE Sys_User ADD DataSources NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Դ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'DataSources'
GO