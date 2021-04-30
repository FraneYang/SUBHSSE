ALTER TABLE Sys_User ADD Sex CHAR(1) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别（1-男，2-女）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'Sex'
GO
ALTER TABLE Sys_User ADD BirthDay datetime NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出生年月' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'BirthDay'
GO
ALTER TABLE Sys_User ADD Marriage NVARCHAR(20) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'婚姻状况' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'Marriage'
GO
ALTER TABLE Sys_User ADD Nation NVARCHAR(20) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'民族' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'Nation'
GO
ALTER TABLE Sys_User ADD IdentityCard NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'IdentityCard'
GO
ALTER TABLE Sys_User ADD Email NVARCHAR(100) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'Email'
GO
ALTER TABLE Sys_User ADD Telephone NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'Telephone'
GO
ALTER TABLE Sys_User ADD Education NVARCHAR(20) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文化程度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'Education'
GO
ALTER TABLE Sys_User ADD Hometown NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'籍贯' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'Hometown'
GO
ALTER TABLE Sys_User ADD PositionId NVARCHAR(50) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'PositionId'
GO
ALTER TABLE [dbo].[Sys_User]  WITH CHECK ADD  CONSTRAINT [FK_Sys_User_Base_Position] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Base_Position] ([PositionId])
GO
ALTER TABLE [dbo].[Sys_User] CHECK CONSTRAINT [FK_Sys_User_Base_Position]
GO
ALTER TABLE Sys_User ADD PhotoUrl NVARCHAR(500) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'照片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'PhotoUrl'
GO
ALTER TABLE Sys_User ADD Performance NVARCHAR(800) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'简历' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sys_User', @level2type=N'COLUMN',@level2name=N'Performance'
GO