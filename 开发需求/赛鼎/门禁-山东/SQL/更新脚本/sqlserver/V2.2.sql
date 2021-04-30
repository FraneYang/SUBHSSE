--数据库升级脚本Ver2.1-->Ver2.2
use BUILD;
alter table  T_BD_ControlConfig add [LightOpenTime] [varchar](50) ;
alter table  T_BD_ControlConfig add	[LightCloseTime] [varchar](50) ;