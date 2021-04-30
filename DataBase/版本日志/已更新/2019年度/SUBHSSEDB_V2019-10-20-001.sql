ALTER TABLE Sys_User ADD SignatureUrl nvarchar(500) null
go
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电子签名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'SignatureUrl'
GO

ALTER VIEW [dbo].[View_Sys_User]  AS 
/*用户信息列表视图*/ 
SELECT 
	Users.UserId
      ,Users.Account
      ,Users.UserCode
      ,Users.Password
      ,Users.UserName
      ,Users.RoleId
      ,Users.UnitId
      ,Users.IsPosts
      ,Users.IsReplies
      ,Users.IsDeletePosts
      ,Users.IsPost
      ,Users.LoginProjectId
      ,Users.Sex
      ,Users.BirthDay
      ,Users.Marriage
      ,Users.Nation
      ,Users.IdentityCard
      ,ISNULL(Users.Email,'') AS Email
      ,ISNULL(Users.Telephone,'') AS Telephone
      ,Users.Education
      ,Users.Hometown
      ,Users.PositionId
      ,Users.PhotoUrl
      ,Users.Performance
      ,Users.PageSize
      ,Users.IsOffice
      ,Users.DeviceId
      ,Users.SessionString
      ,Users.RCount
      ,Users.DataSources
	,CASE WHEN  Users.IsPost=1 THEN '是' ELSE '否' END AS IsPostName		
	,CASE WHEN  Users.IsPosts=1 THEN '是' ELSE '否' END AS IsPostsName
	,CASE WHEN  Users.IsReplies=1 THEN '是' ELSE '否' END AS IsRepliesName
	,CASE WHEN  Users.IsDeletePosts=1 THEN '是' ELSE '否' END AS IsDeletePostsName
	,Roles.RoleName
	,Roles.RoleCode
	,Roles.IsAuditFlow
	,Unit.UnitCode
	,Unit.UnitName	
	,Const13.ConstText AS RoleTypeName
	,Users.SignatureUrl
From dbo.Sys_User AS Users
LEFT JOIN Sys_Role AS Roles ON Roles.RoleId=Users.RoleId
LEFT JOIN Base_Unit AS Unit ON Unit.UnitId=Users.UnitId
LEFT JOIN Sys_Const AS Const13 ON Roles.RoleType=Const13.ConstValue AND Const13.GroupId='0013'
GO

--常量表-作业票
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('F10AD877-DD48-4D92-AD66-64210E516C64','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B','动火作业票',1,'LicenseType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('21F0402D-1A1E-4E03-915D-8914029BE957','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9','高处作业票',2,'LicenseType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('C96C6527-6078-4E50-8B31-40D731DE8CCA','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7','受限空间作业票',3,'LicenseType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('D5B893A3-9896-4246-959C-64AB8B168025','F72FF20B-D3EB-46A5-97F7-C99B2473A140','射线作业票',4,'LicenseType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('41F9D0A5-B3C7-4409-88E3-DA729D2AE1A8','4E607E83-41FC-4F49-B26F-A21CFE38328F','断路（占道）作业票',5,'LicenseType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('89BC9EA1-19E3-4DC4-84F7-4D87678B5794','755C6AC9-2E38-4D4F-AF33-33CB1744A907','动土作业票',6,'LicenseType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('AA5C7DDF-88F1-48EB-8C43-6E5903AA6A39','7BBAE649-7B00-4475-A911-BFE3A37AC55B','夜间施工作业票',7,'LicenseType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('FA801286-038C-43DE-9AA8-7B300DA4FB94','A1BE3AB6-9D4A-41E7-8870-E73423165451','吊装作业票',8,'LicenseType')
GO

--作业票安全措施模板表
CREATE TABLE [dbo].[Base_SafetyMeasures](
	[SafetyMeasuresId] [nvarchar](50) NOT NULL,
	[SortIndex] [int] NULL,
	[SafetyMeasures] [nvarchar](2000) NULL,
	[LicenseType] [nvarchar](50) NULL,
 CONSTRAINT [PK_Base_Safety measures] PRIMARY KEY CLUSTERED 
(
	[SafetyMeasuresId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_SafetyMeasures', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全措施' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_SafetyMeasures', @level2type=N'COLUMN',@level2name=N'SafetyMeasures'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'许可证类别（管理常量表Sys_Const,GroupId=''LicenseType''）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_SafetyMeasures', @level2type=N'COLUMN',@level2name=N'LicenseType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业票安全措施模板表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Base_SafetyMeasures'
GO

--动火安全措施
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('C4093497-1CC9-4300-AFBA-E9F50D8733AA',1,'电焊、气割等设备符合要求，已贴标签','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('1F941B60-A4AD-45FF-94CC-213365666DD3',2,'防护面罩、眼镜和工作服符合要求','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('76D8CB00-FF5E-4904-AB4D-4E5043EBC1CC',3,'气带、电线等符合要求','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('13E55242-75A9-496F-B519-B9CF240E91BE',4,'电焊回路线接在焊件上，地线不得穿过下水井或与其它设备搭接','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('E4AE50B2-6D0C-488E-AFB7-D723CA573072',5,'清除动火点周围易燃物或采取有效的防护措施','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('9AB8483C-F40C-4A2D-B096-63F5FF56558D',6,'气瓶直立固定并有防晒措施','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('3E55D29D-D64A-480C-87DD-C47B597C6AE1',7,'乙炔、氧气瓶间距不小于5米，与火源距离不小于10米','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('35D2A22C-7394-4AC4-80D2-A7BC4001EC67',8,'动火作业现场备灭火器（）个，其他消防器材','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('81335C1E-DF9A-44F2-96FD-40EC8B52A4CC',9,'高处作业须采取防火花飞溅措施','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('2BE8E90A-4AD3-468D-9E93-D20CB45831C9',10,'现场人员会使用灭火器','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('57FF68E3-0088-492C-98F6-03A5F7EF700C',11,'作业点已进行可燃气体检测','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('D892032B-9C28-4F8F-818E-2C2E98F3C780',12,'其它措施','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B')
GO

--作业票安全措施表
CREATE TABLE [dbo].[License_LicenseItem](
	[LicenseItemId] [nvarchar](50) NOT NULL,
	[DataId] [nvarchar](50) NULL,
	[SortIndex] [int] NULL,
	[SafetyMeasures] [nvarchar](2000) NULL,
	[IsUsed] [bit] NULL,
	[ConfirmManId] [nvarchar](50) NULL,
 CONSTRAINT [PK_License_LicenseItem] PRIMARY KEY CLUSTERED 
(
	[LicenseItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[License_LicenseItem]  WITH CHECK ADD  CONSTRAINT [FK_License_LicenseItem_Sys_User] FOREIGN KEY([ConfirmManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_LicenseItem] CHECK CONSTRAINT [FK_License_LicenseItem_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业票明细表id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseItem', @level2type=N'COLUMN',@level2name=N'LicenseItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单据ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseItem', @level2type=N'COLUMN',@level2name=N'DataId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseItem', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全措施' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseItem', @level2type=N'COLUMN',@level2name=N'SafetyMeasures'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseItem', @level2type=N'COLUMN',@level2name=N'IsUsed'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'确认人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseItem', @level2type=N'COLUMN',@level2name=N'ConfirmManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业票安全措施表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_LicenseItem'
GO

--动火作业票表
CREATE TABLE [dbo].[License_FireWork](
	[FireWorkId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[LicenseCode] [nvarchar](50) NULL,
	[ApplyUnitId] [nvarchar](50) NULL,
	[ApplyManId] [nvarchar](50) NULL,
	[ApplyDate] [datetime] NULL,
	[WorkPalce] [nvarchar](300) NULL,
	[FireWatchManId] [nvarchar](50) NULL,
	[ValidityStartTime] [datetime] NULL,
	[ValidityEndTime] [datetime] NULL,
	[WorkMeasures] [nvarchar](500) NULL,
	[CancelManId] [nvarchar](50) NULL,
	[CancelReasons] [nvarchar](200) NULL,
	[CancelTime] [datetime] NULL,
	[CloseManId] [nvarchar](50) NULL,
	[CloseReasons] [nvarchar](200) NULL,
	[CloseTime] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_License_FireWork] PRIMARY KEY CLUSTERED 
(
	[FireWorkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[License_FireWork]  WITH CHECK ADD  CONSTRAINT [FK_License_FireWork_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[License_FireWork] CHECK CONSTRAINT [FK_License_FireWork_Base_Project]
GO

ALTER TABLE [dbo].[License_FireWork]  WITH CHECK ADD  CONSTRAINT [FK_License_FireWork_Base_Unit] FOREIGN KEY([ApplyUnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[License_FireWork] CHECK CONSTRAINT [FK_License_FireWork_Base_Unit]
GO

ALTER TABLE [dbo].[License_FireWork]  WITH CHECK ADD  CONSTRAINT [FK_License_FireWork_Sys_User] FOREIGN KEY([ApplyManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_FireWork] CHECK CONSTRAINT [FK_License_FireWork_Sys_User]
GO

ALTER TABLE [dbo].[License_FireWork]  WITH CHECK ADD  CONSTRAINT [FK_License_FireWork_Sys_User1] FOREIGN KEY([FireWatchManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_FireWork] CHECK CONSTRAINT [FK_License_FireWork_Sys_User1]
GO

ALTER TABLE [dbo].[License_FireWork]  WITH CHECK ADD  CONSTRAINT [FK_License_FireWork_Sys_User2] FOREIGN KEY([CancelManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_FireWork] CHECK CONSTRAINT [FK_License_FireWork_Sys_User2]
GO

ALTER TABLE [dbo].[License_FireWork]  WITH CHECK ADD  CONSTRAINT [FK_License_FireWork_Sys_User3] FOREIGN KEY([CloseManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_FireWork] CHECK CONSTRAINT [FK_License_FireWork_Sys_User3]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'动火主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FireWork', @level2type=N'COLUMN',@level2name=N'FireWorkId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FireWork', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FireWork', @level2type=N'COLUMN',@level2name=N'LicenseCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FireWork', @level2type=N'COLUMN',@level2name=N'ApplyUnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FireWork', @level2type=N'COLUMN',@level2name=N'ApplyManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FireWork', @level2type=N'COLUMN',@level2name=N'ApplyDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业地点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FireWork', @level2type=N'COLUMN',@level2name=N'WorkPalce'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'监火人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FireWork', @level2type=N'COLUMN',@level2name=N'FireWatchManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FireWork', @level2type=N'COLUMN',@level2name=N'ValidityStartTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FireWork', @level2type=N'COLUMN',@level2name=N'ValidityEndTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业内容、机具及安全措施' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FireWork', @level2type=N'COLUMN',@level2name=N'WorkMeasures'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取消人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FireWork', @level2type=N'COLUMN',@level2name=N'CancelManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取消原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FireWork', @level2type=N'COLUMN',@level2name=N'CancelReasons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取消时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FireWork', @level2type=N'COLUMN',@level2name=N'CancelTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关闭人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FireWork', @level2type=N'COLUMN',@level2name=N'CloseManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关闭原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FireWork', @level2type=N'COLUMN',@level2name=N'CloseReasons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关闭时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FireWork', @level2type=N'COLUMN',@level2name=N'CloseTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态(0-待提交；1-审核中；2-审核完成；3-关闭；-1取消)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FireWork', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'动火作业票表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FireWork'
GO

--作业票审核表
CREATE TABLE [dbo].[License_FlowOperate](
	[FlowOperateId] [nvarchar](50) NOT NULL,
	[DataId] [nvarchar](50) NULL,
	[AuditFlowName] [nvarchar](50) NULL,
	[SortIndex] [int] NULL,
	[RoleIds] [nvarchar](2000) NULL,
	[OperaterId] [nvarchar](50) NULL,
	[OperaterTime] [datetime] NULL,
	[IsAgree] [bit] NULL,
	[Opinion] [nvarchar](1000) NULL,
	[IsClosed] [bit] NULL,
	[IsFlowEnd] [bit] NULL,
 CONSTRAINT [PK_License_FlowOperate] PRIMARY KEY CLUSTERED 
(
	[FlowOperateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[License_FlowOperate]  WITH CHECK ADD  CONSTRAINT [FK_License_FlowOperate_Sys_User] FOREIGN KEY([OperaterId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_FlowOperate] CHECK CONSTRAINT [FK_License_FlowOperate_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程操作id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FlowOperate', @level2type=N'COLUMN',@level2name=N'FlowOperateId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据记录id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FlowOperate', @level2type=N'COLUMN',@level2name=N'DataId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FlowOperate', @level2type=N'COLUMN',@level2name=N'AuditFlowName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FlowOperate', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色IDs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FlowOperate', @level2type=N'COLUMN',@level2name=N'RoleIds'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FlowOperate', @level2type=N'COLUMN',@level2name=N'OperaterId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FlowOperate', @level2type=N'COLUMN',@level2name=N'OperaterTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否同意' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FlowOperate', @level2type=N'COLUMN',@level2name=N'IsAgree'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'意见' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FlowOperate', @level2type=N'COLUMN',@level2name=N'Opinion'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否关闭' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FlowOperate', @level2type=N'COLUMN',@level2name=N'IsClosed'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程结束' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FlowOperate', @level2type=N'COLUMN',@level2name=N'IsFlowEnd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业票审核表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FlowOperate'
GO

--作业票审核明细表
CREATE TABLE [dbo].[License_FlowOperateItem](
	[FlowOperateItemId] [nvarchar](50) NOT NULL,
	[FlowOperateId] [nvarchar](50) NULL,
	[OperaterId] [nvarchar](50) NULL,
	[OperaterTime] [datetime] NULL,
	[IsAgree] [bit] NULL,
	[Opinion] [nvarchar](1000) NULL,
 CONSTRAINT [PK_License_FlowOperateItem] PRIMARY KEY CLUSTERED 
(
	[FlowOperateItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[License_FlowOperateItem]  WITH CHECK ADD  CONSTRAINT [FK_License_FlowOperateItem_License_FlowOperate] FOREIGN KEY([FlowOperateId])
REFERENCES [dbo].[License_FlowOperate] ([FlowOperateId])
GO

ALTER TABLE [dbo].[License_FlowOperateItem] CHECK CONSTRAINT [FK_License_FlowOperateItem_License_FlowOperate]
GO

ALTER TABLE [dbo].[License_FlowOperateItem]  WITH CHECK ADD  CONSTRAINT [FK_License_FlowOperateItem_Sys_User] FOREIGN KEY([OperaterId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_FlowOperateItem] CHECK CONSTRAINT [FK_License_FlowOperateItem_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业票审核明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_FlowOperateItem'
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('4BB6AC40-D4D5-439B-85CC-100E431CF3F1','安全措施','BaseInfo/SafetyMeasures.aspx','VcardEdit',300,'0','Menu_BaseInfo',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('DBE4768A-0962-44E5-A603-605A5BA88E9B','4BB6AC40-D4D5-439B-85CC-100E431CF3F1','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('DECFFC95-DC39-4BBF-9657-6F7A585F0DE4','4BB6AC40-D4D5-439B-85CC-100E431CF3F1','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('304A3AFE-0769-4D50-8F80-4C3FD94E5DB1','4BB6AC40-D4D5-439B-85CC-100E431CF3F1','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('2D84061B-11BA-4D3B-9A27-E13B934D0165','4BB6AC40-D4D5-439B-85CC-100E431CF3F1','保存',4)   
GO
