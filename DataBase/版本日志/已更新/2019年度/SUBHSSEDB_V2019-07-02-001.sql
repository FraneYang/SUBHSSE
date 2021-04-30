alter table dbo.Manager_MonthReportC add MainActivitiesDef nvarchar(3000) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本月项目现场主要活动描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainActivitiesDef'
GO

alter table dbo.Manager_MonthReportC add TotalComplexEmergencyNum int null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目累计项目综合应急预案修编（发布）次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'TotalComplexEmergencyNum'
GO

alter table dbo.Manager_MonthReportC add TotalSpecialEmergencyNum int null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目累计项目专项应急预案修编（发布）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'TotalSpecialEmergencyNum'
GO

alter table dbo.Manager_MonthReportC add TotalDrillRecordNum int null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目累计应急演练活动次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'TotalDrillRecordNum'
GO

alter table dbo.Manager_MonthReportC add EmergencyManagementWorkDef nvarchar(3000) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急管理工作描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'EmergencyManagementWorkDef'
GO

alter table dbo.Manager_MonthReportC add MainCost1  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'五环本月基础管理费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainCost1'
GO

alter table dbo.Manager_MonthReportC add MainProjectCost1  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'五环项目基础管理费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainProjectCost1'
GO

alter table dbo.Manager_MonthReportC add SubCost1  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商本月基础管理费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubCost1'
GO

alter table dbo.Manager_MonthReportC add SubProjectCost1  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商项目基础管理费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubProjectCost1'
GO

alter table dbo.Manager_MonthReportC add MainCost2  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'五环本月安全技术费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainCost2'
GO

alter table dbo.Manager_MonthReportC add MainProjectCost2  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'五环项目安全技术费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainProjectCost2'
GO

alter table dbo.Manager_MonthReportC add SubCost2  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商本月安全技术费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubCost2'
GO

alter table dbo.Manager_MonthReportC add SubProjectCost2  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商项目安全技术费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubProjectCost2'
GO

alter table dbo.Manager_MonthReportC add MainCost3  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'五环本月职业健康费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainCost3'
GO

alter table dbo.Manager_MonthReportC add MainProjectCost3  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'五环项目职业健康费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainProjectCost3'
GO

alter table dbo.Manager_MonthReportC add SubCost3  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商本月职业健康费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubCost3'
GO

alter table dbo.Manager_MonthReportC add SubProjectCost3  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商项目职业健康费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubProjectCost3'
GO

alter table dbo.Manager_MonthReportC add MainCost4  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'五环本月安全防护费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainCost4'
GO

alter table dbo.Manager_MonthReportC add MainProjectCost4  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'五环项目安全防护费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainProjectCost4'
GO

alter table dbo.Manager_MonthReportC add SubCost4  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商本月安全防护费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubCost4'
GO

alter table dbo.Manager_MonthReportC add SubProjectCost4  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商项目安全防护费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubProjectCost4'
GO

alter table dbo.Manager_MonthReportC add MainCost5  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'五环本月化工试车费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainCost5'
GO

alter table dbo.Manager_MonthReportC add MainProjectCost5  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'五环项目化工试车费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainProjectCost5'
GO

alter table dbo.Manager_MonthReportC add SubCost5  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商本月化工试车费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubCost5'
GO

alter table dbo.Manager_MonthReportC add SubProjectCost5  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商项目化工试车费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubProjectCost5'
GO

alter table dbo.Manager_MonthReportC add MainCost6  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'五环本月教育培训费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainCost6'
GO

alter table dbo.Manager_MonthReportC add MainProjectCost6  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'五环项目教育培训费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainProjectCost6'
GO

alter table dbo.Manager_MonthReportC add SubCost6  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商本月教育培训费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubCost6'
GO

alter table dbo.Manager_MonthReportC add SubProjectCost6  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商项目教育培训费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubProjectCost6'
GO

alter table dbo.Manager_MonthReportC add MainCost7  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'五环本月文明施工环境保护费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainCost7'
GO

alter table dbo.Manager_MonthReportC add MainProjectCost7  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'五环项目文明施工环境保护费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainProjectCost7'
GO

alter table dbo.Manager_MonthReportC add SubCost7  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商本月文明施工环境保护费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubCost7'
GO

alter table dbo.Manager_MonthReportC add SubProjectCost7  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商项目文明施工环境保护费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubProjectCost7'
GO

alter table dbo.Manager_MonthReportC add MainCost  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'五环本月费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainCost'
GO

alter table dbo.Manager_MonthReportC add MainProjectCost  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'五环项目费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'MainProjectCost'
GO

alter table dbo.Manager_MonthReportC add SubCost  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商本月费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubCost'
GO

alter table dbo.Manager_MonthReportC add SubProjectCost  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商项目费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'SubProjectCost'
GO

alter table dbo.Manager_MonthReportC add JianAnCost  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建安本月费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'JianAnCost'
GO

alter table dbo.Manager_MonthReportC add JianAnProjectCost  decimal(9,2)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建安项目累计费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'JianAnProjectCost'
GO


update Sys_Const set ConstText='8 下月工作计划' where ID='FC2F863C-248D-424C-998D-9FC00B55C13D'
update Sys_Const set ConstText='9 存在的主要问题及改进措施、 需要项目经理、项目主管、公司相关部门、业主协调解决事宜' where ID='C11BB760-8C4D-489F-8FA3-324BD0CBEB38'
update Sys_Const set ConstText='10 项目现场影像照片' where ID='671D47D7-511A-404C-B864-3179483F3579'
GO

alter table dbo.Manager_MonthReportC add NextEmergencyResponse nvarchar(3000) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急管理（对下月应急管理工作进行描述）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'NextEmergencyResponse'
GO

alter table dbo.Manager_MonthReportC add PhotoContents nvarchar(max) null
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目现场影像照片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_MonthReportC', @level2type=N'COLUMN',@level2name=N'PhotoContents'
GO