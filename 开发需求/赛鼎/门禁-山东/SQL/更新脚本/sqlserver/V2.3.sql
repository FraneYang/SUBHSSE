--���ݿ������ű�Ver2.2-->Ver2.3
use BUILD;
alter table  T_BD_InOutRecord_Log add UploadType int null DEFAULT ((0));
alter table  T_BD_InOutRecord_Log add UploadTV int null DEFAULT ((0));

alter table  T_BD_Person add	[PersonAddress] [varchar](255) ;
alter table  T_BD_Person add	[PersonNation] [varchar](255) ;
alter table  T_BD_Person add	[PersonIssuingDept] [varchar](255) ;
alter table  T_BD_Person add	[IDBeginDate] [varchar](50) ;
alter table  T_BD_Person add	[IDEndDate] [varchar](50) ;
alter table  T_BD_Person add    [UploadType] int null DEFAULT ((0));

alter table  T_BD_PersonLog add	[PersonAddress] [varchar](255) ;
alter table  T_BD_PersonLog add	[PersonNation] [varchar](255) ;
alter table  T_BD_PersonLog add	[PersonIssuingDept] [varchar](255) ;
alter table  T_BD_PersonLog add	[IDBeginDate] [varchar](50) ;
alter table  T_BD_PersonLog add	[IDEndDate] [varchar](50) ;

alter table  T_BD_LEDScreen add    LEDType int null DEFAULT ((0));

alter table  T_BD_ControlConfig add    StrangerIo int null DEFAULT ((0));
alter table  T_BD_ControlConfig add    StrangerVolue int null DEFAULT ((1));

GO
INSERT INTO [dbo].[T_BD_Config] ( [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES ( N'�ϴ�������IP', N'192.168.1.105', N'1', N'UploadServerIP')
GO
GO
INSERT INTO [dbo].[T_BD_Config] ( [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES ( N'�ϴ��������˿�', N'26001', N'1', N'UploadServerPort')
GO
GO
INSERT INTO [dbo].[T_BD_Config] ( [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES ( N'ϵͳ���ر��', N'10000', N'1', N'SysNumber')
GO
GO
INSERT INTO [dbo].[T_BD_Config] ( [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES ( N'�Ƿ����ϴ�������', N'��', N'1', N'IsUpload')
GO
GO
UPDATE T_BD_LEDScreen set [LEDModel]='512*320' ,[LEDType]=0
GO


GO
/****** ����:  Table [dbo].[T_BD_OffLineRecord]    �ű�����: 04/03/2019 14:34:39 ******/
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