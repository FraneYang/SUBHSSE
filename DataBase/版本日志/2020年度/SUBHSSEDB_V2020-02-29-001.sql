--周例会
ALTER TABLE Meeting_WeekMeeting ADD MeetingHostManId nvarchar(50) NULL
go
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主持人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_WeekMeeting', @level2type=N'COLUMN',@level2name=N'MeetingHostManId'
GO
ALTER TABLE Meeting_WeekMeeting ADD AttentPersonIds nvarchar(4000) NULL
go
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参会人IDs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_WeekMeeting', @level2type=N'COLUMN',@level2name=N'AttentPersonIds'
GO
ALTER TABLE [dbo].[Meeting_WeekMeeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_WeekMeeting_Sys_User1] FOREIGN KEY([MeetingHostManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO
ALTER TABLE [dbo].[Meeting_WeekMeeting] CHECK CONSTRAINT [FK_Meeting_WeekMeeting_Sys_User1]
GO

--月例会
ALTER TABLE Meeting_MonthMeeting ADD MeetingHostManId nvarchar(50) NULL
go
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主持人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_MonthMeeting', @level2type=N'COLUMN',@level2name=N'MeetingHostManId'
GO
ALTER TABLE Meeting_MonthMeeting ADD AttentPersonIds nvarchar(4000) NULL
go
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参会人IDs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_MonthMeeting', @level2type=N'COLUMN',@level2name=N'AttentPersonIds'
GO
ALTER TABLE [dbo].[Meeting_MonthMeeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_MonthMeeting_Sys_User1] FOREIGN KEY([MeetingHostManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO
ALTER TABLE [dbo].[Meeting_MonthMeeting] CHECK CONSTRAINT [FK_Meeting_MonthMeeting_Sys_User1]
GO

--专题会
ALTER TABLE Meeting_SpecialMeeting ADD MeetingHostManId nvarchar(50) NULL
go
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主持人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_SpecialMeeting', @level2type=N'COLUMN',@level2name=N'MeetingHostManId'
GO
ALTER TABLE Meeting_SpecialMeeting ADD AttentPersonIds nvarchar(4000) NULL
go
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参会人IDs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_SpecialMeeting', @level2type=N'COLUMN',@level2name=N'AttentPersonIds'
GO
ALTER TABLE [dbo].[Meeting_SpecialMeeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_SpecialMeeting_Sys_User1] FOREIGN KEY([MeetingHostManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO
ALTER TABLE [dbo].[Meeting_SpecialMeeting] CHECK CONSTRAINT [FK_Meeting_SpecialMeeting_Sys_User1]
GO

--其他会
ALTER TABLE Meeting_AttendMeeting ADD MeetingHostManId nvarchar(50) NULL
go
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主持人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_AttendMeeting', @level2type=N'COLUMN',@level2name=N'MeetingHostManId'
GO
ALTER TABLE Meeting_AttendMeeting ADD AttentPersonIds nvarchar(4000) NULL
go
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参会人IDs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_AttendMeeting', @level2type=N'COLUMN',@level2name=N'AttentPersonIds'
GO
ALTER TABLE [dbo].[Meeting_AttendMeeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_AttendMeeting_Sys_User1] FOREIGN KEY([MeetingHostManId])
REFERENCES [dbo].[Sys_User] ([UserId])
GO
ALTER TABLE [dbo].[Meeting_AttendMeeting] CHECK CONSTRAINT [FK_Meeting_AttendMeeting_Sys_User1]
GO
--新增参会人数
ALTER TABLE Meeting_AttendMeeting ADD AttentPersonNum INT NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参会人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Meeting_AttendMeeting', @level2type=N'COLUMN',@level2name=N'AttentPersonNum'
GO