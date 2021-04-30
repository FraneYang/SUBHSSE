alter table dbo.Hazard_Registration add IsEffective bit null
alter table dbo.Hazard_Registration add RectificationRemark nvarchar(500) null
alter table dbo.Hazard_Registration add ConfirmMan nvarchar(50) null
alter table dbo.Hazard_Registration add ConfirmDate datetime null
alter table dbo.Hazard_Registration add HandleIdea nvarchar(500) null
GO

--常量表:危险性较大的工程清单类型
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('A39208D9-5CF8-464A-A97E-A3614AC1CC0A','1','基坑支护、降水工程',1,'LargerHazardType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('7F7FFA9D-DB53-4791-9F4A-801AD974866C','2','土方开挖工程',2,'LargerHazardType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('C9317182-DB5A-4217-AFF3-B87775DEB81A','3','模板工程及支撑体系',3,'LargerHazardType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('6253E62B-BD9E-4863-A892-0465BBCBE57B','4','起重吊装及安装拆卸工程',4,'LargerHazardType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('334139FF-749A-4E0C-9FD9-F35FB88E54A8','5','脚手架工程',5,'LargerHazardType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('308C7203-A289-4B44-9940-C603559DF024','6','拆除、爆破工程',6,'LargerHazardType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('6CA96A4C-3FB8-46CC-BAA6-6C45E3FF659C','7','其它',7,'LargerHazardType')
GO
CREATE TABLE [dbo].[Hazard_OtherHazard](
	[OtherHazardId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[OtherHazardCode] [nvarchar](50) NULL,
	[OtherHazardName] [nvarchar](100) NULL,
	[AttachUrl] [nvarchar](1000) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Hazard_OtherHazard] PRIMARY KEY CLUSTERED 
(
	[OtherHazardId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_OtherHazard', @level2type=N'COLUMN',@level2name=N'OtherHazardId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_OtherHazard', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其他危险源辨识文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_OtherHazard', @level2type=N'COLUMN',@level2name=N'OtherHazardName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_OtherHazard', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其他危险源辨识文件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_OtherHazard'
GO

CREATE TABLE [dbo].[Hazard_LargerHazard](
	[HazardId] [nvarchar](50) NOT NULL,
	[HazardCode] [nvarchar](50) NULL,
	[HazardType] [nvarchar](50) NULL,
	[ProjectId] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[ExpectedTime] [datetime] NULL,
	[IsArgument] [bit] NULL,
	[RecordTime] [datetime] NULL,
	[RecardMan] [nvarchar](50) NULL,
	[Remark] [nvarchar](1000) NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Hazard_LargerHazard] PRIMARY KEY CLUSTERED 
(
	[HazardId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_LargerHazard', @level2type=N'COLUMN',@level2name=N'HazardId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_LargerHazard', @level2type=N'COLUMN',@level2name=N'HazardCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型（基坑支护、降水工程；土方开挖工程；模板工程及支撑体系；起重吊装及安装拆卸工程；脚手架工程；拆除、爆破工程；其它）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_LargerHazard', @level2type=N'COLUMN',@level2name=N'HazardType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_LargerHazard', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_LargerHazard', @level2type=N'COLUMN',@level2name=N'Address'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'预期时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_LargerHazard', @level2type=N'COLUMN',@level2name=N'ExpectedTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否需专家论证' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_LargerHazard', @level2type=N'COLUMN',@level2name=N'IsArgument'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_LargerHazard', @level2type=N'COLUMN',@level2name=N'RecordTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_LargerHazard', @level2type=N'COLUMN',@level2name=N'RecardMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_LargerHazard', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'危险性较大的分部分项工程清单表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Hazard_LargerHazard'
GO

ALTER TABLE [dbo].[Hazard_LargerHazard]  WITH CHECK ADD  CONSTRAINT [FK_Hazard_LargerHazard_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Hazard_LargerHazard] CHECK CONSTRAINT [FK_Hazard_LargerHazard_Base_Project]
GO

ALTER TABLE [dbo].[Hazard_LargerHazard]  WITH CHECK ADD  CONSTRAINT [FK_Hazard_LargerHazard_Sys_User] FOREIGN KEY([RecardMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Hazard_LargerHazard] CHECK CONSTRAINT [FK_Hazard_LargerHazard_Sys_User]
GO



INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('53591CA9-1B8E-4031-AC56-D156DC907170','1','死亡',1,'Accident')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('1A185805-22AA-4FB0-A2F2-F5A553CF9919','2','重伤',2,'Accident')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('C619C405-374D-4BEB-B5E8-F14107B79120','3','轻伤',3,'Accident')

GO

INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('F17300B0-4465-40EB-8672-8929F4249A25','1','施工单位调查报告',1,'AccidentReport') INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('11275CA4-C215-4446-997F-07F0B7C139C0','2','总包方调查报告',2,'AccidentReport')
GO

CREATE TABLE [dbo].[SitePerson_Person](
	[PersonId] [nvarchar](50) NOT NULL,
	[CardNo] [nvarchar](20) NULL,
	[PersonName] [nvarchar](20) NOT NULL,
	[Sex] [char](1) NULL,
	[IdentityCard] [nvarchar](18) NULL,
	[Address] [nvarchar](50) NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NOT NULL,
	[TeamGroupId] [nvarchar](50) NULL,
	[WorkAreaId] [nvarchar](50) NULL,
	[WorkPostId] [nvarchar](50) NULL,
	[CertificateId] [nvarchar](50) NULL,
	[CertificateCode] [nvarchar](20) NULL,
	[CertificateLimitTime] [datetime] NULL,
	[InTime] [datetime] NULL,
	[OutTime] [datetime] NULL,
	[OutResult] [nvarchar](50) NULL,
	[Telephone] [nvarchar](20) NULL,
	[PositionId] [nvarchar](50) NULL,
	[PostTitleId] [nvarchar](50) NULL,
	[PhotoUrl] [nvarchar](100) NULL,
	[IsUsed] [bit] NOT NULL,
	[IsCardUsed] [bit] NOT NULL,
	[PersonIndex] [int] NULL,
 CONSTRAINT [PK_SitePerson_Person_1] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'PersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卡号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'CardNo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'PersonName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'Sex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'IdentityCard'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'家庭地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'Address'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属单位Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所在班组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'TeamGroupId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业区域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'WorkAreaId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'岗位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'WorkPostId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'特岗证书' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'CertificateId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'证书编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'CertificateCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'证书有效期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'CertificateLimitTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'入场时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'InTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出场时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'OutTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出场原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'OutResult'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'Telephone'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'PositionId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'PostTitleId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'照片路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'PhotoUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'IsUsed'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'考勤卡是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person', @level2type=N'COLUMN',@level2name=N'IsCardUsed'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SitePerson_Person'
GO

ALTER TABLE [dbo].[SitePerson_Person]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_Person_Base_Certificate] FOREIGN KEY([CertificateId])
REFERENCES [dbo].[Base_Certificate] ([CertificateId])
GO

ALTER TABLE [dbo].[SitePerson_Person] CHECK CONSTRAINT [FK_SitePerson_Person_Base_Certificate]
GO

ALTER TABLE [dbo].[SitePerson_Person]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_Person_Base_Position] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Base_Position] ([PositionId])
GO

ALTER TABLE [dbo].[SitePerson_Person] CHECK CONSTRAINT [FK_SitePerson_Person_Base_Position]
GO

ALTER TABLE [dbo].[SitePerson_Person]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_Person_Base_PostTitle] FOREIGN KEY([PostTitleId])
REFERENCES [dbo].[Base_PostTitle] ([PostTitleId])
GO

ALTER TABLE [dbo].[SitePerson_Person] CHECK CONSTRAINT [FK_SitePerson_Person_Base_PostTitle]
GO

ALTER TABLE [dbo].[SitePerson_Person]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_Person_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[SitePerson_Person] CHECK CONSTRAINT [FK_SitePerson_Person_Base_Project]
GO

ALTER TABLE [dbo].[SitePerson_Person]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_Person_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[SitePerson_Person] CHECK CONSTRAINT [FK_SitePerson_Person_Base_Unit]
GO

ALTER TABLE [dbo].[SitePerson_Person]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_Person_Base_WorkPost] FOREIGN KEY([WorkPostId])
REFERENCES [dbo].[Base_WorkPost] ([WorkPostId])
GO

ALTER TABLE [dbo].[SitePerson_Person] CHECK CONSTRAINT [FK_SitePerson_Person_Base_WorkPost]
GO

ALTER TABLE [dbo].[SitePerson_Person]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_Person_ProjectData_TeamGroup] FOREIGN KEY([TeamGroupId])
REFERENCES [dbo].[ProjectData_TeamGroup] ([TeamGroupId])
GO

ALTER TABLE [dbo].[SitePerson_Person] CHECK CONSTRAINT [FK_SitePerson_Person_ProjectData_TeamGroup]
GO

ALTER TABLE [dbo].[SitePerson_Person]  WITH CHECK ADD  CONSTRAINT [FK_SitePerson_Person_ProjectData_WorkArea] FOREIGN KEY([WorkAreaId])
REFERENCES [dbo].[ProjectData_WorkArea] ([WorkAreaId])
GO

ALTER TABLE [dbo].[SitePerson_Person] CHECK CONSTRAINT [FK_SitePerson_Person_ProjectData_WorkArea]
GO



CREATE TABLE [dbo].[Accident_AccidentPersonRecord](
	[AccidentPersonRecordId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[AccidentTypeId] [nvarchar](50) NOT NULL,
	[WorkAreaId] [nvarchar](50) NOT NULL,
	[AccidentDate] [datetime] NOT NULL,
	[PersonId] [nvarchar](50) NOT NULL,
	[Injury] [char](1) NULL,
	[InjuryPart] [nvarchar](50) NULL,
	[HssePersons] [nvarchar](50) NULL,
	[InjuryResult] [nvarchar](500) NULL,
	[PreventiveAction] [nvarchar](500) NULL,
	[HandleOpinion] [nvarchar](500) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Accident_AccidentPersonRecord] PRIMARY KEY CLUSTERED 
(
	[AccidentPersonRecordId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentPersonRecord', @level2type=N'COLUMN',@level2name=N'AccidentPersonRecordId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentPersonRecord', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故类型ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentPersonRecord', @level2type=N'COLUMN',@level2name=N'AccidentTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生区域Id ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentPersonRecord', @level2type=N'COLUMN',@level2name=N'WorkAreaId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentPersonRecord', @level2type=N'COLUMN',@level2name=N'AccidentDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentPersonRecord', @level2type=N'COLUMN',@level2name=N'PersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'伤害情况（1-死亡，2-重伤，3-轻伤）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentPersonRecord', @level2type=N'COLUMN',@level2name=N'Injury'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'受伤部位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentPersonRecord', @level2type=N'COLUMN',@level2name=N'InjuryPart'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'责任区安全员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentPersonRecord', @level2type=N'COLUMN',@level2name=N'HssePersons'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故经过及原因' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentPersonRecord', @level2type=N'COLUMN',@level2name=N'InjuryResult'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'预防事故重复发生的措施' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentPersonRecord', @level2type=N'COLUMN',@level2name=N'PreventiveAction'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处理意见' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentPersonRecord', @level2type=N'COLUMN',@level2name=N'HandleOpinion'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故报告' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentPersonRecord', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentPersonRecord', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentPersonRecord', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentPersonRecord', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE事故(对人员)记录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentPersonRecord'
GO

ALTER TABLE [dbo].[Accident_AccidentPersonRecord]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentPersonRecord_Base_AccidentType] FOREIGN KEY([AccidentTypeId])
REFERENCES [dbo].[Base_AccidentType] ([AccidentTypeId])
GO

ALTER TABLE [dbo].[Accident_AccidentPersonRecord] CHECK CONSTRAINT [FK_Accident_AccidentPersonRecord_Base_AccidentType]
GO

ALTER TABLE [dbo].[Accident_AccidentPersonRecord]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentPersonRecord_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Accident_AccidentPersonRecord] CHECK CONSTRAINT [FK_Accident_AccidentPersonRecord_Base_Project]
GO

ALTER TABLE [dbo].[Accident_AccidentPersonRecord]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentPersonRecord_ProjectData_WorkArea] FOREIGN KEY([WorkAreaId])
REFERENCES [dbo].[ProjectData_WorkArea] ([WorkAreaId])
GO

ALTER TABLE [dbo].[Accident_AccidentPersonRecord] CHECK CONSTRAINT [FK_Accident_AccidentPersonRecord_ProjectData_WorkArea]
GO

ALTER TABLE [dbo].[Accident_AccidentPersonRecord]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentPersonRecord_SitePerson_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[SitePerson_Person] ([PersonId])
GO

ALTER TABLE [dbo].[Accident_AccidentPersonRecord] CHECK CONSTRAINT [FK_Accident_AccidentPersonRecord_SitePerson_Person]
GO

ALTER TABLE [dbo].[Accident_AccidentPersonRecord]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentPersonRecord_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Accident_AccidentPersonRecord] CHECK CONSTRAINT [FK_Accident_AccidentPersonRecord_Sys_User]
GO



CREATE TABLE [dbo].[Accident_AccidentHandle](
	[AccidentHandleId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[AccidentHandleCode] [nvarchar](50) NOT NULL,
	[AccidentHandleName] [nvarchar](50) NOT NULL,
	[AccidentDate] [datetime] NOT NULL,
	[AccidentDef] [nvarchar](100) NULL,
	[Death] [nvarchar](20) NULL,
	[MoneyLoss] [nvarchar](50) NULL,
	[AccidentHandle] [nvarchar](500) NULL,
	[Remark] [nvarchar](500) NULL,
	[States] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_Accident_AccidentHandle] PRIMARY KEY CLUSTERED 
(
	[AccidentHandleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentHandle', @level2type=N'COLUMN',@level2name=N'AccidentHandleId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentHandle', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentHandle', @level2type=N'COLUMN',@level2name=N'AccidentHandleCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentHandle', @level2type=N'COLUMN',@level2name=N'AccidentHandleName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentHandle', @level2type=N'COLUMN',@level2name=N'AccidentDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故摘要' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentHandle', @level2type=N'COLUMN',@level2name=N'AccidentDef'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'伤亡情况' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentHandle', @level2type=N'COLUMN',@level2name=N'Death'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经济损失' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentHandle', @level2type=N'COLUMN',@level2name=N'MoneyLoss'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'善后处理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentHandle', @level2type=N'COLUMN',@level2name=N'AccidentHandle'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentHandle', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentHandle', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentHandle', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentHandle', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE事故(含未遂)处理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentHandle'
GO

ALTER TABLE [dbo].[Accident_AccidentHandle]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentHandle_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Accident_AccidentHandle] CHECK CONSTRAINT [FK_Accident_AccidentHandle_Base_Project]
GO

ALTER TABLE [dbo].[Accident_AccidentHandle]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentHandle_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Accident_AccidentHandle] CHECK CONSTRAINT [FK_Accident_AccidentHandle_Sys_User]
GO




CREATE TABLE [dbo].[Accident_NoFourLetoff](
	[NoFourLetoffId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[AccidentHandleId] [nvarchar](50) NOT NULL,
	[NoFourLetoffCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NULL,
	[AccidentDate] [datetime] NULL,
	[FileContents] [nvarchar](max) NULL,
	[RegistUnitId] [nvarchar](50) NULL,
	[HeadMan] [nvarchar](50) NULL,
	[RegistDate] [datetime] NULL,
 CONSTRAINT [PK_Accident_NoFourLetoff] PRIMARY KEY CLUSTERED 
(
	[NoFourLetoffId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_NoFourLetoff', @level2type=N'COLUMN',@level2name=N'NoFourLetoffId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_NoFourLetoff', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSSE事故(含未遂)处理Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_NoFourLetoff', @level2type=N'COLUMN',@level2name=N'AccidentHandleId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_NoFourLetoff', @level2type=N'COLUMN',@level2name=N'NoFourLetoffCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生事故的单位 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_NoFourLetoff', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发生时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_NoFourLetoff', @level2type=N'COLUMN',@level2name=N'AccidentDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文档' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_NoFourLetoff', @level2type=N'COLUMN',@level2name=N'FileContents'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登记单位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_NoFourLetoff', @level2type=N'COLUMN',@level2name=N'RegistUnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登记人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_NoFourLetoff', @level2type=N'COLUMN',@level2name=N'HeadMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登记日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_NoFourLetoff', @level2type=N'COLUMN',@level2name=N'RegistDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'四不放过表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_NoFourLetoff'
GO

ALTER TABLE [dbo].[Accident_NoFourLetoff]  WITH CHECK ADD  CONSTRAINT [FK_Accident_NoFourLetoff_Accident_AccidentHandle] FOREIGN KEY([AccidentHandleId])
REFERENCES [dbo].[Accident_AccidentHandle] ([AccidentHandleId])
GO

ALTER TABLE [dbo].[Accident_NoFourLetoff] CHECK CONSTRAINT [FK_Accident_NoFourLetoff_Accident_AccidentHandle]
GO

ALTER TABLE [dbo].[Accident_NoFourLetoff]  WITH CHECK ADD  CONSTRAINT [FK_Accident_NoFourLetoff_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Accident_NoFourLetoff] CHECK CONSTRAINT [FK_Accident_NoFourLetoff_Base_Project]
GO

ALTER TABLE [dbo].[Accident_NoFourLetoff]  WITH CHECK ADD  CONSTRAINT [FK_Accident_NoFourLetoff_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Accident_NoFourLetoff] CHECK CONSTRAINT [FK_Accident_NoFourLetoff_Base_Unit]
GO

ALTER TABLE [dbo].[Accident_NoFourLetoff]  WITH CHECK ADD  CONSTRAINT [FK_Accident_NoFourLetoff_Base_Unit1] FOREIGN KEY([RegistUnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Accident_NoFourLetoff] CHECK CONSTRAINT [FK_Accident_NoFourLetoff_Base_Unit1]
GO

ALTER TABLE [dbo].[Accident_NoFourLetoff]  WITH CHECK ADD  CONSTRAINT [FK_Accident_NoFourLetoff_Sys_User] FOREIGN KEY([HeadMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Accident_NoFourLetoff] CHECK CONSTRAINT [FK_Accident_NoFourLetoff_Sys_User]
GO



CREATE TABLE [dbo].[Accident_AccidentReport](
	[AccidentReportId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[AccidentReportCode] [nvarchar](50) NOT NULL,
	[UnitId] [nvarchar](50) NULL,
	[AccidentReportType] [char](1) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[States] [char](1) NULL,
 CONSTRAINT [PK_Accident_AccidentReport] PRIMARY KEY CLUSTERED 
(
	[AccidentReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport', @level2type=N'COLUMN',@level2name=N'AccidentReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport', @level2type=N'COLUMN',@level2name=N'AccidentReportCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型（1-施工单位调查报告，2-总包方调查报告）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport', @level2type=N'COLUMN',@level2name=N'AccidentReportType'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故调查报告' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport', @level2type=N'COLUMN',@level2name=N'FileContent'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'事故调查报告' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accident_AccidentReport'
GO

ALTER TABLE [dbo].[Accident_AccidentReport]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentReport_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Accident_AccidentReport] CHECK CONSTRAINT [FK_Accident_AccidentReport_Base_Project]
GO

ALTER TABLE [dbo].[Accident_AccidentReport]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentReport_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Accident_AccidentReport] CHECK CONSTRAINT [FK_Accident_AccidentReport_Base_Unit]
GO

ALTER TABLE [dbo].[Accident_AccidentReport]  WITH CHECK ADD  CONSTRAINT [FK_Accident_AccidentReport_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Accident_AccidentReport] CHECK CONSTRAINT [FK_Accident_AccidentReport_Sys_User]
GO



