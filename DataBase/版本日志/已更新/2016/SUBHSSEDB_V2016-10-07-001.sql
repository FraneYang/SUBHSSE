CREATE TABLE [dbo].[InApproveManager_CarIn](
	[CarInId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[DriverName] [nvarchar](20) NULL,
	[CarNum] [nvarchar](20) NULL,
	[CarType] [nvarchar](20) NULL,
	[States] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_InApproveManager_CarIn] PRIMARY KEY CLUSTERED 
(
	[CarInId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarIn', @level2type=N'COLUMN',@level2name=N'CarInId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarIn', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarIn', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'司机姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarIn', @level2type=N'COLUMN',@level2name=N'DriverName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车牌号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarIn', @level2type=N'COLUMN',@level2name=N'CarNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车辆类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarIn', @level2type=N'COLUMN',@level2name=N'CarType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarIn', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarIn', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarIn', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'特种车辆入场审批主表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarIn'
GO

ALTER TABLE [dbo].[InApproveManager_CarIn]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_CarIn_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InApproveManager_CarIn] CHECK CONSTRAINT [FK_InApproveManager_CarIn_Base_Project]
GO

ALTER TABLE [dbo].[InApproveManager_CarIn]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_CarIn_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[InApproveManager_CarIn] CHECK CONSTRAINT [FK_InApproveManager_CarIn_Base_Unit]
GO

ALTER TABLE [dbo].[InApproveManager_CarIn]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_CarIn_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InApproveManager_CarIn] CHECK CONSTRAINT [FK_InApproveManager_CarIn_Sys_User]
GO




CREATE TABLE [dbo].[InApproveManager_CarInItem](
	[CarInItemId] [nvarchar](50) NOT NULL,
	[CarInId] [nvarchar](50) NOT NULL,
	[CheckItem1] [bit] NULL,
	[CheckItem2] [bit] NULL,
	[CheckItem3] [bit] NULL,
	[CheckItem4] [bit] NULL,
	[CheckItem5] [bit] NULL,
	[CheckItem6] [bit] NULL,
	[CheckItem7] [bit] NULL,
	[CheckItem8] [bit] NULL,
	[CheckItem9] [bit] NULL,
	[CheckItem10] [bit] NULL,
	[CheckItem11] [bit] NULL,
	[CheckItem12] [bit] NULL,
	[CheckItem13] [bit] NULL,
 CONSTRAINT [PK_InApproveManager_CarInItem] PRIMARY KEY CLUSTERED 
(
	[CarInItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarInItem', @level2type=N'COLUMN',@level2name=N'CarInItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarInItem', @level2type=N'COLUMN',@level2name=N'CarInId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'保险证明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'行驶证' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'驾驶证' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'前后车牌' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem4'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'刹车功能完好' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem5'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'灯光可用、完好' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem6'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'挡风玻璃雨刷完好' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem7'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'反光镜完好' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem8'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'轮胎良好' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem9'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'无过量排气噪音' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem10'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备用安全带和灭火器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem11'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'外观良好' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem12'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'无明显渗漏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem13'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'特种车辆入场审批明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_CarInItem'
GO

ALTER TABLE [dbo].[InApproveManager_CarInItem]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_CarInItem_InApproveManager_CarIn] FOREIGN KEY([CarInId])
REFERENCES [dbo].[InApproveManager_CarIn] ([CarInId])
GO

ALTER TABLE [dbo].[InApproveManager_CarInItem] CHECK CONSTRAINT [FK_InApproveManager_CarInItem_InApproveManager_CarIn]
GO


CREATE TABLE [dbo].[InApproveManager_EquipmentIn](
	[EquipmentInId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[EquipmentInCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[CarNumber] [nvarchar](50) NULL,
	[SubProjectName] [nvarchar](50) NULL,
	[ContentDef] [nvarchar](500) NULL,
	[OtherDef] [nvarchar](500) NULL,
	[State] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_InApproveManager_EquipmentIn] PRIMARY KEY CLUSTERED 
(
	[EquipmentInId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentIn', @level2type=N'COLUMN',@level2name=N'EquipmentInId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentIn', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备入场编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentIn', @level2type=N'COLUMN',@level2name=N'EquipmentInCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentIn', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车牌号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentIn', @level2type=N'COLUMN',@level2name=N'CarNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包工程名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentIn', @level2type=N'COLUMN',@level2name=N'SubProjectName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工内容简述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentIn', @level2type=N'COLUMN',@level2name=N'ContentDef'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其它情况简述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentIn', @level2type=N'COLUMN',@level2name=N'OtherDef'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentIn', @level2type=N'COLUMN',@level2name=N'State'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentIn', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentIn', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'特种设备机具入场报批主表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentIn'
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentIn]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_EquipmentIn_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentIn] CHECK CONSTRAINT [FK_InApproveManager_EquipmentIn_Base_Project]
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentIn]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_EquipmentIn_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentIn] CHECK CONSTRAINT [FK_InApproveManager_EquipmentIn_Base_Unit]
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentIn]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_EquipmentIn_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentIn] CHECK CONSTRAINT [FK_InApproveManager_EquipmentIn_Sys_User]
GO




CREATE TABLE [dbo].[InApproveManager_EquipmentInItem](
	[EquipmentInItemId] [nvarchar](50) NOT NULL,
	[EquipmentInId] [nvarchar](50) NOT NULL,
	[SpecialEquipmentId] [nvarchar](50) NOT NULL,
	[SizeModel] [nvarchar](50) NULL,
	[OwnerCheck] [nvarchar](50) NULL,
	[CertificateNum] [nvarchar](50) NULL,
	[SafetyInspectionNum] [nvarchar](50) NULL,
	[DrivingLicenseNum] [nvarchar](50) NULL,
	[RegistrationNum] [nvarchar](50) NULL,
	[OperationQualificationNum] [nvarchar](50) NULL,
	[InsuranceNum] [nvarchar](50) NULL,
	[CommercialInsuranceNum] [nvarchar](50) NULL,
 CONSTRAINT [PK_InApproveManager_EquipmentInItem] PRIMARY KEY CLUSTERED 
(
	[EquipmentInItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentInItem', @level2type=N'COLUMN',@level2name=N'EquipmentInItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentInItem', @level2type=N'COLUMN',@level2name=N'EquipmentInId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机具设备ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentInItem', @level2type=N'COLUMN',@level2name=N'SpecialEquipmentId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'规格型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentInItem', @level2type=N'COLUMN',@level2name=N'SizeModel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进场前自查自检情况' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentInItem', @level2type=N'COLUMN',@level2name=N'OwnerCheck'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工设备合格证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentInItem', @level2type=N'COLUMN',@level2name=N'CertificateNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全检验合格证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentInItem', @level2type=N'COLUMN',@level2name=N'SafetyInspectionNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'驾驶证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentInItem', @level2type=N'COLUMN',@level2name=N'DrivingLicenseNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'行驶证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentInItem', @level2type=N'COLUMN',@level2name=N'RegistrationNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作资质证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentInItem', @level2type=N'COLUMN',@level2name=N'OperationQualificationNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交险保单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentInItem', @level2type=N'COLUMN',@level2name=N'InsuranceNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商业险保单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentInItem', @level2type=N'COLUMN',@level2name=N'CommercialInsuranceNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'特种设备机具入场报批明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentInItem'
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentInItem]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_EquipmentInItem_Base_SpecialEquipment] FOREIGN KEY([SpecialEquipmentId])
REFERENCES [dbo].[Base_SpecialEquipment] ([SpecialEquipmentId])
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentInItem] CHECK CONSTRAINT [FK_InApproveManager_EquipmentInItem_Base_SpecialEquipment]
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentInItem]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_EquipmentInItem_InApproveManager_EquipmentIn] FOREIGN KEY([EquipmentInId])
REFERENCES [dbo].[InApproveManager_EquipmentIn] ([EquipmentInId])
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentInItem] CHECK CONSTRAINT [FK_InApproveManager_EquipmentInItem_InApproveManager_EquipmentIn]
GO




CREATE TABLE [dbo].[InApproveManager_EquipmentOut](
	[EquipmentOutId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[EquipmentOutCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[ApplicationDate] [datetime] NULL,
	[CarNum] [nvarchar](20) NULL,
	[CarModel] [nvarchar](20) NULL,
	[DriverName] [nvarchar](20) NULL,
	[DriverNum] [nvarchar](50) NULL,
	[TransPortStart] [nvarchar](50) NULL,
	[TransPortEnd] [nvarchar](50) NULL,
	[State] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_InApproveManager_EquipmentOut] PRIMARY KEY CLUSTERED 
(
	[EquipmentOutId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOut', @level2type=N'COLUMN',@level2name=N'EquipmentOutId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOut', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备出场编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOut', @level2type=N'COLUMN',@level2name=N'EquipmentOutCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOut', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOut', @level2type=N'COLUMN',@level2name=N'ApplicationDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车牌号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOut', @level2type=N'COLUMN',@level2name=N'CarNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOut', @level2type=N'COLUMN',@level2name=N'CarModel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'驾驶员姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOut', @level2type=N'COLUMN',@level2name=N'DriverName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'驾驶证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOut', @level2type=N'COLUMN',@level2name=N'DriverNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'运送起始点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOut', @level2type=N'COLUMN',@level2name=N'TransPortStart'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'运送到达点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOut', @level2type=N'COLUMN',@level2name=N'TransPortEnd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOut', @level2type=N'COLUMN',@level2name=N'State'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOut', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOut', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'特种设备机具出场报批主表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOut'
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentOut]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_EquipmentOut_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentOut] CHECK CONSTRAINT [FK_InApproveManager_EquipmentOut_Base_Project]
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentOut]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_EquipmentOut_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentOut] CHECK CONSTRAINT [FK_InApproveManager_EquipmentOut_Base_Unit]
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentOut]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_EquipmentOut_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentOut] CHECK CONSTRAINT [FK_InApproveManager_EquipmentOut_Sys_User]
GO




CREATE TABLE [dbo].[InApproveManager_EquipmentOutItem](
	[EquipmentOutItemId] [nvarchar](50) NOT NULL,
	[EquipmentOutId] [nvarchar](50) NOT NULL,
	[SpecialEquipmentId] [nvarchar](50) NOT NULL,
	[SizeModel] [nvarchar](50) NULL,
	[OwnerCheck] [nvarchar](50) NULL,
	[CertificateNum] [nvarchar](50) NULL,
	[InsuranceNum] [nvarchar](50) NULL,
	[OutReason] [nvarchar](10) NULL,
 CONSTRAINT [PK_InApproveManager_EquipmentOutItem] PRIMARY KEY CLUSTERED 
(
	[EquipmentOutItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOutItem', @level2type=N'COLUMN',@level2name=N'EquipmentOutItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOutItem', @level2type=N'COLUMN',@level2name=N'EquipmentOutId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOutItem', @level2type=N'COLUMN',@level2name=N'SpecialEquipmentId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'规格型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOutItem', @level2type=N'COLUMN',@level2name=N'SizeModel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进场前自查自检情况' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOutItem', @level2type=N'COLUMN',@level2name=N'OwnerCheck'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工设备合格证号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOutItem', @level2type=N'COLUMN',@level2name=N'CertificateNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'保险单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOutItem', @level2type=N'COLUMN',@level2name=N'InsuranceNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出场理由' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOutItem', @level2type=N'COLUMN',@level2name=N'OutReason'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'特种设备机具出场报批明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentOutItem'
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentOutItem]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_EquipmentOutItem_Base_SpecialEquipment] FOREIGN KEY([SpecialEquipmentId])
REFERENCES [dbo].[Base_SpecialEquipment] ([SpecialEquipmentId])
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentOutItem] CHECK CONSTRAINT [FK_InApproveManager_EquipmentOutItem_Base_SpecialEquipment]
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentOutItem]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_EquipmentOutItem_InApproveManager_EquipmentOut] FOREIGN KEY([EquipmentOutId])
REFERENCES [dbo].[InApproveManager_EquipmentOut] ([EquipmentOutId])
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentOutItem] CHECK CONSTRAINT [FK_InApproveManager_EquipmentOutItem_InApproveManager_EquipmentOut]
GO




CREATE TABLE [dbo].[InApproveManager_EquipmentQualityIn](
	[EquipmentQualityInId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[DriverName] [nvarchar](20) NULL,
	[CarNum] [nvarchar](20) NULL,
	[CarType] [nvarchar](20) NULL,
	[States] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_InApproveManager_EquipmentQualityIn] PRIMARY KEY CLUSTERED 
(
	[EquipmentQualityInId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentQualityIn', @level2type=N'COLUMN',@level2name=N'EquipmentQualityInId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentQualityIn', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentQualityIn', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'司机姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentQualityIn', @level2type=N'COLUMN',@level2name=N'DriverName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车牌号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentQualityIn', @level2type=N'COLUMN',@level2name=N'CarNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车辆类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentQualityIn', @level2type=N'COLUMN',@level2name=N'CarType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'办理类型（1-分包方施工经理，2-分包方HSE经理，3-监理单位HSE负责人，4-总包施工经理，5-总包HSE经理，6-审批完成）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentQualityIn', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'特种设备审批主表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentQualityIn'
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentQualityIn]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_EquipmentQualityIn_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentQualityIn] CHECK CONSTRAINT [FK_InApproveManager_EquipmentQualityIn_Base_Project]
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentQualityIn]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_EquipmentQualityIn_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentQualityIn] CHECK CONSTRAINT [FK_InApproveManager_EquipmentQualityIn_Base_Unit]
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentQualityIn]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_EquipmentQualityIn_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InApproveManager_EquipmentQualityIn] CHECK CONSTRAINT [FK_InApproveManager_EquipmentQualityIn_Sys_User]
GO



CREATE TABLE [dbo].[InApproveManager_EquipmentQualityInItem](
	[EquipmentQualityInItemId] [nvarchar](50) NOT NULL,
	[EquipmentQualityInId] [nvarchar](50) NOT NULL,
	[CheckItem1] [bit] NULL,
	[CheckItem2] [bit] NULL,
	[CheckItem3] [bit] NULL,
	[CheckItem4] [bit] NULL,
	[CheckItem5] [bit] NULL,
	[CheckItem6] [bit] NULL,
	[CheckItem7] [bit] NULL,
	[CheckItem8] [bit] NULL,
	[CheckItem9] [bit] NULL,
	[CheckItem10] [bit] NULL,
	[CheckItem11] [bit] NULL,
	[CheckItem12] [bit] NULL,
	[CheckItem13] [bit] NULL,
	[CheckItem14] [bit] NULL,
	[CheckItem15] [bit] NULL,
	[CheckItem16] [bit] NULL,
	[CheckItem17] [bit] NULL,
	[CheckItem18] [bit] NULL,
	[CheckItem19] [bit] NULL,
	[CheckItem20] [bit] NULL,
 CONSTRAINT [PK_InApproveManager_EquipmentQualityInCheck] PRIMARY KEY CLUSTERED 
(
	[EquipmentQualityInItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'特种设备审批明细' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_EquipmentQualityInItem'
GO




CREATE TABLE [dbo].[InApproveManager_GasCylinderIn](
	[GasCylinderInId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[GasCylinderInCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[InDate] [datetime] NULL,
	[InTime] [datetime] NULL,
	[DriverMan] [nvarchar](20) NULL,
	[DriverNum] [nvarchar](50) NULL,
	[CarNum] [nvarchar](20) NULL,
	[LeadCarMan] [nvarchar](20) NULL,
	[States] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_InApproveManager_GasCylinderIn] PRIMARY KEY CLUSTERED 
(
	[GasCylinderInId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderIn', @level2type=N'COLUMN',@level2name=N'GasCylinderInId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderIn', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'气瓶入场编号 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderIn', @level2type=N'COLUMN',@level2name=N'GasCylinderInCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderIn', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入场日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderIn', @level2type=N'COLUMN',@level2name=N'InDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入场时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderIn', @level2type=N'COLUMN',@level2name=N'InTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'驾驶员姓名 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderIn', @level2type=N'COLUMN',@level2name=N'DriverMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'驾驶证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderIn', @level2type=N'COLUMN',@level2name=N'DriverNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车牌号    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderIn', @level2type=N'COLUMN',@level2name=N'CarNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'带车人 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderIn', @level2type=N'COLUMN',@level2name=N'LeadCarMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderIn', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderIn', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderIn', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'气瓶入场报批主表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderIn'
GO

ALTER TABLE [dbo].[InApproveManager_GasCylinderIn]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GasCylinderIn_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InApproveManager_GasCylinderIn] CHECK CONSTRAINT [FK_InApproveManager_GasCylinderIn_Base_Project]
GO

ALTER TABLE [dbo].[InApproveManager_GasCylinderIn]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GasCylinderIn_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[InApproveManager_GasCylinderIn] CHECK CONSTRAINT [FK_InApproveManager_GasCylinderIn_Base_Unit]
GO

ALTER TABLE [dbo].[InApproveManager_GasCylinderIn]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GasCylinderIn_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InApproveManager_GasCylinderIn] CHECK CONSTRAINT [FK_InApproveManager_GasCylinderIn_Sys_User]
GO




CREATE TABLE [dbo].[InApproveManager_GasCylinderInItem](
	[GasCylinderInItemId] [nvarchar](50) NOT NULL,
	[GasCylinderInId] [nvarchar](50) NOT NULL,
	[GasCylinderId] [nvarchar](50) NOT NULL,
	[GasCylinderNum] [int] NULL,
	[PM_IsFull] [bit] NULL,
	[FZQ_IsFull] [bit] NULL,
	[IsSameCar] [bit] NULL,
 CONSTRAINT [PK_InApproveManager_GasCylinderInItem] PRIMARY KEY CLUSTERED 
(
	[GasCylinderInItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderInItem', @level2type=N'COLUMN',@level2name=N'GasCylinderInItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主表Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderInItem', @level2type=N'COLUMN',@level2name=N'GasCylinderInId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'气瓶类型ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderInItem', @level2type=N'COLUMN',@level2name=N'GasCylinderId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderInItem', @level2type=N'COLUMN',@level2name=N'GasCylinderNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'瓶帽是否齐全' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderInItem', @level2type=N'COLUMN',@level2name=N'PM_IsFull'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'防震圈是否齐全' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderInItem', @level2type=N'COLUMN',@level2name=N'FZQ_IsFull'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否同车运输' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderInItem', @level2type=N'COLUMN',@level2name=N'IsSameCar'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'气瓶入场报批明细表
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderInItem'
GO

ALTER TABLE [dbo].[InApproveManager_GasCylinderInItem]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GasCylinderInItem_Base_GasCylinder] FOREIGN KEY([GasCylinderId])
REFERENCES [dbo].[Base_GasCylinder] ([GasCylinderId])
GO

ALTER TABLE [dbo].[InApproveManager_GasCylinderInItem] CHECK CONSTRAINT [FK_InApproveManager_GasCylinderInItem_Base_GasCylinder]
GO

ALTER TABLE [dbo].[InApproveManager_GasCylinderInItem]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GasCylinderInItem_InApproveManager_GasCylinderIn] FOREIGN KEY([GasCylinderInId])
REFERENCES [dbo].[InApproveManager_GasCylinderIn] ([GasCylinderInId])
GO

ALTER TABLE [dbo].[InApproveManager_GasCylinderInItem] CHECK CONSTRAINT [FK_InApproveManager_GasCylinderInItem_InApproveManager_GasCylinderIn]
GO




CREATE TABLE [dbo].[InApproveManager_GasCylinderOut](
	[GasCylinderOutId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[GasCylinderOutCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[OutDate] [datetime] NULL,
	[OutTime] [datetime] NULL,
	[DriverName] [nvarchar](20) NULL,
	[DriverNum] [nvarchar](50) NULL,
	[CarNum] [nvarchar](20) NULL,
	[LeaderName] [nvarchar](20) NULL,
	[States] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_InApproveManager_GasCylinderOut] PRIMARY KEY CLUSTERED 
(
	[GasCylinderOutId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderOut', @level2type=N'COLUMN',@level2name=N'GasCylinderOutId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderOut', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'气瓶出场编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderOut', @level2type=N'COLUMN',@level2name=N'GasCylinderOutCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderOut', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出场日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderOut', @level2type=N'COLUMN',@level2name=N'OutDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出场时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderOut', @level2type=N'COLUMN',@level2name=N'OutTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'驾驶员姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderOut', @level2type=N'COLUMN',@level2name=N'DriverName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'驾驶证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderOut', @level2type=N'COLUMN',@level2name=N'DriverNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车牌号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderOut', @level2type=N'COLUMN',@level2name=N'CarNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'带车人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderOut', @level2type=N'COLUMN',@level2name=N'LeaderName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderOut', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderOut', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderOut', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'气瓶出场报批主表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderOut'
GO

ALTER TABLE [dbo].[InApproveManager_GasCylinderOut]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GasCylinderOut_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InApproveManager_GasCylinderOut] CHECK CONSTRAINT [FK_InApproveManager_GasCylinderOut_Base_Project]
GO

ALTER TABLE [dbo].[InApproveManager_GasCylinderOut]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GasCylinderOut_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[InApproveManager_GasCylinderOut] CHECK CONSTRAINT [FK_InApproveManager_GasCylinderOut_Base_Unit]
GO

ALTER TABLE [dbo].[InApproveManager_GasCylinderOut]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GasCylinderOut_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InApproveManager_GasCylinderOut] CHECK CONSTRAINT [FK_InApproveManager_GasCylinderOut_Sys_User]
GO




CREATE TABLE [dbo].[InApproveManager_GasCylinderOutItem](
	[GasCylinderOutItemId] [nvarchar](50) NOT NULL,
	[GasCylinderOutId] [nvarchar](50) NOT NULL,
	[GasCylinderId] [nvarchar](50) NOT NULL,
	[GasCylinderNum] [int] NULL,
 CONSTRAINT [PK_InApproveManager_GasCylinderOutItem] PRIMARY KEY CLUSTERED 
(
	[GasCylinderOutItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderOutItem', @level2type=N'COLUMN',@level2name=N'GasCylinderOutItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderOutItem', @level2type=N'COLUMN',@level2name=N'GasCylinderOutId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'气瓶类型id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderOutItem', @level2type=N'COLUMN',@level2name=N'GasCylinderId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'气瓶出场报批明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GasCylinderOutItem'
GO

ALTER TABLE [dbo].[InApproveManager_GasCylinderOutItem]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GasCylinderOutItem_Base_GasCylinder] FOREIGN KEY([GasCylinderId])
REFERENCES [dbo].[Base_GasCylinder] ([GasCylinderId])
GO

ALTER TABLE [dbo].[InApproveManager_GasCylinderOutItem] CHECK CONSTRAINT [FK_InApproveManager_GasCylinderOutItem_Base_GasCylinder]
GO

ALTER TABLE [dbo].[InApproveManager_GasCylinderOutItem]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GasCylinderOutItem_InApproveManager_GasCylinderOut] FOREIGN KEY([GasCylinderOutId])
REFERENCES [dbo].[InApproveManager_GasCylinderOut] ([GasCylinderOutId])
GO

ALTER TABLE [dbo].[InApproveManager_GasCylinderOutItem] CHECK CONSTRAINT [FK_InApproveManager_GasCylinderOutItem_InApproveManager_GasCylinderOut]
GO




CREATE TABLE [dbo].[InApproveManager_GeneralCarIn](
	[GeneralCarInId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[DriverName] [nvarchar](20) NULL,
	[CarNum] [nvarchar](20) NULL,
	[CarType] [nvarchar](20) NULL,
	[Descriptions] [nvarchar](500) NULL,
	[States] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_InApproveManager_GeneralCarIn] PRIMARY KEY CLUSTERED 
(
	[GeneralCarInId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarIn', @level2type=N'COLUMN',@level2name=N'GeneralCarInId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarIn', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarIn', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'司机姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarIn', @level2type=N'COLUMN',@level2name=N'DriverName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车牌号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarIn', @level2type=N'COLUMN',@level2name=N'CarNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车辆类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarIn', @level2type=N'COLUMN',@level2name=N'CarType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'情况说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarIn', @level2type=N'COLUMN',@level2name=N'Descriptions'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarIn', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarIn', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarIn', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'普通车辆入场审批主表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarIn'
GO

ALTER TABLE [dbo].[InApproveManager_GeneralCarIn]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GeneralCarIn_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InApproveManager_GeneralCarIn] CHECK CONSTRAINT [FK_InApproveManager_GeneralCarIn_Base_Project]
GO

ALTER TABLE [dbo].[InApproveManager_GeneralCarIn]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GeneralCarIn_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[InApproveManager_GeneralCarIn] CHECK CONSTRAINT [FK_InApproveManager_GeneralCarIn_Base_Unit]
GO

ALTER TABLE [dbo].[InApproveManager_GeneralCarIn]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GeneralCarIn_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InApproveManager_GeneralCarIn] CHECK CONSTRAINT [FK_InApproveManager_GeneralCarIn_Sys_User]
GO




CREATE TABLE [dbo].[InApproveManager_GeneralCarInItem](
	[GeneralCarInItemId] [nvarchar](50) NOT NULL,
	[GeneralCarInId] [nvarchar](50) NOT NULL,
	[CheckItem1] [bit] NULL,
	[CheckItem2] [bit] NULL,
	[CheckItem3] [bit] NULL,
	[CheckItem4] [bit] NULL,
	[CheckItem5] [bit] NULL,
	[CheckItem6] [bit] NULL,
	[CheckItem7] [bit] NULL,
	[CheckItem8] [bit] NULL,
	[CheckItem9] [bit] NULL,
	[CheckItem10] [bit] NULL,
	[CheckItem11] [bit] NULL,
	[CheckItem12] [bit] NULL,
	[CheckItem13] [bit] NULL,
 CONSTRAINT [PK_InApproveManager_GeneralCarInItem] PRIMARY KEY CLUSTERED 
(
	[GeneralCarInItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarInItem', @level2type=N'COLUMN',@level2name=N'GeneralCarInItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarInItem', @level2type=N'COLUMN',@level2name=N'GeneralCarInId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'保险证明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'行驶证' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'驾驶证' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'前后车牌' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem4'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'刹车功能完好' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem5'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'灯光可用、完好' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem6'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'挡风玻璃雨刷完好' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem7'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'反光镜完好' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem8'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'轮胎良好' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem9'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'无过量排气噪音' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem10'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备用安全带和灭火器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem11'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'外观良好' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem12'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'无明显渗漏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarInItem', @level2type=N'COLUMN',@level2name=N'CheckItem13'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'特种车辆入场审批明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralCarInItem'
GO

ALTER TABLE [dbo].[InApproveManager_GeneralCarInItem]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GeneralCarInItem_InApproveManager_GeneralCarIn] FOREIGN KEY([GeneralCarInId])
REFERENCES [dbo].[InApproveManager_GeneralCarIn] ([GeneralCarInId])
GO

ALTER TABLE [dbo].[InApproveManager_GeneralCarInItem] CHECK CONSTRAINT [FK_InApproveManager_GeneralCarInItem_InApproveManager_GeneralCarIn]
GO




CREATE TABLE [dbo].[InApproveManager_GeneralEquipmentIn](
	[GeneralEquipmentInId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[GeneralEquipmentInCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[CarNumber] [nvarchar](50) NULL,
	[SubProjectName] [nvarchar](50) NULL,
	[ContentDef] [nvarchar](500) NULL,
	[OtherDef] [nvarchar](500) NULL,
	[State] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_InApproveManager_GeneralEquipmentIn] PRIMARY KEY CLUSTERED 
(
	[GeneralEquipmentInId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentIn', @level2type=N'COLUMN',@level2name=N'GeneralEquipmentInId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目id ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentIn', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'一般设备入场编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentIn', @level2type=N'COLUMN',@level2name=N'GeneralEquipmentInCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentIn', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车牌号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentIn', @level2type=N'COLUMN',@level2name=N'CarNumber'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包工程名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentIn', @level2type=N'COLUMN',@level2name=N'SubProjectName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工内容简述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentIn', @level2type=N'COLUMN',@level2name=N'ContentDef'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其它情况简述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentIn', @level2type=N'COLUMN',@level2name=N'OtherDef'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentIn', @level2type=N'COLUMN',@level2name=N'State'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentIn', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentIn', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'一般设备机具入场报批主表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentIn'
GO

ALTER TABLE [dbo].[InApproveManager_GeneralEquipmentIn]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GeneralEquipmentIn_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InApproveManager_GeneralEquipmentIn] CHECK CONSTRAINT [FK_InApproveManager_GeneralEquipmentIn_Base_Project]
GO

ALTER TABLE [dbo].[InApproveManager_GeneralEquipmentIn]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GeneralEquipmentIn_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[InApproveManager_GeneralEquipmentIn] CHECK CONSTRAINT [FK_InApproveManager_GeneralEquipmentIn_Base_Unit]
GO

ALTER TABLE [dbo].[InApproveManager_GeneralEquipmentIn]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GeneralEquipmentIn_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InApproveManager_GeneralEquipmentIn] CHECK CONSTRAINT [FK_InApproveManager_GeneralEquipmentIn_Sys_User]
GO




CREATE TABLE [dbo].[InApproveManager_GeneralEquipmentInItem](
	[GeneralEquipmentInItemId] [nvarchar](50) NOT NULL,
	[GeneralEquipmentInId] [nvarchar](50) NOT NULL,
	[SpecialEquipmentId] [nvarchar](50) NOT NULL,
	[SizeModel] [nvarchar](50) NULL,
	[OwnerCheck] [nvarchar](50) NULL,
	[CertificateNum] [nvarchar](50) NULL,
 CONSTRAINT [PK_InApproveManager_GeneralEquipmentInItem] PRIMARY KEY CLUSTERED 
(
	[GeneralEquipmentInItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentInItem', @level2type=N'COLUMN',@level2name=N'GeneralEquipmentInItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentInItem', @level2type=N'COLUMN',@level2name=N'GeneralEquipmentInId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机具设备ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentInItem', @level2type=N'COLUMN',@level2name=N'SpecialEquipmentId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'规格型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentInItem', @level2type=N'COLUMN',@level2name=N'SizeModel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进场前自查自检情况' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentInItem', @level2type=N'COLUMN',@level2name=N'OwnerCheck'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工设备合格证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentInItem', @level2type=N'COLUMN',@level2name=N'CertificateNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'特种设备机具入场报批明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentInItem'
GO

ALTER TABLE [dbo].[InApproveManager_GeneralEquipmentInItem]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GeneralEquipmentInItem_Base_SpecialEquipment] FOREIGN KEY([SpecialEquipmentId])
REFERENCES [dbo].[Base_SpecialEquipment] ([SpecialEquipmentId])
GO

ALTER TABLE [dbo].[InApproveManager_GeneralEquipmentInItem] CHECK CONSTRAINT [FK_InApproveManager_GeneralEquipmentInItem_Base_SpecialEquipment]
GO

ALTER TABLE [dbo].[InApproveManager_GeneralEquipmentInItem]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GeneralEquipmentInItem_InApproveManager_GeneralEquipmentIn] FOREIGN KEY([GeneralEquipmentInId])
REFERENCES [dbo].[InApproveManager_GeneralEquipmentIn] ([GeneralEquipmentInId])
GO

ALTER TABLE [dbo].[InApproveManager_GeneralEquipmentInItem] CHECK CONSTRAINT [FK_InApproveManager_GeneralEquipmentInItem_InApproveManager_GeneralEquipmentIn]
GO



CREATE TABLE [dbo].[InApproveManager_GeneralEquipmentOut](
	[GeneralEquipmentOutId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[GeneralEquipmentOutCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[ApplicationDate] [datetime] NULL,
	[CarNum] [nvarchar](20) NULL,
	[CarModel] [nvarchar](20) NULL,
	[DriverName] [nvarchar](20) NULL,
	[DriverNum] [nvarchar](50) NULL,
	[TransPortStart] [nvarchar](50) NULL,
	[TransPortEnd] [nvarchar](50) NULL,
	[State] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_InApproveManager_GeneralEquipmentOut] PRIMARY KEY CLUSTERED 
(
	[GeneralEquipmentOutId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOut', @level2type=N'COLUMN',@level2name=N'GeneralEquipmentOutId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOut', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备出场编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOut', @level2type=N'COLUMN',@level2name=N'GeneralEquipmentOutCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOut', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOut', @level2type=N'COLUMN',@level2name=N'ApplicationDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车牌号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOut', @level2type=N'COLUMN',@level2name=N'CarNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOut', @level2type=N'COLUMN',@level2name=N'CarModel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'驾驶员姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOut', @level2type=N'COLUMN',@level2name=N'DriverName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'驾驶证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOut', @level2type=N'COLUMN',@level2name=N'DriverNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'运送起始点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOut', @level2type=N'COLUMN',@level2name=N'TransPortStart'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'运送到达点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOut', @level2type=N'COLUMN',@level2name=N'TransPortEnd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOut', @level2type=N'COLUMN',@level2name=N'State'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOut', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOut', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'一般设备机具出场报批主表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOut'
GO

ALTER TABLE [dbo].[InApproveManager_GeneralEquipmentOut]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GeneralEquipmentOut_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InApproveManager_GeneralEquipmentOut] CHECK CONSTRAINT [FK_InApproveManager_GeneralEquipmentOut_Base_Project]
GO

ALTER TABLE [dbo].[InApproveManager_GeneralEquipmentOut]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GeneralEquipmentOut_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[InApproveManager_GeneralEquipmentOut] CHECK CONSTRAINT [FK_InApproveManager_GeneralEquipmentOut_Base_Unit]
GO

ALTER TABLE [dbo].[InApproveManager_GeneralEquipmentOut]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GeneralEquipmentOut_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InApproveManager_GeneralEquipmentOut] CHECK CONSTRAINT [FK_InApproveManager_GeneralEquipmentOut_Sys_User]
GO




CREATE TABLE [dbo].[InApproveManager_GoodsIn](
	[GoodsInId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[GoodsInCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[InDate] [datetime] NULL,
	[InTime] [datetime] NULL,
	[CarNum] [nvarchar](20) NULL,
	[DriverNameAndNum] [nvarchar](50) NULL,
	[GoodsInResult] [nvarchar](500) NULL,
	[GoodsInNote] [nvarchar](500) NULL,
	[States] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_InApproveManager_GoodsIn] PRIMARY KEY CLUSTERED 
(
	[GoodsInId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsIn', @level2type=N'COLUMN',@level2name=N'GoodsInId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsIn', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'货物入场编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsIn', @level2type=N'COLUMN',@level2name=N'GoodsInCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsIn', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进门日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsIn', @level2type=N'COLUMN',@level2name=N'InDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进门时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsIn', @level2type=N'COLUMN',@level2name=N'InTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车牌号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsIn', @level2type=N'COLUMN',@level2name=N'CarNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'驾驶员姓名、驾驶证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsIn', @level2type=N'COLUMN',@level2name=N'DriverNameAndNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'货物进门原因描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsIn', @level2type=N'COLUMN',@level2name=N'GoodsInResult'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'货物基本情况' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsIn', @level2type=N'COLUMN',@level2name=N'GoodsInNote'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsIn', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsIn', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsIn', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'普通货物入场报批' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsIn'
GO

ALTER TABLE [dbo].[InApproveManager_GoodsIn]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GoodsIn_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InApproveManager_GoodsIn] CHECK CONSTRAINT [FK_InApproveManager_GoodsIn_Base_Project]
GO

ALTER TABLE [dbo].[InApproveManager_GoodsIn]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GoodsIn_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[InApproveManager_GoodsIn] CHECK CONSTRAINT [FK_InApproveManager_GoodsIn_Base_Unit]
GO

ALTER TABLE [dbo].[InApproveManager_GoodsIn]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GoodsIn_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InApproveManager_GoodsIn] CHECK CONSTRAINT [FK_InApproveManager_GoodsIn_Sys_User]
GO




CREATE TABLE [dbo].[InApproveManager_GoodsOut](
	[GoodsOutId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[GoodsOutCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[OutDate] [datetime] NULL,
	[OutTime] [datetime] NULL,
	[CarNum] [nvarchar](20) NULL,
	[CarModel] [nvarchar](50) NULL,
	[StartPlace] [nvarchar](50) NULL,
	[EndPlace] [nvarchar](50) NULL,
	[GoodsOutNote] [nvarchar](500) NULL,
	[States] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_InApproveManager_GoodsOut] PRIMARY KEY CLUSTERED 
(
	[GoodsOutId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsOut', @level2type=N'COLUMN',@level2name=N'GoodsOutId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsOut', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'货物出场编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsOut', @level2type=N'COLUMN',@level2name=N'GoodsOutCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsOut', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出场日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsOut', @level2type=N'COLUMN',@level2name=N'OutDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出场时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsOut', @level2type=N'COLUMN',@level2name=N'OutTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车牌号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsOut', @level2type=N'COLUMN',@level2name=N'CarNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'车型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsOut', @level2type=N'COLUMN',@level2name=N'CarModel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'运送起点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsOut', @level2type=N'COLUMN',@level2name=N'StartPlace'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'运送终点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsOut', @level2type=N'COLUMN',@level2name=N'EndPlace'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出场物资' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsOut', @level2type=N'COLUMN',@level2name=N'GoodsOutNote'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsOut', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsOut', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsOut', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'普通货物出场报批' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GoodsOut'
GO

ALTER TABLE [dbo].[InApproveManager_GoodsOut]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GoodsOut_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InApproveManager_GoodsOut] CHECK CONSTRAINT [FK_InApproveManager_GoodsOut_Base_Project]
GO

ALTER TABLE [dbo].[InApproveManager_GoodsOut]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GoodsOut_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[InApproveManager_GoodsOut] CHECK CONSTRAINT [FK_InApproveManager_GoodsOut_Base_Unit]
GO

ALTER TABLE [dbo].[InApproveManager_GoodsOut]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GoodsOut_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InApproveManager_GoodsOut] CHECK CONSTRAINT [FK_InApproveManager_GoodsOut_Sys_User]
GO


CREATE TABLE [dbo].[InApproveManager_GeneralEquipmentOutItem](
	[GeneralEquipmentOutItemId] [nvarchar](50) NOT NULL,
	[GeneralEquipmentOutId] [nvarchar](50) NOT NULL,
	[SpecialEquipmentId] [nvarchar](50) NOT NULL,
	[SizeModel] [nvarchar](50) NULL,
	[OwnerCheck] [nvarchar](50) NULL,
	[CertificateNum] [nvarchar](50) NULL,
	[InsuranceNum] [nvarchar](50) NULL,
	[OutReason] [nvarchar](10) NULL,
 CONSTRAINT [PK_InApproveManager_GeneralEquipmentOutItem] PRIMARY KEY CLUSTERED 
(
	[GeneralEquipmentOutItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOutItem', @level2type=N'COLUMN',@level2name=N'GeneralEquipmentOutItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOutItem', @level2type=N'COLUMN',@level2name=N'GeneralEquipmentOutId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOutItem', @level2type=N'COLUMN',@level2name=N'SpecialEquipmentId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'规格型号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOutItem', @level2type=N'COLUMN',@level2name=N'SizeModel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进场前自查自检情况' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOutItem', @level2type=N'COLUMN',@level2name=N'OwnerCheck'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'施工设备合格证号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOutItem', @level2type=N'COLUMN',@level2name=N'CertificateNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'保险单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOutItem', @level2type=N'COLUMN',@level2name=N'InsuranceNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出场理由' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOutItem', @level2type=N'COLUMN',@level2name=N'OutReason'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'一般设备机具出场报批明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InApproveManager_GeneralEquipmentOutItem'
GO

ALTER TABLE [dbo].[InApproveManager_GeneralEquipmentOutItem]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GeneralEquipmentOutItem_Base_SpecialEquipment] FOREIGN KEY([SpecialEquipmentId])
REFERENCES [dbo].[Base_SpecialEquipment] ([SpecialEquipmentId])
GO

ALTER TABLE [dbo].[InApproveManager_GeneralEquipmentOutItem] CHECK CONSTRAINT [FK_InApproveManager_GeneralEquipmentOutItem_Base_SpecialEquipment]
GO

ALTER TABLE [dbo].[InApproveManager_GeneralEquipmentOutItem]  WITH CHECK ADD  CONSTRAINT [FK_InApproveManager_GeneralEquipmentOutItem_InApproveManager_GeneralEquipmentOut] FOREIGN KEY([GeneralEquipmentOutId])
REFERENCES [dbo].[InApproveManager_GeneralEquipmentOut] ([GeneralEquipmentOutId])
GO

ALTER TABLE [dbo].[InApproveManager_GeneralEquipmentOutItem] CHECK CONSTRAINT [FK_InApproveManager_GeneralEquipmentOutItem_InApproveManager_GeneralEquipmentOut]
GO

CREATE TABLE [dbo].[Personal_PersonalFolder](
	[PersonalFolderId] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](100) NULL,
	[SupPersonalFolderId] [nvarchar](50) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[IsEndLever] [bit] NULL,
 CONSTRAINT [PK_Personal_PersonalFolder] PRIMARY KEY CLUSTERED 
(
	[PersonalFolderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Personal_PersonalFolder]  WITH CHECK ADD  CONSTRAINT [FK_Personal_PersonalFolder_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Personal_PersonalFolder] CHECK CONSTRAINT [FK_Personal_PersonalFolder_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人文档id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Personal_PersonalFolder', @level2type=N'COLUMN',@level2name=N'PersonalFolderId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人文档资源编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Personal_PersonalFolder', @level2type=N'COLUMN',@level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人文档名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Personal_PersonalFolder', @level2type=N'COLUMN',@level2name=N'Title'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Personal_PersonalFolder', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否末级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Personal_PersonalFolder', @level2type=N'COLUMN',@level2name=N'IsEndLever'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人文档资源' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Personal_PersonalFolder'
GO



CREATE TABLE [dbo].[Personal_PersonalFolderItem](
	[PersonalFolderItemId] [nvarchar](50) NOT NULL,
	[PersonalFolderId] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](100) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileDate] [datetime] NULL,
	[AttachUrl] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Personal_PersonalFolderItem] PRIMARY KEY CLUSTERED 
(
	[PersonalFolderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Personal_PersonalFolderItem]  WITH CHECK ADD  CONSTRAINT [FK_Personal_PersonalFolderItem_Personal_PersonalFolder] FOREIGN KEY([PersonalFolderId])
REFERENCES [dbo].[Personal_PersonalFolder] ([PersonalFolderId])
GO

ALTER TABLE [dbo].[Personal_PersonalFolderItem] CHECK CONSTRAINT [FK_Personal_PersonalFolderItem_Personal_PersonalFolder]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人文件夹明细id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Personal_PersonalFolderItem', @level2type=N'COLUMN',@level2name=N'PersonalFolderItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人文件夹主键id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Personal_PersonalFolderItem', @level2type=N'COLUMN',@level2name=N'PersonalFolderId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'明细编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Personal_PersonalFolderItem', @level2type=N'COLUMN',@level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'明细标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Personal_PersonalFolderItem', @level2type=N'COLUMN',@level2name=N'Title'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Personal_PersonalFolderItem', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Personal_PersonalFolderItem', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Personal_PersonalFolderItem', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训资源明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Personal_PersonalFolderItem'
GO


CREATE TABLE [dbo].[InformationProject_ProjectFolder](
	[ProjectFolderId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](100) NULL,
	[SupProjectFolderId] [nvarchar](50) NULL,
	[IsEndLever] [bit] NULL,
 CONSTRAINT [PK_InformationProject_ProjectFolder] PRIMARY KEY CLUSTERED 
(
	[ProjectFolderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[InformationProject_ProjectFolder]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_ProjectFolder_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InformationProject_ProjectFolder] CHECK CONSTRAINT [FK_InformationProject_ProjectFolder_Base_Project]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目文档id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ProjectFolder', @level2type=N'COLUMN',@level2name=N'ProjectFolderId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目文档资源编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ProjectFolder', @level2type=N'COLUMN',@level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目文档名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ProjectFolder', @level2type=N'COLUMN',@level2name=N'Title'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否末级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ProjectFolder', @level2type=N'COLUMN',@level2name=N'IsEndLever'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目文档资源' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ProjectFolder'
GO


CREATE TABLE [dbo].[InformationProject_ProjectFolderItem](
	[ProjectFolderItemId] [nvarchar](50) NOT NULL,
	[ProjectFolderId] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](100) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[AttachUrl] [nvarchar](2000) NULL,
 CONSTRAINT [PK_InformationProject_ProjectFolderItem] PRIMARY KEY CLUSTERED 
(
	[ProjectFolderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[InformationProject_ProjectFolderItem]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_ProjectFolderItem_InformationProject_ProjectFolder] FOREIGN KEY([ProjectFolderId])
REFERENCES [dbo].[InformationProject_ProjectFolder] ([ProjectFolderId])
GO

ALTER TABLE [dbo].[InformationProject_ProjectFolderItem] CHECK CONSTRAINT [FK_InformationProject_ProjectFolderItem_InformationProject_ProjectFolder]
GO

ALTER TABLE [dbo].[InformationProject_ProjectFolderItem]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_ProjectFolderItem_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InformationProject_ProjectFolderItem] CHECK CONSTRAINT [FK_InformationProject_ProjectFolderItem_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目文件夹明细id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ProjectFolderItem', @level2type=N'COLUMN',@level2name=N'ProjectFolderItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目文件夹主键id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ProjectFolderItem', @level2type=N'COLUMN',@level2name=N'ProjectFolderId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'明细编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ProjectFolderItem', @level2type=N'COLUMN',@level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'明细标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ProjectFolderItem', @level2type=N'COLUMN',@level2name=N'Title'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ProjectFolderItem', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ProjectFolderItem', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ProjectFolderItem', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'培训资源明细表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_ProjectFolderItem'
GO