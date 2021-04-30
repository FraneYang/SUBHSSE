
/****** 对象:  View [dbo].[V_Com_PersonCard]    脚本日期: 09/26/2019 10:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Com_PersonCard]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[V_Com_PersonCard] AS 
SELECT P.*, D.DepName
FROM dbo.T_BD_Person P LEFT OUTER JOIN
      dbo.T_BD_Department D ON P.Dep_Key = D.P_Key '
GO
/****** 对象:  View [dbo].[V_Att_InOutRecord]    脚本日期: 09/26/2019 10:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Att_InOutRecord]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[V_Att_InOutRecord] AS 
SELECT
	p.P_Key AS ''PersonKey'',
	r.RecordTime AS ''IOTime'',
	r.ControlName as ''CtrlName'',
	r.ControlNumber as ''CtrlNumber'',
	CASE
WHEN CHARINDEX(''进'', r.CommType) > 0 THEN
	''1''
WHEN CHARINDEX(''出'', r.CommType) > 0 THEN
	''2''
ELSE
	''0''
END AS ''CtrlType''
FROM
	T_BD_InOutRecord_Log r
INNER JOIN T_BD_Person p ON r.PersonIDCardCode = p.PersonIDCard'
GO

/****** 对象:  StoredProcedure [dbo].[P_Att_Kind_TestRelation]    脚本日期: 09/25/2019 10:09:36 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_Kind_TestRelation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--测试T_Att_Kind记录是否关联其他表
--返回值：0--未关联任何表  非0--已关联其他表
CREATE PROCEDURE [dbo].[P_Att_Kind_TestRelation]
  @P_Key numeric
AS
  declare @Relation int
BEGIN
   Select @Relation=Count(1)  From T_Att_Note Where Kind_Key=@P_Key; --是否考勤记录表  
   Select @Relation=@Relation+Count(1)  From T_Att_PersonKind Where Kind_Key=@P_Key; --是否考勤类别分配表  
   RETURN(@Relation);
END
' 
END
GO
/****** 对象:  StoredProcedure [dbo].[P_Att_SignAmPmUp]    脚本日期: 09/25/2019 10:09:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_SignAmPmUp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--统计当天符号考勤
CREATE PROCEDURE [dbo].[P_Att_SignAmPmUp]
	@CurrDate	Datetime  --统计日期
AS
Begin
  DECLARE	@iBegin	Int,
		@SQLString nvarchar(4000)
  SELECT @iBegin=DATEPART(day,@CurrDate)
  Select @SQLString = N''UPDATE T_Att_SumSign SET A''+Convert(varchar(2),@iBegin)+N''=CASE
			WHEN ((Seg1BResult in (1,2)) AND (Seg1EResult in (1,2))) THEN ''''√''''							--正常
			WHEN ((Seg1BResult=17) AND (Seg1EResult<>21)) OR ((Seg1BResult<>21) AND (Seg1EResult=17)) THEN ''''迟''''			--迟到
			WHEN ((Seg1BResult=19) AND (Seg1EResult<>21)) OR ((Seg1BResult<>21) AND (Seg1EResult=19)) THEN ''''早''''			--早退
			WHEN ((Seg1BResult=21) OR  (Seg1EResult=21)) THEN ''''×''''									--缺勤
			WHEN ((Seg1BResult in (6,7,8)) AND (Seg1EResult<>21)) OR ((Seg1BResult<>21) AND (Seg1EResult in (6,7,8))) THEN ''''加''''	--加班
			WHEN ((Seg1BResult=9) AND (Seg1EResult<>21)) OR ((Seg1BResult<>21) AND (Seg1EResult=9)) THEN ''''公''''			--公休
			WHEN ((Seg1BResult=10) AND (Seg1EResult<>21)) OR ((Seg1BResult<>21) AND (Seg1EResult=10)) THEN ''''事''''			--事假
			WHEN ((Seg1BResult=11) AND (Seg1EResult<>21)) OR ((Seg1BResult<>21) AND (Seg1EResult=11)) THEN ''''病''''			--病假
			WHEN ((Seg1BResult=12) AND (Seg1EResult<>21)) OR ((Seg1BResult<>21) AND (Seg1EResult=12)) THEN ''''年''''			--年假
			WHEN ((Seg1BResult=13) AND (Seg1EResult<>21)) OR ((Seg1BResult<>21) AND (Seg1EResult=13)) THEN ''''婚''''			--婚假
			WHEN ((Seg1BResult=14) AND (Seg1EResult<>21)) OR ((Seg1BResult<>21) AND (Seg1EResult=14)) THEN ''''差''''			--出差
			WHEN ((Seg1BResult=15) AND (Seg1EResult<>21)) OR ((Seg1BResult<>21) AND (Seg1EResult=15)) THEN ''''外''''			--外出
			WHEN ((Seg1BResult=25) AND (Seg1EResult<>21)) OR ((Seg1BResult<>21) AND (Seg1EResult=25)) THEN ''''产''''			--产假
			WHEN ((Seg1BResult=26) AND (Seg1EResult<>21)) OR ((Seg1BResult<>21) AND (Seg1EResult=26)) THEN ''''丧''''			--丧假
		END,
		P''+Convert(varchar(2),@iBegin)+N''=CASE 
			WHEN ((Seg2BResult in (1,2)) AND (Seg2EResult in (1,2))) THEN ''''√''''							--正常
			WHEN ((Seg2BResult=17) AND (Seg2EResult<>21)) OR ((Seg2BResult<>21) AND (Seg2EResult=17)) THEN ''''迟''''			--迟到
			WHEN ((Seg2BResult=19) AND (Seg2EResult<>21)) OR ((Seg2BResult<>21) AND (Seg2EResult=19)) THEN ''''早''''			--早退
			WHEN ((Seg2BResult=21) OR  (Seg2EResult=21)) THEN ''''×''''									--缺勤
			WHEN ((Seg2BResult in (6,7,8)) AND (Seg2EResult<>21)) OR ((Seg2BResult<>21) AND (Seg2EResult in (6,7,8))) THEN ''''加''''	--加班
			WHEN ((Seg2BResult=9) AND (Seg2EResult<>21)) OR ((Seg2BResult<>21) AND (Seg2EResult=9)) THEN ''''公''''			--公休
			WHEN ((Seg2BResult=10) AND (Seg2EResult<>21)) OR ((Seg2BResult<>21) AND (Seg2EResult=10)) THEN ''''事''''			--事假
			WHEN ((Seg2BResult=11) AND (Seg2EResult<>21)) OR ((Seg2BResult<>21) AND (Seg2EResult=11)) THEN ''''病''''			--病假
			WHEN ((Seg2BResult=12) AND (Seg2EResult<>21)) OR ((Seg2BResult<>21) AND (Seg2EResult=12)) THEN ''''年''''			--年假
			WHEN ((Seg2BResult=13) AND (Seg2EResult<>21)) OR ((Seg2BResult<>21) AND (Seg2EResult=13)) THEN ''''婚''''			--婚假
			WHEN ((Seg2BResult=14) AND (Seg2EResult<>21)) OR ((Seg2BResult<>21) AND (Seg2EResult=14)) THEN ''''差''''			--出差
			WHEN ((Seg2BResult=15) AND (Seg2EResult<>21)) OR ((Seg2BResult<>21) AND (Seg2EResult=15)) THEN ''''外''''			--外出
			WHEN ((Seg2BResult=25) AND (Seg2EResult<>21)) OR ((Seg2BResult<>21) AND (Seg2EResult=25)) THEN ''''产''''			--产假
			WHEN ((Seg2BResult=26) AND (Seg2EResult<>21)) OR ((Seg2BResult<>21) AND (Seg2EResult=26)) THEN ''''丧''''			--丧假
		END
	FROM T_Att_SumSign, T_Att_SumList
	WHERE (T_Att_SumSign.Person_Key=T_Att_SumList.Person_Key) and (T_Att_SumList.PlanDate=Convert(Datetime,''''''+Convert(varchar(19),@CurrDate,120)+N''''''))''

  --Print @SQLString
  EXECUTE sp_executesql @SQLString,N''@iBegin Int'',@iBegin
END
' 
END
GO
/****** 对象:  StoredProcedure [dbo].[P_Att_BEValueUp1]    脚本日期: 09/25/2019 10:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_BEValueUp1]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--考勤系统计算迟到/早退/出勤/缺勤时间、提前上班/延迟下班产生的加班时间(按打卡时间)
CREATE PROCEDURE [dbo].[P_Att_BEValueUp1]
AS
BEGIN  
  Set NOCOUNT ON   
  DECLARE	@Att_OverTimeMode Int,	--加班计算方式(0-按半小时取整，1-按打卡时间，2-按半小时补齐)
		@EarlyOnIsOver	  Int,	--提前上班作为加班(0-否 1-是)
		@LateOffIsOver    Int,	--延迟下班作为加班(0-否 1-是)
		@LateOffDecTime   Int,	--延迟下班扣除吃饭时间
		@MinOvertime      Int   --最小加班时间

  SELECT @Att_OverTimeMode=ISNULL(Value1,0) FROM T_Com_SysPara WHERE sName=''Att_OverTimeMode''
  SELECT @EarlyOnIsOver=ISNULL(Value1,0) FROM T_Com_SysPara WHERE sName=''Att_EarlyOnIsOver''
  SELECT @LateOffIsOver=ISNULL(Value1,0) FROM T_Com_SysPara WHERE sName=''Att_LateOffIsOver''
  SELECT @LateOffDecTime=ISNULL(Value1,0) FROM T_Com_SysPara WHERE sName=''Att_LateOffDecTime''
  SELECT @MinOvertime=ISNULL(Value1,0) FROM T_Com_SysPara WHERE sName=''Att_MinOvertime''


  --第一段上下班时间
  UPDATE T_Att_TempCalc 
  SET Seg1BValue = CASE 
	WHEN (Seg1CheckOn=0) and (Class_Key is Not NULL) THEN 0
	WHEN (Seg1CheckOn=1) And (Seg1BFactTime Is Not Null) And (Seg1BTime Is Not Null) THEN CONVERT(INT,(CAST(Seg1BFactTime AS FLOAT)-CAST(Seg1BTime AS FLOAT))*1440)
	WHEN (Seg1CheckOn=1) And (Seg1BFactTime Is Null) And (Seg1BTime Is Not Null) THEN Seg1TimeLen
	ELSE NULL
      END,

      Seg1EValue = CASE
	WHEN (Seg1CheckOff=0) and (Class_Key is Not NULL) THEN 0
	WHEN (Seg1CheckOff=1) And (Seg1EFactTime Is Not Null) And (Seg1ETime Is Not Null) THEN CONVERT(INT,(CAST(Seg1ETime AS FLOAT)-CAST(Seg1EFactTime AS FLOAT))*1440)
	WHEN (Seg1CheckOff=1) And (Seg1EFactTime Is Null) And (Seg1ETime Is Not Null) THEN Seg1TimeLen
	ELSE 0-Seg1TimeLen
      END
  WHERE (Seg1Enabled=1)

  --第二段上下班时间 
  UPDATE T_Att_TempCalc 
  SET Seg2BValue = CASE
	WHEN (Seg2CheckOn=0) and (Class_Key is Not NULL) THEN 0
	WHEN (Seg2CheckOn=1) And (Seg2BFactTime Is Not Null) And (Seg2BTime Is Not Null) THEN CONVERT(INT,(CAST(Seg2BFactTime AS FLOAT)-CAST(Seg2BTime AS FLOAT))*1440)
	WHEN (Seg2CheckOn=1) And (Seg2BFactTime Is Null) And (Seg2BTime Is Not Null) THEN Seg2TimeLen
	ELSE NULL
      END,
 
      Seg2EValue = CASE
	WHEN (Seg2CheckOff=0) and (Class_Key is Not NULL) THEN 0
	WHEN (Seg2CheckOff=1) And (Seg2EFactTime Is Not Null) And (Seg2ETime Is Not Null) THEN  CONVERT(INT,(CAST(Seg2ETime AS FLOAT)-CAST(Seg2EFactTime AS FLOAT))*1440)
	WHEN (Seg2CheckOff=1) And (Seg2EFactTime Is Null) And (Seg2ETime Is Not Null) THEN Seg2TimeLen
	ELSE 0-Seg2TimeLen*60
      END
  WHERE (Seg2Enabled=1)
 
  --第三段上下班时间(按加班计)
  IF (@Att_OverTimeMode=0)
  BEGIN 
	  UPDATE T_Att_TempCalc
	  SET Seg3BValue = CASE
		WHEN (Seg3CheckOn=0) and (Class_Key is Not NULL) THEN 0
		WHEN (Seg3CheckOn=1) And (Seg3BFactTime Is Not Null) And (Seg3BTime Is Not Null) THEN CEILING((CAST(Seg3BFactTime As Float)-CAST(Seg3BTime AS FLOAT))*1440/30)*30	--上班迟到时间小于30分钟，按30分钟补齐计
		WHEN (Seg3CheckOn=1) And (Seg3BFactTime Is Null) And (Seg3BTime Is Not Null) THEN Seg3TimeLen
		ELSE NULL
	      END,
 
	      Seg3EValue = CASE
		WHEN (Seg3CheckOff=0) and (Class_Key is Not NULL) THEN 0
		WHEN (Seg3CheckOff=1) And (Seg3EFactTime Is Not Null) And (Seg3ETime Is Not Null)  THEN CEILING((CAST(Seg3ETime As FLOAT)-CAST(Seg3EFactTime AS FLOAT))*1440/30)*30 --上班迟到时间小于30分钟，按30分钟补齐计
		WHEN (Seg3CheckOff=1) And (Seg3EFactTime Is Null) And (Seg3ETime Is Not Null) THEN Seg3TimeLen
		ELSE 0-Seg3TimeLen*60
	      END
	  WHERE (Seg3Enabled=1)
  END
  ELSE IF (@Att_OverTimeMode=1)
  BEGIN 
	  UPDATE T_Att_TempCalc
	  SET Seg3BValue = CASE
		WHEN (Seg3CheckOn=0) and (Class_Key is Not NULL) THEN 0
		WHEN (Seg3CheckOn=1) And (Seg3BFactTime Is Not Null) And (Seg3BTime Is Not Null) THEN CONVERT(INT,(CAST(Seg3BFactTime As Float)-CAST(Seg3BTime As FLOAT))*1440)
		WHEN (Seg3CheckOn=1) And (Seg3BFactTime Is Null) And (Seg3BTime Is Not Null) THEN Seg3TimeLen
		ELSE NULL
	      END,
 
	      Seg3EValue = CASE
		WHEN (Seg3CheckOff=0) and (Class_Key is Not NULL) THEN 0
		WHEN (Seg3CheckOff=1) And (Seg3EFactTime Is Not Null) And (Seg3ETime Is Not Null) THEN CONVERT(INT,(CAST(Seg3ETime As Float)-CAST(Seg3EFactTime AS FLOAT))*1440)
		WHEN (Seg3CheckOff=1) And (Seg3EFactTime Is Null) And (Seg3ETime Is Not Null) THEN Seg3TimeLen
		ELSE 0-Seg3TimeLen*60
	      END
	  WHERE (Seg3Enabled=1)
  END
  ELSE IF (@Att_OverTimeMode=2)
  BEGIN 
	  UPDATE T_Att_TempCalc
	  SET Seg3BValue = CASE
		WHEN (Seg3CheckOn=0) and (Class_Key is Not NULL) THEN 0
		WHEN (Seg3CheckOn=1) And (Seg3BFactTime Is Not Null) And (Seg3BTime Is Not Null) THEN ROUND((CAST(Seg3BFactTime As Float)-Cast(Seg3BTime AS FLOAT))*1440/30,0,1)*30
		WHEN (Seg3CheckOn=1) And (Seg3BFactTime Is Null) And (Seg3BTime Is Not Null) THEN Seg3TimeLen
		ELSE NULL
	      END,
 
	      Seg3EValue = CASE
		WHEN (Seg3CheckOff=0) and (Class_Key is Not NULL) THEN 0
		WHEN (Seg3CheckOff=1) And (Seg3EFactTime Is Not Null) And (Seg3ETime Is Not Null) THEN ROUND((CAST(Seg3ETime As Float)-Cast(Seg3EFactTime AS FLOAT))*1440/30,0,1)*30
		WHEN (Seg3CheckOff=1) And (Seg3EFactTime Is Null) And (Seg3ETime Is Not Null) THEN Seg3TimeLen
		ELSE 0-Seg3TimeLen*60
	      END
	  WHERE (Seg3Enabled=1)
  END

  /*
  --提前上班产生的加班
  IF (@EarlyOnIsOver=1)
  BEGIN
    IF (@Att_OverTimeMode=0)  --按30分钟取整计算
    BEGIN 
	UPDATE T_Att_TempCalc
	SET Seg1Over = ROUND((CAST(Seg1BTime As Float)-Cast(Seg1BFactTime AS FLOAT))*1440/30,0,1)*30 
	WHERE (Seg1Enabled=1) AND (Seg1CheckOn=1)
		AND (Seg1BFactTime Is Not Null) And (Seg1BTime Is Not Null)
		AND (ROUND((CAST(Seg1BTime As Float)-Cast(Seg1BFactTime AS FLOAT))*1440/30,0,1)*30>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg2Over = ROUND((CAST(Seg2BTime As Float)-Cast(Seg2BFactTime AS FLOAT))*1440/30,0,1)*30 
	WHERE (Seg2Enabled=1) AND (Seg2CheckOn=1)
		AND (Seg2BFactTime Is Not Null) And (Seg2BTime Is Not Null)
		AND (ROUND((CAST(Seg2BTime As Float)-Cast(Seg2BFactTime AS FLOAT))*1440/30,0,1)*30>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg3Over = ROUND((CAST(Seg3BTime As Float)-Cast(Seg3BFactTime AS FLOAT))*1440/30,0,1)*30 
	WHERE (Seg3Enabled=1) AND (Seg3CheckOn=1)
		AND (Seg3BFactTime Is Not Null) And (Seg3BTime Is Not Null)
		AND (ROUND((CAST(Seg3BTime As Float)-Cast(Seg3BFactTime AS FLOAT))*1440/30,0,1)*30>=@MinOvertime)
    END
    ELSE IF (@Att_OverTimeMode=1)
    BEGIN 
	UPDATE T_Att_TempCalc
	SET Seg1Over = CONVERT(INT,(CAST(Seg1BTime As Float)-CAST(Seg1BFactTime AS FLOAT))*1440) 
	WHERE (Seg1Enabled=1) AND (Seg1CheckOn=1)
		AND (Seg1BFactTime Is Not Null) And (Seg1BTime Is Not Null)
		AND (CONVERT(INT,(CAST(Seg1BTime As Float)-CAST(Seg1BFactTime AS FLOAT))*1440)>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg2Over = CONVERT(INT,(CAST(Seg2BTime As Float)-Cast(Seg2BFactTime AS FLOAT))*1440)
	WHERE (Seg2Enabled=1) AND (Seg2CheckOn=1)
		AND (Seg2BFactTime Is Not Null) And (Seg2BTime Is Not Null)
		AND (CONVERT(INT,(CAST(Seg2BTime As Float)-Cast(Seg2BFactTime AS FLOAT))*1440)>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg3Over = CONVERT(INT,(CAST(Seg3BTime As Float)-CAST(Seg3BFactTime AS FLOAT))*1440)
	WHERE (Seg3Enabled=1) AND (Seg3CheckOn=1)
		AND (Seg3BFactTime Is Not Null) And (Seg3BTime Is Not Null)
		AND (CONVERT(INT,(CAST(Seg3BTime As Float)-Cast(Seg3BFactTime AS FLOAT))*1440)>=@MinOvertime)
    END
    ELSE IF (@Att_OverTimeMode=2)
    BEGIN 
	UPDATE T_Att_TempCalc
	SET Seg1Over = CEILING((CAST(Seg1BTime As Float)-Cast(Seg1BFactTime AS FLOAT))*1440/30)*30
	WHERE (Seg1Enabled=1) AND (Seg1CheckOn=1)
		AND (Seg1BFactTime Is Not Null) And (Seg1BTime Is Not Null)
		AND (CEILING((CAST(Seg1BTime As Float)-Cast(Seg1BFactTime AS FLOAT))*1440/30)*30>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg2Over = CEILING((CAST(Seg2BTime As Float)-Cast(Seg2BFactTime AS FLOAT))*1440/30)*30
	WHERE (Seg2Enabled=1) AND (Seg2CheckOn=1)
		AND (Seg2BFactTime Is Not Null) And (Seg2BTime Is Not Null)
		AND (CEILING((CAST(Seg2BTime As Float)-Cast(Seg2BFactTime AS FLOAT))*1440/30)*30>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg3Over = CEILING((CAST(Seg3BTime As Float)-Cast(Seg3BFactTime AS FLOAT))*1440/30)*30
	WHERE (Seg3Enabled=1) AND (Seg3CheckOn=1)
		AND (Seg3BFactTime Is Not Null) And (Seg3BTime Is Not Null)
		AND (CEILING((CAST(Seg3BTime As Float)-Cast(Seg3BFactTime AS FLOAT))*1440/30)*30>=@MinOvertime)
    END
  END

  --延迟下班产生的加班
  IF (@LateOffIsOver=1)
  BEGIN
    IF (@Att_OverTimeMode=0)  --按30分钟取整计算
    BEGIN 
	UPDATE T_Att_TempCalc
	SET Seg1Over = ISNULL(Seg1Over,0)+(ROUND((CAST(Seg1EFactTime As Float)-CAST(Seg1ETime AS FLOAT))*1440/30,0,1)*30-@LateOffDecTime) 
	WHERE (Seg1Enabled=1) AND (Seg1CheckOff=1)
		AND (Seg1EFactTime Is Not Null) And (Seg1ETime Is Not Null)
		AND ((ROUND((CAST(Seg1EFactTime As Float)-CAST(Seg1ETime AS FLOAT))*1440/30,0,1)*30-@LateOffDecTime)>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg2Over = ISNULL(Seg2Over,0)+(ROUND((CAST(Seg2EFactTime As Float)-CAST(Seg2ETime AS FLOAT))*1440/30,0,1)*30-@LateOffDecTime) 
	WHERE (Seg2Enabled=1) AND (Seg2CheckOff=1)
		AND (Seg2EFactTime Is Not Null) And (Seg2ETime Is Not Null)
		AND ((ROUND((CAST(Seg2EFactTime As Float)-CAST(Seg2ETime AS FLOAT))*1440/30,0,1)*30-@LateOffDecTime)>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg3Over = ISNULL(Seg3Over,0)+(ROUND((CAST(Seg3EFactTime As Float)-CAST(Seg3ETime AS FLOAT))*1440/30,0,1)*30-@LateOffDecTime) 
	WHERE (Seg3Enabled=1) AND (Seg3CheckOff=1)
		AND (Seg3EFactTime Is Not Null) And (Seg3ETime Is Not Null)
		AND ((ROUND((CAST(Seg3EFactTime As Float)-CAST(Seg3ETime AS FLOAT))*1440/30,0,1)*30-@LateOffDecTime)>=@MinOvertime)
    END
    ELSE IF (@Att_OverTimeMode=1)
    BEGIN 
	UPDATE T_Att_TempCalc
	SET Seg1Over = ISNULL(Seg1Over,0)+(CONVERT(INT,(CAST(Seg1EFactTime As Float)-CAST(Seg1ETime AS FLOAT))*1440)-@LateOffDecTime) 
	WHERE (Seg1Enabled=1) AND (Seg1CheckOff=1)
		AND (Seg1EFactTime Is Not Null) And (Seg1ETime Is Not Null)
		AND ((CONVERT(INT,(CAST(Seg1EFactTime As Float)-CAST(Seg1ETime AS FLOAT))*1440)-@LateOffDecTime)>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg2Over = ISNULL(Seg2Over,0)+(CONVERT(INT,(CAST(Seg2EFactTime As Float)-CAST(Seg2ETime AS FLOAT))*1440)-@LateOffDecTime)
	WHERE (Seg2Enabled=1) AND (Seg2CheckOff=1)
		AND (Seg2EFactTime Is Not Null) And (Seg2ETime Is Not Null)
		AND ((CONVERT(INT,(CAST(Seg2EFactTime As Float)-CAST(Seg2ETime AS FLOAT))*1440)-@LateOffDecTime)>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg3Over = ISNULL(Seg3Over,0)+(CONVERT(INT,(CAST(Seg3EFactTime As Float)-CAST(Seg3ETime AS FLOAT))*1440)-@LateOffDecTime)
	WHERE (Seg3Enabled=1) AND (Seg3CheckOff=1)
		AND (Seg3EFactTime Is Not Null) And (Seg3ETime Is Not Null)
		AND ((CONVERT(INT,(CAST(Seg3EFactTime As Float)-CAST(Seg3ETime AS FLOAT))*1440)-@LateOffDecTime)>=@MinOvertime)
    END
    ELSE IF (@Att_OverTimeMode=2)
    BEGIN 
	UPDATE T_Att_TempCalc
	SET Seg1Over = ISNULL(Seg1Over,0)+(CEILING((CAST(Seg1EFactTime As Float)-CAST(Seg1ETime AS FLOAT))*1440/30)*30-@LateOffDecTime)
	WHERE (Seg1Enabled=1) AND (Seg1CheckOff=1)
		AND (Seg1EFactTime Is Not Null) And (Seg1ETime Is Not Null)
		AND ((CEILING((CAST(Seg1EFactTime As Float)-CAST(Seg1ETime AS FLOAT))*1440/30)*30-@LateOffDecTime)>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg2Over = ISNULL(Seg2Over,0)+(CEILING((CAST(Seg2EFactTime As Float)-CAST(Seg2ETime AS FLOAT))*1440/30)*30-@LateOffDecTime)
	WHERE (Seg2Enabled=1) AND (Seg2CheckOff=1)
		AND (Seg2EFactTime Is Not Null) And (Seg2ETime Is Not Null)
		AND ((CEILING((CAST(Seg2EFactTime As Float)-CAST(Seg2ETime AS FLOAT))*1440/30)*30-@LateOffDecTime)>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg3Over = ISNULL(Seg3Over,0)+(CEILING((CAST(Seg3EFactTime As Float)-CAST(Seg3ETime AS FLOAT))*1440/30)*30-@LateOffDecTime)
	WHERE (Seg3Enabled=1) AND (Seg3CheckOff=1)
		AND (Seg3EFactTime Is Not Null) And (Seg3ETime Is Not Null)
		AND ((CEILING((CAST(Seg3EFactTime As Float)-CAST(Seg3ETime AS FLOAT))*1440/30)*30-@LateOffDecTime)>=@MinOvertime)
    END
  END  */
  Set NOCOUNT OFF

END
' 
END
GO
/****** 对象:  StoredProcedure [dbo].[P_Att_BEValueUp2]    脚本日期: 09/25/2019 10:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_BEValueUp2]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--考勤系统计算迟到/早退时间(按考勤规则)
CREATE PROCEDURE [dbo].[P_Att_BEValueUp2]
AS
BEGIN
  Set NOCOUNT ON   
  DECLARE	@Att_MinLate	Float,
		@Att_MaxLate	Float,
		@Att_MinEarly	Float,
		@Att_MaxEarly	Float,
		@Att_OverTimeMode Int

  --最小迟到时间
  SELECT @Att_MinLate=Value1 FROM T_Com_SysPara WHERE sName=''Att_MinLate''
  IF (@Att_MinLate IS NULL) 
    SET @Att_MinLate = 5
  --最大迟到时间
  SELECT @Att_MaxLate=Value1 FROM T_Com_SysPara WHERE sName=''Att_MaxLate''
  IF (@Att_MaxLate IS NULL) 
    SET @Att_MaxLate = 30
  --最小早退时间
  SELECT @Att_MinEarly=Value1 FROM T_Com_SysPara WHERE sName=''Att_MinEarly''
  IF (@Att_MinEarly IS NULL) 
    SET @Att_MinEarly = 5
  --最大早退时间
  SELECT @Att_MaxEarly=Value1 FROM T_Com_SysPara WHERE sName=''Att_MaxEarly''
  IF (@Att_MaxEarly IS NULL) 
    SET @Att_MaxEarly = 30
  --加班计算方式
  SELECT @Att_OverTimeMode=Value1 FROM T_Com_SysPara WHERE sName=''Att_OverTimeMode''
  Set @Att_OverTimeMode=ISNULL(@Att_OverTimeMode,1)

  UPDATE T_Att_TempCalc 
  SET Seg1BValue = CASE 
	WHEN (Seg1CheckOn=0) THEN 0
	WHEN (Seg1CheckOn=1) And (Seg1BValue <= @Att_MinLate) THEN 0
	WHEN (Seg1CheckOn=1) And (Seg1BValue Between @Att_MinLate And @Att_MaxLate) AND (Seg1CalcLate=0) THEN 0			--不计迟到
	WHEN (Seg1CheckOn=1) And (Seg1BValue Between @Att_MinLate And @Att_MaxLate) AND (Seg1CalcLate=1) THEN Seg1BValue		--计迟到
	WHEN (Seg1CheckOn=1) And (Seg1BValue > @Att_MaxLate) And (Seg1CalcAbsent=0) THEN Seg1BValue					--不计缺勤,记为迟到时间,工时=时长-迟到时间
	WHEN (Seg1CheckOn=1) And (Seg1BValue > @Att_MaxLate) And (Seg1CalcAbsent=1) THEN Seg1TimeLen				--计缺勤
	ELSE Seg1TimeLen
      END,

      Seg1EValue = CASE
	WHEN (Seg1CheckOff=0) THEN 0
	WHEN (Seg1CheckOff=1) And (Seg1EValue <= @Att_MinEarly) THEN 0
	WHEN (Seg1CheckOff=1) And (Seg1EValue Between @Att_MinEarly And @Att_MaxEarly) AND (Seg1CalcEarly=0) THEN 0			--不计早退
	WHEN (Seg1CheckOff=1) And (Seg1EValue Between @Att_MinEarly And @Att_MaxEarly) AND (Seg1CalcEarly=1) THEN Seg1EValue	--计早退
	WHEN (Seg1CheckOff=1) And (Seg1EValue > @Att_MaxEarly) And (Seg1CalcAbsent=0) THEN Seg1EValue					--不计缺勤,记为早退时间,工时=时长-早退时间
	WHEN (Seg1CheckOff=1) And (Seg1EValue > @Att_MaxEarly) And (Seg1CalcAbsent=1) THEN Seg1TimeLen				--计缺勤
	ELSE Seg1TimeLen
      END
  WHERE (Seg1Enabled=1) 

  UPDATE T_Att_TempCalc 
  SET Seg2BValue = CASE 
	WHEN (Seg2CheckOn=0) THEN 0
	WHEN (Seg2CheckOn=1) And (Seg2BValue <= @Att_MinLate) THEN 0
	WHEN (Seg2CheckOn=1) And (Seg2BValue Between @Att_MinLate And @Att_MaxLate) AND (Seg2CalcLate=0) THEN 0			--不计迟到
	WHEN (Seg2CheckOn=1) And (Seg2BValue Between @Att_MinLate And @Att_MaxLate) AND (Seg2CalcLate=1) THEN Seg2BValue		--计迟到
	WHEN (Seg2CheckOn=1) And (Seg2BValue > @Att_MaxLate) And (Seg2CalcAbsent=0) THEN Seg2BValue					--不计缺勤,记为迟到时间,工时=时长-迟到时间
	WHEN (Seg2CheckOn=1) And (Seg2BValue > @Att_MaxLate) And (Seg2CalcAbsent=1) THEN Seg2TimeLen				--计缺勤
	ELSE Seg2TimeLen
      END,

      Seg2EValue = CASE
	WHEN (Seg2CheckOff=0) THEN 0
	WHEN (Seg2CheckOff=1) And (Seg2EValue <= @Att_MinEarly) THEN 0
	WHEN (Seg2CheckOff=1) And (Seg2EValue Between @Att_MinEarly And @Att_MaxEarly) AND (Seg2CalcEarly=0) THEN 0			--不计早退
	WHEN (Seg2CheckOff=1) And (Seg2EValue Between @Att_MinEarly And @Att_MaxEarly) AND (Seg2CalcEarly=1) THEN Seg2EValue	--计早退
	WHEN (Seg2CheckOff=1) And (Seg2EValue > @Att_MaxEarly) And (Seg2CalcAbsent=0) THEN Seg2EValue					--不计缺勤,记为早退时间,工时=时长-早退时间
	WHEN (Seg2CheckOff=1) And (Seg2EValue > @Att_MaxEarly) And (Seg2CalcAbsent=1) THEN Seg2TimeLen				--计缺勤
	ELSE Seg2TimeLen
      END
  WHERE (Seg2Enabled=1) 

    UPDATE T_Att_TempCalc 
    SET Seg3BValue = CASE 
	WHEN (Seg3CheckOn=0) THEN 0													--上班不打卡
	WHEN (Seg3CheckOn=1) And (Seg3CalcLate=0) THEN Seg3BValue									--上班打卡，不计迟到，按实际时间计
	WHEN (Seg3CheckOn=1) And (Seg3CalcLate=1) And (Seg3BValue <= @Att_MinLate) THEN 0						--上班打卡，计迟到,实到时间小于最小迟到时间，计0
	WHEN (Seg3CheckOn=1) And (Seg3CalcLate=1) And (Seg3BValue>@Att_MinLate) And (Seg3BValue<=@Att_MaxLate) THEN Seg3BValue		--上班打卡，计迟到,实到时间大于最小迟到时间，小于最大迟到时间，按实时时间计
	WHEN (Seg3CheckOn=1) And (Seg3CalcAbsent=0) And (Seg3BValue > @Att_MaxLate) THEN Seg3BValue					--不计缺勤,记为迟到时间,工时=时长-迟到时间
	WHEN (Seg3CheckOn=1) And (Seg3CalcAbsent=1) And (Seg3BValue > @Att_MaxLate) THEN Seg3TimeLen				--计缺勤
	ELSE Seg3TimeLen
        END,

        Seg3EValue = CASE
	WHEN (Seg3CheckOff=0) THEN 0
	WHEN (Seg3CheckOff=1) And (Seg3EValue <= @Att_MinEarly) THEN 0
	WHEN (Seg3CheckOff=1) And (Seg3CalcEarly=0) THEN Seg3EValue									--不计早退
	WHEN (Seg3CheckOff=1) And (Seg3CalcEarly=1) And (Seg3EValue <= @Att_MinEarly) THEN 0						--下班打卡，计早退,实到时间小于最小早退时间，计0
	WHEN (Seg3CheckOff=1) AND (Seg3CalcEarly=1) And (Seg3EValue>@Att_MinEarly) And (Seg3EValue<=@Att_MaxEarly) THEN Seg3EValue	--下班打卡，计早退且时间
	WHEN (Seg3CheckOff=1) And (Seg3CalcAbsent=0) And (Seg3EValue > @Att_MaxEarly) THEN Seg3EValue					--下班打卡，不计缺勤,记为早退时间,工时=时长-早退时间
	WHEN (Seg3CheckOff=1) And (Seg3CalcAbsent=1) And (Seg3EValue > @Att_MaxEarly) THEN Seg3TimeLen				--下班打卡，计缺勤
	ELSE Seg3TimeLen
        END
    WHERE (Seg3Enabled=1) 
  Set NOCOUNT OFF
END
' 
END
GO
/****** 对象:  StoredProcedure [dbo].[P_Att_StatDayAttendUp]    脚本日期: 09/25/2019 10:09:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_StatDayAttendUp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--考勤系统统计一天的考勤结果及其值（迟到、早退、请假、加班等)
CREATE PROCEDURE [dbo].[P_Att_StatDayAttendUp]
AS
BEGIN
  DECLARE	@MaxDayOvertime	int	--天最长加班时间（分）

  --统计班内轮班人员周六及周日休息人员总 工时,应出勤(天),减去公休天数
  UPDATE T_Att_TempCalc 
  SET AllTimeLen= CASE
      WHEN (AllTimeLen IS NULL) THEN Seg1TimeLen
      ELSE AllTimeLen+Seg1TimeLen
    END,
    ShallDay= CASE
      WHEN (ShallDay IS NULL) THEN 0.5
      ELSE ShallDay+0.5
    END
  WHERE (Seg1Type in (1,2)) AND (Class_Key is Not NULL)  AND (Seg1BResult<>9) AND(Seg1EResult<>9) AND (AttendType=1)

  --统计调班人员总工时，应出勤(天)
  UPDATE T_Att_TempCalc 
  SET AllTimeLen= CASE
      WHEN (AllTimeLen IS NULL) THEN Seg1TimeLen
     ELSE AllTimeLen+Seg1TimeLen
    END,
    ShallDay= CASE
      WHEN (ShallDay IS NULL) THEN 0.5
      ELSE ShallDay+0.5
    END
  FROM T_Att_TempCalc TempCalc,T_Att_Adjust Adjust
  WHERE (TempCalc.Seg1Type in (1,2)) AND (TempCalc.Class_Key is Not NULL) AND (TempCalc.Person_Key=Adjust.Person_Key) AND (TempCalc.PlanDate=Adjust.AdjustDate) 
                 AND (AttendType=1)

  UPDATE T_Att_TempCalc 
  SET AllTimeLen= CASE
      WHEN (AllTimeLen IS NULL) THEN Seg2TimeLen
      ELSE AllTimeLen+Seg2TimeLen
    END,
    ShallDay= CASE
      WHEN (ShallDay IS NULL) THEN 0.5
      ELSE ShallDay+0.5
    END
  WHERE (Seg2Type in (1,2)) AND (Class_Key is Not NULL)   AND (Seg2BResult<>9) AND(Seg2EResult<>9) AND (AttendType=1)
  --统计调班人员总工时，应出勤(天)减去公休天数
  UPDATE T_Att_TempCalc 
  SET AllTimeLen= CASE
      WHEN (AllTimeLen IS NULL) THEN Seg2TimeLen
      ELSE AllTimeLen+Seg2TimeLen
    END,
    ShallDay= CASE
      WHEN (ShallDay IS NULL) THEN 0.5
      ELSE ShallDay+0.5
    END
  FROM T_Att_TempCalc TempCalc,T_Att_Adjust Adjust
  WHERE (TempCalc.Seg2Type in (1,2)) AND (TempCalc.Class_Key is Not NULL) AND (TempCalc.Person_Key=Adjust.Person_Key) AND (TempCalc.PlanDate=Adjust.AdjustDate) 
                 AND (AttendType=1)





  --统计固定班次周六及周日休息人员总 工时,应出勤(天)不含公休天数
  UPDATE T_Att_TempCalc 
  SET AllTimeLen= CASE
      WHEN (AllTimeLen IS NULL) THEN Seg1TimeLen
      ELSE AllTimeLen+Seg1TimeLen
    END,
    ShallDay= CASE
      WHEN (ShallDay IS NULL) THEN 0.5
      ELSE ShallDay+0.5
    END
  WHERE (Seg1Type in (1,2)) AND (Class_Key is Not NULL)  AND (Seg1BResult<>9) AND(Seg1EResult<>9)  AND (AttendType=0) 
                AND (RestType=0) AND (WeekOfDay in (2,3,4,5,6)) AND (IsHoliday=0)

  --统计调班人员总工时，应出勤(天)
  UPDATE T_Att_TempCalc 
  SET AllTimeLen= CASE
      WHEN (AllTimeLen IS NULL) THEN Seg1TimeLen
      ELSE AllTimeLen+Seg1TimeLen
    END,
    ShallDay= CASE
      WHEN (ShallDay IS NULL) THEN 0.5
      ELSE ShallDay+0.5
    END
  FROM T_Att_TempCalc TempCalc,T_Att_Adjust Adjust
  WHERE (TempCalc.Seg1Type in (1,2))  AND (AttendType=0) AND (RestType=0) AND  ((WeekOfDay in (1,7)) OR (IsHoliday=1))
                AND (TempCalc.Class_Key is Not NULL) AND (TempCalc.Person_Key=Adjust.Person_Key) AND (TempCalc.PlanDate=Adjust.AdjustDate) 

  UPDATE T_Att_TempCalc 
  SET AllTimeLen= CASE
      WHEN (AllTimeLen IS NULL) THEN Seg2TimeLen
      ELSE AllTimeLen+Seg2TimeLen
    END,
    ShallDay= CASE
      WHEN (ShallDay IS NULL) THEN 0.5
      ELSE ShallDay+0.5
    END
  WHERE (Seg2Type in (1,2)) AND (Class_Key is Not NULL)   AND (Seg2BResult<>9) AND(Seg2EResult<>9) 
              AND (AttendType=0) AND (RestType=0) AND (WeekOfDay in (2,3,4,5,6)) AND (IsHoliday=0)
  --统计调班人员总工时，应出勤(天)
  UPDATE T_Att_TempCalc 
  SET AllTimeLen= CASE
      WHEN (AllTimeLen IS NULL) THEN Seg2TimeLen
      ELSE AllTimeLen+Seg2TimeLen
    END,
    ShallDay= CASE
      WHEN (ShallDay IS NULL) THEN 0.5
      ELSE ShallDay+0.5
    END
  FROM T_Att_TempCalc TempCalc,T_Att_Adjust Adjust
  WHERE (TempCalc.Seg2Type in (1,2)) AND (TempCalc.Class_Key is Not NULL)  AND (AttendType=0) AND (RestType=0) AND ((WeekOfDay in (1,7)) OR (IsHoliday=1))
                AND (TempCalc.Person_Key=Adjust.Person_Key) AND (TempCalc.PlanDate=Adjust.AdjustDate) 



  --统计固定班次周六半日及周日休息人员总 工时,应出勤(天)不含公休天数
  UPDATE T_Att_TempCalc 
  SET AllTimeLen= CASE
      WHEN (AllTimeLen IS NULL) THEN Seg1TimeLen
      ELSE AllTimeLen+Seg1TimeLen
    END,
    ShallDay= CASE
      WHEN (ShallDay IS NULL) THEN 0.5
      ELSE ShallDay+0.5
    END
  WHERE (Seg1Type in (1,2)) AND (Class_Key is Not NULL)   AND (Seg1BResult<>9) AND(Seg1EResult<>9)
               AND (AttendType=0)  AND (RestType=1) AND (WeekOfDay in (2,3,4,5,6,7)) AND (IsHoliday=0)

  --统计调班人员总工时，应出勤(天)
  UPDATE T_Att_TempCalc 
  SET AllTimeLen= CASE
      WHEN (AllTimeLen IS NULL) THEN Seg1TimeLen
      ELSE AllTimeLen+Seg1TimeLen
    END,
    ShallDay= CASE
      WHEN (ShallDay IS NULL) THEN 0.5
      ELSE ShallDay+0.5
    END
  FROM T_Att_TempCalc TempCalc,T_Att_Adjust Adjust
  WHERE (TempCalc.Seg1Type in (1,2)) AND (TempCalc.Class_Key is Not NULL) AND (AttendType=0)  AND (RestType=1) AND ((WeekOfDay in (1)) OR (IsHoliday=1))
                AND (TempCalc.Person_Key=Adjust.Person_Key) AND (TempCalc.PlanDate=Adjust.AdjustDate) 

  UPDATE T_Att_TempCalc 
  SET AllTimeLen= CASE
      WHEN (AllTimeLen IS NULL) THEN Seg2TimeLen
      ELSE AllTimeLen+Seg2TimeLen
    END,
    ShallDay= CASE
      WHEN (ShallDay IS NULL) THEN 0.5
      ELSE ShallDay+0.5
    END
  WHERE (Seg2Type in (1,2)) AND (Class_Key is Not NULL)   AND (Seg2BResult<>9) AND(Seg2EResult<>9)
                 AND (AttendType=0)  AND (RestType=1) AND (WeekOfDay in (2,3,4,5,6)) AND (IsHoliday=0)

  --统计调班人员总工时，应出勤(天)
  UPDATE T_Att_TempCalc 
  SET AllTimeLen= CASE
      WHEN (AllTimeLen IS NULL) THEN Seg2TimeLen
      ELSE AllTimeLen+Seg2TimeLen
    END,
    ShallDay= CASE
      WHEN (ShallDay IS NULL) THEN 0.5
      ELSE ShallDay+0.5
    END
  FROM T_Att_TempCalc TempCalc,T_Att_Adjust Adjust
  WHERE (TempCalc.Seg2Type in (1,2)) AND (TempCalc.Class_Key is Not NULL) AND (AttendType=0)  AND (RestType=1) AND ((WeekOfDay in (1,7)) OR (IsHoliday=1))
                AND (TempCalc.Person_Key=Adjust.Person_Key) AND (TempCalc.PlanDate=Adjust.AdjustDate) 

  --统计固定班次周日休息人员总 工时,应出勤(天)不含公休天数
  UPDATE T_Att_TempCalc 
  SET AllTimeLen= CASE
      WHEN (AllTimeLen IS NULL) THEN Seg1TimeLen
      ELSE AllTimeLen+Seg1TimeLen
    END,
    ShallDay= CASE
      WHEN (ShallDay IS NULL) THEN 0.5
      ELSE ShallDay+0.5
    END
  WHERE (Seg1Type in (1,2)) AND (Class_Key is Not NULL)  AND (Seg1BResult<>9) AND(Seg1EResult<>9)
              AND (AttendType=0)  AND (RestType=2) AND (WeekOfDay in (2,3,4,5,6,7)) AND (IsHoliday=0)
  --统计调班人员总工时，应出勤(天)
  UPDATE T_Att_TempCalc 
  SET AllTimeLen= CASE
      WHEN (AllTimeLen IS NULL) THEN Seg1TimeLen
      ELSE AllTimeLen+Seg1TimeLen
    END,
    ShallDay= CASE
      WHEN (ShallDay IS NULL) THEN 0.5
      ELSE ShallDay+0.5
    END
  FROM T_Att_TempCalc TempCalc,T_Att_Adjust Adjust
  WHERE (TempCalc.Seg1Type in (1,2)) AND (TempCalc.Class_Key is Not NULL) AND (AttendType=0)  AND (RestType=2) AND ((WeekOfDay in (1)) OR (IsHoliday=1)) 
                AND (TempCalc.Person_Key=Adjust.Person_Key) AND (TempCalc.PlanDate=Adjust.AdjustDate) 




  UPDATE T_Att_TempCalc 
  SET AllTimeLen= CASE
      WHEN (AllTimeLen IS NULL) THEN Seg2TimeLen
      ELSE AllTimeLen+Seg2TimeLen
    END,
    ShallDay= CASE
      WHEN (ShallDay IS NULL) THEN 0.5
      ELSE ShallDay+0.5
    END
  WHERE (Seg2Type in (1,2)) AND (Class_Key is Not NULL)  AND (Seg2BResult<>9) AND(Seg2EResult<>9)
                AND (AttendType=0)  AND (RestType=2) AND (WeekOfDay in (2,3,4,5,6,7)) AND (IsHoliday=0)
  --统计周日或法定假日上班算应出勤(天)
  UPDATE T_Att_TempCalc 
  SET AllTimeLen= CASE
      WHEN (AllTimeLen IS NULL) THEN Seg2TimeLen
      ELSE AllTimeLen+Seg2TimeLen
    END,
    ShallDay= CASE
      WHEN (ShallDay IS NULL) THEN 0.5
      ELSE ShallDay+0.5
    END
  FROM T_Att_TempCalc TempCalc,T_Att_Adjust Adjust
  WHERE (TempCalc.Seg2Type in (1,2)) AND (TempCalc.Class_Key is Not NULL)  AND (AttendType=0)  AND (RestType=2) AND ((WeekOfDay in (1)) OR (IsHoliday=1))
                AND (TempCalc.Person_Key=Adjust.Person_Key) AND (TempCalc.PlanDate=Adjust.AdjustDate) 

  UPDATE T_Att_TempCalc SET AllTimeLen=0 WHERE AllTimeLen IS NULL
  UPDATE T_Att_TempCalc SET ShallDay=0 WHERE ShallDay IS NULL


--=====================================================================================================================================================================

  --统计班内出勤工时,实出勤(天)
  UPDATE T_Att_TempCalc 
  SET OnDutyM= CASE
      WHEN (OnDutyM IS NULL) THEN Seg1Work
      ELSE OnDutyM+Seg1Work
    END,
    FactDay= CASE
      WHEN (FactDay IS NULL)  THEN 0.5
      ELSE FactDay+0.5
    END
  WHERE ((Seg1BResult in (1,2,3,4,5,6,17,19))and (Seg1EResult in (1,2,3,4,5,6,17,19)))
 -- WHERE ((Seg1BResult in (1,2,3,4,5,17,19))and (Seg1EResult in (1,2,3,4,5,6,17,19)))

  UPDATE T_Att_TempCalc 
  SET OnDutyM= CASE
      WHEN (OnDutyM IS NULL) THEN Seg2Work
      ELSE OnDutyM+Seg2Work
    END,
    FactDay= CASE
      WHEN (FactDay IS NULL) THEN 0.5
      ELSE FactDay+0.5
    END
  WHERE ((Seg2BResult in (1,2,3,4,5,6,17,19))and (Seg2EResult in (1,2,3,4,5,6,17,19)))
 -- WHERE ((Seg2BResult in (1,2,3,4,5,17,19))and (Seg2EResult in (1,2,3,4,5,6,7,8,17,19)))

    --缺勤时间=应出勤小时-实出勤小时
  --UPDATE T_Att_TempCalc SET AbsentM = AllTimeLen-OnDutyM 
  
  --统计班内迟到
  UPDATE T_Att_TempCalc
  SET LaterM = CASE 
      WHEN (LaterM IS NULL) then Seg1BValue
      ELSE LaterM+Seg1BValue 
    END,
    LaterT = CASE 
      WHEN (LaterT IS NULL) THEN 1 
      ELSE LaterT+1 
    END
  WHERE (Seg1BResult=17)AND (not (Seg1Type in(7,8)))

  UPDATE T_Att_TempCalc
  SET LaterM = CASE 
      WHEN (LaterM IS NULL) then Seg1EValue
      ELSE LaterM+Seg1EValue 
    END,
    LaterT = CASE 
      WHEN (LaterT IS NULL) THEN 1 
      ELSE LaterT+1 
    END
  WHERE (Seg1EResult=17)AND (not (Seg1Type in(7,8)))

  UPDATE T_Att_TempCalc
  SET LaterM = CASE 
      WHEN (LaterM IS NULL) then Seg2BValue
      ELSE LaterM+Seg2BValue 
    END,
    LaterT = CASE 
      WHEN (LaterT IS NULL) THEN 1 
      ELSE LaterT+1 
    END
  WHERE (Seg2BResult=17)AND (not (Seg2Type in(7,8)))

  UPDATE T_Att_TempCalc
  SET LaterM = CASE 
      WHEN (LaterM IS NULL) then Seg2EValue
      ELSE LaterM+Seg2EValue 
    END,
    LaterT = CASE 
      WHEN (LaterT IS NULL) THEN 1 
      ELSE LaterT+1 
    END
  WHERE (Seg2EResult=17)AND (not (Seg2Type in(7,8)))

  UPDATE T_Att_TempCalc
  SET LaterM = CASE 
      WHEN (LaterM IS NULL) then Seg3BValue
      ELSE LaterM+Seg3BValue 
    END,
    LaterT = CASE 
      WHEN (LaterT IS NULL) THEN 1 
      ELSE LaterT+1 
    END
  WHERE (Seg3BResult=17)AND (not (Seg3Type in(7,8)))

  UPDATE T_Att_TempCalc
  SET LaterM = CASE 
      WHEN (LaterM IS NULL) then Seg3EValue
      ELSE LaterM+Seg3EValue 
    END,
    LaterT = CASE 
      WHEN (LaterT IS NULL) THEN 1 
      ELSE LaterT+1 
    END
  WHERE (Seg3EResult=17)AND (not (Seg3Type in(7,8)))


  --统计班内早退
  UPDATE T_Att_TempCalc
  SET EarlyM = CASE 
      WHEN (EarlyM IS NULL) then Seg1BValue
      ELSE EarlyM+Seg1BValue 
    END,
    EarlyT = CASE 
      WHEN (EarlyT IS NULL) THEN 1 
      ELSE EarlyT+1 
    END
  WHERE (Seg1BResult=19)AND (not (Seg1Type in(7,8)))

  UPDATE T_Att_TempCalc
  SET EarlyM = CASE 
      WHEN (EarlyM IS NULL) then Seg1EValue
      ELSE EarlyM+Seg1EValue 
    END,
    EarlyT = CASE 
      WHEN (EarlyT IS NULL) THEN 1 
      ELSE EarlyT+1 
    END
  WHERE (Seg1EResult=19)AND (not (Seg1Type in(7,8)))

  UPDATE T_Att_TempCalc
  SET EarlyM = CASE 
      WHEN (EarlyM IS NULL) then Seg2BValue
      ELSE EarlyM+Seg2BValue 
    END,
    EarlyT = CASE 
      WHEN (EarlyT IS NULL) THEN 1 
      ELSE EarlyT+1 
    END
  WHERE (Seg2BResult=19) AND (not (Seg2Type in(7,8)))

  UPDATE T_Att_TempCalc
  SET EarlyM = CASE 
      WHEN (EarlyM IS NULL) then Seg2EValue
      ELSE EarlyM+Seg2EValue 
    END,
    EarlyT = CASE 
      WHEN (EarlyT IS NULL) THEN 1 
      ELSE EarlyT+1 
    END
  WHERE (Seg2EResult=19)AND (not (Seg2Type in(7,8)))

  UPDATE T_Att_TempCalc
  SET EarlyM = CASE 
      WHEN (EarlyM IS NULL) then Seg3BValue
      ELSE EarlyM+Seg3BValue 
    END,
    EarlyT = CASE 
      WHEN (EarlyT IS NULL) THEN 1 
      ELSE EarlyT+1 
    END
  WHERE (Seg3BResult=19)AND (not (Seg3Type in(7,8)))

  UPDATE T_Att_TempCalc
  SET EarlyM = CASE 
      WHEN (EarlyM IS NULL) then Seg3EValue

      ELSE EarlyM+Seg3EValue 
    END,
    EarlyT = CASE 
      WHEN (EarlyT IS NULL) THEN 1 
      ELSE EarlyT+1 
    END
  WHERE (Seg3EResult=19)and (not (Seg3Type in(7,8)))

  --统计班内缺勤
  UPDATE T_Att_TempCalc
  SET --AbsentM = CASE 
     -- WHEN (AbsentM IS NULL) then Seg1TimeLen-Seg1Work
      --ELSE AbsentM+(Seg1TimeLen-Seg1Work)
      --END,
    AbsentT = CASE 
      WHEN (AbsentT IS NULL) THEN 1 
      ELSE AbsentT+1 
    END,
    AbsentDay= CASE
      WHEN (AbsentDay IS NULL) THEN 0.5
      ELSE AbsentDay+0.5
    END
  WHERE ((Seg1BResult=21) or (Seg1EResult=21)) and (not (Seg1Type in(7,8)))


  UPDATE T_Att_TempCalc
  SET-- AbsentM = CASE 
     -- WHEN (AbsentM IS NULL) then Seg2TimeLen-Seg2Work
     -- ELSE AbsentM+(Seg2TimeLen-Seg2Work)
     -- END,
    AbsentT = CASE 
      WHEN (AbsentT IS NULL) THEN 1 
      ELSE AbsentT+1 
    END,
    AbsentDay= CASE
        WHEN (AbsentDay IS NULL) THEN 0.5      
        ELSE AbsentDay+0.5
    END
  WHERE ((Seg2BResult=21) or (Seg2EResult=21))and (not (Seg2Type in(7,8)))

  UPDATE T_Att_TempCalc
  SET 
    AbsentT = CASE 
      WHEN (AbsentT IS NULL) THEN 1 
      ELSE AbsentT+1 
    END
  WHERE ((Seg3BResult=21) or (Seg3EResult=21))and (not (Seg3Type in(7,8)))

  UPDATE T_Att_TempCalc SET  AbsentT=0 WHERE AbsentT IS NULL
  UPDATE T_Att_TempCalc SET  AbsentDay=0 WHERE AbsentDay IS NULL

  UPDATE T_Att_TempCalc SET AbsentM =CASE
                                                                     when (AllTimeLen-ISNULL(Seg1Work,0)-ISNULL(Seg2Work,0))<0  THEN  0
                                                                     else  AllTimeLen-ISNULL(Seg1Work,0)-ISNULL(Seg2Work,0)
                                                                     end
                                                                     WHERE(Class_Key IS not  NULL)

  

  --统计班内病假
 /* UPDATE T_Att_TempCalc
  SET illM = CASE 
      WHEN (illM IS NULL) then Seg1Work
      ELSE illM+Seg1Work 
    END
  WHERE ((Seg1BResult=11) or (Seg1EResult=11))

  UPDATE T_Att_TempCalc
  SET illM = CASE 
      WHEN (illM IS NULL) then Seg2Work
      ELSE illM+Seg2Work 
    END
  WHERE ((Seg2BResult=11) or (Seg2EResult=11))

  UPDATE T_Att_TempCalc
  SET illM = CASE 
      WHEN (illM IS NULL) then Seg3Work
      ELSE illM+Seg3Work 
    END
  WHERE ((Seg3BResult=11) or (Seg3EResult=11))*/

  /*--统计班内事假
  UPDATE T_Att_TempCalc
  SET AffairM = CASE 
      WHEN (AffairM IS NULL) then Seg1Work
      ELSE AffairM+Seg1Work 
    END
  WHERE ((Seg1BResult=10) or (Seg1EResult=10))

  UPDATE T_Att_TempCalc
  SET AffairM = CASE 
      WHEN (AffairM IS NULL) then Seg2Work
      ELSE AffairM+Seg2Work 
    END
  WHERE ((Seg2BResult=10) or (Seg2EResult=10))

  UPDATE T_Att_TempCalc
  SET AffairM = CASE 
      WHEN (AffairM IS NULL) then Seg3Work
      ELSE AffairM+Seg3Work 
    END
  WHERE ((Seg3BResult=10) or (Seg3EResult=10))*/

  --统计班内公休
  /*UPDATE T_Att_TempCalc
  SET PubRestM = CASE 
      WHEN (PubRestM IS NULL) then Seg1Work
      ELSE PubRestM+Seg1Work 
    END
  WHERE ((Seg1BResult=9) or (Seg1EResult=9))

  UPDATE T_Att_TempCalc
  SET PubRestM = CASE 
      WHEN (PubRestM IS NULL) then Seg2Work
      ELSE PubRestM+Seg2Work 
    END
  WHERE ((Seg2BResult=9) or (Seg2EResult=9))*/

--第三段不计 2011/12/17
/*  UPDATE T_Att_TempCalc
  SET PubRestM = CASE 
      WHEN (PubRestM IS NULL) then Seg3Work
      ELSE PubRestM+Seg3Work 
    END
  WHERE ((Seg3BResult=9) or (Seg3EResult=9))*/

  --统计班内年假
  /*UPDATE T_Att_TempCalc
  SET YearM = CASE 
      WHEN (YearM IS NULL) then Seg1Work
      ELSE YearM+Seg1Work 
    END
  WHERE ((Seg1BResult=12) or (Seg1EResult=12))

  UPDATE T_Att_TempCalc
  SET YearM = CASE 
      WHEN (YearM IS NULL) then Seg2Work
      ELSE YearM+Seg2Work 
    END
  WHERE ((Seg2BResult=12) or (Seg2EResult=12))*/

--第三段不计 2011/12/17
  /*UPDATE T_Att_TempCalc
  SET YearM = CASE 
      WHEN (YearM IS NULL) then Seg3Work
      ELSE YearM+Seg3Work 
    END
  WHERE ((Seg3BResult=12) or (Seg3EResult=12))*/

  --统计班内婚假
  /*UPDATE T_Att_TempCalc
  SET MarrigeM = CASE 
      WHEN (MarrigeM IS NULL) then Seg1Work
      ELSE MarrigeM+Seg1Work     END
  WHERE ((Seg1BResult=13) or (Seg1EResult=13))


  UPDATE T_Att_TempCalc
  SET MarrigeM = CASE 
      WHEN (MarrigeM IS NULL) then Seg2Work
      ELSE MarrigeM+Seg2Work 
    END
  WHERE ((Seg2BResult=13) or (Seg2EResult=13))*/

--第三段不计 2011/12/17
/*  UPDATE T_Att_TempCalc
  SET MarrigeM = CASE 
      WHEN (MarrigeM IS NULL) then Seg3Work
      ELSE MarrigeM+Seg3Work 
    END
  WHERE ((Seg3BResult=13) or (Seg3EResult=13))*/


  --统计班内丧假
  /*UPDATE T_Att_TempCalc
  SET MournM = CASE 
      WHEN (MournM IS NULL) then Seg1Work
      ELSE MournM+Seg1Work 
    END
  WHERE ((Seg1BResult=26) or (Seg1EResult=26))

  UPDATE T_Att_TempCalc
  SET MournM = CASE 
      WHEN (MournM IS NULL) then Seg2Work
      ELSE MournM+Seg2Work 
    END
  WHERE ((Seg2BResult=26) or (Seg2EResult=26))*/

--第三段不计 2011/12/17
/*  UPDATE T_Att_TempCalc
  SET MournM = CASE 
      WHEN (MournM IS NULL) then Seg3Work
      ELSE MournM+Seg3Work 
    END
  WHERE ((Seg3BResult=26) or (Seg3EResult=26))*/


  --统计班内产假
  /*UPDATE T_Att_TempCalc
  SET MaternityM = CASE 
      WHEN (MaternityM IS NULL) then Seg1Work
      ELSE MaternityM+Seg1Work 
    END
  WHERE ((Seg1BResult=25) or (Seg1EResult=25))

  UPDATE T_Att_TempCalc
  SET MaternityM = CASE 
      WHEN (MaternityM IS NULL) then Seg2Work
      ELSE MaternityM+Seg2Work 
    END
  WHERE ((Seg2BResult=25) or (Seg2EResult=25))*/

--第三段不计 2011/12/17
/*  UPDATE T_Att_TempCalc
  SET MaternityM = CASE 
      WHEN (MaternityM IS NULL) then Seg3Work
      ELSE MaternityM+Seg3Work 
    END
  WHERE ((Seg3BResult=25) or (Seg3EResult=25))*/

  --统计班内出差
 /* UPDATE T_Att_TempCalc
  SET EvectionM = CASE 
      WHEN (EvectionM IS NULL) then Seg1Work
      ELSE EvectionM+Seg1Work 
    END
  WHERE ((Seg1BResult=14) or (Seg1EResult=14))

  UPDATE T_Att_TempCalc
  SET EvectionM = CASE 
      WHEN (EvectionM IS NULL) then Seg2Work
      ELSE EvectionM+Seg2Work 
    END
  WHERE ((Seg2BResult=14) or (Seg2EResult=14))*/

--第三段不计 2011/12/17
/*  UPDATE T_Att_TempCalc
  SET EvectionM = CASE 
      WHEN (EvectionM IS NULL) then Seg3Work
      ELSE EvectionM+Seg3Work 
    END
  WHERE ((Seg3BResult=14) or (Seg3EResult=14))*/

  --统计班内外出
  /*UPDATE T_Att_TempCalc
  SET EgressM = CASE 
      WHEN (EgressM IS NULL) then Seg1Work
      ELSE EgressM+Seg1Work 
    END,
    EgressT = CASE 
      WHEN (EgressT IS NULL) THEN 1 
      ELSE EgressT+1 
    END
  WHERE ((Seg1BResult=15) or (Seg1EResult=15))

  UPDATE T_Att_TempCalc
  SET EgressM = CASE 
      WHEN (EgressM IS NULL) then Seg2Work
      ELSE EgressM+Seg2Work 
    END,
    EgressT = CASE 
      WHEN (EgressT IS NULL) THEN 1 
      ELSE EgressT+1 
    END
  WHERE ((Seg2BResult=15) or (Seg2EResult=15))*/

--第三段不计 2011/12/17
/*  UPDATE T_Att_TempCalc
  SET EgressM = CASE 
      WHEN (EgressM IS NULL) then Seg3Work
      ELSE EgressM+Seg3Work 
    END,
    EgressT = CASE 
      WHEN (EgressT IS NULL) THEN 1 
      ELSE EgressT+1 
    END
  WHERE ((Seg3BResult=15) or (Seg3EResult=15))*/


  --存在最长加班时间（分），仅对第三时段有效
  SELECT @MaxDayOvertime=Value1 From T_Com_SysPara where sName=''Att_MaxDayOvertime''
  IF (ISNULL(@MaxDayOvertime,0)>0)
  begin
    UPDATE T_Att_TempCalc SET Seg3Work=@MaxDayOvertime Where (Seg3Work>@MaxDayOvertime)
  end

  --统计工作日、平时加班日，提前上班、延时下班（计为平日加班）
  UPDATE T_Att_TempCalc
  SET Over1M = CASE 
      WHEN (Over1M IS NULL) then ISNULL(Seg1Over,0)
      ELSE Over1M+ISNULL(Seg1Over,0) 
    END
 -- WHERE (((Seg1BResult>=1) and (Seg1BResult<=6)) or ((Seg1EResult>=1) and (Seg1EResult<=6)))  --平时提前、延迟下班加班计为平时加班
 WHERE ( (Seg1BResult=6) or (Seg1EResult=6))  --平时提前、延迟下班加班计为平时加班


  UPDATE T_Att_TempCalc
  SET Over1M = CASE 
      WHEN (Over1M IS NULL) then ISNULL(Seg2Over,0)
      ELSE Over1M+ISNULL(Seg2Over,0) 
    END
 -- WHERE (((Seg1BResult>=1) and (Seg1BResult<=6)) or ((Seg1EResult>=1) and (Seg1EResult<=6)))  --平时提前、延迟下班加班计为平时加班
 WHERE ( (Seg2BResult=6) or (Seg2EResult=6))  --平时提前、延迟下班加班计为平时加班

  UPDATE T_Att_TempCalc
  SET Over1M = CASE 
      WHEN (Over1M IS NULL) then ISNULL(Seg3Over,0)
      ELSE Over1M+ISNULL(Seg3Over,0) 
    END
 -- WHERE (((Seg1BResult>=1) and (Seg1BResult<=6)) or ((Seg1EResult>=1) and (Seg1EResult<=6)))  --平时提前、延迟下班加班计为平时加班
 WHERE ( (Seg3BResult=6) or (Seg3EResult=6))  --平时提前、延迟下班加班计为平时加班

 /* --统计班内平日加班
  UPDATE T_Att_TempCalc                      
  SET Over1M = CASE 
      WHEN (Over1M IS NULL) then ISNULL(Seg1Work,0)
      ELSE Over1M+ISNULL(Seg1Work,0) 
    END
  WHERE ((Seg1BResult=6) or (Seg1EResult=6)) 

  UPDATE T_Att_TempCalc
  SET Over1M = CASE 
      WHEN (Over1M IS NULL) then ISNULL(Seg2Work,0)
      ELSE Over1M+ISNULL(Seg2Work,0) 
    END
  WHERE ((Seg2BResult=6) or (Seg2EResult=6))*/  
  
  UPDATE T_Att_TempCalc
  SET Over1M = CASE 
      WHEN (Over1M IS NULL) then ISNULL(Seg3Work,0)
      ELSE Over1M+ISNULL(Seg3Work,0) 
    END
  WHERE ((Seg3BResult=6) or (Seg3EResult=6))  

  --统计班内公休加班
  UPDATE T_Att_TempCalc
  SET Over2M = CASE 
      WHEN (Over2M IS NULL) then ISNULL(Seg1Over,0)+ISNULL(Seg1Work,0)
      ELSE Over2M+ISNULL(Seg1Over,0)+ISNULL(Seg1Work,0)
    END
  WHERE ((Seg1BResult=7) or (Seg1EResult=7))

  UPDATE T_Att_TempCalc
  SET Over2M = CASE 
      WHEN (Over2M IS NULL) then ISNULL(Seg2Over,0)+ISNULL(Seg2Work,0)
      ELSE Over2M+ISNULL(Seg2Over,0)+ISNULL(Seg2Work,0)
    END
  WHERE ((Seg2BResult=7) or (Seg2EResult=7))


  UPDATE T_Att_TempCalc
  SET Over2M = CASE 
      WHEN (Over2M IS NULL) then ISNULL(Seg3Over,0)+ISNULL(Seg3Work,0)
      ELSE Over2M+ISNULL(Seg3Over,0)+ISNULL(Seg3Work,0)
    END
  WHERE ((Seg3BResult=7) or (Seg3EResult=7))

  --统计班内节假日加班
  UPDATE T_Att_TempCalc
  SET Over3M = CASE 
      WHEN (Over3M IS NULL) then ISNULL(Seg1Over,0)+ISNULL(Seg1Work,0)
      ELSE Over3M+ISNULL(Seg1Over,0)+ISNULL(Seg1Work,0)
    END
  WHERE ((Seg1BResult=8) or (Seg1EResult=8))

  UPDATE T_Att_TempCalc
  SET Over3M = CASE 
      WHEN (Over3M IS NULL) then ISNULL(Seg2Over,0)+ISNULL(Seg2Work,0)
      ELSE Over3M+ISNULL(Seg2Over,0)+ISNULL(Seg2Work,0)
    END
  WHERE ((Seg2BResult=8) or (Seg2EResult=8))

  UPDATE T_Att_TempCalc
  SET Over3M = CASE 
      WHEN (Over3M IS NULL) then ISNULL(Seg3Over,0)+ISNULL(Seg3Work,0)
      ELSE Over3M+ISNULL(Seg3Over,0)+ISNULL(Seg3Work,0)
    END
  WHERE ((Seg3BResult=8) or (Seg3EResult=8))
END
' 
END
GO
/****** 对象:  StoredProcedure [dbo].[P_Att_RestHolidayToOverUp]    脚本日期: 09/25/2019 10:09:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_RestHolidayToOverUp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--公休日，节假日加班计算
CREATE PROCEDURE [dbo].[P_Att_RestHolidayToOverUp]
AS
BEGIN    
  --===========取公休为周六周日休息，考勤类型为按班次考勤人员周六周日记录==========
  DELETE FROM T_Att_TempIOTime
  INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,Class_Key)
  SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key,Shift.Class_Key As Class_Key
  FROM T_Att_TempCalc AS TmpCalc INNER JOIN T_Att_PsnShift AS Shift ON TmpCalc.Person_Key = Shift.Person_Key
  WHERE (TmpCalc.WeekOfDay IN (1, 7)) AND (TmpCalc.RestType=0)
        AND (Shift.AttendType=0) AND (Shift.Class_Key Is Not Null)
        AND (TmpCalc.P_Key Not in(Select TempCalc.P_Key 
				From T_Att_TempCalc TempCalc,T_Att_Adjust Adjust
				WHERE (TempCalc.Person_Key=Adjust.Person_Key) AND (TempCalc.PlanDate=Adjust.AdjustDate)))

  --正常上班记录，设为公休加班
  UPDATE T_Att_TempCalc SET Seg1BResult=7,Seg1EResult=7
  WHERE ((Seg1BResult In (1,2,6)) OR (Seg1EResult In (1,2,6)))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))
  UPDATE T_Att_TempCalc SET Seg2BResult=7,Seg2EResult=7
  WHERE ((Seg2BResult In (1,2,6)) OR (Seg2EResult In (1,2,6)))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))
  UPDATE T_Att_TempCalc SET Seg3BResult=7,Seg3EResult=7   
  WHERE ((Seg3BResult In (1,2,6)) OR (Seg3EResult In (1,2,6)))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))

  --有打卡记录，但不是有效加班的设为空
  UPDATE T_Att_TempCalc SET Seg1BResult=NULL,Seg1EResult=NULL
  WHERE ((Seg1BResult=21) OR (Seg1EResult=21))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))
  UPDATE T_Att_TempCalc SET Seg2BResult=NULL,Seg2EResult=NULL
  WHERE ((Seg2BResult=21) OR (Seg2EResult=21))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))
  UPDATE T_Att_TempCalc SET Seg3BResult=NULL,Seg3EResult=NULL   
  WHERE ((Seg3BResult=21) OR (Seg3EResult=21))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))
  --缺勤记录，设为空
  UPDATE T_Att_TempCalc SET Class_Key=NULL,ClassNo=NULL,ClassName=NULL, 
      Seg1Enabled=NULL,Seg1Type=NULL,Seg1BeginTime=NULL,Seg1EndTime=NULL,Seg1OnTime=NULL,Seg1OffTime=NULL,Seg1TimeLen=NULL, 
      Seg1CheckOn=NULL,Seg1CheckOff=NULL,Seg1CalcLate=NULL,Seg1CalcEarly=NULL,Seg1CalcAbsent=NULL,Seg1CalcLeave=NULL, 

      Seg2Enabled=NULL,Seg2Type=NULL,Seg2BeginTime=NULL,Seg2EndTime=NULL,Seg2OnTime=NULL,Seg2OffTime=NULL,Seg2TimeLen=NULL, 
      Seg2CheckOn=NULL,Seg2CheckOff=NULL,Seg2CalcLate=NULL,Seg2CalcEarly=NULL,Seg2CalcAbsent=NULL,Seg2CalcLeave=NULL, 

      Seg3Enabled=NULL,Seg3Type=NULL,Seg3BeginTime=NULL,Seg3EndTime=NULL,Seg3OnTime=NULL,Seg3OffTime=NULL,Seg3TimeLen=NULL, 
      Seg3CheckOn=NULL,Seg3CheckOff=NULL,Seg3CalcLate=NULL, Seg3CalcEarly=NULL,Seg3CalcAbsent=NULL,Seg3CalcLeave=NULL,

      /*Seg1BBTime=NULL,Seg1BETime=NULL,Seg1BTime=NULL,Seg1BFactTime=NULL,Seg1BResult=NULL,Seg1BValue=NULL,
      Seg1EBTime=NULL,Seg1EETime=NULL,Seg1ETime=NULL,Seg1EFactTime=NULL,Seg1EResult=NULL,Seg1EValue=NULL,Seg1Work=NULL,Seg1Over=NULL,

      Seg2BBTime=NULL,Seg2BETime=NULL,Seg2BTime=NULL,Seg2BFactTime=NULL,Seg2BResult=NULL,Seg2BValue=NULL,
      Seg2EBTime=NULL,Seg2EETime=NULL,Seg2ETime=NULL,Seg2EFactTime=NULL,Seg2EResult=NULL,Seg2EValue=NULL,Seg2Work=NULL,Seg2Over=NULL,
      
      Seg3BBTime=NULL,Seg3BETime=NULL,Seg3BTime=NULL,Seg3BFactTime=NULL,Seg3BResult=NULL,Seg3BValue=NULL,
      Seg3EBTime=NULL,Seg3EETime=NULL,Seg3ETime=NULL,Seg3EFactTime=NULL,Seg3EResult=NULL,Seg3EValue=NULL,Seg3Work=NULL,Seg3Over=NULL,*/ 
           
      Seg1BBTime=NULL,Seg1BETime=NULL,Seg1BFactTime=NULL,Seg1BResult=NULL,Seg1BValue=NULL,
      Seg1EBTime=NULL,Seg1EETime=NULL,Seg1EFactTime=NULL,Seg1EResult=NULL,Seg1EValue=NULL,Seg1Work=NULL,Seg1Over=NULL,

      Seg2BBTime=NULL,Seg2BETime=NULL,Seg2BFactTime=NULL,Seg2BResult=NULL,Seg2BValue=NULL,
      Seg2EBTime=NULL,Seg2EETime=NULL,Seg2EFactTime=NULL,Seg2EResult=NULL,Seg2EValue=NULL,Seg2Work=NULL,Seg2Over=NULL,

      Seg3BBTime=NULL,Seg3BETime=NULL,Seg3BFactTime=NULL,Seg3BResult=NULL,Seg3BValue=NULL,
      Seg3EBTime=NULL,Seg3EETime=NULL,Seg3ETime=NULL,Seg3EFactTime=NULL,Seg3EResult=NULL,Seg3EValue=NULL,Seg3Work=NULL,Seg3Over=NULL,

      AllTimeLen=NULL,OnDutyM=NULL,ShallDay=NULL,FactDay=NULL,AbsentDay=NULL,LaterM=NULL,LaterT=NULL,EarlyM=NULL,EarlyT=NULL,
      AbsentM=NULL,AbsentT=NULL,illM=NULL,AffairM=NULL,PubRestM=NULL,YearM=NULL,MarrigeM=NULL,MournM=NULL,MaternityM=NULL,
      EvectionM=NULL,EgressM=NULL,EgressT=NULL,Over1M=NULL,Over2M=NULL,Over3M=NULL
  WHERE (ISNULL(Seg1BResult,21) In (17,19,21)) AND (ISNULL(Seg1EResult,21) In (17,19,21))
		AND (ISNULL(Seg2BResult,21) In (17,19,21)) AND (ISNULL(Seg2EResult,21) In (17,19,21))
		AND (ISNULL(Seg3BResult,21) In (17,19,21)) AND (ISNULL(Seg3EResult,21) In (17,19,21))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))

  --未打卡，设为空
  UPDATE T_Att_TempCalc SET Class_Key=NULL,ClassNo=NULL,ClassName=NULL, 
      Seg1Enabled=NULL,Seg1Type=NULL,Seg1BeginTime=NULL,Seg1EndTime=NULL,Seg1OnTime=NULL,Seg1OffTime=NULL,Seg1TimeLen=NULL, 
      Seg1CheckOn=NULL,Seg1CheckOff=NULL,Seg1CalcLate=NULL,Seg1CalcEarly=NULL,Seg1CalcAbsent=NULL,Seg1CalcLeave=NULL, 

      Seg2Enabled=NULL,Seg2Type=NULL,Seg2BeginTime=NULL,Seg2EndTime=NULL,Seg2OnTime=NULL,Seg2OffTime=NULL,Seg2TimeLen=NULL, 
      Seg2CheckOn=NULL,Seg2CheckOff=NULL,Seg2CalcLate=NULL,Seg2CalcEarly=NULL,Seg2CalcAbsent=NULL,Seg2CalcLeave=NULL, 

      Seg3Enabled=NULL,Seg3Type=NULL,Seg3BeginTime=NULL,Seg3EndTime=NULL,Seg3OnTime=NULL,Seg3OffTime=NULL,Seg3TimeLen=NULL, 
      Seg3CheckOn=NULL,Seg3CheckOff=NULL,Seg3CalcLate=NULL, Seg3CalcEarly=NULL,Seg3CalcAbsent=NULL,Seg3CalcLeave=NULL,

      /*Seg1BBTime=NULL,Seg1BETime=NULL,Seg1BTime=NULL,Seg1BFactTime=NULL,Seg1BResult=NULL,Seg1BValue=NULL,
      Seg1EBTime=NULL,Seg1EETime=NULL,Seg1ETime=NULL,Seg1EFactTime=NULL,Seg1EResult=NULL,Seg1EValue=NULL,Seg1Work=NULL,Seg1Over=NULL,

      Seg2BBTime=NULL,Seg2BETime=NULL,Seg2BTime=NULL,Seg2BFactTime=NULL,Seg2BResult=NULL,Seg2BValue=NULL,
      Seg2EBTime=NULL,Seg2EETime=NULL,Seg2ETime=NULL,Seg2EFactTime=NULL,Seg2EResult=NULL,Seg2EValue=NULL,Seg2Work=NULL,Seg2Over=NULL,
      
      Seg3BBTime=NULL,Seg3BETime=NULL,Seg3BTime=NULL,Seg3BFactTime=NULL,Seg3BResult=NULL,Seg3BValue=NULL,
      Seg3EBTime=NULL,Seg3EETime=NULL,Seg3ETime=NULL,Seg3EFactTime=NULL,Seg3EResult=NULL,Seg3EValue=NULL,Seg3Work=NULL,Seg3Over=NULL,*/ 
           
      Seg1BBTime=NULL,Seg1BETime=NULL,Seg1BFactTime=NULL,Seg1BResult=NULL,Seg1BValue=NULL,
      Seg1EBTime=NULL,Seg1EETime=NULL,Seg1EFactTime=NULL,Seg1EResult=NULL,Seg1EValue=NULL,Seg1Work=NULL,Seg1Over=NULL,

      Seg2BBTime=NULL,Seg2BETime=NULL,Seg2BFactTime=NULL,Seg2BResult=NULL,Seg2BValue=NULL,
      Seg2EBTime=NULL,Seg2EETime=NULL,Seg2EFactTime=NULL,Seg2EResult=NULL,Seg2EValue=NULL,Seg2Work=NULL,Seg2Over=NULL,

      Seg3BBTime=NULL,Seg3BETime=NULL,Seg3BFactTime=NULL,Seg3BResult=NULL,Seg3BValue=NULL,
      Seg3EBTime=NULL,Seg3EETime=NULL,Seg3ETime=NULL,Seg3EFactTime=NULL,Seg3EResult=NULL,Seg3EValue=NULL,Seg3Work=NULL,Seg3Over=NULL,

      AllTimeLen=NULL,OnDutyM=NULL,ShallDay=NULL,FactDay=NULL,AbsentDay=NULL,LaterM=NULL,LaterT=NULL,EarlyM=NULL,EarlyT=NULL,
      AbsentM=NULL,AbsentT=NULL,illM=NULL,AffairM=NULL,PubRestM=NULL,YearM=NULL,MarrigeM=NULL,MournM=NULL,MaternityM=NULL,
      EvectionM=NULL,EgressM=NULL,EgressT=NULL,Over1M=NULL,Over2M=NULL,Over3M=NULL
  WHERE (Seg1BFactTime Is Null) AND (Seg1EFactTime Is Null)
		AND (Seg2BFactTime Is Null) AND (Seg2EFactTime Is Null)
		AND (Seg3BFactTime Is Null) AND (Seg3EFactTime Is Null)
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))

  --=======取公休为周六半日、周日休息，考勤类型为按班次考勤人员周六记录========
  DELETE FROM T_Att_TempIOTime
  INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,Class_Key)
  SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key,Shift.Class_Key As Class_Key
  FROM T_Att_TempCalc AS TmpCalc INNER JOIN T_Att_PsnShift AS Shift ON TmpCalc.Person_Key = Shift.Person_Key
  WHERE (TmpCalc.WeekOfDay=7) AND (TmpCalc.RestType=1)
        AND (Shift.AttendType=0) AND (Shift.Class_Key Is Not Null)
        AND (TmpCalc.P_Key Not in(Select TempCalc.P_Key 
				From T_Att_TempCalc TempCalc,T_Att_Adjust Adjust
				WHERE (TempCalc.Person_Key=Adjust.Person_Key) AND (TempCalc.PlanDate=Adjust.AdjustDate)))


  --周六半日，正常上班记录，设为公休加班
  UPDATE T_Att_TempCalc SET Seg2BResult=7,Seg2EResult=7
  WHERE ((Seg2BResult In (1,2,6)) OR (Seg2EResult In (1,2,6)))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))
  UPDATE T_Att_TempCalc SET Seg3BResult=7,Seg3EResult=7   
  WHERE ((Seg3BResult In (1,2,6)) OR (Seg3EResult In (1,2,6)))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))

  --有打卡记录，但不是有效加班的设为空
  UPDATE T_Att_TempCalc SET Seg2BResult=NULL,Seg2EResult=NULL
  WHERE ((Seg2BResult=21) OR (Seg2EResult=21))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))
  UPDATE T_Att_TempCalc SET Seg3BResult=NULL,Seg3EResult=NULL   
  WHERE ((Seg3BResult=21) OR (Seg3EResult=21))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))

  --周六半日，缺勤记录，设为空
  UPDATE T_Att_TempCalc SET Seg2Enabled=NULL,Seg2Type=NULL,Seg2BeginTime=NULL,Seg2EndTime=NULL,Seg2OnTime=NULL,Seg2OffTime=NULL,Seg2TimeLen=NULL, 
      Seg2CheckOn=NULL,Seg2CheckOff=NULL,Seg2CalcLate=NULL,Seg2CalcEarly=NULL,Seg2CalcAbsent=NULL,Seg2CalcLeave=NULL, 

      Seg3Enabled=NULL,Seg3Type=NULL,Seg3BeginTime=NULL,Seg3EndTime=NULL,Seg3OnTime=NULL,Seg3OffTime=NULL,Seg3TimeLen=NULL, 
      Seg3CheckOn=NULL,Seg3CheckOff=NULL,Seg3CalcLate=NULL, Seg3CalcEarly=NULL,Seg3CalcAbsent=NULL,Seg3CalcLeave=NULL,

      /*Seg2BBTime=NULL,Seg2BETime=NULL,Seg2BTime=NULL,Seg2BFactTime=NULL,Seg2BResult=NULL,Seg2BValue=NULL,
      Seg2EBTime=NULL,Seg2EETime=NULL,Seg2ETime=NULL,Seg2EFactTime=NULL,Seg2EResult=NULL,Seg2EValue=NULL,Seg2Work=NULL,Seg2Over=NULL,
      
      Seg3BBTime=NULL,Seg3BETime=NULL,Seg3BTime=NULL,Seg3BFactTime=NULL,Seg3BResult=NULL,Seg3BValue=NULL,
      Seg3EBTime=NULL,Seg3EETime=NULL,Seg3ETime=NULL,Seg3EFactTime=NULL,Seg3EResult=NULL,Seg3EValue=NULL,Seg3Work=NULL,Seg3Over=NULL,*/      

      Seg2BBTime=NULL,Seg2BETime=NULL,Seg2BFactTime=NULL,Seg2BResult=NULL,Seg2BValue=NULL,
      Seg2EBTime=NULL,Seg2EETime=NULL,Seg2EFactTime=NULL,Seg2EResult=NULL,Seg2EValue=NULL,Seg2Work=NULL,Seg2Over=NULL,
      
      Seg3BBTime=NULL,Seg3BETime=NULL,Seg3BFactTime=NULL,Seg3BResult=NULL,Seg3BValue=NULL,
      Seg3EBTime=NULL,Seg3EETime=NULL,Seg3ETime=NULL,Seg3EFactTime=NULL,Seg3EResult=NULL,Seg3EValue=NULL,Seg3Work=NULL,Seg3Over=NULL,

      AllTimeLen=NULL,OnDutyM=NULL,ShallDay=NULL,FactDay=NULL,AbsentDay=NULL,LaterM=NULL,LaterT=NULL,EarlyM=NULL,EarlyT=NULL,
      AbsentM=NULL,AbsentT=NULL,illM=NULL,AffairM=NULL,PubRestM=NULL,YearM=NULL,MarrigeM=NULL,MournM=NULL,MaternityM=NULL,
      EvectionM=NULL,EgressM=NULL,EgressT=NULL,Over1M=NULL,Over2M=NULL,Over3M=NULL
  WHERE (ISNULL(Seg2BResult,21) In (17,19,21)) AND (ISNULL(Seg2EResult,21) In (17,19,21))
		AND (ISNULL(Seg3BResult,21) In (17,19,21)) AND (ISNULL(Seg3EResult,21) In (17,19,21))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))

  --未打卡，设为空
  UPDATE T_Att_TempCalc SET 
      Seg2Enabled=NULL,Seg2Type=NULL,Seg2BeginTime=NULL,Seg2EndTime=NULL,Seg2OnTime=NULL,Seg2OffTime=NULL,Seg2TimeLen=NULL, 
      Seg2CheckOn=NULL,Seg2CheckOff=NULL,Seg2CalcLate=NULL,Seg2CalcEarly=NULL,Seg2CalcAbsent=NULL,Seg2CalcLeave=NULL, 

      Seg3Enabled=NULL,Seg3Type=NULL,Seg3BeginTime=NULL,Seg3EndTime=NULL,Seg3OnTime=NULL,Seg3OffTime=NULL,Seg3TimeLen=NULL, 
      Seg3CheckOn=NULL,Seg3CheckOff=NULL,Seg3CalcLate=NULL, Seg3CalcEarly=NULL,Seg3CalcAbsent=NULL,Seg3CalcLeave=NULL,

      /*Seg2BBTime=NULL,Seg2BETime=NULL,Seg2BTime=NULL,Seg2BFactTime=NULL,Seg2BResult=NULL,Seg2BValue=NULL,
      Seg2EBTime=NULL,Seg2EETime=NULL,Seg2ETime=NULL,Seg2EFactTime=NULL,Seg2EResult=NULL,Seg2EValue=NULL,Seg2Work=NULL,Seg2Over=NULL,
      
      Seg3BBTime=NULL,Seg3BETime=NULL,Seg3BTime=NULL,Seg3BFactTime=NULL,Seg3BResult=NULL,Seg3BValue=NULL,
      Seg3EBTime=NULL,Seg3EETime=NULL,Seg3ETime=NULL,Seg3EFactTime=NULL,Seg3EResult=NULL,Seg3EValue=NULL,Seg3Work=NULL,Seg3Over=NULL,*/      

      Seg2BBTime=NULL,Seg2BETime=NULL,Seg2BFactTime=NULL,Seg2BResult=NULL,Seg2BValue=NULL,
      Seg2EBTime=NULL,Seg2EETime=NULL,Seg2EFactTime=NULL,Seg2EResult=NULL,Seg2EValue=NULL,Seg2Work=NULL,Seg2Over=NULL,
      
      Seg3BBTime=NULL,Seg3BETime=NULL,Seg3BFactTime=NULL,Seg3BResult=NULL,Seg3BValue=NULL,
      Seg3EBTime=NULL,Seg3EETime=NULL,Seg3ETime=NULL,Seg3EFactTime=NULL,Seg3EResult=NULL,Seg3EValue=NULL,Seg3Work=NULL,Seg3Over=NULL,

      AllTimeLen=NULL,OnDutyM=NULL,ShallDay=NULL,FactDay=NULL,AbsentDay=NULL,LaterM=NULL,LaterT=NULL,EarlyM=NULL,EarlyT=NULL,
      AbsentM=NULL,AbsentT=NULL,illM=NULL,AffairM=NULL,PubRestM=NULL,YearM=NULL,MarrigeM=NULL,MournM=NULL,MaternityM=NULL,
      EvectionM=NULL,EgressM=NULL,EgressT=NULL,Over1M=NULL,Over2M=NULL,Over3M=NULL
  WHERE (Seg2BFactTime Is Null) AND (Seg2EFactTime Is Null)
		AND (Seg3BFactTime Is Null) AND (Seg3EFactTime Is Null)
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))

  --==========取公休为周六半日、周日休息，考勤类型为按班次考勤人员周日记录=============
  DELETE FROM T_Att_TempIOTime
  INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,Class_Key)
  SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key,Shift.Class_Key As Class_Key
  FROM T_Att_TempCalc AS TmpCalc INNER JOIN T_Att_PsnShift AS Shift ON TmpCalc.Person_Key = Shift.Person_Key
  WHERE (TmpCalc.WeekOfDay=1) AND (TmpCalc.RestType=1)
        AND (Shift.AttendType=0) AND (Shift.Class_Key Is Not Null)
        AND (TmpCalc.P_Key Not in(Select TempCalc.P_Key 
				From T_Att_TempCalc TempCalc,T_Att_Adjust Adjust
				WHERE (TempCalc.Person_Key=Adjust.Person_Key) AND (TempCalc.PlanDate=Adjust.AdjustDate)))


  --周日，正常上班记录，设为公休加班
  UPDATE T_Att_TempCalc SET Seg1BResult=7,Seg1EResult=7
  WHERE ((Seg1BResult In (1,2,6)) OR (Seg1EResult In (1,2,6)))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))
  UPDATE T_Att_TempCalc SET Seg2BResult=7,Seg2EResult=7
  WHERE ((Seg2BResult In (1,2,6)) OR (Seg2EResult In (1,2,6)))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))
  UPDATE T_Att_TempCalc SET Seg3BResult=7,Seg3EResult=7   
  WHERE ((Seg3BResult In (1,2,6)) OR (Seg3EResult In (1,2,6)))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))

  --有打卡记录，但不是有效加班的设为空
  UPDATE T_Att_TempCalc SET Seg1BResult=NULL,Seg1EResult=NULL
  WHERE ((Seg1BResult=21) OR (Seg1EResult=21))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))
  UPDATE T_Att_TempCalc SET Seg2BResult=NULL,Seg2EResult=NULL
  WHERE ((Seg2BResult=21) OR (Seg2EResult=21))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))
  UPDATE T_Att_TempCalc SET Seg3BResult=NULL,Seg3EResult=NULL   
  WHERE ((Seg3BResult=21) OR (Seg3EResult=21))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))

  --周日，缺勤记录，设为空
  UPDATE T_Att_TempCalc SET Class_Key=NULL,ClassNo=NULL,ClassName=NULL, 
      Seg1Enabled=NULL,Seg1Type=NULL,Seg1BeginTime=NULL,Seg1EndTime=NULL,Seg1OnTime=NULL,Seg1OffTime=NULL,Seg1TimeLen=NULL, 
      Seg1CheckOn=NULL,Seg1CheckOff=NULL,Seg1CalcLate=NULL,Seg1CalcEarly=NULL,Seg1CalcAbsent=NULL,Seg1CalcLeave=NULL, 

      Seg2Enabled=NULL,Seg2Type=NULL,Seg2BeginTime=NULL,Seg2EndTime=NULL,Seg2OnTime=NULL,Seg2OffTime=NULL,Seg2TimeLen=NULL, 
      Seg2CheckOn=NULL,Seg2CheckOff=NULL,Seg2CalcLate=NULL,Seg2CalcEarly=NULL,Seg2CalcAbsent=NULL,Seg2CalcLeave=NULL, 

      Seg3Enabled=NULL,Seg3Type=NULL,Seg3BeginTime=NULL,Seg3EndTime=NULL,Seg3OnTime=NULL,Seg3OffTime=NULL,Seg3TimeLen=NULL, 
      Seg3CheckOn=NULL,Seg3CheckOff=NULL,Seg3CalcLate=NULL, Seg3CalcEarly=NULL,Seg3CalcAbsent=NULL,Seg3CalcLeave=NULL,

      /*Seg1BBTime=NULL,Seg1BETime=NULL,Seg1BTime=NULL,Seg1BFactTime=NULL,Seg1BResult=NULL,Seg1BValue=NULL,
      Seg1EBTime=NULL,Seg1EETime=NULL,Seg1ETime=NULL,Seg1EFactTime=NULL,Seg1EResult=NULL,Seg1EValue=NULL,Seg1Work=NULL,Seg1Over=NULL,

      Seg2BBTime=NULL,Seg2BETime=NULL,Seg2BTime=NULL,Seg2BFactTime=NULL,Seg2BResult=NULL,Seg2BValue=NULL,
      Seg2EBTime=NULL,Seg2EETime=NULL,Seg2ETime=NULL,Seg2EFactTime=NULL,Seg2EResult=NULL,Seg2EValue=NULL,Seg2Work=NULL,Seg2Over=NULL,
      
      Seg3BBTime=NULL,Seg3BETime=NULL,Seg3BTime=NULL,Seg3BFactTime=NULL,Seg3BResult=NULL,Seg3BValue=NULL,
      Seg3EBTime=NULL,Seg3EETime=NULL,Seg3ETime=NULL,Seg3EFactTime=NULL,Seg3EResult=NULL,Seg3EValue=NULL,Seg3Work=NULL,Seg3Over=NULL,*/ 
           
      Seg1BBTime=NULL,Seg1BETime=NULL,Seg1BFactTime=NULL,Seg1BResult=NULL,Seg1BValue=NULL,
      Seg1EBTime=NULL,Seg1EETime=NULL,Seg1EFactTime=NULL,Seg1EResult=NULL,Seg1EValue=NULL,Seg1Work=NULL,Seg1Over=NULL,

      Seg2BBTime=NULL,Seg2BETime=NULL,Seg2BFactTime=NULL,Seg2BResult=NULL,Seg2BValue=NULL,
      Seg2EBTime=NULL,Seg2EETime=NULL,Seg2EFactTime=NULL,Seg2EResult=NULL,Seg2EValue=NULL,Seg2Work=NULL,Seg2Over=NULL,

      Seg3BBTime=NULL,Seg3BETime=NULL,Seg3BFactTime=NULL,Seg3BResult=NULL,Seg3BValue=NULL,
      Seg3EBTime=NULL,Seg3EETime=NULL,Seg3ETime=NULL,Seg3EFactTime=NULL,Seg3EResult=NULL,Seg3EValue=NULL,Seg3Work=NULL,Seg3Over=NULL,

      AllTimeLen=NULL,OnDutyM=NULL,ShallDay=NULL,FactDay=NULL,AbsentDay=NULL,LaterM=NULL,LaterT=NULL,EarlyM=NULL,EarlyT=NULL,
      AbsentM=NULL,AbsentT=NULL,illM=NULL,AffairM=NULL,PubRestM=NULL,YearM=NULL,MarrigeM=NULL,MournM=NULL,MaternityM=NULL,
      EvectionM=NULL,EgressM=NULL,EgressT=NULL,Over1M=NULL,Over2M=NULL,Over3M=NULL
  WHERE (ISNULL(Seg1BResult,21) In (17,19,21)) AND (ISNULL(Seg1EResult,21) In (17,19,21))
		AND (ISNULL(Seg2BResult,21) In (17,19,21)) AND (ISNULL(Seg2EResult,21) In (17,19,21))
		AND (ISNULL(Seg3BResult,21) In (17,19,21)) AND (ISNULL(Seg3EResult,21) In (17,19,21))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))

  --未打卡，设为空
  UPDATE T_Att_TempCalc SET Class_Key=NULL,ClassNo=NULL,ClassName=NULL, 
      Seg1Enabled=NULL,Seg1Type=NULL,Seg1BeginTime=NULL,Seg1EndTime=NULL,Seg1OnTime=NULL,Seg1OffTime=NULL,Seg1TimeLen=NULL, 
      Seg1CheckOn=NULL,Seg1CheckOff=NULL,Seg1CalcLate=NULL,Seg1CalcEarly=NULL,Seg1CalcAbsent=NULL,Seg1CalcLeave=NULL, 

      Seg2Enabled=NULL,Seg2Type=NULL,Seg2BeginTime=NULL,Seg2EndTime=NULL,Seg2OnTime=NULL,Seg2OffTime=NULL,Seg2TimeLen=NULL, 
      Seg2CheckOn=NULL,Seg2CheckOff=NULL,Seg2CalcLate=NULL,Seg2CalcEarly=NULL,Seg2CalcAbsent=NULL,Seg2CalcLeave=NULL, 

      Seg3Enabled=NULL,Seg3Type=NULL,Seg3BeginTime=NULL,Seg3EndTime=NULL,Seg3OnTime=NULL,Seg3OffTime=NULL,Seg3TimeLen=NULL, 
      Seg3CheckOn=NULL,Seg3CheckOff=NULL,Seg3CalcLate=NULL, Seg3CalcEarly=NULL,Seg3CalcAbsent=NULL,Seg3CalcLeave=NULL,

      /*Seg1BBTime=NULL,Seg1BETime=NULL,Seg1BTime=NULL,Seg1BFactTime=NULL,Seg1BResult=NULL,Seg1BValue=NULL,
      Seg1EBTime=NULL,Seg1EETime=NULL,Seg1ETime=NULL,Seg1EFactTime=NULL,Seg1EResult=NULL,Seg1EValue=NULL,Seg1Work=NULL,Seg1Over=NULL,

      Seg2BBTime=NULL,Seg2BETime=NULL,Seg2BTime=NULL,Seg2BFactTime=NULL,Seg2BResult=NULL,Seg2BValue=NULL,
      Seg2EBTime=NULL,Seg2EETime=NULL,Seg2ETime=NULL,Seg2EFactTime=NULL,Seg2EResult=NULL,Seg2EValue=NULL,Seg2Work=NULL,Seg2Over=NULL,
      
      Seg3BBTime=NULL,Seg3BETime=NULL,Seg3BTime=NULL,Seg3BFactTime=NULL,Seg3BResult=NULL,Seg3BValue=NULL,
      Seg3EBTime=NULL,Seg3EETime=NULL,Seg3ETime=NULL,Seg3EFactTime=NULL,Seg3EResult=NULL,Seg3EValue=NULL,Seg3Work=NULL,Seg3Over=NULL,*/ 
           
      Seg1BBTime=NULL,Seg1BETime=NULL,Seg1BFactTime=NULL,Seg1BResult=NULL,Seg1BValue=NULL,
      Seg1EBTime=NULL,Seg1EETime=NULL,Seg1EFactTime=NULL,Seg1EResult=NULL,Seg1EValue=NULL,Seg1Work=NULL,Seg1Over=NULL,

      Seg2BBTime=NULL,Seg2BETime=NULL,Seg2BFactTime=NULL,Seg2BResult=NULL,Seg2BValue=NULL,
      Seg2EBTime=NULL,Seg2EETime=NULL,Seg2EFactTime=NULL,Seg2EResult=NULL,Seg2EValue=NULL,Seg2Work=NULL,Seg2Over=NULL,

      Seg3BBTime=NULL,Seg3BETime=NULL,Seg3BFactTime=NULL,Seg3BResult=NULL,Seg3BValue=NULL,
      Seg3EBTime=NULL,Seg3EETime=NULL,Seg3ETime=NULL,Seg3EFactTime=NULL,Seg3EResult=NULL,Seg3EValue=NULL,Seg3Work=NULL,Seg3Over=NULL,

      AllTimeLen=NULL,OnDutyM=NULL,ShallDay=NULL,FactDay=NULL,AbsentDay=NULL,LaterM=NULL,LaterT=NULL,EarlyM=NULL,EarlyT=NULL,
      AbsentM=NULL,AbsentT=NULL,illM=NULL,AffairM=NULL,PubRestM=NULL,YearM=NULL,MarrigeM=NULL,MournM=NULL,MaternityM=NULL,
      EvectionM=NULL,EgressM=NULL,EgressT=NULL,Over1M=NULL,Over2M=NULL,Over3M=NULL
  WHERE (Seg1BFactTime Is Null) AND (Seg1EFactTime Is Null)
		AND (Seg2BFactTime Is Null) AND (Seg2EFactTime Is Null)
		AND (Seg3BFactTime Is Null) AND (Seg3EFactTime Is Null)
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))

  --==========取公休为周日休息，考勤类型为按班次考勤人员周日记录=============
  DELETE FROM T_Att_TempIOTime
  INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,Class_Key)
  SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key,Shift.Class_Key As Class_Key
  FROM T_Att_TempCalc AS TmpCalc INNER JOIN T_Att_PsnShift AS Shift ON TmpCalc.Person_Key = Shift.Person_Key
  WHERE (TmpCalc.WeekOfDay=1) AND (TmpCalc.RestType=2)
        AND (Shift.AttendType=0) AND (Shift.Class_Key Is Not Null)
        AND (TmpCalc.P_Key Not in(Select TempCalc.P_Key 
				From T_Att_TempCalc TempCalc,T_Att_Adjust Adjust
				WHERE (TempCalc.Person_Key=Adjust.Person_Key) AND (TempCalc.PlanDate=Adjust.AdjustDate)))


  --周日，正常上班记录，设为公休加班
  UPDATE T_Att_TempCalc SET Seg1BResult=7,Seg1EResult=7 
  WHERE ((Seg1BResult In (1,2,6)) OR (Seg1EResult In (1,2,6)))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))
  UPDATE T_Att_TempCalc SET Seg2BResult=7,Seg2EResult=7   
  WHERE ((Seg2BResult In (1,2,6)) OR (Seg2EResult In (1,2,6)))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))
  UPDATE T_Att_TempCalc SET Seg3BResult=7,Seg3EResult=7   
  WHERE ((Seg3BResult In (1,2,6)) OR (Seg3EResult In (1,2,6)))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))

  --有打卡记录，但不是有效加班的设为空
  UPDATE T_Att_TempCalc SET Seg1BResult=NULL,Seg1EResult=NULL
  WHERE ((Seg1BResult=21) OR (Seg1EResult=21))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))
  UPDATE T_Att_TempCalc SET Seg2BResult=NULL,Seg2EResult=NULL
  WHERE ((Seg2BResult=21) OR (Seg2EResult=21))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))
  UPDATE T_Att_TempCalc SET Seg3BResult=NULL,Seg3EResult=NULL   
  WHERE ((Seg3BResult=21) OR (Seg3EResult=21))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))

  --周日，缺勤记录，设为空
  UPDATE T_Att_TempCalc SET Class_Key=NULL,ClassNo=NULL,ClassName=NULL, 
      Seg1Enabled=NULL,Seg1Type=NULL,Seg1BeginTime=NULL,Seg1EndTime=NULL,Seg1OnTime=NULL,Seg1OffTime=NULL,Seg1TimeLen=NULL, 
      Seg1CheckOn=NULL,Seg1CheckOff=NULL,Seg1CalcLate=NULL,Seg1CalcEarly=NULL,Seg1CalcAbsent=NULL,Seg1CalcLeave=NULL, 

      Seg2Enabled=NULL,Seg2Type=NULL,Seg2BeginTime=NULL,Seg2EndTime=NULL,Seg2OnTime=NULL,Seg2OffTime=NULL,Seg2TimeLen=NULL, 
      Seg2CheckOn=NULL,Seg2CheckOff=NULL,Seg2CalcLate=NULL,Seg2CalcEarly=NULL,Seg2CalcAbsent=NULL,Seg2CalcLeave=NULL, 

      Seg3Enabled=NULL,Seg3Type=NULL,Seg3BeginTime=NULL,Seg3EndTime=NULL,Seg3OnTime=NULL,Seg3OffTime=NULL,Seg3TimeLen=NULL, 
      Seg3CheckOn=NULL,Seg3CheckOff=NULL,Seg3CalcLate=NULL, Seg3CalcEarly=NULL,Seg3CalcAbsent=NULL,Seg3CalcLeave=NULL,

      /*Seg1BBTime=NULL,Seg1BETime=NULL,Seg1BTime=NULL,Seg1BFactTime=NULL,Seg1BResult=NULL,Seg1BValue=NULL,
      Seg1EBTime=NULL,Seg1EETime=NULL,Seg1ETime=NULL,Seg1EFactTime=NULL,Seg1EResult=NULL,Seg1EValue=NULL,Seg1Work=NULL,Seg1Over=NULL,

      Seg2BBTime=NULL,Seg2BETime=NULL,Seg2BTime=NULL,Seg2BFactTime=NULL,Seg2BResult=NULL,Seg2BValue=NULL,
      Seg2EBTime=NULL,Seg2EETime=NULL,Seg2ETime=NULL,Seg2EFactTime=NULL,Seg2EResult=NULL,Seg2EValue=NULL,Seg2Work=NULL,Seg2Over=NULL,
      
      Seg3BBTime=NULL,Seg3BETime=NULL,Seg3BTime=NULL,Seg3BFactTime=NULL,Seg3BResult=NULL,Seg3BValue=NULL,
      Seg3EBTime=NULL,Seg3EETime=NULL,Seg3ETime=NULL,Seg3EFactTime=NULL,Seg3EResult=NULL,Seg3EValue=NULL,Seg3Work=NULL,Seg3Over=NULL,*/ 
           
      Seg1BBTime=NULL,Seg1BETime=NULL,Seg1BFactTime=NULL,Seg1BResult=NULL,Seg1BValue=NULL,
      Seg1EBTime=NULL,Seg1EETime=NULL,Seg1EFactTime=NULL,Seg1EResult=NULL,Seg1EValue=NULL,Seg1Work=NULL,Seg1Over=NULL,

      Seg2BBTime=NULL,Seg2BETime=NULL,Seg2BFactTime=NULL,Seg2BResult=NULL,Seg2BValue=NULL,
      Seg2EBTime=NULL,Seg2EETime=NULL,Seg2EFactTime=NULL,Seg2EResult=NULL,Seg2EValue=NULL,Seg2Work=NULL,Seg2Over=NULL,

      Seg3BBTime=NULL,Seg3BETime=NULL,Seg3BFactTime=NULL,Seg3BResult=NULL,Seg3BValue=NULL,
      Seg3EBTime=NULL,Seg3EETime=NULL,Seg3ETime=NULL,Seg3EFactTime=NULL,Seg3EResult=NULL,Seg3EValue=NULL,Seg3Work=NULL,Seg3Over=NULL,

      AllTimeLen=NULL,OnDutyM=NULL,ShallDay=NULL,FactDay=NULL,AbsentDay=NULL,LaterM=NULL,LaterT=NULL,EarlyM=NULL,EarlyT=NULL,
      AbsentM=NULL,AbsentT=NULL,illM=NULL,AffairM=NULL,PubRestM=NULL,YearM=NULL,MarrigeM=NULL,MournM=NULL,MaternityM=NULL,
      EvectionM=NULL,EgressM=NULL,EgressT=NULL,Over1M=NULL,Over2M=NULL,Over3M=NULL
  WHERE (ISNULL(Seg1BResult,21) In (17,19,21)) AND (ISNULL(Seg1EResult,21) In (17,19,21))
		AND (ISNULL(Seg2BResult,21) In (17,19,21)) AND (ISNULL(Seg2EResult,21) In (17,19,21))
		AND (ISNULL(Seg3BResult,21) In (17,19,21)) AND (ISNULL(Seg3EResult,21) In (17,19,21))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))


  --未打卡，设为空
  UPDATE T_Att_TempCalc SET Class_Key=NULL,ClassNo=NULL,ClassName=NULL, 
      Seg1Enabled=NULL,Seg1Type=NULL,Seg1BeginTime=NULL,Seg1EndTime=NULL,Seg1OnTime=NULL,Seg1OffTime=NULL,Seg1TimeLen=NULL, 
      Seg1CheckOn=NULL,Seg1CheckOff=NULL,Seg1CalcLate=NULL,Seg1CalcEarly=NULL,Seg1CalcAbsent=NULL,Seg1CalcLeave=NULL, 

      Seg2Enabled=NULL,Seg2Type=NULL,Seg2BeginTime=NULL,Seg2EndTime=NULL,Seg2OnTime=NULL,Seg2OffTime=NULL,Seg2TimeLen=NULL, 
      Seg2CheckOn=NULL,Seg2CheckOff=NULL,Seg2CalcLate=NULL,Seg2CalcEarly=NULL,Seg2CalcAbsent=NULL,Seg2CalcLeave=NULL, 

      Seg3Enabled=NULL,Seg3Type=NULL,Seg3BeginTime=NULL,Seg3EndTime=NULL,Seg3OnTime=NULL,Seg3OffTime=NULL,Seg3TimeLen=NULL, 
      Seg3CheckOn=NULL,Seg3CheckOff=NULL,Seg3CalcLate=NULL, Seg3CalcEarly=NULL,Seg3CalcAbsent=NULL,Seg3CalcLeave=NULL,

      /*Seg1BBTime=NULL,Seg1BETime=NULL,Seg1BTime=NULL,Seg1BFactTime=NULL,Seg1BResult=NULL,Seg1BValue=NULL,
      Seg1EBTime=NULL,Seg1EETime=NULL,Seg1ETime=NULL,Seg1EFactTime=NULL,Seg1EResult=NULL,Seg1EValue=NULL,Seg1Work=NULL,Seg1Over=NULL,

      Seg2BBTime=NULL,Seg2BETime=NULL,Seg2BTime=NULL,Seg2BFactTime=NULL,Seg2BResult=NULL,Seg2BValue=NULL,
      Seg2EBTime=NULL,Seg2EETime=NULL,Seg2ETime=NULL,Seg2EFactTime=NULL,Seg2EResult=NULL,Seg2EValue=NULL,Seg2Work=NULL,Seg2Over=NULL,
      
      Seg3BBTime=NULL,Seg3BETime=NULL,Seg3BTime=NULL,Seg3BFactTime=NULL,Seg3BResult=NULL,Seg3BValue=NULL,
      Seg3EBTime=NULL,Seg3EETime=NULL,Seg3ETime=NULL,Seg3EFactTime=NULL,Seg3EResult=NULL,Seg3EValue=NULL,Seg3Work=NULL,Seg3Over=NULL,*/ 
           
      Seg1BBTime=NULL,Seg1BETime=NULL,Seg1BFactTime=NULL,Seg1BResult=NULL,Seg1BValue=NULL,
      Seg1EBTime=NULL,Seg1EETime=NULL,Seg1EFactTime=NULL,Seg1EResult=NULL,Seg1EValue=NULL,Seg1Work=NULL,Seg1Over=NULL,

      Seg2BBTime=NULL,Seg2BETime=NULL,Seg2BFactTime=NULL,Seg2BResult=NULL,Seg2BValue=NULL,
      Seg2EBTime=NULL,Seg2EETime=NULL,Seg2EFactTime=NULL,Seg2EResult=NULL,Seg2EValue=NULL,Seg2Work=NULL,Seg2Over=NULL,

      Seg3BBTime=NULL,Seg3BETime=NULL,Seg3BFactTime=NULL,Seg3BResult=NULL,Seg3BValue=NULL,
      Seg3EBTime=NULL,Seg3EETime=NULL,Seg3ETime=NULL,Seg3EFactTime=NULL,Seg3EResult=NULL,Seg3EValue=NULL,Seg3Work=NULL,Seg3Over=NULL,

      AllTimeLen=NULL,OnDutyM=NULL,ShallDay=NULL,FactDay=NULL,AbsentDay=NULL,LaterM=NULL,LaterT=NULL,EarlyM=NULL,EarlyT=NULL,
      AbsentM=NULL,AbsentT=NULL,illM=NULL,AffairM=NULL,PubRestM=NULL,YearM=NULL,MarrigeM=NULL,MournM=NULL,MaternityM=NULL,
      EvectionM=NULL,EgressM=NULL,EgressT=NULL,Over1M=NULL,Over2M=NULL,Over3M=NULL
  WHERE (Seg1BFactTime Is Null) AND (Seg1EFactTime Is Null)
		AND (Seg2BFactTime Is Null) AND (Seg2EFactTime Is Null)
		AND (Seg3BFactTime Is Null) AND (Seg3EFactTime Is Null)
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))

  --==========取节假日，考勤类型为按班次考勤人员记录=============
  DELETE FROM T_Att_TempIOTime
  INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,Class_Key)
  SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key,Shift.Class_Key As Class_Key
  FROM T_Att_TempCalc AS TmpCalc INNER JOIN T_Att_PsnShift AS Shift ON TmpCalc.Person_Key = Shift.Person_Key
  WHERE (TmpCalc.IsHoliday=1)
        AND (Shift.AttendType=0) AND (Shift.Class_Key Is Not Null)
        AND (TmpCalc.P_Key Not in(Select TempCalc.P_Key 
				From T_Att_TempCalc TempCalc,T_Att_Adjust Adjust
				WHERE (TempCalc.Person_Key=Adjust.Person_Key) AND (TempCalc.PlanDate=Adjust.AdjustDate)))


  --节假日，正常上班记录，设为假日加班
  UPDATE T_Att_TempCalc SET Seg1BResult=8,Seg1EResult=8
  WHERE ((Seg1BResult In (1,2,6,7)) OR (Seg1EResult In (1,2,6,7)))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))
  UPDATE T_Att_TempCalc SET Seg2BResult=8,Seg2EResult=8
  WHERE ((Seg2BResult In (1,2,6,7)) OR (Seg2EResult In (1,2,6,7)))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))
  UPDATE T_Att_TempCalc SET Seg3BResult=8,Seg3EResult=8   
  WHERE ((Seg3BResult In (1,2,6,7)) OR (Seg3EResult In (1,2,6,7)))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))

  --有打卡记录，但不是有效加班的设为空
  UPDATE T_Att_TempCalc SET Seg1BResult=NULL,Seg1EResult=NULL
  WHERE ((Seg1BResult=21) OR (Seg1EResult=21))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))
  UPDATE T_Att_TempCalc SET Seg2BResult=NULL,Seg2EResult=NULL
  WHERE ((Seg2BResult=21) OR (Seg2EResult=21))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))
  UPDATE T_Att_TempCalc SET Seg3BResult=NULL,Seg3EResult=NULL   
  WHERE ((Seg3BResult=21) OR (Seg3EResult=21))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))

  --周日，缺勤记录，设为空
  UPDATE T_Att_TempCalc SET Class_Key=NULL,ClassNo=NULL,ClassName=NULL, 
      Seg1Enabled=NULL,Seg1Type=NULL,Seg1BeginTime=NULL,Seg1EndTime=NULL,Seg1OnTime=NULL,Seg1OffTime=NULL,Seg1TimeLen=NULL, 
      Seg1CheckOn=NULL,Seg1CheckOff=NULL,Seg1CalcLate=NULL,Seg1CalcEarly=NULL,Seg1CalcAbsent=NULL,Seg1CalcLeave=NULL, 

      Seg2Enabled=NULL,Seg2Type=NULL,Seg2BeginTime=NULL,Seg2EndTime=NULL,Seg2OnTime=NULL,Seg2OffTime=NULL,Seg2TimeLen=NULL, 
      Seg2CheckOn=NULL,Seg2CheckOff=NULL,Seg2CalcLate=NULL,Seg2CalcEarly=NULL,Seg2CalcAbsent=NULL,Seg2CalcLeave=NULL, 

      Seg3Enabled=NULL,Seg3Type=NULL,Seg3BeginTime=NULL,Seg3EndTime=NULL,Seg3OnTime=NULL,Seg3OffTime=NULL,Seg3TimeLen=NULL, 
      Seg3CheckOn=NULL,Seg3CheckOff=NULL,Seg3CalcLate=NULL, Seg3CalcEarly=NULL,Seg3CalcAbsent=NULL,Seg3CalcLeave=NULL,

      /*Seg1BBTime=NULL,Seg1BETime=NULL,Seg1BTime=NULL,Seg1BFactTime=NULL,Seg1BResult=NULL,Seg1BValue=NULL,
      Seg1EBTime=NULL,Seg1EETime=NULL,Seg1ETime=NULL,Seg1EFactTime=NULL,Seg1EResult=NULL,Seg1EValue=NULL,Seg1Work=NULL,Seg1Over=NULL,

      Seg2BBTime=NULL,Seg2BETime=NULL,Seg2BTime=NULL,Seg2BFactTime=NULL,Seg2BResult=NULL,Seg2BValue=NULL,
      Seg2EBTime=NULL,Seg2EETime=NULL,Seg2ETime=NULL,Seg2EFactTime=NULL,Seg2EResult=NULL,Seg2EValue=NULL,Seg2Work=NULL,Seg2Over=NULL,
      
      Seg3BBTime=NULL,Seg3BETime=NULL,Seg3BTime=NULL,Seg3BFactTime=NULL,Seg3BResult=NULL,Seg3BValue=NULL,
      Seg3EBTime=NULL,Seg3EETime=NULL,Seg3ETime=NULL,Seg3EFactTime=NULL,Seg3EResult=NULL,Seg3EValue=NULL,Seg3Work=NULL,Seg3Over=NULL,*/ 
           
      Seg1BBTime=NULL,Seg1BETime=NULL,Seg1BFactTime=NULL,Seg1BResult=NULL,Seg1BValue=NULL,
      Seg1EBTime=NULL,Seg1EETime=NULL,Seg1EFactTime=NULL,Seg1EResult=NULL,Seg1EValue=NULL,Seg1Work=NULL,Seg1Over=NULL,

      Seg2BBTime=NULL,Seg2BETime=NULL,Seg2BFactTime=NULL,Seg2BResult=NULL,Seg2BValue=NULL,
      Seg2EBTime=NULL,Seg2EETime=NULL,Seg2EFactTime=NULL,Seg2EResult=NULL,Seg2EValue=NULL,Seg2Work=NULL,Seg2Over=NULL,

      Seg3BBTime=NULL,Seg3BETime=NULL,Seg3BFactTime=NULL,Seg3BResult=NULL,Seg3BValue=NULL,
      Seg3EBTime=NULL,Seg3EETime=NULL,Seg3ETime=NULL,Seg3EFactTime=NULL,Seg3EResult=NULL,Seg3EValue=NULL,Seg3Work=NULL,Seg3Over=NULL,

      AllTimeLen=NULL,OnDutyM=NULL,ShallDay=NULL,FactDay=NULL,AbsentDay=NULL,LaterM=NULL,LaterT=NULL,EarlyM=NULL,EarlyT=NULL,
      AbsentM=NULL,AbsentT=NULL,illM=NULL,AffairM=NULL,PubRestM=NULL,YearM=NULL,MarrigeM=NULL,MournM=NULL,MaternityM=NULL,
      EvectionM=NULL,EgressM=NULL,EgressT=NULL,Over1M=NULL,Over2M=NULL,Over3M=NULL
  WHERE (ISNULL(Seg1BResult,21) In (17,19,21)) AND (ISNULL(Seg1EResult,21) In (17,19,21))
		AND (ISNULL(Seg2BResult,21) In (17,19,21)) AND (ISNULL(Seg2EResult,21) In (17,19,21))
		AND (ISNULL(Seg3BResult,21) In (17,19,21)) AND (ISNULL(Seg3EResult,21) In (17,19,21))
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))

  --未打卡，设为空
  UPDATE T_Att_TempCalc SET Class_Key=NULL,ClassNo=NULL,ClassName=NULL, 
      Seg1Enabled=NULL,Seg1Type=NULL,Seg1BeginTime=NULL,Seg1EndTime=NULL,Seg1OnTime=NULL,Seg1OffTime=NULL,Seg1TimeLen=NULL, 
      Seg1CheckOn=NULL,Seg1CheckOff=NULL,Seg1CalcLate=NULL,Seg1CalcEarly=NULL,Seg1CalcAbsent=NULL,Seg1CalcLeave=NULL, 

      Seg2Enabled=NULL,Seg2Type=NULL,Seg2BeginTime=NULL,Seg2EndTime=NULL,Seg2OnTime=NULL,Seg2OffTime=NULL,Seg2TimeLen=NULL, 
      Seg2CheckOn=NULL,Seg2CheckOff=NULL,Seg2CalcLate=NULL,Seg2CalcEarly=NULL,Seg2CalcAbsent=NULL,Seg2CalcLeave=NULL, 

      Seg3Enabled=NULL,Seg3Type=NULL,Seg3BeginTime=NULL,Seg3EndTime=NULL,Seg3OnTime=NULL,Seg3OffTime=NULL,Seg3TimeLen=NULL, 
      Seg3CheckOn=NULL,Seg3CheckOff=NULL,Seg3CalcLate=NULL, Seg3CalcEarly=NULL,Seg3CalcAbsent=NULL,Seg3CalcLeave=NULL,
      
      /*Seg1BBTime=NULL,Seg1BETime=NULL,Seg1BTime=NULL,Seg1BFactTime=NULL,Seg1BResult=NULL,Seg1BValue=NULL,
      Seg1EBTime=NULL,Seg1EETime=NULL,Seg1ETime=NULL,Seg1EFactTime=NULL,Seg1EResult=NULL,Seg1EValue=NULL,Seg1Work=NULL,Seg1Over=NULL,

      Seg2BBTime=NULL,Seg2BETime=NULL,Seg2BTime=NULL,Seg2BFactTime=NULL,Seg2BResult=NULL,Seg2BValue=NULL,
      Seg2EBTime=NULL,Seg2EETime=NULL,Seg2ETime=NULL,Seg2EFactTime=NULL,Seg2EResult=NULL,Seg2EValue=NULL,Seg2Work=NULL,Seg2Over=NULL,
      
      Seg3BBTime=NULL,Seg3BETime=NULL,Seg3BTime=NULL,Seg3BFactTime=NULL,Seg3BResult=NULL,Seg3BValue=NULL,
      Seg3EBTime=NULL,Seg3EETime=NULL,Seg3ETime=NULL,Seg3EFactTime=NULL,Seg3EResult=NULL,Seg3EValue=NULL,Seg3Work=NULL,Seg3Over=NULL,*/ 
           
      Seg1BBTime=NULL,Seg1BETime=NULL,Seg1BFactTime=NULL,Seg1BResult=NULL,Seg1BValue=NULL,
      Seg1EBTime=NULL,Seg1EETime=NULL,Seg1EFactTime=NULL,Seg1EResult=NULL,Seg1EValue=NULL,Seg1Work=NULL,Seg1Over=NULL,

      Seg2BBTime=NULL,Seg2BETime=NULL,Seg2BFactTime=NULL,Seg2BResult=NULL,Seg2BValue=NULL,
      Seg2EBTime=NULL,Seg2EETime=NULL,Seg2EFactTime=NULL,Seg2EResult=NULL,Seg2EValue=NULL,Seg2Work=NULL,Seg2Over=NULL,

      Seg3BBTime=NULL,Seg3BETime=NULL,Seg3BFactTime=NULL,Seg3BResult=NULL,Seg3BValue=NULL,
      Seg3EBTime=NULL,Seg3EETime=NULL,Seg3ETime=NULL,Seg3EFactTime=NULL,Seg3EResult=NULL,Seg3EValue=NULL,Seg3Work=NULL,Seg3Over=NULL,

      AllTimeLen=NULL,OnDutyM=NULL,ShallDay=NULL,FactDay=NULL,AbsentDay=NULL,LaterM=NULL,LaterT=NULL,EarlyM=NULL,EarlyT=NULL,
      AbsentM=NULL,AbsentT=NULL,illM=NULL,AffairM=NULL,PubRestM=NULL,YearM=NULL,MarrigeM=NULL,MournM=NULL,MaternityM=NULL,
      EvectionM=NULL,EgressM=NULL,EgressT=NULL,Over1M=NULL,Over2M=NULL,Over3M=NULL
  WHERE (Seg1BFactTime Is Null) AND (Seg1EFactTime Is Null)
		AND (Seg2BFactTime Is Null) AND (Seg2EFactTime Is Null)
		AND (Seg3BFactTime Is Null) AND (Seg3EFactTime Is Null)
		AND (P_Key In (Select P_Key From T_Att_TempIOTime))
END
' 
END
GO
/****** 对象:  StoredProcedure [dbo].[P_Att_OverToOnDutyUp]    脚本日期: 09/25/2019 10:09:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_OverToOnDutyUp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--更新临时表内未审核的加班记录为空，已审核记录中：刷卡时间大于审核时间的，更改其时间为审核时间
CREATE PROCEDURE [dbo].[P_Att_OverToOnDutyUp]
		@ClassType	int	--类型(平日加班、公休加班、节假日加班)
AS
BEGIN
  DECLARE	@OnDuty		int,	--实出勤
                @Att_OverTimeMode Int,	--加班计算方式(0-按半小时取整，1-按打卡时间，2-按半小时补齐)
		@EarlyOnIsOver	  Int,	--提前上班作为加班(0-否 1-是)
		@LateOffIsOver    Int,	--延迟下班作为加班(0-否 1-是)
		@LateOffDecTime   Int,	--延迟下班扣除吃饭时间
		@MinOvertime      Int,   --最小加班时间
		@OverCheck        Int   --加班审核（0-审核，1-不用审核）		

  SELECT @Att_OverTimeMode=ISNULL(Value1,0) FROM T_Com_SysPara WHERE sName=''Att_OverTimeMode''
  SELECT @EarlyOnIsOver=ISNULL(Value1,0) FROM T_Com_SysPara WHERE sName=''Att_EarlyOnIsOver''
  SELECT @LateOffIsOver=ISNULL(Value1,0) FROM T_Com_SysPara WHERE sName=''Att_LateOffIsOver''
  SELECT @LateOffDecTime=ISNULL(Value1,0) FROM T_Com_SysPara WHERE sName=''Att_LateOffDecTime''
  SELECT @MinOvertime=ISNULL(Value1,0) FROM T_Com_SysPara WHERE sName=''Att_MinOvertime''
  SELECT @OverCheck=ISNULL(Value1,1) FROM T_Com_SysPara WHERE sName=''Att_WorkOverCondi''    

  UPDATE T_Att_TempCalc set Seg1Over=null,Seg2Over=null,Seg3Over=null
  --提前上班产生的加班
  IF (@EarlyOnIsOver=1)
  BEGIN
    IF (@Att_OverTimeMode=0)  --按30分钟取整计算
    BEGIN 
	UPDATE T_Att_TempCalc
	SET Seg1Over = ROUND(((CAST(Seg1BTime As Float)-Cast(Seg1BFactTime AS FLOAT))*1440+1)/30,0,1)*30,Seg1BResult=6 
	WHERE (Seg1Enabled=1) AND (Seg1CheckOn=1)
		AND (Seg1BFactTime Is Not Null) And (Seg1BTime Is Not Null)
		AND (ROUND(((CAST(Seg1BTime As Float)-Cast(Seg1BFactTime AS FLOAT))*1440+1)/30,0,1)*30>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg2Over = ISNULL(Seg2Over,0)+ROUND(((CAST(Seg2BTime As Float)-Cast(Seg2BFactTime AS FLOAT))*1440+1)/30,0,1)*30,Seg2BResult=6  
	WHERE (Seg2Enabled=1) AND (Seg2CheckOn=1)
		AND (Seg2BFactTime Is Not Null) And (Seg2BTime Is Not Null)
		AND (ROUND(((CAST(Seg2BTime As Float)-Cast(Seg2BFactTime AS FLOAT))*1440+1)/30,0,1)*30>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg3Over = ISNULL(Seg3Over,0)+ROUND(((CAST(Seg3BTime As Float)-Cast(Seg3BFactTime AS FLOAT))*1440+1)/30,0,1)*30,Seg3BResult=6  
	WHERE (Seg3Enabled=1) AND (Seg3CheckOn=1)
		AND (Seg3BFactTime Is Not Null) And (Seg3BTime Is Not Null)
		AND (ROUND(((CAST(Seg3BTime As Float)-Cast(Seg3BFactTime AS FLOAT))*1440+1)/30,0,1)*30>=@MinOvertime)
    END
    ELSE IF (@Att_OverTimeMode=1)
    BEGIN 
	UPDATE T_Att_TempCalc
	SET Seg1Over = CONVERT(INT,(CAST(Seg1BTime As Float)-CAST(Seg1BFactTime AS FLOAT))*1440),Seg1BResult=6  
	WHERE (Seg1Enabled=1) AND (Seg1CheckOn=1)
		AND (Seg1BFactTime Is Not Null) And (Seg1BTime Is Not Null)
		AND (CONVERT(INT,(CAST(Seg1BTime As Float)-CAST(Seg1BFactTime AS FLOAT))*1440)>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg2Over = ISNULL(Seg2Over,0)+CONVERT(INT,(CAST(Seg2BTime As Float)-Cast(Seg2BFactTime AS FLOAT))*1440),Seg2BResult=6 
	WHERE (Seg2Enabled=1) AND (Seg2CheckOn=1)
		AND (Seg2BFactTime Is Not Null) And (Seg2BTime Is Not Null)
		AND (CONVERT(INT,(CAST(Seg2BTime As Float)-Cast(Seg2BFactTime AS FLOAT))*1440)>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg3Over = ISNULL(Seg3Over,0)+CONVERT(INT,(CAST(Seg3BTime As Float)-CAST(Seg3BFactTime AS FLOAT))*1440),Seg3BResult=6 
	WHERE (Seg3Enabled=1) AND (Seg3CheckOn=1)
		AND (Seg3BFactTime Is Not Null) And (Seg3BTime Is Not Null)
		AND (CONVERT(INT,(CAST(Seg3BTime As Float)-Cast(Seg3BFactTime AS FLOAT))*1440)>=@MinOvertime)
    END
    ELSE IF (@Att_OverTimeMode=2)
    BEGIN 
	UPDATE T_Att_TempCalc
	SET Seg1Over = CEILING((CAST(Seg1BTime As Float)-Cast(Seg1BFactTime AS FLOAT))*1440/30)*30,Seg1BResult=6 
	WHERE (Seg1Enabled=1) AND (Seg1CheckOn=1)
		AND (Seg1BFactTime Is Not Null) And (Seg1BTime Is Not Null)
		AND (CEILING((CAST(Seg1BTime As Float)-Cast(Seg1BFactTime AS FLOAT))*1440/30)*30>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg2Over = ISNULL(Seg2Over,0)+CEILING((CAST(Seg2BTime As Float)-Cast(Seg2BFactTime AS FLOAT))*1440/30)*30,Seg2BResult=6 
	WHERE (Seg2Enabled=1) AND (Seg2CheckOn=1)
		AND (Seg2BFactTime Is Not Null) And (Seg2BTime Is Not Null)
		AND (CEILING((CAST(Seg2BTime As Float)-Cast(Seg2BFactTime AS FLOAT))*1440/30)*30>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg3Over = ISNULL(Seg3Over,0)+CEILING((CAST(Seg3BTime As Float)-Cast(Seg3BFactTime AS FLOAT))*1440/30)*30,Seg3BResult=6 
	WHERE (Seg3Enabled=1) AND (Seg3CheckOn=1)
		AND (Seg3BFactTime Is Not Null) And (Seg3BTime Is Not Null)
		AND (CEILING((CAST(Seg3BTime As Float)-Cast(Seg3BFactTime AS FLOAT))*1440/30)*30>=@MinOvertime)
    END
  END

  --延迟下班产生的加班
  IF (@LateOffIsOver=1)
  BEGIN
    IF (@Att_OverTimeMode=0)  --按30分钟取整计算
    BEGIN 
	UPDATE T_Att_TempCalc
	SET Seg1Over = ISNULL(Seg1Over,0)+(ROUND(((CAST(Seg1EFactTime As Float)-CAST(Seg1ETime AS FLOAT))*1440+1)/30,0,1)*30-@LateOffDecTime),Seg1EResult=6  
	WHERE (Seg1Enabled=1) AND (Seg1CheckOff=1)
		AND (Seg1EFactTime Is Not Null) And (Seg1ETime Is Not Null)
		AND ((ROUND(((CAST(Seg1EFactTime As Float)-CAST(Seg1ETime AS FLOAT))*1440+1)/30,0,1)*30-@LateOffDecTime)>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg2Over = ISNULL(Seg2Over,0)+ROUND(((CAST(Seg2EFactTime As Float)-CAST(Seg2ETime AS FLOAT))*1440+1)/30,0,1)*30-@LateOffDecTime,Seg2EResult=6  
	WHERE (Seg2Enabled=1) AND (Seg2CheckOff=1)
		AND (Seg2EFactTime Is Not Null) And (Seg2ETime Is Not Null)
	        AND ((ROUND(((CAST(Seg2EFactTime As Float)-CAST(Seg2ETime AS FLOAT))*1440+1)/30,0,1)*30-@LateOffDecTime)>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg3Over = ISNULL(Seg3Over,0)+(ROUND(((CAST(Seg3EFactTime As Float)-CAST(Seg3ETime AS FLOAT))*1440+1)/30,0,1)*30-@LateOffDecTime),Seg3EResult=6  
	WHERE (Seg3Enabled=1) AND (Seg3CheckOff=1)
		AND (Seg3EFactTime Is Not Null) And (Seg3ETime Is Not Null)
		AND ((ROUND(((CAST(Seg3EFactTime As Float)-CAST(Seg3ETime AS FLOAT))*1440+1)/30,0,1)*30-@LateOffDecTime)>=@MinOvertime)
    END
    ELSE IF (@Att_OverTimeMode=1)
    BEGIN 
	UPDATE T_Att_TempCalc
	SET Seg1Over = ISNULL(Seg1Over,0)+(CONVERT(INT,(CAST(Seg1EFactTime As Float)-CAST(Seg1ETime AS FLOAT))*1440)-@LateOffDecTime),Seg1EResult=6  
	WHERE (Seg1Enabled=1) AND (Seg1CheckOff=1)
		AND (Seg1EFactTime Is Not Null) And (Seg1ETime Is Not Null)
		AND ((CONVERT(INT,(CAST(Seg1EFactTime As Float)-CAST(Seg1ETime AS FLOAT))*1440)-@LateOffDecTime)>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg2Over = ISNULL(Seg2Over,0)+(CONVERT(INT,(CAST(Seg2EFactTime As Float)-CAST(Seg2ETime AS FLOAT))*1440)-@LateOffDecTime),Seg2EResult=6 
	WHERE (Seg2Enabled=1) AND (Seg2CheckOff=1)
		AND (Seg2EFactTime Is Not Null) And (Seg2ETime Is Not Null)
		AND ((CONVERT(INT,(CAST(Seg2EFactTime As Float)-CAST(Seg2ETime AS FLOAT))*1440)-@LateOffDecTime)>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg3Over = ISNULL(Seg3Over,0)+(CONVERT(INT,(CAST(Seg3EFactTime As Float)-CAST(Seg3ETime AS FLOAT))*1440)-@LateOffDecTime),Seg3EResult=6 
	WHERE (Seg3Enabled=1) AND (Seg3CheckOff=1)
		AND (Seg3EFactTime Is Not Null) And (Seg3ETime Is Not Null)
		AND ((CONVERT(INT,(CAST(Seg3EFactTime As Float)-CAST(Seg3ETime AS FLOAT))*1440)-@LateOffDecTime)>=@MinOvertime)
    END
    ELSE IF (@Att_OverTimeMode=2)
    BEGIN 
	UPDATE T_Att_TempCalc
	SET Seg1Over = ISNULL(Seg1Over,0)+(CEILING((CAST(Seg1EFactTime As Float)-CAST(Seg1ETime AS FLOAT))*1440/30)*30-@LateOffDecTime),Seg1EResult=6 
	WHERE (Seg1Enabled=1) AND (Seg1CheckOff=1)
		AND (Seg1EFactTime Is Not Null) And (Seg1ETime Is Not Null)
		AND ((CEILING((CAST(Seg1EFactTime As Float)-CAST(Seg1ETime AS FLOAT))*1440/30)*30-@LateOffDecTime)>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg2Over = ISNULL(Seg2Over,0)+(CEILING((CAST(Seg2EFactTime As Float)-CAST(Seg2ETime AS FLOAT))*1440/30)*30-@LateOffDecTime),Seg2EResult=6 
	WHERE (Seg2Enabled=1) AND (Seg2CheckOff=1)
		AND (Seg2EFactTime Is Not Null) And (Seg2ETime Is Not Null)
		AND ((CEILING((CAST(Seg2EFactTime As Float)-CAST(Seg2ETime AS FLOAT))*1440/30)*30-@LateOffDecTime)>=@MinOvertime)

	UPDATE T_Att_TempCalc
	SET Seg3Over = ISNULL(Seg3Over,0)+(CEILING((CAST(Seg3EFactTime As Float)-CAST(Seg3ETime AS FLOAT))*1440/30)*30-@LateOffDecTime),Seg3EResult=6 
	WHERE (Seg3Enabled=1) AND (Seg3CheckOff=1)
		AND (Seg3EFactTime Is Not Null) And (Seg3ETime Is Not Null)
		AND ((CEILING((CAST(Seg3EFactTime As Float)-CAST(Seg3ETime AS FLOAT))*1440/30)*30-@LateOffDecTime)>=@MinOvertime)
    END
    END








  --提前上班产生的加班 ---联班审核产生的加班
  IF (@EarlyOnIsOver=0)
  BEGIN
    IF (@Att_OverTimeMode=0)  --按30分钟取整计算
    BEGIN 
	UPDATE T_Att_TempCalc
	SET Seg1Over = ROUND(((CAST(Seg1BTime As Float)-Cast(Seg1BFactTime AS FLOAT))*1440+1)/30,0,1)*30,Seg1BResult=6 
        FROM T_Att_TempCalc ,T_Att_OverCheck
        WHERE  (Seg1Enabled=1) AND (Seg1CheckOn=1)
	       AND (Seg1BFactTime Is Not Null) And (Seg1BTime Is Not Null)
               AND (ROUND(((CAST(Seg1BTime As Float)-Cast(Seg1BFactTime AS FLOAT))*1440+1)/30,0,1)*30>=@MinOvertime)
               AND (T_Att_TempCalc.Person_Key = T_Att_OverCheck.Person_Key) 
               AND (T_Att_OverCheck.OverDate=T_Att_TempCalc.PlanDate)
               AND (Seg1BFactTime BETWEEN T_Att_OverCheck.BeginTime AND T_Att_OverCheck.EndTime)

	UPDATE T_Att_TempCalc
	SET Seg2Over = ISNULL(Seg2Over,0)+ROUND(((CAST(Seg2BTime As Float)-Cast(Seg2BFactTime AS FLOAT))*1440+1)/30,0,1)*30,Seg2BResult=6 
        FROM T_Att_TempCalc ,T_Att_OverCheck
	WHERE (Seg2Enabled=1) AND (Seg2CheckOn=1)
		AND (Seg2BFactTime Is Not Null) And (Seg2BTime Is Not Null)
		AND (ROUND(((CAST(Seg2BTime As Float)-Cast(Seg2BFactTime AS FLOAT))*1440+1)/30,0,1)*30>=@MinOvertime)
                AND (T_Att_TempCalc.Person_Key = T_Att_OverCheck.Person_Key) 
                AND (T_Att_OverCheck.OverDate=T_Att_TempCalc.PlanDate)
                AND (Seg2BFactTime BETWEEN T_Att_OverCheck.BeginTime AND T_Att_OverCheck.EndTime)

	UPDATE T_Att_TempCalc
	SET Seg3Over = ISNULL(Seg3Over,0)+ROUND(((CAST(Seg3BTime As Float)-Cast(Seg3BFactTime AS FLOAT))*1440+1)/30,0,1)*30,Seg3BResult=6 
        FROM T_Att_TempCalc ,T_Att_OverCheck
	WHERE (Seg3Enabled=1) AND (Seg3CheckOn=1)
		AND (Seg3BFactTime Is Not Null) And (Seg3BTime Is Not Null)
		AND (ROUND(((CAST(Seg3BTime As Float)-Cast(Seg3BFactTime AS FLOAT))*1440+1)/30,0,1)*30>=@MinOvertime)
               AND (T_Att_TempCalc.Person_Key = T_Att_OverCheck.Person_Key) 
               AND (T_Att_OverCheck.OverDate=T_Att_TempCalc.PlanDate)
               AND (Seg3BFactTime BETWEEN T_Att_OverCheck.BeginTime AND T_Att_OverCheck.EndTime)
    END
    ELSE IF (@Att_OverTimeMode=1)
    BEGIN 
	UPDATE T_Att_TempCalc
	SET Seg1Over = CONVERT(INT,(CAST(Seg1BTime As Float)-CAST(Seg1BFactTime AS FLOAT))*1440),Seg1BResult=6 
        FROM T_Att_TempCalc ,T_Att_OverCheck
	WHERE (Seg1Enabled=1) AND (Seg1CheckOn=1)
		AND (Seg1BFactTime Is Not Null) And (Seg1BTime Is Not Null)
		AND (CONVERT(INT,(CAST(Seg1BTime As Float)-CAST(Seg1BFactTime AS FLOAT))*1440)>=@MinOvertime)
               AND (T_Att_TempCalc.Person_Key = T_Att_OverCheck.Person_Key) 
               AND (T_Att_OverCheck.OverDate=T_Att_TempCalc.PlanDate)
               AND (Seg1BFactTime BETWEEN T_Att_OverCheck.BeginTime AND T_Att_OverCheck.EndTime)

	UPDATE T_Att_TempCalc
	SET Seg2Over = ISNULL(Seg2Over,0)+CONVERT(INT,(CAST(Seg2BTime As Float)-Cast(Seg2BFactTime AS FLOAT))*1440),Seg2BResult=6
        FROM T_Att_TempCalc ,T_Att_OverCheck
	WHERE (Seg2Enabled=1) AND (Seg2CheckOn=1)
		AND (Seg2BFactTime Is Not Null) And (Seg2BTime Is Not Null)
		AND (CONVERT(INT,(CAST(Seg2BTime As Float)-Cast(Seg2BFactTime AS FLOAT))*1440)>=@MinOvertime)
               AND (T_Att_TempCalc.Person_Key = T_Att_OverCheck.Person_Key) 
               AND (T_Att_OverCheck.OverDate=T_Att_TempCalc.PlanDate)
               AND (Seg2BFactTime BETWEEN T_Att_OverCheck.BeginTime AND T_Att_OverCheck.EndTime)

	UPDATE T_Att_TempCalc
	SET Seg3Over = ISNULL(Seg3Over,0)+CONVERT(INT,(CAST(Seg3BTime As Float)-CAST(Seg3BFactTime AS FLOAT))*1440),Seg3BResult=6
        FROM T_Att_TempCalc ,T_Att_OverCheck
	WHERE (Seg3Enabled=1) AND (Seg3CheckOn=1)
		AND (Seg3BFactTime Is Not Null) And (Seg3BTime Is Not Null)
		AND (CONVERT(INT,(CAST(Seg3BTime As Float)-Cast(Seg3BFactTime AS FLOAT))*1440)>=@MinOvertime)
               AND (T_Att_TempCalc.Person_Key = T_Att_OverCheck.Person_Key) 
               AND (T_Att_OverCheck.OverDate=T_Att_TempCalc.PlanDate)
               AND (Seg3BFactTime BETWEEN T_Att_OverCheck.BeginTime AND T_Att_OverCheck.EndTime)

    END
    ELSE IF (@Att_OverTimeMode=2)
    BEGIN 
	UPDATE T_Att_TempCalc
	SET Seg1Over = CEILING((CAST(Seg1BTime As Float)-Cast(Seg1BFactTime AS FLOAT))*1440/30)*30,Seg1BResult=6
        FROM T_Att_TempCalc ,T_Att_OverCheck
	WHERE (Seg1Enabled=1) AND (Seg1CheckOn=1)
		AND (Seg1BFactTime Is Not Null) And (Seg1BTime Is Not Null)
		AND (CEILING((CAST(Seg1BTime As Float)-Cast(Seg1BFactTime AS FLOAT))*1440/30)*30>=@MinOvertime)
               AND (T_Att_TempCalc.Person_Key = T_Att_OverCheck.Person_Key) 
               AND (T_Att_OverCheck.OverDate=T_Att_TempCalc.PlanDate)
               AND (Seg1BFactTime BETWEEN T_Att_OverCheck.BeginTime AND T_Att_OverCheck.EndTime)

	UPDATE T_Att_TempCalc
	SET Seg2Over = ISNULL(Seg2Over,0)+CEILING((CAST(Seg2BTime As Float)-Cast(Seg2BFactTime AS FLOAT))*1440/30)*30,Seg2BResult=6
        FROM T_Att_TempCalc ,T_Att_OverCheck
	WHERE (Seg2Enabled=1) AND (Seg2CheckOn=1)
		AND (Seg2BFactTime Is Not Null) And (Seg2BTime Is Not Null)
		AND (CEILING((CAST(Seg2BTime As Float)-Cast(Seg2BFactTime AS FLOAT))*1440/30)*30>=@MinOvertime)
               AND (T_Att_TempCalc.Person_Key = T_Att_OverCheck.Person_Key) 
               AND (T_Att_OverCheck.OverDate=T_Att_TempCalc.PlanDate)
               AND (Seg2BFactTime BETWEEN T_Att_OverCheck.BeginTime AND T_Att_OverCheck.EndTime)

	UPDATE T_Att_TempCalc
	SET Seg3Over = ISNULL(Seg3Over,0)+CEILING((CAST(Seg3BTime As Float)-Cast(Seg3BFactTime AS FLOAT))*1440/30)*30,Seg3BResult=6
        FROM T_Att_TempCalc ,T_Att_OverCheck
	WHERE (Seg3Enabled=1) AND (Seg3CheckOn=1)
		AND (Seg3BFactTime Is Not Null) And (Seg3BTime Is Not Null)
		AND (CEILING((CAST(Seg3BTime As Float)-Cast(Seg3BFactTime AS FLOAT))*1440/30)*30>=@MinOvertime)
               AND (T_Att_TempCalc.Person_Key = T_Att_OverCheck.Person_Key) 
               AND (T_Att_OverCheck.OverDate=T_Att_TempCalc.PlanDate)
               AND (Seg3BFactTime BETWEEN T_Att_OverCheck.BeginTime AND T_Att_OverCheck.EndTime)
    END
  END

  --延迟下班产生的加班   ---联班审核产生的加班
  IF (@LateOffIsOver=0)
  BEGIN
    IF (@Att_OverTimeMode=0)  --按30分钟取整计算
    BEGIN 
	UPDATE T_Att_TempCalc
	SET Seg1Over = ISNULL(Seg1Over,0)+(ROUND(((CAST(Seg1EFactTime As Float)-CAST(Seg1ETime AS FLOAT))*1440+1)/30,0,1)*30-@LateOffDecTime),Seg1EResult=6 
        FROM T_Att_TempCalc ,T_Att_OverCheck
	WHERE  (Seg1Enabled=1) AND (Seg1CheckOff=1)
		AND (Seg1EFactTime Is Not Null) And (Seg1ETime Is Not Null)
		AND ((ROUND(((CAST(Seg1EFactTime As Float)-CAST(Seg1ETime AS FLOAT))*1440+1)/30,0,1)*30-@LateOffDecTime)>=@MinOvertime)
                AND (T_Att_TempCalc.Person_Key = T_Att_OverCheck.Person_Key) 
                AND (T_Att_OverCheck.OverDate=T_Att_TempCalc.PlanDate)
                AND (Seg1EFactTime BETWEEN T_Att_OverCheck.BeginTime AND T_Att_OverCheck.EndTime)

	UPDATE T_Att_TempCalc
	SET Seg2Over = ISNULL(Seg2Over,0)+ROUND(((CAST(Seg2EFactTime As Float)-CAST(Seg2ETime AS FLOAT))*1440+1)/30,0,1)*30-@LateOffDecTime,Seg2EResult=6  
        FROM T_Att_TempCalc ,T_Att_OverCheck
	WHERE (Seg2Enabled=1) AND (Seg2CheckOff=1)
		AND (Seg2EFactTime Is Not Null) And (Seg2ETime Is Not Null)
	        AND ((ROUND(((CAST(Seg2EFactTime As Float)-CAST(Seg2ETime AS FLOAT))*1440+1)/30,0,1)*30-@LateOffDecTime)>=@MinOvertime)
               AND (T_Att_TempCalc.Person_Key = T_Att_OverCheck.Person_Key) 
               AND (T_Att_OverCheck.OverDate=T_Att_TempCalc.PlanDate)
               AND (Seg2EFactTime BETWEEN T_Att_OverCheck.BeginTime AND T_Att_OverCheck.EndTime)

	UPDATE T_Att_TempCalc
	SET Seg3Over = ISNULL(Seg3Over,0)+(ROUND(((CAST(Seg3EFactTime As Float)-CAST(Seg3ETime AS FLOAT))*1440+1)/30,0,1)*30-@LateOffDecTime),Seg3EResult=6  
        FROM T_Att_TempCalc ,T_Att_OverCheck
	WHERE (Seg3Enabled=1) AND (Seg3CheckOff=1)
		AND (Seg3EFactTime Is Not Null) And (Seg3ETime Is Not Null)
		AND ((ROUND(((CAST(Seg3EFactTime As Float)-CAST(Seg3ETime AS FLOAT))*1440+1)/30,0,1)*30-@LateOffDecTime)>=@MinOvertime)
               AND (T_Att_TempCalc.Person_Key = T_Att_OverCheck.Person_Key) 
               AND (T_Att_OverCheck.OverDate=T_Att_TempCalc.PlanDate)
               AND (Seg3EFactTime BETWEEN T_Att_OverCheck.BeginTime AND T_Att_OverCheck.EndTime)

    END
    ELSE IF (@Att_OverTimeMode=1)
    BEGIN 
	UPDATE T_Att_TempCalc
	SET Seg1Over = ISNULL(Seg1Over,0)+(CONVERT(INT,(CAST(Seg1EFactTime As Float)-CAST(Seg1ETime AS FLOAT))*1440)-@LateOffDecTime),Seg1EResult=6  
        FROM T_Att_TempCalc ,T_Att_OverCheck
	WHERE (Seg1Enabled=1) AND (Seg1CheckOff=1)
		AND (Seg1EFactTime Is Not Null) And (Seg1ETime Is Not Null)
		AND ((CONVERT(INT,(CAST(Seg1EFactTime As Float)-CAST(Seg1ETime AS FLOAT))*1440)-@LateOffDecTime)>=@MinOvertime)
               AND (T_Att_TempCalc.Person_Key = T_Att_OverCheck.Person_Key) 
               AND (T_Att_OverCheck.OverDate=T_Att_TempCalc.PlanDate)
               AND (Seg1EFactTime BETWEEN T_Att_OverCheck.BeginTime AND T_Att_OverCheck.EndTime)

	UPDATE T_Att_TempCalc
	SET Seg2Over = ISNULL(Seg2Over,0)+(CONVERT(INT,(CAST(Seg2EFactTime As Float)-CAST(Seg2ETime AS FLOAT))*1440)-@LateOffDecTime),Seg2EResult=6 
        FROM T_Att_TempCalc ,T_Att_OverCheck
	WHERE (Seg2Enabled=1) AND (Seg2CheckOff=1)
		AND (Seg2EFactTime Is Not Null) And (Seg2ETime Is Not Null)
		AND ((CONVERT(INT,(CAST(Seg2EFactTime As Float)-CAST(Seg2ETime AS FLOAT))*1440)-@LateOffDecTime)>=@MinOvertime)
               AND (T_Att_TempCalc.Person_Key = T_Att_OverCheck.Person_Key) 
               AND (T_Att_OverCheck.OverDate=T_Att_TempCalc.PlanDate)
               AND (Seg2EFactTime BETWEEN T_Att_OverCheck.BeginTime AND T_Att_OverCheck.EndTime)

	UPDATE T_Att_TempCalc
	SET Seg3Over = ISNULL(Seg3Over,0)+(CONVERT(INT,(CAST(Seg3EFactTime As Float)-CAST(Seg3ETime AS FLOAT))*1440)-@LateOffDecTime),Seg3EResult=6 
        FROM T_Att_TempCalc ,T_Att_OverCheck
	WHERE (Seg3Enabled=1) AND (Seg3CheckOff=1)
		AND (Seg3EFactTime Is Not Null) And (Seg3ETime Is Not Null)
		AND ((CONVERT(INT,(CAST(Seg3EFactTime As Float)-CAST(Seg3ETime AS FLOAT))*1440)-@LateOffDecTime)>=@MinOvertime)
               AND (T_Att_TempCalc.Person_Key = T_Att_OverCheck.Person_Key) 
               AND (T_Att_OverCheck.OverDate=T_Att_TempCalc.PlanDate)
               AND (Seg3EFactTime BETWEEN T_Att_OverCheck.BeginTime AND T_Att_OverCheck.EndTime)
    END
    ELSE IF (@Att_OverTimeMode=2)
    BEGIN 
	UPDATE T_Att_TempCalc
	SET Seg1Over = ISNULL(Seg1Over,0)+(CEILING((CAST(Seg1EFactTime As Float)-CAST(Seg1ETime AS FLOAT))*1440/30)*30-@LateOffDecTime),Seg1EResult=6 
        FROM T_Att_TempCalc ,T_Att_OverCheck
	WHERE (Seg1Enabled=1) AND (Seg1CheckOff=1)
		AND (Seg1EFactTime Is Not Null) And (Seg1ETime Is Not Null)
		AND ((CEILING((CAST(Seg1EFactTime As Float)-CAST(Seg1ETime AS FLOAT))*1440/30)*30-@LateOffDecTime)>=@MinOvertime)
               AND (T_Att_TempCalc.Person_Key = T_Att_OverCheck.Person_Key) 
               AND (T_Att_OverCheck.OverDate=T_Att_TempCalc.PlanDate)
               AND (Seg1EFactTime BETWEEN T_Att_OverCheck.BeginTime AND T_Att_OverCheck.EndTime)

	UPDATE T_Att_TempCalc
	SET Seg2Over = ISNULL(Seg2Over,0)+(CEILING((CAST(Seg2EFactTime As Float)-CAST(Seg2ETime AS FLOAT))*1440/30)*30-@LateOffDecTime),Seg2EResult=6 
        FROM T_Att_TempCalc ,T_Att_OverCheck
	WHERE (Seg2Enabled=1) AND (Seg2CheckOff=1)
		AND (Seg2EFactTime Is Not Null) And (Seg2ETime Is Not Null)
		AND ((CEILING((CAST(Seg2EFactTime As Float)-CAST(Seg2ETime AS FLOAT))*1440/30)*30-@LateOffDecTime)>=@MinOvertime)
               AND (T_Att_TempCalc.Person_Key = T_Att_OverCheck.Person_Key) 
               AND (T_Att_OverCheck.OverDate=T_Att_TempCalc.PlanDate)
               AND (Seg2EFactTime BETWEEN T_Att_OverCheck.BeginTime AND T_Att_OverCheck.EndTime)

	UPDATE T_Att_TempCalc
	SET Seg3Over = ISNULL(Seg3Over,0)+(CEILING((CAST(Seg3EFactTime As Float)-CAST(Seg3ETime AS FLOAT))*1440/30)*30-@LateOffDecTime),Seg3EResult=6 
        FROM T_Att_TempCalc ,T_Att_OverCheck
	WHERE (Seg3Enabled=1) AND (Seg3CheckOff=1)
		AND (Seg3EFactTime Is Not Null) And (Seg3ETime Is Not Null)
		AND ((CEILING((CAST(Seg3EFactTime As Float)-CAST(Seg3ETime AS FLOAT))*1440/30)*30-@LateOffDecTime)>=@MinOvertime)
               AND (T_Att_TempCalc.Person_Key = T_Att_OverCheck.Person_Key) 
               AND (T_Att_OverCheck.OverDate=T_Att_TempCalc.PlanDate)
               AND (Seg3EFactTime BETWEEN T_Att_OverCheck.BeginTime AND T_Att_OverCheck.EndTime)
    END
    END
   
  SET @OnDuty=NULL
  IF (@OverCheck=0) 
  BEGIN

     DELETE FROM T_Att_TempIOTime
     INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,SegWork)
     SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key,Round(Convert(Float,(OverCheck.EndTime-OverCheck.BeginTime))*1440,0,1) As SegWork
     FROM T_Att_TempCalc AS TmpCalc INNER JOIN T_Att_OverCheck AS OverCheck ON TmpCalc.Person_Key = OverCheck.Person_Key
     WHERE --(OverCheck.ClassType=@ClassType) AND 
        (OverCheck.OverDate=TmpCalc.PlanDate)           
        AND (TmpCalc.Seg1Enabled=1) and (TmpCalc.Seg1BTime is not NULL)
        AND (Seg1BFactTime BETWEEN OverCheck.BeginTime AND OverCheck.EndTime)
     UPDATE T_Att_TempCalc SET Seg1BResult=NULL
     WHERE (Seg1BResult in(6,7,8)) AND(NOT (P_Key In (Select P_Key From T_Att_TempIOTime)))


     DELETE FROM T_Att_TempIOTime
     INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,SegWork)
     SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key,Round(Convert(Float,(OverCheck.EndTime-OverCheck.BeginTime))*1440,0,1) As SegWork
     FROM T_Att_TempCalc AS TmpCalc INNER JOIN T_Att_OverCheck AS OverCheck ON TmpCalc.Person_Key = OverCheck.Person_Key
     WHERE --(OverCheck.ClassType=@ClassType) AND 
        (OverCheck.OverDate=TmpCalc.PlanDate)           
        AND (TmpCalc.Seg2Enabled=1) and (TmpCalc.Seg2BTime is not NULL)
        AND (Seg2BFactTime BETWEEN OverCheck.BeginTime AND OverCheck.EndTime)
     UPDATE T_Att_TempCalc SET Seg2BResult=NULL
     WHERE (Seg2BResult in(6,7,8)) AND(NOT (P_Key In (Select P_Key From T_Att_TempIOTime)))


     DELETE FROM T_Att_TempIOTime
     INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,SegWork)
     SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key,Round(Convert(Float,(OverCheck.EndTime-OverCheck.BeginTime))*1440,0,1) As SegWork
     FROM T_Att_TempCalc AS TmpCalc INNER JOIN T_Att_OverCheck AS OverCheck ON TmpCalc.Person_Key = OverCheck.Person_Key
     WHERE --(OverCheck.ClassType=@ClassType) AND 
        (OverCheck.OverDate=TmpCalc.PlanDate)           
        AND (TmpCalc.Seg3Enabled=1) and (TmpCalc.Seg3BTime is not NULL)
        AND (Seg3BFactTime BETWEEN OverCheck.BeginTime AND OverCheck.EndTime)
     UPDATE T_Att_TempCalc SET Seg3BResult=NULL
     WHERE (Seg3BResult in(6,7,8)) AND(NOT (P_Key In (Select P_Key From T_Att_TempIOTime)))

 
     DELETE FROM T_Att_TempIOTime
     INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,SegWork)
     SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key,Round(Convert(Float,(OverCheck.EndTime-OverCheck.BeginTime))*1440,0,1) As SegWork
     FROM T_Att_TempCalc AS TmpCalc INNER JOIN T_Att_OverCheck AS OverCheck ON TmpCalc.Person_Key = OverCheck.Person_Key
     WHERE --(OverCheck.ClassType=@ClassType) AND 
        (OverCheck.OverDate=TmpCalc.PlanDate)           
        AND (TmpCalc.Seg1Enabled=1) and (TmpCalc.Seg1ETime is not NULL)
        AND (Seg1EFactTime BETWEEN OverCheck.BeginTime AND OverCheck.EndTime)
     UPDATE T_Att_TempCalc SET Seg1EResult=NULL
     WHERE (Seg1EResult in(6,7,8)) AND(NOT (P_Key In (Select P_Key From T_Att_TempIOTime)))

     DELETE FROM T_Att_TempIOTime
     INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,SegWork)
     SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key,Round(Convert(Float,(OverCheck.EndTime-OverCheck.BeginTime))*1440,0,1) As SegWork
     FROM T_Att_TempCalc AS TmpCalc INNER JOIN T_Att_OverCheck AS OverCheck ON TmpCalc.Person_Key = OverCheck.Person_Key
     WHERE --(OverCheck.ClassType=@ClassType) AND 
        (OverCheck.OverDate=TmpCalc.PlanDate)           
        AND (TmpCalc.Seg2Enabled=1) and (TmpCalc.Seg2ETime is not NULL)
        AND (Seg2EFactTime BETWEEN OverCheck.BeginTime AND OverCheck.EndTime)
     UPDATE T_Att_TempCalc SET Seg2EResult=NULL
     WHERE (Seg2EResult in(6,7,8)) AND(NOT (P_Key In (Select P_Key From T_Att_TempIOTime)))

     DELETE FROM T_Att_TempIOTime
     INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,SegWork)
     SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key,Round(Convert(Float,(OverCheck.EndTime-OverCheck.BeginTime))*1440,0,1) As SegWork
     FROM T_Att_TempCalc AS TmpCalc INNER JOIN T_Att_OverCheck AS OverCheck ON TmpCalc.Person_Key = OverCheck.Person_Key
     WHERE --(OverCheck.ClassType=@ClassType) AND 
        (OverCheck.OverDate=TmpCalc.PlanDate)           
        AND (TmpCalc.Seg3Enabled=1) and (TmpCalc.Seg3ETime is not NULL)
        AND (Seg3EFactTime BETWEEN OverCheck.BeginTime AND OverCheck.EndTime)
     UPDATE T_Att_TempCalc SET Seg3EResult=NULL
     WHERE (Seg3EResult in(6,7,8)) AND(NOT (P_Key In (Select P_Key From T_Att_TempIOTime)))
   




  

     --第一时段
     /*DELETE FROM T_Att_TempIOTime
     INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,SegWork)
     SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key,Round(Convert(Float,(OverCheck.EndTime-OverCheck.BeginTime))*1440,0,1) As SegWork
     FROM T_Att_TempCalc AS TmpCalc INNER JOIN T_Att_OverCheck AS OverCheck ON TmpCalc.Person_Key = OverCheck.Person_Key
     WHERE (OverCheck.ClassType=@ClassType) AND (OverCheck.OverDate=TmpCalc.PlanDate)           
        AND (TmpCalc.Seg1Enabled=1) and (TmpCalc.Seg1BTime is not NULL)
        AND (OverCheck.BeginTime<=TmpCalc.Seg1BTime) and (OverCheck.EndTime<=TmpCalc.Seg1ETime)

     UPDATE T_Att_TempCalc SET Seg1BResult=@OnDuty,Seg1EResult=@OnDuty
     WHERE ((Seg1BResult=@ClassType) AND (Seg1EResult=@ClassType)) AND (NOT (P_Key In (Select P_Key From T_Att_TempIOTime)))


     UPDATE T_Att_TempCalc SET Seg1Work=SegWork
     FROM T_Att_TempCalc TmpCalc,T_Att_TempIOTime TempIOTime  
     WHERE (Seg1BResult=@ClassType) AND (Seg1EResult=@ClassType)
         AND (TmpCalc.P_Key=TempIOTime.P_Key) AND (TmpCalc.Seg1Work>TempIOTime.SegWork)

     --第二时段
     DELETE FROM T_Att_TempIOTime
     INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,SegWork)
     SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key,Round(Convert(Float,(OverCheck.EndTime-OverCheck.BeginTime))*1440,0,1) As SegWork
     FROM T_Att_TempCalc AS TmpCalc INNER JOIN T_Att_OverCheck AS OverCheck ON TmpCalc.Person_Key = OverCheck.Person_Key
     WHERE (OverCheck.OverDate=TmpCalc.PlanDate)AND (OverCheck.ClassType=@ClassType)
        AND (TmpCalc.Seg2Enabled=1) and (TmpCalc.Seg2BTime is not NULL) 
        AND (OverCheck.BeginTime<=TmpCalc.Seg2BTime) and (OverCheck.EndTime<=TmpCalc.Seg2ETime)

     UPDATE T_Att_TempCalc SET Seg2BResult=@OnDuty,Seg2EResult=@OnDuty
     WHERE ((Seg2BResult=@ClassType) AND (Seg2EResult=@ClassType)) AND (NOT (P_Key In (Select P_Key From T_Att_TempIOTime)))

     UPDATE T_Att_TempCalc SET Seg2Work=SegWork
     FROM T_Att_TempCalc TmpCalc,T_Att_TempIOTime TempIOTime  
     WHERE (Seg2BResult=@ClassType) AND (Seg2EResult=@ClassType)
         AND (TmpCalc.P_Key=TempIOTime.P_Key) AND (TmpCalc.Seg2Work>TempIOTime.SegWork)

     --第三时段
     DELETE FROM T_Att_TempIOTime
     INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,SegWork)
     SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key,Round(Convert(Float,(OverCheck.EndTime-OverCheck.BeginTime))*1440,0,1) As SegWork
     FROM T_Att_TempCalc AS TmpCalc INNER JOIN T_Att_OverCheck AS OverCheck ON TmpCalc.Person_Key = OverCheck.Person_Key
     WHERE (OverCheck.ClassType=@ClassType) AND (OverCheck.OverDate=TmpCalc.PlanDate)
        AND (TmpCalc.Seg3Enabled=1) and (TmpCalc.Seg3BTime is not NULL)
        AND (OverCheck.BeginTime<=TmpCalc.Seg3BTime) and (OverCheck.EndTime<=TmpCalc.Seg3ETime)

     UPDATE T_Att_TempCalc SET Seg3BResult=@OnDuty,Seg3EResult=@OnDuty
     WHERE ((Seg3BResult=@ClassType) AND (Seg3EResult=@ClassType)) AND (NOT (P_Key In (Select P_Key From T_Att_TempIOTime)))

     UPDATE T_Att_TempCalc SET Seg3Work=SegWork
     FROM T_Att_TempCalc TmpCalc,T_Att_TempIOTime TempIOTime  
     WHERE (Seg3BResult=@ClassType) AND (Seg3EResult=@ClassType)
         AND (TmpCalc.P_Key=TempIOTime.P_Key) AND (TmpCalc.Seg3Work>TempIOTime.SegWork)*/

     END
     

END
' 
END
GO
/****** 对象:  StoredProcedure [dbo].[P_Att_FactTimeUp]    脚本日期: 09/25/2019 10:09:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_FactTimeUp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--更新三个时段的实到时间(实到时间精度为分)
CREATE PROCEDURE [dbo].[P_Att_FactTimeUp]
AS
BEGIN
  Set NOCOUNT ON   
  DECLARE 	@P_Key	bigint,
		@IOTime	datetime,
                          @TempTime      datetime
  --第一时段上班时间
  DELETE FROM T_Att_TempIOTime
  INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,IOTime)
  SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key, CAST(Left(Convert(varchar(19),IORecord.IOTime,120),16)+N'':00'' As Datetime) AS IOTime
  FROM T_Att_TempCalc AS TmpCalc LEFT OUTER JOIN T_Att_IORecord AS IORecord ON TmpCalc.Person_Key = IORecord.Person_Key
  WHERE(TmpCalc.Seg1Enabled=1) and (TmpCalc.Seg1BTime is not NULL) and (IOTime Between (TmpCalc.Seg1BBTime) and (TmpCalc.Seg1BETime))
    ORDER BY IOTime ASC 
  --Order by TmpCalc.Person_Key,IORecord.IOTime DESC
  
  --UPDATE T_Att_TempCalc SET Seg1BFactTime=T_Att_TempIOTime.IOTime FROM T_Att_TempCalc,T_Att_TempIOTime 
  --WHERE (T_Att_TempCalc.Seg1Enabled=1) and (T_Att_TempCalc.P_Key=T_Att_TempIOTime.P_Key) 
   DECLARE TempIOTime_Cursor CURSOR FOR 
	SELECT P_Key,IOTime		
		FROM   T_Att_TempIOTime
	Order By P_Key,IOTime ASC
   OPEN TempIOTime_Cursor
   FETCH NEXT FROM TempIOTime_Cursor
   INTO @P_Key,@IOTime
      WHILE @@FETCH_STATUS = 0
      BEGIN
         --Update T_Att_TempCalc Set Seg1BFactTime=@IOTime WHERE P_Key=@P_Key
          --2011/11/03取靠近上班时间的时间点
          Update T_Att_TempCalc Set Seg1BFactTime=CASE
                                                     WHEN Seg1BFactTime<= Seg1BTime  THEN Seg1BFactTime
                                                     ELSE  @IOTime                                            
                                                     END
                                                     WHERE P_Key=@P_Key    
        --print @P_key
        --print @IOTime	
        FETCH NEXT FROM TempIOTime_Cursor
        INTO @P_Key,@IOTime
      END
   CLOSE TempIOTime_Cursor
   DEALLOCATE TempIOTime_Cursor 


  --第一时段下班时间
  DELETE FROM T_Att_TempIOTime
  INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,IOTime)
  SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key, CAST(Left(Convert(varchar(19),IORecord.IOTime,120),16)+N'':00'' As Datetime) AS IOTime
  FROM T_Att_TempCalc AS TmpCalc LEFT OUTER JOIN T_Att_IORecord AS IORecord ON TmpCalc.Person_Key = IORecord.Person_Key
  WHERE (TmpCalc.Seg1Enabled=1) and (TmpCalc.Seg1ETime is not NULL) and (IOTime Between (TmpCalc.Seg1EBTime) and (TmpCalc.Seg1EETime))
    ORDER BY IOTime desc  
  --Order by TmpCalc.Person_Key,IORecord.IOTime

  --UPDATE T_Att_TempCalc SET Seg1EFactTime=T_Att_TempIOTime.IOTime FROM T_Att_TempCalc,T_Att_TempIOTime 
  --WHERE  (T_Att_TempCalc.Seg1Enabled=1) and (T_Att_TempCalc.P_Key=T_Att_TempIOTime.P_Key) 
   DECLARE TempIOTime_Cursor CURSOR FOR 
	SELECT	P_Key,IOTime		
		FROM   T_Att_TempIOTime
	Order By P_Key,IOTime DESC
   OPEN TempIOTime_Cursor
   FETCH NEXT FROM TempIOTime_Cursor
   INTO @P_Key,@IOTime
      WHILE @@FETCH_STATUS = 0
      BEGIN
        --Update T_Att_TempCalc Set Seg1EFactTime=@IOTime WHERE P_Key=@P_Key
          --2011/11/03取靠近下班时间的时间点,两次的时间差在5分钟内取一时间点
          Update T_Att_TempCalc Set Seg1EFactTime=CASE
                                                     WHEN  ROUND( CONVERT(FLOAT,(@IOTime -Seg1BFactTime))*1440,0,1)<5 THEN NULL
                                                     WHEN Seg1EFactTime>= Seg1ETime  THEN Seg1EFactTime                                                   
                                                     ELSE  @IOTime                                            
                                                     END
                                                     WHERE P_Key=@P_Key    
        --print @P_key
        --print @IOTime	
        FETCH NEXT FROM TempIOTime_Cursor
        INTO @P_Key,@IOTime
      END
   CLOSE TempIOTime_Cursor
   DEALLOCATE TempIOTime_Cursor 


  --第二时段上班时间
  DELETE FROM T_Att_TempIOTime
  INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,IOTime)
  SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key, CAST(Left(Convert(varchar(19),IORecord.IOTime,120),16)+N'':00'' As Datetime) AS IOTime

  FROM T_Att_TempCalc AS TmpCalc LEFT OUTER JOIN T_Att_IORecord AS IORecord ON TmpCalc.Person_Key = IORecord.Person_Key
  WHERE (TmpCalc.Seg2Enabled=1) and (TmpCalc.Seg2BTime is not NULL) and (IOTime Between (TmpCalc.Seg2BBTime) and (TmpCalc.Seg2BETime))
   ORDER BY IOTime ASC 
  --Order by TmpCalc.Person_Key,IORecord.IOTime DESC

  --UPDATE T_Att_TempCalc SET Seg2BFactTime=T_Att_TempIOTime.IOTime FROM T_Att_TempCalc,T_Att_TempIOTime 
  --WHERE  (T_Att_TempCalc.Seg2Enabled=1) and (T_Att_TempCalc.P_Key=T_Att_TempIOTime.P_Key) 

  
   DECLARE TempIOTime_Cursor CURSOR FOR 
	SELECT P_Key,IOTime		
		FROM   T_Att_TempIOTime
	Order By P_Key,IOTime  ASC
   OPEN TempIOTime_Cursor
   FETCH NEXT FROM TempIOTime_Cursor
   INTO @P_Key,@IOTime
      WHILE @@FETCH_STATUS = 0
      BEGIN
       -- Update T_Att_TempCalc Set Seg2BFactTime=@IOTime WHERE P_Key=@P_Key

       /* Update T_Att_TempCalc    SET Seg2BFactTime=CASE
                                                   WHEN  Seg1EFactTime>@IOTime THEN  Seg1EFactTime
                                                   WHEN  (Seg1EFactTime= @IOTime)THEN NULL
                                                   ELSE  @IOTime
                                                   END,

                                                   Seg1EFactTime=CASE
                                                   WHEN  Seg1EFactTime>@IOTime THEN  @IOTime
                                                   ELSE  Seg1EFactTime
                                                   END 
                                                   WHERE P_Key=@P_Key*/

          --2011/11/03取靠近一段下班时间点
          Update T_Att_TempCalc Set Seg2BFactTime=CASE
                                                     WHEN ROUND( CONVERT(FLOAT,(@IOTime -Seg1EFactTime))*1440,0,1)>5 THEN @IOTime                                                      
                                                     ELSE Seg2BFactTime   
                                                     --WHEN Seg2BFactTime<= Seg2BTime  THEN Seg2BFactTime
                                                     --WHEN  ROUND( CONVERT(FLOAT,(@IOTime -Seg1EFactTime))*1440,0,1)<5 THEN NULL
                                                     --ELSE  @IOTime                                            
                                                     END
                                                     WHERE P_Key=@P_Key    

        --print @P_key
        --print @IOTime	
        FETCH NEXT FROM TempIOTime_Cursor
        INTO @P_Key,@IOTime
      END
   CLOSE TempIOTime_Cursor
   DEALLOCATE TempIOTime_Cursor 


  --第二时段下班时间
  DELETE FROM T_Att_TempIOTime
  INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,IOTime)
  SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key, CAST(Left(Convert(varchar(19),IORecord.IOTime,120),16)+N'':00'' As Datetime) AS IOTime
  FROM T_Att_TempCalc AS TmpCalc LEFT OUTER JOIN T_Att_IORecord AS IORecord ON TmpCalc.Person_Key = IORecord.Person_Key
  WHERE (TmpCalc.Seg2Enabled=1) and (TmpCalc.Seg2ETime is not NULL) and (IOTime Between (TmpCalc.Seg2EBTime) and (TmpCalc.Seg2EETime))
   ORDER BY IOTime DESC
  --Order by TmpCalc.Person_Key,IORecord.IOTime

  --UPDATE T_Att_TempCalc SET Seg2EFactTime=T_Att_TempIOTime.IOTime FROM T_Att_TempCalc,T_Att_TempIOTime
  --WHERE  (T_Att_TempCalc.Seg2Enabled=1) and (T_Att_TempCalc.P_Key=T_Att_TempIOTime.P_Key) 
   DECLARE TempIOTime_Cursor CURSOR FOR 
	SELECT	P_Key,IOTime		
		FROM   T_Att_TempIOTime
	Order By P_Key,IOTime DESC
   OPEN TempIOTime_Cursor
   FETCH NEXT FROM TempIOTime_Cursor
   INTO @P_Key,@IOTime
      WHILE @@FETCH_STATUS = 0
      BEGIN
       --Update T_Att_TempCalc Set Seg2EFactTime=@IOTime WHERE P_Key=@P_Key
          --2011/11/03取靠近下班时间的时间点
          Update T_Att_TempCalc Set Seg2EFactTime=CASE
                                                     WHEN  ROUND( CONVERT(FLOAT,(@IOTime -Seg2BFactTime))*1440,0,1)<5 THEN NULL
                                                     WHEN Seg2EFactTime>= Seg2ETime  THEN Seg2EFactTime
                                                     ELSE  @IOTime                                            
                                                     END
                                                     WHERE P_Key=@P_Key    
        --print @P_key
        --print @IOTime	
        FETCH NEXT FROM TempIOTime_Cursor
        INTO @P_Key,@IOTime
      END
   CLOSE TempIOTime_Cursor
   DEALLOCATE TempIOTime_Cursor 



  --第三时段上班时间
  DELETE FROM T_Att_TempIOTime
  INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,IOTime)
  SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key, CAST(Left(Convert(varchar(19),IORecord.IOTime,120),16)+N'':00'' As Datetime) AS IOTime
  FROM T_Att_TempCalc AS TmpCalc  LEFT OUTER JOIN  T_Att_IORecord AS IORecord ON TmpCalc.Person_Key = IORecord.Person_Key
  WHERE (TmpCalc.Seg3Enabled=1) and (TmpCalc.Seg3BTime is not NULL) and (IOTime Between (TmpCalc.Seg3BBTime) and (TmpCalc.Seg3BETime))
   ORDER BY IOTime ASC  
  --Order by TmpCalc.Person_Key,IORecord.IOTime DESC

  --UPDATE T_Att_TempCalc SET Seg3BFactTime=T_Att_TempIOTime.IOTime FROM T_Att_TempCalc,T_Att_TempIOTime 
  --WHERE  (T_Att_TempCalc.Seg3Enabled=1) and (T_Att_TempCalc.P_Key=T_Att_TempIOTime.P_Key)
   DECLARE TempIOTime_Cursor CURSOR FOR 
	SELECT P_Key,IOTime		
		FROM   T_Att_TempIOTime
	Order By P_Key,IOTime ASC
   OPEN TempIOTime_Cursor
   FETCH NEXT FROM TempIOTime_Cursor
   INTO @P_Key,@IOTime
      WHILE @@FETCH_STATUS = 0
      BEGIN
       -- Update T_Att_TempCalc Set Seg3BFactTime=@IOTime WHERE P_Key=@P_Key

      /* Update T_Att_TempCalc    SET Seg3BFactTime=CASE
                                                   WHEN  Seg2EFactTime> @IOTime THEN  Seg2EFactTime
                                                   WHEN  Seg2EFactTime= @IOTime THEN NULL
                                                   ELSE  @IOTime
                                                   END,

                                                   Seg2EFactTime=CASE
                                                   WHEN  Seg2EFactTime> @IOTime THEN  @IOTime
                                                   ELSE  Seg2EFactTime
                                                   END          
                                                   WHERE P_Key=@P_Key     --2011-12-02*/

          --2011/11/03取靠近上班班时间的时间点
          Update T_Att_TempCalc Set Seg3BFactTime=CASE 
                                                     WHEN ROUND( CONVERT(FLOAT,(@IOTime -Seg2EFactTime))*1440,0,1)>5 THEN @IOTime                                                      
                                                     ELSE Seg3BFactTime                                            
                                                     END
                                                     WHERE P_Key=@P_Key    

        --print @P_key
        --print @IOTime	
        FETCH NEXT FROM TempIOTime_Cursor
        INTO @P_Key,@IOTime
      END
   CLOSE TempIOTime_Cursor
   DEALLOCATE TempIOTime_Cursor 

  --第三时段下班时间
  DELETE FROM T_Att_TempIOTime
  INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,IOTime)
  SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key, CAST(Left(Convert(varchar(19),IORecord.IOTime,120),16)+N'':00'' As Datetime) AS IOTime
  FROM T_Att_TempCalc AS TmpCalc   LEFT OUTER JOIN T_Att_IORecord AS IORecord ON TmpCalc.Person_Key = IORecord.Person_Key
  WHERE(TmpCalc.Seg3Enabled=1) and  (TmpCalc.Seg3ETime is not NULL) and (IOTime Between (TmpCalc.Seg3EBTime) and (TmpCalc.Seg3EETime))
   ORDER BY IOTime DESC 
  --Order by TmpCalc.Person_Key,IORecord.IOTime

  --UPDATE T_Att_TempCalc SET Seg3EFactTime=T_Att_TempIOTime.IOTime FROM T_Att_TempCalc,T_Att_TempIOTime 
  --WHERE  (T_Att_TempCalc.Seg3Enabled=1) and (T_Att_TempCalc.P_Key=T_Att_TempIOTime.P_Key)
   DECLARE TempIOTime_Cursor CURSOR FOR 
	SELECT	P_Key,IOTime		
		FROM   T_Att_TempIOTime
	Order By P_Key,IOTime DESC
   OPEN TempIOTime_Cursor
   FETCH NEXT FROM TempIOTime_Cursor
   INTO @P_Key,@IOTime
      WHILE @@FETCH_STATUS = 0
      BEGIN
        Update T_Att_TempCalc Set Seg3EFactTime=@IOTime WHERE P_Key=@P_Key
        --print @P_key
        --print @IOTime	
        FETCH NEXT FROM TempIOTime_Cursor
        INTO @P_Key,@IOTime
      END
   CLOSE TempIOTime_Cursor
   DEALLOCATE TempIOTime_Cursor 
  Set NOCOUNT OFF
END
' 
END
GO
/****** 对象:  StoredProcedure [dbo].[P_Att_BETimeUp]    脚本日期: 09/25/2019 10:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_BETimeUp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--更新三个时段的上下班开始、结束、应到时间
CREATE PROCEDURE [dbo].[P_Att_BETimeUp]
	@Cond	Varchar(255)  --附加条件
AS
BEGIN
  Set NOCOUNT ON   
  DECLARE	@Att_MaxLate	Float,
		@Att_MaxEarly	Float,
  		@SQLString nvarchar(3000)

  --最大迟到时间
  SELECT @Att_MaxLate=Value1 FROM T_Com_SysPara WHERE sName=''Att_MaxLate''
  IF (@Att_MaxLate IS NULL) 
    SET @Att_MaxLate = 30/1440
  ELSE
    SET @Att_MaxLate = @Att_MaxLate/1440
  --最大早退时间
  SELECT @Att_MaxEarly=Value1 FROM T_Com_SysPara WHERE sName=''Att_MaxEarly''
  IF (@Att_MaxEarly IS NULL) 
    SET @Att_MaxEarly = 30/1440
  ELSE
    SET @Att_MaxEarly = @Att_MaxEarly/1440

  --print(@Att_MaxEarly)

  Select @SQLString = N''UPDATE T_Att_TempCalc
    SET 
    --第一段上班
    Seg1BBTime=PlanDate+CONVERT(Datetime, Seg1BeginTime), 
    Seg1BTime=PlanDate+CONVERT(Datetime, Seg1OnTime), 
    Seg1BETime=PlanDate+CONVERT(Datetime, Seg1OnTime)+''+CAST(@Att_MaxLate AS Varchar(20))+N'', 
    --第一段下班
    Seg1EBTime=CASE 
        WHEN (Seg1OnTime<Seg1OffTime) THEN PlanDate+CONVERT(Datetime, Seg1OffTime)-''+CAST(@Att_MaxEarly AS Varchar(20))+N''
        ELSE                               PlanDate+1+CONVERT(Datetime, Seg1OffTime)-''+CAST(@Att_MaxEarly AS Varchar(20))+N''
    END,
    Seg1ETime=CASE 
        WHEN (Seg1OnTime<Seg1OffTime) THEN PlanDate+CONVERT(Datetime, Seg1OffTime)
        ELSE                               PlanDate+1+CONVERT(Datetime, Seg1OffTime)
    END,
    Seg1EETime=CASE 
        WHEN (Seg1BeginTime<Seg1EndTime) THEN PlanDate+CONVERT(Datetime, Seg1EndTime)
        ELSE                               PlanDate+1+CONVERT(Datetime, Seg1EndTime)
    END
  WHERE  ''+@Cond+N'' And (Seg1Enabled=1)''

  --Print  @SQLString

  EXECUTE sp_executesql @SQLString,N''@Att_MaxLate Float,@Att_MaxEarly Float,@Cond varchar(255)'',
     @Att_MaxLate,@Att_MaxEarly,@Cond

  Select @SQLString = N''UPDATE T_Att_TempCalc
    SET
     --第二段上班
    Seg2BBTime=PlanDate+CONVERT(Datetime, Seg2BeginTime), 
    Seg2BTime=PlanDate+CONVERT(Datetime, Seg2OnTime), 
    Seg2BETime=PlanDate+CONVERT(Datetime, Seg2OnTime)+''+CAST(@Att_MaxLate AS Varchar(20))+N'', 
    --第二段下班
    Seg2EBTime=CASE 
        WHEN (Seg2OnTime<Seg2OffTime) THEN PlanDate+CONVERT(Datetime, Seg2OffTime)-''+CAST(@Att_MaxEarly AS Varchar(20))+N''
        ELSE                               PlanDate+1+CONVERT(Datetime, Seg2OffTime)-''+CAST(@Att_MaxEarly AS Varchar(20))+N''
    END,
    Seg2ETime=CASE 
        WHEN (Seg2OnTime<Seg2OffTime) THEN PlanDate+CONVERT(Datetime, Seg2OffTime)
        ELSE                               PlanDate+1+CONVERT(Datetime, Seg2OffTime)
    END,
    Seg2EETime=CASE 
        WHEN (Seg2BeginTime<Seg2EndTime) THEN PlanDate+CONVERT(Datetime, Seg2EndTime)
        ELSE                               PlanDate+1+CONVERT(Datetime, Seg2EndTime)
    END
  WHERE  ''+@Cond+N'' And (Seg2Enabled=1)''


  EXECUTE sp_executesql @SQLString,N''@Att_MaxLate Float,@Att_MaxEarly Float,@Cond varchar(255)'',
     @Att_MaxLate,@Att_MaxEarly,@Cond


  Select @SQLString = N''UPDATE T_Att_TempCalc
    SET 
    --第三段上班
    Seg3BBTime=PlanDate+CONVERT(Datetime, Seg3BeginTime), 
    Seg3BTime=PlanDate+CONVERT(Datetime, Seg3OnTime), 
    Seg3BETime=CASE 
        WHEN (Seg3OnTime<Seg3OffTime) THEN PlanDate+CONVERT(Datetime, Seg3OffTime)
        ELSE                               PlanDate+1+CONVERT(Datetime, Seg3OffTime)
    END,
    --Seg3BETime=PlanDate+CONVERT(Datetime, Seg3OnTime)+''+CAST(@Att_MaxLate AS Varchar(20))+N'', 
    --第三段下班
    Seg3EBTime=PlanDate+CONVERT(Datetime, Seg3OnTime), 
    --Seg3EBTime=CASE 
    --    WHEN (Seg3OnTime<Seg3OffTime) THEN PlanDate+CONVERT(Datetime, Seg3OffTime)-''+CAST(@Att_MaxEarly AS Varchar(20))+N''
    --    ELSE                               PlanDate+1+CONVERT(Datetime, Seg3OffTime)-''+CAST(@Att_MaxEarly AS Varchar(20))+N''
    --END,
    --Seg3EBTime=PlanDate+CONVERT(Datetime, Seg3OffTime)-''+CAST(@Att_MaxEarly AS Varchar(20))+N'',

    Seg3ETime=CASE 
        WHEN (Seg3OnTime<Seg3OffTime) THEN PlanDate+CONVERT(Datetime, Seg3OffTime)
        ELSE                               PlanDate+1+CONVERT(Datetime, Seg3OffTime)
    END,
    Seg3EETime=CASE 
        WHEN (Seg3BeginTime<Seg3EndTime) THEN PlanDate+CONVERT(Datetime, Seg3EndTime)
        ELSE                               PlanDate+1+CONVERT(Datetime, Seg3EndTime)
    END
  WHERE  ''+@Cond+N'' And (Seg3Enabled=1)''

  EXECUTE sp_executesql @SQLString,N''@Att_MaxLate Float,@Att_MaxEarly Float,@Cond varchar(255)'',
     @Att_MaxLate,@Att_MaxEarly,@Cond
  Set NOCOUNT OFF  

END
' 
END
GO
/****** 对象:  StoredProcedure [dbo].[P_Att_SumListAdd]    脚本日期: 09/25/2019 10:09:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_SumListAdd]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--考勤系统添加临时记录到汇总明细表
CREATE PROCEDURE [dbo].[P_Att_SumListAdd]
AS
BEGIN
  INSERT INTO T_Att_SumList
	(Person_Key, 
	DepName, 
	SName, 
	PersonIDCard, 
	PlanDate, 
	WeekOfDay, 
	IsHoliday,
	ClassName, 

	Seg1Enabled,
	Seg1Type,
	Seg1BTime, 
	Seg1BFactTime, 
	Seg1BResult, 
	Seg1BValue, 
	Seg1ETime, 
	Seg1EFactTime, 
	Seg1EResult, 
	Seg1EValue, 
	Seg1Work, 
	Seg1Over, 

	Seg2Enabled,
	Seg2Type,
	Seg2BTime, 
	Seg2BFactTime, 
	Seg2BResult, 
	Seg2BValue, 
	Seg2ETime, 
	Seg2EFactTime, 
	Seg2EResult, 
	Seg2EValue, 
	Seg2Work, 
	Seg2Over, 

	Seg3Enabled,
	Seg3Type,
	Seg3BTime, 
	Seg3BFactTime, 
	Seg3BResult, 
	Seg3BValue, 
	Seg3ETime, 
	Seg3EFactTime, 
	Seg3EResult, 
	Seg3EValue, 
	Seg3Work, 
	Seg3Over, 

	AllTimeLen, 
	OnDutyM, 
	ShallDay,
	FactDay,
	AbsentDay,
	LaterM, 
	LaterT, 
	EarlyM, 
	EarlyT, 
	AbsentM, 
	AbsentT, 
	illM, 
 	AffairM, 
	PubRestM,
	MarrigeM, 
	MournM, 
	MaternityM, 
	EvectionM, 
	EgressM, 
	EgressT,
	Over1M, 
	Over2M, 
	Over3M)
  SELECT
	T_Att_TempCalc.Person_Key AS Person_Key, 
	T_Att_TempCalc.DepName AS DepName, 
	T_Att_TempCalc.SName AS SName, 
	T_Att_TempCalc.PersonIDCard AS PersonIDCard, 
	T_Att_TempCalc.PlanDate AS PlanDate, 
	T_Att_TempCalc.WeekOfDay AS WeekOfDay, 
	T_Att_TempCalc.IsHoliday AS IsHoliday, 
	T_Att_TempCalc.ClassName AS ClassName, 

	T_Att_TempCalc.Seg1Enabled AS Seg1Enabled,
	T_Att_TempCalc.Seg1Type AS Seg1Type,
	T_Att_TempCalc.Seg1BTime AS Seg1BTime, 
	T_Att_TempCalc.Seg1BFactTime AS Seg1BFactTime, 
	T_Att_TempCalc.Seg1BResult AS Seg1BResult, 
	T_Att_TempCalc.Seg1BValue AS Seg1BValue, 
	T_Att_TempCalc.Seg1ETime AS Seg1ETime, 
	T_Att_TempCalc.Seg1EFactTime AS Seg1EFactTime, 
	T_Att_TempCalc.Seg1EResult AS Seg1EResult, 
	T_Att_TempCalc.Seg1EValue AS Seg1EValue, 
	T_Att_TempCalc.Seg1Work AS Seg1Work, 
	T_Att_TempCalc.Seg1Over AS Seg1Over, 

	T_Att_TempCalc.Seg2Enabled AS Seg2Enabled,
	T_Att_TempCalc.Seg2Type AS Seg2Type,
	T_Att_TempCalc.Seg2BTime AS Seg2BTime, 
	T_Att_TempCalc.Seg2BFactTime AS Seg2BFactTime, 
	T_Att_TempCalc.Seg2BResult AS Seg2BResult, 
	T_Att_TempCalc.Seg2BValue AS Seg2BValue, 
	T_Att_TempCalc.Seg2ETime AS Seg2ETime, 
	T_Att_TempCalc.Seg2EFactTime AS Seg2EFactTime, 
	T_Att_TempCalc.Seg2EResult AS Seg2EResult, 
	T_Att_TempCalc.Seg2EValue AS Seg2EValue, 
	T_Att_TempCalc.Seg2Work AS Seg2Work, 
	T_Att_TempCalc.Seg2Over AS Seg2Over, 

	T_Att_TempCalc.Seg3Enabled AS Seg3Enabled,
	T_Att_TempCalc.Seg3Type AS Seg3Type,
	T_Att_TempCalc.Seg3BTime AS Seg3BTime, 
	T_Att_TempCalc.Seg3BFactTime AS Seg3BFactTime, 
	T_Att_TempCalc.Seg3BResult AS Seg3BResult, 
	T_Att_TempCalc.Seg3BValue AS Seg3BValue, 
	T_Att_TempCalc.Seg3ETime AS Seg3ETime, 
	T_Att_TempCalc.Seg3EFactTime AS Seg3EFactTime, 
	T_Att_TempCalc.Seg3EResult AS Seg3EResult, 
	T_Att_TempCalc.Seg3EValue AS Seg3EValue, 
	T_Att_TempCalc.Seg3Work AS Seg3Work, 
	T_Att_TempCalc.Seg3Over AS Seg3Over, 

	T_Att_TempCalc.AllTimeLen AS AllTimeLen, 
	T_Att_TempCalc.OnDutyM AS OnDutyM, 
	T_Att_TempCalc.ShallDay AS ShallDay, 
	T_Att_TempCalc.FactDay AS FactDay, 
	T_Att_TempCalc.AbsentDay AS AbsentDay, 
	T_Att_TempCalc.LaterM AS LaterM, 
	T_Att_TempCalc.LaterT AS LaterT, 
	T_Att_TempCalc.EarlyM AS EarlyM, 
	T_Att_TempCalc.EarlyT AS EarlyT, 
	T_Att_TempCalc.AbsentM AS AbsentM, 
	T_Att_TempCalc.AbsentT AS AbsentT, 
	T_Att_TempCalc.illM AS illM, 
 	T_Att_TempCalc.AffairM AS AffairM, 
	T_Att_TempCalc.PubRestM AS PubRestM,
	T_Att_TempCalc.MarrigeM AS MarrigeM, 
	T_Att_TempCalc.MournM AS MournM, 
	T_Att_TempCalc.MaternityM AS MaternityM, 
	T_Att_TempCalc.EvectionM AS EvectionM, 
	T_Att_TempCalc.EgressM AS EgressM, 
	T_Att_TempCalc.EgressT AS EgressT, 
	T_Att_TempCalc.Over1M AS Over1M, 
	T_Att_TempCalc.Over2M AS Over2M, 
	T_Att_TempCalc.Over3M AS Over3M 
  FROM T_Att_TempCalc

  UPDATE T_Att_SumList SET OverSum=ISNULL(Over1M,0)+ISNULL(Over2M,0)+ISNULL(Over3M,0)
END
' 
END
GO
/****** 对象:  StoredProcedure [dbo].[P_Att_IsHolidayFieldUp]    脚本日期: 09/25/2019 10:09:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_IsHolidayFieldUp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
  --更新表内IsHoliday字段
CREATE PROCEDURE [dbo].[P_Att_IsHolidayFieldUp]
	@TableName	int  --表名 1-T_Att_Plan  2-T_Att_TempCalc  3-T_Att_SumList
AS
BEGIN
  DECLARE 	@StartDate datetime,
		@EndDate datetime

  DECLARE Holiday_Cursor CURSOR FOR 
	SELECT	StartDate,EndDate		
	FROM   T_Com_Holiday
  OPEN Holiday_Cursor
  FETCH NEXT FROM Holiday_Cursor
  INTO @StartDate,@EndDate
  WHILE @@FETCH_STATUS = 0
  BEGIN
    IF (@TableName=1) 
    BEGIN
	Update T_Att_Plan Set IsHoliday=1 WHERE (PlanDate Between @StartDate and @EndDate)
	Update T_Att_Plan Set IsHoliday=0 WHERE Not (PlanDate Between @StartDate and @EndDate)
    END
    ELSE IF (@TableName=2) 
    BEGIN
	Update T_Att_TempCalc Set IsHoliday=1 WHERE (PlanDate Between @StartDate and @EndDate)
	Update T_Att_TempCalc Set IsHoliday=0 WHERE Not (PlanDate Between @StartDate and @EndDate)
    END

    ELSE IF (@TableName=3) 
    BEGIN
	Update T_Att_SumList Set IsHoliday=1 WHERE (PlanDate Between @StartDate and @EndDate)
	Update T_Att_SumList Set IsHoliday=0 WHERE Not (PlanDate Between @StartDate and @EndDate)
    END

    FETCH NEXT FROM Holiday_Cursor
    INTO @StartDate,@EndDate
  END
  CLOSE Holiday_Cursor
  DEALLOCATE Holiday_Cursor
END 

' 
END
GO
/****** 对象:  StoredProcedure [dbo].[P_Att_HolidayStartEndUp]    脚本日期: 09/25/2019 10:09:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_HolidayStartEndUp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--更新排假日表日期
CREATE PROCEDURE [dbo].[P_Att_HolidayStartEndUp]
AS
BEGIN
  Set NOCOUNT ON   
  --更新假日表日期
  Update T_Com_Holiday Set StartDate=Convert(datetime,Convert(Varchar(4),Year(Getdate()))+''-''+Convert(Varchar(2),Month(StartDate))+''-''+Convert(Varchar(2),Day(StartDate))),
			EndDate=Convert(datetime,Convert(Varchar(4),Year(Getdate()))+''-''+Convert(Varchar(2),Month(EndDate))+''-''+Convert(Varchar(2),Day(EndDate)))
  Set NOCOUNT OFF
END
' 
END
GO
/****** 对象:  StoredProcedure [dbo].[P_Att_BEResultUp]    脚本日期: 09/25/2019 10:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_BEResultUp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

--考勤系统计算各段考勤结果
CREATE PROCEDURE [dbo].[P_Att_BEResultUp]
AS
BEGIN
  Set NOCOUNT ON   
  DECLARE	@Att_MinLate	Float,
		@Att_MaxLate	Float,
		@Att_MinEarly	Float,
		@Att_MaxEarly	Float,

		@ClassTypeLate	int,
		@ClassTypeEarly	int,
		@ClassTypeAbsent	int


  --最小迟到时间
  SELECT @Att_MinLate=Value1 FROM T_Com_SysPara WHERE sName=''Att_MinLate''
  IF (@Att_MinLate IS NULL) 
    SET @Att_MinLate = 5
  --最大迟到时间
  SELECT @Att_MaxLate=Value1 FROM T_Com_SysPara WHERE sName=''Att_MaxLate''
  IF (@Att_MaxLate IS NULL) 
    SET @Att_MaxLate = 30
  --最小早退时间
  SELECT @Att_MinEarly=Value1 FROM T_Com_SysPara WHERE sName=''Att_MinEarly''
  IF (@Att_MinEarly IS NULL) 
    SET @Att_MinEarly = 5
  --最大早退时间
  SELECT @Att_MaxEarly=Value1 FROM T_Com_SysPara WHERE sName=''Att_MaxEarly''
  IF (@Att_MaxEarly IS NULL) 
    SET @Att_MaxEarly = 30
  --迟到
  SELECT @ClassTypeLate=P_Key FROM T_Att_ClassType WHERE TypeName=''迟到''
  IF (@ClassTypeLate IS NULL) 
    SET @ClassTypeLate = 17
  --早退
  SELECT @ClassTypeEarly=P_Key FROM T_Att_ClassType WHERE TypeName=''早退''
  IF (@ClassTypeEarly IS NULL) 
    SET @ClassTypeEarly = 19
  --缺勤
  SELECT @ClassTypeAbsent=P_Key FROM T_Att_ClassType WHERE TypeName=''缺勤''
  IF (@ClassTypeAbsent IS NULL) 
    SET @ClassTypeAbsent = 21

  UPDATE T_Att_TempCalc 
  SET Seg1BResult = CASE 
	WHEN (Seg1CalcAbsent=0) And (Seg1CalcLate=0) And (Seg1BValue<Seg2TimeLen) THEN Seg1Type						--不计缺勤且，不计迟到且已打卡，则为设定班次类型
	WHEN (Seg1CalcAbsent=0) And (Seg1CalcLate=1) And (Seg1BValue<=@Att_MinLate) THEN Seg1Type						--不计缺勤且打卡时间小于最小迟到时间，则为设定班次类型
	WHEN (Seg1CalcAbsent=0) And (Seg1CalcLate=1) And  (Seg1BValue>@Att_MinLate) And (Seg1BValue<=@Att_MaxLate) THEN @ClassTypeLate 		--不计缺勤、计迟到且打卡时间大于最小迟到时间，小于最大迟到，则为设定为迟到
	WHEN (Seg1CalcAbsent=0) And (Seg1BValue>=Seg1TimeLen) THEN NULL									--不计缺勤且未打卡，则为空

	WHEN (Seg1CalcLate=0) And (Seg1BValue<Seg1TimeLen) THEN Seg1Type					--计缺勤、不计迟到且已打卡，则为设定班次类型
	WHEN (Seg1CalcLate=0) And (Seg1BValue>=Seg1TimeLen) THEN @ClassTypeAbsent				--计缺勤、不计迟到且已超时打卡，则为缺勤
	WHEN (Seg1CalcLate=1) And (Seg1BValue <= @Att_MinLate) THEN Seg1Type					--计缺勤、计迟到且打卡时间小于最小迟到时间，则为设定班次类型
	WHEN (Seg1CalcLate=1) And (Seg1BValue>@Att_MinLate) And (Seg1BValue<=@Att_MaxLate) THEN @ClassTypeLate	--计缺勤、计迟到且打卡时间小于最大迟到时间，则为迟到
	WHEN (Seg1CalcLate=1) And (Seg1BValue > @Att_MaxLate) THEN @ClassTypeAbsent				--计缺勤、计迟到且打卡时间大于最大迟到时间，则为缺勤
	ELSE @ClassTypeAbsent  --缺勤
      END,

      Seg1EResult = CASE 
	WHEN (Seg1CalcAbsent=0) And (Seg1CalcEarly=0) And (Seg1EValue<Seg1TimeLen) THEN Seg1Type						--不计缺勤且，不计迟到且已打卡，则为设定班次类型
	WHEN (Seg1CalcAbsent=0) And (Seg1CalcEarly=1) And (Seg1EValue<=@Att_MinEarly) THEN Seg1Type						--不计缺勤且打卡时间小于最小早退时间，则为设定班次类型
	WHEN (Seg1CalcAbsent=0) And (Seg1CalcEarly=1) And  (Seg1EValue>@Att_MinEarly) And (Seg1EValue<=@Att_MaxEarly) THEN @ClassTypeEarly 		--不计缺勤、计早退且打卡时间大于最小早退时间，小于最大早退时间，则为设定为早退
	WHEN (Seg1CalcAbsent=0) And (Seg1EValue>=Seg1TimeLen) THEN NULL									--不计缺勤且未打卡，则为空

	WHEN (Seg1CalcEarly=0) And (Seg1EValue<Seg1TimeLen) THEN Seg1Type					--计缺勤、不计早退且已打卡，则为设定班次类型
	WHEN (Seg1CalcEarly=0) And (Seg1EValue>=Seg1TimeLen) THEN @ClassTypeAbsent				--计缺勤、不计早退且已超时打卡，则为缺勤
	WHEN (Seg1CalcEarly=1) And (Seg1EValue <= @Att_MinEarly) THEN Seg1Type					--计缺勤、计早退且打卡时间小于最小早退时间，则为设定班次类型
	WHEN (Seg1CalcEarly=1) And (Seg1EValue>@Att_MinEarly) And (Seg1EValue<=@Att_MaxEarly) THEN @ClassTypeEarly	--计缺勤、计早退且打卡时间小于最大早退时间，则为早退
	WHEN (Seg1CalcEarly=1) And (Seg1EValue > @Att_MaxEarly) THEN @ClassTypeAbsent				--计缺勤、计迟到且打卡时间大于最大早退时间，则为缺勤
	ELSE @ClassTypeAbsent  --缺勤
      END
  WHERE (Seg1Enabled=1)  
 
  UPDATE T_Att_TempCalc 
  SET Seg2BResult = CASE 
	WHEN (Seg2CalcAbsent=0) And (Seg2CalcLate=0) And (Seg2BValue<Seg2TimeLen) THEN Seg2Type						--不计缺勤且，不计迟到且已打卡，则为设定班次类型
	WHEN (Seg2CalcAbsent=0) And (Seg2CalcLate=1) And (Seg2BValue<=@Att_MinLate) THEN Seg2Type						--不计缺勤且打卡时间小于最小迟到时间，则为设定班次类型
	WHEN (Seg2CalcAbsent=0) And (Seg2CalcLate=1) And  (Seg2BValue>@Att_MinLate) And (Seg2BValue<=@Att_MaxLate) THEN @ClassTypeLate 		--不计缺勤、计迟到且打卡时间大于最小迟到时间，小于最大迟到，则为设定为迟到
	WHEN (Seg2CalcAbsent=0) And (Seg2BValue>=Seg2TimeLen) THEN NULL									--不计缺勤且未打卡，则为空

	WHEN (Seg2CalcLate=0) And (Seg2BValue<Seg2TimeLen) THEN Seg2Type					--计缺勤、不计迟到且已打卡，则为设定班次类型
	WHEN (Seg2CalcLate=0) And (Seg2BValue>=Seg2TimeLen) THEN @ClassTypeAbsent				--计缺勤、不计迟到且已超时打卡，则为缺勤
	WHEN (Seg2CalcLate=1) And (Seg2BValue <= @Att_MinLate) THEN Seg2Type					--计缺勤、计迟到且打卡时间小于最小迟到时间，则为设定班次类型
	WHEN (Seg2CalcLate=1) And (Seg2BValue>@Att_MinLate) And (Seg2BValue<=@Att_MaxLate) THEN @ClassTypeLate	--计缺勤、计迟到且打卡时间小于最大迟到时间，则为迟到
	WHEN (Seg2CalcLate=1) And (Seg2BValue > @Att_MaxLate) THEN @ClassTypeAbsent				--计缺勤、计迟到且打卡时间大于最大迟到时间，则为缺勤
	ELSE @ClassTypeAbsent  --缺勤
      END,

      Seg2EResult = CASE 
	WHEN (Seg2CalcAbsent=0) And (Seg2CalcEarly=0) And (Seg2EValue<Seg2TimeLen) THEN Seg2Type						--不计缺勤且，不计迟到且已打卡，则为设定班次类型
	WHEN (Seg2CalcAbsent=0) And (Seg2CalcEarly=1) And (Seg2EValue<=@Att_MinEarly) THEN Seg2Type						--不计缺勤且打卡时间小于最小早退时间，则为设定班次类型
	WHEN (Seg2CalcAbsent=0) And (Seg2CalcEarly=1) And  (Seg2EValue>@Att_MinEarly) And (Seg2EValue<=@Att_MaxEarly) THEN @ClassTypeEarly 		--不计缺勤、计早退且打卡时间大于最小早退时间，小于最大早退时间，则为设定为早退
	WHEN (Seg2CalcAbsent=0) And (Seg2EValue>=Seg2TimeLen) THEN NULL									--不计缺勤且未打卡，则为空

	WHEN (Seg2CalcEarly=0) And (Seg2EValue<Seg2TimeLen) THEN Seg2Type					--计缺勤、不计早退且已打卡，则为设定班次类型
	WHEN (Seg2CalcEarly=0) And (Seg2EValue>=Seg2TimeLen) THEN @ClassTypeAbsent				--计缺勤、不计早退且已超时打卡，则为缺勤
	WHEN (Seg2CalcEarly=1) And (Seg2EValue <= @Att_MinEarly) THEN Seg2Type					--计缺勤、计早退且打卡时间小于最小早退时间，则为设定班次类型
	WHEN (Seg2CalcEarly=1) And (Seg2EValue>@Att_MinEarly) And (Seg2EValue<=@Att_MaxEarly) THEN @ClassTypeEarly	--计缺勤、计早退且打卡时间小于最大早退时间，则为早退
	WHEN (Seg2CalcEarly=1) And (Seg2EValue > @Att_MaxEarly) THEN @ClassTypeAbsent				--计缺勤、计迟到且打卡时间大于最大早退时间，则为缺勤
	ELSE @ClassTypeAbsent  --缺勤
      END
  WHERE (Seg2Enabled=1) 

  UPDATE T_Att_TempCalc 
  SET Seg3BResult = CASE 
	WHEN (Seg3CalcAbsent=0) And (Seg3CalcLate=0) And (Seg3BValue<Seg3TimeLen) THEN Seg3Type						--不计缺勤且，不计迟到且已打卡，则为设定班次类型
	WHEN (Seg3CalcAbsent=0) And (Seg3CalcLate=1) And (Seg3BValue<=@Att_MinLate) THEN Seg3Type						--不计缺勤且打卡时间小于最小迟到时间，则为设定班次类型
	WHEN (Seg3CalcAbsent=0) And (Seg3CalcLate=1) And  (Seg3BValue>@Att_MinLate) And (Seg3BValue<=@Att_MaxLate) THEN @ClassTypeLate 		--不计缺勤、计迟到且打卡时间大于最小迟到时间，小于最大迟到，则为设定为迟到
	WHEN (Seg3CalcAbsent=0) And (Seg3BValue>=Seg3TimeLen) THEN NULL									--不计缺勤且未打卡，则为空

	WHEN (Seg3CalcLate=0) And (Seg3BValue<Seg3TimeLen) THEN Seg3Type					--计缺勤、不计迟到且已打卡，则为设定班次类型
	WHEN (Seg3CalcLate=0) And (Seg3BValue>=Seg3TimeLen) THEN @ClassTypeAbsent				--计缺勤、不计迟到且已超时打卡，则为缺勤
	WHEN (Seg3CalcLate=1) And (Seg3BValue <= @Att_MinLate) THEN Seg3Type					--计缺勤、计迟到且打卡时间小于最小迟到时间，则为设定班次类型
	WHEN (Seg3CalcLate=1) And (Seg3BValue>@Att_MinLate) And (Seg3BValue<=@Att_MaxLate) THEN @ClassTypeLate	--计缺勤、计迟到且打卡时间小于最大迟到时间，则为迟到
	WHEN (Seg3CalcLate=1) And (Seg3BValue > @Att_MaxLate) THEN @ClassTypeAbsent				--计缺勤、计迟到且打卡时间大于最大迟到时间，则为缺勤
	ELSE @ClassTypeAbsent  --缺勤
      END,

      Seg3EResult = CASE 
	WHEN (Seg3CalcAbsent=0) And (Seg3CalcEarly=0) And (Seg3EValue<Seg3TimeLen) THEN Seg3Type						--不计缺勤且，不计迟到且已打卡，则为设定班次类型
	WHEN (Seg3CalcAbsent=0) And (Seg3CalcEarly=1) And (Seg3EValue<=@Att_MinEarly) THEN Seg3Type						--不计缺勤且打卡时间小于最小早退时间，则为设定班次类型
	WHEN (Seg3CalcAbsent=0) And (Seg3CalcEarly=1) And  (Seg3EValue > @Att_MinEarly) And (Seg3EValue<=@Att_MaxEarly) THEN @ClassTypeEarly 		--不计缺勤、计早退且打卡时间大于最小早退时间，小于最大早退时间，则为设定为早退
	WHEN (Seg3CalcAbsent=0) And (Seg3EValue>=Seg3TimeLen) THEN NULL									--不计缺勤且未打卡，则为空

	WHEN (Seg3CalcEarly=0) And (Seg3EValue<Seg3TimeLen) THEN Seg3Type					--计缺勤、不计早退且已打卡，则为设定班次类型
	WHEN (Seg3CalcEarly=0) And (Seg3EValue>=Seg3TimeLen) THEN @ClassTypeAbsent				--计缺勤、不计早退且已超时打卡，则为缺勤
	WHEN (Seg3CalcEarly=1) And (Seg3EValue <= @Att_MinEarly) THEN Seg3Type					--计缺勤、计早退且打卡时间小于最小早退时间，则为设定班次类型
	WHEN (Seg3CalcEarly=1) And (Seg3EValue>@Att_MinEarly) And (Seg3EValue<=@Att_MaxEarly) THEN @ClassTypeEarly	--计缺勤、计早退且打卡时间小于最大早退时间，则为早退
	WHEN (Seg3CalcEarly=1) And (Seg3EValue > @Att_MaxEarly) THEN @ClassTypeAbsent				--计缺勤、计迟到且打卡时间大于最大早退时间，则为缺勤
	ELSE @ClassTypeAbsent  --缺勤
      END
  WHERE (Seg3Enabled=1)
  Set NOCOUNT OFF   
END
' 
END
GO
/****** 对象:  StoredProcedure [dbo].[P_Att_ClearUnNoteOverUp]    脚本日期: 09/25/2019 10:09:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_ClearUnNoteOverUp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--清除临时表内未登记的加班记录为实出勤记录
CREATE PROCEDURE [dbo].[P_Att_ClearUnNoteOverUp]
AS
BEGIN    
  Set NOCOUNT ON   
  DECLARE	@ClassTypeOvertimeN	int,	--平时加班
		@ClassTypeOvertimeR	int,	--公休加班
		@ClassTypeOvertimeH	int	--节假日加班
		
  --平时加班
  SELECT @ClassTypeOvertimeN=P_Key FROM T_Att_ClassType WHERE TypeName=''平时加班''
  SET @ClassTypeOvertimeN = ISNULL(@ClassTypeOvertimeN,6) 
  EXEC P_Att_OverToOnDutyUp @ClassTypeOvertimeN

  --公休加班
  SELECT @ClassTypeOvertimeR=P_Key FROM T_Att_ClassType WHERE TypeName=''公休加班''
  SET @ClassTypeOvertimeR = ISNULL(@ClassTypeOvertimeR,7) 
  EXEC P_Att_OverToOnDutyUp @ClassTypeOvertimeR

  --节假日加班
  SELECT @ClassTypeOvertimeH=P_Key FROM T_Att_ClassType WHERE TypeName=''节假日加班''
  SET @ClassTypeOvertimeH =ISNULL(@ClassTypeOvertimeH,8) 
  EXEC P_Att_OverToOnDutyUp @ClassTypeOvertimeH
  Set NOCOUNT OFF
END
' 
END
GO
/****** 对象:  StoredProcedure [dbo].[P_Att_BEValueUp3]    脚本日期: 09/25/2019 10:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_BEValueUp3]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--考勤系统考勤结果为旷工时更新迟到/早退时间为时段长度
CREATE PROCEDURE [dbo].[P_Att_BEValueUp3]
AS
BEGIN
  Set NOCOUNT ON   
  DECLARE	@ClassTypeAbsent	int

  --缺勤
  SELECT @ClassTypeAbsent=P_Key FROM T_Att_ClassType WHERE TypeName=''缺勤''
  IF (@ClassTypeAbsent IS NULL) 
    SET @ClassTypeAbsent = 21

  UPDATE T_Att_TempCalc 
  SET Seg1BValue = CASE 
	WHEN (Seg1BResult=@ClassTypeAbsent) THEN Seg1TimeLen	
	ELSE Seg1BValue
      END,

      Seg1EValue = CASE 
	WHEN (Seg1BResult=@ClassTypeAbsent) THEN Seg1TimeLen
	ELSE Seg1EValue
      END
  WHERE (Seg1Enabled=1)  
 
  UPDATE T_Att_TempCalc 
  SET Seg2BValue = CASE 
	WHEN (Seg2BResult=@ClassTypeAbsent) THEN Seg2TimeLen	
	ELSE Seg2BValue
      END,

      Seg2EValue = CASE 
	WHEN (Seg2BResult=@ClassTypeAbsent) THEN Seg2TimeLen
	ELSE Seg2EValue
      END
  WHERE (Seg2Enabled=1)  

  UPDATE T_Att_TempCalc 
  SET Seg3BValue = CASE 
	WHEN (Seg3BResult=@ClassTypeAbsent) THEN Seg3TimeLen	
	ELSE Seg3BValue
      END,

      Seg3EValue = CASE 
	WHEN (Seg3BResult=@ClassTypeAbsent) THEN Seg3TimeLen
	ELSE Seg3EValue
      END
  WHERE (Seg3Enabled=1)  
  Set NOCOUNT OFF
END
' 
END
GO
/****** 对象:  StoredProcedure [dbo].[P_Att_WorkTimeUp2]    脚本日期: 09/25/2019 10:09:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_WorkTimeUp2]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--考勤系统计算各段工时(根据各段迟到早退旷工情况)
CREATE PROCEDURE [dbo].[P_Att_WorkTimeUp2]
AS
BEGIN
  DECLARE	@ClassTypeLate		int,
		@ClassTypeEarly		int,
		@ClassTypeAbsent		int


  --迟到
  SELECT @ClassTypeLate=P_Key FROM T_Att_ClassType WHERE TypeName=''迟到''
  IF (@ClassTypeLate IS NULL) 
    SET @ClassTypeLate = 17
  --早退
  SELECT @ClassTypeEarly=P_Key FROM T_Att_ClassType WHERE TypeName=''早退''
  IF (@ClassTypeEarly IS NULL) 
    SET @ClassTypeEarly = 19
  --缺勤
  SELECT @ClassTypeAbsent=P_Key FROM T_Att_ClassType WHERE TypeName=''缺勤''
  IF (@ClassTypeAbsent IS NULL) 
    SET @ClassTypeAbsent = 21

  UPDATE T_Att_TempCalc 
  SET Seg1Work = CASE 
	WHEN ((Seg1BResult is NULL) or (Seg1BResult=@ClassTypeAbsent) or (Seg1EResult is NULL) or (Seg1EResult=@ClassTypeAbsent)) THEN 0		--缺勤，工时=0
	WHEN ((Seg1BValue>=Seg1TimeLen) or (Seg1EValue>=Seg1TimeLen)) THEN 0								                 --只打一次卡，工时=0
	--WHEN ((Seg1BResult=@ClassTypeLate) AND (Seg1EResult=@ClassTypeEarly)) THEN Seg1TimeLen                                                  --迟到早退，工时=完整工时 
	--WHEN ((Seg1BResult=@ClassTypeLate) AND (Seg1EResult<>@ClassTypeEarly) AND (Seg1EValue>0)) THEN Seg1TimeLen-Seg1EValue			--迟到，工时=完整工时-提前下班时间(考勤直落加班情况-不计缺勤)
	--WHEN ((Seg1BResult=@ClassTypeLate) AND (Seg1EResult<>@ClassTypeEarly) AND (Seg1EValue<=0)) THEN Seg1TimeLen				--迟到，工时=完整工时-提前下班时间(考勤直落加班情况-不计缺勤)
	--WHEN ((Seg1BResult<>@ClassTypeLate) AND (Seg1EResult=@ClassTypeEarly) AND (Seg1BValue>0)) THEN Seg1TimeLen-Seg1BValue			--早退，工时=完整工时-迟到上班时间(考勤直落加班情况-不计缺勤)
	--WHEN ((Seg1BResult<>@ClassTypeLate) AND (Seg1EResult=@ClassTypeEarly) AND (Seg1BValue<=0)) THEN Seg1TimeLen				--早退，工时=完整工时-迟到上班时间(考勤直落加班情况-不计缺勤)
	WHEN ((Seg1BValue>=0) AND (Seg1EValue>=0)) THEN Seg1TimeLen-CEILING(CAST(Seg1BValue AS FLOAT)/30)*30-CEILING(CAST(Seg1EValue AS FLOAT)/30)*30				--不计缺勤，上下班都未按时且超过迟到早退时间（最小时间单位30分钟）
	WHEN ((Seg1BValue>=0) AND (Seg1EValue<=0)) THEN Seg1TimeLen-CEILING(CAST(Seg1BValue AS FLOAT)/30)*30							--不计缺勤，上班未按时,下班按时（最小时间单位30分钟）
	WHEN ((Seg1EValue>=0) AND (Seg1BValue<=0)) THEN Seg1TimeLen-CEILING(CAST(Seg1EValue AS FLOAT)/30)*30							--不计缺勤，下班未按时,上班按时（最小时间单位30分钟）
	ELSE Seg1TimeLen																	--工时=完整工时
      END
  WHERE (Seg1Enabled=1)  
  UPDATE T_Att_TempCalc                             --不计缺勤，上下班都未按时且超过迟到早退时间(Seg1TimeLen-Seg1BValue-Seg1EValue), 可能导致负数，即上班时间不足半小时且加班按30分钟取整计算
  SET Seg1Work =0 
  WHERE  (Seg1Enabled=1)  AND (Seg1Work<0)  
  
 
  UPDATE T_Att_TempCalc 
  SET Seg2Work = CASE 
	WHEN ((Seg2BResult is NULL) or (Seg2BResult=@ClassTypeAbsent) or (Seg2EResult is NULL) or (Seg2EResult=@ClassTypeAbsent)) THEN 0		--缺勤，工时=0
	WHEN ((Seg2BValue>=Seg2TimeLen) or (Seg2EValue>=Seg2TimeLen)) THEN 0												--只打一次卡，工时=0
	--WHEN ((Seg2BResult=@ClassTypeLate) AND (Seg2EResult=@ClassTypeEarly)) THEN Seg2TimeLen							--迟到早退，工时=完整工时
	--WHEN ((Seg2BResult=@ClassTypeLate) AND (Seg2EResult<>@ClassTypeEarly) AND (Seg2EValue>0)) THEN Seg2TimeLen-Seg2EValue			--迟到，工时=完整工时-提前下班时间(考勤直落加班情况-不计缺勤)
	--WHEN ((Seg2BResult=@ClassTypeLate) AND (Seg2EResult<>@ClassTypeEarly) AND (Seg2EValue<=0)) THEN Seg2TimeLen				--迟到，工时=完整工时-提前下班时间(考勤直落加班情况-不计缺勤)
	--WHEN ((Seg2BResult<>@ClassTypeLate) AND (Seg2EResult=@ClassTypeEarly) AND (Seg2BValue>0)) THEN Seg2TimeLen-Seg2BValue			--早退，工时=完整工时-迟到上班时间(考勤直落加班情况-不计缺勤)
	--WHEN ((Seg2BResult<>@ClassTypeLate) AND (Seg2EResult=@ClassTypeEarly) AND (Seg2BValue<=0)) THEN Seg2TimeLen				--早退，工时=完整工时-迟到上班时间(考勤直落加班情况-不计缺勤)
	WHEN ((Seg2BValue>=0) AND (Seg2EValue>=0)) THEN Seg2TimeLen-CEILING(CAST(Seg2BValue AS FLOAT)/30)*30-CEILING(CAST(Seg2EValue AS FLOAT)/30)*30				--不计缺勤，上下班都未按时且超过迟到早退时间（最小时间单位30分钟）
	WHEN ((Seg2BValue>=0) AND (Seg2EValue<=0)) THEN Seg2TimeLen-CEILING(CAST(Seg2BValue AS FLOAT)/30)*30							--不计缺勤，上班未按时,下班按时（最小时间单位30分钟）
	WHEN ((Seg2EValue>=0) AND (Seg2BValue<=0)) THEN Seg2TimeLen-CEILING(CAST(Seg2EValue AS FLOAT)/30)*30							--不计缺勤，下班未按时,上班按时（最小时间单位30分钟）
	ELSE Seg2TimeLen																	--工时=完整工时
      END
  WHERE (Seg2Enabled=1)  
  UPDATE T_Att_TempCalc --不计缺勤，上下班都未按时且超过迟到早退时间(Seg2TimeLen-Seg2BValue-Seg2EValue), 可能导致负数，即上班时间不足半小时且加班按30分钟取整计算
  SET Seg2Work =0
  WHERE  (Seg2Enabled=1)  AND (Seg2Work<0)  

  UPDATE T_Att_TempCalc 
  SET Seg3Work = CASE 
	WHEN ((Seg3BResult is NULL) or (Seg3BResult=@ClassTypeAbsent) or (Seg3EResult is NULL) or (Seg3EResult=@ClassTypeAbsent)) THEN 0		--缺勤，工时=0
	WHEN ((Seg3BValue+Seg3EValue)>=Seg3TimeLen) THEN 0												--只打一次卡，工时=0
	WHEN ((Seg3BResult=@ClassTypeLate) AND (Seg3EResult=@ClassTypeEarly)) THEN Seg3TimeLen							--迟到早退，工时=完整工时
	WHEN ((Seg3BResult=@ClassTypeLate) AND (Seg3EResult<>@ClassTypeEarly) AND (Seg3EValue>0)) THEN Seg3TimeLen-Seg3EValue			--迟到，工时=完整工时-提前下班时间(考勤直落加班情况-不计缺勤)
	WHEN ((Seg3BResult=@ClassTypeLate) AND (Seg3EResult<>@ClassTypeEarly) AND (Seg3EValue<=0)) THEN Seg3TimeLen				--迟到，工时=完整工时-提前下班时间(考勤直落加班情况-不计缺勤)
	WHEN ((Seg3BResult<>@ClassTypeLate) AND (Seg3EResult=@ClassTypeEarly) AND (Seg3BValue>0)) THEN Seg3TimeLen-Seg3BValue			--早退，工时=完整工时-迟到上班时间(考勤直落加班情况-不计缺勤)
	WHEN ((Seg3BResult<>@ClassTypeLate) AND (Seg3EResult=@ClassTypeEarly) AND (Seg3BValue<=0)) THEN Seg3TimeLen				--早退，工时=完整工时-迟到上班时间(考勤直落加班情况-不计缺勤)
	WHEN ((Seg3BValue>=0) AND (Seg3EValue>=0)) THEN Seg3TimeLen-Seg3BValue-Seg3EValue								--不计缺勤，上下班都未按时且超过迟到早退时间
	WHEN ((Seg3BValue>=0) AND (Seg3EValue<=0)) THEN Seg3TimeLen-Seg3BValue									--不计缺勤，上班未按时,下班按时
	WHEN ((Seg3EValue>=0) AND (Seg3BValue<=0)) THEN Seg3TimeLen-Seg3EValue									--不计缺勤，下班未按时,上班按时
	ELSE Seg3TimeLen
      END
  WHERE (Seg3Enabled=1)  

  UPDATE T_Att_TempCalc   --不计缺勤，上下班都未按时且超过迟到早退时间(Seg3TimeLen-Seg3BValue-Seg3EValue), 可能导致负数，即上班时间不足半小时且加班按30分钟取整计算
  SET Seg3Work =0 
  WHERE  (Seg3Enabled=1)  AND (Seg3Work<0)
END
' 
END
GO
/****** 对象:  StoredProcedure [dbo].[P_Att_DisposeLeave]    脚本日期: 09/25/2019 10:09:36 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_DisposeLeave]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--对于小于段时间的请假、外出，需在出勤为白晚、晚班、平时加班、公休加班、节假日加班
CREATE PROCEDURE [dbo].[P_Att_DisposeLeave]
AS
BEGIN
  Set NOCOUNT ON   
  /*
  --事假第一时段
  UPDATE T_Att_SumList SET 
		Remark=''中途请事假'',
		AffairM= CASE
			WHEN SumList.Seg1BResult in (6,7,8) THEN ISNULL(SumList.AffairM,0)+CEILING((CAST(OutT.EndTime As Float)-CAST(OutT.BeginTime AS FLOAT))*1440/30)*30
			ELSE ISNULL(SumList.AffairM,0)+ROUND((CAST(OutT.EndTime AS FLOAT)-CAST(OutT.BeginTime AS FLOAT))*1440,0)
		END,
		Seg1Work= CASE 
			WHEN SumList.Seg1BResult in (6,7,8) THEN CEILING((CAST(OutT.EndTime As Float)-CAST(OutT.BeginTime AS FLOAT))*1440/30)*30
			ELSE ROUND((CAST(OutT.EndTime AS FLOAT)-CAST(OutT.BeginTime AS FLOAT))*1440,0)
		END,
		OnDutyM= CASE
			WHEN SumList.Seg1BResult in (6,7,8) THEN ISNULL(SumList.OnDutyM,0)-CEILING((CAST(OutT.EndTime As Float)-CAST(OutT.BeginTime AS FLOAT))*1440/30)*30
			ELSE ISNULL(SumList.OnDutyM,0)+ROUND((CAST(OutT.EndTime AS FLOAT)-CAST(OutT.BeginTime AS FLOAT))*1440,0)
		END
  FROM T_Att_SumList AS SumList,T_Att_Out AS OutT
  WHERE (SumList.Person_Key = OutT.Person_Key)
        AND (SumList.PlanDate = OutT.OverDate)
        AND (OutT.ClassType=10) AND (OutT.OverDate=SumList.PlanDate)
        AND (SumList.Seg1Enabled=1) AND (SumList.Seg1BResult in (1,2,6,7,8)) 
        AND (SumList.Seg1EResult in (1,2,6,7,8)) 
        AND (OutT.BeginTime>=SumList.Seg1BTime) 
        AND (OutT.EndTime>=SumList.Seg1BTime) AND (OutT.EndTime<=SumList.Seg1ETime)


  --事假第二时段
  UPDATE T_Att_SumList SET 
		Remark=''中途请事假'',
		AffairM= CASE
			WHEN SumList.Seg2BResult in (6,7,8) THEN ISNULL(SumList.AffairM,0)+CEILING((CAST(OutT.EndTime As Float)-CAST(OutT.BeginTime AS FLOAT))*1440/30)*30
			ELSE ISNULL(SumList.AffairM,0)+ROUND((CAST(OutT.EndTime AS FLOAT)-CAST(OutT.BeginTime AS FLOAT))*1440,0)
		END,
		Seg1Work= CASE 
			WHEN SumList.Seg2BResult in (6,7,8) THEN CEILING((CAST(OutT.EndTime As Float)-CAST(OutT.BeginTime AS FLOAT))*1440/30)*30
			ELSE ROUND((CAST(OutT.EndTime AS FLOAT)-CAST(OutT.BeginTime AS FLOAT))*1440,0)
		END,
		OnDutyM= CASE
			WHEN SumList.Seg2BResult in (6,7,8) THEN ISNULL(SumList.OnDutyM,0)-CEILING((CAST(OutT.EndTime As Float)-CAST(OutT.BeginTime AS FLOAT))*1440/30)*30
			ELSE ISNULL(SumList.OnDutyM,0)+ROUND((CAST(OutT.EndTime AS FLOAT)-CAST(OutT.BeginTime AS FLOAT))*1440,0)
		END
  FROM T_Att_SumList AS SumList,T_Att_Out AS OutT
  WHERE (SumList.Person_Key = OutT.Person_Key)
        AND (SumList.PlanDate = OutT.OverDate)
        AND (OutT.ClassType=10) AND (OutT.OverDate=SumList.PlanDate)
        AND (SumList.Seg2Enabled=1) AND (SumList.Seg2BResult in (1,2,6,7,8)) 
        AND (SumList.Seg2EResult in (1,2,6,7,8)) 
        AND (OutT.BeginTime>=SumList.Seg2BTime) 
        AND (OutT.EndTime>=SumList.Seg2BTime) AND (OutT.EndTime<=SumList.Seg2ETime)

  --病假第一时段
  UPDATE T_Att_SumList SET 
		Remark=''中途请病假'',
		illM= CASE
			WHEN SumList.Seg1BResult in (6,7,8) THEN ISNULL(SumList.illM,0)+CEILING((CAST(OutT.EndTime As Float)-CAST(OutT.BeginTime AS FLOAT))*1440/30)*30
			ELSE ISNULL(SumList.illM,0)+ROUND((CAST(OutT.EndTime AS FLOAT)-CAST(OutT.BeginTime AS FLOAT))*1440,0)
		END,
		Seg1Work= CASE 
			WHEN SumList.Seg1BResult in (6,7,8) THEN CEILING((CAST(OutT.EndTime As Float)-CAST(OutT.BeginTime AS FLOAT))*1440/30)*30
			ELSE ROUND((CAST(OutT.EndTime AS FLOAT)-CAST(OutT.BeginTime AS FLOAT))*1440,0)
		END,
		OnDutyM= CASE
			WHEN SumList.Seg1BResult in (6,7,8) THEN ISNULL(SumList.OnDutyM,0)-CEILING((CAST(OutT.EndTime As Float)-CAST(OutT.BeginTime AS FLOAT))*1440/30)*30
			ELSE ISNULL(SumList.OnDutyM,0)+ROUND((CAST(OutT.EndTime AS FLOAT)-CAST(OutT.BeginTime AS FLOAT))*1440,0)
		END
  FROM T_Att_SumList AS SumList,T_Att_Out AS OutT
  WHERE (SumList.Person_Key = OutT.Person_Key)
        AND (SumList.PlanDate = OutT.OverDate)
        AND (OutT.ClassType=11) AND (OutT.OverDate=SumList.PlanDate)
        AND (SumList.Seg1Enabled=1) AND (SumList.Seg1BResult in (1,2,6,7,8)) 
        AND (SumList.Seg1EResult in (1,2,6,7,8)) 
        AND (OutT.BeginTime>=SumList.Seg1BTime) 
        AND (OutT.EndTime>=SumList.Seg1BTime) AND (OutT.EndTime<=SumList.Seg1ETime)


  --病假第二时段
  UPDATE T_Att_SumList SET 
		Remark=''中途请病假'',
		illM= CASE
			WHEN SumList.Seg2BResult in (6,7,8) THEN ISNULL(SumList.illM,0)+CEILING((CAST(OutT.EndTime As Float)-CAST(OutT.BeginTime AS FLOAT))*1440/30)*30
			ELSE ISNULL(SumList.illM,0)+ROUND((CAST(OutT.EndTime AS FLOAT)-CAST(OutT.BeginTime AS FLOAT))*1440,0)
		END,
		Seg1Work= CASE 
			WHEN SumList.Seg2BResult in (6,7,8) THEN CEILING((CAST(OutT.EndTime As Float)-CAST(OutT.BeginTime AS FLOAT))*1440/30)*30
			ELSE ROUND((CAST(OutT.EndTime AS FLOAT)-CAST(OutT.BeginTime AS FLOAT))*1440,0)
		END,
		OnDutyM= CASE
			WHEN SumList.Seg2BResult in (6,7,8) THEN ISNULL(SumList.OnDutyM,0)-CEILING((CAST(OutT.EndTime As Float)-CAST(OutT.BeginTime AS FLOAT))*1440/30)*30
			ELSE ISNULL(SumList.OnDutyM,0)+ROUND((CAST(OutT.EndTime AS FLOAT)-CAST(OutT.BeginTime AS FLOAT))*1440,0)
		END
  FROM T_Att_SumList AS SumList,T_Att_Out AS OutT
  WHERE (SumList.Person_Key = OutT.Person_Key)
        AND (SumList.PlanDate = OutT.OverDate)
        AND (OutT.ClassType=11) AND (OutT.OverDate=SumList.PlanDate)
        AND (SumList.Seg2Enabled=1) AND (SumList.Seg2BResult in (1,2,6,7,8)) 
        AND (SumList.Seg2EResult in (1,2,6,7,8)) 
        AND (OutT.BeginTime>=SumList.Seg2BTime) 
        AND (OutT.EndTime>=SumList.Seg2BTime) AND (OutT.EndTime<=SumList.Seg2ETime)

  --外出第一时段
  UPDATE T_Att_SumList SET 
		Remark=''中途外出'',
		EgressM= CASE
			WHEN SumList.Seg1BResult in (6,7,8) THEN ISNULL(SumList.EgressM,0)+CEILING((CAST(OutT.EndTime As Float)-CAST(OutT.BeginTime AS FLOAT))*1440/30)*30
			ELSE ISNULL(SumList.EgressM,0)+ROUND((CAST(OutT.EndTime AS FLOAT)-CAST(OutT.BeginTime AS FLOAT))*1440,0)
		END,
		Seg1Work= CASE 
			WHEN SumList.Seg1BResult in (6,7,8) THEN CEILING((CAST(OutT.EndTime As Float)-CAST(OutT.BeginTime AS FLOAT))*1440/30)*30
			ELSE ROUND((CAST(OutT.EndTime AS FLOAT)-CAST(OutT.BeginTime AS FLOAT))*1440,0)
		END,
		OnDutyM= CASE
			WHEN SumList.Seg1BResult in (6,7,8) THEN ISNULL(SumList.OnDutyM,0)-CEILING((CAST(OutT.EndTime As Float)-CAST(OutT.BeginTime AS FLOAT))*1440/30)*30
			ELSE ISNULL(SumList.OnDutyM,0)+ROUND((CAST(OutT.EndTime AS FLOAT)-CAST(OutT.BeginTime AS FLOAT))*1440,0)
		END
  FROM T_Att_SumList AS SumList,T_Att_Out AS OutT
  WHERE (SumList.Person_Key = OutT.Person_Key)
        AND (SumList.PlanDate = OutT.OverDate)
        AND (OutT.ClassType=15) AND (OutT.OverDate=SumList.PlanDate)
        AND (SumList.Seg1Enabled=1) AND (SumList.Seg1BResult in (1,2,6,7,8)) 
        AND (SumList.Seg1EResult in (1,2,6,7,8)) 
        AND (OutT.BeginTime>=SumList.Seg1BTime) 
        AND (OutT.EndTime>=SumList.Seg1BTime) AND (OutT.EndTime<=SumList.Seg1ETime)


  --病假第二时段
  UPDATE T_Att_SumList SET 
		Remark=''中途外出'',
		EgressM= CASE
			WHEN SumList.Seg2BResult in (6,7,8) THEN ISNULL(SumList.EgressM,0)+CEILING((CAST(OutT.EndTime As Float)-CAST(OutT.BeginTime AS FLOAT))*1440/30)*30
			ELSE ISNULL(SumList.EgressM,0)+ROUND((CAST(OutT.EndTime AS FLOAT)-CAST(OutT.BeginTime AS FLOAT))*1440,0)
		END,
		Seg1Work= CASE 
			WHEN SumList.Seg2BResult in (6,7,8) THEN CEILING((CAST(OutT.EndTime As Float)-CAST(OutT.BeginTime AS FLOAT))*1440/30)*30
			ELSE ROUND((CAST(OutT.EndTime AS FLOAT)-CAST(OutT.BeginTime AS FLOAT))*1440,0)
		END,
		OnDutyM= CASE
			WHEN SumList.Seg2BResult in (6,7,8) THEN ISNULL(SumList.OnDutyM,0)-CEILING((CAST(OutT.EndTime As Float)-CAST(OutT.BeginTime AS FLOAT))*1440/30)*30
			ELSE ISNULL(SumList.OnDutyM,0)+ROUND((CAST(OutT.EndTime AS FLOAT)-CAST(OutT.BeginTime AS FLOAT))*1440,0)
		END
  FROM T_Att_SumList AS SumList,T_Att_Out AS OutT
  WHERE (SumList.Person_Key = OutT.Person_Key)
        AND (SumList.PlanDate = OutT.OverDate)
        AND (OutT.ClassType=15) AND (OutT.OverDate=SumList.PlanDate)
        AND (SumList.Seg2Enabled=1) AND (SumList.Seg2BResult in (1,2,6,7,8)) 
        AND (SumList.Seg2EResult in (1,2,6,7,8)) 
        AND (OutT.BeginTime>=SumList.Seg2BTime) 
        AND (OutT.EndTime>=SumList.Seg2BTime) AND (OutT.EndTime<=SumList.Seg2ETime)
  */

  --以下为侯永红更改
   DECLARE 
           @PersonKey   bigint,
           @BeginTime   datetime,
           @EndTime     datetime,
           @ClassType   int,
           @OverDate    datetime
                      
   DECLARE Temp_Cursor  CURSOR FOR 
	SELECT Person_Key,OverDate,BeginTime,EndTime,ClassType FROM  T_Att_Out Order By OverDate

   OPEN Temp_Cursor  
   FETCH NEXT FROM Temp_Cursor    
   INTO @PersonKey,@OverDate,@BeginTime,@EndTime,@ClassType   
  
   WHILE @@FETCH_STATUS = 0
      BEGIN
                 UPDATE T_Att_SumList SET    
                           AffairM= CASE   --事件
                                    WHEN  @ClassType=10 THEN ISNULL(AffairM,0)+ROUND((CAST(@EndTime AS FLOAT)-CAST(@BeginTime AS FLOAT))*1440/30,0)*30
                                    ELSE   AffairM
                           END,
                           illM= CASE     --病假
                                    WHEN  @ClassType=11 THEN ISNULL(illM,0)+ROUND((CAST(@EndTime AS FLOAT)-CAST(@BeginTime AS FLOAT))*1440/30,0)*30
                                    ELSE   illM
                           END,          
                           EgressM= CASE  --外出
                                    WHEN  @ClassType=15 THEN ISNULL(EgressM,0)+ROUND((CAST(@EndTime AS FLOAT)-CAST(@BeginTime AS FLOAT))*1440/30,0)*30
                                    ELSE   EgressM
                           END,                              
                           PubRestM= CASE  --公休
                                    WHEN  @ClassType=9 THEN ISNULL(PubRestM,0)+ROUND((CAST(@EndTime AS FLOAT)-CAST(@BeginTime AS FLOAT))*1440/30,0)*30
                                    ELSE   PubRestM
                           END,                              
                           YearM= CASE    --年假
                                    WHEN  @ClassType=12 THEN ISNULL(YearM,0)+ROUND((CAST(@EndTime AS FLOAT)-CAST(@BeginTime AS FLOAT))*1440/30,0)*30
                                    ELSE  YearM
                           END,                              
                           MarrigeM= CASE  --婚假
                                    WHEN  @ClassType=13 THEN ISNULL(MarrigeM,0)+ROUND((CAST(@EndTime AS FLOAT)-CAST(@BeginTime AS FLOAT))*1440/30,0)*30
                                    ELSE   MarrigeM
                           END,   
                           EvectionM= CASE --出差
                                    WHEN  @ClassType=14 THEN ISNULL(EvectionM,0)+ROUND((CAST(@EndTime AS FLOAT)-CAST(@BeginTime AS FLOAT))*1440/30,0)*30
                                    ELSE   EvectionM
                           END,   
                           MaternityM= CASE --产假
                                    WHEN  @ClassType=25 THEN ISNULL(MaternityM,0)+ROUND((CAST(@EndTime AS FLOAT)-CAST(@BeginTime AS FLOAT))*1440/30,0)*30
                                    ELSE   MaternityM
                           END,   
                           MournM= CASE   --丧假
                                    WHEN  @ClassType=26 THEN ISNULL(MournM,0)+ROUND((CAST(@EndTime AS FLOAT)-CAST(@BeginTime AS FLOAT))*1440/30,0)*30
                                    ELSE  MournM
                           END                                                                                                            
                 WHERE (Person_Key = @PersonKey )AND (PlanDate = @OverDate)
                 --select @PersonKey,@OverDate,@BeginTime,@EndTime,@ClassType 
 
                 FETCH NEXT FROM Temp_Cursor    
                 INTO @PersonKey,@OverDate,@BeginTime,@EndTime,@ClassType

      END
   CLOSE  Temp_Cursor
   DEALLOCATE  Temp_Cursor


  UPDATE T_Att_SumList SET 
		           Remark=CASE
                                       WHEN SumList.Remark IS NULL THEN ''事假''+CONVERT(varchar(4),CAST(AffairM AS FLOAT)/60) +''小时'' 
                                       ELSE SumList.Remark +''+事假''+CONVERT(varchar(4),CAST(AffairM AS FLOAT)/60) +''小时'' 
                           END
  FROM T_Att_SumList AS SumList,T_Att_Out AS OutT
  WHERE (SumList.Person_Key = OutT.Person_Key)
        AND (SumList.PlanDate = OutT.OverDate) AND (AffairM IS NOT NULL) 

  UPDATE T_Att_SumList SET 
		           Remark=CASE
                                       WHEN SumList.Remark IS NULL THEN ''病假''+CONVERT(varchar(4),CAST(illM AS FLOAT)/60)+''小时'' 
                                       ELSE SumList.Remark +''+病假''+CONVERT(varchar(4),CAST(illM AS FLOAT)/60)+''小时'' 
                           END 
  FROM T_Att_SumList AS SumList,T_Att_Out AS OutT
  WHERE (SumList.Person_Key = OutT.Person_Key)
        AND (SumList.PlanDate = OutT.OverDate) AND (illM IS NOT NULL)                             
 
  UPDATE T_Att_SumList SET                            
		           Remark=CASE
                                       WHEN SumList.Remark IS NULL THEN ''丧假''+CONVERT(varchar(4),CAST(MournM AS FLOAT)/60)+''小时'' 
                                       ELSE SumList.Remark +''+丧假''+CONVERT(varchar(4),CAST(MournM AS FLOAT)/60)+''小时'' 
                           END  
  FROM T_Att_SumList AS SumList,T_Att_Out AS OutT
  WHERE (SumList.Person_Key = OutT.Person_Key)
        AND (SumList.PlanDate = OutT.OverDate) AND (MournM IS NOT NULL)                             
                           
  UPDATE T_Att_SumList SET                             
		           Remark=CASE
                                       WHEN SumList.Remark IS NULL THEN ''产假''+CONVERT(varchar(4),CAST(MaternityM AS FLOAT)/60)+''小时'' 
                                       ELSE SumList.Remark +''+产假''+CONVERT(varchar(4),CAST(MaternityM AS FLOAT)/60)+''小时'' 
                           END
  FROM T_Att_SumList AS SumList,T_Att_Out AS OutT
  WHERE (SumList.Person_Key = OutT.Person_Key)
        AND (SumList.PlanDate = OutT.OverDate) AND (MaternityM IS NOT NULL)  
                                       
  UPDATE T_Att_SumList SET  
		           Remark=CASE
                                       WHEN SumList.Remark IS NULL THEN ''出差''+CONVERT(varchar(4),CAST(EvectionM AS FLOAT)/60)+''小时'' 
                                       ELSE SumList.Remark +''+出差''+CONVERT(varchar(4),CAST(EvectionM AS FLOAT)/60)+''小时'' 
                           END  
  FROM T_Att_SumList AS SumList,T_Att_Out AS OutT
  WHERE (SumList.Person_Key = OutT.Person_Key)
        AND (SumList.PlanDate = OutT.OverDate) AND (EvectionM IS NOT NULL)                            

  UPDATE T_Att_SumList SET                              
		           Remark=CASE
                                       WHEN SumList.Remark IS NULL THEN ''婚假''+CONVERT(varchar(4),CAST(MarrigeM AS FLOAT)/60)+''小时'' 
                                       ELSE SumList.Remark +''+婚假''+CONVERT(varchar(4),CAST(MarrigeM AS FLOAT)/60)+''小时'' 
                           END  
   FROM T_Att_SumList AS SumList,T_Att_Out AS OutT
  WHERE (SumList.Person_Key = OutT.Person_Key)
        AND (SumList.PlanDate = OutT.OverDate) AND (MarrigeM IS NOT NULL)  
                                  
  UPDATE T_Att_SumList SET                              
		           Remark=CASE
                                       WHEN SumList.Remark IS NULL THEN ''年假''+CONVERT(varchar(4),CAST(YearM AS FLOAT)/60)+''小时'' 
                                       ELSE SumList.Remark +''+年假''+CONVERT(varchar(4),CAST(YearM AS FLOAT)/60)+''小时'' 
                           END  
   FROM T_Att_SumList AS SumList,T_Att_Out AS OutT
  WHERE (SumList.Person_Key = OutT.Person_Key)
        AND (SumList.PlanDate = OutT.OverDate) AND (YearM IS NOT NULL)  
                                  
  UPDATE T_Att_SumList SET                               
		           Remark=CASE
                                       WHEN SumList.Remark IS NULL THEN ''公休''+CONVERT(varchar(4),CAST(PubRestM AS FLOAT)/60)+''小时'' 
                                       ELSE SumList.Remark +''+公休''+CONVERT(varchar(4),CAST(PubRestM AS FLOAT)/60)+''小时'' 
                           END  
  FROM T_Att_SumList AS SumList,T_Att_Out AS OutT
  WHERE (SumList.Person_Key = OutT.Person_Key)
        AND (SumList.PlanDate = OutT.OverDate) AND (PubRestM IS NOT NULL)  
                                   
  UPDATE T_Att_SumList SET                              
		           Remark=CASE
                                       WHEN SumList.Remark IS NULL THEN ''外出''+CONVERT(varchar(4),CAST(EgressM AS FLOAT)/60)+''小时'' 
                                       ELSE SumList.Remark +''+外出''+CONVERT(varchar(4),CAST(EgressM AS FLOAT)/60)+''小时'' 
                           END 
  FROM T_Att_SumList AS SumList,T_Att_Out AS OutT
  WHERE (SumList.Person_Key = OutT.Person_Key)
        AND (SumList.PlanDate = OutT.OverDate) AND (EgressM IS NOT NULL)                                                                                                                                                                                                                                      
  Set NOCOUNT OFF 
END
' 
END
GO
/****** 对象:  StoredProcedure [dbo].[P_Att_ClassAndValueUp]    脚本日期: 09/25/2019 10:09:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_ClassAndValueUp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--更新临时表内班次类型及加班、请假等非正常考勤记录
CREATE PROCEDURE [dbo].[P_Att_ClassAndValueUp]
		@ClassType	int	--类型
AS
BEGIN
  Set NOCOUNT ON   
  --更新班次及相关信息(主要针对不上班日期-Class_Key为NULL记录)
  DELETE FROM T_Att_TempIOTime
  INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,Class_Key)
  SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key,OutT.Class_Key As Class_Key
  FROM T_Att_TempCalc AS TmpCalc INNER JOIN T_Att_Out AS OutT ON TmpCalc.Person_Key = OutT.Person_Key
  WHERE (OutT.ClassType=@ClassType) AND (OutT.OverDate=TmpCalc.PlanDate)

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

  --Select * From T_Att_TempCalc
  --Where (P_Key In (Select P_Key From T_Att_TempIOTime))
  Exec P_Att_BETimeUp ''(P_Key In (Select P_Key From T_Att_TempIOTime))''

  /*
  --第一时段
  --DELETE FROM T_Att_TempIOTime
  --INSERT INTO T_Att_TempIOTime
  --	(P_Key,Person_Key)
  --SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key
  --FROM T_Att_TempCalc AS TmpCalc INNER JOIN T_Att_Out AS OutT ON TmpCalc.Person_Key = OutT.Person_Key
  --WHERE (OutT.ClassType=@ClassType) AND (OutT.OverDate=TmpCalc.PlanDate)
  --      AND (TmpCalc.Seg1Enabled=1) and (TmpCalc.Seg1BTime is not NULL)
  --      AND (OutT.BeginTime<=TmpCalc.Seg1BTime) 
  --     AND  (OutT.EndTime>=TmpCalc.Seg1BTime) AND (OutT.EndTime<=TmpCalc.Seg1ETime)

  --UPDATE T_Att_TempCalc SET Seg1BResult=@ClassType,Seg1BValue=0,Seg1EResult=@ClassType,
  --		Seg1EValue=0,Seg1Work=Seg1TimeLen  
  --WHERE (P_Key In (Select P_Key From T_Att_TempIOTime))

  UPDATE T_Att_TempCalc SET Seg1BResult=@ClassType,Seg1BValue=0,Seg1EResult=@ClassType,
  		Seg1EValue=0,Seg1Work=CEILING((CAST(OutT.EndTime As Float)-CAST(OutT.BeginTime AS FLOAT))*1440/30)*30
  FROM T_Att_TempCalc AS TmpCalc,T_Att_Out AS OutT
  WHERE (TmpCalc.Person_Key = OutT.Person_Key)
        AND (OutT.ClassType=@ClassType) AND (OutT.OverDate=TmpCalc.PlanDate)
        AND (TmpCalc.Seg1Enabled=1) and (TmpCalc.Seg1BTime is not NULL)
        AND (OutT.BeginTime<=TmpCalc.Seg1ETime) 
       AND  (OutT.EndTime>=TmpCalc.Seg1BTime) AND (OutT.EndTime<=TmpCalc.Seg1ETime)

  --第二时段
  --DELETE FROM T_Att_TempIOTime
  --INSERT INTO T_Att_TempIOTime
  --	(P_Key,Person_Key)
  --SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key
  --FROM T_Att_TempCalc AS TmpCalc INNER JOIN T_Att_Out AS OutT ON TmpCalc.Person_Key = OutT.Person_Key
  --WHERE (OutT.OverDate=TmpCalc.PlanDate)AND (OutT.ClassType=@ClassType)
  --	AND (TmpCalc.Seg2Enabled=1) and (TmpCalc.Seg2BTime is not NULL) 
  --           AND (OutT.BeginTime>=TmpCalc.Seg1ETime)  AND (OutT.BeginTime<=TmpCalc.Seg2BTime) 
  --           AND (OutT.EndTime>=TmpCalc.Seg2BTime)  AND (OutT.EndTime<=TmpCalc.Seg2ETime)

  --UPDATE T_Att_TempCalc SET Seg2BResult=@ClassType,Seg2BValue=0,Seg2EResult=@ClassType,
  --		Seg2EValue=0,Seg2Work=Seg2TimeLen  
  --WHERE (P_Key In (Select P_Key From T_Att_TempIOTime))

  UPDATE T_Att_TempCalc SET Seg2BResult=@ClassType,Seg2BValue=0,Seg2EResult=@ClassType,
  		Seg2EValue=0,Seg2Work=CEILING((CAST(OutT.EndTime As Float)-CAST(OutT.BeginTime AS FLOAT))*1440/30)*30
  FROM T_Att_TempCalc AS TmpCalc,T_Att_Out AS OutT
  WHERE (TmpCalc.Person_Key = OutT.Person_Key)
        AND (OutT.OverDate=TmpCalc.PlanDate)AND (OutT.ClassType=@ClassType)
  	AND (TmpCalc.Seg2Enabled=1) and (TmpCalc.Seg2BTime is not NULL) 
             AND (OutT.BeginTime>=TmpCalc.Seg1ETime)  AND (OutT.BeginTime<=TmpCalc.Seg2ETime) 
             AND (OutT.EndTime>=TmpCalc.Seg2BTime)  AND (OutT.EndTime<=TmpCalc.Seg2ETime)

  --第三时段
  --DELETE FROM T_Att_TempIOTime
  --INSERT INTO T_Att_TempIOTime
  --	(P_Key,Person_Key)
  --SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key
  --FROM T_Att_TempCalc AS TmpCalc INNER JOIN T_Att_Out AS OutT ON TmpCalc.Person_Key = OutT.Person_Key
  --WHERE (OutT.ClassType=@ClassType) AND (OutT.OverDate=TmpCalc.PlanDate)
  --      AND (TmpCalc.Seg3Enabled=1) and (TmpCalc.Seg3BTime is not NULL)
  --      AND (OutT.BeginTime>=TmpCalc.Seg2ETime) AND (OutT.BeginTime<=TmpCalc.Seg3BTime)
  --       AND  (OutT.EndTime>=TmpCalc.Seg3BTime) AND  (OutT.EndTime<=TmpCalc.Seg3ETime)

  --UPDATE T_Att_TempCalc SET Seg3BResult=@ClassType,Seg3BValue=0,Seg3EResult=@ClassType,
  --	Seg3EValue=0,Seg3Work=Seg3TimeLen  
  --WHERE (P_Key In (Select P_Key From T_Att_TempIOTime))

  UPDATE T_Att_TempCalc SET Seg3BResult=@ClassType,Seg3BValue=0,Seg3EResult=@ClassType,
  		Seg3EValue=0,Seg3Work=CEILING((CAST(OutT.EndTime As Float)-CAST(OutT.BeginTime AS FLOAT))*1440/30)*30
  FROM T_Att_TempCalc AS TmpCalc,T_Att_Out AS OutT
  WHERE (TmpCalc.Person_Key = OutT.Person_Key)
        AND (OutT.ClassType=@ClassType) AND (OutT.OverDate=TmpCalc.PlanDate)
        AND (TmpCalc.Seg3Enabled=1) and (TmpCalc.Seg3BTime is not NULL)
        AND (OutT.BeginTime>=TmpCalc.Seg2ETime) AND (OutT.BeginTime<=TmpCalc.Seg3ETime)
         AND  (OutT.EndTime>=TmpCalc.Seg3BTime) AND  (OutT.EndTime<=TmpCalc.Seg3ETime)
  */

  --以下为侯永红更改
   DECLARE 
           @PersonKey   bigint,
           @BeginTime   datetime,
           @EndTime     datetime,
           @AddClassType   int,
           @OverDate    datetime
                      
   DECLARE Temp_Cursor  CURSOR FOR 
	SELECT Person_Key,OverDate,BeginTime,EndTime,ClassType FROM  T_Att_Out Order By OverDate

   OPEN Temp_Cursor  
   FETCH NEXT FROM Temp_Cursor    
   INTO @PersonKey,@OverDate,@BeginTime,@EndTime,@AddClassType   
  
   WHILE @@FETCH_STATUS = 0
      BEGIN
                 UPDATE T_Att_TempCalc  SET                               --Seg1BResult=@ClassType,Seg1BValue=0,Seg1EResult=@ClassType,Seg1EValue=0,
                             Seg1EResult=CASE
                                   WHEN  @EndTime<= Seg2BTime THEN  @ClassType
                                   WHEN (Seg2BTime IS NULL) AND (Seg3BTime IS NULL)THEN  @ClassType
                                   ELSE  Seg1EResult
                                   END,
                             Seg2EResult=CASE
                                   WHEN  (@BeginTime>=Seg2BTime) AND (Seg3BTime IS NULL)THEN  @ClassType
                                   WHEN  (@BeginTime>=Seg2BTime) AND (@BeginTime<=Seg3BTime)THEN  @ClassType
                                   ELSE  Seg2EResult
                                   END,
                             Seg3EResult=CASE
                                   WHEN  @BeginTime>=Seg3BTime THEN  @ClassType
                                   ELSE  Seg3EResult
                                   END,
                             Seg1Over =CASE
                                   WHEN  @EndTime<=Seg2BTime THEN  ISNULL(Seg1Over,0)+FLOOR(((CAST(@EndTime As Float)-CAST(@BeginTime AS FLOAT))*1440+1)/30)*30 
                                   WHEN (Seg2BTime IS NULL) AND (Seg3BTime IS NULL)THEN ISNULL(Seg1Over,0)+FLOOR(((CAST(@EndTime As Float)-CAST(@BeginTime AS FLOAT))*1440+1)/30)*30 
                                   ELSE  Seg1Over
                                   END,
                             Seg2Over =CASE
                                   WHEN  (@BeginTime>=Seg2BTime) AND (Seg3BTime IS NULL)THEN  ISNULL(Seg2Over,0)+FLOOR(((CAST(@EndTime As Float)-CAST(@BeginTime AS FLOAT))*1440+1)/30)*30 
                                   WHEN  (@BeginTime>=Seg2BTime) AND (@BeginTime<=Seg3BTime) THEN  ISNULL(Seg2Over,0)+FLOOR(((CAST(@EndTime As Float)-CAST(@BeginTime AS FLOAT))*1440+1)/30)*30 
                                   ELSE  Seg2Over
                                   END,
                             Seg3Over =CASE
                                   WHEN  @BeginTime>=Seg3BTime THEN  ISNULL(Seg3Over,0)+FLOOR(((CAST(@EndTime As Float)-CAST(@BeginTime AS FLOAT))*1440+1)/30)*30 
                                   ELSE  Seg3Over
                                   END                                                                                                         
                 WHERE (Person_Key = @PersonKey) AND (@ClassType=@AddClassType) AND (@OverDate=PlanDate)

                 FETCH NEXT FROM Temp_Cursor    
                 INTO @PersonKey,@OverDate,@BeginTime,@EndTime,@AddClassType

      END
   CLOSE  Temp_Cursor
   DEALLOCATE  Temp_Cursor
  Set NOCOUNT OFF
END
' 
END
GO
/****** 对象:  StoredProcedure [dbo].[P_Att_SumMonthAdd]    脚本日期: 09/25/2019 10:09:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_SumMonthAdd]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--考勤系统汇总月份数据
CREATE PROCEDURE [dbo].[P_Att_SumMonthAdd]
	@BeginDate	Datetime,
	@EndDate	Datetime
AS
BEGIN
DECLARE	@YearMonth	Varchar(19),
		@MaxMonthOvertime	Float	--月最长加班时间（时）

  --print @BeginDate
  --print @EndDate
  INSERT INTO T_Att_TempMonth
	(Person_Key, 	
	AllTimeLenH, 
	OnDutyH, 
	ShallDay,
	FactDay,
	AbsentDay,
	LaterM, 
	LaterT, 
	EarlyM, 
	EarlyT, 
	AbsentH, 
	AbsentT, 
	illH, 
 	AffairH , 
	PubRestH,
	YearH,
	MarrigeH, 
	MournH, 
	MaternityH, 
	EvectionH, 
	EgressH, 
	EgressT,
	Over1H, 
	Over2H, 
	Over3H)
  SELECT T_Att_SumList.Person_Key AS Person_Key, 
	ROUND(SUM(T_Att_SumList.AllTimeLen)/60.0,2) AS AllTimeLenH, 
	ROUND(SUM(T_Att_SumList.OnDutyM)/60.0,2) AS OnDutyH, 
	SUM(T_Att_SumList.ShallDay) AS ShallDay, 
	SUM(T_Att_SumList.FactDay) AS FactDay, 
	SUM(T_Att_SumList.AbsentDay) AS AbsentDay, 
	SUM(T_Att_SumList.LaterM) AS LaterM, 
	SUM(T_Att_SumList.LaterT) AS LaterT, 
	SUM(T_Att_SumList.EarlyM) AS EarlyM, 
	SUM(T_Att_SumList.EarlyT) AS EarlyT, 
	ROUND(SUM(T_Att_SumList.AbsentM)/60.0,2) AS AbsentH, 
	SUM(T_Att_SumList.AbsentT) AS AbsentT, 
	ROUND(SUM(T_Att_SumList.illM)/60.0,2) AS illH, 
	ROUND(SUM(T_Att_SumList.AffairM)/60.0,2) AS AffairH, 
	ROUND(SUM(T_Att_SumList.PubRestM)/60.0,2) AS PubRestH, 
	ROUND(SUM(T_Att_SumList.YearM)/60.0,2) AS YearH, 
	ROUND(SUM(T_Att_SumList.MarrigeM)/60.0,2) AS MarrigeH, 
	ROUND(SUM(T_Att_SumList.MournM)/60.0,2) AS MournH, 
	ROUND(SUM(T_Att_SumList.MaternityM)/60.0,2) AS MaternityH, 
	ROUND(SUM(T_Att_SumList.EvectionM)/60.0,2) AS EvectionH, 
	ROUND(SUM(T_Att_SumList.EgressM)/60.0,2) AS EgressH, 
	SUM(T_Att_SumList.EgressT) AS AbsentT, 
	ROUND(SUM(T_Att_SumList.Over1M)/60.0,2) AS Over1H, 
	ROUND(SUM(T_Att_SumList.Over2M)/60.0,2) AS Over2H, 
	ROUND(SUM(T_Att_SumList.Over3M)/60.0,2) AS Over3H
  FROM T_Att_SumList
  WHERE PlanDate Between @BeginDate And @EndDate
  GROUP BY T_Att_SumList.Person_Key

  SET @YearMonth=Convert(Varchar(7),@EndDate,121)
  UPDATE T_Att_TempMonth Set
	DepName=Person.DepName,
	sName=Person.PersonName,
	PersonIDCard=Person.PersonIDCard,
	AttDate=@YearMonth
  FROM T_Att_TempMonth TempMonth, V_Com_PersonCard Person
  WHERE (TempMonth.Person_Key=Person.P_Key)

  --导入汇总表
  INSERT INTO T_Att_SumMonth   
	(Person_Key, 
	DepName, 
	SName, 
	PersonIDCard, 
	AttDate,

	AllTimeLenH, 
	OnDutyH, 
	ShallDay,
	FactDay,
	AbsentDay,
	LaterM, 
	LaterT, 
	EarlyM, 
	EarlyT, 
	AbsentH, 
	AbsentT, 
	illH, 
 	AffairH , 
	PubRestH,
	YearH,
	MarrigeH, 
	MournH, 
	MaternityH, 
	EvectionH, 
	EgressH, 
	EgressT,
	Over1H, 
	Over2H, 
	Over3H)
  SELECT Person_Key, 
	DepName, 
	SName, 
	PersonIDCard, 
	AttDate,

	AllTimeLenH, 
	OnDutyH, 
	ShallDay,
	FactDay,
	AbsentDay,
	LaterM, 
	LaterT, 
	EarlyM, 
	EarlyT, 
	AbsentH, 
	AbsentT, 
	illH, 
 	AffairH , 
	PubRestH,
	YearH,
	MarrigeH, 
	MournH, 
	MaternityH, 
	EvectionH, 
	EgressH, 
	EgressT,
	Over1H, 
	Over2H, 
	Over3H
  FROM T_Att_TempMonth

  --存在月最长加班时间（小时）
  SELECT @MaxMonthOvertime=Value1 From T_Com_SysPara where sName=''Att_MaxMonthOvertime''
  IF (ISNULL(@MaxMonthOvertime,0)>0)
  begin
    UPDATE T_Att_SumMonth SET Over1H=@MaxMonthOvertime Where (Over1H>@MaxMonthOvertime)
    UPDATE T_Att_SumMonth SET Over2H=@MaxMonthOvertime Where (Over2H>@MaxMonthOvertime)
    UPDATE T_Att_SumMonth SET Over3H=@MaxMonthOvertime Where (Over3H>@MaxMonthOvertime)
  end

  UPDATE T_Att_SumMonth SET OverSum=ISNULL(Over1H,0)+ISNULL(Over2H,0)+ISNULL(Over3H,0)
END
' 
END
GO
/****** 对象:  StoredProcedure [dbo].[P_Att_SumSignAdd]    脚本日期: 09/25/2019 10:09:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_SumSignAdd]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--考勤系统汇总月份符号数据
CREATE PROCEDURE [dbo].[P_Att_SumSignAdd]
	@BeginDate	Datetime,
	@EndDate	Datetime
AS
BEGIN
  --print @BeginDate
  --print @EndDate

  Delete FROM T_Att_SumSign
  INSERT INTO T_Att_SumSign
	(Person_Key, 	
	DepName, 
	sName)
  SELECT V_Com_PersonCard.P_Key AS Person_Key,
	V_Com_PersonCard.DepName As DepName,
	V_Com_PersonCard.PersonName As sName
  FROM V_Com_PersonCard

  WHILE (@BeginDate<=@EndDate)
  BEGIN
  	Exec P_Att_SignAmPmUp @BeginDate
  	Set @BeginDate=@BeginDate+1
  END
END
' 
END
GO
/****** 对象:  StoredProcedure [dbo].[P_Att_CreatePsnPlan]    脚本日期: 09/25/2019 10:09:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_CreatePsnPlan]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
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

    WHERE (PsnShift.AttendType=0) And (PsnCard.PersonComeDate<=@TempDate) 
    
    SET @TempDate=@TempDate+1
  END

  --更新公休日班次
  /*UPDATE T_Att_TempCalc SET Class_Key=NULL,ClassNo=NULL,ClassName=NULL, 
      Seg1Enabled=NULL,Seg1Type=NULL,Seg1BeginTime=NULL,Seg1EndTime=NULL,Seg1OnTime=NULL,Seg1OffTime=NULL,Seg1TimeLen=NULL, 
      Seg1CheckOn=NULL,Seg1CheckOff=NULL,Seg1CalcLate=NULL,Seg1CalcEarly=NULL,Seg1CalcAbsent=NULL,Seg1CalcLeave=NULL, 

      Seg2Enabled=NULL,Seg2Type=NULL,Seg2BeginTime=NULL,Seg2EndTime=NULL,Seg2OnTime=NULL,Seg2OffTime=NULL,Seg2TimeLen=NULL, 
      Seg2CheckOn=NULL,Seg2CheckOff=NULL,Seg2CalcLate=NULL,Seg2CalcEarly=NULL,Seg2CalcAbsent=NULL,Seg2CalcLeave=NULL, 

      Seg3Enabled=NULL,Seg3Type=NULL,Seg3BeginTime=NULL,Seg3EndTime=NULL,Seg3OnTime=NULL,Seg3OffTime=NULL,Seg3TimeLen=NULL, 
      Seg3CheckOn=NULL,Seg3CheckOff=NULL,Seg3CalcLate=NULL, Seg3CalcEarly=NULL,Seg3CalcAbsent=NULL,Seg3CalcLeave=NULL
  WHERE (RestType=0) and (WeekOfDay in (1,7))  --周六、周日公休

  UPDATE T_Att_TempCalc SET Seg2Enabled=NULL,Seg2Type=NULL,Seg2BeginTime=NULL,Seg2EndTime=NULL,Seg2OnTime=NULL,Seg2OffTime=NULL,
      Seg2TimeLen=NULL,Seg2CheckOn=NULL,Seg2CheckOff=NULL,Seg2CalcLate=NULL,Seg2CalcEarly=NULL,Seg2CalcAbsent=NULL,Seg2CalcLeave=NULL, 
      Seg3Enabled=NULL,Seg3Type=NULL,Seg3BeginTime=NULL,Seg3EndTime=NULL,Seg3OnTime=NULL,Seg3OffTime=NULL,Seg3TimeLen=NULL, 
      Seg3CheckOn=NULL,Seg3CheckOff=NULL,Seg3CalcLate=NULL, Seg3CalcEarly=NULL,Seg3CalcAbsent=NULL,Seg3CalcLeave=NULL
  WHERE (RestType=1) and (WeekOfDay=7)        --周六半天、周日公休

  UPDATE T_Att_TempCalc SET Class_Key=NULL,ClassNo=NULL,ClassName=NULL, 
      Seg1Enabled=NULL,Seg1Type=NULL,Seg1BeginTime=NULL,Seg1EndTime=NULL,Seg1OnTime=NULL,Seg1OffTime=NULL,Seg1TimeLen=NULL, 
      Seg1CheckOn=NULL,Seg1CheckOff=NULL,Seg1CalcLate=NULL,Seg1CalcEarly=NULL,Seg1CalcAbsent=NULL,Seg1CalcLeave=NULL, 
      Seg2Enabled=NULL,Seg2Type=NULL,Seg2BeginTime=NULL,Seg2EndTime=NULL,Seg2OnTime=NULL,Seg2OffTime=NULL,Seg2TimeLen=NULL, 
      Seg2CheckOn=NULL,Seg2CheckOff=NULL,Seg2CalcLate=NULL,Seg2CalcEarly=NULL,Seg2CalcAbsent=NULL,Seg2CalcLeave=NULL, 
      Seg3Enabled=NULL,Seg3Type=NULL,Seg3BeginTime=NULL,Seg3EndTime=NULL,Seg3OnTime=NULL,Seg3OffTime=NULL,Seg3TimeLen=NULL, 
      Seg3CheckOn=NULL,Seg3CheckOff=NULL,Seg3CalcLate=NULL, Seg3CalcEarly=NULL,Seg3CalcAbsent=NULL,Seg3CalcLeave=NULL
  WHERE (RestType=2) and (WeekOfDay=7)        --周日公休
  */
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
/*  UPDATE T_Att_TempCalc SET Class_Key=NULL,ClassNo=NULL,ClassName=NULL, 
      Seg1Enabled=NULL,Seg1Type=NULL,Seg1BeginTime=NULL,Seg1EndTime=NULL,Seg1OnTime=NULL,Seg1OffTime=NULL,Seg1TimeLen=NULL, 
      Seg1CheckOn=NULL,Seg1CheckOff=NULL,Seg1CalcLate=NULL,Seg1CalcEarly=NULL,Seg1CalcAbsent=NULL,Seg1CalcLeave=NULL, 
      Seg2Enabled=NULL,Seg2Type=NULL,Seg2BeginTime=NULL,Seg2EndTime=NULL,Seg2OnTime=NULL,Seg2OffTime=NULL,Seg2TimeLen=NULL, 
      Seg2CheckOn=NULL,Seg2CheckOff=NULL,Seg2CalcLate=NULL,Seg2CalcEarly=NULL,Seg2CalcAbsent=NULL,Seg2CalcLeave=NULL, 
      Seg3Enabled=NULL,Seg3Type=NULL,Seg3BeginTime=NULL,Seg3EndTime=NULL,Seg3OnTime=NULL,Seg3OffTime=NULL,Seg3TimeLen=NULL, 
      Seg3CheckOn=NULL,Seg3CheckOff=NULL,Seg3CalcLate=NULL, Seg3CalcEarly=NULL,Seg3CalcAbsent=NULL,Seg3CalcLeave=NULL
  WHERE (IsHoliday=1)
  */
  Set NOCOUNT OFF  
END
' 
END
GO
/****** 对象:  StoredProcedure [dbo].[P_Att_RestLeaveUp]    脚本日期: 09/25/2019 10:09:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_RestLeaveUp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--更新调班、加班、请假、出差
CREATE PROCEDURE [dbo].[P_Att_RestLeaveUp]
AS
BEGIN    
  DECLARE	@ClassTypeEvection	int,	--出差
		@ClassTypeRest	int,	--公休
		@ClassTypeEgress	int,	--外出
		@ClassTypeAffair	int,	--事假
		@ClassTypeIll		int,	--病假
		@ClassTypeShift	int,	--年假
		@ClassTypeMarrige	int,	--婚假
		@ClassTypeMaternity	int,	--产假
		@ClassTypeMourn	int,	--丧假


		@ClassTypeOvertimeN	int,	--平时加班
		@ClassTypeOvertimeR	int,	--公休加班
		@ClassTypeOvertimeH	int	--节假日加班
		




/*  --公休
  SELECT @ClassTypeRest=P_Key FROM T_Att_ClassType WHERE TypeName=''公休''
  IF (@ClassTypeRest IS NULL) 
    SET @ClassTypeRest = 9
  EXEC P_Att_ClassAndValueUp @ClassTypeRest

  --外出
  SELECT @ClassTypeEgress=P_Key FROM T_Att_ClassType WHERE TypeName=''外出''
  IF (@ClassTypeEgress IS NULL) 
    SET @ClassTypeEgress = 15
  EXEC P_Att_ClassAndValueUp @ClassTypeEgress

  --事假
  SELECT @ClassTypeAffair=P_Key FROM T_Att_ClassType WHERE TypeName=''事假''
  IF (@ClassTypeAffair IS NULL) 
    SET @ClassTypeAffair = 10
  EXEC P_Att_ClassAndValueUp @ClassTypeAffair

 --病假
  SELECT @ClassTypeIll=P_Key FROM T_Att_ClassType WHERE TypeName=''病假''
  IF (@ClassTypeIll IS NULL) 
    SET @ClassTypeIll = 11
  EXEC P_Att_ClassAndValueUp @ClassTypeIll

  --年假
  SELECT @ClassTypeShift=P_Key FROM T_Att_ClassType WHERE TypeName=''年假''
  IF (@ClassTypeShift IS NULL) 
    SET @ClassTypeShift = 12
  EXEC P_Att_ClassAndValueUp @ClassTypeShift


  --婚假
  SELECT @ClassTypeMarrige=P_Key FROM T_Att_ClassType WHERE TypeName=''婚假''
  IF (@ClassTypeMarrige IS NULL) 
    SET @ClassTypeMarrige = 13
  EXEC P_Att_ClassAndValueUp @ClassTypeMarrige

  --产假
  SELECT @ClassTypeMaternity=P_Key FROM T_Att_ClassType WHERE TypeName=''产假''
  IF (@ClassTypeMaternity IS NULL) 
    SET @ClassTypeMaternity = 25
  EXEC P_Att_ClassAndValueUp @ClassTypeMaternity

  --丧假
  SELECT @ClassTypeMourn=P_Key FROM T_Att_ClassType WHERE TypeName=''丧假''
  IF (@ClassTypeMourn IS NULL) 
    SET @ClassTypeMourn = 26
  EXEC P_Att_ClassAndValueUp @ClassTypeMourn


  --出差
  SELECT @ClassTypeEvection=P_Key FROM T_Att_ClassType WHERE TypeName=''出差''
  IF (@ClassTypeEvection IS NULL) 
    SET @ClassTypeEvection = 14
  EXEC P_Att_ClassAndValueUp @ClassTypeEvection

  --调班 白班
  SELECT @ClassTypeOvertimeR=P_Key FROM T_Att_ClassType WHERE TypeName=''白班''
  SET @ClassTypeOvertimeR = ISNULL(@ClassTypeOvertimeR,1)
  EXEC P_Att_ClassAndValueUp @ClassTypeOvertimeR

  --调班 夜班
  SELECT @ClassTypeOvertimeR=P_Key FROM T_Att_ClassType WHERE TypeName=''夜班''
  SET @ClassTypeOvertimeR = ISNULL(@ClassTypeOvertimeR,2)
  EXEC P_Att_ClassAndValueUp @ClassTypeOvertimeR*/

  --平时加班
  SELECT @ClassTypeOvertimeN=P_Key FROM T_Att_ClassType WHERE TypeName=''平时加班''
  IF (@ClassTypeOvertimeN IS NULL) 
    SET @ClassTypeOvertimeN = 6
  EXEC P_Att_ClassAndValueUp @ClassTypeOvertimeN

  --公休加班
  SELECT @ClassTypeOvertimeR=P_Key FROM T_Att_ClassType WHERE TypeName=''公休加班''
  IF (@ClassTypeOvertimeR IS NULL) 
    SET @ClassTypeOvertimeR =7
  EXEC P_Att_ClassAndValueUp @ClassTypeOvertimeR

  --节假日加班
  SELECT @ClassTypeOvertimeH=P_Key FROM T_Att_ClassType WHERE TypeName=''节假日加班''
  IF (@ClassTypeOvertimeH IS NULL) 
    SET @ClassTypeOvertimeH = 8
  EXEC P_Att_ClassAndValueUp @ClassTypeOvertimeH


END
' 
END
GO
