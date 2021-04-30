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

ALTER TABLE Law_LawRegulationIdentify ADD UpdateDate DATETIME NULL
GO
ALTER TABLE InformationProject_ConstructionStandardIdentify ADD UpdateDate DATETIME NULL
GO

ALTER VIEW [dbo].[View_InformationProject_ConstructionStandardIdentify]
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
	(CASE WHEN ConstructionStandardIdentify.State = '0' OR ConstructionStandardIdentify.State IS NULL THEN '待['+OperateUser.UserName+']提交' WHEN ConstructionStandardIdentify.State =  '2' THEN '审核/审批完成' ELSE '待['+OperateUser.UserName+']办理' END) AS  FlowOperateName,
	ConstructionStandardIdentify.UpdateDate
FROM dbo.InformationProject_ConstructionStandardIdentify AS ConstructionStandardIdentify
LEFT JOIN dbo.Sys_User AS user1 ON  ConstructionStandardIdentify.IdentifyPerson =user1.UserId
LEFT JOIN Sys_CodeRecords AS CodeRecords ON ConstructionStandardIdentify.ConstructionStandardIdentifyId=CodeRecords.DataId 
LEFT JOIN Sys_FlowOperate AS FlowOperate ON ConstructionStandardIdentify.ConstructionStandardIdentifyId=FlowOperate.DataId AND FlowOperate.IsClosed <> 1
LEFT JOIN Sys_User AS OperateUser ON FlowOperate.OperaterId=OperateUser.UserId

GO

UPDATE dbo.Sys_MenuProjectA SET  MenuName='安全实施计划/管理规定' WHERE MenuId='E38EE43D-C526-493F-A177-712BA9B22291'
GO
UPDATE dbo.Sys_MenuProjectA SET  MenuName='安全实施计划' WHERE MenuId='CBC47C8B-141C-446B-90D9-CE8F5AE66CE4'
GO
UPDATE dbo.Sys_MenuProjectA SET  MenuName='安全管理规定' WHERE MenuId='775EFCF4-DE5C-46E9-8EA3-B16270E2F6A6'
GO
UPDATE dbo.Sys_MenuProjectA SET  MenuName='项目安全协议清单' WHERE MenuId='874B4232-E0AD-41CD-8C66-8A7FF2D79358'
GO
UPDATE dbo.Sys_MenuProjectA SET  MenuName='作业许可管理' WHERE MenuId='473A87D2-1365-4A68-BD38-06F312F81BC2'
GO
UPDATE Sys_MenuProjectA SET SuperMenu = '5FF7BBD8-3E0A-4C90-8976-AFF5CE7E17A5',SortIndex='30',MenuName='危大工程施工方案清单',Url='Solution/LargerHazardList.aspx' WHERE MenuId= '5B3D3F7B-9B50-4927-B131-11D13D4D1C19'
GO


UPDATE dbo.Sys_MenuProjectB SET  MenuName='安全实施计划/管理规定' WHERE MenuId='E38EE43D-C526-493F-A177-712BA9B22291'
GO
UPDATE dbo.Sys_MenuProjectB SET  MenuName='安全实施计划' WHERE MenuId='CBC47C8B-141C-446B-90D9-CE8F5AE66CE4'
GO
UPDATE dbo.Sys_MenuProjectB SET  MenuName='安全管理规定' WHERE MenuId='775EFCF4-DE5C-46E9-8EA3-B16270E2F6A6'
GO
UPDATE dbo.Sys_MenuProjectB SET  MenuName='项目安全协议清单' WHERE MenuId='874B4232-E0AD-41CD-8C66-8A7FF2D79358'
GO
UPDATE dbo.Sys_MenuProjectB SET  MenuName='作业许可管理' WHERE MenuId='473A87D2-1365-4A68-BD38-06F312F81BC2'
GO
UPDATE Sys_MenuProjectB SET SuperMenu = '5FF7BBD8-3E0A-4C90-8976-AFF5CE7E17A5',SortIndex='30',MenuName='危大工程施工方案清单',Url='Solution/LargerHazardList.aspx' WHERE MenuId= '5B3D3F7B-9B50-4927-B131-11D13D4D1C19'
GO

UPDATE Sys_Menu SET MenuName='安全实施计划' WHERE MenuId='CBC47C8B-141C-446B-90D9-CE8F5AE66CE4'	
GO
UPDATE Sys_Menu SET MenuName='安全管理规定' WHERE MenuId='775EFCF4-DE5C-46E9-8EA3-B16270E2F6A6'
GO
UPDATE Sys_Menu SET MenuName = '项目安全协议清单' WHERE MenuId= '874B4232-E0AD-41CD-8C66-8A7FF2D79358'
GO
UPDATE Sys_Menu SET MenuName = '作业许可管理' WHERE MenuId= '473A87D2-1365-4A68-BD38-06F312F81BC2'
GO
UPDATE Sys_Menu SET SuperMenu = '5FF7BBD8-3E0A-4C90-8976-AFF5CE7E17A5',SortIndex='30',MenuName='危大工程施工方案清单',Url='Solution/LargerHazardList.aspx' WHERE MenuId= '5B3D3F7B-9B50-4927-B131-11D13D4D1C19'
GO

CREATE TABLE [dbo].[Environmental_EIAReport](
	[FileId] [nvarchar](50) NOT NULL,
	[FileCode] [nvarchar](50) NULL,
	[FileName] [nvarchar](200) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[AttachUrl] [nvarchar](4000) NULL,
 CONSTRAINT [PK_Environmental_EIAReport] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Environmental_EIAReport]  WITH CHECK ADD  CONSTRAINT [FK_Environmental_EIAReport_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Environmental_EIAReport] CHECK CONSTRAINT [FK_Environmental_EIAReport_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EIAReport', @level2type=N'COLUMN',@level2name=N'FileId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EIAReport', @level2type=N'COLUMN',@level2name=N'FileCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EIAReport', @level2type=N'COLUMN',@level2name=N'FileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EIAReport', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EIAReport', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EIAReport', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EIAReport', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'环评报告' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EIAReport'
GO



CREATE TABLE [dbo].[Environmental_EnvironmentalEmergencyPlan](
	[FileId] [nvarchar](50) NOT NULL,
	[FileCode] [nvarchar](50) NULL,
	[FileName] [nvarchar](200) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[AttachUrl] [nvarchar](4000) NULL,
 CONSTRAINT [PK_Environmental_EnvironmentalEmergencyPlan] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Environmental_EnvironmentalEmergencyPlan]  WITH CHECK ADD  CONSTRAINT [FK_Environmental_EnvironmentalEmergencyPlan_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Environmental_EnvironmentalEmergencyPlan] CHECK CONSTRAINT [FK_Environmental_EnvironmentalEmergencyPlan_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EnvironmentalEmergencyPlan', @level2type=N'COLUMN',@level2name=N'FileId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EnvironmentalEmergencyPlan', @level2type=N'COLUMN',@level2name=N'FileCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EnvironmentalEmergencyPlan', @level2type=N'COLUMN',@level2name=N'FileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EnvironmentalEmergencyPlan', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EnvironmentalEmergencyPlan', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EnvironmentalEmergencyPlan', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EnvironmentalEmergencyPlan', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'环境事件应急预案' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EnvironmentalEmergencyPlan'
GO


CREATE TABLE [dbo].[Environmental_EnvironmentalMonitoring](
	[FileId] [nvarchar](50) NOT NULL,
	[FileCode] [nvarchar](50) NULL,
	[FileName] [nvarchar](200) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[AttachUrl] [nvarchar](4000) NULL,
 CONSTRAINT [PK_Environmental_EnvironmentalMonitoring] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Environmental_EnvironmentalMonitoring]  WITH CHECK ADD  CONSTRAINT [FK_Environmental_EnvironmentalMonitoring_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Environmental_EnvironmentalMonitoring] CHECK CONSTRAINT [FK_Environmental_EnvironmentalMonitoring_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EnvironmentalMonitoring', @level2type=N'COLUMN',@level2name=N'FileId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EnvironmentalMonitoring', @level2type=N'COLUMN',@level2name=N'FileCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EnvironmentalMonitoring', @level2type=N'COLUMN',@level2name=N'FileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EnvironmentalMonitoring', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EnvironmentalMonitoring', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EnvironmentalMonitoring', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EnvironmentalMonitoring', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'环境监测数据' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_EnvironmentalMonitoring'
GO


CREATE TABLE [dbo].[Environmental_UnexpectedEnvironmental](
	[FileId] [nvarchar](50) NOT NULL,
	[FileCode] [nvarchar](50) NULL,
	[FileName] [nvarchar](200) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[AttachUrl] [nvarchar](4000) NULL,
 CONSTRAINT [PK_Environmental_UnexpectedEnvironmental] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Environmental_UnexpectedEnvironmental]  WITH CHECK ADD  CONSTRAINT [FK_Environmental_UnexpectedEnvironmental_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Environmental_UnexpectedEnvironmental] CHECK CONSTRAINT [FK_Environmental_UnexpectedEnvironmental_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_UnexpectedEnvironmental', @level2type=N'COLUMN',@level2name=N'FileId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_UnexpectedEnvironmental', @level2type=N'COLUMN',@level2name=N'FileCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_UnexpectedEnvironmental', @level2type=N'COLUMN',@level2name=N'FileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_UnexpectedEnvironmental', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_UnexpectedEnvironmental', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_UnexpectedEnvironmental', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_UnexpectedEnvironmental', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'突发环境事件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Environmental_UnexpectedEnvironmental'
GO


CREATE TABLE [dbo].[OccupationHealth_HazardDetection](
	[FileId] [nvarchar](50) NOT NULL,
	[FileCode] [nvarchar](50) NULL,
	[FileName] [nvarchar](200) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[AttachUrl] [nvarchar](4000) NULL,
 CONSTRAINT [PK_OccupationHealth_HazardDetection] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[OccupationHealth_HazardDetection]  WITH CHECK ADD  CONSTRAINT [FK_OccupationHealth_HazardDetection_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[OccupationHealth_HazardDetection] CHECK CONSTRAINT [FK_OccupationHealth_HazardDetection_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_HazardDetection', @level2type=N'COLUMN',@level2name=N'FileId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_HazardDetection', @level2type=N'COLUMN',@level2name=N'FileCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_HazardDetection', @level2type=N'COLUMN',@level2name=N'FileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_HazardDetection', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_HazardDetection', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_HazardDetection', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_HazardDetection', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'危害检测' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_HazardDetection'
GO


CREATE TABLE [dbo].[OccupationHealth_OccupationalDiseaseAccident](
	[FileId] [nvarchar](50) NOT NULL,
	[FileCode] [nvarchar](50) NULL,
	[FileName] [nvarchar](200) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[AttachUrl] [nvarchar](4000) NULL,
 CONSTRAINT [PK_OccupationHealth_OccupationalDiseaseAccident] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[OccupationHealth_OccupationalDiseaseAccident]  WITH CHECK ADD  CONSTRAINT [FK_OccupationHealth_OccupationalDiseaseAccident_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[OccupationHealth_OccupationalDiseaseAccident] CHECK CONSTRAINT [FK_OccupationHealth_OccupationalDiseaseAccident_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_OccupationalDiseaseAccident', @level2type=N'COLUMN',@level2name=N'FileId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_OccupationalDiseaseAccident', @level2type=N'COLUMN',@level2name=N'FileCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_OccupationalDiseaseAccident', @level2type=N'COLUMN',@level2name=N'FileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_OccupationalDiseaseAccident', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_OccupationalDiseaseAccident', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_OccupationalDiseaseAccident', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_OccupationalDiseaseAccident', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职业病事故' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_OccupationalDiseaseAccident'
GO


CREATE TABLE [dbo].[OccupationHealth_PhysicalExamination](
	[FileId] [nvarchar](50) NOT NULL,
	[FileCode] [nvarchar](50) NULL,
	[FileName] [nvarchar](200) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[AttachUrl] [nvarchar](4000) NULL,
 CONSTRAINT [PK_OccupationHealth_PhysicalExamination] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[OccupationHealth_PhysicalExamination]  WITH CHECK ADD  CONSTRAINT [FK_OccupationHealth_PhysicalExamination_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[OccupationHealth_PhysicalExamination] CHECK CONSTRAINT [FK_OccupationHealth_PhysicalExamination_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_PhysicalExamination', @level2type=N'COLUMN',@level2name=N'FileId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_PhysicalExamination', @level2type=N'COLUMN',@level2name=N'FileCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_PhysicalExamination', @level2type=N'COLUMN',@level2name=N'FileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_PhysicalExamination', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_PhysicalExamination', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_PhysicalExamination', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_PhysicalExamination', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'体检管理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OccupationHealth_PhysicalExamination'
GO


ALTER VIEW [dbo].[View_ToDoMatter]
AS
/*待办事项视图*/ 
SELECT LawRegulationId AS Id,'法律法规' AS [Type], LawRegulationName AS Name,EffectiveDate AS [Date],'~/Law/LawRegulationListAudit.aspx' AS Url,'' AS UserId 
FROM dbo.Law_LawRegulationList 
WHERE IsPass is null
UNION
SELECT StandardId,'标准规范', StandardName,CompileDate,'~/Law/HSSEStandardListAudit.aspx','' 
FROM dbo.Law_HSSEStandardsList 
WHERE IsPass is null
UNION
SELECT RulesRegulationsId,'规章制度', RulesRegulationsName,CustomDate,'~/Law/RulesRegulationsAudit.aspx','' FROM dbo.Law_RulesRegulations 
WHERE IsPass is null
UNION
SELECT ManageRuleId,'管理规定', ManageRuleName,CompileDate,'~/Law/ManageRuleAudit.aspx','' 
FROM dbo.Law_ManageRule 
WHERE IsPass is null
UNION
SELECT TrainingItemId,'培训教材', TrainingItemName,CompileDate,'~/EduTrain/TrainDBAudit.aspx','' 
FROM dbo.Training_TrainingItem 
WHERE IsPass is null
UNION
SELECT TrainTestItemId,'安全试题', TraiinTestItemName,CompileDate,'~/EduTrain/TrainTestDBAudit.aspx','' 
FROM dbo.Training_TrainTestDBItem 
WHERE IsPass is null
UNION
SELECT AccidentCaseItemId,'事故案例', AccidentName,CompileDate,'~/EduTrain/AccidentCaseAudit.aspx','' 
FROM dbo.EduTrain_AccidentCaseItem 
WHERE IsPass is null
UNION
SELECT KnowledgeItemId,'应知应会', KnowledgeItemName,CompileDate,'~/EduTrain/KnowledgeDBAudit.aspx','' 
FROM dbo.Training_KnowledgeItem 
WHERE IsPass is null
UNION
SELECT HazardId,'危险源', HazardItems,CompileDate,'~/Technique/HazardListAudit.aspx','' 
FROM dbo.Technique_HazardList 
WHERE IsPass is null
UNION
SELECT RectifyItemId,'安全隐患', HazardSourcePoint,CompileDate,'~/Technique/RectifyAudit.aspx','' 
FROM dbo.Technique_RectifyItem 
WHERE IsPass is null
UNION
SELECT HAZOPId,'HAZOP', HAZOPTitle,CompileDate,'~/Technique/HAZOPAudit.aspx','' 
FROM dbo.Technique_HAZOP 
WHERE IsPass is null
UNION
SELECT ExpertId,'安全专家', ExpertName,CompileDate,'~/Technique/ExpertAudit.aspx','' 
FROM dbo.Technique_Expert 
WHERE IsPass is null
UNION
SELECT EmergencyId,'应急预案', EmergencyName,CompileDate,'~/Technique/EmergencyAudit.aspx','' 
FROM dbo.Technique_Emergency 
WHERE IsPass is null
UNION
SELECT SpecialSchemeId,'专项方案', SpecialSchemeName,CompileDate,'~/Technique/SpecialSchemeAudit.aspx','' 
FROM dbo.Technique_SpecialScheme 
WHERE IsPass is null
UNION
SELECT UrgeReportId
,'催报信息'
,(CASE WHEN UrgeReport.ReprotType ='1' THEN (Const0008.ConstText+Const0009.ConstText) +'百万工时安全统计月报'
WHEN UrgeReport.ReprotType ='2' THEN  (Const0008.ConstText+Const0009.ConstText) + '职工伤亡事故原因分析报'
WHEN UrgeReport.ReprotType ='3' THEN (Const0008.ConstText+Const0011.ConstText)+'安全生产数据季报'
WHEN UrgeReport.ReprotType ='4' THEN (Const0008.ConstText+Const0011.ConstText)+'应急演练开展情况季报'
WHEN UrgeReport.ReprotType ='5' THEN (Const0008.ConstText+Const0010.ConstText)+ '应急演练工作计划半年报' END) AS Name 
,UrgeDate
,(CASE WHEN UrgeReport.ReprotType ='1' THEN '~/Information/MillionsMonthlyReportSave.aspx'
WHEN UrgeReport.ReprotType ='2' THEN '~/Information/AccidentCauseReportSave.aspx'
WHEN UrgeReport.ReprotType ='3' THEN '~/Information/SafetyQuarterlyReportEdit.aspx'
WHEN UrgeReport.ReprotType ='4' THEN '~/Information/DrillConductedQuarterlyReportAdd.aspx'
WHEN UrgeReport.ReprotType ='5' THEN '~/Information/DrillPlanHalfYearReportAdd.aspx' END) AS url,''
FROM dbo.Information_UrgeReport AS UrgeReport
LEFT JOIN Sys_Const AS Const0008 ON UrgeReport.YearId =Const0008.ConstValue AND Const0008.GroupId='0008'
LEFT JOIN Sys_Const AS Const0009 ON UrgeReport.MonthId =Const0009.ConstValue AND Const0009.GroupId='0009'
LEFT JOIN Sys_Const AS Const0010 ON UrgeReport.HalfYearId =Const0010.ConstValue AND Const0010.GroupId='0010'
LEFT JOIN Sys_Const AS Const0011 ON UrgeReport.QuarterId =Const0011.ConstValue AND Const0011.GroupId='0011'
WHERE (UrgeReport.IsComplete is null or UrgeReport.IsComplete =0) AND (UrgeReport.IsCancel is null or UrgeReport.IsCancel =0)
UNION
SELECT MillionsMonthlyReportId,'月报', '百万工时安全统计月报表'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0009.ConstText,'-'))+(case HandleState when '2' then '待处理' when '3' then '待处理' when '4' then '待上报' end),FillingDate,'~/Information/MillionsMonthlyReportSave.aspx?MillionsMonthlyReportId='+MillionsMonthlyReportId,HandleMan FROM dbo.Information_MillionsMonthlyReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.[Year]
LEFT JOIN Sys_Const  AS Group_0009 ON Group_0009.GroupId='0009' AND Group_0009.ConstValue =Report.[Month]
WHERE (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
UNION
SELECT AccidentCauseReportId,'月报', '职工伤亡事故原因分析报表'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0009.ConstText,'-'))+(case HandleState when '2' then '待处理' when '3' then '待处理' when '4' then '待上报' end),FillingDate,'~/Information/AccidentCauseReportSave.aspx?AccidentCauseReportId='+AccidentCauseReportId,HandleMan FROM dbo.Information_AccidentCauseReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.[Year]
LEFT JOIN Sys_Const  AS Group_0009 ON Group_0009.GroupId='0009' AND Group_0009.ConstValue =Report.[Month]
WHERE (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
UNION
SELECT SafetyQuarterlyReportId,'季报', '安全生产数据季报'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0011.ConstText,'-'))+(case HandleState when '2' then '待处理' when '3' then '待处理' when '4' then '待上报' end),FillingDate,'~/Information/SafetyQuarterlyReportEdit.aspx?SafetyQuarterlyReportId='+SafetyQuarterlyReportId,HandleMan FROM dbo.Information_SafetyQuarterlyReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.YearId
LEFT JOIN Sys_Const  AS Group_0011 ON Group_0011.GroupId='0011' AND Group_0011.ConstValue =Report.Quarters
WHERE (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
UNION
SELECT DrillConductedQuarterlyReportId,'季报', '应急演练开展情况季报表'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0011.ConstText,'-'))+(case HandleState when '2' then '待处理' when '3' then '待处理' when '4' then '待上报' end),ReportDate,'~/Information/DrillConductedQuarterlyReportAdd.aspx?DrillConductedQuarterlyReportId='+DrillConductedQuarterlyReportId,HandleMan FROM dbo.Information_DrillConductedQuarterlyReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.YearId
LEFT JOIN Sys_Const  AS Group_0011 ON Group_0011.GroupId='0011' AND Group_0011.ConstValue =Report.[Quarter]
WHERE (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'
UNION
SELECT DrillPlanHalfYearReportId,'半年报', '应急演练工作计划半年报表'+(ISNULL(Group_0008.ConstText,'-') + ISNULL(Group_0010.ConstText,'-'))+(case HandleState when '2' then '待处理' when '3' then '待处理' when '4' then '待上报' end),CompileDate,'~/Information/DrillPlanHalfYearReportAdd.aspx?DrillPlanHalfYearReportId='+DrillPlanHalfYearReportId,HandleMan FROM dbo.Information_DrillPlanHalfYearReport Report
LEFT JOIN Sys_Const  AS Group_0008 ON Group_0008.GroupId='0008' AND Group_0008.ConstValue =Report.YearId
LEFT JOIN Sys_Const  AS Group_0010 ON Group_0010.GroupId='0010' AND Group_0010.ConstValue =Report.HalfYearId
WHERE (HandleState='2' or HandleState='3' or HandleState='4') and UpState <> '3'

UNION
SELECT ReportItem.SubUnitReportItemId
,'企业安全上报'
,(ISNULL(Unit.UnitName,'')+'：'+ISNULL(Report.SubUnitReportName,'')+'，未上报要求上报时间'+ CONVERT(varchar(100), ISNULL(ReportItem.PlanReortDate,''), 23)) AS SubUnitReportName
,ReportItem.PlanReortDate
,'~/Supervise/SubUnitReport.aspx' AS Url ,''
FROM dbo.Supervise_SubUnitReportItem AS ReportItem
LEFT JOIN dbo.Supervise_SubUnitReport AS Report ON ReportItem.SubUnitReportId =Report.SubUnitReportId
LEFT JOIN dbo.Base_Unit AS Unit ON ReportItem.UnitId =Unit.UnitId
WHERE ReportItem.PlanReortDate IS NOT NULL AND (UpState <> '3' OR UpState IS NULL) 

GO

alter table dbo.OccupationHealth_HazardDetection add ProjectId nvarchar(50) null
alter table dbo.OccupationHealth_HazardDetection add States char(1) null
alter table dbo.OccupationHealth_OccupationalDiseaseAccident add ProjectId nvarchar(50) null
alter table dbo.OccupationHealth_OccupationalDiseaseAccident add States char(1) null
alter table dbo.OccupationHealth_PhysicalExamination add ProjectId nvarchar(50) null
alter table dbo.OccupationHealth_PhysicalExamination add States char(1) null
alter table dbo.Environmental_EIAReport add ProjectId nvarchar(50) null
alter table dbo.Environmental_EIAReport add States char(1) null
alter table dbo.Environmental_EnvironmentalEmergencyPlan add ProjectId nvarchar(50) null
alter table dbo.Environmental_EnvironmentalEmergencyPlan add States char(1) null
alter table dbo.Environmental_EnvironmentalMonitoring add ProjectId nvarchar(50) null
alter table dbo.Environmental_EnvironmentalMonitoring add States char(1) null
alter table dbo.Environmental_UnexpectedEnvironmental add ProjectId nvarchar(50) null
alter table dbo.Environmental_UnexpectedEnvironmental add States char(1) null
GO


CREATE TABLE [dbo].[Emergency_EmergencyList](
	[EmergencyListId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[EmergencyCode] [nvarchar](50) NULL,
	[EmergencyName] [nvarchar](500) NULL,
	[UnitId] [nvarchar](50) NULL,
	[EmergencyTypeId] [nvarchar](50) NULL,
	[VersionCode] [nvarchar](50) NULL,
	[EmergencyContents] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Emergency_EmergencyList] PRIMARY KEY CLUSTERED 
(
	[EmergencyListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Emergency_EmergencyList]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyList_Base_EmergencyType] FOREIGN KEY([EmergencyTypeId])
REFERENCES [dbo].[Base_EmergencyType] ([EmergencyTypeId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyList] CHECK CONSTRAINT [FK_Emergency_EmergencyList_Base_EmergencyType]
GO

ALTER TABLE [dbo].[Emergency_EmergencyList]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyList_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyList] CHECK CONSTRAINT [FK_Emergency_EmergencyList_Base_Project]
GO

ALTER TABLE [dbo].[Emergency_EmergencyList]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyList_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyList] CHECK CONSTRAINT [FK_Emergency_EmergencyList_Base_Unit]
GO

ALTER TABLE [dbo].[Emergency_EmergencyList]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyList_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyList] CHECK CONSTRAINT [FK_Emergency_EmergencyList_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急响应id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList', @level2type=N'COLUMN',@level2name=N'EmergencyListId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList', @level2type=N'COLUMN',@level2name=N'EmergencyCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList', @level2type=N'COLUMN',@level2name=N'EmergencyName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急响应类型id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList', @level2type=N'COLUMN',@level2name=N'EmergencyTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList', @level2type=N'COLUMN',@level2name=N'VersionCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急预案管理清单表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyList'
GO


CREATE TABLE [dbo].[Emergency_DrillRecordList](
	[DrillRecordListId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[DrillRecordCode] [nvarchar](50) NULL,
	[DrillRecordName] [nvarchar](500) NULL,
	[UnitIds] [nvarchar](4000) NULL,
	[UnitNames] [nvarchar](4000) NULL,
	[UserIds] [nvarchar](4000) NULL,
	[UserNames] [nvarchar](4000) NULL,
	[DrillRecordDate] [datetime] NULL,
	[DrillRecordContents] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Emergency_DrillRecordList] PRIMARY KEY CLUSTERED 
(
	[DrillRecordListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Emergency_DrillRecordList]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_DrillRecordList_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Emergency_DrillRecordList] CHECK CONSTRAINT [FK_Emergency_DrillRecordList_Base_Project]
GO

ALTER TABLE [dbo].[Emergency_DrillRecordList]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_DrillRecordList_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Emergency_DrillRecordList] CHECK CONSTRAINT [FK_Emergency_DrillRecordList_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急响应id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'DrillRecordListId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'DrillRecordCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'DrillRecordName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参与单位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'UnitIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参与单位名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'UnitNames'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参与人员id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'UserIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参与人员名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'UserNames'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'演练时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'DrillRecordDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急演练记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_DrillRecordList'
GO


CREATE TABLE [dbo].[Emergency_EmergencySupply](
	[FileId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[FileCode] [nvarchar](50) NULL,
	[FileName] [nvarchar](200) NULL,
	[UnitId] [nvarchar](50) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[AttachUrl] [nvarchar](4000) NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Emergency_EmergencySupply] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Emergency_EmergencySupply]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencySupply_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Emergency_EmergencySupply] CHECK CONSTRAINT [FK_Emergency_EmergencySupply_Base_Project]
GO

ALTER TABLE [dbo].[Emergency_EmergencySupply]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencySupply_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Emergency_EmergencySupply] CHECK CONSTRAINT [FK_Emergency_EmergencySupply_Base_Unit]
GO

ALTER TABLE [dbo].[Emergency_EmergencySupply]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencySupply_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Emergency_EmergencySupply] CHECK CONSTRAINT [FK_Emergency_EmergencySupply_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencySupply', @level2type=N'COLUMN',@level2name=N'FileId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencySupply', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencySupply', @level2type=N'COLUMN',@level2name=N'FileCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencySupply', @level2type=N'COLUMN',@level2name=N'FileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencySupply', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencySupply', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencySupply', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencySupply', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencySupply', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencySupply', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急物资管理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencySupply'
GO

CREATE TABLE [dbo].[Emergency_EmergencyTeamAndTrain](
	[FileId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[FileCode] [nvarchar](50) NULL,
	[FileName] [nvarchar](200) NULL,
	[UnitId] [nvarchar](50) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[AttachUrl] [nvarchar](4000) NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Emergency_EmergencyTeamAndTrain] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Emergency_EmergencyTeamAndTrain]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyTeamAndTrain_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyTeamAndTrain] CHECK CONSTRAINT [FK_Emergency_EmergencyTeamAndTrain_Base_Project]
GO

ALTER TABLE [dbo].[Emergency_EmergencyTeamAndTrain]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyTeamAndTrain_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyTeamAndTrain] CHECK CONSTRAINT [FK_Emergency_EmergencyTeamAndTrain_Base_Unit]
GO

ALTER TABLE [dbo].[Emergency_EmergencyTeamAndTrain]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyTeamAndTrain_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyTeamAndTrain] CHECK CONSTRAINT [FK_Emergency_EmergencyTeamAndTrain_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamAndTrain', @level2type=N'COLUMN',@level2name=N'FileId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamAndTrain', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamAndTrain', @level2type=N'COLUMN',@level2name=N'FileCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamAndTrain', @level2type=N'COLUMN',@level2name=N'FileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamAndTrain', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamAndTrain', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamAndTrain', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamAndTrain', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamAndTrain', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamAndTrain', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急队伍与培训' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyTeamAndTrain'
GO


CREATE TABLE [dbo].[Emergency_EmergencyResponseRecord](
	[FileId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[FileCode] [nvarchar](50) NULL,
	[FileName] [nvarchar](200) NULL,
	[UnitId] [nvarchar](50) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[AttachUrl] [nvarchar](4000) NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Emergency_EmergencyResponseRecord] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Emergency_EmergencyResponseRecord]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyResponseRecord_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyResponseRecord] CHECK CONSTRAINT [FK_Emergency_EmergencyResponseRecord_Base_Project]
GO

ALTER TABLE [dbo].[Emergency_EmergencyResponseRecord]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyResponseRecord_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyResponseRecord] CHECK CONSTRAINT [FK_Emergency_EmergencyResponseRecord_Base_Unit]
GO

ALTER TABLE [dbo].[Emergency_EmergencyResponseRecord]  WITH CHECK ADD  CONSTRAINT [FK_Emergency_EmergencyResponseRecord_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Emergency_EmergencyResponseRecord] CHECK CONSTRAINT [FK_Emergency_EmergencyResponseRecord_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyResponseRecord', @level2type=N'COLUMN',@level2name=N'FileId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyResponseRecord', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyResponseRecord', @level2type=N'COLUMN',@level2name=N'FileCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyResponseRecord', @level2type=N'COLUMN',@level2name=N'FileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyResponseRecord', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyResponseRecord', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyResponseRecord', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整理日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyResponseRecord', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyResponseRecord', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyResponseRecord', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急响应记录/评价' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Emergency_EmergencyResponseRecord'
GO

INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('E4A1B5BE-EFF4-42AC-A59C-CE1B2010F788','1','施工方案审查',1,'InvestigateType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4F8BB7DD-E94F-405D-B050-CB0B5CB74DE8','2','HSSE方案审查',2,'InvestigateType')
GO
CREATE TABLE [dbo].[Technique_ProjectSolutionTemplete](
	[TempleteId] [nvarchar](50) NOT NULL,
	[TempleteCode] [nvarchar](50) NOT NULL,
	[TempleteName] [nvarchar](50) NOT NULL,
	[TempleteType] [char](1) NULL,
	[FileContents] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_Technique_ProjectSolutionTemplete] PRIMARY KEY CLUSTERED 
(
	[TempleteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_ProjectSolutionTemplete', @level2type=N'COLUMN',@level2name=N'TempleteId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_ProjectSolutionTemplete', @level2type=N'COLUMN',@level2name=N'TempleteCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_ProjectSolutionTemplete', @level2type=N'COLUMN',@level2name=N'TempleteName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_ProjectSolutionTemplete', @level2type=N'COLUMN',@level2name=N'TempleteType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_ProjectSolutionTemplete', @level2type=N'COLUMN',@level2name=N'FileContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_ProjectSolutionTemplete', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_ProjectSolutionTemplete', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'现场施工方案模版' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Technique_ProjectSolutionTemplete'
GO

ALTER TABLE [dbo].[Technique_ProjectSolutionTemplete]  WITH CHECK ADD  CONSTRAINT [FK_Technique_ProjectSolutionTemplete_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Technique_ProjectSolutionTemplete] CHECK CONSTRAINT [FK_Technique_ProjectSolutionTemplete_Sys_User]
GO



CREATE TABLE [dbo].[Solution_SolutionTemplate](
	[SolutionTemplateId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[SolutionTemplateCode] [nvarchar](50) NULL,
	[SolutionTemplateName] [nvarchar](50) NULL,
	[SolutionTemplateType] [char](1) NULL,
	[FileContents] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_Solution_SolutionTemplate] PRIMARY KEY CLUSTERED 
(
	[SolutionTemplateId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_SolutionTemplate', @level2type=N'COLUMN',@level2name=N'SolutionTemplateId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_SolutionTemplate', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方案模板编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_SolutionTemplate', @level2type=N'COLUMN',@level2name=N'SolutionTemplateCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方案模板名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_SolutionTemplate', @level2type=N'COLUMN',@level2name=N'SolutionTemplateName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方案类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_SolutionTemplate', @level2type=N'COLUMN',@level2name=N'SolutionTemplateType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_SolutionTemplate', @level2type=N'COLUMN',@level2name=N'FileContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_SolutionTemplate', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_SolutionTemplate', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方案模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_SolutionTemplate'
GO

ALTER TABLE [dbo].[Solution_SolutionTemplate]  WITH CHECK ADD  CONSTRAINT [FK_Solution_SolutionTemplate_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Solution_SolutionTemplate] CHECK CONSTRAINT [FK_Solution_SolutionTemplate_Base_Project]
GO

ALTER TABLE [dbo].[Solution_SolutionTemplate]  WITH CHECK ADD  CONSTRAINT [FK_Solution_SolutionTemplate_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Solution_SolutionTemplate] CHECK CONSTRAINT [FK_Solution_SolutionTemplate_Sys_User]
GO


CREATE TABLE [dbo].[Solution_ConstructSolution](
	[ConstructSolutionId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[ConstructSolutionCode] [nvarchar](50) NOT NULL,
	[ConstructSolutionName] [nvarchar](150) NULL,
	[VersionNo] [nvarchar](10) NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[InvestigateType] [char](1) NOT NULL,
	[SolutinType] [char](1) NULL,
	[FileContents] [nvarchar](max) NULL,
	[Remark] [nvarchar](500) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Solution_ConstructSolution] PRIMARY KEY CLUSTERED 
(
	[ConstructSolutionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'ConstructSolutionId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方案审查编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'ConstructSolutionCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'ConstructSolutionName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'VersionNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审查类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'InvestigateType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方案类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'SolutinType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'FileContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工方案/审查' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Solution_ConstructSolution'
GO

ALTER TABLE [dbo].[Solution_ConstructSolution]  WITH CHECK ADD  CONSTRAINT [FK_Solution_ConstructSolution_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Solution_ConstructSolution] CHECK CONSTRAINT [FK_Solution_ConstructSolution_Base_Project]
GO

ALTER TABLE [dbo].[Solution_ConstructSolution]  WITH CHECK ADD  CONSTRAINT [FK_Solution_ConstructSolution_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Solution_ConstructSolution] CHECK CONSTRAINT [FK_Solution_ConstructSolution_Base_Unit]
GO

ALTER TABLE [dbo].[Solution_ConstructSolution]  WITH CHECK ADD  CONSTRAINT [FK_Solution_ConstructSolution_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Solution_ConstructSolution] CHECK CONSTRAINT [FK_Solution_ConstructSolution_Sys_User]
GO


ALTER TABLE Hazard_LargerHazard ADD Descriptions NVARCHAR(500) NULL
GO

ALTER TABLE Emergency_EmergencyList ADD AuditMan NVARCHAR(50) NULL
GO
ALTER TABLE Emergency_EmergencyList ADD ApproveMan NVARCHAR(50) NULL
GO


ALTER TABLE Solution_ConstructSolution ADD CompileManName NVARCHAR(50) NULL
GO

ALTER TABLE License_LicenseManager alter column StartDate datetime  NULL
GO
ALTER TABLE License_LicenseManager alter column EndDate datetime NULL
GO
alter table dbo.Base_Unit alter column ProjectRange nvarchar(1000) null
GO

alter table dbo.Hazard_HazardList alter column WorkStage nvarchar(2000)
alter table dbo.Hazard_HazardSelectedItem alter column WorkStage nvarchar(2000)	
alter table dbo.Technique_HazardListType alter column WorkStage nvarchar(2000)
go

delete from dbo.Check_CheckDayDetail
delete from dbo.Check_CheckSpecialDetail
delete from dbo.Check_CheckColligationDetail
GO
alter table dbo.Check_CheckDayDetail alter column CompleteStatus bit null
alter table dbo.Check_CheckSpecialDetail alter column CompleteStatus bit null
alter table dbo.Check_CheckColligationDetail alter column CompleteStatus bit null
GO



alter table dbo.License_LicenseManager alter column StartDate nvarchar(50) null
alter table dbo.License_LicenseManager alter column EndDate nvarchar(50) null
GO
alter table dbo.Check_ProjectCheckItemSet alter column CheckItemName nvarchar(200) null
go
alter table dbo.Check_ViolationPerson alter column ViolationType char(2) null
alter table dbo.Check_ViolationPerson alter column ViolationPersonCode nvarchar(50) null
alter table dbo.Check_ViolationPerson alter column UnitId nvarchar(50) null
alter table dbo.Check_ViolationPerson alter column PersonId nvarchar(50) null
GO
alter table dbo.Solution_ConstructSolution alter column InvestigateType char(1) null
alter table dbo.Solution_ConstructSolution alter column SolutinType char(2) null
GO
alter table dbo.Emergency_DrillRecordList add DrillRecordType char(1) null
alter table dbo.Emergency_DrillRecordList add JointPersonNum int null
alter table dbo.Emergency_DrillRecordList add DrillCost decimal(9,2) null
GO
alter table dbo.Technique_CheckItemSet alter column CheckItemName nvarchar(200) null
alter table dbo.Check_ProjectCheckItemSet alter column CheckItemName nvarchar(200) null
alter table dbo.Check_PunishNotice alter column UnitId nvarchar(50) null
GO
