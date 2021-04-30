use BUILD;
INSERT INTO T_BD_Config ( ConfigName, ConfigValue, IsEnable, ConfigCode) VALUES ( '默认设置几路视频', '4', '1', 'SetVideo');
INSERT INTO T_BD_Config ( ConfigName, ConfigValue, IsEnable, ConfigCode) VALUES ( '是否开启开机自启', '是', '0', 'IsAutoStart');
INSERT INTO T_BD_Permission ( P_Key,PermissionName, Type, Remark, CreateTime, Parent_Key, IsDelete, Icon, OrderId) VALUES ( 314,'人员下发日志', '2', null, '2019-11-26 09:55:12.580', '6', '0', null, '4');
INSERT INTO T_BD_Role_Permission ( Role_Key, Permission_Key, CreateTime) VALUES ( '1', '314', '2019-11-26 09:56:43.000');