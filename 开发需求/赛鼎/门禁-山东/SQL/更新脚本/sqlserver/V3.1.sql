--���ݿ������ű�Ver3.0-->Ver3.1
use BUILD;

drop table T_BD_Role_Permission;
drop table T_BD_Permission;

/****** ����:  Table [dbo].[T_BD_Permission]    �ű�����: 08/29/2019 18:13:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_BD_Permission](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[PermissionName] [varchar](255) NULL,
	[Type] [int] NULL,
	[Remark] [text] NULL,
	[CreateTime] [datetime] NULL DEFAULT (getdate()),
	[Parent_Key] [bigint] NULL,
	[IsDelete] [int] NULL DEFAULT ((0)),
	[Icon] [varchar](255) NULL,
	[OrderId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** ����:  ForeignKey [permission_permission_parentKey1]    �ű�����: 08/29/2019 18:13:19 ******/
ALTER TABLE [dbo].[T_BD_Permission]  WITH CHECK ADD  CONSTRAINT [permission_permission_parentKey1] FOREIGN KEY([Parent_Key])
REFERENCES [dbo].[T_BD_Permission] ([P_Key])
GO
ALTER TABLE [dbo].[T_BD_Permission] CHECK CONSTRAINT [permission_permission_parentKey1]
GO



/****** ����:  Table [dbo].[T_BD_Role_Permission]    �ű�����: 08/29/2019 18:13:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_BD_Role_Permission](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[Role_Key] [bigint] NULL,
	[Permission_Key] [bigint] NULL,
	[CreateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** ����:  ForeignKey [rolePermission_permission_permissionKey1]    �ű�����: 08/29/2019 18:13:29 ******/
ALTER TABLE [dbo].[T_BD_Role_Permission]  WITH CHECK ADD  CONSTRAINT [rolePermission_permission_permissionKey1] FOREIGN KEY([Permission_Key])
REFERENCES [dbo].[T_BD_Permission] ([P_Key])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_BD_Role_Permission] CHECK CONSTRAINT [rolePermission_permission_permissionKey1]
GO
/****** ����:  ForeignKey [rolePermission_role_roleKey]    �ű�����: 08/29/2019 18:13:29 ******/
ALTER TABLE [dbo].[T_BD_Role_Permission]  WITH CHECK ADD  CONSTRAINT [rolePermission_role_roleKey] FOREIGN KEY([Role_Key])
REFERENCES [dbo].[T_BD_Role] ([P_Key])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_BD_Role_Permission] CHECK CONSTRAINT [rolePermission_role_roleKey]
GO

GO
INSERT INTO [dbo].[T_BD_Config] ( [ConfigName], [ConfigValue], [IsEnable], [ConfigCode]) VALUES ( '�Ƿ����Զ���ȡIP', '��', '1', 'IsAutoGetIP');
GO
-- ----------------------------
-- Records of T_BD_Permission
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_BD_Permission] ON
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'1', N'ϵͳ����', N'1', null, N'2019-08-20 09:47:23.193', null, N'0', N'system.png', N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'2', N'Ӳ������', N'1', null, N'2019-08-20 09:48:26.577', null, N'0', N'hardware.png', N'3')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'3', N'��Ա����', N'1', null, N'2019-08-20 09:48:50.263', null, N'0', N'whiteperson.png', N'4')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'4', N'ͳ�Ʊ���', N'1', null, N'2019-08-20 09:49:05.003', null, N'0', N'reports.png', N'5')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'5', N'�û�����', N'1', null, N'2019-08-20 09:49:09.653', null, N'0', N'user.png', N'6')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'6', N'��־����', N'1', null, N'2019-08-20 09:49:43.560', null, N'0', N'log.png', N'7')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'7', N'��������', N'1', null, N'2019-08-20 09:58:07.250', null, N'0', N'about.png', N'8')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'8', N'ϵͳ����', N'2', null, N'2019-08-20 10:25:59.353', N'1', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'9', N'�豸����', N'2', null, N'2019-08-20 10:26:13.797', N'2', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'10', N'��ʾ������', N'2', null, N'2019-08-20 10:28:49.260', N'2', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'11', N'���ֹ���', N'2', null, N'2019-08-20 15:27:44.960', N'3', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'12', N'��Ա����', N'2', null, N'2019-08-20 15:27:58.700', N'3', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'13', N'��Ա�·�', N'2', null, N'2019-08-20 15:28:36.237', N'3', N'0', null, N'3')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'14', N'���ڼ�¼', N'2', null, N'2019-08-20 15:29:39.570', N'4', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'15', N'������¼', N'2', null, N'2019-08-20 15:29:52.030', N'4', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'16', N'�豸������', N'2', null, N'2019-08-20 15:30:32.030', N'4', N'0', null, N'4')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'17', N'�豸��¼', N'2', null, N'2019-08-20 15:32:21.443', N'4', N'0', null, N'5')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'18', N'�û�����', N'2', null, N'2019-08-20 15:32:47.353', N'5', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'19', N'����բ��־', N'2', null, N'2019-08-20 15:33:22.993', N'6', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'20', N'��¼��־', N'2', null, N'2019-08-20 15:33:33.903', N'6', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'21', N'�쳣��־', N'2', null, N'2019-08-20 15:33:44.277', N'6', N'0', null, N'3')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'22', N'ע�����', N'2', null, N'2019-08-20 15:34:08.337', N'7', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'23', N'������־', N'2', null, N'2019-08-20 15:34:47.870', N'7', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'24', N'����汾', N'2', null, N'2019-08-20 15:35:09.420', N'7', N'0', null, N'3')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'25', N'�汾����', N'2', null, N'2019-08-20 15:35:22.550', N'7', N'0', null, N'4')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'27', N'��ҳ', N'1', null, N'2019-08-23 09:52:54.513', null, N'0', N'home.png', N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'28', N'�豸���', N'3', null, N'2019-08-23 11:31:40.160', N'9', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'29', N'�豸�޸�', N'3', null, N'2019-08-23 11:31:57.867', N'9', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'30', N'�豸ɾ��', N'3', null, N'2019-08-23 11:32:06.930', N'9', N'0', null, N'3')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'31', N'����豸������', N'3', null, N'2019-08-23 11:32:52.057', N'9', N'0', null, N'4')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'32', N'�豸��բ', N'3', null, N'2019-08-23 11:33:04.433', N'9', N'0', null, N'5')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'33', N'�豸��բ', N'3', null, N'2019-08-23 11:33:16.343', N'9', N'0', null, N'6')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'34', N'Ȩ�������', N'3', null, N'2019-08-23 15:54:34.860', N'9', N'0', null, N'7')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'35', N'Ȩ�����޸�', N'3', null, N'2019-08-23 15:54:48.217', N'9', N'0', null, N'8')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'36', N'Ȩ����ɾ��', N'3', null, N'2019-08-23 15:55:01.707', N'9', N'0', null, N'9')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'37', N'��ʾ�����', N'3', null, N'2019-08-23 19:17:39.603', N'10', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'38', N'��ʾ���޸�', N'3', null, N'2019-08-23 19:17:51.320', N'10', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'39', N'��ʾ��ɾ��', N'3', null, N'2019-08-23 19:18:04.130', N'10', N'0', null, N'3')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'40', N'�������', N'3', null, N'2019-08-24 10:05:46.980', N'11', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'41', N'�����޸�', N'3', null, N'2019-08-24 10:06:12.220', N'11', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'42', N'����ɾ��', N'3', null, N'2019-08-24 10:06:26.113', N'11', N'0', null, N'3')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'43', N'������־', N'2', null, N'2019-08-24 10:53:23.407', N'4', N'0', null, N'3')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'44', N'������־����', N'3', null, N'2019-08-26 11:49:28.167', N'43', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'45', N'������־ɾ��', N'3', null, N'2019-08-26 11:49:41.363', N'43', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'46', N'���ڼ�¼����', N'3', null, N'2019-08-26 14:50:17.870', N'14', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'47', N'���ڼ�¼ɾ��', N'3', null, N'2019-08-26 14:50:32.107', N'14', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'48', N'������¼����', N'3', null, N'2019-08-26 16:04:17.603', N'15', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'49', N'������¼ɾ��', N'3', null, N'2019-08-26 16:04:37.840', N'15', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'50', N'�û����', N'3', null, N'2019-08-27 14:37:14.890', N'18', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'51', N'�û��޸�', N'3', null, N'2019-08-27 14:37:31.140', N'18', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'52', N'�û�ɾ��', N'3', null, N'2019-08-27 14:37:51.250', N'18', N'0', null, N'3')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'53', N'�����ɫ', N'3', null, N'2019-08-27 14:38:16.257', N'18', N'0', null, N'4')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'54', N'�޸�����', N'3', null, N'2019-08-27 14:38:29.300', N'18', N'0', null, N'5')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'55', N'��ɫ���', N'3', null, N'2019-08-27 14:38:50.403', N'18', N'0', null, N'6')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'56', N'��ɫ�޸�', N'3', null, N'2019-08-27 14:39:04.877', N'18', N'0', null, N'7')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'57', N'��ɫɾ��', N'3', null, N'2019-08-27 14:39:16.000', N'18', N'0', null, N'8')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'58', N'����Ȩ��', N'3', null, N'2019-08-27 14:39:43.603', N'18', N'0', null, N'9')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'59', N'�������', N'3', null, N'2019-08-28 15:17:49.393', N'12', N'0', null, N'1')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'60', N'�����޸�', N'3', null, N'2019-08-28 15:18:00.737', N'12', N'0', null, N'2')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'61', N'����ɾ��', N'3', null, N'2019-08-28 15:18:09.763', N'12', N'0', null, N'3')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'62', N'��Ա���', N'3', null, N'2019-08-28 15:18:26.833', N'12', N'0', null, N'4')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'63', N'��Ա�޸�', N'3', null, N'2019-08-28 15:18:39.747', N'12', N'0', null, N'5')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'64', N'��Աɾ��', N'3', null, N'2019-08-28 15:18:54.093', N'12', N'0', null, N'6')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'65', N'��Ա��������', N'3', null, N'2019-08-28 15:19:08.057', N'12', N'0', null, N'7')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'66', N'���䲿��', N'3', null, N'2019-08-28 15:19:32.773', N'12', N'0', null, N'8')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'67', N'������Ч��', N'3', null, N'2019-08-28 15:19:45.743', N'12', N'0', null, N'9')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'68', N'����ѡ��', N'3', null, N'2019-08-28 15:20:00.993', N'12', N'0', null, N'10')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'69', N'����ȫ��', N'3', null, N'2019-08-28 15:20:13.387', N'12', N'0', null, N'11')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'70', N'��ְ', N'3', null, N'2019-08-28 15:20:24.140', N'12', N'0', null, N'12')
GO
GO
INSERT INTO [dbo].[T_BD_Permission] ([P_Key], [PermissionName], [Type], [Remark], [CreateTime], [Parent_Key], [IsDelete], [Icon], [OrderId]) VALUES (N'71', N'����Ȩ����', N'3', null, N'2019-08-28 15:46:53.373', N'12', N'0', null, N'13')
GO
GO
SET IDENTITY_INSERT [dbo].[T_BD_Permission] OFF
GO

-- ----------------------------
-- Records of T_BD_Role_Permission
-- ----------------------------
SET IDENTITY_INSERT [dbo].[T_BD_Role_Permission] ON
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'162', N'1', N'27', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'163', N'1', N'1', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'164', N'1', N'8', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'165', N'1', N'2', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'166', N'1', N'9', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'167', N'1', N'28', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'168', N'1', N'29', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'169', N'1', N'30', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'170', N'1', N'31', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'171', N'1', N'32', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'172', N'1', N'33', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'173', N'1', N'34', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'174', N'1', N'35', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'175', N'1', N'36', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'176', N'1', N'10', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'177', N'1', N'37', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'178', N'1', N'38', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'179', N'1', N'39', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'180', N'1', N'3', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'181', N'1', N'11', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'182', N'1', N'40', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'183', N'1', N'41', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'184', N'1', N'42', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'185', N'1', N'12', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'186', N'1', N'59', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'187', N'1', N'60', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'188', N'1', N'61', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'189', N'1', N'62', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'190', N'1', N'63', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'191', N'1', N'64', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'192', N'1', N'65', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'193', N'1', N'66', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'194', N'1', N'67', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'195', N'1', N'68', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'196', N'1', N'69', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'197', N'1', N'70', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'198', N'1', N'71', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'199', N'1', N'13', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'200', N'1', N'4', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'201', N'1', N'14', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'202', N'1', N'46', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'203', N'1', N'47', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'204', N'1', N'15', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'205', N'1', N'48', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'206', N'1', N'49', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'207', N'1', N'43', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'208', N'1', N'44', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'209', N'1', N'45', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'210', N'1', N'16', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'211', N'1', N'17', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'212', N'1', N'5', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'213', N'1', N'18', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'214', N'1', N'50', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'215', N'1', N'51', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'216', N'1', N'52', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'217', N'1', N'53', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'218', N'1', N'54', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'219', N'1', N'55', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'220', N'1', N'56', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'221', N'1', N'57', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'222', N'1', N'58', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'223', N'1', N'6', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'224', N'1', N'19', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'225', N'1', N'20', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'226', N'1', N'21', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'227', N'1', N'7', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'228', N'1', N'22', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'229', N'1', N'23', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'230', N'1', N'24', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'231', N'1', N'25', N'2019-08-28 16:03:25.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'232', N'2', N'27', N'2019-08-29 17:19:39.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'233', N'2', N'1', N'2019-08-29 17:19:39.000')
GO
GO
INSERT INTO [dbo].[T_BD_Role_Permission] ([P_Key], [Role_Key], [Permission_Key], [CreateTime]) VALUES (N'234', N'2', N'8', N'2019-08-29 17:19:39.000')
GO
GO
SET IDENTITY_INSERT [dbo].[T_BD_Role_Permission] OFF
GO