IF NOT EXISTS (SELECT 1  FROM syscolumns INNER JOIN sysobjects ON sysobjects.id = syscolumns.id   
        WHERE syscolumns.name = 'IfAttend' AND sysobjects.name = 'T_BD_Control')  
ALTER TABLE T_BD_Control
  Add IfAttend int
GO
-- 1.考勤假日表
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_Com_Holiday]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
CREATE TABLE [dbo].[T_Com_Holiday] (
[P_Key] [int] IDENTITY(1,1) NOT NULL,
	[sName] [varchar](20) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[HolidayCount] [int] NULL,
    [Remark] [varchar](225) NULL
)
ALTER TABLE [dbo].[T_Com_Holiday] ADD PRIMARY KEY ([P_Key])
end;
GO

-- 2.考勤班次表
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_Att_Class]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
CREATE TABLE [dbo].[T_Att_Class] (
[P_Key] [int] IDENTITY(1,1) NOT NULL,
	[ClassNo] [varchar](10) NULL,
	[ClassName] [varchar](30) NULL,
	[Seg1Enabled] [int] NULL,
	[Seg1Type] [int] NULL,
	[Seg1BeginTime] [varchar](15) NULL,
	[Seg1EndTime] [varchar](15) NULL,
	[Seg1OnTime] [varchar](15) NULL,
	[Seg1OffTime] [varchar](15) NULL,
	[Seg1TimeLen] [int] NULL,
	[Seg1CheckOn] [int] NULL,
	[Seg1CheckOff] [int] NULL,
	[Seg1CalcLate] [int] NULL,
	[Seg1CalcEarly] [int] NULL,
	[Seg1CalcAbsent] [int] NULL,
	[Seg1CalcLeave] [int] NULL,
	[Seg2Enabled] [int] NULL,
	[Seg2Type] [int] NULL,
	[Seg2BeginTime] [varchar](15) NULL,
	[Seg2EndTime] [varchar](15) NULL,
	[Seg2OnTime] [varchar](15) NULL,
	[Seg2OffTime] [varchar](15) NULL,
	[Seg2TimeLen] [int] NULL,
	[Seg2CheckOn] [int] NULL,
	[Seg2CheckOff] [int] NULL,
	[Seg2CalcLate] [int] NULL,
	[Seg2CalcEarly] [int] NULL,
	[Seg2CalcAbsent] [int] NULL,
	[Seg2CalcLeave] [int] NULL,
	[Seg3Type] [int] NULL,
	[Seg3Enabled] [int] NULL,
	[Seg3BeginTime] [varchar](15) NULL,
	[Seg3EndTime] [varchar](15) NULL,
	[Seg3OnTime] [varchar](15) NULL,
	[Seg3OffTime] [varchar](15) NULL,
	[Seg3TimeLen] [int] NULL,
	[Seg3CheckOn] [int] NULL,
	[Seg3CheckOff] [int] NULL,
	[Seg3CalcLate] [int] NULL,
	[Seg3CalcEarly] [int] NULL,
	[Seg3CalcAbsent] [int] NULL,
	[Seg3CalcLeave] [int] NULL,
	[DefClass] [int] NULL,
	[Remark] [varchar](255) NULL
CONSTRAINT [PK_T_IPT_Class] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_T_IPT_Class] UNIQUE NONCLUSTERED 
(
	[ClassNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_T_IPT_Class_1] UNIQUE NONCLUSTERED 
(
	[ClassName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
end;
GO
--3.班次类型表
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_Att_ClassType]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
CREATE TABLE [dbo].[T_Att_ClassType] (
[P_Key] [int] IDENTITY(1,1) NOT NULL,
	[TypeNo] [varchar](10) NULL,
	[TypeName] [varchar](30) NULL,
	[TypeUint] [int] NULL,
	[IgnoreValue] [int] NULL,
	[RoundType] [int] NULL,
	[RoundValue] [int] NULL,
	[ResultType] [int] NULL,
	[SysPara] [int] NULL
CONSTRAINT [PK_T_Att_SegmentType] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_T_Att_SegmentType] UNIQUE NONCLUSTERED 
(
	[TypeNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

end;
GO


--4.考勤轮班设置
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_Att_Shift]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
CREATE TABLE [dbo].[T_Att_Shift] (
[P_Key] [int] IDENTITY(1,1) NOT NULL,
	[ShiftNo] [varchar](10) NULL,
	[ShiftName] [varchar](30) NULL,
	[ShiftCyc] [int] NULL,
	[DefShift] [int] NULL,
	[Remark] [varchar](100) NULL,
 CONSTRAINT [PK_T_IPT_Shift] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_T_IPT_Shift] UNIQUE NONCLUSTERED 
(
	[ShiftNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_T_IPT_Shift_1] UNIQUE NONCLUSTERED 
(
	[ShiftName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

end;
GO
--5.考勤轮班设置2
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_Att_ShiftClass]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
CREATE TABLE [dbo].[T_Att_ShiftClass] (
[P_Key] [int] IDENTITY(1,1) NOT NULL,
	[Class_Key] [int] NULL,
	[Shift_Key] [int] NULL,
	[OrderNo] [int] NULL,
 CONSTRAINT [PK_T_IPT_ShiftClass] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dbo].[T_Att_ShiftClass]  WITH CHECK ADD  CONSTRAINT [FK_T_IPT_ShiftClass_T_IPT_Class] FOREIGN KEY([Class_Key])
REFERENCES [dbo].[T_Att_Class] ([P_Key])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[T_Att_ShiftClass] CHECK CONSTRAINT [FK_T_IPT_ShiftClass_T_IPT_Class]

ALTER TABLE [dbo].[T_Att_ShiftClass]  WITH CHECK ADD  CONSTRAINT [FK_T_IPT_ShiftClass_T_IPT_Shift] FOREIGN KEY([Shift_Key])
REFERENCES [dbo].[T_Att_Shift] ([P_Key])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[T_Att_ShiftClass] CHECK CONSTRAINT [FK_T_IPT_ShiftClass_T_IPT_Shift]
end;
GO
--5.考勤排班表
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_Att_Plan]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
CREATE TABLE [dbo].[T_Att_Plan](
	[P_Key] [numeric](38, 0) IDENTITY(1,1) NOT NULL,
	[Class_Key] [int] NULL,
	[Person_Key] [bigint] NULL,
	[PlanDate] [datetime] NULL,
	[WeekOfDay] [varchar](10) NULL,
	[IsHoliday] [int] NULL
)
ALTER TABLE [dbo].[T_Att_Plan] ADD PRIMARY KEY ([P_Key])


ALTER TABLE [dbo].[T_Att_Plan]  WITH CHECK ADD  CONSTRAINT [FK_T_IPT_Plan_T_Com_Person] FOREIGN KEY([Person_Key])
REFERENCES [dbo].[T_BD_Person] ([P_Key])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[T_Att_Plan] CHECK CONSTRAINT [FK_T_IPT_Plan_T_Com_Person]

ALTER TABLE [dbo].[T_Att_Plan]  WITH CHECK ADD  CONSTRAINT [FK_T_IPT_Plan_T_IPT_Class] FOREIGN KEY([Class_Key])
REFERENCES [dbo].[T_Att_Class] ([P_Key])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[T_Att_Plan] CHECK CONSTRAINT [FK_T_IPT_Plan_T_IPT_Class]
end;
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_Att_PsnShift]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
CREATE TABLE [dbo].[T_Att_PsnShift](
	[P_Key] [int] IDENTITY(1,1) NOT NULL,
	[Person_Key] [bigint] NULL,
	[AttendType] [int] NULL,
	[Shift_Key] [int] NULL,
	[Class_Key] [int] NULL,
	[RestType] [int] NULL
)
ALTER TABLE [dbo].[T_Att_PsnShift] ADD PRIMARY KEY ([P_Key])


ALTER TABLE [dbo].[T_Att_PsnShift]  WITH CHECK ADD  CONSTRAINT [FK_T_IPT_PsnShift_T_Com_Person] FOREIGN KEY([Person_Key])
REFERENCES [dbo].[T_BD_Person] ([P_Key])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[T_Att_PsnShift] CHECK CONSTRAINT [FK_T_IPT_PsnShift_T_Com_Person]

ALTER TABLE [dbo].[T_Att_PsnShift]  WITH CHECK ADD  CONSTRAINT [FK_T_IPT_PsnShift_T_IPT_Shift] FOREIGN KEY([Shift_Key])
REFERENCES [dbo].[T_Att_Shift] ([P_Key])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[T_Att_PsnShift] CHECK CONSTRAINT [FK_T_IPT_PsnShift_T_IPT_Shift]
end;
GO
--6.考勤调班表
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_Att_Adjust]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
CREATE TABLE [dbo].[T_Att_Adjust](
	[P_Key] [numeric](38, 0) IDENTITY(1,1) NOT NULL,
	[Person_Key] [bigint] NULL,
	[AdjustDate] [datetime] NULL,
	[Reason] [varchar](255) NULL,
	[Class_Key] [int] NULL,
	[Content] [varchar](100) NULL,
	[IsSure] [int] NULL,
	[Operator] [varchar](30) NULL,
	[OpTime] [datetime] NULL
)
ALTER TABLE [dbo].[T_Att_Adjust] ADD PRIMARY KEY ([P_Key])

ALTER TABLE [dbo].[T_Att_Adjust]  WITH CHECK ADD  CONSTRAINT [FK_T_Att_Adjust_T_BD_Person] FOREIGN KEY([Person_Key])
REFERENCES [dbo].[T_BD_Person] ([P_Key])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[T_Att_Adjust] CHECK CONSTRAINT [FK_T_Att_Adjust_T_BD_Person]
end;
GO
--7.考勤异常登记表
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_ATT_Out]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
CREATE TABLE [dbo].[T_ATT_Out](
[P_Key] [numeric](38, 0) IDENTITY(1,1) NOT NULL,
	[Person_Key] [bigint] NULL,
	[OverDate] [datetime] NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Reason] [varchar](255) NULL,
	[Class_Key] [int] NULL,
	[ClassType] [int] NULL,
	[RecType] [int] NULL,
	[Content] [varchar](100) NULL,
	[IsSure] [int] NULL,
	[Operator] [varchar](30) NULL,
	[OpTime] [datetime] NULL
)
ALTER TABLE [dbo].[T_ATT_Out] ADD PRIMARY KEY ([P_Key])
ALTER TABLE [dbo].[T_ATT_Out]  WITH CHECK ADD  CONSTRAINT [FK_T_ATT_Out_T_BD_Person] FOREIGN KEY([Person_Key])
REFERENCES [dbo].[T_BD_Person] ([P_Key])
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE [dbo].[T_ATT_Out] CHECK CONSTRAINT [FK_T_ATT_Out_T_BD_Person]
end;
GO
--8.考勤加班审核表
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_Att_OverCheck]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
CREATE TABLE [dbo].[T_Att_OverCheck](
	[P_Key] [numeric](38, 0) IDENTITY(1,1) NOT NULL,
	[Person_Key] [bigint] NULL,
	[OverDate] [datetime] NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Reason] [varchar](50) NULL,
	[Class_Key] [int] NULL,
	[ClassType] [int] NULL,
	[Content] [varchar](100) NULL,
	[IsSure] [int] NULL,
	[Operator] [varchar](30) NULL,
	[OpTime] [datetime] NULL
)
ALTER TABLE [dbo].[T_Att_OverCheck] ADD PRIMARY KEY ([P_Key])
ALTER TABLE [dbo].[T_Att_OverCheck]  WITH CHECK ADD  CONSTRAINT [FK_T_Att_OverCheck_T_BD_Person] FOREIGN KEY([Person_Key])
REFERENCES [dbo].[T_BD_Person] ([P_Key])
ON UPDATE CASCADE
ON DELETE CASCADE
ALTER TABLE [dbo].[T_Att_OverCheck] CHECK CONSTRAINT [FK_T_Att_OverCheck_T_BD_Person]
end;
GO

--8.考勤手工签卡表
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_ATT_ManualNote]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
CREATE TABLE [dbo].[T_ATT_ManualNote](
	[P_Key] [numeric](38, 0) IDENTITY(1,1) NOT NULL,
	[Person_Key] [bigint] NULL,
	[IOTime] [datetime] NULL,
	[IsSure] [int] NULL,
	[Reason] [varchar](50) NULL,
	[Content] [varchar](100) NULL,
	[Operator] [varchar](30) NULL,
	[OpTime] [datetime] NULL
)
ALTER TABLE [dbo].[T_ATT_ManualNote] ADD PRIMARY KEY ([P_Key])
ALTER TABLE [dbo].[T_ATT_ManualNote]  WITH CHECK ADD  CONSTRAINT [FK_T_ATT_ManualNote_T_BD_Person] FOREIGN KEY([Person_Key])
REFERENCES [dbo].[T_BD_Person] ([P_Key])
ON UPDATE CASCADE
ON DELETE CASCADE
ALTER TABLE [dbo].[T_ATT_ManualNote] CHECK CONSTRAINT [FK_T_ATT_ManualNote_T_BD_Person]
end;
GO
--9.考勤统计表
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_Att_SumDay]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
CREATE TABLE [dbo].[T_Att_SumDay](
	[P_Key] [numeric](38, 0) IDENTITY(1,1) NOT NULL,
	[Person_Key] [bigint] NULL,
	[DepName] [varchar](30) NULL,
	[sName] [varchar](30) NULL,
    [PersonIDCard] [varchar](32) NULL,
	[PlanDate] [datetime] NULL,
	[WeekOfDay] [int] NULL,
	[ClassName] [varchar](30) NULL,
	[AllTimeLen] [int] NULL,
	[OnDutyM] [int] NULL,
	[ShallDay] [float] NULL,
	[FactDay] [float] NULL,
	[LaterM] [int] NULL,
	[LaterT] [int] NULL,
	[EarlyM] [int] NULL,
	[EarlyT] [int] NULL,
	[AbsentM] [int] NULL,
	[AbsentT] [int] NULL,
	[illM] [int] NULL,
	[AffairM] [int] NULL,
	[PubRestM] [int] NULL,
	[YearM] [int] NULL,
	[MarrigeM] [int] NULL,
	[MournM] [int] NULL,
	[MaternityM] [int] NULL,
	[EvectionM] [int] NULL,
	[EgressM] [int] NULL,
	[EgressT] [int] NULL,
	[Over1M] [int] NULL,
	[Over2M] [int] NULL,
	[Over3M] [int] NULL,
	[Remark] [varchar](50) NULL
)
ALTER TABLE [dbo].[T_Att_SumDay] ADD PRIMARY KEY ([P_Key])
end;
GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_Att_SumList]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
CREATE TABLE [dbo].[T_Att_SumList](
	[Person_Key] [bigint] NULL,
	[DepName] [varchar](30) NULL,
	[sName] [varchar](30) NULL,
	[PersonIDCard] [varchar](32) NULL,
	[PlanDate] [datetime] NULL,
	[WeekOfDay] [int] NULL,
	[IsHoliday] [int] NULL,
	[ClassName] [varchar](30) NULL,
	[Seg1Enabled] [int] NULL,
	[Seg1Type] [int] NULL,
	[Seg1BTime] [datetime] NULL,
	[Seg1BFactTime] [datetime] NULL,
	[Seg1BResult] [int] NULL,
	[Seg1BValue] [int] NULL,
	[Seg1ETime] [datetime] NULL,
	[Seg1EFactTime] [datetime] NULL,
	[Seg1EResult] [int] NULL,
	[Seg1EValue] [int] NULL,
	[Seg1Work] [int] NULL,
	[Seg1Over] [int] NULL,
	[Seg2Enabled] [int] NULL,
	[Seg2Type] [int] NULL,
	[Seg2BTime] [datetime] NULL,
	[Seg2BFactTime] [datetime] NULL,
	[Seg2BResult] [int] NULL,
	[Seg2BValue] [int] NULL,
	[Seg2ETime] [datetime] NULL,
	[Seg2EFactTime] [datetime] NULL,
	[Seg2EResult] [int] NULL,
	[Seg2EValue] [int] NULL,
	[Seg2Work] [int] NULL,
	[Seg2Over] [int] NULL,
	[Seg3Enabled] [int] NULL,
	[Seg3Type] [int] NULL,
	[Seg3BTime] [datetime] NULL,
	[Seg3BFactTime] [datetime] NULL,
	[Seg3BResult] [int] NULL,
	[Seg3BValue] [int] NULL,
	[Seg3ETime] [datetime] NULL,
	[Seg3EFactTime] [datetime] NULL,
	[Seg3EResult] [int] NULL,
	[Seg3EValue] [int] NULL,
	[Seg3Work] [int] NULL,
	[Seg3Over] [int] NULL,
	[AllTimeLen] [int] NULL,
	[OnDutyM] [int] NULL,
	[ShallDay] [float] NULL,
	[FactDay] [float] NULL,
	[AbsentDay] [float] NULL,
	[LaterM] [int] NULL,
	[LaterT] [int] NULL,
	[EarlyM] [int] NULL,
	[EarlyT] [int] NULL,
	[AbsentM] [int] NULL,
	[AbsentT] [int] NULL,
	[illM] [int] NULL,
	[AffairM] [int] NULL,
	[PubRestM] [int] NULL,
	[YearM] [int] NULL,
	[MarrigeM] [int] NULL,
	[MournM] [int] NULL,
	[MaternityM] [int] NULL,
	[EvectionM] [int] NULL,
	[EgressM] [int] NULL,
	[EgressT] [int] NULL,
	[Over1M] [int] NULL,
	[Over2M] [int] NULL,
	[Over3M] [int] NULL,
	[OverSum] [int] NULL,
	[Remark] [varchar](50) NULL
)
end;
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_Att_SumMonth]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
CREATE TABLE [dbo].[T_Att_SumMonth](
	[P_Key] [numeric](38, 0) IDENTITY(1,1) NOT NULL,
	[Person_Key] [bigint] NULL,
	[DepName] [varchar](30) NULL,
	[sName] [varchar](30) NULL,
	[PersonIDCard] [varchar](32) NULL,
	[AttDate] [varchar](7) NULL,
	[AllTimeLenH] [float] NULL,
	[OnDutyH] [float] NULL,
	[ShallDay] [float] NULL,
	[FactDay] [float] NULL,
	[AbsentDay] [float] NULL,
	[LaterM] [int] NULL,
	[LaterT] [int] NULL,
	[EarlyM] [int] NULL,
	[EarlyT] [int] NULL,
	[AbsentH] [float] NULL,
	[AbsentT] [int] NULL,
	[illH] [float] NULL,
	[AffairH] [float] NULL,
	[PubRestH] [float] NULL,
	[YearH] [float] NULL,
	[MarrigeH] [float] NULL,
	[MournH] [float] NULL,
	[MaternityH] [float] NULL,
	[EvectionH] [float] NULL,
	[EgressH] [float] NULL,
	[EgressT] [int] NULL,
	[Over1H] [float] NULL,
	[Over2H] [float] NULL,
	[Over3H] [float] NULL,
	[OverSum] [float] NULL,
	[Remark] [varchar](50) NULL
)
ALTER TABLE [dbo].[T_Att_SumMonth] ADD PRIMARY KEY ([P_Key])
end;
GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_Att_TempMonth]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
CREATE TABLE [dbo].[T_Att_TempMonth](
	[Person_Key] [bigint] NULL,
	[DepNo] [varchar](10) NULL,
	[DepName] [varchar](30) NULL,
	[sName] [varchar](30) NULL,
	[PersonIDCard] [varchar](32) NULL,
	[AttDate] [varchar](7) NULL,
	[AllTimeLenH] [float] NULL,
	[OnDutyH] [float] NULL,
	[ShallDay] [float] NULL,
	[FactDay] [float] NULL,
	[AbsentDay] [float] NULL,
	[LaterM] [int] NULL,
	[LaterT] [int] NULL,
	[EarlyM] [int] NULL,
	[EarlyT] [int] NULL,
	[AbsentH] [float] NULL,
	[AbsentT] [int] NULL,
	[illH] [float] NULL,
	[AffairH] [float] NULL,
	[PubRestH] [float] NULL,
	[YearH] [float] NULL,
	[MarrigeH] [float] NULL,
	[MournH] [float] NULL,
	[MaternityH] [float] NULL,
	[EvectionH] [float] NULL,
	[EgressH] [float] NULL,
	[EgressT] [int] NULL,
	[Over1H] [float] NULL,
	[Over2H] [float] NULL,
	[Over3H] [float] NULL
)
end;
GO
/*
Navicat SQL Server Data Transfer

Source Server         : SqlServer2005
Source Server Version : 90000
Source Host           : DESKTOP-LH62VD4\SQLSERVER2005:1433
Source Database       : AWOCS_9.9
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 90000
File Encoding         : 65001

Date: 2019-09-16 18:56:10
*/


-- ----------------------------
-- Table structure for T_Com_SysPara
-- ----------------------------
if  exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_Com_SysPara]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
DROP TABLE [dbo].[T_Com_SysPara]
end;
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_Com_SysPara]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
CREATE TABLE [dbo].[T_Com_SysPara] (
[P_Key] numeric(38) NOT NULL IDENTITY(1,1) ,
[sName] varchar(20) NULL ,
[Value1] float(53) NULL ,
[Content] varchar(100) NULL 
)
end;

GO
DBCC CHECKIDENT(N'[dbo].[T_Com_SysPara]', RESEED, 253)
GO

-- ----------------------------
-- Records of T_Com_SysPara
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_Com_SysPara] ON
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'1', N'P_VehiSitCount', N'2000', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'2', N'P_CardBoxCount', N'200', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'3', N'P_MayDownCard', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'4', N'P_MayMonitorFee', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'5', N'P_CalcCardCount', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'6', N'P_ImageKeepTime', N'15', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'7', N'P_MayDelImage', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'8', N'C_ReaderType', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'9', N'D_OnceDownAuthCount', N'500', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'10', N'D_DownOneAuthTime', N'10', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'11', N'P_CountLimitValue', N'100', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'12', N'P_VehicleSitType', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'13', N'C_SubSysManageCard', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'14', N'C_SubSysManagePerson', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'15', N'C_LostFee', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'16', N'C_Deposit', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'17', N'C_CardAppMode', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'18', N'C_DatebaseVersion', N'9.9', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'19', N'Con_CanDestory', N'3', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'20', N'Con_DefaultMoney', N'100', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'21', N'P_MaySelectVehiType', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'22', N'P_OnlyDownVisitant', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'23', N'Lk_OutTime', N'14', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'24', N'Lk_TempRoomFee', N'80', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'25', N'Lk_LastHandTakeTime', N'39740.4506', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'26', N'Lk_MakeCardDelayTime', N'15', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'27', N'P_ReadFreeFeeData', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'28', N'P_OutUseReader', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'29', N'Lk_10Alarm', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'30', N'Lk_RelockAlarm', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'31', N'Lk_SampleLock', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'32', N'Lk_UnLockAlarm', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'33', N'Lk_GuestParkFree', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'34', N'Lk_UsePublicSector', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'35', N'Lk_PublicSector', N'5', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'36', N'P_RefuseOverdueCard', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'37', N'P_OverWarningDays', N'7', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'38', N'P_LockFreeKey', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'39', N'IPT_ValidFPY', N'98', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'40', N'P_MultiCharge', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'41', N'P_LockOpenKey', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'42', N'P_TCChargeSegTime', N'30', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'43', N'Rd_DefVehicleType', N'8', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'44', N'Rd_DefChargeType', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'45', N'Rd_DefAuthDays', N'365', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'46', N'Rd_PriceRate', N'10', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'47', N'Rd_DefChargeMode', N'2', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'48', N'Rd_DefGuestType', N'2', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'49', N'Rd_GreenLightDelay', N'10', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'50', N'P_LockComputer', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'51', N'P_FullSitNoEnter', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'52', N'Rd_ETCInterval', N'30', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'53', N'Att_StartDay', N'66', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'54', N'Att_MinLate', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'55', N'Att_MaxLate', N'30', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'56', N'Att_MinEarly', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'57', N'Att_MaxEarly', N'30', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'58', N'Att_LateEarlyIsDuty', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'59', N'Att_MinOvertime', N'30', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'60', N'Att_EarlyOnIsOver', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'61', N'Att_LateOffIsOver', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'62', N'Att_LateOffDecTime', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'63', N'Att_WorkOverCondi', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'64', N'Att_RestOverCondi', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'65', N'Att_RestOverCalc', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'66', N'Att_MaxDayOvertime', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'67', N'Att_MaxMonthOvertime', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'68', N'Att_OverTimeMode', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'69', N'P_FullSitFixNoEnter', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'70', N'P_RecogniseType', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'71', N'P_VehiRecType', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'72', N'Rd_CheckCardValid', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'73', N'Mem_AwokeTime', N'5', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'74', N'C_DemoMode', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'75', N'P_FixCardCheckOut', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'76', N'P_PrintList', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'77', N'P_0MoneyAutoUP', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'78', N'P_AutoRunDataTide', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'79', N'P_FixCardHint', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'80', N'P_ImageQuality', N'80', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'81', N'P_DefaultVehiWord', null, N'粤')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'82', N'P_OutSingleForm', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'83', N'P_InDefaultInfo', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'84', N'P_OutDefaultInfo', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'85', N'P_TempChargeMode', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'86', N'P_ChargeTime', N'3', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'87', N'P_VehiNumRecMode', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'88', N'P_VehiNumWord1', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'89', N'P_VehiNumWord2', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'90', N'P_VehiNumWord3', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'91', N'P_VehiNumWord4', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'92', N'P_VehiNumWord5', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'93', N'P_VehiNumWord6', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'94', N'P_VehiNumWord7', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'95', N'P_VehiNumWord8', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'96', N'P_VehiNumWord9', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'97', N'P_VehiNumWord10', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'98', N'P_VehiNumChar1', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'99', N'P_VehiNumChar2', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'100', N'P_VehiNumChar3', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'101', N'P_VehiNumChar4', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'102', N'P_VehiNumChar5', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'103', N'P_VehiNumChar6', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'104', N'P_VehiNumChar7', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'105', N'P_VehiNumChar8', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'106', N'P_VehiNumChar9', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'107', N'P_VehiNumChar10', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'108', N'P_VehiNumChar11', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'109', N'P_VehiNumChar12', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'110', N'P_VehiNumRecType', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'111', N'P_VIPMayReInOut', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'112', N'P_VehiNumRecAllDef', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'113', N'P_VehiWordReplace', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'114', N'P_CrediblePlateValue', N'500', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'115', N'P_AllowUnRecognizeIn', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'116', N'P_ImageSaveTo', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'117', N'C_ParkSectorID', N'51', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'118', N'C_ParkSectorPSW', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'119', N'OEM_CompanyName', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'120', N'OEM_ProductName', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'121', N'OEM_ServicePhone', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'122', N'P_OpenGateSnap', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'123', N'P_TriggerSnap', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'124', N'C_LastUseTime', N'22282.9314', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'125', N'P_Cumulative', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'126', N'C_TempFileDrive', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'127', N'P_0MoneySendVoice', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'128', N'P_InputHandReason', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'129', N'P_1PsnToNVehi', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'130', N'P_CheckControlAuth', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'131', N'P_FreeMode', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'132', N'P_DefaultFreeTime', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'133', N'P_DefaultFreeMoney', N'5', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'134', N'P_CustomizeLock', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'135', N'P_LockSectorID', N'13', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'136', N'P_LockPassword', null, N'FFFFFFFFFFFF')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'137', N'Mem_IndustryType', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'138', N'P_InOnlyDisplaySit', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'139', N'P_InParkUpGate', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'140', N'P_DefBeginFeeTime', N'36526', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'141', N'P_DefEndFeeTime', N'36526.25', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'142', N'P_QueryMasterInfo', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'143', N'P_AutoDownAuth', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'144', N'P_VehiMatchSpace', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'145', N'P_TempOverDayLastSeg', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'146', N'P_TempOverSegLastSeg', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'147', N'P_CheckOutTime', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'148', N'P_AutoUpBeginTime', N'1.15740740740741E-5', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'149', N'P_AutoUpEndTime', N'0.99998842592322', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'150', N'P_InDisplayBlankSit', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'151', N'P_InternetDiscount', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'152', N'P_OverDelayDays', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'153', N'P_OverDayTime', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'154', N'P_EditPlateByAdmin', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'155', N'P_NoneAuthAsTemp', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'156', N'P_InDefaultInfo1', null, N'减速慢行')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'157', N'P_InDefaultInfo2', null, N'车牌识别')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'158', N'P_InDefaultInfo3', null, N'智慧停车')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'159', N'P_OutDefaultInfo1', null, N'减速慢行')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'160', N'P_OutDefaultInfo2', null, N'车牌识别')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'161', N'P_OutDefaultInfo3', null, N'智慧停车')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'162', N'P_UnattendAutoUp', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'163', N'P_UnattendBeginTime', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'164', N'P_UnattendEndTime', N'0.99998842592322', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'165', N'P_ExceptExit', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'166', N'P_RememberVehiType', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'167', N'P_OnlyQuerySelfRec', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'168', N'P_BookingVehiOpen', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'169', N'P_VoicePlate', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'170', N'P_InVoiceFix', null, N'')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'171', N'P_InVoiceTemp', null, N'')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'172', N'P_FreeChargeType', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'173', N'P_MiniDeposit', N'500', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'174', N'P_ResidualSitType', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'175', N'P_NoPasswordType', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'176', N'P_TempAutoCharge', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'177', N'P_NoEnterUpGate', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'178', N'P_1PsnNAutoUp', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'179', N'P_ShowTopUpType', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'180', N'P_MaxOweMoney', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'181', N'P_TempAutoSaveInfo', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'182', N'P_NoLocalInPark', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'183', N'P_LocalVNumber', null, N'')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'184', N'P_MayFree', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'185', N'P_CodeShow', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'186', N'P_Send485', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'187', N'P_InDefaultInfo4', null, N'欢迎光临')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'188', N'P_OutDefaultInfo4', null, N'一路平安')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'189', N'P_LockVehicle', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'190', N'P_ResidualSitTemp', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'191', N'P_FreeMoneyAdd', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'192', N'P_SelectFree', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'193', N'P_ShowCode', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'194', N'P_FreeWhy', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'195', N'P_PeakCardTcLevel', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'196', N'C_RegistryCode', null, null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'197', N'P_NewEnergy', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'198', N'P_OpenGate', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'199', N'P_TwoCharge', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'200', N'P_InColor1', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'201', N'P_InColor2', N'2', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'202', N'P_InColor3', N'2', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'203', N'P_InColor4', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'204', N'P_OutColor1', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'205', N'P_OutColor2', N'2', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'206', N'P_OutColor3', N'2', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'207', N'P_OutColor4', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'208', N'P_OfficeChargeOpen', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'209', N'P_OfficeChargeForm', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'210', N'P_ShowVoiceText', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'211', N'P_OfficeChargeDir', null, N'C:\')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'212', N'P_DefaultFrontWord', null, N'粤B')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'213', N'P_areaCode', null, N'')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'214', N'P_Latitude', null, N'')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'215', N'P_longitude', null, N'')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'216', N'P_stationId', null, N'')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'217', N'P_stationName', null, N'')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'218', N'P_location', null, N'')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'219', N'P_dareaname', null, N'')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'220', N'P_dareacode', null, N'')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'221', N'P_vendor', null, N'')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'222', N'P_FullTempSitNoEnter', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'223', N'P_FullFixSitNoEnter', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'224', N'P_SystemCompanyName', null, N'6666666666666666666666')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'225', N'P_CheckVehicleLock', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'226', N'P_CenterMoney', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'227', N'P_ChargeZero', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'228', N'P_PersonSignIn', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'229', N'P_NoEnterNewEnergy', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'230', N'P_NewEnergyTKey', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'231', N'P_Polic', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'232', N'P_PolicTcLevelKey', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'233', N'P_BlueTcLevel', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'234', N'P_BlueTcLevelKey', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'235', N'P_YellowTcLevel', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'236', N'P_YellowTcLevelKey', N'4', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'237', N'P_ShowMonthInfo', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'238', N'P_CenterRefresh', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'239', N'P_TimeOutChargeTime', N'15', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'240', N'P_CenterQueryAll', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'241', N'P_HandInPark', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'242', N'P_HandOutPark', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'243', N'P_FreeList', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'244', N'P_FreeListAdd', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'245', N'P_RentInPark', N'1', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'246', N'P_MonthInPark', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'247', N'P_OverdueTclevel', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'248', N'P_cmbxAutoAs', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'249', N'P_SureEnterType', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'250', N'P_SEBookingTime', N'0', null)
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'251', N'P_SerialNumber', null, N'')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'252', N'P_EquipmentType', null, N'03')
GO
GO
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'253', N'P_PlaceType', null, N'01')
GO
GO
SET IDENTITY_INSERT [dbo].[T_Com_SysPara] OFF
GO
ALTER TABLE [dbo].[T_Com_SysPara] ADD PRIMARY KEY ([P_Key])
GO
--考勤统计相关表
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_ATT_TempCalc]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
  CREATE TABLE [dbo].[T_ATT_TempCalc](
	[P_Key] [numeric](38, 0) IDENTITY(1,1) NOT NULL,
	[Person_Key] [bigint] NULL,
	[PlanDate] [datetime] NULL,
	[WeekOfDay] [int] NULL,
	[IsHoliday] [int] NULL,
	[AttendType] [int] NULL,
	[RestType] [int] NULL,
	[Class_Key] [int] NULL,
	[ClassNo] [varchar](10) NULL,
	[ClassName] [varchar](30) NULL,
	[Seg1Enabled] [int] NULL,
	[Seg1Type] [int] NULL,
	[Seg1BeginTime] [varchar](20) NULL,
	[Seg1EndTime] [varchar](20) NULL,
	[Seg1OnTime] [varchar](20) NULL,
	[Seg1OffTime] [varchar](20) NULL,
	[Seg1TimeLen] [int] NULL,
	[Seg1CheckOn] [int] NULL,
	[Seg1CheckOff] [int] NULL,
	[Seg1CalcLate] [int] NULL,
	[Seg1CalcEarly] [int] NULL,
	[Seg1CalcAbsent] [int] NULL,
	[Seg1CalcLeave] [int] NULL,
	[Seg2Enabled] [int] NULL,
	[Seg2Type] [int] NULL,
	[Seg2BeginTime] [varchar](20) NULL,
	[Seg2EndTime] [varchar](20) NULL,
	[Seg2OnTime] [varchar](20) NULL,
	[Seg2OffTime] [varchar](20) NULL,
	[Seg2TimeLen] [int] NULL,
	[Seg2CheckOn] [int] NULL,
	[Seg2CheckOff] [int] NULL,
	[Seg2CalcLate] [int] NULL,
	[Seg2CalcEarly] [int] NULL,
	[Seg2CalcAbsent] [int] NULL,
	[Seg2CalcLeave] [int] NULL,
	[Seg3Type] [int] NULL,
	[Seg3Enabled] [int] NULL,
	[Seg3BeginTime] [varchar](20) NULL,
	[Seg3EndTime] [varchar](20) NULL,
	[Seg3OnTime] [varchar](20) NULL,
	[Seg3OffTime] [varchar](20) NULL,
	[Seg3TimeLen] [int] NULL,
	[Seg3CheckOn] [int] NULL,
	[Seg3CheckOff] [int] NULL,
	[Seg3CalcLate] [int] NULL,
	[Seg3CalcEarly] [int] NULL,
	[Seg3CalcAbsent] [int] NULL,
	[Seg3CalcLeave] [int] NULL,
	[Dep_Key] [int] NULL,
	[DepName] [varchar](30) NULL,
	[sName] [varchar](30) NULL,
	[PersonIDCard] [varchar](32) NULL,
	[Seg1BBTime] [datetime] NULL,
	[Seg1BETime] [datetime] NULL,
	[Seg1BTime] [datetime] NULL,
	[Seg1BFactTime] [datetime] NULL,
	[Seg1BResult] [int] NULL,
	[Seg1BValue] [int] NULL,
	[Seg1EBTime] [datetime] NULL,
	[Seg1EETime] [datetime] NULL,
	[Seg1ETime] [datetime] NULL,
	[Seg1EFactTime] [datetime] NULL,
	[Seg1EResult] [int] NULL,
	[Seg1EValue] [int] NULL,
	[Seg1Work] [int] NULL,
	[Seg1Over] [int] NULL,
	[Seg2BBTime] [datetime] NULL,
	[Seg2BETime] [datetime] NULL,
	[Seg2BTime] [datetime] NULL,
	[Seg2BFactTime] [datetime] NULL,
	[Seg2BResult] [int] NULL,
	[Seg2BValue] [int] NULL,
	[Seg2EBTime] [datetime] NULL,
	[Seg2EETime] [datetime] NULL,
	[Seg2ETime] [datetime] NULL,
	[Seg2EFactTime] [datetime] NULL,
	[Seg2EResult] [int] NULL,
	[Seg2EValue] [int] NULL,
	[Seg2Work] [int] NULL,
	[Seg2Over] [int] NULL,
	[Seg3BBTime] [datetime] NULL,
	[Seg3BETime] [datetime] NULL,
	[Seg3BTime] [datetime] NULL,
	[Seg3BFactTime] [datetime] NULL,
	[Seg3BResult] [int] NULL,
	[Seg3BValue] [int] NULL,
	[Seg3EBTime] [datetime] NULL,
	[Seg3EETime] [datetime] NULL,
	[Seg3ETime] [datetime] NULL,
	[Seg3EFactTime] [datetime] NULL,
	[Seg3EResult] [int] NULL,
	[Seg3EValue] [int] NULL,
	[Seg3Work] [int] NULL,
	[Seg3Over] [int] NULL,
	[AllTimeLen] [int] NULL,
	[OnDutyM] [int] NULL,
	[ShallDay] [float] NULL,
	[FactDay] [float] NULL,
	[AbsentDay] [float] NULL,
	[LaterM] [int] NULL,
	[LaterT] [int] NULL,
	[EarlyM] [int] NULL,
	[EarlyT] [int] NULL,
	[AbsentM] [int] NULL,
	[AbsentT] [int] NULL,
	[illM] [int] NULL,
	[AffairM] [int] NULL,
	[PubRestM] [int] NULL,
	[YearM] [int] NULL,
	[MarrigeM] [int] NULL,
	[MournM] [int] NULL,
	[MaternityM] [int] NULL,
	[EvectionM] [int] NULL,
	[EgressM] [int] NULL,
	[EgressT] [int] NULL,
	[Over1M] [int] NULL,
	[Over2M] [int] NULL,
	[Over3M] [int] NULL
)
ALTER TABLE [dbo].[T_ATT_TempCalc] ADD PRIMARY KEY ([P_Key])
ALTER TABLE [dbo].[T_ATT_TempCalc]  WITH CHECK ADD  CONSTRAINT [FK_T_ATT_Temp_T_BD_Person] FOREIGN KEY([Person_Key])
REFERENCES [dbo].[T_BD_Person] ([P_Key])
ON UPDATE CASCADE
ON DELETE CASCADE
ALTER TABLE [dbo].[T_ATT_TempCalc] CHECK CONSTRAINT [FK_T_ATT_Temp_T_BD_Person]
end;
GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_Att_TempIOTime]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
CREATE TABLE [dbo].[T_Att_TempIOTime](
	[P_Key] [numeric](38, 0) NOT NULL,
	[Person_Key] [bigint] NULL,
	[IOTime] [datetime] NULL,
	[Class_Key] [int] NULL,
	[SegWork] [int] NULL
)
end;
GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_Att_TempMonth]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
CREATE TABLE [dbo].[T_Att_TempMonth](
	[Person_Key] [bigint] NULL,
	[DepNo] [varchar](10) NULL,
	[DepName] [varchar](30) NULL,
	[sName] [varchar](30) NULL,
	[PersonIDCard] [varchar](32) NULL,
	[AttDate] [varchar](7) NULL,
	[AllTimeLenH] [float] NULL,
	[OnDutyH] [float] NULL,
	[ShallDay] [float] NULL,
	[FactDay] [float] NULL,
	[AbsentDay] [float] NULL,
	[LaterM] [int] NULL,
	[LaterT] [int] NULL,
	[EarlyM] [int] NULL,
	[EarlyT] [int] NULL,
	[AbsentH] [float] NULL,
	[AbsentT] [int] NULL,
	[illH] [float] NULL,
	[AffairH] [float] NULL,
	[PubRestH] [float] NULL,
	[YearH] [float] NULL,
	[MarrigeH] [float] NULL,
	[MournH] [float] NULL,
	[MaternityH] [float] NULL,
	[EvectionH] [float] NULL,
	[EgressH] [float] NULL,
	[EgressT] [int] NULL,
	[Over1H] [float] NULL,
	[Over2H] [float] NULL,
	[Over3H] [float] NULL
)
end;
GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_Att_IORecord]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
CREATE TABLE [dbo].[T_Att_IORecord](
	[Person_Key] [bigint] NULL,
	[IOTime] [datetime] NULL
) ON [PRIMARY]
end;
GO


if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_Att_SumSign]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
CREATE TABLE [dbo].[T_Att_SumSign](
	[Person_Key] [numeric](38, 0) NULL,
	[DepName] [varchar](30) NULL,
	[sWorkNo] [varchar](15) NULL,
	[sName] [varchar](30) NULL,
	[A1] [varchar](10) NULL,
	[P1] [varchar](10) NULL,
	[A2] [varchar](10) NULL,
	[P2] [varchar](10) NULL,
	[A3] [varchar](10) NULL,
	[P3] [varchar](10) NULL,
	[A4] [varchar](10) NULL,
	[P4] [varchar](10) NULL,
	[A5] [varchar](10) NULL,
	[P5] [varchar](10) NULL,
	[A6] [varchar](10) NULL,
	[P6] [varchar](10) NULL,
	[A7] [varchar](10) NULL,
	[P7] [varchar](10) NULL,
	[A8] [varchar](10) NULL,
	[P8] [varchar](10) NULL,
	[A9] [varchar](10) NULL,
	[P9] [varchar](10) NULL,
	[A10] [varchar](10) NULL,
	[P10] [varchar](10) NULL,
	[A11] [varchar](10) NULL,
	[P11] [varchar](10) NULL,
	[A12] [varchar](10) NULL,
	[P12] [varchar](10) NULL,
	[A13] [varchar](10) NULL,
	[P13] [varchar](10) NULL,
	[A14] [varchar](10) NULL,
	[P14] [varchar](10) NULL,
	[A15] [varchar](10) NULL,
	[P15] [varchar](10) NULL,
	[A16] [varchar](10) NULL,
	[P16] [varchar](10) NULL,
	[A17] [varchar](10) NULL,
	[P17] [varchar](10) NULL,
	[A18] [varchar](10) NULL,
	[P18] [varchar](10) NULL,
	[A19] [varchar](10) NULL,
	[P19] [varchar](10) NULL,
	[A20] [varchar](10) NULL,
	[P20] [varchar](10) NULL,
	[A21] [varchar](10) NULL,
	[P21] [varchar](10) NULL,
	[A22] [varchar](10) NULL,
	[P22] [varchar](10) NULL,
	[A23] [varchar](10) NULL,
	[P23] [varchar](10) NULL,
	[A24] [varchar](10) NULL,
	[P24] [varchar](10) NULL,
	[A25] [varchar](10) NULL,
	[P25] [varchar](10) NULL,
	[A26] [varchar](10) NULL,
	[P26] [varchar](10) NULL,
	[A27] [varchar](10) NULL,
	[P27] [varchar](10) NULL,
	[A28] [varchar](10) NULL,
	[P28] [varchar](10) NULL,
	[A29] [varchar](10) NULL,
	[P29] [varchar](10) NULL,
	[A30] [varchar](10) NULL,
	[P30] [varchar](10) NULL,
	[A31] [varchar](10) NULL,
	[P31] [varchar](10) NULL
) ON [PRIMARY]
end;
GO

delete from [T_BD_Permission] where P_Key>=300;

SET IDENTITY_INSERT [T_BD_Permission] ON  --关闭
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'300', N'考勤设置', N'1', null, N'2019-09-02 10:20:16.153', null, N'0', N'kqSetting.png', N'5')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'308', N'考勤处理', N'1', null, N'2019-09-16 14:58:38.997', null, N'0', N'kaoqin.png', N'5')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'311', N'考勤查询', N'1', null, N'2019-09-16 15:00:30.977', null, N'0', N'kqQuery.png', N'5')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'301', N'假日设置', N'2', null, N'2019-09-02 10:25:48.687', N'300', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'302', N'班次设置', N'2', null, N'2019-09-02 11:47:59.510', N'300', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'303', N'轮班设置', N'2', null, N'2019-09-02 18:42:46.930', N'300', N'0', null, N'3')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'304', N'考勤规则', N'2', null, N'2019-09-04 16:53:38.300', N'300', N'0', null, N'4')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'305', N'轮班排班', N'2', null, N'2019-09-05 11:53:14.407', N'308', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'306', N'调班登记', N'2', null, N'2019-09-10 16:40:33.590', N'308', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'307', N'异常登记', N'2', null, N'2019-09-10 20:14:04.000', N'308', N'0', null, N'3')
GO
GO

INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'309', N'加班审核', N'2', null, N'2019-09-16 14:59:33.000', N'308', N'0', null, N'4')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'310', N'手工签卡', N'2', null, N'2019-09-16 15:00:13.000', N'308', N'0', null, N'5')
GO
GO

INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'312', N'考勤统计', N'2', null, N'2019-09-16 15:01:20.000', N'311', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'313', N'考勤符号', N'2', null, N'2019-09-16 15:01:39.000', N'311', N'0', null, N'2')
GO
GO
SET IDENTITY_INSERT [dbo].[T_BD_Permission] OFF
GO

delete from [T_Att_ClassType] 
GO
SET IDENTITY_INSERT [dbo].[T_Att_ClassType] ON
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'1', N'0101', N'白班', N'1', N'0', N'0', N'0', N'1', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'2', N'0102', N'晚班', N'1', N'0', N'0', N'0', N'1', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'3', N'0180', N'应出勤', N'0', N'0', N'0', N'0', N'1', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'4', N'0181', N'实出勤', N'0', N'0', N'0', N'0', N'1', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'5', N'0184', N'调班', N'1', N'0', N'0', N'0', N'1', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'6', N'0201', N'平时加班', N'1', N'0', N'0', N'0', N'2', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'7', N'0202', N'公休加班', N'1', N'0', N'0', N'0', N'2', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'8', N'0203', N'节日加班', N'1', N'0', N'0', N'0', N'2', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'9', N'0301', N'公休', N'1', N'0', N'0', N'0', N'3', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'10', N'0401', N'事假', N'1', N'0', N'0', N'0', N'4', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'11', N'0402', N'病假', N'1', N'0', N'0', N'0', N'4', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'12', N'0403', N'年假', N'1', N'0', N'0', N'0', N'4', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'13', N'0404', N'婚假', N'1', N'0', N'0', N'0', N'4', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'14', N'0501', N'出差', N'1', N'0', N'0', N'0', N'5', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'15', N'0601', N'外出', N'1', N'0', N'0', N'0', N'6', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'16', N'0602', N'外出(次)', N'3', N'0', N'0', N'0', N'6', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'17', N'0701', N'迟到', N'2', N'0', N'0', N'0', N'7', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'18', N'0702', N'迟到(次)', N'3', N'0', N'0', N'0', N'7', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'19', N'0703', N'早退', N'2', N'0', N'0', N'0', N'7', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'20', N'0704', N'早退(次)', N'3', N'0', N'0', N'0', N'7', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'21', N'0705', N'缺勤', N'1', N'0', N'0', N'0', N'7', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'22', N'0706', N'缺勤(次)', N'3', N'0', N'0', N'0', N'7', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'23', N'0707', N'应签到', N'3', N'0', N'0', N'0', N'7', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'24', N'0708', N'未签到', N'3', N'0', N'0', N'0', N'7', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'25', N'0405', N'产假', N'1', N'0', N'0', N'0', N'4', N'1')
GO
GO
INSERT INTO [dbo].[T_Att_ClassType] ([P_Key], [TypeNo], [TypeName], [TypeUint], [IgnoreValue], [RoundType], [RoundValue], [ResultType], [SysPara]) VALUES (N'26', N'0406', N'丧假', N'1', N'0', N'0', N'0', N'4', N'1')
GO
GO
SET IDENTITY_INSERT [dbo].[T_Att_ClassType] OFF
GO