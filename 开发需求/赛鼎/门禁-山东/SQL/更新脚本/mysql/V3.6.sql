use BUILD;
INSERT INTO T_BD_Config ( ConfigName, ConfigValue, IsEnable, ConfigCode) VALUES ( 'Ĭ�����ü�·��Ƶ', '4', '1', 'SetVideo');
INSERT INTO T_BD_Config ( ConfigName, ConfigValue, IsEnable, ConfigCode) VALUES ( '�Ƿ�����������', '��', '0', 'IsAutoStart');
INSERT INTO T_BD_Permission ( P_Key,PermissionName, Type, Remark, CreateTime, Parent_Key, IsDelete, Icon, OrderId) VALUES ( 314,'��Ա�·���־', '2', null, '2019-11-26 09:55:12.580', '6', '0', null, '4');
INSERT INTO T_BD_Role_Permission ( Role_Key, Permission_Key, CreateTime) VALUES ( '1', '314', '2019-11-26 09:56:43.000');