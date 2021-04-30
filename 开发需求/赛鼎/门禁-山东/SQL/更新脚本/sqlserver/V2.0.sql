--数据库升级脚本Ver1.0-->Ver2.0
use BUILD;
alter table T_BD_Person add X int null;
alter table T_BD_Person add Y int null;
alter table T_BD_Person add W int null;
alter table T_BD_Person add H int null;

alter table T_BD_PersonLog add X int null;
alter table T_BD_PersonLog add Y int null;
alter table T_BD_PersonLog add W int null;
alter table T_BD_PersonLog add H int null;

INSERT INTO [dbo].[T_BD_Config] ( [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES ( N'智能卡类型', N'1', N'1', N'ICCardType');

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_BD_OpenDoor_Log](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[AssociateKey] [bigint] NULL DEFAULT (NULL),
	[ControlNumber] [int] NULL DEFAULT (NULL),
	[OpenedType] [int] NULL DEFAULT (NULL),
	[OperateState] [int] NULL CONSTRAINT [DF__T_BD_Open__Opera__656C112C]  DEFAULT ((0)),
	[OperateTime] [datetime] NULL CONSTRAINT [DF__T_BD_Open__Opera__66603565]  DEFAULT (getdate()),
	[OperatorName] [varchar](255) NULL DEFAULT (NULL),
	[ControlName] [varchar](255) NULL,
	[ControlIP] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_BD_ControlConfig](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[Control_Key] [bigint] NULL,
	[FillLight] [int] NULL,
	[MatchValue] [int] NULL DEFAULT ((50)),
	[QualityValue] [int] NULL DEFAULT ((50)),
	[ControlNumber] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[T_BD_ControlConfig]  WITH CHECK ADD FOREIGN KEY([Control_Key])
REFERENCES [dbo].[T_BD_Control] ([P_Key])
ON UPDATE CASCADE
ON DELETE CASCADE