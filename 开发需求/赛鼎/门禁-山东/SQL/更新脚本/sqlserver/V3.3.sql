--���ݿ������ű�Ver3.2-->Ver3.3
use BUILD;

GO
INSERT INTO T_BD_Config ( ConfigName, ConfigValue, IsEnable, ConfigCode) VALUES ( '�Ƿ����Զ��������ط���', '��', '0', 'IsLocalServer');
GO

alter table  T_BD_InOutRecord_Log add	PersonNation [varchar](255) ;
alter table  T_BD_InOutRecord_Log add	PersonBirthday [varchar](255) ;
alter table  T_BD_InOutRecord_Log add	PersonAddress [varchar](500) ;
alter table  T_BD_InOutRecord_Log add	PersonIssuingDept [varchar](255) ;
alter table  T_BD_InOutRecord_Log add	IDBeginDate [varchar](40) ;
alter table  T_BD_InOutRecord_Log add	IDEndDate [varchar](40) ;