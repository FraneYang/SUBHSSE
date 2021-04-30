--数据库升级脚本Ver2.3-->Ver2.4
use BUILD;
GO
/****** 对象:  Table [dbo].[T_BD_OffLineRecord]    脚本日期: 04/03/2019 14:34:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_BD_OffLineRecord](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonName] [varchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[PersonSex] [varchar](2) COLLATE Chinese_PRC_CI_AS NULL,
	[PersonIDCardCode] [varchar](20) COLLATE Chinese_PRC_CI_AS NULL,
	[ControlNumber] [bigint] NULL,
	[ControlName] [varchar](255) COLLATE Chinese_PRC_CI_AS NULL,
	[RecordTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF