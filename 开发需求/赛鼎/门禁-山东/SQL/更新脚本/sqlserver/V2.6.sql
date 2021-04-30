--数据库升级脚本Ver2.3-->Ver2.4
use BUILD;
GO
/****** 对象:  Table [dbo].[T_BD_MaFeiDaConfig]    脚本日期: 05/15/2019 09:46:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_BD_MaFeiDaConfig](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[Control_Key] [bigint] NULL,
	[ControlNumber] [int] NULL,
	[companyName] [varchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[displayModType] [int] NULL DEFAULT ((1)),
	[displayModContent] [varchar](500) COLLATE Chinese_PRC_CI_AS NULL,
	[delayTimeForCloseDoor] [int] NULL DEFAULT ((500)),
	[identifyDistance] [int] NULL DEFAULT ((0)),
	[identifyScores] [int] NULL DEFAULT ((80)),
	[saveIdentifyTime] [int] NULL,
	[recRank] [int] NULL DEFAULT ((1)),
	[multiplayerDetection] [int] NULL DEFAULT ((1)),
	[wg] [varchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[closeTimeStart] [varchar](40) COLLATE Chinese_PRC_CI_AS NULL,
	[closeTimeEnd] [varchar](40) COLLATE Chinese_PRC_CI_AS NULL,
	[ttsModType] [int] NULL DEFAULT ((1)),
	[ttsModContent] [varchar](500) COLLATE Chinese_PRC_CI_AS NULL,
	[recStrangerType] [int] NULL DEFAULT ((1)),
	[recStrangerTimesThreshold] [int] NULL DEFAULT ((3)),
	[ttsModStrangerType] [int] NULL DEFAULT ((1)),
	[ttsModStrangerContent] [varchar](500) COLLATE Chinese_PRC_CI_AS NULL,
	[logo] [varchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[recModeFaceEnable] [int] NULL DEFAULT ((2)),
	[recModeCardEnable] [int] NULL DEFAULT ((1)),
	[recModeCardIntf] [int] NULL DEFAULT ((1)),
	[recModeCardFaceEnable] [int] NULL DEFAULT ((1)),
	[recModeCardFaceIntf] [int] NULL DEFAULT ((1)),
	[recModeIdCardFaceEnable] [int] NULL DEFAULT ((1)),
	[recModeIdCardFaceIntf] [int] NULL DEFAULT ((2)),
	[recModeIdCardFaceHardware] [int] NULL DEFAULT ((1)),
	[recFaceCardValue] [int] NULL DEFAULT ((55)),
PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

GO
alter table  T_BD_InOutRecord_Log add [Type] [varchar](255);
GO
GO
alter table  T_BD_Person add RandomKey [bigint] NULL;
GO
GO
alter table  T_BD_PersonLog add RandomKey [bigint] NULL;
GO
GO
INSERT INTO [dbo].[T_BD_Data] ( [DataType], [DataName], [DataValue],[CreateTime]) VALUES ( 2, '二代灵目', 4,'2019-04-19 11:32:12.000')
GO
GO
INSERT INTO [dbo].[T_BD_Data] ( [DataType], [DataName], [DataValue],[CreateTime]) VALUES ( 2, 'MFD', 5,'2019-05-08 11:27:11.000')
GO
GO
INSERT INTO [dbo].[T_BD_Data] ( [DataType], [DataName], [DataValue],[CreateTime]) VALUES ( 2, '小智IDC', 6,'2019-05-15 13:48:19.000')
GO
