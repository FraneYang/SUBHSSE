CREATE TABLE [dbo].[InformationProject_FileCabinetA](
	[FileCabinetAId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[MenuId] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](100) NULL,
	[SupFileCabinetAId] [nvarchar](50) NULL,
	[IsEndLever] [bit] NULL,
 CONSTRAINT [PK_InformationProject_FileCabinetA] PRIMARY KEY CLUSTERED 
(
	[FileCabinetAId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[InformationProject_FileCabinetA]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_FileCabinetA_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[InformationProject_FileCabinetA] CHECK CONSTRAINT [FK_InformationProject_FileCabinetA_Base_Project]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ļ���Aid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_FileCabinetA', @level2type=N'COLUMN',@level2name=N'FileCabinetAId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ŀid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_FileCabinetA', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_FileCabinetA', @level2type=N'COLUMN',@level2name=N'MenuId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ļ���A��Դ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_FileCabinetA', @level2type=N'COLUMN',@level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ļ���A����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_FileCabinetA', @level2type=N'COLUMN',@level2name=N'Title'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�ĩ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_FileCabinetA', @level2type=N'COLUMN',@level2name=N'IsEndLever'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ļ���A��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_FileCabinetA'
GO

CREATE TABLE [dbo].[InformationProject_FileCabinetAItem](
	[FileCabinetAItemId] [nvarchar](50) NOT NULL,
	[FileCabinetAId] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[Title] [nvarchar](800) NULL,
	[FileContent] [nvarchar](max) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
	[Remark] [nvarchar](2000) NULL,
	[AttachUrl] [nvarchar](2000) NULL,
	[IsMenu] [bit] NULL,
	[Url] [nvarchar](500) NULL,
 CONSTRAINT [PK_InformationProject_FileCabinetAItem] PRIMARY KEY CLUSTERED 
(
	[FileCabinetAItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[InformationProject_FileCabinetAItem]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_FileCabinetAItem_InformationProject_FileCabinetA] FOREIGN KEY([FileCabinetAId])
REFERENCES [dbo].[InformationProject_FileCabinetA] ([FileCabinetAId])
GO

ALTER TABLE [dbo].[InformationProject_FileCabinetAItem] CHECK CONSTRAINT [FK_InformationProject_FileCabinetAItem_InformationProject_FileCabinetA]
GO

ALTER TABLE [dbo].[InformationProject_FileCabinetAItem]  WITH CHECK ADD  CONSTRAINT [FK_InformationProject_FileCabinetAItem_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[InformationProject_FileCabinetAItem] CHECK CONSTRAINT [FK_InformationProject_FileCabinetAItem_Sys_User]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ļ���A��ϸid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_FileCabinetAItem', @level2type=N'COLUMN',@level2name=N'FileCabinetAItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ļ���A����id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_FileCabinetAItem', @level2type=N'COLUMN',@level2name=N'FileCabinetAId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ϸ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_FileCabinetAItem', @level2type=N'COLUMN',@level2name=N'Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ϸ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_FileCabinetAItem', @level2type=N'COLUMN',@level2name=N'Title'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_FileCabinetAItem', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_FileCabinetAItem', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_FileCabinetAItem', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�ϵͳ�˵�ҳ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_FileCabinetAItem', @level2type=N'COLUMN',@level2name=N'IsMenu'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ݲ鿴·��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_FileCabinetAItem', @level2type=N'COLUMN',@level2name=N'Url'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ļ���A��ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_FileCabinetAItem'
GO


CREATE TABLE [dbo].[Administrative_CarManager](
	[CarManagerId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NOT NULL,
	[CarManagerCode] [nvarchar](50) NOT NULL,
	[CarName] [nvarchar](50) NULL,
	[CarModel] [nvarchar](50) NULL,
	[BuyDate] [datetime] NULL,
	[LastYearCheckDate] [datetime] NULL,
	[Remark] [nvarchar](500) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_Administrative_CarManager] PRIMARY KEY CLUSTERED 
(
	[CarManagerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_CarManager', @level2type=N'COLUMN',@level2name=N'CarManagerId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ĿID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_CarManager', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_CarManager', @level2type=N'COLUMN',@level2name=N'CarManagerCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_CarManager', @level2type=N'COLUMN',@level2name=N'CarName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_CarManager', @level2type=N'COLUMN',@level2name=N'CarModel'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_CarManager', @level2type=N'COLUMN',@level2name=N'BuyDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��һ���������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_CarManager', @level2type=N'COLUMN',@level2name=N'LastYearCheckDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_CarManager', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_CarManager', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_CarManager', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ֳ���������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_CarManager'
GO

ALTER TABLE [dbo].[Administrative_CarManager]  WITH CHECK ADD  CONSTRAINT [FK_Administrative_CarManager_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Administrative_CarManager] CHECK CONSTRAINT [FK_Administrative_CarManager_Base_Project]
GO



CREATE TABLE [dbo].[Administrative_HealthManage](
	[HealthManageId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[PersonId] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[Bloodtype] [nvarchar](10) NULL,
	[HealthState] [nvarchar](10) NULL,
	[Taboo] [nvarchar](50) NULL,
	[CheckTime] [datetime] NULL,
	[Remark] [nvarchar](150) NULL,
 CONSTRAINT [PK_HSSE_Administrative_HealthManage] PRIMARY KEY CLUSTERED 
(
	[HealthManageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ա' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_HealthManage', @level2type=N'COLUMN',@level2name=N'PersonId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_HealthManage', @level2type=N'COLUMN',@level2name=N'Age'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ѫ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_HealthManage', @level2type=N'COLUMN',@level2name=N'Bloodtype'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����״��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_HealthManage', @level2type=N'COLUMN',@level2name=N'HealthState'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_HealthManage', @level2type=N'COLUMN',@level2name=N'Taboo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_HealthManage', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ְҵ���������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_HealthManage'
GO

ALTER TABLE [dbo].[Administrative_HealthManage]  WITH CHECK ADD  CONSTRAINT [FK_Administrative_HealthManage_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Administrative_HealthManage] CHECK CONSTRAINT [FK_Administrative_HealthManage_Base_Project]
GO

ALTER TABLE [dbo].[Administrative_HealthManage]  WITH CHECK ADD  CONSTRAINT [FK_HSSE_Administrative_HealthManage_Sys_User] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Administrative_HealthManage] CHECK CONSTRAINT [FK_HSSE_Administrative_HealthManage_Sys_User]
GO


ALTER TABLE Check_CheckDay ADD States CHAR(1) null
GO
ALTER TABLE Check_CheckSpecial ADD States CHAR(1) null
GO
ALTER TABLE Check_CheckColligation ADD States CHAR(1) null
GO
ALTER TABLE Check_CheckWork ADD States CHAR(1) null
GO
ALTER TABLE Check_CheckDay ADD CompileMan nvarchar(50) null
GO
ALTER TABLE Check_CheckSpecial ADD CompileMan nvarchar(50) null
GO
ALTER TABLE Check_CheckColligation ADD CompileMan nvarchar(50) null
GO
ALTER TABLE Check_CheckWork ADD CompileMan nvarchar(50) null
GO
ALTER TABLE Check_CheckHoliday ADD States CHAR(1) null
GO
ALTER TABLE Check_CheckHoliday ADD CompileMan nvarchar(50) null
GO
ALTER TABLE Check_RectifyNotice ADD States CHAR(1) null
GO
ALTER TABLE Check_RectifyNotice ADD CompileMan nvarchar(50) null
GO
ALTER TABLE Check_PauseNotice ADD States CHAR(1) null
GO
ALTER TABLE Check_PauseNotice ADD CompileMan nvarchar(50) null
GO


ALTER PROCEDURE [dbo].[SpCheckDayStatistic]     
@ProjectId nvarchar(50),
@StartTime nvarchar(15)=null,        
@EndTime nvarchar(15)=null,
@States char(1)=null         
AS      
BEGIN    

SELECT 	CheckDayDetail.CheckDayDetailId
	,CheckDay.CheckDayId
	,CheckDay.CheckDayId+','+ISNULL(CheckDayDetail.CheckDayDetailId,'') AS NewChcekId
	,CodeRecords.Code AS CheckDayCode
	,Checks.CheckCount
	,WorkArea.WorkAreaName
	,Unit.UnitName
	,CheckDayDetail.CompleteStatus
	,CONVERT(varchar(100), CheckDayDetail.LimitedDate, 23) as LimitedDate
	,CheckDayDetail.CompletedDate
	,CheckDay.CheckPerson
	,CONVERT(varchar(100), CheckDay.CheckTime, 23) as CheckTime
	--,CheckDay.CheckTime
	,CheckDayDetail.CheckItemType
	,CheckDayDetail.CheckItem
	,CheckDayDetail.HandleStep
	,(CASE WHEN CheckDay.States='0' OR CheckDay.States IS NULL THEN '��['+Users.UserName+']�ύ' WHEN CheckDay.States='2' THEN '���/�������' ELSE '��['+OperateUser.UserName+']����' END) AS  FlowOperateName
from Check_CheckDay AS CheckDay 
LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckDay.CheckDayId=CodeRecords.DataId
LEFT JOIN Check_CheckDayDetail  AS CheckDayDetail on CheckDayDetail.CheckDayId = CheckDay.CheckDayId    
LEFT JOIN ProjectData_WorkArea AS WorkArea on WorkArea.WorkAreaId=CheckDayDetail.CheckArea        
LEFT JOIN Base_Unit AS Unit on Unit.UnitId=CheckDayDetail.UnitId        
LEFT JOIN (SELECT COUNT(*)  AS CheckCount, CheckDayId 
			FROM Check_CheckDayDetail GROUP BY CheckDayId) AS Checks ON Checks.CheckDayId = CheckDay.CheckDayId 
LEFT JOIN Sys_FlowOperate AS FlowOperate ON CheckDay.CheckDayId=FlowOperate.DataId AND FlowOperate.IsClosed <> 1
LEFT JOIN Sys_User AS OperateUser ON FlowOperate.OperaterId=OperateUser.UserId
LEFT JOIN Sys_User AS Users ON CheckDay.CompileMan=Users.UserId
WHERE  (@StartTime is null or CheckDay.CheckTime>=@StartTime) 
		and (@EndTime is null or CheckDay.CheckTime <=@EndTime ) 
		and CheckDay.ProjectId=@ProjectId
		and (@States is null or CheckDay.States=@States) 

order by CheckDayCode desc
   
END






GO

ALTER PROCEDURE [dbo].[SpCheckSpecialStatistic]     
@ProjectId nvarchar(50),
@StartTime nvarchar(15)=null,        
@EndTime nvarchar(15)=null,
@States char(1)=null            
AS      
BEGIN    

SELECT 	CheckSpecialDetail.CheckSpecialDetailId
	,CheckSpecial.CheckSpecialId
	,CheckSpecial.CheckSpecialId+','+ISNULL(CheckSpecialDetail.CheckSpecialDetailId,'') AS NewChcekId
	,CodeRecords.Code AS CheckSpecialCode
	,Checks.CheckCount
	,WorkArea.WorkAreaName
	,Unit.UnitName
	,CheckSpecialDetail.CompleteStatus
	,CONVERT(varchar(100), CheckSpecialDetail.LimitedDate, 23) as LimitedDate
	,CheckSpecialDetail.CompletedDate
	,CheckSpecial.CheckPerson
	,user1.UserName as CheckPersonName
	,CONVERT(varchar(100), CheckSpecial.CheckTime, 23) as CheckTime
	--,CheckSpecial.CheckTime
	,CheckSpecialDetail.CheckItemType
	,CheckSpecialDetail.CheckItem
	,CheckSpecialDetail.HandleStep
	,(CASE WHEN CheckSpecial.States='0' OR CheckSpecial.States IS NULL THEN '��['+Users.UserName+']�ύ' WHEN CheckSpecial.States='2' THEN '���/�������' ELSE '��['+OperateUser.UserName+']����' END) AS  FlowOperateName
from Check_CheckSpecial AS CheckSpecial 
LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckSpecial.CheckSpecialId=CodeRecords.DataId
LEFT JOIN Sys_User AS user1 ON CheckSpecial.CheckPerson=user1.UserId
LEFT JOIN Check_CheckSpecialDetail  AS CheckSpecialDetail on CheckSpecialDetail.CheckSpecialId = CheckSpecial.CheckSpecialId    
LEFT JOIN ProjectData_WorkArea AS WorkArea on WorkArea.WorkAreaId=CheckSpecialDetail.CheckArea        
LEFT JOIN Base_Unit AS Unit on Unit.UnitId=CheckSpecialDetail.UnitId        
LEFT JOIN (SELECT COUNT(*)  AS CheckCount, CheckSpecialId 
			FROM Check_CheckSpecialDetail GROUP BY CheckSpecialId) AS Checks ON Checks.CheckSpecialId = CheckSpecial.CheckSpecialId 
LEFT JOIN Sys_FlowOperate AS FlowOperate ON CheckSpecial.CheckSpecialId=FlowOperate.DataId AND FlowOperate.IsClosed <> 1
LEFT JOIN Sys_User AS OperateUser ON FlowOperate.OperaterId=OperateUser.UserId
LEFT JOIN Sys_User AS Users ON CheckSpecial.CompileMan=Users.UserId
WHERE  (@StartTime is null or CheckSpecial.CheckTime>=@StartTime) 
		and (@EndTime is null or CheckSpecial.CheckTime <=@EndTime ) 
		and CheckSpecial.ProjectId=@ProjectId
		and (@States is null or CheckSpecial.States=@States) 

order by CheckSpecialCode desc
   
END








GO

ALTER PROCEDURE [dbo].[SpCheckColligationStatistic]     
@ProjectId nvarchar(50),
@StartTime nvarchar(15)=null,        
@EndTime nvarchar(15)=null,
@States char(1)=null          
AS      
BEGIN    

SELECT 	CheckColligationDetail.CheckColligationDetailId
	,CheckColligation.CheckColligationId
	,CheckColligation.CheckColligationId+','+ISNULL(CheckColligationDetail.CheckColligationDetailId,'') AS NewChcekId
	,CodeRecords.Code AS CheckColligationCode
	,Checks.CheckCount
	,WorkArea.WorkAreaName
	,Unit.UnitName
	,CheckColligationDetail.CompleteStatus
	,CONVERT(varchar(100), CheckColligationDetail.LimitedDate, 23) as LimitedDate
	,CheckColligationDetail.CompletedDate
	,CheckColligation.CheckPerson
	,user1.UserName as CheckPersonName
	,CONVERT(varchar(100), CheckColligation.CheckTime, 23) as CheckTime
	--,CheckColligation.CheckTime
	,CheckColligationDetail.CheckItemType
	,CheckColligationDetail.CheckItem
	,CheckColligationDetail.HandleStep
	,(CASE WHEN CheckColligation.States='0' OR CheckColligation.States IS NULL THEN '��['+Users.UserName+']�ύ' WHEN CheckColligation.States='2' THEN '���/�������' ELSE '��['+OperateUser.UserName+']����' END) AS  FlowOperateName
from Check_CheckColligation AS CheckColligation 
LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckColligation.CheckColligationId=CodeRecords.DataId
LEFT JOIN Sys_User AS user1 ON CheckColligation.CheckPerson=user1.UserId
LEFT JOIN Check_CheckColligationDetail  AS CheckColligationDetail on CheckColligationDetail.CheckColligationId = CheckColligation.CheckColligationId    
LEFT JOIN ProjectData_WorkArea AS WorkArea on WorkArea.WorkAreaId=CheckColligationDetail.CheckArea        
LEFT JOIN Base_Unit AS Unit on Unit.UnitId=CheckColligationDetail.UnitId        
LEFT JOIN (SELECT COUNT(*)  AS CheckCount, CheckColligationId 
			FROM Check_CheckColligationDetail GROUP BY CheckColligationId) AS Checks ON Checks.CheckColligationId = CheckColligation.CheckColligationId 
LEFT JOIN Sys_FlowOperate AS FlowOperate ON CheckColligation.CheckColligationId=FlowOperate.DataId AND FlowOperate.IsClosed <> 1
LEFT JOIN Sys_User AS OperateUser ON FlowOperate.OperaterId=OperateUser.UserId
LEFT JOIN Sys_User AS Users ON CheckColligation.CompileMan=Users.UserId
WHERE  (@StartTime is null or CheckColligation.CheckTime>=@StartTime) 
		and (@EndTime is null or CheckColligation.CheckTime <=@EndTime ) 
		and CheckColligation.ProjectId=@ProjectId
		and (@States is null or CheckColligation.States=@States) 

order by CheckColligationCode desc
   
END
GO

ALTER TABLE dbo.Administrative_ManageCheck  ADD States CHAR(1)
ALTER TABLE dbo.Administrative_ManageCheck  ADD CompileMan NVARCHAR(50)
ALTER TABLE dbo.Administrative_ManageCheck  ADD CompileDate DATETIME
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_ManageCheck', @level2type=N'COLUMN',@level2name=N'States'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_ManageCheck', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_ManageCheck', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO


ALTER TABLE [dbo].[Administrative_ManageCheck]  WITH CHECK ADD  CONSTRAINT [FK_Administrative_ManageCheck_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Administrative_ManageCheck] CHECK CONSTRAINT [FK_Administrative_ManageCheck_Sys_User]
GO

ALTER TABLE dbo.Administrative_CarManager ADD States CHAR(1)
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Administrative_CarManager', @level2type=N'COLUMN',@level2name=N'States'
GO

ALTER TABLE [dbo].[Administrative_CarManager]  WITH CHECK ADD  CONSTRAINT [FK_Administrative_CarManager_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Administrative_CarManager] CHECK CONSTRAINT [FK_Administrative_CarManager_Sys_User]
GO
