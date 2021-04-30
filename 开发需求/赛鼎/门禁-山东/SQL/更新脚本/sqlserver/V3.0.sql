--数据库升级脚本Ver2.9-->Ver3.0
use BUILD;

GO
INSERT INTO [T_BD_Control_Type] ([CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES ( '1', 'IFC6023A', '7', '华安')
GO
GO
INSERT INTO [T_BD_Control_Type] ( [CategoryNumber], [TypeName], [ServerType], [Remark]) VALUES ( '2', 'IFC6013C', '5', '宇泛（安卓）')
GO