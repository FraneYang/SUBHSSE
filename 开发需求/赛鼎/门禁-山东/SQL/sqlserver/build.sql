GO
/****** 对象:  Table [dbo].[T_BD_CardRecords_ParkOut]    脚本日期: 08/30/2019 10:51:30 ******/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_CardRecords_ParkOut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_CardRecords_ParkOut](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[EntranceControlNumber] [int] NULL,
	[PersonIDCard] [varchar](255) NULL,
	[EntranceTime] [datetime] NULL,
	[Remark] [text] NULL,
	[EntranceImagePath] [varchar](500) NULL,
	[EntranceControlName] [varchar](500) NULL,
	[LeaveControlNumber] [int] NULL,
	[LeaveControlName] [varchar](500) NULL,
	[LeaveTime] [datetime] NULL,
	[LeaveImagePath] [varchar](500) NULL,
	[EntranceOperatorName] [varchar](255) NULL,
	[LeaveOperatorName] [varchar](255) NULL,
	[StopTime] [varchar](255) NULL,
 CONSTRAINT [T_BD_CardRecords_ParkOut11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END

GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_CardRecords_ParkOut]') AND name = N'out_LeaveControlNumber')
CREATE NONCLUSTERED INDEX [out_LeaveControlNumber] ON [dbo].[T_BD_CardRecords_ParkOut] 
(
	[LeaveControlNumber] ASC
)WITH  (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_CardRecords_ParkOut]') AND name = N'out_LeaveTime')
CREATE NONCLUSTERED INDEX [out_LeaveTime] ON [dbo].[T_BD_CardRecords_ParkOut] 
(
	[LeaveTime] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_CardRecords_ParkOut]') AND name = N'out_PersonIDCard')
CREATE NONCLUSTERED INDEX [out_PersonIDCard] ON [dbo].[T_BD_CardRecords_ParkOut] 
(
	[PersonIDCard] ASC
)WITH ( IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[T_BD_CardRecords]    脚本日期: 08/30/2019 10:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_CardRecords]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_CardRecords](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[EntranceControlNumber] [int] NULL,
	[PersonIDCard] [varchar](255) NULL,
	[EntranceTime] [datetime] NULL,
	[Remark] [text] NULL,
	[EntranceImagePath] [varchar](500) NULL,
	[EntranceControlName] [varchar](500) NULL,
	[LeaveControlNumber] [int] NULL,
	[LeaveControlName] [varchar](500) NULL,
	[LeaveTime] [datetime] NULL,
	[LeaveImagePath] [varchar](500) NULL,
	[EntranceOperatorName] [varchar](255) NULL,
	[LeaveOperatorName] [varchar](255) NULL,
CONSTRAINT [T_BD_CardRecords11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_Role]    脚本日期: 08/30/2019 10:52:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_Role]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_Role](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](255) NULL,
	[Remark] [text] NULL,
	[CreateTime] [datetime] NULL,
	[IsDelete] [int] NULL DEFAULT ((0)),
	[DeleteTime] [datetime] NULL,
	[DeleteUserName] [varchar](50) NULL,
CONSTRAINT [T_BD_Role11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_Park]    脚本日期: 08/30/2019 10:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_Park]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_Park](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[ParkName] [varchar](50) NULL,
	[Parent_Key] [bigint] NULL,
	[Remark] [text] NULL,
	[CreateTime] [datetime] NULL,
CONSTRAINT [T_BD_Park11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_LoginLog]    脚本日期: 08/30/2019 10:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_LoginLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_LoginLog](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[HostName] [varchar](50) NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [T_BD_LoginLog11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_LoginLog]') AND name = N'HostName')
CREATE NONCLUSTERED INDEX [HostName] ON [dbo].[T_BD_LoginLog] 
(
	[HostName] ASC
)WITH ( IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_LoginLog]') AND name = N'UserName')
CREATE NONCLUSTERED INDEX [UserName] ON [dbo].[T_BD_LoginLog] 
(
	[UserName] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[T_BD_DepartmentLog]    脚本日期: 08/30/2019 10:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_DepartmentLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_DepartmentLog](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[Parent_Key] [bigint] NULL,
	[DepNo] [varchar](50) NULL,
	[DepName] [varchar](50) NULL,
	[DepSName] [varchar](50) NULL,
	[DepLevel] [int] NULL,
	[Address] [varchar](255) NULL,
	[WeaveCount] [int] NULL,
	[Phone] [varchar](50) NULL,
	[DepFunction] [text] NULL,
	[DepAuthority] [text] NULL,
	[DepDuty] [text] NULL,
	[Manager] [varchar](50) NULL,
	[SetTemp] [int] NULL,
	[Remark] [text] NULL,
	[CreateTime] [datetime] NULL,
	[IsDelete] [int] NULL DEFAULT ((0)),
	[DeleteTime] [datetime] NULL,
	[DeleteUserName] [varchar](50) NULL,
	[OpType] [int] NULL,
	[OperatorName] [varchar](50) NULL,
	[OpTime] [datetime] NULL DEFAULT (getdate()),
	[UpSelfPlat] [int] NULL DEFAULT ((0)),
	[OperatorType] [tinyint] NULL DEFAULT ((1)),
	[DepInterNomber] [bigint] NULL,
 CONSTRAINT [T_BD_DepartmentLog11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_Control_Category]    脚本日期: 08/30/2019 10:51:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_Control_Category]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_Control_Category](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryNumber] [int] NULL,
	[CategoryName] [varchar](255) NULL,
 CONSTRAINT [T_BD_Control_Category11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_Control_Type]    脚本日期: 08/30/2019 10:51:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_Control_Type]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_Control_Type](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryNumber] [int] NULL,
	[TypeName] [varchar](255) NULL,
	[ServerType] [int] NULL,
	[Remark] [varchar](255) NULL,
 CONSTRAINT [T_BD_Control_Type11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_PersonLog]    脚本日期: 08/30/2019 10:52:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_PersonLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_PersonLog](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[DepInterNomber] [bigint] NULL,
	[PersonName] [varchar](50) NULL,
	[PersonSex] [char](2) NULL,
	[PersonPhone] [varchar](50) NULL,
	[PersonBirthday] [varchar](50) NULL,
	[PersonIDCard] [varchar](50) NULL,
	[PersonComeDate] [datetime] NULL,
	[PersonOutDate] [datetime] NULL,
	[PersonPhoto] [image] NULL,
	[Remark] [text] NULL,
	[CreateTime] [datetime] NULL DEFAULT (getdate()),
	[AuthGroupInterNomber] [bigint] NULL,
	[PersonTitle] [varchar](50) NULL,
	[IsDelete] [int] NULL DEFAULT ((0)),
	[DeleteTime] [datetime] NULL,
	[DeleteUserName] [varchar](50) NULL,
	[OpType] [int] NULL,
	[OperatorName] [varchar](50) NULL,
	[OpTime] [datetime] NULL DEFAULT (getdate()),
	[UpSelfPlat] [int] NULL DEFAULT ((0)),
	[OperatorType] [tinyint] NULL DEFAULT ((1)),
	[PersonCardPhoto] [image] NULL,
	[PersonInterNomber] [bigint] NULL,
	[ValidTimeStart] [datetime] NULL,
	[ValidTimeEnd] [datetime] NULL,
	[IsDeparture] [int] NULL,
	[WorkType] [int] NULL,
	[IsWhiteList] [int] NULL DEFAULT ((0)),
	[WhiteListState] [int] NULL DEFAULT ((0)),
	[ICCardNumber] [varchar](50) NULL,
	[X] [int] NULL,
	[Y] [int] NULL,
	[W] [int] NULL,
	[H] [int] NULL,
	[PersonAddress] [varchar](255) NULL,
	[PersonNation] [varchar](255) NULL,
	[PersonIssuingDept] [varchar](255) NULL,
	[IDBeginDate] [varchar](50) NULL,
	[IDEndDate] [varchar](50) NULL,
	[RandomKey] [bigint] NULL,
 CONSTRAINT [T_BD_PersonLog11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_PersonLog]') AND name = N'personIDCard')
CREATE NONCLUSTERED INDEX [personIDCard] ON [dbo].[T_BD_PersonLog] 
(
	[PersonIDCard] ASC
)WITH ( IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[T_BD_LEDLeaf]    脚本日期: 08/30/2019 10:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_LEDLeaf]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_LEDLeaf](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[LEDScreenKey] [bigint] NULL,
	[LeafNunber] [int] NULL,
	[LeafWait] [int] NULL,
	[LEDRows] [int] NULL,
 CONSTRAINT [T_BD_LEDLeaf11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** 对象:  Table [dbo].[T_BD_LEDLeafRow]    脚本日期: 08/30/2019 10:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_LEDLeafRow]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_LEDLeafRow](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[LEDScreenKey] [bigint] NOT NULL,
	[LEDLeaf] [tinyint] NOT NULL,
	[RowIndex] [tinyint] NOT NULL,
	[RowText] [nvarchar](200) NOT NULL,
	[TextFont] [nvarchar](20) NOT NULL,
	[fontsize] [tinyint] NOT NULL,
	[spacing] [tinyint] NOT NULL DEFAULT ((0)),
	[ShowWatchEvent] [tinyint] NOT NULL DEFAULT ((0)),
	[defLeft] [int] NOT NULL DEFAULT ((0)),
	[defTop] [int] NOT NULL DEFAULT ((0)),
	[defWidth] [int] NOT NULL DEFAULT ((0)),
	[defHeight] [int] NOT NULL DEFAULT ((0)),
	[ShowTimeClock] [int] NOT NULL DEFAULT ((1)),
 CONSTRAINT [T_BD_LEDLeafRow11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC,
	[LEDLeaf] ASC,
	[RowIndex] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** 对象:  Table [dbo].[T_BD_Config]    脚本日期: 08/30/2019 10:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_Config]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_Config](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[ConfigName] [varchar](255) NULL,
	[ConfigValue] [varchar](500) NULL,
	[IsEnable] [int] NULL DEFAULT ((1)),
	[ConfigCode] [varchar](255) NULL,
 CONSTRAINT [T_BD_Config11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_Person_Permission]    脚本日期: 08/30/2019 10:52:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_Person_Permission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_Person_Permission](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[ValidTimeStart] [datetime] NULL,
	[ValidTimeEnd] [datetime] NULL,
CONSTRAINT [T_BD_Person_Permission11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** 对象:  Table [dbo].[T_BD_LEDScreen]    脚本日期: 08/30/2019 10:51:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_LEDScreen]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_LEDScreen](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[LEDName] [varchar](255) NULL,
	[LEDIP] [varchar](50) NULL,
	[LEDPort] [int] NULL,
	[LEDNumber] [int] NULL,
	[Remark] [text] NULL,
	[LEDState] [int] NULL DEFAULT ((1)),
	[LEDModel] [varchar](255) NULL,
	[DefaultTemplate] [varchar](255) NULL,
	[LEDWidth] [int] NULL,
	[LEDHeight] [int] NULL,
	[LEDTitle] [varchar](255) NULL,
	[LEDType] [int] NULL DEFAULT ((0)),
	[ControlType] [varchar](255) NULL,
	[ShowNotice] [int] NULL DEFAULT ((0)),
	[NoticeWidth] [int] NULL DEFAULT ((0)),
	[NoticeHeight] [int] NULL DEFAULT ((0)),
	[NoticeContent] [varchar](255) NULL,
	[NoticeFont] [varchar](255) NULL,
	[NoticeFontSize] [int] NULL DEFAULT ((12)),
CONSTRAINT [T_BD_LEDScreen11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_Holiday]    脚本日期: 08/30/2019 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_Holiday]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_Holiday](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[HolidayName] [varchar](255) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Remark] [text] NULL,
 CONSTRAINT [T_BD_Holiday11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_CardRecords_ParkIn]    脚本日期: 08/30/2019 10:51:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_CardRecords_ParkIn]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_CardRecords_ParkIn](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[EntranceControlNumber] [int] NULL,
	[PersonIDCard] [varchar](255) NULL,
	[EntranceTime] [datetime] NULL,
	[Remark] [text] NULL,
	[EntranceImagePath] [varchar](500) NULL,
	[EntranceControlName] [varchar](500) NULL,
	[LeaveControlNumber] [int] NULL,
	[LeaveControlName] [varchar](500) NULL,
	[LeaveTime] [datetime] NULL,
	[LeaveImagePath] [varchar](500) NULL,
	[EntranceOperatorName] [varchar](255) NULL,
	[LeaveOperatorName] [varchar](255) NULL,
 CONSTRAINT [T_BD_CardRecords_ParkIn11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_CardRecords_ParkIn]') AND name = N'in_EntranceControlNumber')
CREATE NONCLUSTERED INDEX [in_EntranceControlNumber] ON [dbo].[T_BD_CardRecords_ParkIn] 
(
	[EntranceControlNumber] ASC
)WITH ( IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_CardRecords_ParkIn]') AND name = N'in_EntranceTime')
CREATE NONCLUSTERED INDEX [in_EntranceTime] ON [dbo].[T_BD_CardRecords_ParkIn] 
(
	[EntranceTime] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_CardRecords_ParkIn]') AND name = N'in_PersonIDCard')
CREATE NONCLUSTERED INDEX [in_PersonIDCard] ON [dbo].[T_BD_CardRecords_ParkIn] 
(
	[PersonIDCard] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[T_BD_AuthGroup]    脚本日期: 08/30/2019 10:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_AuthGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_AuthGroup](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[AuthGroupName] [varchar](50) NULL,
	[Remark] [text] NULL,
	[CreateTime] [datetime] NULL CONSTRAINT [DF_T_BD_AuthGroup_CreateTime]  DEFAULT (getdate()),
 CONSTRAINT [T_BD_AuthGroup11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_Data]    脚本日期: 08/30/2019 10:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_Data]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_Data](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[DataType] [int] NULL,
	[DataName] [varchar](255) NULL,
	[DataValue] [int] NULL,
	[Remark] [text] NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [T_BD_Data11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_Department]    脚本日期: 08/30/2019 10:51:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_Department]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_Department](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[Parent_Key] [bigint] NULL,
	[DepNo] [varchar](50) NULL,
	[DepName] [varchar](50) NULL,
	[DepSName] [varchar](50) NULL,
	[DepLevel] [int] NULL,
	[Address] [varchar](255) NULL,
	[WeaveCount] [int] NULL,
	[Phone] [varchar](50) NULL,
	[DepFunction] [text] NULL,
	[DepAuthority] [text] NULL,
	[DepDuty] [text] NULL,
	[Manager] [varchar](50) NULL,
	[SetTemp] [int] NULL,
	[Remark] [text] NULL,
	[CreateTime] [datetime] NULL CONSTRAINT [DF_T_BD_Department_CreateTime]  DEFAULT (getdate()),
	[IsDelete] [int] NULL DEFAULT ((0)),
	[DeleteTime] [datetime] NULL,
	[DeleteUserName] [varchar](50) NULL,
	[DepInterNumber] [bigint] NULL DEFAULT ((0)),
 CONSTRAINT [T_BD_Department11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_LEDInmethod]    脚本日期: 08/30/2019 10:51:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_LEDInmethod]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_LEDInmethod](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[datavalue] [int] NULL,
	[dataname] [varchar](255) NULL,
 CONSTRAINT [T_BD_LEDInmethod11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_Permission]    脚本日期: 08/30/2019 10:51:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_Permission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_Permission](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[PermissionName] [varchar](255) NULL,
	[Type] [int] NULL,
	[Remark] [text] NULL,
	[CreateTime] [datetime] NULL DEFAULT (getdate()),
	[Parent_Key] [bigint] NULL,
	[IsDelete] [int] NULL DEFAULT ((0)),
	[Icon] [varchar](255) NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [T_BD_Permission11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_WhiteList]    脚本日期: 08/30/2019 10:52:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_WhiteList]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_WhiteList](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[ControlNumber] [int] NULL,
	[PersonName] [varchar](50) NULL,
	[PersonIDCard] [varchar](50) NULL,
	[ControlName] [varchar](50) NULL,
	[ValidTimeStart] [datetime] NULL,
	[ValidTimeEnd] [datetime] NULL,
	[PersonSex] [char](2) NULL,
 CONSTRAINT [T_BD_WhiteList11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_WhiteListLog]    脚本日期: 08/30/2019 10:52:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_WhiteListLog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_WhiteListLog](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonName] [varchar](255) NULL,
	[PersonIDCard] [varchar](500) NULL,
	[ControlNumber] [int] NULL,
	[UpdateTime] [datetime] NULL,
	[State] [int] NULL DEFAULT ((0)),
	[Tag] [int] NULL,
	[PersonLog_Key] [bigint] NULL,
	[Remark] [varchar](500) NULL,
	[Type] [int] NULL DEFAULT ((1)),
 CONSTRAINT [T_BD_WhiteListLog11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_SoftDog]    脚本日期: 08/30/2019 10:52:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_SoftDog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_SoftDog](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[ServiceNumber] [varchar](20) NULL,
	[RegisterCode] [varchar](255) NULL,
	[BeginDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [T_BD_SoftDog11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_InOutRecord_Log]    脚本日期: 08/30/2019 10:51:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_InOutRecord_Log]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_InOutRecord_Log](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonName] [varchar](20) NULL,
	[PersonSex] [varchar](2) NULL,
	[PersonIDCardCode] [varchar](20) NULL,
	[WorkTypeName] [varchar](200) NULL,
	[DepName] [varchar](255) NULL,
	[ControlNumber] [bigint] NULL,
	[ControlName] [varchar](255) NULL,
	[RecordTime] [datetime] NULL,
	[ImagePath] [varchar](255) NULL,
	[CommType] [varchar](255) NULL,
	[UploadType] [int] NULL DEFAULT ((0)),
	[UploadTV] [int] NULL DEFAULT ((0)),
	[Type] [varchar](255) NULL,
	[PersonNation] [varchar](255) NULL,
	[PersonBirthday] [varchar](255) NULL,
	[PersonAddress] [varchar](500) NULL,
	[PersonIssuingDept] [varchar](255) NULL,
	[IDBeginDate] [varchar](40) NULL,
	[IDEndDate] [varchar](40) NULL,
CONSTRAINT [T_BD_InOutRecord_Log11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_InOutRecord_Log]') AND name = N'log_ControlNumber')
CREATE NONCLUSTERED INDEX [log_ControlNumber] ON [dbo].[T_BD_InOutRecord_Log] 
(
	[ControlNumber] ASC
)WITH ( IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_InOutRecord_Log]') AND name = N'log_PersonIDCardCode')
CREATE NONCLUSTERED INDEX [log_PersonIDCardCode] ON [dbo].[T_BD_InOutRecord_Log] 
(
	[PersonIDCardCode] ASC
)WITH ( IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_InOutRecord_Log]') AND name = N'log_RecordTime')
CREATE NONCLUSTERED INDEX [log_RecordTime] ON [dbo].[T_BD_InOutRecord_Log] 
(
	[RecordTime] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_InOutRecord_Log]') AND name = N'log_Type')
CREATE NONCLUSTERED INDEX [log_Type] ON [dbo].[T_BD_InOutRecord_Log] 
(
	[Type] ASC
)WITH ( IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_InOutRecord_Log]') AND name = N'log_UploadTV')
CREATE NONCLUSTERED INDEX [log_UploadTV] ON [dbo].[T_BD_InOutRecord_Log] 
(
	[UploadTV] ASC
)WITH ( IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_InOutRecord_Log]') AND name = N'log_WorkTypeName')
CREATE NONCLUSTERED INDEX [log_WorkTypeName] ON [dbo].[T_BD_InOutRecord_Log] 
(
	[WorkTypeName] ASC
)WITH ( IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[T_BD_OpenDoor_Log]    脚本日期: 08/30/2019 10:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_OpenDoor_Log]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_OpenDoor_Log](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[AssociateKey] [bigint] NULL DEFAULT (NULL),
	[ControlNumber] [int] NULL DEFAULT (NULL),
	[OpenedType] [int] NULL DEFAULT (NULL),
	[OperateState] [int] NULL DEFAULT ((0)),
	[OperateTime] [datetime] NULL DEFAULT (getdate()),
	[OperatorName] [varchar](255) NULL DEFAULT (NULL),
	[ControlName] [varchar](255) NULL,
	[ControlIP] [varchar](255) NULL,
CONSTRAINT [T_BD_OpenDoor_Log11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_OffLineRecord]    脚本日期: 08/30/2019 10:51:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_OffLineRecord]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_OffLineRecord](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonName] [varchar](20) NULL,
	[PersonSex] [varchar](2) NULL,
	[PersonIDCardCode] [varchar](20) NULL,
	[ControlNumber] [bigint] NULL,
	[ControlName] [varchar](255) NULL,
	[RecordTime] [datetime] NULL,
CONSTRAINT [T_BD_OffLineRecord11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_MaFeiDaConfig]    脚本日期: 08/30/2019 10:51:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_MaFeiDaConfig]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_MaFeiDaConfig](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[Control_Key] [bigint] NULL,
	[ControlNumber] [int] NULL,
	[companyName] [varchar](255) NULL,
	[displayModType] [int] NULL DEFAULT ((1)),
	[displayModContent] [varchar](500) NULL,
	[delayTimeForCloseDoor] [int] NULL DEFAULT ((500)),
	[identifyDistance] [int] NULL DEFAULT ((0)),
	[identifyScores] [int] NULL DEFAULT ((80)),
	[saveIdentifyTime] [int] NULL,
	[recRank] [int] NULL DEFAULT ((1)),
	[multiplayerDetection] [int] NULL DEFAULT ((1)),
	[wg] [varchar](255) NULL,
	[closeTimeStart] [varchar](40) NULL,
	[closeTimeEnd] [varchar](40) NULL,
	[ttsModType] [int] NULL DEFAULT ((1)),
	[ttsModContent] [varchar](500) NULL,
	[recStrangerType] [int] NULL DEFAULT ((1)),
	[recStrangerTimesThreshold] [int] NULL DEFAULT ((3)),
	[ttsModStrangerType] [int] NULL DEFAULT ((1)),
	[ttsModStrangerContent] [varchar](500) NULL,
	[logo] [varchar](255) NULL,
	[recModeFaceEnable] [int] NULL DEFAULT ((2)),
	[recModeCardEnable] [int] NULL DEFAULT ((1)),
	[recModeCardIntf] [int] NULL DEFAULT ((1)),
	[recModeCardFaceEnable] [int] NULL DEFAULT ((1)),
	[recModeCardFaceIntf] [int] NULL DEFAULT ((1)),
	[recModeIdCardFaceEnable] [int] NULL DEFAULT ((1)),
	[recModeIdCardFaceIntf] [int] NULL DEFAULT ((2)),
	[recModeIdCardFaceHardware] [int] NULL DEFAULT ((1)),
	[recFaceCardValue] [int] NULL DEFAULT ((55)),
CONSTRAINT [T_BD_MaFeiDaConfig11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_Exception]    脚本日期: 08/30/2019 10:51:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_Exception]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_Exception](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[Content] [text] NULL,
	[CreateTime] [datetime] NULL,
	[OperatorUserKey] [bigint] NULL,
CONSTRAINT [T_BD_Exception11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_Exception]') AND name = N'CreateTime')
CREATE NONCLUSTERED INDEX [CreateTime] ON [dbo].[T_BD_Exception] 
(
	[CreateTime] ASC
)WITH ( IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[T_BD_User]    脚本日期: 08/30/2019 10:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_User](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[PassWord] [varchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[Role_Key] [bigint] NULL,
	[Remark] [text] NULL,
	[RealName] [varchar](50) NULL,
	[IsDelete] [int] NULL DEFAULT ((0)),
	[DeleteTime] [datetime] NULL,
	[DeleteUserName] [varchar](50) NULL,
	[HostName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH ( IGNORE_DUP_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH ( IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_Role_Permission]    脚本日期: 08/30/2019 10:52:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_Role_Permission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_Role_Permission](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[Role_Key] [bigint] NULL,
	[Permission_Key] [bigint] NULL,
	[CreateTime] [datetime] NULL,
CONSTRAINT [T_BD_Role_Permission11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** 对象:  Table [dbo].[T_BD_Control]    脚本日期: 08/30/2019 10:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_Control]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_Control](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[ControlName] [varchar](50) NULL,
	[Park_Key] [bigint] NULL,
	[ControlType] [int] NULL,
	[ControlIP] [varchar](50) NULL,
	[CommType] [varchar](50) NULL,
	[ComputerName] [varchar](255) NULL,
	[Remark] [text] NULL,
	[CannelNumber] [int] NULL,
	[ControlNumber] [int] NULL,
	[State] [int] NULL DEFAULT ((0)),
	[OnlineTime] [datetime] NULL,
	[IfAttend] [int] NULL,
 CONSTRAINT [PK__T_BD_Control__0AD2A005] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH ( IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [u_controlNumber] UNIQUE NONCLUSTERED 
(
	[ControlNumber] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_Person]    脚本日期: 08/30/2019 10:52:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_Person]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_Person](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[Dep_Key] [bigint] NULL,
	[PersonName] [varchar](50) NULL,
	[PersonSex] [char](2) NULL,
	[PersonPhone] [varchar](50) NULL,
	[PersonBirthday] [varchar](50) NULL,
	[PersonIDCard] [varchar](50) NULL,
	[PersonComeDate] [datetime] NULL,
	[PersonOutDate] [datetime] NULL,
	[PersonPhoto] [image] NULL,
	[Remark] [text] NULL,
	[CreateTime] [datetime] NULL DEFAULT (getdate()),
	[AuthGroup_Key] [bigint] NULL,
	[PersonTitle] [varchar](50) NULL,
	[IsDelete] [int] NULL CONSTRAINT [DF__T_BD_Pers__IsDel__0425A276]  DEFAULT ((0)),
	[DeleteTime] [datetime] NULL,
	[DeleteUserName] [varchar](50) NULL,
	[PersonCardPhoto] [image] NULL,
	[PersonInterNumber] [bigint] NULL DEFAULT ((0)),
	[PersonPermission_Key] [bigint] NULL,
	[IsDeparture] [int] NULL DEFAULT ((0)),
	[WorkType] [int] NULL,
	[WhiteListState] [int] NULL DEFAULT ((0)),
	[ICCardNumber] [varchar](50) NULL,
	[X] [int] NULL,
	[Y] [int] NULL,
	[W] [int] NULL,
	[H] [int] NULL,
	[PersonAddress] [varchar](255) NULL,
	[PersonNation] [varchar](255) NULL,
	[PersonIssuingDept] [varchar](255) NULL,
	[IDBeginDate] [varchar](50) NULL,
	[IDEndDate] [varchar](50) NULL,
	[UploadType] [int] NULL DEFAULT ((0)),
	[RandomKey] [bigint] NULL,
CONSTRAINT [T_BD_Person11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_Person]') AND name = N'AuthGroup_Key')
CREATE NONCLUSTERED INDEX [AuthGroup_Key] ON [dbo].[T_BD_Person] 
(
	[AuthGroup_Key] ASC
)WITH ( IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_Person]') AND name = N'depname')
CREATE NONCLUSTERED INDEX [depname] ON [dbo].[T_BD_Person] 
(
	[Dep_Key] ASC
)WITH ( IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_Person]') AND name = N'PersonIDCard')
CREATE NONCLUSTERED INDEX [PersonIDCard] ON [dbo].[T_BD_Person] 
(
	[PersonIDCard] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_Person]') AND name = N'PersonName')
CREATE NONCLUSTERED INDEX [PersonName] ON [dbo].[T_BD_Person] 
(
	[PersonName] ASC
)WITH ( IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_Person]') AND name = N'WorkType')
CREATE NONCLUSTERED INDEX [WorkType] ON [dbo].[T_BD_Person] 
(
	[WorkType] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
GO
/****** 对象:  Table [dbo].[T_BD_LEDRow]    脚本日期: 08/30/2019 10:51:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_LEDRow]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_LEDRow](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[LED_Key] [bigint] NULL,
	[Content] [text] NULL,
	[Remark] [text] NULL,
	[LEDFontColor] [varchar](255) NULL,
	[Number] [int] NULL,
CONSTRAINT [T_BD_LEDRow11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_AuthGroup_Control]    脚本日期: 08/30/2019 10:51:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_AuthGroup_Control]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_AuthGroup_Control](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[AuthGroup_Key] [bigint] NULL,
	[ControlNumber] [int] NULL,
	[CreateTime] [datetime] NULL DEFAULT (getdate()),
CONSTRAINT [T_BD_AuthGroup_Control11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** 对象:  Table [dbo].[T_BD_ZhiBiXuanConfig]    脚本日期: 08/30/2019 10:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_ZhiBiXuanConfig]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_ZhiBiXuanConfig](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](500) NULL,
	[similarity] [int] NULL DEFAULT ((60)),
	[saveIdentifyTime] [int] NULL DEFAULT ((5)),
	[uploadSetting] [int] NULL DEFAULT ((1)),
	[volumeSetting] [int] NULL DEFAULT ((100)),
	[safetyHelmet] [int] NULL DEFAULT ((1)),
	[aliveDetectEnable] [int] NULL DEFAULT ((1)),
	[faceShow] [int] NULL DEFAULT ((1)),
	[waterMark] [int] NULL DEFAULT ((1)),
	[extinguishingScreenTime] [int] NULL DEFAULT ((300)),
	[ledMode] [int] NULL DEFAULT ((1)),
	[ledLevel] [int] NULL DEFAULT ((100)),
	[ledStartTime1] [varchar](20) NULL,
	[ledEndTime1] [varchar](20) NULL,
	[nLevel1] [int] NULL DEFAULT ((100)),
	[ip] [varchar](255) NULL,
	[subnetMask] [varchar](255) NULL,
	[gateway] [varchar](255) NULL,
	[ledStartTime2] [varchar](20) NULL,
	[ledEndTime2] [varchar](20) NULL,
	[nLevel2] [int] NULL DEFAULT ((100)),
	[isLedSet1] [int] NULL DEFAULT ((0)),
	[isLedSet2] [int] NULL DEFAULT ((0)),
	[isLedSet3] [int] NULL DEFAULT ((0)),
	[ledStartTime3] [varchar](20) NULL,
	[ledEndTime3] [varchar](20) NULL,
	[nLevel3] [int] NULL DEFAULT ((100)),
	[Control_Key] [bigint] NULL,
	[ControlNumber] [int] NULL,
CONSTRAINT [T_BD_ZhiBiXuanConfig11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Table [dbo].[T_BD_ControlConfig]    脚本日期: 08/30/2019 10:51:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_BD_ControlConfig]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_BD_ControlConfig](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[Control_Key] [bigint] NULL,
	[FillLight] [int] NULL,
	[MatchValue] [int] NULL DEFAULT ((50)),
	[QualityValue] [int] NULL DEFAULT ((50)),
	[ControlNumber] [int] NULL,
	[ImageUploadType] [int] NULL DEFAULT ((0)),
	[TimeInterval] [int] NULL DEFAULT ((10)),
	[FaceSwitch] [int] NULL DEFAULT ((1)),
	[WriteIo] [int] NULL DEFAULT ((1)),
	[WriteVolue] [int] NULL DEFAULT ((0)),
	[BlackIo] [int] NULL DEFAULT ((0)),
	[BlackVolue] [int] NULL DEFAULT ((1)),
	[LightOpenTime] [varchar](50) NULL,
	[LightCloseTime] [varchar](50) NULL,
	[StrangerIo] [int] NULL DEFAULT ((0)),
	[StrangerVolue] [int] NULL DEFAULT ((1)),
CONSTRAINT [T_BD_ControlConfig11] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** 对象:  Check [CK__T_BD_Pers__Perso__1273C1CD]    脚本日期: 08/30/2019 10:52:03 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__T_BD_Pers__Perso__1273C1CD]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_BD_Person]'))
ALTER TABLE [dbo].[T_BD_Person]  WITH NOCHECK ADD  CONSTRAINT [CK__T_BD_Pers__Perso__1273C1CD] CHECK  (([PersonSex]='男' OR [PersonSex]='女'))
GO
ALTER TABLE [dbo].[T_BD_Person] CHECK CONSTRAINT [CK__T_BD_Pers__Perso__1273C1CD]
GO
/****** 对象:  Check [CK__T_BD_Pers__Perso__49C3F6B7]    脚本日期: 08/30/2019 10:52:08 ******/
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__T_BD_Pers__Perso__49C3F6B7]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_BD_PersonLog]'))
ALTER TABLE [dbo].[T_BD_PersonLog]  WITH CHECK ADD CHECK  (([PersonSex]='男' OR [PersonSex]='女'))
GO
/****** 对象:  ForeignKey [authGroupControl_authGroup_authGroupKey]    脚本日期: 08/30/2019 10:51:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[authGroupControl_authGroup_authGroupKey]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_BD_AuthGroup_Control]'))
ALTER TABLE [dbo].[T_BD_AuthGroup_Control]  WITH CHECK ADD  CONSTRAINT [authGroupControl_authGroup_authGroupKey] FOREIGN KEY([AuthGroup_Key])
REFERENCES [dbo].[T_BD_AuthGroup] ([P_Key])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_BD_AuthGroup_Control] CHECK CONSTRAINT [authGroupControl_authGroup_authGroupKey]
GO
/****** 对象:  ForeignKey [authGroupControl_control_controlNumber]    脚本日期: 08/30/2019 10:51:25 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[authGroupControl_control_controlNumber]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_BD_AuthGroup_Control]'))
ALTER TABLE [dbo].[T_BD_AuthGroup_Control]  WITH CHECK ADD  CONSTRAINT [authGroupControl_control_controlNumber] FOREIGN KEY([ControlNumber])
REFERENCES [dbo].[T_BD_Control] ([ControlNumber])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_BD_AuthGroup_Control] CHECK CONSTRAINT [authGroupControl_control_controlNumber]
GO
/****** 对象:  ForeignKey [control_park_parkKey]    脚本日期: 08/30/2019 10:51:32 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[control_park_parkKey]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_BD_Control]'))
ALTER TABLE [dbo].[T_BD_Control]  WITH CHECK ADD  CONSTRAINT [control_park_parkKey] FOREIGN KEY([Park_Key])
REFERENCES [dbo].[T_BD_Park] ([P_Key])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[T_BD_Control] CHECK CONSTRAINT [control_park_parkKey]
GO
/****** 对象:  ForeignKey [FK__T_BD_Cont__Contr__76969D2E]    脚本日期: 08/30/2019 10:51:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__T_BD_Cont__Contr__76969D2E]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_BD_ControlConfig]'))
ALTER TABLE [dbo].[T_BD_ControlConfig]  WITH CHECK ADD FOREIGN KEY([Control_Key])
REFERENCES [dbo].[T_BD_Control] ([P_Key])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
/****** 对象:  ForeignKey [dep_dep_parentKey]    脚本日期: 08/30/2019 10:51:38 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[dep_dep_parentKey]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_BD_Department]'))
ALTER TABLE [dbo].[T_BD_Department]  WITH CHECK ADD  CONSTRAINT [dep_dep_parentKey] FOREIGN KEY([Parent_Key])
REFERENCES [dbo].[T_BD_Department] ([P_Key])
GO
ALTER TABLE [dbo].[T_BD_Department] CHECK CONSTRAINT [dep_dep_parentKey]
GO
/****** 对象:  ForeignKey [LEDRow_LEDkey_pkey]    脚本日期: 08/30/2019 10:51:48 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[LEDRow_LEDkey_pkey]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_BD_LEDRow]'))
ALTER TABLE [dbo].[T_BD_LEDRow]  WITH CHECK ADD  CONSTRAINT [LEDRow_LEDkey_pkey] FOREIGN KEY([LED_Key])
REFERENCES [dbo].[T_BD_LEDScreen] ([P_Key])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_BD_LEDRow] CHECK CONSTRAINT [LEDRow_LEDkey_pkey]
GO
/****** 对象:  ForeignKey [park_park_parentKey]    脚本日期: 08/30/2019 10:51:58 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[park_park_parentKey]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_BD_Park]'))
ALTER TABLE [dbo].[T_BD_Park]  WITH CHECK ADD  CONSTRAINT [park_park_parentKey] FOREIGN KEY([Parent_Key])
REFERENCES [dbo].[T_BD_Park] ([P_Key])
GO
ALTER TABLE [dbo].[T_BD_Park] CHECK CONSTRAINT [park_park_parentKey]
GO
/****** 对象:  ForeignKey [permission_permission_parentKey1]    脚本日期: 08/30/2019 10:51:59 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[permission_permission_parentKey1]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_BD_Permission]'))
ALTER TABLE [dbo].[T_BD_Permission]  WITH CHECK ADD  CONSTRAINT [permission_permission_parentKey1] FOREIGN KEY([Parent_Key])
REFERENCES [dbo].[T_BD_Permission] ([P_Key])
GO
ALTER TABLE [dbo].[T_BD_Permission] CHECK CONSTRAINT [permission_permission_parentKey1]
GO
/****** 对象:  ForeignKey [person_authgroup_authGroupKey]    脚本日期: 08/30/2019 10:52:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[person_authgroup_authGroupKey]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_BD_Person]'))
ALTER TABLE [dbo].[T_BD_Person]  WITH NOCHECK ADD  CONSTRAINT [person_authgroup_authGroupKey] FOREIGN KEY([AuthGroup_Key])
REFERENCES [dbo].[T_BD_AuthGroup] ([P_Key])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[T_BD_Person] CHECK CONSTRAINT [person_authgroup_authGroupKey]
GO
/****** 对象:  ForeignKey [person_dep_depKey]    脚本日期: 08/30/2019 10:52:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[person_dep_depKey]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_BD_Person]'))
ALTER TABLE [dbo].[T_BD_Person]  WITH NOCHECK ADD  CONSTRAINT [person_dep_depKey] FOREIGN KEY([Dep_Key])
REFERENCES [dbo].[T_BD_Department] ([P_Key])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[T_BD_Person] CHECK CONSTRAINT [person_dep_depKey]
GO
/****** 对象:  ForeignKey [person_personPermission_personpermissionKey]    脚本日期: 08/30/2019 10:52:03 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[person_personPermission_personpermissionKey]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_BD_Person]'))
ALTER TABLE [dbo].[T_BD_Person]  WITH NOCHECK ADD  CONSTRAINT [person_personPermission_personpermissionKey] FOREIGN KEY([PersonPermission_Key])
REFERENCES [dbo].[T_BD_Person_Permission] ([P_Key])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[T_BD_Person] CHECK CONSTRAINT [person_personPermission_personpermissionKey]
GO
/****** 对象:  ForeignKey [rolePermission_permission_permissionKey1]    脚本日期: 08/30/2019 10:52:09 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[rolePermission_permission_permissionKey1]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_BD_Role_Permission]'))
ALTER TABLE [dbo].[T_BD_Role_Permission]  WITH CHECK ADD  CONSTRAINT [rolePermission_permission_permissionKey1] FOREIGN KEY([Permission_Key])
REFERENCES [dbo].[T_BD_Permission] ([P_Key])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_BD_Role_Permission] CHECK CONSTRAINT [rolePermission_permission_permissionKey1]
GO
/****** 对象:  ForeignKey [rolePermission_role_roleKey]    脚本日期: 08/30/2019 10:52:09 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[rolePermission_role_roleKey]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_BD_Role_Permission]'))
ALTER TABLE [dbo].[T_BD_Role_Permission]  WITH CHECK ADD  CONSTRAINT [rolePermission_role_roleKey] FOREIGN KEY([Role_Key])
REFERENCES [dbo].[T_BD_Role] ([P_Key])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_BD_Role_Permission] CHECK CONSTRAINT [rolePermission_role_roleKey]
GO
/****** 对象:  ForeignKey [user_role_roleKey]    脚本日期: 08/30/2019 10:52:11 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[user_role_roleKey]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_BD_User]'))
ALTER TABLE [dbo].[T_BD_User]  WITH CHECK ADD  CONSTRAINT [user_role_roleKey] FOREIGN KEY([Role_Key])
REFERENCES [dbo].[T_BD_Role] ([P_Key])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[T_BD_User] CHECK CONSTRAINT [user_role_roleKey]
GO
/****** 对象:  ForeignKey [FK__T_BD_ZhiB__Contr__2DE6D218]    脚本日期: 08/30/2019 10:52:17 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__T_BD_ZhiB__Contr__2DE6D218]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_BD_ZhiBiXuanConfig]'))
ALTER TABLE [dbo].[T_BD_ZhiBiXuanConfig]  WITH CHECK ADD FOREIGN KEY([Control_Key])
REFERENCES [dbo].[T_BD_Control] ([P_Key])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

-- ----------------------------
-- Records of T_BD_AuthGroup
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_BD_AuthGroup] ON
GO
INSERT INTO [dbo].[T_BD_AuthGroup] ([P_Key], [AuthGroupName], [Remark], [CreateTime]) VALUES (N'1', N'全部', null, N'2018-02-25 00:00:00.000')
GO
GO
SET IDENTITY_INSERT [dbo].[T_BD_AuthGroup] OFF
GO

-- ----------------------------
-- Records of T_BD_Control_Category
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_BD_Control_Category] ON
GO
INSERT INTO [dbo].[T_BD_Control_Category] ([P_Key], [CategoryNumber], [CategoryName]) VALUES (N'1', N'1', N'A系列')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Category] ([P_Key], [CategoryNumber], [CategoryName]) VALUES (N'2', N'2', N'B系列')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Category] ([P_Key], [CategoryNumber], [CategoryName]) VALUES (N'3', N'3', N'C系列')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Category] ([P_Key], [CategoryNumber], [CategoryName]) VALUES (N'4', N'4', N'D系列')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Category] ([P_Key], [CategoryNumber], [CategoryName]) VALUES (N'5', N'5', N'E系列')
GO
GO
SET IDENTITY_INSERT [dbo].[T_BD_Control_Category] OFF
GO

-- ----------------------------
-- Records of T_BD_Control_Type
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_BD_Control_Type] ON
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'1', N'1', N'IFC6020A', N'1', N'')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'2', N'1', N'IFC6020B', N'1', N'')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'3', N'1', N'IFC6021A', N'2', N'')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'4', N'1', N'IFC6021B', N'2', N'')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'5', N'1', N'IFC6022A', N'3', N'')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'6', N'1', N'IFC6022B', N'3', N'')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'7', N'2', N'IFC6011A', N'4', N'')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'8', N'2', N'IFC6012B', N'5', N'')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'9', N'3', N'IDC7115A', N'4', N'')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'10', N'3', N'IDC7115B', N'4', N'')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'11', N'3', N'IDC7115C', N'4', N'')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'12', N'4', N'IFC6010A', N'4', N'')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'13', N'4', N'IFC6010B', N'4', N'')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'14', N'4', N'IFC6010C', N'4', N'')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'15', N'2', N'IFC6013C', N'5', N'')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'16', N'1', N'IFC6023A', N'7', N'')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'17', N'1', N'IFC6024A', N'6', N'')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'18', N'1', N'IFC6025A', N'8', N'')
GO
GO
SET IDENTITY_INSERT [dbo].[T_BD_Control_Type] OFF
GO
-- ----------------------------
-- Records of T_BD_Control
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_BD_Control] ON
GO
INSERT INTO [dbo].[T_BD_Control] ([P_Key], [ControlName], [Park_Key], [ControlType], [ControlIP], [CommType], [ComputerName], [Remark], [CannelNumber], [ControlNumber], [State], [OnlineTime]) VALUES (N'1', N'10000', null, N'1', N'192.168.1.100', N'进', N'', null, N'1', N'10000', N'0', null)
GO
GO
SET IDENTITY_INSERT [dbo].[T_BD_Control] OFF
GO

-- ----------------------------
-- Records of T_BD_AuthGroup_Control
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_BD_AuthGroup_Control] ON
GO
INSERT INTO [dbo].[T_BD_AuthGroup_Control] ([P_Key], [AuthGroup_Key], [ControlNumber], [CreateTime]) VALUES (N'1', N'1', N'10000', N'2019-08-29 18:25:26.000')
GO
GO
SET IDENTITY_INSERT [dbo].[T_BD_AuthGroup_Control] OFF
GO

-- ----------------------------
-- Records of T_BD_Config
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_BD_Config] ON
GO
INSERT INTO [dbo].[T_BD_Config] ([P_Key], [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES (N'1', N'异常日志文件位置', N'默认路径', N'1', N'ExceptionPath')
GO
GO
INSERT INTO [dbo].[T_BD_Config] ([P_Key], [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES (N'2', N'异常日志文件隔几天清理一次', N'7', N'1', N'ClearExceptionTime')
GO
GO
INSERT INTO [dbo].[T_BD_Config] ([P_Key], [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES (N'3', N'IP地址', N'192.168.1.139', N'1', N'ServerIP')
GO
GO
INSERT INTO [dbo].[T_BD_Config] ([P_Key], [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES (N'4', N'端口', N'26680', N'1', N'ServerPort')
GO
GO
INSERT INTO [dbo].[T_BD_Config] ([P_Key], [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES (N'5', N'服务器日志文件位置', N'默认路径', N'1', N'ServerLogPath')
GO
GO
INSERT INTO [dbo].[T_BD_Config] ([P_Key], [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES (N'8', N'人员图片保存路径', N'默认路径', N'1', N'PersonPhotoImagePath')
GO
GO
INSERT INTO [dbo].[T_BD_Config] ([P_Key], [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES (N'9', N'共享文件夹路径', N'D:\BackupPhoto', N'1', N'SharedFolderPath')
GO
GO
INSERT INTO [dbo].[T_BD_Config] ([P_Key], [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES (N'10', N'服务器日志文件隔几天清理一次', N'7', N'1', N'ClearServerTime')
GO
GO
INSERT INTO [dbo].[T_BD_Config] ([P_Key], [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES (N'11', N'自动更新白名单', N'是', N'0', N'AutoWhiteList')
GO
GO
INSERT INTO [dbo].[T_BD_Config] ([P_Key], [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES (N'14', N'智能卡类型', N'1', N'1', N'ICCardType')
GO
GO
INSERT INTO [dbo].[T_BD_Config] ([P_Key], [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES (N'15', N'上传服务器IP', N'47.106.172.173', N'1', N'UploadServerIP')
GO
GO
INSERT INTO [dbo].[T_BD_Config] ([P_Key], [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES (N'16', N'上传服务器端口', N'26001', N'1', N'UploadServerPort')
GO
GO
INSERT INTO [dbo].[T_BD_Config] ([P_Key], [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES (N'17', N'系统场地编号', N'10000', N'1', N'SysNumber')
GO
GO
INSERT INTO [dbo].[T_BD_Config] ([P_Key], [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES (N'18', N'是否开启上传服务器', N'是', N'0', N'IsUpload')
GO
GO
INSERT INTO [dbo].[T_BD_Config] ([P_Key], [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES (N'19', N'是否开启自动获取IP', N'是', N'1', N'IsAutoGetIP')
GO
GO
INSERT INTO [dbo].[T_BD_Config] ([P_Key], [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES (N'20', N'是否开启自动启动本地服务', N'否', N'0', N'IsLocalServer')
GO
GO
INSERT INTO [dbo].[T_BD_Config] ([P_Key], [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES (N'21', N'是否开启自动连接云端服务', N'否', N'0', N'IsYunServer')
GO
GO
INSERT INTO T_BD_Config ([P_Key], ConfigName, ConfigValue, IsEnable, ConfigCode) VALUES ( N'22',N'默认设置几路视频', N'4', N'1', N'SetVideo');
GO
GO
INSERT INTO T_BD_Config ([P_Key], ConfigName, ConfigValue, IsEnable, ConfigCode) VALUES ( N'23',N'是否开启开机自启', N'是', N'0', N'IsAutoStart');
GO
GO
SET IDENTITY_INSERT [dbo].[T_BD_Config] OFF
GO

-- ----------------------------
-- Records of T_BD_Data
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_BD_Data] ON
GO
INSERT INTO [dbo].[T_BD_Data] ([P_Key], [DataType], [DataName], [DataValue], [Remark], [CreateTime]) VALUES (N'1', N'1', N'主菜单', N'1', null, N'2018-03-03 14:31:00.000')
GO
GO
INSERT INTO [dbo].[T_BD_Data] ([P_Key], [DataType], [DataName], [DataValue], [Remark], [CreateTime]) VALUES (N'2', N'1', N'子菜单', N'2', null, N'2018-03-03 14:31:26.000')
GO
GO
INSERT INTO [dbo].[T_BD_Data] ([P_Key], [DataType], [DataName], [DataValue], [Remark], [CreateTime]) VALUES (N'3', N'1', N'功能', N'3', null, N'2018-03-03 14:32:04.000')
GO
GO
INSERT INTO [dbo].[T_BD_Data] ([P_Key], [DataType], [DataName], [DataValue], [Remark], [CreateTime]) VALUES (N'12', N'3', N'水泥工', N'1', null, N'2018-03-21 08:47:51.000')
GO
GO
INSERT INTO [dbo].[T_BD_Data] ([P_Key], [DataType], [DataName], [DataValue], [Remark], [CreateTime]) VALUES (N'13', N'3', N'监工', N'2', null, N'2018-03-21 08:48:13.000')
GO
GO
SET IDENTITY_INSERT [dbo].[T_BD_Data] OFF
GO

-- ----------------------------
-- Records of T_BD_Department
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_BD_Department] ON
GO
INSERT INTO [dbo].[T_BD_Department] ([P_Key], [Parent_Key], [DepNo], [DepName], [DepSName], [DepLevel], [Address], [WeaveCount], [Phone], [DepFunction], [DepAuthority], [DepDuty], [Manager], [SetTemp], [Remark], [CreateTime], [IsDelete], [DeleteTime], [DeleteUserName], [DepInterNumber]) VALUES (N'1', null, null, N'默认部门', null, null, null, null, null, null, null, null, null, null, null, N'2018-05-09 16:03:43.293', N'0', null, null, N'0')
GO
GO
SET IDENTITY_INSERT [dbo].[T_BD_Department] OFF
GO

-- ----------------------------
-- Records of T_BD_DepartmentLog
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_BD_DepartmentLog] ON
GO
INSERT INTO [dbo].[T_BD_DepartmentLog] ([P_Key], [Parent_Key], [DepNo], [DepName], [DepSName], [DepLevel], [Address], [WeaveCount], [Phone], [DepFunction], [DepAuthority], [DepDuty], [Manager], [SetTemp], [Remark], [CreateTime], [IsDelete], [DeleteTime], [DeleteUserName], [OpType], [OperatorName], [OpTime], [UpSelfPlat], [OperatorType], [DepInterNomber]) VALUES (N'1', null, null, N'默认部门', null, null, null, null, null, null, null, null, null, null, null, null, N'0', null, null, N'1', N'admin', N'2018-05-09 16:03:43.000', N'0', N'1', null)
GO
GO
SET IDENTITY_INSERT [dbo].[T_BD_DepartmentLog] OFF
GO

-- ----------------------------
-- Records of T_BD_LEDInmethod
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_BD_LEDInmethod] ON
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'1', N'0', N'随机')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'2', N'1', N'立即显示')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'3', N'2', N'左滚显示')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'4', N'3', N'上滚显示')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'5', N'4', N'右滚显示')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'6', N'5', N'下滚显示')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'7', N'6', N'连续左滚显示')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'8', N'7', N'连续下滚显示')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'9', N'8', N'中间向上下展开')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'10', N'9', N'中间向两边展开')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'11', N'10', N'中间向四周展开')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'12', N'11', N'从右向左移入')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'13', N'12', N'从左向右移入')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'14', N'13', N'从左向右展开')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'15', N'14', N'从右向左展开')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'16', N'15', N'从右上角移入')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'17', N'16', N'从右下角移入')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'18', N'17', N'从左上角移入')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'19', N'18', N'从左下角移入')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'20', N'19', N'从上向下移入')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'21', N'20', N'从下向上移入')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'22', N'21', N'横向百叶窗')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'23', N'22', N'纵向百叶窗')
GO
GO
SET IDENTITY_INSERT [dbo].[T_BD_LEDInmethod] OFF
GO

-- ----------------------------
-- Records of T_BD_Permission
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_BD_Permission] ON
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'1', N'系统设置', N'1', null, N'2019-08-20 09:47:23.193', null, N'0', N'system.png', N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'2', N'硬件管理', N'1', null, N'2019-08-20 09:48:26.577', null, N'0', N'hardware.png', N'3')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'3', N'人员管理', N'1', null, N'2019-08-20 09:48:50.263', null, N'0', N'whiteperson.png', N'4')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'4', N'统计报表', N'1', null, N'2019-08-20 09:49:05.003', null, N'0', N'reports.png', N'5')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'5', N'用户管理', N'1', null, N'2019-08-20 09:49:09.653', null, N'0', N'user.png', N'6')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'6', N'日志管理', N'1', null, N'2019-08-20 09:49:43.560', null, N'0', N'log.png', N'7')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'7', N'关于我们', N'1', null, N'2019-08-20 09:58:07.250', null, N'0', N'about.png', N'8')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'8', N'系统配置', N'2', null, N'2019-08-20 10:25:59.353', N'1', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'9', N'设备管理', N'2', null, N'2019-08-20 10:26:13.797', N'2', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'10', N'显示屏管理', N'2', null, N'2019-08-20 10:28:49.260', N'2', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'11', N'工种管理', N'2', null, N'2019-08-20 15:27:44.960', N'3', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'12', N'人员管理', N'2', null, N'2019-08-20 15:27:58.700', N'3', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'13', N'人员下发', N'2', null, N'2019-08-20 15:28:36.237', N'3', N'0', null, N'3')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'14', N'场内记录', N'2', null, N'2019-08-20 15:29:39.570', N'4', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'15', N'进出记录', N'2', null, N'2019-08-20 15:29:52.030', N'4', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'16', N'设备白名单', N'2', null, N'2019-08-20 15:30:32.030', N'4', N'0', null, N'4')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'17', N'设备脱机记录', N'2', null, N'2019-08-20 15:32:21.443', N'4', N'0', null, N'5')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'18', N'用户管理', N'2', null, N'2019-08-20 15:32:47.353', N'5', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'19', N'开关闸日志', N'2', null, N'2019-08-20 15:33:22.993', N'6', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'20', N'登录日志', N'2', null, N'2019-08-20 15:33:33.903', N'6', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'21', N'异常日志', N'2', null, N'2019-08-20 15:33:44.277', N'6', N'0', null, N'3')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'22', N'注册软件', N'2', null, N'2019-08-20 15:34:08.337', N'7', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'23', N'更新日志', N'2', null, N'2019-08-20 15:34:47.870', N'7', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'24', N'软件版本', N'2', null, N'2019-08-20 15:35:09.420', N'7', N'0', null, N'3')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'25', N'版本更新', N'2', null, N'2019-08-20 15:35:22.550', N'7', N'0', null, N'4')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'27', N'首页', N'1', null, N'2019-08-23 09:52:54.513', null, N'0', N'home.png', N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'28', N'设备添加', N'3', null, N'2019-08-23 11:31:40.160', N'9', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'29', N'设备修改', N'3', null, N'2019-08-23 11:31:57.867', N'9', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'30', N'设备删除', N'3', null, N'2019-08-23 11:32:06.930', N'9', N'0', null, N'3')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'31', N'清空设备白名单', N'3', null, N'2019-08-23 11:32:52.057', N'9', N'0', null, N'4')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'32', N'设备开闸', N'3', null, N'2019-08-23 11:33:04.433', N'9', N'0', null, N'5')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'33', N'设备关闸', N'3', null, N'2019-08-23 11:33:16.343', N'9', N'0', null, N'6')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'34', N'权限组添加', N'3', null, N'2019-08-23 15:54:34.860', N'9', N'0', null, N'7')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'35', N'权限组修改', N'3', null, N'2019-08-23 15:54:48.217', N'9', N'0', null, N'8')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'36', N'权限组删除', N'3', null, N'2019-08-23 15:55:01.707', N'9', N'0', null, N'9')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'37', N'显示屏添加', N'3', null, N'2019-08-23 19:17:39.603', N'10', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'38', N'显示屏修改', N'3', null, N'2019-08-23 19:17:51.320', N'10', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'39', N'显示屏删除', N'3', null, N'2019-08-23 19:18:04.130', N'10', N'0', null, N'3')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'40', N'工种添加', N'3', null, N'2019-08-24 10:05:46.980', N'11', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'41', N'工种修改', N'3', null, N'2019-08-24 10:06:12.220', N'11', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'42', N'工种删除', N'3', null, N'2019-08-24 10:06:26.113', N'11', N'0', null, N'3')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'43', N'进出日志', N'2', null, N'2019-08-24 10:53:23.407', N'4', N'0', null, N'3')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'44', N'进出日志导出', N'3', null, N'2019-08-26 11:49:28.167', N'43', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'45', N'进出日志删除', N'3', null, N'2019-08-26 11:49:41.363', N'43', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'46', N'场内记录导出', N'3', null, N'2019-08-26 14:50:17.870', N'14', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'47', N'场内记录删除', N'3', null, N'2019-08-26 14:50:32.107', N'14', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'48', N'进出记录导出', N'3', null, N'2019-08-26 16:04:17.603', N'15', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'49', N'进出记录删除', N'3', null, N'2019-08-26 16:04:37.840', N'15', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'50', N'用户添加', N'3', null, N'2019-08-27 14:37:14.890', N'18', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'51', N'用户修改', N'3', null, N'2019-08-27 14:37:31.140', N'18', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'52', N'用户删除', N'3', null, N'2019-08-27 14:37:51.250', N'18', N'0', null, N'3')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'53', N'分配角色', N'3', null, N'2019-08-27 14:38:16.257', N'18', N'0', null, N'4')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'54', N'修改密码', N'3', null, N'2019-08-27 14:38:29.300', N'18', N'0', null, N'5')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'55', N'角色添加', N'3', null, N'2019-08-27 14:38:50.403', N'18', N'0', null, N'6')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'56', N'角色修改', N'3', null, N'2019-08-27 14:39:04.877', N'18', N'0', null, N'7')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'57', N'角色删除', N'3', null, N'2019-08-27 14:39:16.000', N'18', N'0', null, N'8')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'58', N'分配权限', N'3', null, N'2019-08-27 14:39:43.603', N'18', N'0', null, N'9')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'59', N'部门添加', N'3', null, N'2019-08-28 15:17:49.393', N'12', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'60', N'部门修改', N'3', null, N'2019-08-28 15:18:00.737', N'12', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'61', N'部门删除', N'3', null, N'2019-08-28 15:18:09.763', N'12', N'0', null, N'3')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'62', N'人员添加', N'3', null, N'2019-08-28 15:18:26.833', N'12', N'0', null, N'4')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'63', N'人员修改', N'3', null, N'2019-08-28 15:18:39.747', N'12', N'0', null, N'5')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'64', N'人员删除', N'3', null, N'2019-08-28 15:18:54.093', N'12', N'0', null, N'6')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'65', N'人员批量导入', N'3', null, N'2019-08-28 15:19:08.057', N'12', N'0', null, N'7')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'66', N'分配部门', N'3', null, N'2019-08-28 15:19:32.773', N'12', N'0', null, N'8')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'67', N'更改有效期', N'3', null, N'2019-08-28 15:19:45.743', N'12', N'0', null, N'9')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'68', N'导出选中', N'3', null, N'2019-08-28 15:20:00.993', N'12', N'0', null, N'10')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'69', N'导出全部', N'3', null, N'2019-08-28 15:20:13.387', N'12', N'0', null, N'11')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'70', N'离职', N'3', null, N'2019-08-28 15:20:24.140', N'12', N'0', null, N'12')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'71', N'分配权限组', N'3', null, N'2019-08-28 15:46:53.373', N'12', N'0', null, N'13')
GO
GO
SET IDENTITY_INSERT [dbo].[T_BD_Permission] OFF
GO

-- ----------------------------
-- Records of T_BD_Role
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_BD_Role] ON
GO
INSERT INTO [dbo].[T_BD_Role] ([P_Key], [RoleName], [Remark], [CreateTime], [IsDelete], [DeleteTime], [DeleteUserName]) VALUES (N'1', N'管理员', null, N'2018-02-07 00:00:00.000', N'0', null, null)
GO
GO
INSERT INTO [dbo].[T_BD_Role] ([P_Key], [RoleName], [Remark], [CreateTime], [IsDelete], [DeleteTime], [DeleteUserName]) VALUES (N'2', N'操作员', N'', N'2018-10-24 15:10:49.333', N'0', null, null)
GO
GO
SET IDENTITY_INSERT [dbo].[T_BD_Role] OFF
GO



-- ----------------------------
-- Records of T_BD_User
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_BD_User] ON
GO
INSERT INTO [dbo].[T_BD_User] ([P_Key], [UserName], [PassWord], [CreateTime], [Role_Key], [Remark], [RealName], [IsDelete], [DeleteTime], [DeleteUserName], [HostName]) VALUES (N'1', N'admin', N'202cb962ac5975b964b7152d234b70', N'2018-02-07 00:00:00.000', N'1', null, N'admin', N'0', null, null, null)
GO
GO
INSERT INTO [dbo].[T_BD_User] ([P_Key], [UserName], [PassWord], [CreateTime], [Role_Key], [Remark], [RealName], [IsDelete], [DeleteTime], [DeleteUserName], [HostName]) VALUES (N'2', N'操作员', N'202cb962ac5975b964b7152d234b70', N'2018-10-24 15:12:39.457', N'2', N'', N'操作员', N'0', null, null, N'全部')
GO
GO
SET IDENTITY_INSERT [dbo].[T_BD_User] OFF
GO

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
INSERT INTO [dbo].[T_Com_SysPara] ([P_Key], [sName], [Value1], [Content]) VALUES (N'53', N'Att_StartDay', N'1', null)
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
INSERT INTO T_BD_Permission ( [P_Key],PermissionName, Type, Remark, CreateTime, Parent_Key, IsDelete, Icon, OrderId) VALUES (N'314', N'人员下发日志', N'2', null, N'2019-11-26 09:55:12.580', '6', '0', null, '4');
GO
GO
SET IDENTITY_INSERT [dbo].[T_BD_Permission] OFF
GO

-- ----------------------------
-- Records of T_BD_Role_Permission
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_BD_Role_Permission] ON
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'232', N'2', N'27', N'2019-08-29 17:19:39.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'233', N'2', N'1', N'2019-08-29 17:19:39.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'234', N'2', N'8', N'2019-08-29 17:19:39.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'319', N'1', N'27', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'320', N'1', N'1', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'321', N'1', N'8', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'322', N'1', N'2', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'323', N'1', N'9', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'324', N'1', N'28', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'325', N'1', N'29', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'326', N'1', N'30', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'327', N'1', N'31', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'328', N'1', N'32', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'329', N'1', N'33', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'330', N'1', N'34', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'331', N'1', N'35', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'332', N'1', N'36', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'333', N'1', N'10', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'334', N'1', N'37', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'335', N'1', N'38', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'336', N'1', N'39', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'337', N'1', N'3', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'338', N'1', N'11', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'339', N'1', N'40', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'340', N'1', N'41', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'341', N'1', N'42', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'342', N'1', N'12', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'343', N'1', N'59', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'344', N'1', N'60', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'345', N'1', N'61', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'346', N'1', N'62', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'347', N'1', N'63', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'348', N'1', N'64', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'349', N'1', N'65', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'350', N'1', N'66', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'351', N'1', N'67', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'352', N'1', N'68', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'353', N'1', N'69', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'354', N'1', N'70', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'355', N'1', N'71', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'356', N'1', N'13', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'357', N'1', N'311', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'358', N'1', N'312', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'359', N'1', N'313', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'360', N'1', N'300', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'361', N'1', N'301', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'362', N'1', N'302', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'363', N'1', N'303', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'364', N'1', N'304', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'365', N'1', N'4', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'366', N'1', N'14', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'367', N'1', N'46', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'368', N'1', N'47', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'369', N'1', N'15', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'370', N'1', N'48', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'371', N'1', N'49', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'372', N'1', N'43', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'373', N'1', N'44', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'374', N'1', N'45', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'375', N'1', N'16', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'376', N'1', N'17', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'377', N'1', N'308', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'378', N'1', N'305', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'379', N'1', N'306', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'380', N'1', N'307', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'381', N'1', N'309', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'382', N'1', N'310', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'383', N'1', N'5', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'384', N'1', N'18', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'385', N'1', N'50', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'386', N'1', N'51', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'387', N'1', N'52', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'388', N'1', N'53', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'389', N'1', N'54', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'390', N'1', N'55', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'391', N'1', N'56', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'392', N'1', N'57', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'393', N'1', N'58', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'394', N'1', N'6', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'395', N'1', N'19', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'396', N'1', N'20', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'397', N'1', N'21', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'398', N'1', N'314', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'399', N'1', N'7', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'400', N'1', N'22', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'401', N'1', N'23', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'402', N'1', N'24', N'2019-11-26 09:56:43.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'403', N'1', N'25', N'2019-11-26 09:56:43.000')
GO
GO
SET IDENTITY_INSERT [dbo].[T_BD_Role_Permission] OFF
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

    WHERE (PsnShift.AttendType=0) 
	--And (PsnCard.PersonComeDate<=@TempDate) 
    
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


/****** Object:  StoredProcedure [dbo].[P_Att_SumIoRecord]    Script Date: 11/11/2019 13:57:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_Att_SumIoRecord]
  @BeginDate AS datetime ,
  @EndDate AS datetime 
AS
BEGIN
    ---定义中间变量
		declare @dt datetime
		select @dt = @BeginDate
    --- 清空临时表
    delete from T_BD_Temp_InOutRecord;
    ---开始按照时间循环执行
		while @dt <= @EndDate
		begin
        ---处理逻辑
        --声明一个变量
				declare @PersonIDCardCode as VARCHAR(64);
				--声明一个游标用来遍历查询到的结果
				declare C_PersonIDCardCode CURSOR for select c.PersonIDCardCode from T_BD_InOutRecord_Log as c 
 INNER JOIN T_BD_Control cc on c.ControlNumber=cc.ControlNumber where 
  cc.IfAttend=1 AND 
        DateDiff(dd, c.RecordTime, @dt) = 0  GROUP BY c.PersonIDCardCode;
				--打开游标
				open C_PersonIDCardCode;
				--获取游标指向的数据
				fetch next from C_PersonIDCardCode into @PersonIDCardCode;
				--使用游标遍历集合
				while @@FETCH_STATUS = 0
				BEGIN
				--执行具体的操作
						print @PersonIDCardCode;
            INSERT INTO T_BD_Temp_InOutRecord([PersonName], [PersonSex], [PersonIDCardCode],
            [WorkTypeName], [DepName], [ControlNumber], [ControlName], [RecordTime],
            [ControlNumber2], [ControlName2], [RecordTime2])
             select * from (
							select top 1 b.PersonName,b.PersonSex,b.PersonIDCardCode,b.WorkTypeName,b.DepName,b.ControlNumber,b.ControlName,b.RecordTime,
						 (select  top 1 d.ControlNumber from T_BD_InOutRecord_Log as d INNER JOIN T_BD_Control cc1 on d.ControlNumber=cc1.ControlNumber where  
  cc1.IfAttend=1 AND   DateDiff(dd,d.RecordTime,@dt)=0  and d.PersonIDCardCode=b.PersonIDCardCode order by d.RecordTime desc) as 'ControlNumber2',
						 (select  top 1 e.ControlName from T_BD_InOutRecord_Log as e INNER JOIN T_BD_Control cc2 on e.ControlNumber=cc2.ControlNumber where  
  cc2.IfAttend=1 AND   DateDiff(dd,e.RecordTime,@dt)=0  and e.PersonIDCardCode=b.PersonIDCardCode order by e.RecordTime desc) as 'ControlName2',
						(select  top 1 f.RecordTime from T_BD_InOutRecord_Log as f INNER JOIN T_BD_Control cc3 on f.ControlNumber=cc3.ControlNumber where  
  cc3.IfAttend=1 AND   DateDiff(dd,f.RecordTime,@dt)=0 and f.PersonIDCardCode=b.PersonIDCardCode order by f.RecordTime desc) as 'RecordTime2'
						 from T_BD_InOutRecord_Log as b INNER JOIN T_BD_Control cc on b.ControlNumber=cc.ControlNumber where  
             cc.IfAttend=1 AND   DateDiff(dd,b.RecordTime,@dt)=0  and b.PersonIDCardCode=@PersonIDCardCode order by b.RecordTime asc 
						) a

				--游标指向下一条数据
						FETCH next from C_PersonIDCardCode into @PersonIDCardCode;
				END
				--关闭游标
				CLose C_PersonIDCardCode;
				--释放游标
				DEALLOCATE C_PersonIDCardCode;
 
				---中间变量加1
				select @dt = DATEADD(DAY,1,@dt)
		end
END
GO

/****** Object:  Table [dbo].[T_BD_Temp_InOutRecord]    Script Date: 11/11/2019 13:58:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[T_BD_Temp_InOutRecord](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonName] [varchar](20) NULL,
	[PersonSex] [varchar](2) NULL,
	[PersonIDCardCode] [varchar](20) NULL,
	[WorkTypeName] [varchar](200) NULL,
	[DepName] [varchar](255) NULL,
	[ControlNumber] [bigint] NULL,
	[ControlName] [varchar](255) NULL,
	[RecordTime] [datetime] NULL,
	[RecordTime2] [datetime] NULL,
	[ControlName2] [varchar](255) NULL,
	[ControlNumber2] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
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
