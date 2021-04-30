if not exists (
 select * from syscolumns where name='FValue' 
and [id]=(select [id] from sysobjects where name='Hazard_EnvironmentalRiskItem')
 )
begin
     ALTER TABLE Hazard_EnvironmentalRiskItem ADD FValue INT NULL 
end 
go

if not exists (
 select * from syscolumns where name='GValue' 
and [id]=(select [id] from sysobjects where name='Hazard_EnvironmentalRiskItem')
 )
begin
     ALTER TABLE Hazard_EnvironmentalRiskItem ADD GValue INT NULL 
end 
go

if not exists (
 select * from syscolumns where name='ControlMeasures' 
and [id]=(select [id] from sysobjects where name='Hazard_EnvironmentalRiskItem')
 )
begin
     ALTER TABLE Hazard_EnvironmentalRiskItem ADD ControlMeasures NVARCHAR(200) NULL 
end 
go
if not exists (
 select * from syscolumns where name='Remark' 
and [id]=(select [id] from sysobjects where name='Hazard_EnvironmentalRiskItem')
 )
begin
     ALTER TABLE Hazard_EnvironmentalRiskItem ADD Remark NVARCHAR(200) NULL 
end 
go

if not exists (
 select * from syscolumns where name='WorkAreaName' 
and [id]=(select [id] from sysobjects where name='Hazard_HazardList')
 )
begin
    ALTER TABLE Hazard_HazardList ADD WorkAreaName NVARCHAR(500) NULL
end 
go

if not exists (
 select * from syscolumns where name='IdentificationDate' 
and [id]=(select [id] from sysobjects where name='Hazard_HazardList')
 )
begin
    ALTER TABLE Hazard_HazardList ADD IdentificationDate datetime NULL
end 
go


if not exists (
 select * from syscolumns where name='ControllingPerson' 
and [id]=(select [id] from sysobjects where name='Hazard_HazardList')
 )
begin
    ALTER TABLE Hazard_HazardList ADD ControllingPerson  NVARCHAR(50) NULL
end 
go

if not exists (
 select * from syscolumns where name='EnvironmentalId' 
and [id]=(select [id] from sysobjects where name='Hazard_EnvironmentalRiskItem')
 )
begin
   ALTER TABLE Hazard_EnvironmentalRiskItem ADD EnvironmentalId NVARCHAR(50) NULL
end 
go

UPDATE Hazard_EnvironmentalRiskItem SET Hazard_EnvironmentalRiskItem.EnvironmentalId=B.EnvironmentalId
FROM Technique_Environmental AS B 
WHERE Hazard_EnvironmentalRiskItem.Code =B.Code
GO


if not exists (
 select * from syscolumns where name='ControlMeasures' 
and [id]=(select [id] from sysobjects where name='Technique_Environmental')
 )
begin
   ALTER TABLE Technique_Environmental ADD ControlMeasures NVARCHAR(200) NULL
end 
go


if not exists (
 select * from syscolumns where name='Remark' 
and [id]=(select [id] from sysobjects where name='Technique_Environmental')
 )
begin
 ALTER TABLE Technique_Environmental ADD Remark NVARCHAR(200) NULL
end 
go


if not exists (
 select * from syscolumns where name='ControlMeasures' 
and [id]=(select [id] from sysobjects where name='Hazard_EnvironmentalRiskItem')
 )
begin
	ALTER TABLE Hazard_EnvironmentalRiskItem ADD ControlMeasures NVARCHAR(200) NULL
end 
go

if not exists (
 select * from syscolumns where name='Remark' 
and [id]=(select [id] from sysobjects where name='Hazard_EnvironmentalRiskItem')
 )
begin
	ALTER TABLE Hazard_EnvironmentalRiskItem ADD Remark NVARCHAR(200) NULL
end 
go

UPDATE Sys_MenuProjectB SET Url='Meeting/WeekMeeting.aspx' WHERE MenuId='5236B1D9-8B57-495E-8644-231DF5D066CE'
GO
UPDATE Sys_MenuProjectB SET Url='Meeting/MonthMeeting.aspx' WHERE MenuId='D5DD5EBD-A5F2-4A43-BA4C-E9A242B43684'
GO
UPDATE Sys_MenuProjectB SET Url='Meeting/SpecialMeeting.aspx' WHERE MenuId='BB6CEC48-283B-46AD-BEDD-F964D261698F'
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('1969C3C3-9257-49CD-977D-546CA18DC91C','安全监督检查通知单','ServerCheck/CheckNotice.aspx','Page',5,'A24B7926-EF69-456E-8A24-936D30384680','Menu_Server',1,0)
GO

ALTER TABLE Check_CheckInfo ADD CheckTeamLeader NVARCHAR(50) NULL
GO
ALTER TABLE Check_CheckInfo ADD CompileMan NVARCHAR(50) NULL
GO
ALTER TABLE Check_CheckInfo ADD CompileDate DATETIME NULL
GO

CREATE TABLE [dbo].[Check_CheckInfo_CheckFile](
	[CheckFileId] [nvarchar](50) NOT NULL,
	[CheckInfoId] [nvarchar](50) NULL,
	[CheckFileName] [nvarchar](500) NULL,
	[SortIndex] [int] NULL,
	[Remark] [nvarchar](500) NULL,
 CONSTRAINT [PK_Check_CheckInfo_CheckFile] PRIMARY KEY CLUSTERED 
(
	[CheckFileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Check_CheckInfo_CheckFile]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckInfo_CheckFile_Check_CheckInfo] FOREIGN KEY([CheckInfoId])
REFERENCES [dbo].[Check_CheckInfo] ([CheckInfoId])
GO

ALTER TABLE [dbo].[Check_CheckInfo_CheckFile] CHECK CONSTRAINT [FK_Check_CheckInfo_CheckFile_Check_CheckInfo]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'监督检查主表id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_CheckFile', @level2type=N'COLUMN',@level2name=N'CheckInfoId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查资料名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_CheckFile', @level2type=N'COLUMN',@level2name=N'CheckFileName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_CheckFile', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_CheckFile', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查资料表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_CheckFile'
GO


CREATE TABLE [dbo].[Check_CheckInfo_CheckTeam](
	[CheckTeamId] [nvarchar](50) NOT NULL,
	[CheckInfoId] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Sex] [nvarchar](50) NULL,
	[UnitName] [nvarchar](200) NULL,
	[SortIndex] [int] NULL,
	[PostName] [nvarchar](200) NULL,
	[WorkTitle] [nvarchar](200) NULL,
	[CheckPostName] [nvarchar](200) NULL,
	[CheckDate] [datetime] NULL,
 CONSTRAINT [PK_Check_CheckInfo_CheckTeam] PRIMARY KEY CLUSTERED 
(
	[CheckTeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Check_CheckInfo_CheckTeam]  WITH CHECK ADD  CONSTRAINT [FK_Check_CheckInfo_CheckTeam_Check_CheckInfo] FOREIGN KEY([CheckInfoId])
REFERENCES [dbo].[Check_CheckInfo] ([CheckInfoId])
GO

ALTER TABLE [dbo].[Check_CheckInfo_CheckTeam] CHECK CONSTRAINT [FK_Check_CheckInfo_CheckTeam_Check_CheckInfo]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'监督检查主表id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_CheckTeam', @level2type=N'COLUMN',@level2name=N'CheckInfoId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人员名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_CheckTeam', @level2type=N'COLUMN',@level2name=N'UserName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_CheckTeam', @level2type=N'COLUMN',@level2name=N'Sex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_CheckTeam', @level2type=N'COLUMN',@level2name=N'UnitName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_CheckTeam', @level2type=N'COLUMN',@level2name=N'SortIndex'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_CheckTeam', @level2type=N'COLUMN',@level2name=N'PostName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_CheckTeam', @level2type=N'COLUMN',@level2name=N'WorkTitle'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价小组职务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_CheckTeam', @level2type=N'COLUMN',@level2name=N'CheckPostName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评价日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_CheckTeam', @level2type=N'COLUMN',@level2name=N'CheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检查工作组成员表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Check_CheckInfo_CheckTeam'
GO


ALTER TABLE Sys_Set ALTER COLUMN SetValue NVARCHAR(MAX) NULL
GO
ALTER TABLE Sys_Set ALTER COLUMN SetName NVARCHAR(500) NULL
GO

INSERT INTO Sys_Set(SetId,SetName,IsAuto,SetValue)
VALUES(-100,'安全生产监督检查管理办法',0,'<p style="text-align: center;">
    <strong><span style="font-family: 宋体; font-size: 24px;font-size:18px">安全生产监督检查管理办法</span></strong>
</p>
<p>
    <strong><span style="font-family: 宋体; font-size: 16px;">&nbsp;&nbsp;&nbsp; </span></strong>
</p>
<p style="text-align: center;">
    <strong><span style="font-family: 宋体; font-size: 16px;">目&nbsp; 录</span></strong>
</p>
<p>
    <strong><span style="font-family: 宋体; font-size: 16px;">&nbsp;&nbsp;&nbsp; </span></strong>
</p>
<p style="text-indent: 32px;">
    <span style="font-family: 宋体; font-size: 16px;color:#000000">第一章&nbsp; 总&nbsp; 则</span>
</p>
<p style="text-indent: 32px;">
    <span style="color:#000000"><span style="font-family: 宋体; font-size: 16px;">第二章&nbsp; 职责</span><span style="font-family: 宋体; font-size: 16px;">权限</span></span>
</p>
<p style="text-indent: 32px;">
    <span style="font-family: 宋体; font-size: 16px;color:#000000">第三章&nbsp; 检查层级及频次</span>
</p>
<p style="text-indent: 32px;">
    <span style="font-family: 宋体; font-size: 16px;color:#000000">第四章&nbsp; 检查内容及标准</span>
</p>
<p style="text-indent: 32px;">
    <span style="font-family: 宋体; font-size: 16px;color:#000000">第五章&nbsp; 监督检查实施</span>
</p>
<p style="text-indent: 32px;">
    <span style="font-family: 宋体; font-size: 16px;color:#000000">第六章&nbsp; 检查结果及运用</span>
</p>
<p style="text-indent: 32px;">
    <span style="font-family: 宋体; font-size: 16px;"><span style="color: rgb(0, 0, 255);color:#000000">第七章&nbsp; 附&nbsp; 则</span></span>
</p>
<p style="line-height: 27px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">&nbsp;&nbsp;&nbsp; </span></strong>
</p>
<h3 style="text-align: center; line-height: 27px; page-break-after: auto;">
    <a name="_Toc440901551" href="http://"></a><span style="font-family: 宋体; font-size: 16px;">第一章&nbsp; 总&nbsp; 则</span><strong><span style="font-family: 宋体; font-size: 16px;">&nbsp;&nbsp;&nbsp; </span></strong>
</h3>
<p style="line-height: 27px; text-indent: 31px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第一条&nbsp; </span></strong><span style="font-family: 宋体; font-size: 16px;">为促进中国化学工程集团公司（以下简称集团公司）所属各企业安全发展，夯实安全管理基础，提高安全监督检查效能，防止和减少生产安全事故发生，依据《中华人民共和国安全生产法》、《建筑施工安全检查标准》、《施工企业安全生产评价标准》、《建筑施工企业负责人及项目负责人施工现场带班暂行办法》、《中国化学工程集团公司安全生产管理规定》等有关法规、制度，制定本办法。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第二条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">本办法适用于集团公司及所属企业分别组织的不同层级安全监督检查管理工作。</span>
</p>
<p style="line-height: 27px; text-indent: 32px; -ms-layout-grid-mode: char;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第三条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">安全监督检查按时间、人员、内容等不同，分为以下几种方式，具体含义如下：</span>
</p>
<p style="line-height: 27px; text-indent: 32px; -ms-layout-grid-mode: char;">
    <span style="font-family: 宋体; font-size: 16px;">（一）定期检查：指按照特定周期（时间）组织开展的系统性、综合性检查。</span>
</p>
<p style="line-height: 27px; text-indent: 32px; -ms-layout-grid-mode: char;">
    <span style="font-family: 宋体; font-size: 16px;">（二）不定期检查：指针对重点单位、重点项目、重点区域、特殊环境、生产安全事件等的临时性检查。</span>
</p>
<p style="line-height: 27px; text-indent: 32px; -ms-layout-grid-mode: char;">
    <span style="font-family: 宋体; font-size: 16px;">（三）季节性专项检查：指针对季节的特点，在每年的冬季、夏季、雨季开展专项的检查。</span>
</p>
<p style="line-height: 27px; text-indent: 32px; -ms-layout-grid-mode: char;">
    <span style="font-family: 宋体; font-size: 16px;">（四）节假日检查：指针对节假日前后施工管理人员和作业人员安全意识不强、思想麻痹等特点，在每年的“五一”、“十一”、“元旦”、“春节”等节假日开展的检查。</span>
</p>
<p style="line-height: 27px; text-indent: 32px; -ms-layout-grid-mode: char;">
    <span style="font-family: 宋体; font-size: 16px;">（五）专业检查:指针对事故易发的薄弱环节或管理难度较大的施工机械、临时用电、脚手架、安全防护设施、大型机械设备、消防安全等专业安全问题开展的检查。</span>
</p>
<p style="line-height: 27px; text-indent: 32px; -ms-layout-grid-mode: char;">
    <span style="font-family: 宋体; font-size: 16px;">（六）带班检查：指由企业负责人（法定代表人、总经理）、主管质量安全和生产工作的副总经理、总工程师、副总工程师等带队实施对工程项目质量安全生产状况及项目负责人带班生产情况的检查。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <span style="font-family: 宋体; font-size: 16px;">（七）日常检查：指各级专职安全管理人员在施工现场进行的巡查；各级管理人员在对施工现场进行生产、进度、质量、技术等检查时，同时进行的安全巡查；班组长和班组兼职安全员进行的班前、班中与班后安全检查。&nbsp; </span>
</p>
<p style="line-height: 27px; text-indent: 32px; -ms-layout-grid-mode: char;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<h3 style="text-align: center; line-height: 27px; page-break-after: auto;">
    <a name="_Toc440901552" href="http://"></a><span style="font-family: 宋体; font-size: 16px;">第二章&nbsp; 职责</span><span style="font-family: 宋体; font-size: 16px;">权限</span>
</h3>
<p style="line-height: 27px; text-indent: 32px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第四条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">集团公司安全生产部牵头组织有关部门及集团公司级安全生产专家负责对所属企业总部及项目施工现场的监督检查。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第五条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">各企业安全监督管理部门和负有安全生产职责的部门负责对本企业分支机构、项目施工现场的安全监督检查。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第六条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">各企业分支机构安全监督管理部门和负有安全生产职责的部门负责对本单位项目施工现场的安全监督检查。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第七条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">各级项目经理部安全监督部门和负有安全生产职责的部门负责对本项目施工现场的安全监督检查。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第八条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">各级企业负责人、分支机构负责人负责带班安全监督检查。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第九条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">项目经理负责项目施工现场带班生产及组织项目级监督检查。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第十条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">项目现场专职安全管理人员和负有安全生产职责的人员（施工、技术、质量、材料、设备、人力资源、经营、财务、政工、施工队长、班组长等）负责项目现场的日常检查。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第十一条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">开展安全监督检查工作的各级、各类人员具有检查权、建议权、责令整改权、经济处罚权、警告权、停工权等权力。</span>
</p>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<h3 style="text-align: center; line-height: 27px; page-break-after: auto;">
    <a name="_Toc440901553" href="http://"></a><span style="font-family: 宋体; font-size: 16px;">第三章&nbsp; 检查层级及频次</span>
</h3>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第十二条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">集团公司对所属企业总部的定期监督检查每两年进行一次，对所属企业项目施工现场的不定期或季节性专项监督检查每年开展，并覆盖全部所属企业。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第十三条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">各企业对本企业分支机构的定期监督检查应每年进行一次，对本企业所属项目施工现场的不定期或季节及专业性监督检查应至少每年进行一次，覆盖全部在建项目。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第十四条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">各企业分支机构对本单位项目施工现场的不定期或季节性及专业性监督检查，应至少每年进行两次，覆盖全部在建项目。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第十五条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">项目经理部对施工现场应每月至少进行一次定期安全自查，每月至少进行一次专业性安全检查，在节假日、季节性来临时应开展节假日及季节性安全检查。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第十六条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">项目现场专职安全生产管理人员和负有安全生产职责的人员，应至少每天进行一次日常检查。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第十七条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">企业负责人带班检查及项目负责人带班生产按相关规定执行。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="text-align: center; line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第四章&nbsp; 检查内容及标准</span></strong>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第十八条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">集团公司对所属企业总部、所属企业对分支机构的监督检查，主要查验“五落实五到位”安全生产责任体系的建立及落实、事故隐患排查治理、安全技术、职业健康管理等内容。分别按照《建设公司总部安全监督检查标准》（附件1）、《工程公司总部安全监督检查标准》（附件2）进行量化评分。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第十九条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">集团公司、所属企业及所属企业分支机构对项目施工现场的监督检查、项目部定期自查，主要查验项目部安全生产直接管理主体责任落实、事故隐患排查治理、安全技术、职业健康管理、现场实体防护等内容。分别按照《建设公司项目现场安全监督检查标准》（附件3）、《工程公司项目现场安全监督检查标准》（附件4）进行量化评分。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第二十条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">所属企业及分支机构、项目部对项目现场的节假日、专业性、季节性检查，主要按照不同情况有针对性地进行。所属企业可依据有关标准规范统一编制相应检查表开展检查。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第二十一条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">专职安全生产管理人员和负有安全生产职责人员的日常检查，应按照本岗位安全职责和专业安全要求，开展现场检查。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="text-align: center; line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第五章&nbsp; 监督检查实施</span></strong>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第二十二条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">各级安全监督检查应由3－5人组成工作组，采取“听、查、看、签”的工作方法，即听受检单位的介绍，现场查隐患，看各项制度和记录，并由受检单位签字确认的工作程序。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第二十三条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">各级安全监督检查工作组，工作结果记录（附件1－附件8）应先手工填写，经工作组长审核后，录入各级《安全生产信息化管理系统》，形成电子文档保存。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第二十四条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">总部、项目现场安全监督检查标准中的扣减分值为基准分的最大值，扣完为止，实得分不得为负分。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第二十五条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">各级安全监督检查中发现的事故隐患，检查人员应拍摄照片并填写《安全事故隐患登记表》（附件5），并经受检单位负责人确认，能立即整改的，应立即完成整改；需要限期整改的，应启动各级《安全生产信息化管理系统》中的安全监督平台，进行立项、消项闭环管理。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第二十六条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">集团公司安全监督检查中发现的《企业总部安全生产负面清单》（附件6）、《项目现场安全生产负面清单》（附件7）所列负面内容，实行“零容忍”，应针对负面内容进行罚分并处罚款。罚款金额计算公式：罚分分值×500元。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第二十七条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">集团公司安全监督检查中对企业总部、项目现场安全生产负面清单的罚款，由集团公司安全生产部编制处罚通知书，下发受检企业，由受检企业财务部门上缴集团公司财务部门指定帐户。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="text-align: center; line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第六章&nbsp; 检查结果及应用</span></strong>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第二十八条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">各级安全监督检查结果，由对应的检查标准最终得分与负面清单罚分之差确定，评定为合格、基本合格、不合格三个等级。其中：80分及以上为合格，71－79分为基本合格，70分及以下为不合格。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第二十九条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">各级安全监督检查中对被评定为不合格的单位，应给予警告和停工整改处理。其中，对于因安全管理缺失、失控而存有重大事故隐患的单位应给予停工整改。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <span style="font-family: 宋体; font-size: 16px;">集团公司安全监督检查中对不合格单位的警告处理，由监督检查工作组作出决定，不合格单位的所在企业负责督促其整改，并经监督检查工作组进行复验合格后，撤销警告。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <span style="font-family: 宋体; font-size: 16px;">集团公司级安全监督检查中对不合格单位的停工整改处理，由监督检查工作组提出建议，经集团公司安全生产部审核，履行相关核准程序后，作出停工整改处理决定。不合格单位的所在企业负责督促其整改，并经监督检查工作组进行复验合格后，方可复工。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第三十条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">集团公司安全监督检查工作结束后，监督检查工作组应形成《安全监督检查工作报告》（附件8），并与事故隐患登记表、监督检查标准、负面清单等过程记录，通过集团公司《安全生产信息化管理系统》上传至安全监督平台备查。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第三十一条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">所属企业安全监督检查工作结束后，应及时进行工作总结，并于总结完成后2个工作日内，将工作总结，通过集团公司《安全生产信息化管理系统》上传至安全监督平台备查。</span>
</p>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<h3 style="text-align: center; line-height: 27px; page-break-after: auto;">
    <a name="_Toc440901557" href="http://"></a><span style="font-family: 宋体; font-size: 16px;">第七章&nbsp; 附&nbsp; 则</span>
</h3>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第三十二条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">本办法如与现行国家、行业法律法规、标准规范等相抵触的，按国家、行业法律法规、标准规范执行。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第三十三条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">本办法由集团公司授权安全生产部负责解释。</span>
</p>
<p style="line-height: 27px; text-indent: 32px;">
    <strong><span style="font-family: 宋体; font-size: 16px;">第三十四条</span></strong><span style="font-family: 宋体; font-size: 16px;">&nbsp; </span><span style="font-family: 宋体; font-size: 16px;">本办法自发布之日起施行。原《施工现场质量安全定期检查评价暂行规定》（中国化学集团安发﹝2011﹞187号）同时废止。</span>
</p>
<p>
    <span style="font-family: 宋体;">&nbsp;</span>
</p>
<p>
    <span style="font-family: 宋体;">&nbsp;</span>
</p>
<p>
    <span style="font-family: 宋体;">&nbsp;</span>
</p>
<p>
    <span style="font-family: 宋体; font-size: 14px;"><br clear="all" style="page-break-before: always;"/></span> &nbsp;
</p>
<p>
    <span style="font-family: 宋体;">附件1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><strong><span style="font-family: 宋体; font-size: 19px;">建设公司总部安全监督检查标准</span></strong>
</p>
<p>
    <span style="font-family: 宋体; font-size: 16px;">企业名称：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
</p>
<table cellspacing="0" cellpadding="0">
    <tbody>
        <tr class="firstRow">
            <td width="31" style="padding: 0px 7px; border: 1px solid windowtext; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">序号</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">检查项目</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="374" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">检查标准</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;" colspan="2">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">检查方法</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="216" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">检查结果</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">基准分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">扣减分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">实得分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">1</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">组织</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">保障</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="374" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未设立安全生产委员会或安全生产领导小组，扣10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未按要求设置全生产监督管理职能部门，扣15分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未按要求配备专职安全生产管理人员，每缺1人扣5分。未传达贯彻落实上级安全管理的规定、文件、会议精神，没有记录的，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未按规定召开安全生产委员会会议，并下发会议纪要，每缺一次扣2 分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查企业相关文件， &nbsp; 专职安全管理人员特级资质企业至少6人，总承包壹级资质企业至少4人，查人员相关证件</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="216" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">2</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">安全生产责任</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="374" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未建立健全全员安全生产责任制，扣10分，各部门、各岗位安全生产责任制不健全，每缺1项扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未签订安全生产目标责任书，每缺一个单位扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对安全生产责任书进行考核，扣5分，考核不全面的扣3分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查企业有关制度文本；查企业相关记录。座谈了解有关部门、岗位人员对安全生产责任制的知晓情况</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="216" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">3</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">安全</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">生产</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">费用</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="374" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未制定安全生产费用管理制度，<span style="background: yellow;">扣3分</span>；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全生产费用未<span style="background: yellow;">单独</span>核算，<span style="background: yellow;">扣3分</span>；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未编制年度安全生产费用投入计划，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全生产费用未按规定足额提取、使用，扣5－10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对安全生产费用提取、使用管理情况进行检查和统计分析，<span style="background: yellow;">扣3-5分</span>。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查企业制度、安全生产费用投入使用及管理记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="216" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">4</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">安全</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">教育</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">培训</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="374" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未制定安全培训教育制度，<span style="background: yellow;">扣3分</span>；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未制定安全培训教育年度计划，未按计划实施，扣3-5分；&nbsp; &nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对管理人员进行企业层面的年度继续安全培训教育，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">管理人员企业层面年度继续安全培训教育，学时不够，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立三类人员台帐，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立特种作业人员台帐扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">教育培训课件、考勤、考卷等档案不全、不规范，扣1-3分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查企业制度、相关记录及证书</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="216" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">安全技术管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="374" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未建立安全技术管理体系，扣10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未落实安全技术方案的编制、审核、审批程序，每缺一项，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">企业总部审批专项施工方案无风险识别、安全技术措施、应急措施等，扣3分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对超过一定规模的危险性较大的分部分项工程组织专家论证，扣5-10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未编制文明施工、安全标准化施工图集，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未编制安全技术交底制度，扣3分；制度不全面、不完善的，扣1-2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查企业技术管理制度，相关记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="216" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">6</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">安全 监督 检查</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="374" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未建立安全检查及隐患排查制度，<span style="background: yellow;">扣5分</span>，制度不全面、不完善的，扣1-2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全检查、隐患排查频次、覆盖面不足，扣5分，</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立隐患排查治理台帐，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">企业负责人未按规定组织带班检查，扣5分，检查记录不齐全的，扣1-3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对动土、动火、登高、脚手架、吊装、受限空间等高风险作业许可专项检查，每缺一项，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全检查未涵盖分包方，扣3分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查企业制度、检查记录、对隐患整改消项、处置情况记录，隐患排查统计表等</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="216" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">7</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">设备及安全监测器具管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="374" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未编制设备管理制度，<span style="background: yellow;">扣3分</span>；制度不全面，不完善，扣1－2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未编制安全监测器具管理制度，扣3分；制度不全面、不完善的，扣1-2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立设备台帐，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">设备技术档案或档案资料不齐全的，每起扣1分；</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立设备维护、保养台帐，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未进行设备专业监督检查扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立安全监测器具台帐，扣3分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、查台帐</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="216" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">8</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">职业健康管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="374" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未建立健全职业健康管理制度，<span style="background: yellow;">扣3分</span>；制度不全面、不完善的，扣1-2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立职业健康危害岗位、危害因素及职业健康体检周期清单，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未进行定期职业健康体检，扣10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立职业健康档案，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立职业健康危害场所监测台帐，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">女职工无保护记录，扣5分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、查清单、查记录、档案</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="216" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">9</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">分包方管理</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="374" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未编制分包方管理制度，<span style="background: yellow;">扣3分</span>；制度不全面、不完善的，扣1-2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对分包方进行评价、再评价，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">对分包方评价、再评价不合格，未清退的，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立分包方台帐，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">分包安全管理协议未明确责任、安全投入等要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">劳动防护用品供方未招标集中采购，扣5分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、查台帐、查记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="216" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">化工界区及危险品管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="374" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未编制化工界区（化工生产及储运装置和设施）安全管理制度，扣5分；制度内容未明确化工界区各项施工作业需要遵守的法规和许可管理要求，扣1－3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未制定危险品（放射源、危险化学品、压缩气和液化气等）安全管理制度的，扣5分；制度中未明确对危险品的使用、运输和储存具体要求的，扣1－3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">现场检查过程中未对化工界区、危险品管理等进行专项检查的，扣5分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、查记录</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="216" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">11</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">应急管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="374" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未编制应急管理制度，扣5分；制度不全面、不完善的，扣1-2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未编制综合预案、专项预案、现场处置预案，每缺一项，扣1－3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">各种预案未按预案编制导则要求编制，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未制定应急演习计划，未按计划实施，扣1－2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">应急演习未进行评价，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">综合或专项应急演练少于1次/年，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立应急资源清单，或应急资源与实际不符，扣3分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、查记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="216" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">12</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">事故报告处理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="374" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未建立事故报告调查处理制度,扣5分；制度不全面、不完善的，扣1-2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">发生一般事故，每起扣10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">发生较大及以上事故，扣20分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未按规定及时上报事故，扣10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未按规定落实对事故责任人和责任单位进行责任追究，扣10分；&nbsp; &nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未上报事故结案报告，每起扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">事故发生频率、起数超过与上级签订目标责任书，扣10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">因生产安全事故导致企业资质受到降级处罚，扣10分；&nbsp; &nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">受到暂扣安全生产许可证处罚，每起扣2分； </span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">受当地建设行政主管部门行政处罚，每起扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">受到国家部委行政处罚，每起扣5分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查企业制度、 &nbsp; 查事故报告及处理记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="216" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">20</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">13</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">绩效评价及持续改进</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="374" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未按要求进行管理体系内、外部审核、管理评审的，<span style="background: yellow;">扣3分</span>；&nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未定期向董事会或党政联席会议报告安全生产工作的，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对各种安全生产数据进行分析，并对缺陷制定持续改进措施，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对安全活动进行总结，年度安全工作无总结，扣3分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对适用安全法律法规进行合规性评价，扣2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="216" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">14</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">安全资料管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="374" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未制定安全资料管理制度，<span style="background: yellow;">扣3分</span>；制度不全面、不完善的，扣1-2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全资料未分类归档或归档不规范，扣2-5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立安全资料清单，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立现行的有关安全生产方面的法律、法规、标准、规范清单，未配备有效纸质、电子版本，扣1-3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立危险源、环境因素识别风险评价清单，扣1-3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立各类安全报表台帐，并统计分析，扣1－3分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查相关资料</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="216" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="787" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" colspan="6">
                <p>
                    <span style="font-family: 宋体;">合计分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">150</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="499" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" colspan="4">
                <p>
                    <a name="OLE_LINK1" href="http://"></a><span style="font-family: 宋体;">本表百分制得分＝（实查项实得分之和/实查项应得满分之和×100）&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">综合评定得分＝本表得分－负面清单罚分＝&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="432" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="5">
                <p>
                    <span style="font-family: 宋体;">评定结论</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">□&nbsp; 合格（80分以上）</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">□&nbsp; 基本合格（71-79分）</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">□&nbsp; 不合格（70分以下）</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
        </tr>
        <tr height="0">
            <td width="30" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="40" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="263" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="39" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="55" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="153" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="44" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="41" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="41" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
        </tr>
    </tbody>
</table>
<p>
    <span style="font-family: 宋体; font-size: 16px;">检查人员：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp; 月&nbsp;&nbsp;&nbsp;&nbsp; 日</span>
</p>
<p>
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p>
    <span style="font-family: 宋体; font-size: 16px;">检查组长：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;受检单位负责人：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 年&nbsp;&nbsp;&nbsp; 月&nbsp;&nbsp;&nbsp;&nbsp; 日</span>
</p>
<p>
    <span style="font-family: 宋体;">&nbsp;</span>
</p>
<p>
    <span style="font-family: 宋体;">附件2 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><strong><span style="font-family: 宋体; font-size: 19px;">工程公司总部安全监督检查标准</span></strong>
</p>
<p>
    <span style="font-family: 宋体; font-size: 16px;">企业名称：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
</p>
<table cellspacing="0" cellpadding="0">
    <tbody>
        <tr class="firstRow">
            <td width="31" style="padding: 0px 7px; border: 1px solid windowtext; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">序号</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">检查项目</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="386" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">检查标准</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;" colspan="2">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">检查方法</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">检查结果</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">基准分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">扣减分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">实得分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">1</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">组织</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">保障</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="386" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未设立安全生产委员会或安全生产领导小组，扣10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未按要求设置全生产监督管理职能部门，或未明确安全生产监督管理工作的职能部门，扣15分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未按要求配备专职安全生产管理人员，每缺1人扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未传达贯彻落实上级安全管理的规定、文件、会议精神，没有记录的，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未按规定召开安全生产委员会会议，并下发会议纪要，每缺一次扣2 分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查企业相关文件， &nbsp; 专职安全管理人员勘察设计甲级资质企业至少4人，查人员相关证件</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">2</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">安全生产责任</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="386" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未建立健全全员安全生产责任制，扣10分，各部门、各岗位安全生产责任制不健全，每缺1项扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未签订安全生产目标责任书，每缺一个单位扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对安全生产责任书进行考核，扣5分，考核不全面的，扣3分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查企业有关制度文本；查企业相关记录。座谈了解有关部门、岗位人员对安全生产责任制的知晓情况</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">3</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">安全</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">生产</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">费用</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="386" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未制定安全生产费用管理制度，扣3分；&nbsp; &nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全生产费用未单独核算，扣3分；&nbsp; &nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未编制年度安全生产费用投入计划，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全生产费用未按规定足额提取、使用，扣5－10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对安全生产费用提取、使用管理情况进行检查和统计分析，扣3-5分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查企业制度、安全生产费用投入使用及管理记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">4</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">安全</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">教育</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">培训</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="386" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未制定安全培训教育制度，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未制定安全培训教育年度计划，未按计划实施，扣3-5分；&nbsp; &nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对管理人员进行企业层面的年度继续安全培训教育，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">管理人员企业层面年度继续安全培训教育，学时不够，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立三类人员台帐，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">教育培训课件、考勤、考卷等档案不全、不规范，扣1-3分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查企业制度、相关记录及证书</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">安全设计管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="386" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未建立安全设计管理体系，扣10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立安全设计程序，扣5分</span><span style="font-family: 宋体; font-size: 16px;">；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="margin: 1em 0px;">
                    <span style="font-family: 宋体;">未</span><span style="font-family: 宋体;">应用HAZOP/SIL/HAZARD分析等方法进行内部安全设计审查</span><span style="font-family: 宋体;">，并形成记录，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对“两重点一重大”建设项目在基础设计阶段开展HAZOP分析，并形成记录，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未在总体设计和基础工程设计阶段，进行总平面布置图、装置设备布置图、爆炸危险区域划分图、工艺管道和仪表流程图（PID）、安全联锁/紧急停车系统及安全仪表系统、可燃及有毒物料泄漏检测系统、火炬和安全泄放系统、应急系统和设施等设计文件的安全评审，并形成记录，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全设计变更未按程序提交书面申请，并对变更进行评审、验证和确认，扣3分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查企业技术管理制度，相关记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">6</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">安全 监督 检查</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="386" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未建立安全检查及隐患排查制度，扣5分，制度不全面、不完善的，扣1-3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全检查、隐患排查频次、覆盖面不足，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立隐患排查治理台帐，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">企业负责人未按规定组织带班检查，扣5分，检查记录不齐全的，扣1-3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对动土、动火、登高、脚手架、吊装、受限空间等高风险作业许可专项检查，每缺一项，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全检查未涵盖分包方，扣3分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查企业制度、检查记录、对隐患整改消项、处置情况记录，隐患排查统计表等</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">7</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">设备采购及安全监测器具管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="386" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未编制设备采购安全管理制度，扣3分；制度不全面，不完善，扣1－3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立设备采购台帐，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">采购设备技术档案或档案资料不齐全的，每起扣4分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">设备采购合同中，未明确质量安全责任，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对设备供方进行评价、再评价，并建立清单，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未编制安全监测器具管理制度，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立安全监测器具台帐，扣3分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、查台帐</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">8</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">职业健康管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="386" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未建立健全职业健康管理制度，<span style="background: yellow;">扣3分</span>；制度不全面、不完善的，扣1-2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立职业健康危害岗位、危害因素及职业健康体检周期清单，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未进行定期职业健康体检，扣10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立职业健康档案，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">女职工无保护记录，扣5分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、查清单、查记录、档案</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">9</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">分包方管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="386" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未编制分包方管理制度，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对分包方进行评价、再评价，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">对分包方评价、再评价不合格，未清退的，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立分包方台帐，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">分包安全管理协议未明确责任、安全投入等要求，扣3分。</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、查台帐、查记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">化工界区及危险品管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="386" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未编制化工界区（化工生产及储运装置和设施）安全管理制度，扣5分；制度内容未明确化工界区各项施工作业需要遵守的法规和许可管理要求，扣1－3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未制定危险品（放射源、危险化学品、压缩气和液化气等）安全管理制度的，扣5分；制度中未明确对危险品的使用、运输和储存具体要求的，扣1－3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">现场检查过程中未对化工界区、危险品管理等进行专项检查的，扣5分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、查记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">11</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">应急管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="386" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未编制应急管理制度，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未编制综合预案、专项预案、现场处置预案，每缺一项，扣1－3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">各种预案未按预案编制导则要求编制，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未制定应急演习计划，未按计划实施，扣1－2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">应急演习未进行评价，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">综合或专项应急演练少于1次/年，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立应急资源清单，或应急资源与实际不符，扣3分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、查记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">12</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">事故报告处理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="386" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未建立事故报告调查处理制度,扣5分；制度不全面、不完善的，扣1-2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">发生一般事故，每起扣10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">发生较大及以上事故，扣20分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未按规定及时上报事故，扣10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未按规定落实对事故责任人和责任单位进行责任追究，扣10分；&nbsp; &nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未上报事故结案报告，每起扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">事故发生频率、起数超过与上级签订目标责任书，扣10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">因生产安全事故导致企业资质受到降级处罚，扣10分；&nbsp; &nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">受到暂扣安全生产许可证处罚，每起扣2分； </span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">受当地建设行政主管部门行政处罚，每起扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">受到国家部委行政处罚，每起扣5分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查企业制度、 &nbsp; 查事故报告及处理记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">20</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">13</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">绩效评价及持续改进</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="386" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未按要求进行管理体系内、外部审核、管理评审的，扣3分；&nbsp; &nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未定期向董事会或党政联席会议报告安全生产工作的，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对各种安全生产数据进行分析，并对缺陷制定持续改进措施，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对安全活动进行总结，年度安全工作无总结，扣3分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对适用安全法律法规进行合规性评价，扣2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">14</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">安全资料管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="386" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未制定安全资料管理制度，扣3分；制度不全面、不完善的，扣1-2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全资料未分类归档或归档不规范，扣2-5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立安全资料清单，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立现行的有关安全生产方面的法律、法规、标准、规范清单，未配备有效纸质、电子版本，扣1-3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立危险源、环境因素识别风险评价清单，扣1-3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立各类安全报表台帐，并统计分析，扣1－3分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查相关资料</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="787" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" colspan="6">
                <p>
                    <span style="font-family: 宋体;">合计分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">150</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="499" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" colspan="4">
                <p>
                    <span style="font-family: 宋体;">本表百分制得分＝（实查项实得分之和/实查项应得满分之和×100）&nbsp;&nbsp;&nbsp;&nbsp; 分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">综合评定得分＝本表得分－负面清单罚分＝&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="432" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="5">
                <p>
                    <span style="font-family: 宋体;">评定结论</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">□&nbsp; 合格（80分以上）</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">□&nbsp; 基本合格（71-79分）</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">□&nbsp; 不合格（70分以下）</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
        </tr>
        <tr height="0">
            <td width="30" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="40" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="286" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="29" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="61" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="137" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="43" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="40" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="40" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
        </tr>
    </tbody>
</table>
<p>
    <span style="font-family: 宋体; font-size: 16px;">检查人员：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp; 月&nbsp;&nbsp;&nbsp;&nbsp; 日</span>
</p>
<p>
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p>
    <span style="font-family: 宋体; font-size: 16px;">检查组长：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;受检单位负责人：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 年&nbsp;&nbsp;&nbsp; 月&nbsp;&nbsp;&nbsp;&nbsp; 日</span>
</p>
<p>
    <span style="font-family: 宋体;">&nbsp;</span>
</p>
<p>
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
</p>
<p>
    <span style="font-family: 宋体;">&nbsp;</span>
</p>
<p>
    <span style="font-family: 宋体;">附件3 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><strong><span style="font-family: 宋体; font-size: 19px;">建设公司项目现场安全监督检查标准</span></strong>
</p>
<p>
    <span style="font-family: 宋体;">项目经理部名称： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项目名称：</span>
</p>
<table cellspacing="0" cellpadding="0">
    <tbody>
        <tr class="firstRow">
            <td width="31" style="padding: 0px 7px; border: 1px solid windowtext; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">序号</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">检查项目</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">检查标准</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">检查方法</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">检查结果</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">基准分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">扣减分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">实得分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">1</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">组织</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">保障</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未设立总分包安全生产委员会或安全生产领导小组，扣10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未按要求设置安全生产监督管理职能部门，或未明确安全生产监督管理工作的职能部门，扣10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未按要求配备专职安全生产管理人员，每缺1人扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">项目经理未到岗履职，扣5分；项目经理安全资格不符合要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">专职安全管理人员安全资格不符合要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">施工、技术、质量、设备、材料等人员无化工建设安全岗位证书，每类人员扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未传达贯彻落实上级安全管理的规定、文件、会议精神，没有记录的，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未按规定召开安全生产委员会会议，并下发会议纪要，每缺一次扣2 分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查安全组织机构成立文件、查项目经理任命文件、查项目经理、专职安全管理人员安全资格证书、查施工、技术、质量、设备、材料等人员化工建设安全岗位证书、查相关记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">2</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">安全生产责任</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未建立健全全员安全生产责任制，扣10分，各部门、各岗位安全生产责任制不健全，每缺1项扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对安全生产责任进行履职检查，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未签订安全生产目标责任书，每缺一个单位扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对安全生产责任书进行考核，扣5分，考核不全面的，扣3分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查有关制度文本；查相关记录。座谈了解有关部门、岗位人员对安全生产责任制的知晓情况</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">3</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">安全</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">生产</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">费用</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未制定安全生产费用使用管理制度，扣3分；&nbsp; &nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全生产费用未单独核算，扣3分；&nbsp; &nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未编制年度安全生产费用投入计划，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全生产费用未按规定足额提取、使用，扣5－10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对安全生产费用提取、使用管理情况进行检查和统计分析，扣3-5分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、安全生产费用投入使用及管理记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">4</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">安全</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">教育</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">培训</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未制定安全培训教育制度，扣3分；&nbsp; &nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未制定安全培训教育年度计划，未按计划实施，扣3-5分；&nbsp; &nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立特种作业人员台帐，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">特种作业人员未持有效证件上岗，每发现1人扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">入场教育培训未分类按工种进行，并签订安全责任书，扣3－5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">开复工、节假日前后未进行教育培训，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">“四新”技术应用、新入场、转场、变换工种作业人员未进行培训教育，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未形成班前会安全记录，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">教育培训课件、考勤、考卷等档案不全、不规范，扣1-3分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、相关记录及证书</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">安全技术管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未建立安全技术管理体系不健全，扣2－10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">施工组织设计、专项方案未履行编制、审核、审批程序，每缺一项，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">专项施工方案无风险识别、安全技术措施、应急措施等，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">危险性较大分部分项工程未编制安全专项方案，扣5－10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对超过一定规模的危险性较大的分部分项工程安全专项方案组织专家论证，扣5-10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未编制安全技术交底制度，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">技术人员安全技术交底针对性不强、签字不全，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">技术、质量人员<a name="OLE_LINK2" href="http://"></a>无日常安全检查记录，每类人员扣1分；记录不完整、连续，每类人员扣0.5分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、查技术负责人、专业工程师、技术员、质量工程师、质检员等专业资格、查临电、基坑、脚手架、模板支撑、塔吊、起重吊装、试压、试车等安全方案、查相关记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">6</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">安全检查隐患治理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未建立安全检查及隐患排查制度，各扣5分，制度不全面、不完善的，扣1-3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">项目负责人按规定履行领导带班生产职责，扣5分；带班记录不完整、连续，扣1-2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">施工经理、施工队长无日常安全检查记录，每类人员扣1分；记录不完整、连续，每类人员扣0.5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">专职安全管理人员安全日志不连续、完整，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">项目级每周开展不少于1次的大检查，每缺1次扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">每月未开展项目级综合大检查，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立隐患排查治理台帐，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对动土、动火、登高、脚手架、吊装、受限空间等高风险作业许可专项检查，每缺一项，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全检查资料不完整，隐患整改记录不齐全，每次扣2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、检查记录、对隐患整改消项、处置情况记录，隐患排查治理台帐等</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">7</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: left;">
                    <span style="font-family: 宋体;">危险源、环境因素识 别及 控制</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未按不同施工阶段建立危险源、环境因素识别评价与风险控制清单，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">重大危险源、重要环境因素未对作业人员培训的，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">施工、技术、质量、安全、设备、材料等人员未共同参与危险源、环境因素识别评价的，扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查清单、记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">8</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">设备及安全监测管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未编制施工机具、设备管理制度，扣5分；制度不全面，不完善，扣1-3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未设置设备材料管理部门，配备设备材料管理的专职人员，扣5分；&nbsp; &nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立机具设备管理台帐的，扣1-3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对进场机具设备进行验收的，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未有接地、绝缘电阻测试记录，每项扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">设备、材料、专业电工人员无日常安全检查记录，每类人员扣1分；记录不完整、连续，每类人员扣0.5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未配备风速仪、声级计、力矩扳手、温度计；氧气、有毒有害气体、易燃易爆气体分析仪器、电阻测试器具等，并定期检定，每缺1个，扣0.5分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、查设备、材料、专业电工等资格证书、查资料、现场设备</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">9</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">作业许可</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未制定安全生产作业许可规定的，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">制度不完善，内容欠缺的扣1-2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对作业许可措施进行验收、确认的，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">作业许可证未及时关闭的，扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查动土、动火、登高、射线、吊装、受限空间等许可证</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">职业健康管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未建立健全职业健康管理制度，<span style="background: yellow;">扣3分</span>；制度不全面、不完善的，扣1-2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立职业健康危害岗位及职业健康体检周期清单，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立职业健康危害因素及控制措施清单的，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未进行定期职业健康体检，扣10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立职业健康档案，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">女职工无保护记录，扣5分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、查清单、查记录、档案</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">11</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">分包方管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">分包方安全资质不符合要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">分包方人员安全资格不符合要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对分包方进行安全监督检查，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未签订总分包安全管理协议并明确安全投入要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未进行总分包安全生产总交底，扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2"></td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">12</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">应急管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未编制应急管理制度，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未编制综合预案、专项预案、现场处置预案，每缺一项，扣1-3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">各种预案未按预案编制导则要求编制，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未制定应急演习计划，未按计划实施，扣1-2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">应急演习未进行评价，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">综合或专项应急演练少于2次/年，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立应急资源清单，或应急资源与实际不符，扣2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、预案、演练记录、资料</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">13</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">事故报告处理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未建立事故报告调查处理制度,扣5分；制度不全面、不完善的，扣1-2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未按规定及时上报事故，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">发生一般及以上事故，扣10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未按规定落实对事故责任人和责任单位进行责任追究，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">事故发生频率、起数超过与上级签订目标责任书，扣5分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查企业制度、 &nbsp; 查事故报告及处理记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">14</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">绩效评价及持续改进</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未对安全目标、指标进行监视测量的，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对各种安全生产数据进行分析，并对缺陷制定持续改进措施，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对安全活动进行总结，年度安全工作无总结，扣2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对适用安全法律法规进行合规性评价，扣2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">安全资料管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未制定安全资料管理制度，扣2分；制度不全面、不完善的，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立安全资料清单，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全资料未分类归档或归档不规范，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立现行的有关安全生产方面的法律、法规、标准、规范清单，未配备有效纸质、电子版本，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立各类安全报表台帐，并统计分析，扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查相关资料</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">16</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">安全防护</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">高处作业、安全网挂设不符合要求，扣2-4分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">楼梯口、电梯井口、预留洞口、通道口的安全防护不符合要求，扣2-4分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">阳台、楼梯、楼层、屋面、平台周边等临边防护不符合要求，扣2-4分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全通道不符合要求，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">作业人员劳动防护用品配备不齐全，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">作业人员未正确佩带使用劳动防护用品，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">垂直交叉作业无防护措施，扣2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">17</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">施工机具设备</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未张贴验收合格色标的，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">不符合安全用电要求的，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">操作人员不按安全作业规程使用的，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">无安全防护装置的，扣2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">18</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">基坑支护</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">基坑周边安全防护设施失效，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">基坑周边排水不畅通，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">坑壁支护不符合要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未按要求进行放坡的，扣2分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">基坑周边堆物不符合要求，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">基坑人行上下通道搭设不符合要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对基坑支护进行沉降变形监测并采取应对措施，扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">19</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">脚手架</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">脚手架搭设、安装不符合要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">脚手架未验收并挂牌的，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">脚手架与建筑结构拉结不符合要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">脚手板铺设与防护不符合要求，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">脚手架立面全封闭防护不符合要求，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">脚手架人行通道搭设不符合要求，扣1分； </span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">卸料平台制作、安装不符合要求，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">卸料平台无限载标志，荷载未在规定范围内，扣2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">20</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">模板支架</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">模板支撑系统搭设、安装不符合规范和方案设计要求，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">模板支架未验收并挂牌的，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">混凝土浇筑时未搭设可靠作业平台，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">模板存放不符合要求，扣 2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">模板拆除前未经拆模申请并批准，扣2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">21</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">临时用电</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">外电防护安全距离不符合要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未严格执行 &nbsp; “三级配电、两级保护”TN－S系统的原则，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">现场未做到“一机、一闸、一漏”，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">配电箱安装、电缆架设或埋设不符合要求，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">临时用电重复接地、防雷接地不符合要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">临时用电高压、低压照明系统未分开设置，扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">22</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">物料提升机、吊蓝与 &nbsp; 施工电梯</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未进行安装验收的，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">缆风绳、地锚、附墙装置设置不符合要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">钢丝绳质量及其使用不符合要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全装置失效或不灵敏，发现一项扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">卷扬机钢丝绳拖地无防护，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">使用不安全吊蓝的，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">电梯吊笼出入口、吊蓝进料口未搭设防护棚，扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">23</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">塔吊使用</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">塔吊基础不符合要求，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">设备安全装置不灵敏或失效，发现一项扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">附墙装置不符合要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">用电不符合安全要求的，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未制定群塔作业防碰撞措施，扣 2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">24</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">起重吊装</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">吊车支腿、地基、垫木符合要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">吊索具（钢丝绳、吊带、吊环、卡具等）不符合安全要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">吊装区域未设警戒线，专人监护的，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">吊装物件未使用溜绳控制，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">起重机与外电线路安全距离不足，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">违反“十不吊”要求的，扣 &nbsp; 3分。</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">13</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">25</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">受限空间</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未落实作业许可安全措施，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">作业人员进出无签字确认，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全监护人不在现场监护，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">用电不符合安全要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">动火不符合安全要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">联络及救援方式不符合要求，扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">12</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">26</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">化工界区及危险品管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未落实化工界区施工专项方案要求，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">化工界区动火安全距离、消防措施不符合要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">化工界区受限空间作业未拆除管段或盲板封堵不符合要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">易燃易爆危化品混放储存，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">存放危化品专库防潮、防晒、消防器材配备等安全措施不符合要求，扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">27</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">文明施工</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场未按要求进行视觉形象标识策划、设置大门、围挡和标识标牌，扣3分； </span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">场内道路未保持平整坚实、畅通、无积水，扣1分；&nbsp; &nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">作业场所垃圾、余料未做到“活完场清”，发现一处扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">重大危险源、重要环境因素、职业健康危害因素未设置公示牌，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全警示标志缺失或损坏未及时更换，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">材料、构件堆码放不符合安全要求；扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">8</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">28</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">环境卫生管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">食堂未按规定建立隔油池，废水未经过滤排放，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">食堂卫生、炊事人员证件不符合要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">作业人员宿舍不符合要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未采取有效控制扬尘、施工噪声、废水的措施，扣1分；&nbsp; &nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">有毒有害废弃物未按规定分类存放、回收，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未采取节约用水、用电和用料的措施，扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">6</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">29</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">消防管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场动火、用电区域灭火器配备不符合要求，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">高处动火未采取防火花溅落措施，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">明火作业与易爆易爆品安全距离不符合要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">办公、生活临设区域消防器材配备不符合要求，扣2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">6</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">30</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">临建设施</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">选址不当，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">临建设施不符合消防、用电管理要求，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">办公区、生活区、生产区未独立设置，扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2"></td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="583" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" colspan="5">
                <p>
                    <span style="font-family: 宋体;">合计</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">300</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="499" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" colspan="4">
                <p>
                    <span style="font-family: 宋体;">本表百分制得分＝（实查项实得分之和/实查项应得满分之和×100）&nbsp;&nbsp;&nbsp;&nbsp; 分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">综合评定得分＝本表得分－负面清单罚分＝&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="432" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="5">
                <p>
                    <span style="font-family: 宋体;">评定结论</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">□&nbsp; 合格（80分以上）</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">□&nbsp; 基本合格（71-79分）</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">□&nbsp; 不合格（70分以下）</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
        </tr>
        <tr height="0">
            <td width="30" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="54" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="260" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="30" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="64" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="143" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="44" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="41" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="41" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
        </tr>
    </tbody>
</table>
<p>
    <span style="font-family: 宋体; font-size: 16px;">检查人员：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 年&nbsp;&nbsp;&nbsp; 月&nbsp;&nbsp;&nbsp;&nbsp; 日</span>
</p>
<p>
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p>
    <span style="font-family: 宋体; font-size: 16px;">检查组长：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;受检单位负责人：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 年&nbsp;&nbsp;&nbsp; 月&nbsp;&nbsp;&nbsp;&nbsp; 日</span>
</p>
<p>
    <span style="font-family: 宋体;">附件4 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><strong><span style="font-family: 宋体; font-size: 19px;">工程公司项目现场安全监督检查标准</span></strong>
</p>
<p>
    <span style="font-family: 宋体;">项目经理部名称：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 项目名称：</span>
</p>
<table cellspacing="0" cellpadding="0">
    <tbody>
        <tr class="firstRow">
            <td width="31" style="padding: 0px 7px; border: 1px solid windowtext; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">序号</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">检查</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">项目</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">检查标准</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">检查方法</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">检查结果</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">基准分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">扣减分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">实得分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">1</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">组织</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">保障</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未设立总分包安全生产委员会或安全生产领导小组，扣10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未按要求设置安全生产监督管理职能部门，或未明确安全生产监督管理工作的职能部门，扣10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未按要求配备专职安全生产管理人员，每缺1人扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">项目经理未到岗履职，扣5分；项目经理安全资格不符合要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">专职安全管理人员安全资格不符合要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">施工、技术、质量、设备、材料等人员无化工建设安全岗位证书，每类人员扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未传达贯彻落实上级安全管理的规定、文件、会议精神，没有记录的，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未按规定召开安全生产委员会会议，并下发会议纪要，每缺一次扣2 分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查安全组织机构成立文件、查项目经理任命文件、查项目经理、专职安全管理人员安全资格证书、查施工、技术、质量、设备、材料等人员化工建设安全岗位证书、查相关记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">2</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">安全生产责任</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未建立健全全员安全生产责任制，扣10分，各部门、各岗位安全生产责任制不健全，每缺1项扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对安全生产责任进行履职检查，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未签订安全生产目标责任书，每缺一个单位扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对安全生产责任书进行考核，扣5分，考核不全面的，扣3分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查有关制度文本；查相关记录。座谈了解有关部门、岗位人员对安全生产责任制的知晓情况</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">3</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">安全</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">生产</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">费用</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未制定安全生产费用使用管理制度，扣3分；&nbsp; &nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全生产费用未单独核算，扣3分；&nbsp; &nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未编制年度安全生产费用投入计划，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全生产费用未按规定足额提取、使用，扣5－10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对安全生产费用提取、使用管理情况进行检查和统计分析，扣3-5分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、安全生产费用投入使用及管理记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">4</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">安全</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">教育</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">培训</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未制定安全培训教育制度，扣3分；&nbsp; &nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未制定安全培训教育年度计划，未按计划实施，扣3-5分；&nbsp; &nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立特种作业人员台帐，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">特种作业人员未持有效证件上岗，每发现1人扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">入场教育培训未分类按工种进行，并签订安全责任书，扣3－5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">开复工、节假日前后未进行教育培训，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">“四新”技术应用、新入场、转场、变换工种作业人员未进行培训教育，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未形成班前会安全记录，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">教育培训课件、考勤、考卷等档案不全、不规范，扣1-3分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、相关记录及证书</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">安全技术管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未建立安全技术管理体系不健全，扣2－10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对施工单位的施工组织设计、专项方案进行审核的，每缺一项，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未发现专项施工方案无风险识别、安全技术措施、应急措施等，并要求施工单位整改的，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对危险性较大分部分项工程未编制安全专项方案，扣5－10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未参加超过一定规模的危险性较大的分部分项工程安全专项方案专家论证的，扣5-10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">设计变更未履行程序的，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">对施工单位各专业设计交底无安全技术内容、签字不全，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">技术、质量人员无日常安全检查记录，每类人员扣1分；记录不完整、连续，每类人员扣0.5分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、查技术负责人、专业工程师、技术员、质量工程师、质检员等专业资格、查临电、基坑、脚手架、模板支撑、塔吊、起重吊装、试压、试车等安全方案审核、查相关记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">6</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">安全检查隐患治理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未建立安全检查及隐患排查制度，各扣5分，制度不全面、不完善的，扣1-3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">项目负责人按规定履行领导带班生产职责，扣5分；带班记录不完整、连续，扣1-2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">施工经理、施工队长无日常安全检查记录，每类人员扣1分；记录不完整、连续，每类人员扣0.5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">专职安全管理人员安全日志不连续、完整，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">项目级每周开展不少于1次的大检查，每缺1次扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">每月未开展项目级综合大检查，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立隐患排查治理台帐，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对动土、动火、登高、脚手架、吊装、受限空间等高风险作业许可专项检查，每缺一项，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全检查资料不完整，隐患整改记录不齐全，每次扣2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、检查记录、对隐患整改消项、处置情况记录，隐患排查治理台帐等</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">7</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: left;">
                    <span style="font-family: 宋体;">危险源、环境因素识 别及 控制</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未按不同施工阶段建立危险源、环境因素识别评价与风险控制清单，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">重大危险源、重要环境因素未对作业人员培训的，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">施工、技术、质量、安全、设备、材料等人员未共同参与危险源、环境因素识别评价的，扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查清单、记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">8</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">设备及安全监测管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未编制采购生产设备管理制度，扣5分；制度不全面，不完善，扣1-3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未设置设备材料管理部门，配备设备材料管理的专职人员，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">设备材料仓储不符合安全要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立采购生产设备管理台帐的，扣1-3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对施工单位进场施工机具设备进行验收的，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未有接地、绝缘电阻测试记录，每项扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">设备、材料无日常安全检查记录，每类人员扣1分；记录不完整、连续，每类人员扣0.5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未配备风速仪、声级计、力矩扳手、温度计；氧气、有毒有害气体、易燃易爆气体分析仪器、电阻测试器具等，并定期检定，每缺1个，扣0.5分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、查设备、材料、专业电工等资格证书、查资料、现场设备</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">9</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">作业许可</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未制定安全生产作业许可规定的，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">制度不完善，内容欠缺的扣1-2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对作业许可措施进行验收、确认的，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">作业许可证未及时关闭的，扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查动土、动火、登高、射线、吊装、受限空间等许可证</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">职业健康管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未建立健全职业健康管理制度，<span style="background: yellow;">扣3分</span>；制度不全面、不完善的，扣1-2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立职业健康危害岗位及职业健康体检周期清单，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立职业健康危害因素及控制措施清单的，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未进行定期职业健康体检，扣10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立职业健康档案，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">女职工无保护记录，扣5分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、查清单、查记录、档案</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">11</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">分包方管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">分包方安全资质不符合要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">分包方人员安全资格不符合要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对分包方进行安全监督检查，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未签订总分包安全管理协议并明确安全投入要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未进行总分包安全生产总交底，扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2"></td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">12</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">应急管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未编制应急管理制度，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未编制综合预案、专项预案、现场处置预案，每缺一项，扣1-3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">各种预案未按预案编制导则要求编制，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未制定应急演习计划，未按计划实施，扣1-2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">应急演习未进行评价，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">综合或专项应急演练少于2次/年，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立应急资源清单，或应急资源与实际不符，扣2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查制度、预案、演练记录、资料</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">13</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">事故报告处理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未建立事故报告调查处理制度,扣5分；制度不全面、不完善的，扣1-2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未按规定及时上报事故，扣5分；</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">发生一般及以上事故，扣10分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未按规定落实对事故责任人和责任单位进行责任追究，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">事故发生频率、起数超过与上级签订目标责任书，扣5分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查企业制度、 &nbsp; 查事故报告及处理记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">14</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">绩效评价及持续改进</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未对安全目标、指标进行监视测量的，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对各种安全生产数据进行分析，并对缺陷制定持续改进措施，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对安全活动进行总结，年度安全工作无总结，扣2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对适用安全法律法规进行合规性评价，扣2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">安全资料管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未制定安全资料管理制度，扣2分；制度不全面、不完善的，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立安全资料清单，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全资料未分类归档或归档不规范，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立现行的有关安全生产方面的法律、法规、标准、规范清单，未配备有效纸质、电子版本，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未建立各类安全报表台帐，并统计分析，扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">查相关资料</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">16</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">安全防护</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">高处作业、安全网挂设不符合要求，扣2-4分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">楼梯口、电梯井口、预留洞口、通道口的安全防护不符合要求，扣2-4分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">阳台、楼梯、楼层、屋面、平台周边等临边防护不符合要求，扣2-4分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全通道不符合要求，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">作业人员劳动防护用品配备不齐全，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">作业人员未正确佩带使用劳动防护用品，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">垂直交叉作业无防护措施，扣2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">17</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">施工机具设备</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未张贴验收合格色标的，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">不符合安全用电要求的，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">操作人员不按安全作业规程使用的，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">无安全防护装置的，扣2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">18</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">基坑支护</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">基坑周边安全防护设施失效，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">基坑周边排水不畅通，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">坑壁支护不符合要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未按要求进行放坡的，扣2分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">基坑周边堆物不符合要求，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">基坑人行上下通道搭设不符合要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未对基坑支护进行沉降变形监测并采取应对措施，扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">19</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">脚手架</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">脚手架搭设、安装不符合要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">脚手架未验收并挂牌的，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">脚手架与建筑结构拉结不符合要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">脚手板铺设与防护不符合要求，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">脚手架立面全封闭防护不符合要求，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">脚手架人行通道搭设不符合要求，扣1分； </span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">卸料平台制作、安装不符合要求，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">卸料平台无限载标志，荷载未在规定范围内，扣2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">20</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">模板支架</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">模板支撑系统搭设、安装不符合规范和方案设计要求，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">模板支架未验收并挂牌的，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">混凝土浇筑时未搭设可靠作业平台，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">模板存放不符合要求，扣 2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">模板拆除前未经拆模申请并批准，扣2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">21</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">临时用电</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">外电防护安全距离不符合要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未严格执行 &nbsp; “三级配电、两级保护”TN－S系统的原则，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">现场未做到“一机、一闸、一漏”，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">配电箱安装、电缆架设或埋设不符合要求，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">临时用电重复接地、防雷接地不符合要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">临时用电高压、低压照明系统未分开设置，扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">22</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">物料提升机、吊蓝与 &nbsp; 施工电梯</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未进行安装验收的，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">缆风绳、地锚、附墙装置设置不符合要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">钢丝绳质量及其使用不符合要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全装置失效或不灵敏，发现一项扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">卷扬机钢丝绳拖地无防护，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">使用不安全吊蓝的，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">电梯吊笼出入口、吊蓝进料口未搭设防护棚，扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">23</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">塔吊使用</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">塔吊基础不符合要求，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">设备安全装置不灵敏或失效，发现一项扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">附墙装置不符合要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">用电不符合安全要求的，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未制定群塔作业防碰撞措施，扣 2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">24</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">起重吊装</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">吊车支腿、地基、垫木符合要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">吊索具（钢丝绳、吊带、吊环、卡具等）不符合安全要求，扣3分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">吊装区域未设警戒线，专人监护的，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">吊装物件未使用溜绳控制，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">起重机与外电线路安全距离不足，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">违反“十不吊”要求的，扣 &nbsp; 3分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">13</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">25</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">受限空间</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未落实作业许可安全措施，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">作业人员进出无签字确认，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全监护人不在现场监护，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">用电不符合安全要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">动火不符合安全要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">联络及救援方式不符合要求，扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">12</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">26</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">化工界区及危险品管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未落实化工界区施工专项方案要求，扣5分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">化工界区动火安全距离、消防措施不符合要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">化工界区受限空间作业未拆除管段或盲板封堵不符合要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">易燃易爆危化品混放储存，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">存放危化品专库防潮、防晒、消防器材配备等安全措施不符合要求，扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">27</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">文明施工</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场未按要求进行视觉形象标识策划、设置大门、围挡和标识标牌，扣3分； </span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">场内道路未保持平整坚实、畅通、无积水，扣1分；&nbsp; &nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">作业场所垃圾、余料未做到“活完场清”，发现一处扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">重大危险源、重要环境因素、职业健康危害因素未设置公示牌，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">安全警示标志缺失或损坏未及时更换，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">材料、构件堆码放不符合安全要求；扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">8</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">28</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">环境卫生管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">食堂未按规定建立隔油池，废水未经过滤排放，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">食堂卫生、炊事人员证件不符合要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">对施工单位作业人员宿舍不符合要求未监管，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未采取有效控制扬尘、施工噪声、废水的措施，扣1分；&nbsp; &nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">有毒有害废弃物未按规定分类存放、回收，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">未采取节约用水、用电和用料的措施，扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">6</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">29</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">消防管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场动火、用电区域灭火器配备不符合要求，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">高处动火未采取防火花溅落措施，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">明火作业与易爆易爆品安全距离不符合要求，扣1分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">办公、生活临设区域消防器材配备不符合要求，扣2分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">6</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">30</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">临建设施</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="372" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">选址不当，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">临建设施不符合消防、用电管理要求，扣2分；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">办公区、生活区未独立设置，扣1分。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="120" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="2">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="583" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" colspan="5">
                <p>
                    <span style="font-family: 宋体;">合计</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">300</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="48" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="499" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" colspan="4">
                <p>
                    <span style="font-family: 宋体;">本表百分制得分＝（实查项实得分之和/实查项应得满分之和×100）&nbsp;&nbsp;&nbsp;&nbsp; 分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">综合评定得分＝本表得分－负面清单罚分＝&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 分</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="432" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;" colspan="5">
                <p>
                    <span style="font-family: 宋体;">评定结论</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">□&nbsp; 合格（80分以上）</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">□&nbsp; 基本合格（71-79分）</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">□&nbsp; 不合格（70分以下）</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
        </tr>
        <tr height="0">
            <td width="30" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="54" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="260" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="30" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="64" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="143" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="44" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="41" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
            <td width="41" style="border: 0px rgb(0, 0, 0); border-image: none; background-color: transparent;"></td>
        </tr>
    </tbody>
</table>
<p>
    <span style="font-family: 宋体; font-size: 16px;">检查人员：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp; 月&nbsp;&nbsp;&nbsp;&nbsp; 日</span>
</p>
<p>
    <span style="font-family: 宋体; font-size: 16px;">检查组长：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;受检单位负责人：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 年&nbsp;&nbsp;&nbsp; 月&nbsp;&nbsp;&nbsp;&nbsp; 日</span>
</p>
<p>
    <span style="font-family: 宋体;">附件5</span>
</p>
<p style="text-align: center;">
    <strong><span style="font-family: 宋体; font-size: 19px;">安全事故隐患登记表</span></strong>
</p>
<p>
    <span style="font-family: 宋体; font-size: 16px;">受检单位：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;检查日期：&nbsp;&nbsp;&nbsp; 年&nbsp;&nbsp; 月&nbsp;&nbsp; 日</span>
</p>
<table cellspacing="0" cellpadding="0">
    <tbody>
        <tr class="firstRow">
            <td width="31" style="padding: 0px 7px; border: 1px solid windowtext; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">序号</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">作业类别</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="215" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">隐患源点</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="118" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">存在的风险</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="183" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">相关照片</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="96" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">是否立项</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">整改</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">检查人确认</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="86" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">受检单位</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center;">
                    <span style="font-family: 宋体;">确认人</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
        </tr>
        <tr style="height: 30px;">
            <td width="31" height="30" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="215" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="118" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="183" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="86" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 30px;">
            <td width="31" height="30" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="215" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="118" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="183" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="86" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 30px;">
            <td width="31" height="30" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="215" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="118" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="183" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="86" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 30px;">
            <td width="31" height="30" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="215" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="118" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="183" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="86" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 30px;">
            <td width="31" height="30" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="215" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="118" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="183" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="86" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 30px;">
            <td width="31" height="30" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="215" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="118" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="183" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="86" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 30px;">
            <td width="31" height="30" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="215" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="118" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="183" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="86" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 30px;">
            <td width="31" height="30" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="215" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="118" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="183" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="86" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 30px;">
            <td width="31" height="30" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="215" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="118" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="183" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="86" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 30px;">
            <td width="31" height="30" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="215" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="118" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="183" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="86" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 30px;">
            <td width="31" height="30" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="215" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="118" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="183" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="86" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="945" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" colspan="8">
                <p>
                    <span style="font-family: 宋体;">作业类别：1.临建设施；2.动土作业；3.动火作业；4.临时用电；5.高处作业；6.脚手架搭拆；7.模板支撑；8.起重吊装；9.塔式起重机；10.施工电梯；11.物料提升机；12.施工机具；13.钢结构制作安装；14.管道制作安装；15.设备安装；16.电气仪表安装；17.锅炉安装；18.球罐安装；19.储罐制作安装；20.受限空间作业；21.涂装作业；22.防腐绝热作业；23.吹扫试压；24.单机联动试车；25.投料试生产；26.检维修作业；27.危险化学品；28.其他</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
        </tr>
    </tbody>
</table>
<p>
    <span style="font-family: 宋体;">检查组长：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 受检单位负责人：</span>
</p>
<p style="line-height: 27px;">
    <span style="font-family: 宋体;">附件6</span>
</p>
<p style="text-align: center;">
    <strong><span style="font-family: 宋体; font-size: 19px;">企业总部安全生产负面清单</span></strong>
</p>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">受检单位：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 年&nbsp;&nbsp; 月&nbsp;&nbsp;&nbsp; 日</span>
</p>
<table cellspacing="0" cellpadding="0">
    <tbody>
        <tr class="firstRow">
            <td width="31" style="padding: 0px 7px; border: 1px solid windowtext; border-image: none; background-color: transparent;">
                <p style="text-align: center; -ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">序号</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center; -ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">负面内容</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="420" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center; -ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">判定标准</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center; -ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">罚分分值</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="96" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center; -ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">检查人确认</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center; -ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">受检单位</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center; -ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">确认人</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未建立健全本企业安全生产责任制</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="420" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">责任制未体现“党政同责、一岗双责”、全员、全覆盖；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">责任制未明确责任范围及考核标准；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">3.</span><span style="font-family: 宋体;">未进行监督考核，并建立考核台帐。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未按规定组织召开安全生产委员会会议解决安全生产问题</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="420" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">未建立会议召开记录；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">未下发会议纪要。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">3</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未建立健全本单位安全生产规章制度和操作规程</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="420" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">安全规章制度、操作规程不全，有缺项；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">制度、规程针对性不强、可操作性差。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">4</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未按照规定提取、使用安全生产费用</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="420" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">未建立使用台帐；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">实际使用与提取数额不符。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未按规定对危险性较大分部分项工程进行安全管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="420" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">未建立危险性较大分部分项工程安全管理台帐；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">超过一定规模需专家论证的危险性较大分部分项工程未进行安全监督管理。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">6</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未按照规定开展定期不定期安全检查和生产安全事故隐患排查治理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="420" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">未建立安全检查台帐并统计分析；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">对生产安全事故隐患未建立排查治理台帐。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">7</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未对分包商依法依规进行管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="420" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">违法分包、挂靠、出卖资质；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">分包安全管理协议未明确安全责任、安全投入等内容。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">8</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未严格执行《职业病防治法》要求</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="420" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">未建立健全职业健康档案；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">未定期开展职业健康体检。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">9</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未建立健全生产安全事故应急救援体系</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="420" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">未建立健全应急预案体系；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">未建立各类应急预案演练台帐。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未按规定上报生产安全事故</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="420" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">未建立事故台帐；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">未建立事故上报记录台帐。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="420" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="420" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="420" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="204" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="420" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="235" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" colspan="2">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">合计</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="420" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
    </tbody>
</table>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">说明：1.本表一式三份，检查小组、受检单位各留一份；上报集团公司安全生产主管部门一份。</span>
</p>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.</span><span style="font-family: 宋体; font-size: 16px;">检查小组判定认为有必要进行处罚的其它不符合项，可在空栏里填写。</span>
</p>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;</span>
</p>
<p style="line-height: 27px;">
    <span style="font-family: 宋体;">附件7</span>
</p>
<p style="text-align: center; line-height: 27px;">
    <strong><span style="font-family: 宋体; font-size: 19px;">项目现场安全生产负面清单</span></strong>
</p>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">受检单位：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;年&nbsp;&nbsp; 月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 日</span>
</p>
<table width="931" style="width: 787px;" cellspacing="0" cellpadding="0">
    <tbody>
        <tr class="firstRow">
            <td width="31" valign="top" style="padding: 0px 7px; border: 1px solid windowtext; border-image: none; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体; font-size: 16px;">类型</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="31" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center; -ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">序号</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center; -ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">负面内容</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center; -ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">判定标准</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center; -ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">罚分分值</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center; -ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">检查人确认</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="96" style="border-width: 1px 1px 1px 0px; border-style: solid solid solid none; border-color: windowtext windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; border-image: none; background-color: transparent;">
                <p style="text-align: center; -ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">受检单位</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="text-align: center; -ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">确认人</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" rowspan="9">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体; font-size: 16px;">管理缺陷</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未建立健全本企业安全生产责任制</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">责任制未体现“党政同责、一岗双责”、全员、全覆盖；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">责任制未明确责任范围及考核标准；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">3.</span><span style="font-family: 宋体;">未进行监督考核，并建立考核台帐。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未按规定组织召开安全生产委员会会议解决安全生产问题</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">未建立会议召开记录；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">未下发会议纪要。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">3</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未建立健全本单位安全生产规章制度和操作规程</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">安全规章制度、操作规程不全，有缺项；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">制度、规程针对性不强、可操作性差。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">4</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未按照规定提取、使用安全生产费用</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">未建立使用台帐；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">实际使用与提取数额不符。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未按规定组织开展安全教育培训</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">未分工种、按季节开展针对性安全教育培训，签订安全承诺书；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">特种作业人员未进行专项培训；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">3.</span><span style="font-family: 宋体;">未建立安全教育培训档案。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">6</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未按规定进行安全技术交底</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">安全技术交底无针对性或针对性不强；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">未按照分部、分项工程进行安全技术交底；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">3.</span><span style="font-family: 宋体;">安全技术交底签字不合规。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">7</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未对施工机械设备组织进场验收</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">未建立施工机械设备台帐；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">特种设备未经检验检测合格</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">8</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未按规定编制施工组织设计、专项施工方案</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">未履行编、审、批程序；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">施组、方案无针对性。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">9</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未按规定对危险性较大分部分项工程进行安全管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">未建立危险性较大分部分项工程安全管理台帐；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">超过一定规模需专家论证的危险性较大分部分项工程未进行安全监督管理。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" rowspan="11">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体; font-size: 16px;">管理缺陷</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未按照规定开展定期不定期安全检查和生产安全事故隐患排查治理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">未建立安全检查台帐并统计分析；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">对生产安全事故隐患未建立排查治理台帐。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">11</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未对分包商依法依规进行管理</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">违法分包、挂靠、出卖资质；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">分包安全管理协议未明确安全责任、安全投入等内容。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">12</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未严格执行《职业病防治法》要求</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">未建立健全职业健康档案；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">未定期开展职业健康体检。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">13</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未建立健全生产安全事故应急救援体系</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">未建立健全应急预案体系；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">未建立各类应急预案演练台帐。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">14</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未按规定上报生产安全事故和较大涉险事故</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">未建立事故台帐；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">未建立事故上报记录台帐。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未按要求形成带班生产、施工日志等记录</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">项目经理无带班生产记录或记录不规范；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">专业管理人员无施工日志或记录不规范。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">16</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">安全管理绩效不良</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">因安全管理问题而被建设方、各种主流媒体、各级政府或行业主管部门曝光或通报批评</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">17</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">未规定配备安全监视测量仪器</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">1.</span><span style="font-family: 宋体;">无安全监视测量仪器台帐；</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">2.</span><span style="font-family: 宋体;">安全监视测量仪器未按期检定校准。</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">18</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">委托不具有相应资质的单位承揽施工现场安装拆卸施工起重机械和整体提升脚手架模板等自升式架设设施&nbsp; </span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">安拆单位无相应资质</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="62" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" colspan="2">
                <p style="-ms-layout-grid-mode: char;">
                    <span style="font-family: 宋体;">小计</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">1</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">危险性较大的分部分项工程无安全防护措施或措施不达标</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">1</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" rowspan="10">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体; font-size: 16px;">物的不安全状态</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">2</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">塔吊、物料提升机、施工升降机、施工电梯等未经验收合格使用</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">1</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">3</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">临边、洞口、高处作业无防护措施或措施不达标</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">1</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">4</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">需经作业许可的危险性较大的作业，安全防护措施不落实或不达标</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">1</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">未对因工程施工可能造成损害的毗邻建筑物建筑物和地下管线采取专项保护措施</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">6</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">办公、生活场所未保持畅通的出口，设置符合紧急疏散需要的标志</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">7</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">应急救援器材设备未进行经常性维护保养不能保证正常使用</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">8</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">施工机械、设备、机具安全防护装置缺失或不全</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">9</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">使用未经验收或者验收不合格的整体提升脚手架、模板等自升式架设设施</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">使用危险化学品未根据危险化学的种类特性在库房和作业场所设置相应的监测通风、防晒、防火、防爆、防渗露等安全防护措施</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">11</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">存在明显事故隐患或险情却不采取措施整改</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" rowspan="9">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体; font-size: 16px;">物的不安全状态</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">12</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">使用国家明令淘汰、禁止使用或假冒伪劣防护用品</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">13</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">违反施工用电安全技术规范，造成事故隐患的，如：临时用电线路架设无绝缘保护；设备、工具、开关等带电部分裸露；电力线路、电焊把线绝缘损坏等</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">14</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">在高压线垂直下方进行起重机械等作业，或高压线侧面工作时，安全距离不足或未采取停电等安全技术措施</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">劳动条件恶劣，施工现场脏、乱、差，尘毒危害严重，存在重大事故隐患</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">16</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">氧气、乙炔瓶安全距离不足或倒放，无防晒措施</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">17</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">脚手架不按规范搭设，脚手杆、扣件、脚手板等材质不达标</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">18</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">吊装用钢丝绳、吊环、卡扣、导链等不符合规范要求</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="62" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" colspan="2">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体; font-size: 16px;">小计</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 65px;">
            <td width="31" height="65" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="31" height="65" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">1</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="65" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">不按照作业许可证要求作业（如动火、动土、射线作业、登高、吊装、拆除、受限空间作业等）</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="65" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="65" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="65" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="65" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 44px;">
            <td width="31" height="44" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="31" height="44" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">2</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="44" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">在不具备安全施工条件时，盲目进行施工</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="44" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="44" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="44" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="44" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 38px;">
            <td width="31" height="38" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="31" height="38" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">3</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="38" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">高处作业不系安全带或安全带低挂高用、系挂不牢靠</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="38" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="38" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="38" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="38" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 17px;">
            <td width="31" height="17" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" rowspan="16">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">人的不安全行为</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="31" height="17" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">4</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="17" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">从高处向下抛掷工具、材料、废弃物</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="17" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="17" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="17" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="17" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 40px;">
            <td width="31" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">不沿规定的梯道上、下而攀爬脚手架、构件、设备或乘运料吊笼登高</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 30px;">
            <td width="31" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">6</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">使用不合格的梯子、马凳登高罚款</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 42px;">
            <td width="31" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">7</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">在无保护措施的管道、横梁、轻型屋面板上行走和作业</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 20px;">
            <td width="31" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">8</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">穿硬底、高跟、易滑鞋登高作业</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 24px;">
            <td width="31" height="24" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">9</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="24" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">在无防护的洞口、临边休息与作业</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="24" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="24" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="24" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="24" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 21px;">
            <td width="31" height="21" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">10</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="21" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">无跳板、无操作平台就进行高处作业</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="21" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="21" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="21" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="21" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 21px;">
            <td width="31" height="21" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">11</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="21" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">手持工具、材料爬梯登高</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="21" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="21" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="21" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="21" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 46px;">
            <td width="31" height="46" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">12</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="46" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">在没有任何绝缘防护和监护情况下从事带电作业</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="46" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="46" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="46" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="46" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 41px;">
            <td width="31" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">13</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">将电线芯线直接插入插座或将芯线挂在电源开关上</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 39px;">
            <td width="31" height="39" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">14</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="39" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">在潮湿场所或金属构架上使用Ⅰ类手持式电动工具作业</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="39" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="39" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="39" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="39" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 36px;">
            <td width="31" height="36" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">15</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="36" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">在机器运转时检修、加油、调整、清扫</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="36" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="36" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="36" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="36" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 28px;">
            <td width="31" height="28" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">16</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="28" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">用手代替夹具进行加工件加工</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="28" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="28" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="28" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="28" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 20px;">
            <td width="31" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">17</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">驾驶厂内车辆超速行驶</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 24px;">
            <td width="31" height="24" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">18</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="24" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">驾驶砼翻斗车违章载人</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="24" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="24" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="24" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="24" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 38px;">
            <td width="31" height="38" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">19</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="38" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">搅拌机叶片在运转时，用木棍、铁锹进料斗拨物料</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="38" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="38" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="38" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="38" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 40px;">
            <td width="31" height="40" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" rowspan="12">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">人的不安全行为</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="31" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">20</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">操作旋转机械时，发辫、围巾外露或车床工戴手套作业</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 30px;">
            <td width="31" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">21</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">使用有缺陷的工具、机具作业</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 42px;">
            <td width="31" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">22</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">在禁火区没有办理动火证就进行施工动火</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 61px;">
            <td width="31" height="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">23</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">携带火种、穿钉子鞋或易产生静电火花的衣服进入易燃易爆生产车间、油库、易燃物资仓库</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="61" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 39px;">
            <td width="31" height="39" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">24</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="39" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">在带压、带电和装过易燃易爆、有毒有害介质的设备、容器、管道上施焊</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="39" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="39" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="39" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="39" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 49px;">
            <td width="31" height="49" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">25</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="49" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; -ms-text-justify: inter-ideograph;">
                    <span style="color: windowtext; font-family: 宋体; font-size: 14px;">用汽油、香蕉水等挥发性强的可燃液体擦洗设备、机器和衣物</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="49" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="49" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="49" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="49" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 20px;">
            <td width="31" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">26</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; -ms-text-justify: inter-ideograph;">
                    <span style="color: windowtext; font-family: 宋体; font-size: 14px;">在禁止烟火的地方吸烟和使用明火</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 45px;">
            <td width="31" height="45" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">27</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="45" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; -ms-text-justify: inter-ideograph;">
                    <span style="color: windowtext; font-family: 宋体; font-size: 14px;">冬季施工时采用火烤的方法对氧气瓶、乙炔瓶解冻</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="45" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="45" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="45" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="45" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 41px;">
            <td width="31" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">28</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">在易燃、易爆物上方施焊没有采取隔离防火措施</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 40px;">
            <td width="31" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">29</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">从事动火证与实际动火的等级不相符的动火作业</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 41px;">
            <td width="31" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">30</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">电焊软线与钢丝绳交叉同时拖地使用或在钢丝绳旁施焊</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 40px;">
            <td width="31" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">31</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">进入施工现场不戴安全帽或配戴不规范</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="40" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 72px;">
            <td width="31" height="72" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" rowspan="13">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">人的不安全行为</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="31" height="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">32</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">从事有毒有害作业（如含苯、氟、铅的油漆或涂料、喷砂等）不戴防毒面罩（口罩）</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 41px;">
            <td width="31" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">33</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">从事有飞溅物的工作（如铁屑、木屑、粉尘、火花、泥浆等）不戴护目镜罚款</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 41px;">
            <td width="31" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">34</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; -ms-text-justify: inter-ideograph;">
                    <span style="color: windowtext; font-family: 宋体; font-size: 14px;">起重机在吊物过程中突然变幅、倒退、猛起猛落或用限位装置代替操纵机构</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 47px;">
            <td width="31" height="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">35</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; -ms-text-justify: inter-ideograph;">
                    <span style="color: windowtext; font-family: 宋体; font-size: 14px;">在吊车臂杆和吊物下方行走、停留或作业</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="47" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 44px;">
            <td width="31" height="44" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">36</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="44" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; -ms-text-justify: inter-ideograph;">
                    <span style="color: windowtext; font-family: 宋体; font-size: 14px;">在信号不明、重量不清、光线不足情况下从事起吊作业</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="44" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="44" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="44" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="44" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 42px;">
            <td width="31" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">37</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; -ms-text-justify: inter-ideograph;">
                    <span style="color: windowtext; font-family: 宋体; font-size: 14px;">吊物上有人或放有活动的物件时开车起吊</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 30px;">
            <td width="31" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">38</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; -ms-text-justify: inter-ideograph;">
                    <span style="color: windowtext; font-family: 宋体; font-size: 14px;">吊绳、附件、吊物捆绑不牢进行吊装</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 20px;">
            <td width="31" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">39</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; -ms-text-justify: inter-ideograph;">
                    <span style="color: windowtext; font-family: 宋体; font-size: 14px;">歪拉斜吊或起吊地下物作业</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="20" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 51px;">
            <td width="31" height="51" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">40</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="51" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; -ms-text-justify: inter-ideograph;">
                    <span style="color: windowtext; font-family: 宋体; font-size: 14px;">在六级以上强风、雷雨和大雾天气从事起重吊装作业</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="51" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="51" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="51" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="51" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 24px;">
            <td width="31" height="24" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">41</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="24" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">吊车作业时不垫支腿或支腿不规范</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="24" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="24" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="24" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="24" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 28px;">
            <td width="31" height="28" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">42</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="28" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; -ms-text-justify: inter-ideograph;">
                    <span style="color: windowtext; font-family: 宋体; font-size: 14px;">担负安全监护的人员擅自离开监护岗位</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="28" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="28" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="28" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="28" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 41px;">
            <td width="31" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">43</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">非特种作业人员从事特种作业或特种作业人员不持证上岗</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="41" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 51px;">
            <td width="31" height="51" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">44</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="51" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">不按规定搬运、装卸、储存、使用易燃易爆、化学危险品、有毒有害物品</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="51" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="51" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="51" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="51" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 30px;">
            <td width="31" height="30" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" rowspan="6">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">人的不安全行为</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="31" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">45</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">试压时站在视镜或封头正面</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="30" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 42px;">
            <td width="31" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">46</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">擅自拆除、移动或毁坏安全防护设施、安全标志、消防器材</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="42" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 82px;">
            <td width="31" height="82" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">47</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="82" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">在没有申请和得到批准，没有按规定进行气体分析和安全确认，没有监护人的情况下进入容器、设备、窨井、深坑或其它潮湿、通风不良的场所作业</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="82" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="82" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="82" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="82" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 29px;">
            <td width="31" height="29" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体;">48</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" height="29" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: justify; line-height: normal; -ms-text-justify: inter-ideograph;">
                    <span style="font-family: 宋体; font-size: 14px;">采用挖空底脚和掏洞的方法挖土</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="336" height="29" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">现场查验</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="29" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">0.5</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="108" height="29" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" height="29" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="31" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="62" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" colspan="2">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体; font-size: 16px;">小计</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr>
            <td width="62" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" colspan="2">
                <p style="line-height: 27px;">
                    <span style="font-family: 宋体; font-size: 16px;">合计</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="257" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="336" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="72" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="108" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="96" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
    </tbody>
</table>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">说明：1.本表一式三份，检查小组、受检单位各留一份；上报集团公司安全生产主管部门一份。</span>
</p>
<p style="line-height: 27px;">
    <span style="font-family: 宋体; font-size: 16px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.</span><span style="font-family: 宋体; font-size: 16px;">检查小组判定认为有必要进行处罚的其它不符合项，可在空栏里填写。</span>
</p>
<p>
    <span style="font-family: 宋体;">&nbsp;</span>
</p>
<p>
    <span style="font-family: 宋体; font-size: 14px;"><br clear="all" style="page-break-before: always;"/></span>
</p>
<p>
    <span style="font-family: 宋体;">附件8</span>
</p>
<p style="text-align: center;">
    <strong><span style="font-family: 宋体; font-size: 24px;">&nbsp;</span></strong>
</p>
<p style="text-align: center;">
    <strong><span style="font-family: 宋体; font-size: 24px;">&nbsp;</span></strong>
</p>
<p style="text-align: center; line-height: 200%;">
    <strong><span style="line-height: 200%; font-family: 宋体; font-size: 32px;">中国化学工程集团公司</span></strong>
</p>
<p style="text-align: center; line-height: 200%;">
    <strong><span style="line-height: 200%; font-family: 宋体; font-size: 32px;">&nbsp;</span></strong>
</p>
<p style="text-align: center; line-height: 200%;">
    <strong><span style="line-height: 200%; font-family: 宋体; font-size: 32px;">安 全 监 督 检 查 报 告</span></strong>
</p>
<p style="text-align: center;">
    <strong><span style="font-family: 宋体; font-size: 24px;">&nbsp;</span></strong>
</p>
<p style="text-align: center;">
    <strong><span style="font-family: 宋体; font-size: 24px;">&nbsp;</span></strong>
</p>
<p style="text-align: center;">
    <strong><span style="font-family: 宋体; font-size: 24px;">&nbsp;</span></strong>
</p>
<p style="text-align: center;">
    <strong><span style="font-family: 宋体; font-size: 24px;">&nbsp;</span></strong>
</p>
<p style="text-align: center;">
    <strong><span style="font-family: 宋体; font-size: 24px;">&nbsp;</span></strong>
</p>
<p style="line-height: 150%; text-indent: 74px;">
    <strong><span style="line-height: 150%; font-family: 宋体; font-size: 21px;">受检单位：______________________________</span></strong>
</p>
<p style="line-height: 150%; text-indent: 74px;">
    <strong><span style="line-height: 150%; font-family: 宋体; font-size: 21px;">受检单位地址：__________________________</span></strong>
</p>
<p style="line-height: 150%; text-indent: 74px;">
    <strong><span style="line-height: 150%; font-family: 宋体; font-size: 21px;">受检单位负责人：________________________</span></strong>
</p>
<p style="line-height: 150%; text-indent: 74px;">
    <strong><span style="line-height: 150%; font-family: 宋体; font-size: 21px;">受检单位负责人电话：____________________</span></strong>
</p>
<p>
    <strong><span style="font-family: 宋体; font-size: 21px;">&nbsp;</span></strong>
</p>
<p>
    <strong><span style="font-family: 宋体; font-size: 21px;">&nbsp;</span></strong>
</p>
<p style="text-align: center;">
    <strong><span style="font-family: 宋体; font-size: 21px;">&nbsp; </span></strong><strong><span style="font-family: 宋体; font-size: 21px;">检查日期：&nbsp;&nbsp; 年&nbsp; 月&nbsp; 日至&nbsp; 月&nbsp; 日</span></strong>
</p>
<p style="text-align: center;">
    <strong><span style="font-family: 宋体; font-size: 24px;">&nbsp;</span></strong>
</p>
<p style="text-align: center;">
    <strong><span style="font-family: 宋体; font-size: 24px;">&nbsp;</span></strong>
</p>
<p style="text-align: center;">
    <strong><span style="font-family: 宋体; font-size: 24px;">&nbsp;</span></strong>
</p>
<p style="text-align: center;">
    <strong><span style="font-family: 宋体; font-size: 24px;">中国化学工程集团公司安全生产部监制</span></strong>
</p>
<p>
    <span style="font-family: 宋体;">&nbsp;</span>
</p>
<table cellspacing="0" cellpadding="0">
    <tbody>
        <tr class="firstRow">
            <td width="568" valign="top" style="padding: 0px 7px; border: 1px solid windowtext; border-image: none; background-color: transparent;" colspan="7">
                <p style="margin: 0px 0px 0px 28px;">
                    <span style="font-family: 宋体;">一、</span><span style="font-family: 宋体;">检查目的</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="margin: 0px 0px 0px 28px;">
                    <span style="font-family: 宋体;">二、</span><span style="font-family: 宋体;">依据</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p style="margin: 0px 0px 0px 28px;">
                    <span style="font-family: 宋体;">三、</span><span style="font-family: 宋体;">受检单位（项目）安全管理基本情况</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">四、符合项</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">五、不符合项</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">六、改进建议</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">七、检查结论</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
        </tr>
        <tr style="height: 18px;">
            <td width="568" height="18" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;" colspan="7">
                <p>
                    <span style="font-family: 宋体;">八、检查工作组成员</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
        </tr>
        <tr style="height: 29px;">
            <td width="91" height="29" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">姓名</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="36" height="29" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">性别</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="157" height="29" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">所在单位</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="59" height="29" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">所在单位职务</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="60" height="29" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">职称</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="72" height="29" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p>
                    <span style="font-family: 宋体;">检查工作</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">组职务</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
            <td width="93" height="29" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;">
                <p style="text-align: left;">
                    <span style="font-family: 宋体;">检查日期</span> &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
                <p>
                    <span style="font-family: 宋体;">&nbsp;</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </p>
            </td>
        </tr>
        <tr style="height: 34px;">
            <td width="91" height="34" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="36" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="157" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="59" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="60" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="72" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="93" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 34px;">
            <td width="91" height="34" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="36" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="157" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="59" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="60" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="72" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="93" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 34px;">
            <td width="91" height="34" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="36" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="157" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="59" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="60" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="72" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="93" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 34px;">
            <td width="91" height="34" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="36" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="157" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="59" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="60" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="72" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="93" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
        <tr style="height: 34px;">
            <td width="91" height="34" valign="top" style="border-width: 0px 1px 1px; border-style: none solid solid; border-color: rgb(0, 0, 0) windowtext windowtext; padding: 0px 7px; border-image: none; background-color: transparent;"></td>
            <td width="36" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="157" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="59" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="60" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="72" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
            <td width="93" height="34" valign="top" style="border-width: 0px 1px 1px 0px; border-style: none solid solid none; border-color: rgb(0, 0, 0) windowtext windowtext rgb(0, 0, 0); padding: 0px 7px; background-color: transparent;"></td>
        </tr>
    </tbody>
</table>
<p>
    <span style="font-family: 宋体;"><br/></span>
</p>')
GO