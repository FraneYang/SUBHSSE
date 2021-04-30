INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('17C25222-FDFD-469E-9AEE-33058FF1A3EE','汇总清单','Check/SummaryList.aspx','PageHeaderFooter',110,'467A0CB9-737D-4451-965E-869EBC3A4BD6','Menu_Project',1,0)
GO

CREATE VIEW [dbo].[View_SummaryList]
AS
/*人员培训查询*/
SELECT CheckDayDetail.CheckDayDetailId as DetailId
        ,CheckDay.ProjectId
        ,'1' as CheckType
		,CheckDay.CheckTime
	    ,CodeRecords.Code AS CheckCode
		,CheckDayDetail.CheckItem
		,CheckDayDetail.WorkArea
		,CheckDayDetail.Unqualified
		,CheckPerson.UserName as CheckPerson
		,Unit.UnitName
		,const.ConstText as HandleStepStr
		,(case when checkDayDetail.CompleteStatus =1 then '是' 
			when checkDayDetail.CompleteStatus =0 then '否' else '' end) as  CompleteStatusName
from  dbo.Check_CheckDayDetail CheckDayDetail
	  LEFT JOIN dbo.Check_CheckDay CheckDay ON CheckDay.CheckDayId = CheckDayDetail.CheckDayId 
	  LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckDay.CheckDayId=CodeRecords.DataId
	  LEFT JOIN Sys_User as CheckPerson on CheckPerson.UserId=CheckDay.CheckPerson
	  LEFT JOIN Base_Unit as Unit on Unit.UnitId=CheckDayDetail.UnitId
	  LEFT JOIN Sys_Const AS const ON const.ConstValue = CheckDayDetail.HandleStep and const.GroupId='HandleStep'
union all 
(
SELECT CheckSpecialDetail.CheckSpecialDetailId as DetailId 
        ,CheckSpecial.ProjectId
        ,'2' as CheckType
		,CheckSpecial.CheckTime
	    ,CodeRecords.Code AS CheckCode
		,CheckSpecialDetail.CheckItem
		,CheckSpecialDetail.WorkArea
		,CheckSpecialDetail.Unqualified
		,CheckPerson.UserName as CheckPerson
		,Unit.UnitName
		,const.ConstText as HandleStepStr
		,(case when checkSpecialDetail.CompleteStatus =1 then '是' 
			when checkSpecialDetail.CompleteStatus =0 then '否' else '' end) as  CompleteStatusName
from  dbo.Check_CheckSpecialDetail CheckSpecialDetail
	  LEFT JOIN dbo.Check_CheckSpecial CheckSpecial ON CheckSpecial.CheckSpecialId = CheckSpecialDetail.CheckSpecialId 
	  LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckSpecial.CheckSpecialId=CodeRecords.DataId
	  LEFT JOIN Sys_User as CheckPerson on CheckPerson.UserId=CheckSpecial.CheckPerson
	  LEFT JOIN Base_Unit as Unit on Unit.UnitId=CheckSpecialDetail.UnitId
	  LEFT JOIN Sys_Const AS const ON const.ConstValue = CheckSpecialDetail.HandleStep and const.GroupId='HandleStep'
)
union all
(
SELECT CheckColligationDetail.CheckColligationDetailId as DetailId  
        ,CheckColligation.ProjectId
        ,'3' as CheckType
		,CheckColligation.CheckTime
	    ,CodeRecords.Code AS CheckCode
		,CheckColligationDetail.CheckItem
		,CheckColligationDetail.WorkArea
		,CheckColligationDetail.Unqualified
		,CheckPerson.UserName as CheckPerson
		,Unit.UnitName
		,const.ConstText as HandleStepStr
		,(case when checkColligationDetail.CompleteStatus =1 then '是' 
			when checkColligationDetail.CompleteStatus =0 then '否' else '' end) as  CompleteStatusName
from  dbo.Check_CheckColligationDetail CheckColligationDetail
	  LEFT JOIN dbo.Check_CheckColligation CheckColligation ON CheckColligation.CheckColligationId = CheckColligationDetail.CheckColligationId 
	  LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckColligation.CheckColligationId=CodeRecords.DataId
	  LEFT JOIN Sys_User as CheckPerson on CheckPerson.UserId=CheckColligation.CheckPerson
	  LEFT JOIN Base_Unit as Unit on Unit.UnitId=CheckColligationDetail.UnitId
	  LEFT JOIN Sys_Const AS const ON const.ConstValue = CheckColligationDetail.HandleStep and const.GroupId='HandleStep'
)
union all
(
SELECT CheckWorkDetail.CheckWorkDetailId as DetailId   
        ,CheckWork.ProjectId
        ,'4' as CheckType
		,CheckWork.CheckTime
	    ,CodeRecords.Code AS CheckCode
		,CheckWorkDetail.CheckItem
		,CheckWork.Area as WorkArea
		,CheckWorkDetail.CheckResult as Unqualified
		,CheckPerson.UserName as CheckPerson
		,CheckWork.Area as UnitName
		,CheckWorkDetail.HandleResult as HandleStepStr
		,CheckWorkDetail.CheckStation as  CompleteStatusName
from  dbo.Check_CheckWorkDetail CheckWorkDetail
	  LEFT JOIN dbo.Check_CheckWork CheckWork ON CheckWork.CheckWorkId = CheckWorkDetail.CheckWorkId 
	  LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckWork.CheckWorkId=CodeRecords.DataId
	  LEFT JOIN Sys_User as CheckPerson on CheckPerson.UserId=CheckWork.CompileMan
)
union all
(
SELECT CheckHolidayDetail.CheckHolidayDetailId as DetailId   
        ,CheckHoliday.ProjectId
        ,'5' as CheckType
		,CheckHoliday.CheckTime
	    ,CodeRecords.Code AS CheckCode
		,CheckHolidayDetail.CheckItem
		,CheckHoliday.Area as WorkArea
		,CheckHolidayDetail.CheckResult as Unqualified
		,CheckPerson.UserName as CheckPerson
		,CheckHoliday.Area as UnitName
		,CheckHolidayDetail.HandleResult as HandleStepStr
		,CheckHolidayDetail.CheckStation as  CompleteStatusName
from  dbo.Check_CheckHolidayDetail CheckHolidayDetail
	  LEFT JOIN dbo.Check_CheckHoliday CheckHoliday ON CheckHoliday.CheckHolidayId = CheckHolidayDetail.CheckHolidayId 
	  LEFT JOIN Sys_CodeRecords AS CodeRecords ON CheckHoliday.CheckHolidayId=CodeRecords.DataId
	  LEFT JOIN Sys_User as CheckPerson on CheckPerson.UserId=CheckHoliday.CompileMan
)
GO

update Sys_MenuProjectA set MenuName='分包商HSE费用申请' where MenuId='FF68C697-B058-4687-A98F-71C591650E02'
GO	

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('E7B8059B-304B-47C6-90C8-D88E4A3EC506','分包商HSE费用投入登记','CostGoods/SubPayRegistration.aspx','PageHeaderFooter',31,'20ECB69E-28C4-4FAC-941A-15F446AEB634','Menu_Project',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('0E064349-CE84-4596-87EE-912EA5C55B7D','E7B8059B-304B-47C6-90C8-D88E4A3EC506','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('C57DEBB1-373A-4579-8F29-981764DED690','E7B8059B-304B-47C6-90C8-D88E4A3EC506','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('6662F95E-5C87-476A-A499-CE1B159B598A','E7B8059B-304B-47C6-90C8-D88E4A3EC506','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('171791EF-348B-43A8-AF12-96D5B576FDE0','E7B8059B-304B-47C6-90C8-D88E4A3EC506','保存',4) 
GO

CREATE TABLE [dbo].[CostGoods_SubPayRegistration](
	[SubPayRegistrationId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[ContractNum] [nvarchar](50) NULL,
	[PayDate] [datetime] NULL,
	[SMonthType1] [decimal](18, 2) NULL,
	[SMainApproveType1] [decimal](18, 2) NULL,
	[SMonthType2] [decimal](18, 2) NULL,
	[SMainApproveType2] [decimal](18, 2) NULL,
	[SMonthType3] [decimal](18, 2) NULL,
	[SMainApproveType3] [decimal](18, 2) NULL,
	[SMonthType4] [decimal](18, 2) NULL,
	[SMainApproveType4] [decimal](18, 2) NULL,
	[SMonthType5] [decimal](18, 2) NULL,
	[SMainApproveType5] [decimal](18, 2) NULL,
	[SMonthType6] [decimal](18, 2) NULL,
	[SMainApproveType6] [decimal](18, 2) NULL,
	[SMonthType7] [decimal](18, 2) NULL,
	[SMainApproveType7] [decimal](18, 2) NULL,
	[SMonthType8] [decimal](18, 2) NULL,
	[SMainApproveType8] [decimal](18, 2) NULL,
	[SMonthType9] [decimal](18, 2) NULL,
	[SMainApproveType9] [decimal](18, 2) NULL,
	[SMonthType10] [decimal](18, 2) NULL,
	[SMainApproveType10] [decimal](18, 2) NULL,
	[SMonthType11] [decimal](18, 2) NULL,
	[SMainApproveType11] [decimal](18, 2) NULL,
	[SMonthType12] [decimal](18, 2) NULL,
	[SMainApproveType12] [decimal](18, 2) NULL,
	[SMonthType13] [decimal](18, 2) NULL,
	[SMainApproveType13] [decimal](18, 2) NULL,
	[SMonthType14] [decimal](18, 2) NULL,
	[SMainApproveType14] [decimal](18, 2) NULL,
	[SMonthType15] [decimal](18, 2) NULL,
	[SMainApproveType15] [decimal](18, 2) NULL,
	[SMonthType16] [decimal](18, 2) NULL,
	[SMainApproveType16] [decimal](18, 2) NULL,
	[SMonthType17] [decimal](18, 2) NULL,
	[SMainApproveType17] [decimal](18, 2) NULL,
	[SMonthType18] [decimal](18, 2) NULL,
	[SMainApproveType18] [decimal](18, 2) NULL,
	[SMonthType19] [decimal](18, 2) NULL,
	[SMainApproveType19] [decimal](18, 2) NULL,
	[SMonthType20] [decimal](18, 2) NULL,
	[SMainApproveType20] [decimal](18, 2) NULL,
	[SMonthType21] [decimal](18, 2) NULL,
	[SMainApproveType21] [decimal](18, 2) NULL,
	[SMonthType22] [decimal](18, 2) NULL,
	[SMainApproveType22] [decimal](18, 2) NULL,
	[SMonthType23] [decimal](18, 2) NULL,
	[SMainApproveType23] [decimal](18, 2) NULL,
	[SMonthType24] [decimal](18, 2) NULL,
	[SMainApproveType24] [decimal](18, 2) NULL,
	[SMonthType25] [decimal](18, 2) NULL,
	[SMainApproveType25] [decimal](18, 2) NULL,
	[SMonthType26] [decimal](18, 2) NULL,
	[SMainApproveType26] [decimal](18, 2) NULL,
	[SMonthType27] [decimal](18, 2) NULL,
	[SMainApproveType27] [decimal](18, 2) NULL,
	[SMonthType28] [decimal](18, 2) NULL,
	[SMainApproveType28] [decimal](18, 2) NULL,
	[SMonthType29] [decimal](18, 2) NULL,
	[SMainApproveType29] [decimal](18, 2) NULL,
	[State] [char](1) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_CostGoods_SubPayRegistration] PRIMARY KEY CLUSTERED 
(
	[SubPayRegistrationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SubPayRegistrationId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包单位Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合同号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'ContractNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登记日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'PayDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内业管理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内业管理审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检测器材' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检测器材审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'警示警戒' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'警示警戒审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType3'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全奖励' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType4'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全奖励审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType4'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其他' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType5'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其他审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType5'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全技术' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType6'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全技术审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType6'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工业卫生' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType7'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工业卫生审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType7'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全用电' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType8'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全用电审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType8'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'高处作业及基坑' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType9'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'高处作业及基坑审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType9'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'临边洞口防护' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType10'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'临边洞口防护审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType10'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'受限空间内作业' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType11'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'受限空间内作业审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType11'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'动火作业' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType12'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'动火作业审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType12'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机械装备防护' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType13'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机械装备防护审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType13'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'吊装运输和起重' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType14'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'吊装运输和起重审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType14'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'硼砂作业' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType15'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'硼砂作业审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType15'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'拆除工程' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType16'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'拆除工程审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType16'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试压试车与有害介质作业' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType17'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'试压试车与有害介质作业审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType17'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'特种作业防护' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType18'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'特种作业防护审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType18'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急管理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType19'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急管理审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType19'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'非常措施' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType20'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'非常措施审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType20'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其他安全措施' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType21'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其他安全措施审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType21'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'装置区封闭管理' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType22'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'装置区封闭管理审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType22'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'防爆施工器具' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType23'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'防爆施工器具审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType23'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标识标签与锁定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType24'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标识标签与锁定审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType24'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关键场所封闭' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType25'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关键场所封闭审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType25'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'催化剂加装还原' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType26'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'催化剂加装还原审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType26'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联动和化工试车' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType27'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联动和化工试车审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType27'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'教育培训' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType28'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'教育培训审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType28'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'防护控制和排放' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMonthType29'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'防护控制和排放审核值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'SMainApproveType29'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商HSE费用投入登记表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CostGoods_SubPayRegistration'
GO

ALTER TABLE [dbo].[CostGoods_SubPayRegistration]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_SubPayRegistration_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[CostGoods_SubPayRegistration] CHECK CONSTRAINT [FK_CostGoods_SubPayRegistration_Base_Project]
GO

ALTER TABLE [dbo].[CostGoods_SubPayRegistration]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_SubPayRegistration_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[CostGoods_SubPayRegistration] CHECK CONSTRAINT [FK_CostGoods_SubPayRegistration_Base_Unit]
GO

ALTER TABLE [dbo].[CostGoods_SubPayRegistration]  WITH CHECK ADD  CONSTRAINT [FK_CostGoods_SubPayRegistration_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[CostGoods_SubPayRegistration] CHECK CONSTRAINT [FK_CostGoods_SubPayRegistration_Sys_User]
GO




INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('A97295B1-86C5-45F6-B8EC-A520E8CF3A4B','项目HSE绩效管理报告','Manager/PerformanceManagementReport.aspx','PageHeaderFooter',27,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('1C8F5159-0B97-4C90-AEE6-EA1777E2A4E8','A97295B1-86C5-45F6-B8EC-A520E8CF3A4B','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('ACB7485B-D3B9-4319-B968-32B8AD10CA97','A97295B1-86C5-45F6-B8EC-A520E8CF3A4B','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('5C9E92DB-A844-4778-B41C-E68A7831BAEC','A97295B1-86C5-45F6-B8EC-A520E8CF3A4B','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8BED9EDE-643A-4390-8C50-32AA0338AC66','A97295B1-86C5-45F6-B8EC-A520E8CF3A4B','保存',4) 
	GO




CREATE TABLE [dbo].[Manager_PerformanceManagementReport](
	[PerformanceManagementReportId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[ReportDate] [datetime] NULL,
	[MonthPerformance1] [nvarchar](50) NULL,
	[MonthPerformance2] [nvarchar](50) NULL,
	[MonthPerformance3] [nvarchar](50) NULL,
	[MonthPerformance4] [nvarchar](50) NULL,
	[MonthPerformance5] [nvarchar](50) NULL,
	[MonthPerformance6] [nvarchar](50) NULL,
	[MonthPerformance7] [nvarchar](50) NULL,
	[MonthPerformance8] [nvarchar](50) NULL,
	[MonthPerformance9] [nvarchar](50) NULL,
	[MonthPerformance10] [nvarchar](50) NULL,
	[MonthPerformance11] [nvarchar](50) NULL,
	[MonthPerformance12] [nvarchar](50) NULL,
	[MonthPerformance13] [nvarchar](50) NULL,
	[MonthPerformance14] [nvarchar](50) NULL,
	[MonthPerformance15] [nvarchar](50) NULL,
	[MonthPerformance16] [nvarchar](50) NULL,
	[MonthPerformance17] [nvarchar](50) NULL,
	[MonthPerformance18] [nvarchar](50) NULL,
	[MonthPerformance19] [nvarchar](50) NULL,
	[PerformanceIndex1] [nvarchar](50) NULL,
	[PerformanceIndex2] [nvarchar](50) NULL,
	[PerformanceIndex3] [nvarchar](50) NULL,
	[PerformanceIndex4] [nvarchar](50) NULL,
	[PerformanceIndex5] [nvarchar](50) NULL,
	[PerformanceIndex6] [nvarchar](50) NULL,
	[PerformanceIndex7] [nvarchar](50) NULL,
	[PerformanceIndex8] [nvarchar](50) NULL,
	[PerformanceIndex9] [nvarchar](50) NULL,
	[PerformanceIndex10] [nvarchar](50) NULL,
	[PerformanceIndex11] [nvarchar](50) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_Manager_PerformanceManagementReport] PRIMARY KEY CLUSTERED 
(
	[PerformanceManagementReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_PerformanceManagementReport', @level2type=N'COLUMN',@level2name=N'PerformanceManagementReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_PerformanceManagementReport', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'报告日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_PerformanceManagementReport', @level2type=N'COLUMN',@level2name=N'ReportDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_PerformanceManagementReport', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_PerformanceManagementReport', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目HSE绩效管理报告表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_PerformanceManagementReport'
GO

ALTER TABLE [dbo].[Manager_PerformanceManagementReport]  WITH CHECK ADD  CONSTRAINT [FK_Manager_PerformanceManagementReport_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Manager_PerformanceManagementReport] CHECK CONSTRAINT [FK_Manager_PerformanceManagementReport_Base_Project]
GO

ALTER TABLE [dbo].[Manager_PerformanceManagementReport]  WITH CHECK ADD  CONSTRAINT [FK_Manager_PerformanceManagementReport_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Manager_PerformanceManagementReport] CHECK CONSTRAINT [FK_Manager_PerformanceManagementReport_Sys_User]
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('AB03E11C-8174-4B83-90F4-D07A3D933E1D','分包商上传周报','Manager/SubUploadWeek.aspx','PageHeaderFooter',145,'03235B30-960D-4FCF-99F7-97773A2EE108','Menu_Project',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('79E58AA8-3E72-4848-BA59-0D4C6A2BF755','AB03E11C-8174-4B83-90F4-D07A3D933E1D','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A919707F-6823-4861-BADB-6CA7DF12191C','AB03E11C-8174-4B83-90F4-D07A3D933E1D','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6805E59F-66AE-49AF-A969-0C6DCC1B1D66','AB03E11C-8174-4B83-90F4-D07A3D933E1D','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('03529419-183D-4EFA-85C0-279F5555FB3E','AB03E11C-8174-4B83-90F4-D07A3D933E1D','保存',4) 
	GO

CREATE TABLE [dbo].[Manager_SubUploadWeek](
	[SubUploadWeekId] [nvarchar](50) NOT NULL,
	[ProjectId] [nvarchar](50) NULL,
	[UnitId] [nvarchar](50) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[PersonWeekNum] [int] NULL,
	[ManHours] [decimal](18, 2) NULL,
	[TotalManHours] [decimal](18, 2) NULL,
	[StartWorkDate] [datetime] NULL,
	[EndWorkDate] [datetime] NULL,
	[Remark] [nvarchar](200) NULL,
	[HappenNum1] [int] NULL,
	[HappenNum2] [int] NULL,
	[HappenNum3] [int] NULL,
	[HappenNum4] [int] NULL,
	[HappenNum5] [int] NULL,
	[HappenNum6] [int] NULL,
	[HurtPersonNum1] [int] NULL,
	[HurtPersonNum2] [int] NULL,
	[HurtPersonNum3] [int] NULL,
	[HurtPersonNum4] [int] NULL,
	[HurtPersonNum5] [int] NULL,
	[HurtPersonNum6] [int] NULL,
	[LossHours1] [decimal](18, 2) NULL,
	[LossHours2] [decimal](18, 2) NULL,
	[LossHours3] [decimal](18, 2) NULL,
	[LossHours4] [decimal](18, 2) NULL,
	[LossHours5] [decimal](18, 2) NULL,
	[LossHours6] [decimal](18, 2) NULL,
	[LossMoney1] [decimal](18, 2) NULL,
	[LossMoney2] [decimal](18, 2) NULL,
	[LossMoney3] [decimal](18, 2) NULL,
	[LossMoney4] [decimal](18, 2) NULL,
	[LossMoney5] [decimal](18, 2) NULL,
	[LossMoney6] [decimal](18, 2) NULL,
	[HSEPersonNum] [int] NULL,
	[CheckNum] [int] NULL,
	[EmergencyDrillNum] [int] NULL,
	[LicenseNum] [int] NULL,
	[TrainNum] [int] NULL,
	[HazardNum] [int] NULL,
	[MeetingNum] [int] NULL,
	[HiddenDanger1] [int] NULL,
	[HiddenDanger2] [int] NULL,
	[HiddenDanger3] [int] NULL,
	[RectifyNum1] [int] NULL,
	[RectifyNum2] [int] NULL,
	[RectifyNum3] [int] NULL,
	[ThisWorkSummary] [nvarchar](1000) NULL,
	[NextWorkPlan] [nvarchar](1000) NULL,
	[OtherProblems] [nvarchar](1000) NULL,
	[CompileMan] [nvarchar](50) NULL,
	[CompileDate] [datetime] NULL,
 CONSTRAINT [PK_Manager_SubUploadWeek] PRIMARY KEY CLUSTERED 
(
	[SubUploadWeekId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek', @level2type=N'COLUMN',@level2name=N'SubUploadWeekId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek', @level2type=N'COLUMN',@level2name=N'ProjectId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek', @level2type=N'COLUMN',@level2name=N'UnitId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek', @level2type=N'COLUMN',@level2name=N'StartDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek', @level2type=N'COLUMN',@level2name=N'EndDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本周人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek', @level2type=N'COLUMN',@level2name=N'PersonWeekNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'人工时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek', @level2type=N'COLUMN',@level2name=N'ManHours'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开工日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek', @level2type=N'COLUMN',@level2name=N'StartWorkDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'中交日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek', @level2type=N'COLUMN',@level2name=N'EndWorkDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专职HSE人员（名）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek', @level2type=N'COLUMN',@level2name=N'HSEPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE检查（次）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek', @level2type=N'COLUMN',@level2name=N'CheckNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应急演练（次）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek', @level2type=N'COLUMN',@level2name=N'EmergencyDrillNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作业许可证（份）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek', @level2type=N'COLUMN',@level2name=N'LicenseNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE教育培训（人次）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek', @level2type=N'COLUMN',@level2name=N'TrainNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'危险源辨识（次）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek', @level2type=N'COLUMN',@level2name=N'HazardNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE会议（次）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek', @level2type=N'COLUMN',@level2name=N'MeetingNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本周工作总结' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek', @level2type=N'COLUMN',@level2name=N'ThisWorkSummary'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下周工作计划' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek', @level2type=N'COLUMN',@level2name=N'NextWorkPlan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其他存在的问题和应报告事项' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek', @level2type=N'COLUMN',@level2name=N'OtherProblems'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek', @level2type=N'COLUMN',@level2name=N'CompileMan'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编制时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek', @level2type=N'COLUMN',@level2name=N'CompileDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分包商上传周报表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Manager_SubUploadWeek'
GO

ALTER TABLE [dbo].[Manager_SubUploadWeek]  WITH CHECK ADD  CONSTRAINT [FK_Manager_SubUploadWeek_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Manager_SubUploadWeek] CHECK CONSTRAINT [FK_Manager_SubUploadWeek_Base_Project]
GO

ALTER TABLE [dbo].[Manager_SubUploadWeek]  WITH CHECK ADD  CONSTRAINT [FK_Manager_SubUploadWeek_Base_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Base_Unit] ([UnitId])
GO

ALTER TABLE [dbo].[Manager_SubUploadWeek] CHECK CONSTRAINT [FK_Manager_SubUploadWeek_Base_Unit]
GO

ALTER TABLE [dbo].[Manager_SubUploadWeek]  WITH CHECK ADD  CONSTRAINT [FK_Manager_SubUploadWeek_Sys_User] FOREIGN KEY([CompileMan])
REFERENCES [dbo].[Sys_User] ([UserId])
GO

ALTER TABLE [dbo].[Manager_SubUploadWeek] CHECK CONSTRAINT [FK_Manager_SubUploadWeek_Sys_User]
GO


