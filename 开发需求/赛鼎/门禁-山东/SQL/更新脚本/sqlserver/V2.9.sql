--数据库升级脚本Ver2.8-->Ver2.9
use BUILD;
alter table  [T_BD_LEDScreen] add	[ControlType] [varchar](255) ;
alter table  [T_BD_LEDScreen] add	[ShowNotice] int null ;
alter table  [T_BD_LEDScreen] add	[NoticeWidth] int null ;
alter table  [T_BD_LEDScreen] add	[NoticeHeight] int null ;
alter table  [T_BD_LEDScreen] add	[NoticeContent] [varchar](255) ;
alter table  [T_BD_LEDScreen] add	[NoticeFont] [varchar](255) ;
alter table  [T_BD_LEDScreen] add	[NoticeFontSize] int null ;


GO
/****** 对象:  Table [dbo].[T_BD_LEDInmethod]    脚本日期: 07/10/2019 12:30:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_BD_LEDInmethod](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[datavalue] [int] NULL,
	[dataname] [varchar](255) COLLATE Chinese_PRC_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

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
