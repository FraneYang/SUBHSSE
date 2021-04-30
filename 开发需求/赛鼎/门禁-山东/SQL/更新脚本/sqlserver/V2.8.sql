--数据库升级脚本Ver2.6-->Ver2.8
use BUILD;

GO
/****** 对象:  Table [dbo].[T_BD_Control_Category]    脚本日期: 06/25/2019 15:53:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_BD_Control_Category](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryNumber] [int] NULL,
	[CategoryName] [varchar](255) COLLATE Chinese_PRC_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

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
SET IDENTITY_INSERT [dbo].[T_BD_Control_Category] OFF
GO

GO
/****** 对象:  Table [dbo].[T_BD_Control_Type]    脚本日期: 06/25/2019 15:55:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_BD_Control_Type](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryNumber] [int] NULL,
	[TypeName] [varchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[ServerType] [int] NULL,
	[Remark] [varchar](255) COLLATE Chinese_PRC_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


SET IDENTITY_INSERT [dbo].[T_BD_Control_Type] ON
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'1', N'1', N'IFC6020A', N'1', N'智小智')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'2', N'1', N'IFC6020B', N'1', N'智小智')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'3', N'1', N'IFC6021A', N'2', N'华夏灵目二代')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'4', N'1', N'IFC6021B', N'2', N'华夏灵目二代')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'5', N'1', N'IFC6022A', N'3', N'智慧芯/华夏灵目一代')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'6', N'1', N'IFC6022B', N'3', N'智慧芯/华夏灵目一代')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'7', N'2', N'IFC6011A', N'4', N'华夏慕颜')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'8', N'2', N'IFC6012B', N'5', N'马飞达')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'9', N'3', N'IDC7115A', N'4', N'华夏慕颜')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'10', N'3', N'IDC7115B', N'4', N'华夏慕颜')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'11', N'3', N'IDC7115C', N'4', N'华夏慕颜')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'12', N'4', N'IFC6010A', N'4', N'华夏慕颜')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'13', N'4', N'IFC6010B', N'4', N'华夏慕颜')
GO
GO
INSERT INTO [dbo].[T_BD_Control_Type] ([P_Key], [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES (N'14', N'4', N'IFC6010C', N'4', N'华夏慕颜')
GO
GO
SET IDENTITY_INSERT [dbo].[T_BD_Control_Type] OFF
GO


GO
/****** 对象:  Table [dbo].[T_BD_LEDLeaf]    脚本日期: 06/25/2019 15:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_BD_LEDLeaf](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[LEDScreenKey] [bigint] NULL,
	[LeafNunber] [int] NULL,
	[LeafWait] [int] NULL,
	[LEDRows] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** 对象:  Table [dbo].[T_BD_LEDLeafRow]    脚本日期: 06/25/2019 15:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_BD_LEDLeafRow](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[LEDScreenKey] [bigint] NOT NULL,
	[LEDLeaf] [tinyint] NOT NULL,
	[RowIndex] [tinyint] NOT NULL,
	[RowText] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[TextFont] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[fontsize] [tinyint] NOT NULL,
	[spacing] [tinyint] NOT NULL DEFAULT ((0)),
	[ShowWatchEvent] [tinyint] NOT NULL DEFAULT ((0)),
	[defLeft] [int] NOT NULL DEFAULT ((0)),
	[defTop] [int] NOT NULL DEFAULT ((0)),
	[defWidth] [int] NOT NULL DEFAULT ((0)),
	[defHeight] [int] NOT NULL DEFAULT ((0)),
	[ShowTimeClock] [int] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK__T_BD_LEDLeafRow__0E6E26BF] PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC,
	[LEDLeaf] ASC,
	[RowIndex] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


GO
/****** 对象:  Table [dbo].[T_BD_ZhiBiXuanConfig]    脚本日期: 06/25/2019 15:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_BD_ZhiBiXuanConfig](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](500) COLLATE Chinese_PRC_CI_AS NULL,
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
	[ledStartTime1] [varchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[ledEndTime1] [varchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[nLevel1] [int] NULL DEFAULT ((100)),
	[ip] [varchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[subnetMask] [varchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[gateway] [varchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[ledStartTime2] [varchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[ledEndTime2] [varchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[nLevel2] [int] NULL DEFAULT ((100)),
	[isLedSet1] [int] NULL DEFAULT ((0)),
	[isLedSet2] [int] NULL DEFAULT ((0)),
	[isLedSet3] [int] NULL DEFAULT ((0)),
	[ledStartTime3] [varchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[ledEndTime3] [varchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[nLevel3] [int] NULL DEFAULT ((100)),
	[Control_Key] [bigint] NULL,
	[ControlNumber] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[T_BD_ZhiBiXuanConfig]  WITH CHECK ADD FOREIGN KEY([Control_Key])
REFERENCES [dbo].[T_BD_Control] ([P_Key])
ON UPDATE CASCADE
ON DELETE CASCADE

GO
DELETE FROM T_BD_Data where DataType=2;
GO
DELETE FROM T_BD_Config WHERE ConfigCode='ControllerType';