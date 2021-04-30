--法律法规类型
INSERT INTO dbo.Base_LawsRegulationsType(Id,Code,Name)
VALUES('E0E8D643-24B7-470A-9AB3-9E1B2B6300B1','003','宪法')
GO
INSERT INTO dbo.Base_LawsRegulationsType(Id,Code,Name)
VALUES('9D1F727C-1255-4A0B-998E-CE9C20638463','004','法律')
GO
INSERT INTO dbo.Base_LawsRegulationsType(Id,Code,Name)
VALUES('C73CB6BE-71F5-42B8-9048-FFDAF8FA848F','005','行政法规')
GO
INSERT INTO dbo.Base_LawsRegulationsType(Id,Code,Name)
VALUES('33E86C43-7B81-4600-A166-5B16F9BC6819','006','规章')
GO
INSERT INTO dbo.Base_LawsRegulationsType(Id,Code,Name)
VALUES('730AB1FA-42F8-4575-A2B2-EDB8E236394A','007','自治/单行条例')
GO
INSERT INTO dbo.Base_LawsRegulationsType(Id,Code,Name)
VALUES('810E5737-C579-4CB7-9435-60369765CAF7','008','经济特区法规')
GO


CREATE TABLE [dbo].[Law_LawRegulationIdentify](
	[LawRegulationIdentifyId] [nvarchar](50) NOT NULL,
	[LawRegulationIdentifyCode] [nvarchar](50) NOT NULL,
	[VersionNumber] [nvarchar](10) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[IdentifyPerson] [nvarchar](50) NULL,
	[IdentifyDate] [datetime] NULL,
	[ManagerContent] [ntext] NULL,
	[IdentifyConclude] [ntext] NULL,
	[States] [nchar](1) NULL,
	[GroupMember] [nvarchar](150) NULL,
	[Remark] [nvarchar](150) NULL,
 CONSTRAINT [PK_Law_LawRegulationIdentify_1] PRIMARY KEY CLUSTERED 
(
	[LawRegulationIdentifyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Law_LawRegulationIdentify', @level2type=N'COLUMN',@level2name=N'LawRegulationIdentifyId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Law_LawRegulationIdentify', @level2type=N'COLUMN',@level2name=N'LawRegulationIdentifyCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Law_LawRegulationIdentify', @level2type=N'COLUMN',@level2name=N'VersionNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Law_LawRegulationIdentify', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'辨识人(HSSE工程师)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Law_LawRegulationIdentify', @level2type=N'COLUMN',@level2name=N'IdentifyPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'辨识日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Law_LawRegulationIdentify', @level2type=N'COLUMN',@level2name=N'IdentifyDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE管理（业务）活动' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Law_LawRegulationIdentify', @level2type=N'COLUMN',@level2name=N'ManagerContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评审结论' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Law_LawRegulationIdentify', @level2type=N'COLUMN',@level2name=N'IdentifyConclude'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审批状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Law_LawRegulationIdentify', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价小组成员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Law_LawRegulationIdentify', @level2type=N'COLUMN',@level2name=N'GroupMember'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Law_LawRegulationIdentify', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'法律法规辨识记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Law_LawRegulationIdentify'
GO

ALTER TABLE [dbo].[Law_LawRegulationIdentify]  WITH CHECK ADD  CONSTRAINT [FK_Law_LawRegulationIdentify_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Law_LawRegulationIdentify] CHECK CONSTRAINT [FK_Law_LawRegulationIdentify_Base_Project]
GO

CREATE TABLE [dbo].[Law_LawRegulationSelectedItem](
	[LawRegulationSelectedItemId] [nvarchar](50) NOT NULL,
	[LawRegulationIdentifyId] [nvarchar](50) NULL,
	[LawRegulationGrade] [nvarchar](50) NULL,
	[FitPerfomance] [nvarchar](100) NULL,
	[LawRegulationId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Law_LawRegulationSelectedItem] PRIMARY KEY CLUSTERED 
(
	[LawRegulationSelectedItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'法律法规辨识编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Law_LawRegulationSelectedItem', @level2type=N'COLUMN',@level2name=N'LawRegulationIdentifyId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'法律法规级别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Law_LawRegulationSelectedItem', @level2type=N'COLUMN',@level2name=N'LawRegulationGrade'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'符合性评审' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Law_LawRegulationSelectedItem', @level2type=N'COLUMN',@level2name=N'FitPerfomance'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'法律法规辨识选择项表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Law_LawRegulationSelectedItem'
GO

ALTER TABLE [dbo].[Law_LawRegulationSelectedItem]  WITH CHECK ADD  CONSTRAINT [FK_Law_LawRegulationSelectedItem_Law_LawRegulationIdentify] FOREIGN KEY([LawRegulationIdentifyId])
REFERENCES [dbo].[Law_LawRegulationIdentify] ([LawRegulationIdentifyId])
GO

ALTER TABLE [dbo].[Law_LawRegulationSelectedItem] CHECK CONSTRAINT [FK_Law_LawRegulationSelectedItem_Law_LawRegulationIdentify]
GO

ALTER TABLE [dbo].[Law_LawRegulationSelectedItem]  WITH CHECK ADD  CONSTRAINT [FK_Law_LawRegulationSelectedItem_Law_LawRegulationList] FOREIGN KEY([LawRegulationId])
REFERENCES [dbo].[Law_LawRegulationList] ([LawRegulationId])
GO

ALTER TABLE [dbo].[Law_LawRegulationSelectedItem] CHECK CONSTRAINT [FK_Law_LawRegulationSelectedItem_Law_LawRegulationList]
GO


CREATE VIEW [dbo].[View_Law_LawRegulationSelectedItem]
/*法律法规辨识选择项列表视图*/
AS
SELECT ls.LawRegulationSelectedItemId,
    ls.LawRegulationIdentifyId,
    ls.LawRegulationId,
    l.LawRegulationCode,
	l.LawsRegulationsTypeId,
    ls.FitPerfomance,
	l.LawRegulationName,
	l.ApprovalDate,
	l.EffectiveDate,
	l.[Description],
	lt.Name as LawsRegulationsTypeName,
	(CASE WHEN LEN(l.[Description]) > 45 THEN LEFT(l.[Description],45) + '...' ELSE l.[Description] END) AS ShortDescription
FROM dbo.Law_LawRegulationSelectedItem AS ls
LEFT JOIN dbo.Law_LawRegulationList AS l ON  ls.LawRegulationId =l.LawRegulationId
LEFT JOIN dbo.Base_LawsRegulationsType AS lt ON  lt.Id =ls.LawRegulationGrade
GO



INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('919A66A8-31F1-4A0E-BC6A-43D3C298748F','1','地基处理',1,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('20E8B2C4-4558-4D43-BAF9-8491FD084E31','2','打桩',2,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('8BF8B210-0A4D-42DB-99D1-AB048096101D','3','基坑支护与降水工程',3,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('F522C5C5-5CF3-496D-8525-D9EB47824359','4','土方开挖工程',4,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('71DA9BF5-8361-4779-A4CB-5FF0D6953FCD','5','模板工程',5,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('19423BF8-5DD8-4D1E-8B00-E7609C7294D3','6','基础施工',6,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('65084AC5-4DF1-4C00-8B52-A3D3BA86A805','7','钢筋混凝土结构',7,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('D299251C-DF2C-470F-A312-6ED86E6640CC','8','地下管道',8,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('9B045E0B-8F43-4EC6-A4A6-042301921D16','9','钢结构',9,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('FD7178A6-87DE-44E1-950A-FEAFB7876C10','10','设备安装',10,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('06CDB55E-D01C-455E-8BE0-2008791D2631','11','大型起重吊装工程',11,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4C61E43B-2FEC-4DE9-A465-359D4CE1C0E3','12','脚手架工程',12,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('A1C5C018-AB81-4A90-9E4D-0732F0369529','13','机械安装',13,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('63FE38FA-4B28-444E-9AB6-0E0079655CE5','14','管道安装',14,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('D8360FBA-C1A6-4D6B-8FF4-A52309AAB646','15','电气仪表安装',15,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('AB8ACCB5-414D-4D2F-901D-155BB677B849','16','防腐保温防火',16,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('D8B14844-9FD6-422B-B61F-45185C105E03','17','拆除',17,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('84E6BF94-5EBA-4B4B-B733-16D57AF6D4EF','18','爆破工程',18,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('577500B4-FACE-45C0-9BFA-6B63A4B72FB3','19','试压',19,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4A561C7F-932F-44B7-9B84-A7F2595B5C9C','20','吹扫',20,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('D135FDFA-7AAA-448A-9A92-7FA8CDF32431','21','试车',21,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('156689CE-E4C7-4563-BC84-4C1841C8752C','22','试车方案',22,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4ACE9E4C-8529-4DE5-A9B3-5F47543E8D95','23','无损检测',23,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('27CFC82A-A0B8-4BA8-8E52-01554E903A56','90','全部标准',24,'CNProfessional')


GO

CREATE TABLE [dbo].[InformationProject_ConstructionStandardIdentify](
	[ConstructionStandardIdentifyId] [nvarchar](50) NOT NULL,
	[ConstructionStandardIdentifyCode] [nvarchar](30) NULL,
	[VersionNumber] [nvarchar](10) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[IdentifyPerson] [nvarchar](50) NULL,
	[IdentifyDate] [datetime] NULL,
	[State] [nchar](1) NULL,
	[Remark] [nvarchar](150) NULL,
 CONSTRAINT [PK_InformationProject_ConstructionStandardIdentify] PRIMARY KEY CLUSTERED 
(
	[ConstructionStandardIdentifyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[InformationProject_ConstructionStandardIdentify]  WITH CHECK ADD  CONSTRAINT [FK_Common_ConstructionStandardIdentify_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InformationProject_ConstructionStandardIdentify] CHECK CONSTRAINT [FK_Common_ConstructionStandardIdentify_Base_Project]
GO

ALTER TABLE [dbo].[InformationProject_ConstructionStandardIdentify]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_ConstructionStandardIdentify_Sys_User] FOREIGN KEY([IdentifyPerson])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InformationProject_ConstructionStandardIdentify] CHECK CONSTRAINT [FK_InformationProject_ConstructionStandardIdentify_Sys_User]
GO

CREATE TABLE [dbo].[InformationProject_ConstructionStandardSelectedItem](
	[ConstructionStandardSelectedItemId] [nvarchar](50) NOT NULL,
	[ConstructionStandardIdentifyId] [nvarchar](50) NULL,
	[StandardId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Common_ConstructionStandardSelectItem] PRIMARY KEY CLUSTERED 
(
	[ConstructionStandardSelectedItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[InformationProject_ConstructionStandardSelectedItem]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_ConstructionStandardSelectedItem_InformationProject_ConstructionStandardIdentify] FOREIGN KEY([ConstructionStandardIdentifyId])
REFERENCES [dbo].[InformationProject_ConstructionStandardIdentify] ([ConstructionStandardIdentifyId])
GO

ALTER TABLE [dbo].[InformationProject_ConstructionStandardSelectedItem] CHECK CONSTRAINT [FK_InformationProject_ConstructionStandardSelectedItem_InformationProject_ConstructionStandardIdentify]
GO

CREATE VIEW [dbo].[View_InformationProject_ConstructionStandardIdentify]
/*标准规范辨识列表视图*/
AS
SELECT ConstructionStandardIdentify.ConstructionStandardIdentifyId,
	CodeRecords.Code AS ConstructionStandardIdentifyCode,
    ConstructionStandardIdentify.VersionNumber,
    ConstructionStandardIdentify.ProjectId,
	ConstructionStandardIdentify.IdentifyPerson,
    ConstructionStandardIdentify.IdentifyDate,
    ConstructionStandardIdentify.Remark,
    ConstructionStandardIdentify.State,
	user1.UserName as IdentifyPersonName,
	(CASE WHEN ConstructionStandardIdentify.State = '0' OR ConstructionStandardIdentify.State IS NULL THEN '待['+OperateUser.UserName+']提交' WHEN ConstructionStandardIdentify.State =  '2' THEN '审核/审批完成' ELSE '待['+OperateUser.UserName+']办理' END) AS  FlowOperateName
FROM dbo.InformationProject_ConstructionStandardIdentify AS ConstructionStandardIdentify
LEFT JOIN dbo.Sys_User AS user1 ON  ConstructionStandardIdentify.IdentifyPerson =user1.UserId
LEFT JOIN Sys_CodeRecords AS CodeRecords ON ConstructionStandardIdentify.ConstructionStandardIdentifyId=CodeRecords.DataId 
LEFT JOIN Sys_FlowOperate AS FlowOperate ON ConstructionStandardIdentify.ConstructionStandardIdentifyId=FlowOperate.DataId AND FlowOperate.IsClosed <> 1
LEFT JOIN Sys_User AS OperateUser ON FlowOperate.OperaterId=OperateUser.UserId
GO


CREATE VIEW [dbo].[View_InformationProject_ConstructionStandardSelectedItem]
/*标准规范辨识选择项列表视图*/
AS
SELECT ConstructionStandardSelectedItem.ConstructionStandardSelectedItemId,
    ConstructionStandardSelectedItem.ConstructionStandardIdentifyId,
    ConstructionStandardSelectedItem.StandardId,
	HSSEStandardsList.StandardGrade,
	HSSEStandardsList.StandardNo,
	HSSEStandardsList.StandardName,
	HSSEStandardsList.AttachUrl,
	HSSEStandardsList.IsSelected1,
	HSSEStandardsList.IsSelected2,
	HSSEStandardsList.IsSelected3,
	HSSEStandardsList.IsSelected4,
	HSSEStandardsList.IsSelected5,
	HSSEStandardsList.IsSelected6,
	HSSEStandardsList.IsSelected7,
	HSSEStandardsList.IsSelected8,
	HSSEStandardsList.IsSelected9,
	HSSEStandardsList.IsSelected10,
	HSSEStandardsList.IsSelected11,	
	HSSEStandardsList.IsSelected12,
	HSSEStandardsList.IsSelected13,
	HSSEStandardsList.IsSelected14,
	HSSEStandardsList.IsSelected15,
	HSSEStandardsList.IsSelected16,
	HSSEStandardsList.IsSelected17,
	HSSEStandardsList.IsSelected18,
	HSSEStandardsList.IsSelected19,
	HSSEStandardsList.IsSelected20,
	HSSEStandardsList.IsSelected21,
	HSSEStandardsList.IsSelected22,
	HSSEStandardsList.IsSelected23,
	HSSEStandardsList.IsSelected90
FROM dbo.InformationProject_ConstructionStandardSelectedItem AS ConstructionStandardSelectedItem
LEFT JOIN dbo.Law_HSSEStandardsList AS HSSEStandardsList ON  ConstructionStandardSelectedItem.StandardId =HSSEStandardsList.StandardId

GO