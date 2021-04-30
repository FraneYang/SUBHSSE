UPDATE Sys_FlowOperate SET Url='../Meeting/ClassMeetingView.aspx?ClassMeetingId={0}' 
WHERE MenuId='F8ADCDBC-AAAD-4884-9935-2B63562E4779'
GO

DELETE FROM Meeting_ClassMeeting WHERE ProjectId IS NULL
GO
DELETE FROM Sys_FlowOperate WHERE ProjectId IS NULL AND MenuId='F8ADCDBC-AAAD-4884-9935-2B63562E4779'
GO
UPDATE Meeting_ClassMeeting SET States=2 WHERE ClassMeetingId IN 
(select DataId from Sys_FlowOperate where IsClosed =1 and MenuId='F8ADCDBC-AAAD-4884-9935-2B63562E4779')
GO

UPDATE Sys_FlowOperate SET State=2 where IsClosed =1 and MenuId='F8ADCDBC-AAAD-4884-9935-2B63562E4779'
GO

UPDATE Sys_FlowOperate SET State=2 where DataId IN
(SELECT ClassMeetingId from Meeting_ClassMeeting where States=2) 
GO
