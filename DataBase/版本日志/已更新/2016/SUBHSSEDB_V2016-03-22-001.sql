----�Ƿ���Զ�ִ�в��
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('71EF5F88-575B-483D-8A6C-96E4A40A3BEA','0','�Ƿ��Զ���ȡ��������',1,'Synchronization')
GO

UPDATE dbo.Sys_Menu SET MenuName='�������Ű�ȫ����' WHERE MenuId='DF1413F3-4CE5-40B3-A574-E01CE64FEA25'
GO

UPDATE dbo.Sys_Menu SET MenuName='�������Ű�ȫ�������' WHERE MenuId='F7B600D2-999C-4C60-96D4-B7CB7129C0B5'
GO

--DROP TABLE [dbo].[AttachFile]
--GO
--�฽����
CREATE TABLE [dbo].[AttachFile](
	[AttachFileId] [nvarchar](50) NOT NULL,
	[ToKeyId] [nvarchar](50) NULL,
	[AttachSource] [nvarchar](max) NULL,
	[AttachUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_AttachFile] PRIMARY KEY CLUSTERED 
(
	[AttachFileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AttachFile', @level2type=N'COLUMN',@level2name=N'AttachFileId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ҵ��id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AttachFile', @level2type=N'COLUMN',@level2name=N'ToKeyId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ת��·��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AttachFile', @level2type=N'COLUMN',@level2name=N'AttachSource'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���·��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AttachFile', @level2type=N'COLUMN',@level2name=N'AttachUrl'
GO



