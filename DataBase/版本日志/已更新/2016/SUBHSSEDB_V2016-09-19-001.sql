UPDATE Sys_User SET Account='sysgly' WHERE UserId='AF17168B-87BD-4GLY-1111-F0A0A1158F9B'
GO
--������־��������Ŀid
ALTER TABLE Sys_Log ADD ProjectId NVARCHAR(50) NULL
GO
ALTER TABLE [dbo].[Sys_Log]  WITH CHECK ADD  CONSTRAINT [FK_Sys_Log_Base_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Base_Project] ([ProjectId])
GO
ALTER TABLE [dbo].[Sys_Log] CHECK CONSTRAINT [FK_Sys_Log_Base_Project]
GO
-- ϵͳ��������
INSERT INTO Sys_Set (SetId,SetName,IsAuto,SetValue)  --�˵�ģʽ
VALUES(0,'�˵�ģʽ',NULL,'A')
GO
