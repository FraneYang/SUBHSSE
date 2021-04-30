ALTER VIEW [dbo].[View_ActionPlan_ManagerRule]
AS
/*项目管理规定视图*/
SELECT
	ManagerRule.ManagerRuleId,
	ManagerRule.ManageRuleCode,
	ManagerRule.ProjectId,
	LawManagerRule.ManageRuleCode AS OldManageRuleCode,
	ManagerRule.ManageRuleName,	
	ManagerRule.ManageRuleTypeId,
	ManagerRule.VersionNo,
	ManagerRule.CompileMan,
	ManagerRule.CompileDate,
	ManagerRule.AttachUrl,
	ManagerRule.IsIssue,
	ManagerRule.IssueDate,
	(CASE WHEN LEN(ManagerRule.Remark) > 25 THEN LEFT(ManagerRule.Remark,25)+'...' ELSE ManagerRule.Remark END) AS ShortRemark,
	ManagerRule.Remark,
	ManagerRule.State,
	ManageRuleType.ManageRuleTypeCode AS ManageRuleTypeCode,
	ManageRuleType.ManageRuleTypeName AS ManageRuleTypeName,
	Substring(ManagerRule.AttachUrl,charindex('~',ManagerRule.AttachUrl)+1,LEN(ManagerRule.AttachUrl)) AS  AttachUrlName
FROM dbo.ActionPlan_ManagerRule AS ManagerRule
LEFT JOIN dbo.Law_ManageRule AS LawManagerRule on LawManagerRule.ManageRuleId=ManagerRule.OldManageRuleId
LEFT JOIN dbo.Base_ManageRuleType AS ManageRuleType ON ManageRuleType.ManageRuleTypeId=ManagerRule.ManageRuleTypeId


GO

CREATE VIEW View_DayRportView
AS
/*********人工时日报视图************/
SELECT DayReportUnitDetail.DayReportUnitDetailId, 
	DayReportUnitDetail.DayReportDetailId, 
	DayReportUnitDetail.PostId, 
	DayReportUnitDetail.CheckPersonNum, 
	DayReportUnitDetail.RealPersonNum, 
	DayReportUnitDetail.PersonWorkTime,
	WorkPost.WorkPostName,
	DayReportDetail.UnitId,
	DayReportDetail.WorkTime,
	DayReportDetail.StaffData,
	DayReportDetail.DayNum,
	DayReportDetail.YearPersonWorkTime,	
	Unit.UnitName,
	DayReport.DayReportId,
	DayReport.ProjectId,
	DayReport.CompileMan,
	DayReport.CompileDate,
	DayReport.TotalPersonWorkTime,
	DayReport.States
FROM dbo.SitePerson_DayReportUnitDetail	AS DayReportUnitDetail
LEFT JOIN dbo.SitePerson_DayReportDetail AS DayReportDetail	ON DayReportDetail.DayReportDetailId = DayReportUnitDetail.DayReportDetailId
LEFT JOIN dbo.SitePerson_DayReport AS DayReport	ON DayReport.DayReportId = DayReportDetail.DayReportId
LEFT JOIN dbo.Base_WorkPost AS WorkPost ON WorkPost.WorkPostId = DayReportUnitDetail.PostId
LEFT JOIN dbo.Base_Unit AS Unit ON Unit.UnitId = DayReportDetail.Unitid
GO

INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4586AA27-71BD-4126-8320-B9C0DFF8BDD5','8F15D3BE-BE21-4A6F-AD5C-2BBECEE46149','提交',5)  
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('47D1E28F-5214-49D7-9979-63A7912B14A8','8F15D3BE-BE21-4A6F-AD5C-2BBECEE46149','导入',6)  

INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('147A736D-93C0-47A7-A6E3-D17A4AFB213E','6C97E014-AF13-46E5-ADB2-03D327C560EC','提交',5)  
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('A3668913-5105-4DF3-9509-588E87BD1E74','6C97E014-AF13-46E5-ADB2-03D327C560EC','导入',6)  

alter table dbo.CostGoods_Expense drop constraint FK_CostGoods_ExpenseId_Sys_User
alter table dbo.CostGoods_Expense drop column CompileMan
GO
alter table dbo.CostGoods_Expense add Months datetime null
alter table dbo.CostGoods_Expense add ReportDate datetime null
alter table dbo.CostGoods_Expense add PlanCostA money null
alter table dbo.CostGoods_Expense add PlanCostB money null
alter table dbo.CostGoods_Expense add CompileMan nvarchar(20) null
alter table dbo.CostGoods_Expense add CompileDate datetime null
alter table dbo.CostGoods_Expense add CheckMan nvarchar(20) null
alter table dbo.CostGoods_Expense add CheckDate datetime null
alter table dbo.CostGoods_Expense add ApproveMan nvarchar(20) null
alter table dbo.CostGoods_Expense add ApproveDate datetime null
GO
alter table dbo.CostGoods_CostSmallDetail drop constraint FK_CostGoods_CostSmallDetail_Sys_User
GO
alter table dbo.CostGoods_CostSmallDetail add Months datetime null
alter table dbo.CostGoods_CostSmallDetail add ReportDate datetime null
alter table dbo.CostGoods_CostSmallDetail add CheckMan nvarchar(20) null
alter table dbo.CostGoods_CostSmallDetail add CheckDate datetime null
alter table dbo.CostGoods_CostSmallDetail add ApproveMan nvarchar(20) null
alter table dbo.CostGoods_CostSmallDetail add ApproveDate datetime null
GO
alter table dbo.CostGoods_CostSmallDetailItem drop column ProjectName
alter table dbo.CostGoods_CostSmallDetailItem drop column CostDetail
alter table dbo.CostGoods_CostSmallDetailItem drop column Accumulative
GO
alter table dbo.CostGoods_CostSmallDetailItem add CostMoney money null
alter table dbo.CostGoods_CostSmallDetailItem add CostDef nvarchar(100) null
GO

CREATE TABLE [dbo].[CostGoods_ExpenseDetail](
	[ExpenseDetailId] [nvarchar](50) NOT NULL,
	[ExpenseId] [nvarchar](50) NULL,
	[CostType] [nvarchar](50) NULL,
	[CostMoney] [money] NULL,
	[CostDef] [nvarchar](100) NULL,
 CONSTRAINT [PK_CostGoods_ExpenseDetail] PRIMARY KEY CLUSTERED 
(
	[ExpenseDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'费用计划明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_ExpenseDetail'
GO

ALTER TABLE [dbo].[CostGoods_ExpenseDetail]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_ExpenseDetail_CostGoods_Expense] FOREIGN KEY([ExpenseId])
REFERENCES [dbo].[CostGoods_Expense] ([ExpenseId])
GO

ALTER TABLE [dbo].[CostGoods_ExpenseDetail] CHECK CONSTRAINT [FK_CostGoods_ExpenseDetail_CostGoods_Expense]
GO

ALTER VIEW [dbo].[View_SitePerson_Person]
AS
SELECT Person.PersonId,
	Person.CardNo,
	Person.PersonName,
	(Case Person.Sex WHEN '1' THEN '男' WHEN '2' THEN '女' ELSE '' END) AS Sex, 
	Person.IdentityCard, 
	Person.Address, 
	Person.ProjectId, 
	Person.UnitId, 
	Person.TeamGroupId, 
	Person.WorkAreaId, 
	Person.WorkPostId, 
	Person.CertificateId, 
	Person.CertificateCode, 
	Person.CertificateLimitTime, 
	Person.InTime, 
	Person.OutTime, 
	Person.OutResult, 
	Person.Telephone, 
	Person.PositionId, 
	Person.PostTitleId, 
	Person.PhotoUrl, 
	(CASE Person.IsUsed WHEN 'TRUE' THEN '是' ELSE '否' END) AS IsUsed, 
	(CASE Person.IsCardUsed WHEN 'TRUE' THEN '是' ELSE '否' END) AS IsCardUsed, 
	Person.PersonIndex,
	Project.ProjectCode,
	Project.ProjectName,
	Unit.UnitCode,
	Unit.UnitName,
	TeamGroup.TeamGroupName,
	WorkArea.WorkAreaCode,
	WorkArea.WorkAreaName,
	Post.WorkPostName,
	Certificat.CertificateName,
	Position.PositionName,
	Title.PostTitleName,
	Person.SendCardNo
FROM SitePerson_Person AS Person
LEFT JOIN Base_Project AS Project ON Project.ProjectId=Person.ProjectId
LEFT JOIN Base_Unit AS Unit ON Unit.UnitId = Person.UnitId
LEFT JOIN ProjectData_TeamGroup AS TeamGroup ON TeamGroup.TeamGroupId=Person.TeamGroupId
LEFT JOIN ProjectData_WorkArea AS WorkArea ON WorkArea.WorkAreaId = Person.WorkAreaId
LEFT JOIN Base_WorkPost AS Post ON Post.WorkPostId = Person.WorkPostId
LEFT JOIN Base_Certificate AS Certificat ON Certificat.CertificateId=Person.CertificateId
LEFT JOIN Base_Position AS Position ON Position.PositionId = Person.PositionId
Left JOIN Base_PostTitle AS Title ON Title.PostTitleId = Person.PostTitleId
GO

ALTER VIEW [dbo].[HSSE_View_SendCard]
AS
SELECT person.PersonId
	,person.CardNo
	,person.PersonName
	,person.IdentityCard
	,unit.UnitName,person.UnitId
	,post.WorkPostName
	,work.WorkAreaName
	,person.ProjectId
	,person.SendCardNo
FROM dbo.SitePerson_Person person
LEFT JOIN dbo.Base_Unit unit ON unit.UnitId=person.UnitId
LEFT JOIN dbo.Base_WorkPost post ON post.WorkPostId=person.WorkPostId
LEFT JOIN dbo.ProjectData_WorkArea work ON work.WorkAreaId=person.WorkAreaId 
where SendCardNo is null 
GO

/*******人工时月报*******/
CREATE VIEW View_MonthReportView
AS
SELECT MonthReportUnitDetail.MonthReportUnitDetailId, 
MonthReportUnitDetail.MonthReportDetailId, 
MonthReportUnitDetail.PostId, 
MonthReportUnitDetail.CheckPersonNum, 
MonthReportUnitDetail.RealPersonNum, 
MonthReportUnitDetail.PersonWorkTime, 
MonthReportUnitDetail.Remark,
WorkPost.WorkPostName,
MonthReportDetail.UnitId,
MonthReportDetail.WorkTime,
MonthReportDetail.TotalPersonWorkTime,
MonthReportDetail.StaffData,
MonthReportDetail.DayNum,
MonthReportDetail.YearPersonWorkTime,
Unit.UnitName,
MonthReport.MonthReportId,
MonthReport.ProjectId,
MonthReport.CompileMan,
MonthReport.CompileDate,	 
MonthReport.States
FROM dbo.SitePerson_MonthReportUnitDetail AS MonthReportUnitDetail
LEFT JOIN dbo.SitePerson_MonthReportDetail AS MonthReportDetail ON MonthReportDetail.MonthReportDetailId = MonthReportUnitDetail.MonthReportDetailId
LEFT JOIN dbo.SitePerson_MonthReport AS MonthReport ON MonthReport.MonthReportId = MonthReportDetail.MonthReportDetailId
LEFT JOIN dbo.Base_WorkPost AS WorkPost ON WorkPost.WorkPostId = MonthReportUnitDetail.PostId
LEFT JOIN dbo.Base_Unit AS Unit ON Unit.UnitId = MonthReportDetail.UnitId
GO