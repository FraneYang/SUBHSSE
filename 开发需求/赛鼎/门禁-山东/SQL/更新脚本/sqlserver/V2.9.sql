--���ݿ������ű�Ver2.8-->Ver2.9
use BUILD;
alter table  [T_BD_LEDScreen] add	[ControlType] [varchar](255) ;
alter table  [T_BD_LEDScreen] add	[ShowNotice] int null ;
alter table  [T_BD_LEDScreen] add	[NoticeWidth] int null ;
alter table  [T_BD_LEDScreen] add	[NoticeHeight] int null ;
alter table  [T_BD_LEDScreen] add	[NoticeContent] [varchar](255) ;
alter table  [T_BD_LEDScreen] add	[NoticeFont] [varchar](255) ;
alter table  [T_BD_LEDScreen] add	[NoticeFontSize] int null ;


GO
/****** ����:  Table [dbo].[T_BD_LEDInmethod]    �ű�����: 07/10/2019 12:30:56 ******/
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
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'1', N'0', N'���')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'2', N'1', N'������ʾ')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'3', N'2', N'�����ʾ')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'4', N'3', N'�Ϲ���ʾ')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'5', N'4', N'�ҹ���ʾ')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'6', N'5', N'�¹���ʾ')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'7', N'6', N'���������ʾ')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'8', N'7', N'�����¹���ʾ')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'9', N'8', N'�м�������չ��')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'10', N'9', N'�м�������չ��')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'11', N'10', N'�м�������չ��')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'12', N'11', N'������������')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'13', N'12', N'������������')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'14', N'13', N'��������չ��')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'15', N'14', N'��������չ��')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'16', N'15', N'�����Ͻ�����')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'17', N'16', N'�����½�����')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'18', N'17', N'�����Ͻ�����')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'19', N'18', N'�����½�����')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'20', N'19', N'������������')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'21', N'20', N'������������')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'22', N'21', N'�����Ҷ��')
GO
GO
INSERT INTO [dbo].[T_BD_LEDInmethod] ([P_Key], [datavalue], [dataname]) VALUES (N'23', N'22', N'�����Ҷ��')
GO
GO
SET IDENTITY_INSERT [dbo].[T_BD_LEDInmethod] OFF
GO
