--数据库升级脚本Ver3.5-->Ver3.6
USE [BUILD]
GO

GO
INSERT INTO T_BD_Config ( ConfigName, ConfigValue, IsEnable, ConfigCode) VALUES ( '默认设置几路视频', '4', '1', 'SetVideo');
GO
GO
INSERT INTO T_BD_Config ( ConfigName, ConfigValue, IsEnable, ConfigCode) VALUES ( '是否开启开机自启', '是', '0', 'IsAutoStart');
GO

GO
INSERT INTO T_BD_Permission ( PermissionName, Type, Remark, CreateTime, Parent_Key, IsDelete, Icon, OrderId) VALUES ( '人员下发日志', '2', null, '2019-11-26 09:55:12.580', '6', '0', null, '4');
GO



/****** Object:  Table [dbo].[T_Att_IOTime]    Script Date: 11/26/2019 15:43:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[T_Att_IOTime](
	[PersonIDCard] [varchar](255) NULL,
	[DepName] [varchar](255) NULL,
	[sWorkType] [varchar](255) NULL,
	[sName] [varchar](255) NULL,
	[A1] [varchar](255) NULL,
	[A2] [varchar](255) NULL,
	[A3] [varchar](255) NULL,
	[A4] [varchar](255) NULL,
	[A5] [varchar](255) NULL,
	[A6] [varchar](255) NULL,
	[A7] [varchar](255) NULL,
	[A8] [varchar](255) NULL,
	[A9] [varchar](255) NULL,
	[A10] [varchar](255) NULL,
	[A11] [varchar](255) NULL,
	[A12] [varchar](255) NULL,
	[A13] [varchar](255) NULL,
	[A14] [varchar](255) NULL,
	[A15] [varchar](255) NULL,
	[A16] [varchar](255) NULL,
	[A17] [varchar](255) NULL,
	[A18] [varchar](255) NULL,
	[A19] [varchar](255) NULL,
	[A20] [varchar](255) NULL,
	[A21] [varchar](255) NULL,
	[A22] [varchar](255) NULL,
	[A23] [varchar](255) NULL,
	[A24] [varchar](255) NULL,
	[A25] [varchar](255) NULL,
	[A26] [varchar](255) NULL,
	[A27] [varchar](255) NULL,
	[A28] [varchar](255) NULL,
	[A29] [varchar](255) NULL,
	[A30] [varchar](255) NULL,
	[A31] [varchar](255) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  StoredProcedure [dbo].[P_Att_FactTimeUp]    Script Date: 11/11/2019 13:56:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_CreatePsnPlan]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[P_Att_CreatePsnPlan]
GO

/****** Object:  StoredProcedure [dbo].[P_Att_CreatePsnPlan]    Script Date: 11/26/2019 15:44:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--根据班次信息（固定班次人员）、排班记录（轮班人员）生成临时考勤记录表

CREATE PROCEDURE [dbo].[P_Att_CreatePsnPlan]
	@BeginDate	Datetime,	--计划开始日期
	@EndDate	Datetime	--计划结束日期
AS
  DECLARE 
	@TempDate	DateTime,
	@WeekOfDate	int
BEGIN
  Set NOCOUNT ON   
  --更新假日表开始结束日期
  EXEC P_Att_HolidayStartEndUp
  --删除以前临时数据
  DELETE FROM T_Att_TempCalc

  --插入固定班次记录
  SET @TempDate=@BeginDate
  WHILE (@TempDate<=@EndDate)
  BEGIN
    SET @WeekOfDate=DATEPART(weekday, @TempDate)

    INSERT INTO T_Att_TempCalc
	(Person_Key,PlanDate,WeekOfDay,AttendType,RestType, 
      Class_Key,ClassNo,ClassName, 
      Seg1Enabled,Seg1Type,Seg1BeginTime,Seg1EndTime,Seg1OnTime,Seg1OffTime,Seg1TimeLen, 
      Seg1CheckOn,Seg1CheckOff,Seg1CalcLate,Seg1CalcEarly,Seg1CalcAbsent,Seg1CalcLeave, 

      Seg2Enabled,Seg2Type,Seg2BeginTime,Seg2EndTime,Seg2OnTime,Seg2OffTime,Seg2TimeLen, 
      Seg2CheckOn,Seg2CheckOff,Seg2CalcLate,Seg2CalcEarly,Seg2CalcAbsent,Seg2CalcLeave, 

      Seg3Enabled,Seg3Type,Seg3BeginTime,Seg3EndTime,Seg3OnTime,Seg3OffTime,Seg3TimeLen, 
      Seg3CheckOn,Seg3CheckOff,Seg3CalcLate, Seg3CalcEarly,Seg3CalcAbsent,Seg3CalcLeave, 

      Dep_Key,DepName,sName,PersonIDCard)

    SELECT PsnShift.Person_Key AS Person_Key, 
      @TempDate, @WeekOfDate, 0,
      PsnShift.RestType As RestType,
      PsnShift.Class_Key AS Class_Key, 
      Segment.ClassNo AS ClassNo, 
      Segment.ClassName AS ClassName, 
      Segment.Seg1Enabled AS Seg1Enabled,
      Segment.Seg1Type AS Seg1Type, 
      Segment.Seg1BeginTime AS Seg1BeginTime,
      Segment.Seg1EndTime AS Seg1EndTime,
      Segment.Seg1OnTime AS Seg1OnTime, 
      Segment.Seg1OffTime AS Seg1OffTime, 
      Segment.Seg1TimeLen AS Seg1TimeLen, 
      Segment.Seg1CheckOn AS Seg1CheckOn,
      Segment.Seg1CheckOff AS Seg1CheckOff,
      Segment.Seg1CalcLate AS Seg1CalcLate, 
      Segment.Seg1CalcEarly AS Seg1CalcEarly, 
      Segment.Seg1CalcAbsent AS Seg1CalcAbsent, 
      Segment.Seg1CalcLeave AS Seg1CalcLeave, 

      Segment.Seg2Enabled AS Seg2Enabled,
      Segment.Seg2Type AS Seg2Type, 
      Segment.Seg2BeginTime AS Seg2BeginTime,
      Segment.Seg2EndTime AS Seg2EndTime,
      Segment.Seg2OnTime AS Seg2OnTime, 
      Segment.Seg2OffTime AS Seg2OffTime, 
      Segment.Seg2TimeLen AS Seg2TimeLen, 
      Segment.Seg2CheckOn AS Seg2CheckOn,
      Segment.Seg2CheckOff AS Seg2CheckOff,
      Segment.Seg2CalcLate AS Seg2CalcLate, 
      Segment.Seg2CalcEarly AS Seg2CalcEarly, 
      Segment.Seg2CalcAbsent AS Seg2CalcAbsent, 
      Segment.Seg2CalcLeave AS Seg2CalcLeave, 

      Segment.Seg3Enabled AS Seg3Enabled,
      Segment.Seg3Type AS Seg3Type, 
      Segment.Seg3BeginTime AS Seg3BeginTime,
      Segment.Seg3EndTime AS Seg3EndTime,
      Segment.Seg3OnTime AS Seg3OnTime, 
      Segment.Seg3OffTime AS Seg3OffTime, 
      Segment.Seg3TimeLen AS Seg3TimeLen, 
      Segment.Seg3CheckOn AS Seg3CheckOn,
      Segment.Seg3CheckOff AS Seg3CheckOff,
      Segment.Seg3CalcLate AS Seg3CalcLate, 
      Segment.Seg3CalcEarly AS Seg3CalcEarly, 
      Segment.Seg3CalcAbsent AS Seg3CalcAbsent, 
      Segment.Seg3CalcLeave AS Seg3CalcLeave, 

      PsnCard.Dep_Key AS Dep_Key,
      PsnCard.DepName AS DepName,
      PsnCard.PersonName AS SName, 
      PsnCard.PersonIDCard AS PersonIDCard
    FROM dbo.T_Att_PsnShift PsnShift LEFT OUTER JOIN
      dbo.T_Att_Class Segment ON 
      PsnShift.Class_Key = Segment.P_Key LEFT OUTER JOIN
      dbo.V_Com_PersonCard PsnCard ON PsnShift.Person_Key = PsnCard.P_Key

    WHERE (PsnShift.AttendType=0) 
    --And (PsnCard.PersonComeDate<=@TempDate) 
    
    SET @TempDate=@TempDate+1
  END

 
  --插入轮班记录
  INSERT INTO T_Att_TempCalc
	(Person_Key,PlanDate,WeekOfDay, AttendType,
      Class_Key,ClassNo,ClassName, 
      Seg1Enabled,Seg1Type,Seg1BeginTime,Seg1EndTime,Seg1OnTime,Seg1OffTime,Seg1TimeLen, 
      Seg1CheckOn,Seg1CheckOff,Seg1CalcLate,Seg1CalcEarly,Seg1CalcAbsent,Seg1CalcLeave, 

      Seg2Enabled,Seg2Type,Seg2BeginTime,Seg2EndTime,Seg2OnTime,Seg2OffTime,Seg2TimeLen, 
      Seg2CheckOn,Seg2CheckOff,Seg2CalcLate,Seg2CalcEarly,Seg2CalcAbsent,Seg2CalcLeave, 

      Seg3Enabled,Seg3Type,Seg3BeginTime,Seg3EndTime,Seg3OnTime,Seg3OffTime,Seg3TimeLen, 
      Seg3CheckOn,Seg3CheckOff,Seg3CalcLate, Seg3CalcEarly,Seg3CalcAbsent,Seg3CalcLeave, 

      Dep_Key,DepName,sName,PersonIDCard)
  SELECT PsnPlan.Person_Key AS Person_Key, 
      PsnPlan.PlanDate AS PlanDate, PsnPlan.WeekOfDay AS WeekOfDay, 1,
      PsnPlan.Class_Key AS Class_Key, Segment.ClassNo AS ClassNo, 
      Segment.ClassName AS ClassName, 
      Segment.Seg1Enabled AS Seg1Enabled,
      Segment.Seg1Type AS Seg1Type, 
      Segment.Seg1BeginTime AS Seg1BeginTime,
      Segment.Seg1EndTime AS Seg1EndTime,
      Segment.Seg1OnTime AS Seg1OnTime, 
      Segment.Seg1OffTime AS Seg1OffTime, 
      Segment.Seg1TimeLen AS Seg1TimeLen, 
      Segment.Seg1CheckOn AS Seg1CheckOn,
      Segment.Seg1CheckOff AS Seg1CheckOff,
      Segment.Seg1CalcLate AS Seg1CalcLate, 
      Segment.Seg1CalcEarly AS Seg1CalcEarly, 
      Segment.Seg1CalcAbsent AS Seg1CalcAbsent, 
      Segment.Seg1CalcLeave AS Seg1CalcLeave, 

      Segment.Seg2Enabled AS Seg2Enabled,
      Segment.Seg2Type AS Seg2Type, 
      Segment.Seg2BeginTime AS Seg2BeginTime,
      Segment.Seg2EndTime AS Seg2EndTime,
      Segment.Seg2OnTime AS Seg2OnTime, 
      Segment.Seg2OffTime AS Seg2OffTime, 
      Segment.Seg2TimeLen AS Seg2TimeLen, 
      Segment.Seg2CheckOn AS Seg2CheckOn,
      Segment.Seg2CheckOff AS Seg2CheckOff,
      Segment.Seg2CalcLate AS Seg2CalcLate, 
      Segment.Seg2CalcEarly AS Seg2CalcEarly, 
      Segment.Seg2CalcAbsent AS Seg2CalcAbsent, 
      Segment.Seg2CalcLeave AS Seg2CalcLeave, 

      Segment.Seg3Enabled AS Seg3Enabled,
      Segment.Seg3Type AS Seg3Type, 
      Segment.Seg3BeginTime AS Seg3BeginTime,
      Segment.Seg3EndTime AS Seg3EndTime,
      Segment.Seg3OnTime AS Seg3OnTime, 
      Segment.Seg3OffTime AS Seg3OffTime, 
      Segment.Seg3TimeLen AS Seg3TimeLen, 
      Segment.Seg3CheckOn AS Seg3CheckOn,
      Segment.Seg3CheckOff AS Seg3CheckOff,
      Segment.Seg3CalcLate AS Seg3CalcLate, 
      Segment.Seg3CalcEarly AS Seg3CalcEarly, 
      Segment.Seg3CalcAbsent AS Seg3CalcAbsent, 
      Segment.Seg3CalcLeave AS Seg3CalcLeave, 

      PsnCard.Dep_Key AS Dep_Key,
      PsnCard.DepName AS DepName,
      PsnCard.PersonName AS SName, 
      PsnCard.PersonIDCard AS PersonIDCard
      
  FROM dbo.T_Att_Plan PsnPlan LEFT OUTER JOIN
      dbo.T_Att_Class Segment ON 
      PsnPlan.Class_Key = Segment.P_Key LEFT OUTER JOIN
      dbo.V_Com_PersonCard PsnCard ON PsnPlan.Person_Key = PsnCard.P_Key

  WHERE (PsnPlan.Person_Key IN (SELECT Person_Key FROM T_Att_PsnShift WHERE (AttendType=1)))
	 AND (PsnPlan.PlanDate Between @BeginDate And @EndDate)

  --处理调班记录
  DELETE FROM T_Att_TempIOTime
  INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,Class_Key)
  SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key,Adjust.Class_Key As Class_Key
  FROM T_Att_TempCalc AS TmpCalc INNER JOIN T_Att_Adjust AS Adjust ON TmpCalc.Person_Key = Adjust.Person_Key
  WHERE(Adjust.AdjustDate=TmpCalc.PlanDate)

  UPDATE T_Att_TempCalc SET 
		Class_Key=IOTime.Class_Key
  FROM T_Att_TempCalc TempCalc,T_Att_TempIOTime IOTime
  WHERE (TempCalc.P_Key=IOTime.P_Key)

  UPDATE T_Att_TempCalc SET 
		ClassNo=ClassA.ClassNo,
		ClassName=ClassA.ClassName,
		Seg1Enabled=ClassA.Seg1Enabled,
		Seg1Type=ClassA.Seg1Type,
		Seg1BeginTime=ClassA.Seg1BeginTime,
		Seg1EndTime=ClassA.Seg1EndTime,
		Seg1OnTime=ClassA.Seg1OnTime,
		Seg1OffTime=ClassA.Seg1OffTime,
		Seg1TimeLen=ClassA.Seg1TimeLen,
		Seg1CheckOn=ClassA.Seg1CheckOn,
		Seg1CheckOff=ClassA.Seg1CheckOff,
		Seg1CalcLate=ClassA.Seg1CalcLate,
		Seg1CalcEarly=ClassA.Seg1CalcEarly,
		Seg1CalcAbsent=ClassA.Seg1CalcAbsent,
		Seg1CalcLeave=ClassA.Seg1CalcLeave,

		Seg2Enabled=ClassA.Seg2Enabled,
		Seg2Type=ClassA.Seg2Type,
		Seg2BeginTime=ClassA.Seg2BeginTime,
		Seg2EndTime=ClassA.Seg2EndTime,
		Seg2OnTime=ClassA.Seg2OnTime,
		Seg2OffTime=ClassA.Seg2OffTime,
		Seg2TimeLen=ClassA.Seg2TimeLen,
		Seg2CheckOn=ClassA.Seg2CheckOn,
		Seg2CheckOff=ClassA.Seg2CheckOff,
		Seg2CalcLate=ClassA.Seg2CalcLate,
		Seg2CalcEarly=ClassA.Seg2CalcEarly,
		Seg2CalcAbsent=ClassA.Seg2CalcAbsent,
		Seg2CalcLeave=ClassA.Seg2CalcLeave,

		Seg3Enabled=ClassA.Seg3Enabled,
		Seg3Type=ClassA.Seg3Type,
		Seg3BeginTime=ClassA.Seg3BeginTime,
		Seg3EndTime=ClassA.Seg3EndTime,
		Seg3OnTime=ClassA.Seg3OnTime,
		Seg3OffTime=ClassA.Seg3OffTime,
		Seg3TimeLen=ClassA.Seg3TimeLen,
		Seg3CheckOn=ClassA.Seg3CheckOn,
		Seg3CheckOff=ClassA.Seg3CheckOff,
		Seg3CalcLate=ClassA.Seg3CalcLate,
		Seg3CalcEarly=ClassA.Seg3CalcEarly,
		Seg3CalcAbsent=ClassA.Seg3CalcAbsent,
		Seg3CalcLeave=ClassA.Seg3CalcLeave
  FROM T_Att_TempCalc TempCalc,T_Att_Class ClassA
  WHERE (TempCalc.P_Key In (Select P_Key From T_Att_TempIOTime))
	AND (TempCalc.Class_Key=ClassA.P_Key)

  --更新节假日记录
  EXEC P_Att_IsHolidayFieldUp 2

  Set NOCOUNT OFF  
END

GO

/****** Object:  StoredProcedure [dbo].[P_Att_IOTime]    Script Date: 11/26/2019 15:46:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_Att_IOTime]

AS
BEGIN
 Delete FROM T_Att_IOTime;

--声明一个变量
	declare @PersonIDCardCode as VARCHAR(64);
	declare @DepName AS VARCHAR(255);
	declare @sWorkType AS VARCHAR(255);
	declare @sName AS VARCHAR(255);

	declare @A1 AS VARCHAR(64);
	declare @P1 AS VARCHAR(64);
	declare @A2 AS VARCHAR(64);
	declare @P2 AS VARCHAR(64);
	declare @A3 AS VARCHAR(64);
	declare @P3 AS VARCHAR(64);
	declare @A4 AS VARCHAR(64);
	declare @P4 AS VARCHAR(64);
	declare @A5 AS VARCHAR(64);
	declare @P5 AS VARCHAR(64);
	declare @A6 AS VARCHAR(64);
	declare @P6 AS VARCHAR(64);
	declare @A7 AS VARCHAR(64);
	declare @P7 AS VARCHAR(64);
	declare @A8 AS VARCHAR(64);
	declare @P8 AS VARCHAR(64);
	declare @A9 AS VARCHAR(64);
	declare @P9 AS VARCHAR(64);
	declare @A10 AS VARCHAR(64);
	declare @P10 AS VARCHAR(64);
	declare @A11 AS VARCHAR(64);
	declare @P11 AS VARCHAR(64);
	declare @A12 AS VARCHAR(64);
	declare @P12 AS VARCHAR(64);
	declare @A13 AS VARCHAR(64);
	declare @P13 AS VARCHAR(64);
	declare @A14 AS VARCHAR(64);
	declare @P14 AS VARCHAR(64);
	declare @A15 AS VARCHAR(64);
	declare @P15 AS VARCHAR(64);
	declare @A16 AS VARCHAR(64);
	declare @P16 AS VARCHAR(64);
	declare @A17 AS VARCHAR(64);
	declare @P17 AS VARCHAR(64);
	declare @A18 AS VARCHAR(64);
	declare @P18 AS VARCHAR(64);
	declare @A19 AS VARCHAR(64);
	declare @P19 AS VARCHAR(64);
	declare @A20 AS VARCHAR(64);
	declare @P20 AS VARCHAR(64);
	declare @A21 AS VARCHAR(64);
	declare @P21 AS VARCHAR(64);
	declare @A22 AS VARCHAR(64);
	declare @P22 AS VARCHAR(64);
	declare @A23 AS VARCHAR(64);
	declare @P23 AS VARCHAR(64);
	declare @A24 AS VARCHAR(64);
	declare @P24 AS VARCHAR(64);
	declare @A25 AS VARCHAR(64);
	declare @P25 AS VARCHAR(64);
	declare @A26 AS VARCHAR(64);
	declare @P26 AS VARCHAR(64);
	declare @A27 AS VARCHAR(64);
	declare @P27 AS VARCHAR(64);
	declare @A28 AS VARCHAR(64);
	declare @P28 AS VARCHAR(64);
	declare @A29 AS VARCHAR(64);
	declare @P29 AS VARCHAR(64);
	declare @A30 AS VARCHAR(64);
	declare @P30 AS VARCHAR(64);
	declare @A31 AS VARCHAR(64);
	declare @P31 AS VARCHAR(64);


--声明一个游标用来遍历查询到的结果
declare C_PersonIDCardCode CURSOR for select PersonIDCardCode from T_BD_Temp_InOutRecord GROUP BY PersonIDCardCode;
--打开游标
open C_PersonIDCardCode;
--获取游标指向的数据
fetch next from C_PersonIDCardCode into @PersonIDCardCode;
--使用游标遍历集合
while @@FETCH_STATUS = 0
	BEGIN
		
	SELECT @A1 =(convert(varchar,RecordTime,8)),@P1= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 1;
	SELECT @A2 =(convert(varchar,RecordTime,8)),@P2= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 2;
	SELECT @A3 =(convert(varchar,RecordTime,8)),@P3= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 3;
	SELECT @A4 =(convert(varchar,RecordTime,8)),@P4= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 4;
	SELECT @A5 =(convert(varchar,RecordTime,8)),@P5= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 5;
	SELECT @A6 =(convert(varchar,RecordTime,8)),@P6= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 6;
	SELECT @A7 =(convert(varchar,RecordTime,8)),@P7= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 7;
	SELECT @A8 =(convert(varchar,RecordTime,8)),@P8= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 8;
	SELECT @A9 =(convert(varchar,RecordTime,8)),@P9= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 9;
	SELECT @A10 =(convert(varchar,RecordTime,8)),@P10= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 10;
	SELECT @A11 =(convert(varchar,RecordTime,8)),@P11= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 11;
	SELECT @A12 =(convert(varchar,RecordTime,8)),@P12= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 12;
	SELECT @A13 =(convert(varchar,RecordTime,8)),@P13= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 13;
	SELECT @A14 =(convert(varchar,RecordTime,8)),@P14= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 14;
	SELECT @A15 =(convert(varchar,RecordTime,8)),@P15= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 15;
	SELECT @A16 =(convert(varchar,RecordTime,8)),@P16= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 16;
	SELECT @A17 =(convert(varchar,RecordTime,8)),@P17= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 17;
	SELECT @A18 =(convert(varchar,RecordTime,8)),@P18= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 18;	
  SELECT @A19 =(convert(varchar,RecordTime,8)),@P19= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 19;	
	
	SELECT @A20 =(convert(varchar,RecordTime,8)),@P20= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 20;
	SELECT @A21 =(convert(varchar,RecordTime,8)),@P21= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 21;
	SELECT @A22 =(convert(varchar,RecordTime,8)),@P22= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 22;
	SELECT @A23 =(convert(varchar,RecordTime,8)),@P23= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 23;
	SELECT @A24 =(convert(varchar,RecordTime,8)),@P24= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 24;
	SELECT @A25 =(convert(varchar,RecordTime,8)),@P25= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 25;
	SELECT @A26 =(convert(varchar,RecordTime,8)),@P26= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 26;
	SELECT @A27 =(convert(varchar,RecordTime,8)),@P27= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 27;
	SELECT @A28 =(convert(varchar,RecordTime,8)),@P28= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 28;
	SELECT @A29 =(convert(varchar,RecordTime,8)),@P29= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 29;
	SELECT @A30 =(convert(varchar,RecordTime,8)),@P30= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 30;
  SELECT @A31 =(convert(varchar,RecordTime,8)),@P31= (convert(varchar,RecordTime2,8)) FROM  T_BD_Temp_InOutRecord WHERE  PersonIDCardCode=@PersonIDCardCode and DAY(RecordTime)= 31;
	
  SELECT top 1 @DepName=DepName,@sWorkType=WorkTypeName,@sName=PersonName FROM T_BD_Temp_InOutRecord  where PersonIDCardCode=@PersonIDCardCode;
	
  
	IF(@A1=@P1)
		BEGIN
			SET @A1=@A1;
		END
	ELSE
		BEGIN
      if (@A1<>'' and @P1<>'') 
				BEGIN
					
					set @A1= @A1 +'-'+ @P1;
				END
		END
  
IF(@A2=@P2)
		BEGIN
			SET @A2=@A2;
		END
	ELSE
		BEGIN
      if (@A2<>'' and @P2<>'') 
				BEGIN
					
					set @A2= @A2 +'-'+ @P2;
				END
		END

IF(@A3=@P3)
		BEGIN
			SET @A3=@A3;
		END
	ELSE
		BEGIN
      if (@A3<>'' and @P3<>'') 
				BEGIN
					
					set @A3= @A3 +'-'+ @P3;
				END
		END

IF(@A4=@P4)
		BEGIN
			SET @A4=@A4;
		END
	ELSE
		BEGIN
      if (@A4<>'' and @P4<>'') 
				BEGIN
					
					set @A4= @A4 +'-'+ @P4;
				END
		END

IF(@A5=@P5)
		BEGIN
			SET @A5=@A5;
		END
	ELSE
		BEGIN
      if (@A5<>'' and @P5<>'') 
				BEGIN
					
					set @A5= @A5 +'-'+ @P5;
				END
		END

IF(@A6=@P6)
		BEGIN
			SET @A6=@A6;
		END
	ELSE
		BEGIN
      if (@A6<>'' and @P6<>'') 
				BEGIN
					
					set @A6= @A6 +'-'+ @P6;
				END
		END

IF(@A7=@P7)
		BEGIN
			SET @A7=@A7;
		END
	ELSE
		BEGIN
      if (@A7<>'' and @P7<>'') 
				BEGIN
					
					set @A7= @A7 +'-'+ @P7;
				END
		END

IF(@A8=@P8)
		BEGIN
			SET @A8=@A8;
		END
	ELSE
		BEGIN
      if (@A8<>'' and @P8<>'') 
				BEGIN
					
					set @A8= @A8 +'-'+ @P8;
				END
		END

IF(@A9=@P9)
		BEGIN
			SET @A9=@A9;
		END
	ELSE
		BEGIN
      if (@A9<>'' and @P9<>'') 
				BEGIN
					
					set @A9= @A9 +'-'+ @P9;
				END
		END

IF(@A10=@P10)
		BEGIN
			SET @A10=@A10;
		END
	ELSE
		BEGIN
      if (@A10<>'' and @P10<>'') 
				BEGIN
					
					set @A10= @A10 +'-'+ @P10;
				END
		END

IF(@A11=@P11)
		BEGIN
			SET @A11=@A11;
		END
	ELSE
		BEGIN
      if (@A11<>'' and @P11<>'') 
				BEGIN
					
					set @A11= @A11 +'-'+ @P11;
				END
		END
  
IF(@A12=@P12)
		BEGIN
			SET @A12=@A12;
		END
	ELSE
		BEGIN
      if (@A12<>'' and @P12<>'') 
				BEGIN
					
					set @A12= @A12 +'-'+ @P12;
				END
		END

IF(@A13=@P13)
		BEGIN
			SET @A13=@A13;
		END
	ELSE
		BEGIN
      if (@A13<>'' and @P13<>'') 
				BEGIN
					
					set @A13= @A13 +'-'+ @P13;
				END
		END

IF(@A14=@P14)
		BEGIN
			SET @A14=@A14;
		END
	ELSE
		BEGIN
      if (@A14<>'' and @P14<>'') 
				BEGIN
					
					set @A14= @A14 +'-'+ @P14;
				END
		END

IF(@A15=@P15)
		BEGIN
			SET @A15=@A15;
		END
	ELSE
		BEGIN
      if (@A15<>'' and @P15<>'') 
				BEGIN
					
					set @A15= @A15 +'-'+ @P15;
				END
		END

IF(@A16=@P16)
		BEGIN
			SET @A16=@A16;
		END
	ELSE
		BEGIN
      if (@A16<>'' and @P16<>'') 
				BEGIN
					
					set @A16= @A16 +'-'+ @P16;
				END
		END

IF(@A17=@P17)
		BEGIN
			SET @A17=@A17;
		END
	ELSE
		BEGIN
      if (@A17<>'' and @P17<>'') 
				BEGIN
					
					set @A17= @A17 +'-'+ @P17;
				END
		END

IF(@A18=@P18)
		BEGIN
			SET @A18=@A18;
		END
	ELSE
		BEGIN
      if (@A18<>'' and @P18<>'') 
				BEGIN
					
					set @A18= @A18 +'-'+ @P18;
				END
		END

IF(@A19=@P19)
		BEGIN
			SET @A19=@A19;
		END
	ELSE
		BEGIN
      if (@A19<>'' and @P19<>'') 
				BEGIN
					
					set @A19= @A19 +'-'+ @P19;
				END
		END

IF(@A20=@P20)
		BEGIN
			SET @A20=@A20;
		END
	ELSE
		BEGIN
      if (@A20<>'' and @P20<>'') 
				BEGIN
					
					set @A20= @A20 +'-'+ @P20;
				END
		END

	IF(@A21=@P21)
		BEGIN
			SET @A21=@A21;
		END
	ELSE
		BEGIN
      if (@A21<>'' and @P21<>'') 
				BEGIN
					
					set @A21= @A21 +'-'+ @P21;
				END
		END
  
IF(@A22=@P22)
		BEGIN
			SET @A22=@A22;
		END
	ELSE
		BEGIN
      if (@A22<>'' and @P22<>'') 
				BEGIN
					
					set @A22= @A22 +'-'+ @P22;
				END
		END

IF(@A23=@P23)
		BEGIN
			SET @A23=@A23;
		END
	ELSE
		BEGIN
      if (@A23<>'' and @P23<>'') 
				BEGIN
					
					set @A23= @A23 +'-'+ @P23;
				END
		END

IF(@A24=@P24)
		BEGIN
			SET @A24=@A24;
		END
	ELSE
		BEGIN
      if (@A24<>'' and @P24<>'') 
				BEGIN
					
					set @A24= @A24 +'-'+ @P24;
				END
		END

IF(@A25=@P25)
		BEGIN
			SET @A25=@A25;
		END
	ELSE
		BEGIN
      if (@A25<>'' and @P25<>'') 
				BEGIN
					
					set @A25= @A25 +'-'+ @P25;
				END
		END

IF(@A26=@P26)
		BEGIN
			SET @A26=@A26;
		END
	ELSE
		BEGIN
      if (@A26<>'' and @P26<>'') 
				BEGIN
					
					set @A26= @A26 +'-'+ @P26;
				END
		END

IF(@A27=@P27)
		BEGIN
			SET @A27=@A27;
		END
	ELSE
		BEGIN
      if (@A27<>'' and @P27<>'') 
				BEGIN
					
					set @A27= @A27 +'-'+ @P27;
				END
		END

IF(@A28=@P28)
		BEGIN
			SET @A28=@A28;
		END
	ELSE
		BEGIN
      if (@A28<>'' and @P28<>'') 
				BEGIN
					
					set @A28= @A28 +'-'+ @P28;
				END
		END

IF(@A29=@P29)
		BEGIN
			SET @A29=@A29;
		END
	ELSE
		BEGIN
      if (@A29<>'' and @P29<>'') 
				BEGIN
					
					set @A29= @A29 +'-'+ @P29;
				END
		END

IF(@A30=@P30)
		BEGIN
			SET @A30=@A30;
		END
	ELSE
		BEGIN
      if (@A30<>'' and @P30<>'') 
				BEGIN
					
					set @A30= @A30 +'-'+ @P30;
				END
		END

IF(@A31=@P31)
		BEGIN
			SET @A31=@A31;
		END
	ELSE
		BEGIN
      if (@A31<>'' and @P31<>'') 
				BEGIN
					
					set @A31= @A31 +'-'+ @P31;
				END
		END

  INSERT INTO T_Att_IOTime
	(PersonIDCard,DepName, 
  sWorkType,
	sName,
	A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,
	A17,A18,A19,A20,A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,
	A31
  )
  VALUES (@PersonIDCardCode, @DepName, @sWorkType,@sName,
  @A1,@A2,@A3,@A4,@A5,@A6,@A7,@A8,@A9,@A10,
  @A11,@A12,@A13,@A14,@A15,@A16,@A17,@A18,@A19,@A20,
	@A21,@A22,@A23,@A24,@A25,@A26,@A27,@A28,@A29,@A30,@A31);

	set @DepName=NULL;
	set @sWorkType=NULL
	set @sName=NULL;

	set @A1 =NULL;
	set @P1 =NULL;
	set @A2 =NULL;
	set @P2 =NULL;
	set @A3 =NULL;
	set @P3 =NULL;
	set @A4 =NULL;
	set @P4 =NULL;
	set @A5 =NULL;
	set @P5 =NULL;
	set @A6 =NULL;
	set @P6 =NULL;
	set @A7 =NULL;
	set @P7 =NULL;
	set @A8 =NULL;
	set @P8 =NULL;
	set @A9 =NULL;
	set @P9 =NULL;
	set @A10 =NULL;
	set @P10 =NULL;
	set @A11 =NULL;
	set @P11 =NULL;
	set @A12 =NULL;
	set @P12 =NULL;
	set @A13 =NULL;
	set @P13 =NULL;
	set @A14 =NULL;
	set @P14 =NULL;
	set @A15 =NULL;
	set @P15 =NULL;
	set @A16 =NULL;
	set @P16 =NULL;
	set @A17 =NULL;
	set @P17 =NULL;
	set @A18 =NULL;
	set @P18 =NULL;
	set @A19 =NULL;
	set @P19 =NULL;
	set @A20 =NULL;
	set @P20 =NULL;
	set @A21 =NULL;
	set @P21 =NULL;
	set @A22 =NULL;
	set @P22 =NULL;
	set @A23 =NULL;
	set @P23 =NULL;
	set @A24 =NULL;
	set @P24 =NULL;
	set @A25 =NULL;
	set @P25 =NULL;
	set @A26 =NULL;
	set @P26 =NULL;
	set @A27 =NULL;
	set @P27 =NULL;
	set @A28 =NULL;
	set @P28 =NULL;
	set @A29 =NULL;
	set @P29 =NULL;
	set @A30 =NULL;
	set @P30 =NULL;
	set @A31 =NULL;
	set @P31 =NULL;

	 FETCH next from C_PersonIDCardCode into @PersonIDCardCode;

	END
	--关闭游标
	CLose C_PersonIDCardCode;
	--释放游标
	DEALLOCATE C_PersonIDCardCode;
END


GO