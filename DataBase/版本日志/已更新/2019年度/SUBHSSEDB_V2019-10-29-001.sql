--动火作业票
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('0c1a6c13-1cb8-45e8-a415-d93c4f2dd4c0','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B',1,'施工单位安全人员意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('211e7843-7986-4fd3-80ef-a0d01c0d1261','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B',2,'总包单位安全人员意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('ac7d5fec-6bfe-4fbe-b385-1617691fa13f','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B',3,'总包单位专业工程师意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('d8477641-40ef-485e-92b7-3c5ddce7b9ce','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B',4,'总包单位施工经理意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('10cdd8f4-2d0b-42c1-88ca-d611f7f66d2f','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B',5,'监理单位意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('d74202f4-355c-4c58-86bd-8588479a66bc','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B',6,'业主单位意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('dc0fc1b6-f9bf-4810-94fb-473e8f9721d5','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B',7,'完成',1)
GO
--PC端菜单增加
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9','高处作业票','License/HeightWork.aspx','PageHeaderFooter',60,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B3CD11DC-D359-4D60-8DB4-BD095CE52C17','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('6D9B6919-0677-4892-9C73-CDD6C124B855','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('044C6FF2-2A30-4E08-88A6-9D85722AD89C','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('7C06CD77-402A-4F8C-A41B-1C69301707E5','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9','保存',4)  
GO
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9','高处作业票','License/HeightWork.aspx','PageHeaderFooter',60,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
GO

--高处作业票
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('817F4373-5A30-4197-9793-5ACB0152E80F','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9',1,'施工单位安全人员意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('BF3A7FAD-6265-4228-ACB4-03DCA3581270','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9',2,'总包单位安全人员意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('A71C71E1-9BAB-4AF6-A0DC-BFF18299FFEA','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9',3,'总包单位专业工程师意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('6630FC39-44FB-4B50-BA0D-7DEDB628F5EE','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9',4,'总包单位施工经理意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('6203E470-7D7A-48B4-9E18-B1080E94EE4C','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9',5,'监理单位意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('8597338C-F2EF-462C-9E4D-79620DF3FF7A','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9',6,'业主单位意见',0)
GO
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('45CAC29E-986E-4FCE-BE6F-C1FE085A0AD6','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9',7,'完成',1)
GO
--高处作业表
CREATE TABLE [dbo].[License_HeightWork](
	[HeightWorkId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[LicenseCode] [nvarchar](50) NULL,
	[ApplyUnitId] [nvarchar](50) NULL,
	[ApplyManId] [nvarchar](50) NULL,
	[ApplyDate] [datetime] NULL,
	[WorkPalce] [nvarchar](300) NULL,
	[WorkType] [nvarchar](50) NULL,
	[ValidityStartTime] [datetime] NULL,
	[ValidityEndTime] [datetime] NULL,
	[WorkMeasures] [nvarchar](500) NULL,
	[EquipmentTools] [nvarchar](100) NULL,
	[CancelManId] [nvarchar](50) NULL,
	[CancelReasons] [nvarchar](200) NULL,
	[CancelTime] [datetime] NULL,
	[CloseManId] [nvarchar](50) NULL,
	[CloseReasons] [nvarchar](200) NULL,
	[CloseTime] [datetime] NULL,
	[States] [varchar](2) NULL,
	[NextManId] [nvarchar](50) NULL,
 CONSTRAINT [PK_License_HeightWork] PRIMARY KEY CLUSTERED 
(
	[HeightWorkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[License_HeightWork]  WITH CHECK ADD  CONSTRAINT [FK_License_HeightWork_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[License_HeightWork] CHECK CONSTRAINT [FK_License_HeightWork_Base_Project]
GO

ALTER TABLE [dbo].[License_HeightWork]  WITH CHECK ADD  CONSTRAINT [FK_License_HeightWork_Base_Unit] FOREIGN KEY([ApplyUnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[License_HeightWork] CHECK CONSTRAINT [FK_License_HeightWork_Base_Unit]
GO

ALTER TABLE [dbo].[License_HeightWork]  WITH CHECK ADD  CONSTRAINT [FK_License_HeightWork_Sys_User] FOREIGN KEY([ApplyManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_HeightWork] CHECK CONSTRAINT [FK_License_HeightWork_Sys_User]
GO

ALTER TABLE [dbo].[License_HeightWork]  WITH CHECK ADD  CONSTRAINT [FK_License_HeightWork_Sys_User2] FOREIGN KEY([CancelManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_HeightWork] CHECK CONSTRAINT [FK_License_HeightWork_Sys_User2]
GO

ALTER TABLE [dbo].[License_HeightWork]  WITH CHECK ADD  CONSTRAINT [FK_License_HeightWork_Sys_User3] FOREIGN KEY([CloseManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_HeightWork] CHECK CONSTRAINT [FK_License_HeightWork_Sys_User3]
GO

ALTER TABLE [dbo].[License_HeightWork]  WITH CHECK ADD  CONSTRAINT [FK_License_HeightWork_Sys_User4] FOREIGN KEY([NextManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[License_HeightWork] CHECK CONSTRAINT [FK_License_HeightWork_Sys_User4]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登高主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HeightWork', @level2type=N'COLUMN',@level2name=N'HeightWorkId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HeightWork', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HeightWork', @level2type=N'COLUMN',@level2name=N'LicenseCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HeightWork', @level2type=N'COLUMN',@level2name=N'ApplyUnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HeightWork', @level2type=N'COLUMN',@level2name=N'ApplyManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HeightWork', @level2type=N'COLUMN',@level2name=N'ApplyDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业地点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HeightWork', @level2type=N'COLUMN',@level2name=N'WorkPalce'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HeightWork', @level2type=N'COLUMN',@level2name=N'WorkType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HeightWork', @level2type=N'COLUMN',@level2name=N'ValidityStartTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HeightWork', @level2type=N'COLUMN',@level2name=N'ValidityEndTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业内容、机具及安全措施' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HeightWork', @level2type=N'COLUMN',@level2name=N'WorkMeasures'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备及工具' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HeightWork', @level2type=N'COLUMN',@level2name=N'EquipmentTools'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取消人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HeightWork', @level2type=N'COLUMN',@level2name=N'CancelManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取消原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HeightWork', @level2type=N'COLUMN',@level2name=N'CancelReasons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'取消时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HeightWork', @level2type=N'COLUMN',@level2name=N'CancelTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关闭人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HeightWork', @level2type=N'COLUMN',@level2name=N'CloseManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关闭原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HeightWork', @level2type=N'COLUMN',@level2name=N'CloseReasons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关闭时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HeightWork', @level2type=N'COLUMN',@level2name=N'CloseTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态(0-待提交；1-审核中；2-审核完成；3-关闭；-1取消)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HeightWork', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下步办理人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HeightWork', @level2type=N'COLUMN',@level2name=N'NextManId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登高作业票表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'License_HeightWork'
GO
--高处安全措施
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('917BE851-0D88-4AA1-B1FC-269FDCE2FC97',1,'高处作业人员身体状况良好，不存在高血压、心脏病、贫血病、癫痫病等不适合高处作业的病症','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('712BA2A7-A204-4BEE-849A-A815D38010A4',2,'高处作业人员着装符合要求，戴好安全帽，衣着灵便，禁止穿硬底和带钉易滑的鞋','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('0CF9DF7F-B4DB-4398-8395-86F7DAD87C60',3,'高处作业使用5点式双钩安全带','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('095C4109-A7B4-4D6B-8A68-F39CCF370AAA',4,'无垂直交叉作业，必要时采用错时、错位、硬隔离等措施','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('C73A6DCA-A961-40E4-A208-15197A7D5819',5,'有高处作业平台','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('8D508ECA-E390-40F7-82F8-A5EF23E5B1AB',6,'坠落半径范围内设警戒线、监护人','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('C596E3FC-0046-4445-B485-399B594C5D8B',7,'上下通道符合要求，直爬梯超过8m时应设置梯间平台，直爬梯应与防坠器配合使用','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('C6828187-BF96-44BB-95BA-201331D0CA24',8,'悬空作业时，有可靠的安全带系挂点，下方有安全网','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('93408E0B-6BAA-4FBF-ADA1-842CEC440719',9,'持证的架子工进行脚手架作业','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9')
GO

--受限空间作业票
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('AEC9166D-1C91-45F0-8BFE-D3D0479A28C7','受限空间作业票','License/LimitedSpace.aspx','PageHeaderFooter',70,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('904FD3D2-1520-48FB-BD8F-6BAA000653B7','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('7F372BE4-E264-48FB-ACA6-8E7EE41393EC','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('BE6D9AE8-069A-421A-8E3D-F3DDC18FCDB4','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('8CC252A0-F098-4FE3-AF21-4A7A7030DC5E','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7','保存',4)  
GO
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('AEC9166D-1C91-45F0-8BFE-D3D0479A28C7','受限空间作业票','License/LimitedSpace.aspx','PageHeaderFooter',70,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
GO
--射线作业票
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('F72FF20B-D3EB-46A5-97F7-C99B2473A140','射线作业票','License/RadialWork.aspx','PageHeaderFooter',80,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('107EA8EA-4D8D-410B-B3DE-F0C29E9C3EDC','F72FF20B-D3EB-46A5-97F7-C99B2473A140','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('89010EF9-9E77-49EB-A00D-3142B9FBC29E','F72FF20B-D3EB-46A5-97F7-C99B2473A140','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('F5EFEB84-7CCC-406D-ACFA-CA36CB6A8A1D','F72FF20B-D3EB-46A5-97F7-C99B2473A140','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('982333DA-42A2-40A3-8F3D-52BA7DE4E19D','F72FF20B-D3EB-46A5-97F7-C99B2473A140','保存',4)  
GO
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('F72FF20B-D3EB-46A5-97F7-C99B2473A140','射线作业票','License/RadialWork.aspx','PageHeaderFooter',80,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
GO
--断路(占道)作业票
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('4E607E83-41FC-4F49-B26F-A21CFE38328F','断路(占道)作业票','License/OpenCircuit.aspx','PageHeaderFooter',90,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('6D90E4CD-D932-454A-8A8B-54FA3CC22FD4','4E607E83-41FC-4F49-B26F-A21CFE38328F','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('53BF21A8-38DA-4853-A527-8D392B901554','4E607E83-41FC-4F49-B26F-A21CFE38328F','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('06F8CEAB-7AF8-40C5-B6D0-6A91AE562AD7','4E607E83-41FC-4F49-B26F-A21CFE38328F','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('C8BE46DF-2553-4A64-BE79-B69712C297A5','4E607E83-41FC-4F49-B26F-A21CFE38328F','保存',4)  
GO
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('4E607E83-41FC-4F49-B26F-A21CFE38328F','断路(占道)作业票','License/OpenCircuit.aspx','PageHeaderFooter',90,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
GO
--动土作业票
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('755C6AC9-2E38-4D4F-AF33-33CB1744A907','动土作业票','License/BreakGround.aspx','PageHeaderFooter',100,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('F3D52EF3-104F-42CF-B48A-443FCE5C800D','755C6AC9-2E38-4D4F-AF33-33CB1744A907','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('7DFD6886-0F8B-4DA1-9C4B-1847A8B286AF','755C6AC9-2E38-4D4F-AF33-33CB1744A907','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('F5F93A18-438F-4A19-982B-7E9E38EB6AE2','755C6AC9-2E38-4D4F-AF33-33CB1744A907','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('32937824-9F35-4C4E-8E13-984E784F8E9C','755C6AC9-2E38-4D4F-AF33-33CB1744A907','保存',4)  
GO
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('755C6AC9-2E38-4D4F-AF33-33CB1744A907','动土作业票','License/BreakGround.aspx','PageHeaderFooter',100,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
GO
--夜间施工作业票
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('7BBAE649-7B00-4475-A911-BFE3A37AC55B','夜间施工作业票','License/NightWork.aspx','PageHeaderFooter',110,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B040C80B-4216-4AF8-B9C9-A1303E31CFAC','7BBAE649-7B00-4475-A911-BFE3A37AC55B','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('60241503-BF4B-4159-AFA2-41186CD9329B','7BBAE649-7B00-4475-A911-BFE3A37AC55B','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('3A192DC6-2338-4038-ADAD-46FA7364E20F','7BBAE649-7B00-4475-A911-BFE3A37AC55B','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('6239BB95-33AF-4B36-97CB-787EF553D35A','7BBAE649-7B00-4475-A911-BFE3A37AC55B','保存',4)  
GO
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('7BBAE649-7B00-4475-A911-BFE3A37AC55B','夜间施工作业票','License/NightWork.aspx','PageHeaderFooter',110,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
GO
--吊装作业票
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('A1BE3AB6-9D4A-41E7-8870-E73423165451','吊装作业票','License/LiftingWork.aspx','PageHeaderFooter',120,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('BDC9E201-0C51-4C02-9151-B6DF86CE4C27','A1BE3AB6-9D4A-41E7-8870-E73423165451','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('36EBA247-3051-4213-BD95-89DC948006E1','A1BE3AB6-9D4A-41E7-8870-E73423165451','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('46A93981-2D60-49C3-877A-7B66EBCBC927','A1BE3AB6-9D4A-41E7-8870-E73423165451','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('3C5F18F7-459A-4666-B497-9400E637C975','A1BE3AB6-9D4A-41E7-8870-E73423165451','保存',4)  
GO
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('A1BE3AB6-9D4A-41E7-8870-E73423165451','吊装作业票','License/LiftingWork.aspx','PageHeaderFooter',120,'473A87D2-1365-4A68-BD38-06F312F81BC2','Menu_Project',1,0)
GO

/******审核流程***/
--受限空间作业票
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('034452AD-92AB-4956-ACF6-BE89FE01BECE','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7',1,'施工单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('A0F4DE31-59C6-4DF9-B6AB-B559BC70FCAB','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7',2,'总包单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('A41B5815-8D40-4EB7-89EC-2A5E18D8EE8A','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7',3,'总包单位专业工程师意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('B72FAA80-D647-41EB-89B7-0A4A48DC53ED','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7',4,'总包单位施工经理意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('345D81F5-7D00-4852-AC4D-11C6A7AAE749','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7',5,'监理单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('AE47F6FA-6D25-40F8-9713-F004296CD084','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7',6,'业主单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('B34C3254-91A5-45B9-8592-CBE7BCA2AF60','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7',7,'完成',1)
GO
--射线作业票
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('FD0271ED-6CAB-4FC2-8645-E530F0724A79','F72FF20B-D3EB-46A5-97F7-C99B2473A140',1,'施工单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('98448443-8BB2-4D29-B174-FF0EADD4711D','F72FF20B-D3EB-46A5-97F7-C99B2473A140',2,'总包单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('EAC9F894-0ED7-49D3-A397-88B53E5C1D74','F72FF20B-D3EB-46A5-97F7-C99B2473A140',3,'总包单位专业工程师意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('E5CE0A69-CF76-4685-A164-7F665DA26627','F72FF20B-D3EB-46A5-97F7-C99B2473A140',4,'总包单位施工经理意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('9E7AED69-34C9-4EEB-9E0B-68B22423D5E6','F72FF20B-D3EB-46A5-97F7-C99B2473A140',5,'监理单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('51DE33BA-7876-4F1D-9077-2DA68092FED3','F72FF20B-D3EB-46A5-97F7-C99B2473A140',6,'业主单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('1D75313C-8C94-416B-84CE-37A41E376A76','F72FF20B-D3EB-46A5-97F7-C99B2473A140',7,'完成',1)
GO
--断路(占道)作业票
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('FE783A32-17ED-4BFC-917B-413C8DB246CC','4E607E83-41FC-4F49-B26F-A21CFE38328F',1,'施工单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('EEA2A984-C229-48A5-972B-1D99D2C18475','4E607E83-41FC-4F49-B26F-A21CFE38328F',2,'总包单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('D0C91634-29A7-43E2-98A3-62FA148AA517','4E607E83-41FC-4F49-B26F-A21CFE38328F',3,'总包单位专业工程师意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('13FE0C64-AE97-47E9-8637-6904A87ECCE9','4E607E83-41FC-4F49-B26F-A21CFE38328F',4,'总包单位施工经理意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('E1DF6AA4-B876-4A5C-A837-9963C9486E7C','4E607E83-41FC-4F49-B26F-A21CFE38328F',5,'监理单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('C020FDEB-CDAA-4141-A36D-C61ECE95E8DE','4E607E83-41FC-4F49-B26F-A21CFE38328F',6,'业主单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('6BA6D160-3D1C-4333-92E1-996A3F13AECC','4E607E83-41FC-4F49-B26F-A21CFE38328F',7,'完成',1)
GO
--动土作业票
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('755C6AC9-2E38-4D4F-AF33-33CB1744A9071','755C6AC9-2E38-4D4F-AF33-33CB1744A907',1,'施工单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('755C6AC9-2E38-4D4F-AF33-33CB1744A9072','755C6AC9-2E38-4D4F-AF33-33CB1744A907',2,'总包单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('755C6AC9-2E38-4D4F-AF33-33CB1744A9073','755C6AC9-2E38-4D4F-AF33-33CB1744A907',3,'总包单位专业工程师意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('755C6AC9-2E38-4D4F-AF33-33CB1744A9074','755C6AC9-2E38-4D4F-AF33-33CB1744A907',4,'总包单位施工经理意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('755C6AC9-2E38-4D4F-AF33-33CB1744A9075','755C6AC9-2E38-4D4F-AF33-33CB1744A907',5,'监理单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('755C6AC9-2E38-4D4F-AF33-33CB1744A9076','755C6AC9-2E38-4D4F-AF33-33CB1744A907',6,'业主单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('755C6AC9-2E38-4D4F-AF33-33CB1744A9077','755C6AC9-2E38-4D4F-AF33-33CB1744A907',7,'完成',1)
GO
--夜间施工作业票
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('7BBAE649-7B00-4475-A911-BFE3A37AC55B1','7BBAE649-7B00-4475-A911-BFE3A37AC55B',1,'施工单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('7BBAE649-7B00-4475-A911-BFE3A37AC55B2','7BBAE649-7B00-4475-A911-BFE3A37AC55B',2,'总包单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('7BBAE649-7B00-4475-A911-BFE3A37AC55B3','7BBAE649-7B00-4475-A911-BFE3A37AC55B',3,'总包单位专业工程师意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('7BBAE649-7B00-4475-A911-BFE3A37AC55B4','7BBAE649-7B00-4475-A911-BFE3A37AC55B',4,'总包单位施工经理意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('7BBAE649-7B00-4475-A911-BFE3A37AC55B5','7BBAE649-7B00-4475-A911-BFE3A37AC55B',5,'监理单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('7BBAE649-7B00-4475-A911-BFE3A37AC55B6','7BBAE649-7B00-4475-A911-BFE3A37AC55B',6,'业主单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('7BBAE649-7B00-4475-A911-BFE3A37AC55B7','7BBAE649-7B00-4475-A911-BFE3A37AC55B',7,'完成',1)
GO
--吊装作业票
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('A1BE3AB6-9D4A-41E7-8870-E734231654511','A1BE3AB6-9D4A-41E7-8870-E73423165451',1,'施工单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('A1BE3AB6-9D4A-41E7-8870-E734231654512','A1BE3AB6-9D4A-41E7-8870-E73423165451',2,'总包单位安全人员意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('A1BE3AB6-9D4A-41E7-8870-E734231654513','A1BE3AB6-9D4A-41E7-8870-E73423165451',3,'总包单位专业工程师意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('A1BE3AB6-9D4A-41E7-8870-E734231654514','A1BE3AB6-9D4A-41E7-8870-E73423165451',4,'总包单位施工经理意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('A1BE3AB6-9D4A-41E7-8870-E734231654515','A1BE3AB6-9D4A-41E7-8870-E73423165451',5,'监理单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('A1BE3AB6-9D4A-41E7-8870-E734231654516','A1BE3AB6-9D4A-41E7-8870-E73423165451',6,'业主单位意见',0)
INSERT Sys_MenuFlowOperate(FlowOperateId,MenuId,FlowStep,AuditFlowName,IsFlowEnd)
VALUES('A1BE3AB6-9D4A-41E7-8870-E734231654517','A1BE3AB6-9D4A-41E7-8870-E73423165451',7,'完成',1)
GO

/********安全措施（检查）*******/
--受限空间作业票
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('AEC9166D-1C91-45F0-8BFE-D3D0479A28C71',1,'作业人员已接受专项安全培训，清楚受限空间内存在的危险因素','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('AEC9166D-1C91-45F0-8BFE-D3D0479A28C72',2,'与受限空间相连接的管道、设备、电源、气源已采取隔离措施','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('AEC9166D-1C91-45F0-8BFE-D3D0479A28C73',3,'受限空间已进行置换、清洗，并检测合格','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('AEC9166D-1C91-45F0-8BFE-D3D0479A28C74',4,'受限空间内照明电压应小于等于36V，在潮湿、金属容器内作业时，电压应小于等于12V','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('AEC9166D-1C91-45F0-8BFE-D3D0479A28C75',5,'进出口通道、作业的平台已落实','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('AEC9166D-1C91-45F0-8BFE-D3D0479A28C76',6,'受限空间已经通风，且气体检测符合要求（见附表）','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('AEC9166D-1C91-45F0-8BFE-D3D0479A28C77',7,'监护人已明确，并经过培训','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('AEC9166D-1C91-45F0-8BFE-D3D0479A28C78',8,'通讯方式、设施已落实','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('AEC9166D-1C91-45F0-8BFE-D3D0479A28C79',9,'应急救援设施已到位','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('AEC9166D-1C91-45F0-8BFE-D3D0479A28C7A',9,'作业安全措施：消防器材（ ）、救生绳（ ）、气体呼吸设备（ ）','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7')
GO
--射线作业票
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('F72FF20B-D3EB-46A5-97F7-C99B2473A1401',1,'射线源有专人监管','F72FF20B-D3EB-46A5-97F7-C99B2473A140')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('F72FF20B-D3EB-46A5-97F7-C99B2473A1402',2,'作业点周围拉警戒线、挂警示牌及警示灯','F72FF20B-D3EB-46A5-97F7-C99B2473A140')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('F72FF20B-D3EB-46A5-97F7-C99B2473A1403',3,'确定危险区域内无关人员已全部离开后方可开始作业','F72FF20B-D3EB-46A5-97F7-C99B2473A140')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('F72FF20B-D3EB-46A5-97F7-C99B2473A1404',4,'射线作业人员配带射线检测设施、防护设施','F72FF20B-D3EB-46A5-97F7-C99B2473A140')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('F72FF20B-D3EB-46A5-97F7-C99B2473A1405',5,'通知相关单位和人员','F72FF20B-D3EB-46A5-97F7-C99B2473A140')
GO
--断路(占道)作业票
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('4E607E83-41FC-4F49-B26F-A21CFE38328F1',1,'占道警示、警戒标识满足施工要求','4E607E83-41FC-4F49-B26F-A21CFE38328F')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('4E607E83-41FC-4F49-B26F-A21CFE38328F2',2,'作业人员资质、身体和劳动保护满足作业要求','4E607E83-41FC-4F49-B26F-A21CFE38328F')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('4E607E83-41FC-4F49-B26F-A21CFE38328F3',3,'受作业影响的单位和人员是否已经沟通','4E607E83-41FC-4F49-B26F-A21CFE38328F')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('4E607E83-41FC-4F49-B26F-A21CFE38328F4',4,'临时通道等补充安全措施是否已经落实','4E607E83-41FC-4F49-B26F-A21CFE38328F')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('4E607E83-41FC-4F49-B26F-A21CFE38328F5',5,'作业监护人坚守岗位','4E607E83-41FC-4F49-B26F-A21CFE38328F')
GO
--动土作业票
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('755C6AC9-2E38-4D4F-AF33-33CB1744A9071',1,'施工方案已审批，作业人员已经交底','755C6AC9-2E38-4D4F-AF33-33CB1744A907')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('755C6AC9-2E38-4D4F-AF33-33CB1744A9072',2,'已经标出准确的开挖位置','755C6AC9-2E38-4D4F-AF33-33CB1744A907')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('755C6AC9-2E38-4D4F-AF33-33CB1744A9073',3,'开挖区域地面障碍物已清理','755C6AC9-2E38-4D4F-AF33-33CB1744A907')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('755C6AC9-2E38-4D4F-AF33-33CB1744A9074',4,'开挖区域地下障碍物（管线、电缆）已经过确认并作好标识，保护措施已落实','755C6AC9-2E38-4D4F-AF33-33CB1744A907')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('755C6AC9-2E38-4D4F-AF33-33CB1744A9075',5,'使用的开挖设备、工具已经检查完好','755C6AC9-2E38-4D4F-AF33-33CB1744A907')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('755C6AC9-2E38-4D4F-AF33-33CB1744A9076',6,'开挖作业区域周围已经设立警示标识和围档','755C6AC9-2E38-4D4F-AF33-33CB1744A907')
GO
--夜间施工作业票
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('7BBAE649-7B00-4475-A911-BFE3A37AC55B1',1,'施工人员身体状况良好，不存在疲劳作业','7BBAE649-7B00-4475-A911-BFE3A37AC55B')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('7BBAE649-7B00-4475-A911-BFE3A37AC55B2',2,'施工区域、人员通道已具备足够的照明','7BBAE649-7B00-4475-A911-BFE3A37AC55B')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('7BBAE649-7B00-4475-A911-BFE3A37AC55B3',3,'应急报告流程已落实，现场应急车辆值守','7BBAE649-7B00-4475-A911-BFE3A37AC55B')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('7BBAE649-7B00-4475-A911-BFE3A37AC55B4',4,'通路边、施工区域临边防护有设有灯光警示标识','7BBAE649-7B00-4475-A911-BFE3A37AC55B')
GO
--吊装作业票
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('A1BE3AB6-9D4A-41E7-8870-E734231654511',1,'吊装方案已按程序报审并通过，已进行方案交底','A1BE3AB6-9D4A-41E7-8870-E73423165451')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('A1BE3AB6-9D4A-41E7-8870-E734231654512',2,'起重工持证上岗','A1BE3AB6-9D4A-41E7-8870-E73423165451')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('A1BE3AB6-9D4A-41E7-8870-E734231654513',3,'起重指挥和吊车司机能有效沟通和传递信号（旗、哨、对讲机等）','A1BE3AB6-9D4A-41E7-8870-E73423165451')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('A1BE3AB6-9D4A-41E7-8870-E734231654514',4,'天气状况良好（大雪、大雨、大雾及六级以上大风不得进行吊装作业）','A1BE3AB6-9D4A-41E7-8870-E73423165451')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('A1BE3AB6-9D4A-41E7-8870-E734231654515',5,'吊车资质证件齐全、吊索具状况良好，符合要求','A1BE3AB6-9D4A-41E7-8870-E73423165451')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('A1BE3AB6-9D4A-41E7-8870-E734231654516',6,'吊点的选择、吊装作业半径、站位及行走地基符合规范和施工方案要求','A1BE3AB6-9D4A-41E7-8870-E73423165451')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('A1BE3AB6-9D4A-41E7-8870-E734231654517',7,'吊装区域、场地满足吊装作业的要求，周围无影响吊装作业的障碍物或已采取相应措施','A1BE3AB6-9D4A-41E7-8870-E73423165451')
INSERT INTO dbo.Base_SafetyMeasures(SafetyMeasuresId,SortIndex,SafetyMeasures,LicenseType) 
VALUES ('A1BE3AB6-9D4A-41E7-8870-E734231654518',8,'吊装警戒围护设置到位，监护人员到位','A1BE3AB6-9D4A-41E7-8870-E73423165451')
GO