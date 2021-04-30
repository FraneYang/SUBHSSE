alter table dbo.Manager_MonthReportC add MainActivitiesDef nvarchar(3000) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Ŀ�ֳ���Ҫ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainActivitiesDef'
GO

alter table dbo.Manager_MonthReportC add TotalComplexEmergencyNum int null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ�ۼ���Ŀ�ۺ�Ӧ��Ԥ���ޱࣨ����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'TotalComplexEmergencyNum'
GO

alter table dbo.Manager_MonthReportC add TotalSpecialEmergencyNum int null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ�ۼ���Ŀר��Ӧ��Ԥ���ޱࣨ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'TotalSpecialEmergencyNum'
GO

alter table dbo.Manager_MonthReportC add TotalDrillRecordNum int null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ�ۼ�Ӧ�����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'TotalDrillRecordNum'
GO

alter table dbo.Manager_MonthReportC add EmergencyManagementWorkDef nvarchar(3000) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ӧ������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'EmergencyManagementWorkDef'
GO

alter table dbo.Manager_MonthReportC add MainCost1  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�廷���»����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainCost1'
GO

alter table dbo.Manager_MonthReportC add MainProjectCost1  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�廷��Ŀ�����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainProjectCost1'
GO

alter table dbo.Manager_MonthReportC add SubCost1  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ��̱��»����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubCost1'
GO

alter table dbo.Manager_MonthReportC add SubProjectCost1  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ�����Ŀ�����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubProjectCost1'
GO

alter table dbo.Manager_MonthReportC add MainCost2  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�廷���°�ȫ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainCost2'
GO

alter table dbo.Manager_MonthReportC add MainProjectCost2  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�廷��Ŀ��ȫ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainProjectCost2'
GO

alter table dbo.Manager_MonthReportC add SubCost2  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ��̱��°�ȫ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubCost2'
GO

alter table dbo.Manager_MonthReportC add SubProjectCost2  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ�����Ŀ��ȫ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubProjectCost2'
GO

alter table dbo.Manager_MonthReportC add MainCost3  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�廷����ְҵ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainCost3'
GO

alter table dbo.Manager_MonthReportC add MainProjectCost3  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�廷��Ŀְҵ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainProjectCost3'
GO

alter table dbo.Manager_MonthReportC add SubCost3  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ��̱���ְҵ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubCost3'
GO

alter table dbo.Manager_MonthReportC add SubProjectCost3  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ�����Ŀְҵ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubProjectCost3'
GO

alter table dbo.Manager_MonthReportC add MainCost4  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�廷���°�ȫ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainCost4'
GO

alter table dbo.Manager_MonthReportC add MainProjectCost4  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�廷��Ŀ��ȫ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainProjectCost4'
GO

alter table dbo.Manager_MonthReportC add SubCost4  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ��̱��°�ȫ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubCost4'
GO

alter table dbo.Manager_MonthReportC add SubProjectCost4  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ�����Ŀ��ȫ��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubProjectCost4'
GO

alter table dbo.Manager_MonthReportC add MainCost5  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�廷���»����Գ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainCost5'
GO

alter table dbo.Manager_MonthReportC add MainProjectCost5  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�廷��Ŀ�����Գ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainProjectCost5'
GO

alter table dbo.Manager_MonthReportC add SubCost5  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ��̱��»����Գ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubCost5'
GO

alter table dbo.Manager_MonthReportC add SubProjectCost5  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ�����Ŀ�����Գ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubProjectCost5'
GO

alter table dbo.Manager_MonthReportC add MainCost6  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�廷���½�����ѵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainCost6'
GO

alter table dbo.Manager_MonthReportC add MainProjectCost6  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�廷��Ŀ������ѵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainProjectCost6'
GO

alter table dbo.Manager_MonthReportC add SubCost6  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ��̱��½�����ѵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubCost6'
GO

alter table dbo.Manager_MonthReportC add SubProjectCost6  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ�����Ŀ������ѵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubProjectCost6'
GO

alter table dbo.Manager_MonthReportC add MainCost7  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�廷��������ʩ��������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainCost7'
GO

alter table dbo.Manager_MonthReportC add MainProjectCost7  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�廷��Ŀ����ʩ��������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainProjectCost7'
GO

alter table dbo.Manager_MonthReportC add SubCost7  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ��̱�������ʩ��������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubCost7'
GO

alter table dbo.Manager_MonthReportC add SubProjectCost7  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ�����Ŀ����ʩ��������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubProjectCost7'
GO

alter table dbo.Manager_MonthReportC add MainCost  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�廷���·���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainCost'
GO

alter table dbo.Manager_MonthReportC add MainProjectCost  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�廷��Ŀ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainProjectCost'
GO

alter table dbo.Manager_MonthReportC add SubCost  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ��̱��·���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubCost'
GO

alter table dbo.Manager_MonthReportC add SubProjectCost  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ְ�����Ŀ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubProjectCost'
GO

alter table dbo.Manager_MonthReportC add JianAnCost  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������·���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'JianAnCost'
GO

alter table dbo.Manager_MonthReportC add JianAnProjectCost  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Ŀ�ۼƷ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'JianAnProjectCost'
GO


update Sys_Const set ConstText='8 ���¹����ƻ�' where ID='FC2F863C-248D-424C-998D-9FC00B55C13D'
update Sys_Const set ConstText='9 ���ڵ���Ҫ���⼰�Ľ���ʩ�� ��Ҫ��Ŀ������Ŀ���ܡ���˾��ز��š�ҵ��Э���������' where ID='C11BB760-8C4D-489F-8FA3-324BD0CBEB38'
update Sys_Const set ConstText='10 ��Ŀ�ֳ�Ӱ����Ƭ' where ID='671D47D7-511A-404C-B864-3179483F3579'
GO

alter table dbo.Manager_MonthReportC add NextEmergencyResponse nvarchar(3000) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ӧ������������Ӧ������������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'NextEmergencyResponse'
GO

alter table dbo.Manager_MonthReportC add PhotoContents nvarchar(max) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀ�ֳ�Ӱ����Ƭ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'PhotoContents'
GO