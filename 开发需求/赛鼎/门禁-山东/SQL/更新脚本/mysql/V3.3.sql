use BUILD;
INSERT INTO T_BD_Config ( ConfigName, ConfigValue, IsEnable, ConfigCode) VALUES ( '是否开启自动启动本地服务', '是', '0', 'IsLocalServer');
ALTER TABLE  T_BD_InOutRecord_Log ADD COLUMN    PersonNation VARCHAR(255);
alter table  T_BD_InOutRecord_Log ADD COLUMN	PersonBirthday varchar(255) ;
alter table  T_BD_InOutRecord_Log ADD COLUMN	PersonAddress varchar(500) ;
alter table  T_BD_InOutRecord_Log ADD COLUMN	PersonIssuingDept varchar(255) ;
alter table  T_BD_InOutRecord_Log ADD COLUMN	IDBeginDate varchar(40) ;
alter table  T_BD_InOutRecord_Log ADD COLUMN	IDEndDate varchar(40) ;