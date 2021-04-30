--数据库升级脚本Ver2.0-->Ver2.1
use BUILD;
alter table T_BD_Control add [State] int null DEFAULT ((0));
alter table T_BD_Control add [OnlineTime] datetime null;

alter table  T_BD_ControlConfig add [ImageUploadType] [int] NULL DEFAULT ((0));
alter table  T_BD_ControlConfig add	[TimeInterval] [int] NULL DEFAULT ((10));
alter table  T_BD_ControlConfig add	[FaceSwitch] [int] NULL DEFAULT ((1));
alter table  T_BD_ControlConfig add	[WriteIo] [int] NULL DEFAULT ((1));
alter table  T_BD_ControlConfig add	[WriteVolue] [int] NULL DEFAULT ((0));
alter table  T_BD_ControlConfig add	[BlackIo] [int] NULL DEFAULT ((0));
alter table  T_BD_ControlConfig add	[BlackVolue] [int] NULL DEFAULT ((1));