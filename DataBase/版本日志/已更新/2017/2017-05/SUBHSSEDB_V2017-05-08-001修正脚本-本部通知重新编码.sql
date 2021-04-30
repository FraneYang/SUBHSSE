--对本部通知重新编码修正脚本
DELETE FROM Sys_CodeRecords WHERE ProjectId IS NULL AND (MenuId='E2F56879-5337-4BEF-8113-62845DF616EF' OR MenuId='B06EC998-60D2-4CBF-8080-9F000A1595AA')
GO

INSERT INTO Sys_CodeRecords 
	(CodeRecordId,ProjectId,MenuId,DataId,UnitId,CompileDate,SortIndex,RuleCodes,Digit,Code,OwnerRuleCodes,OwerDigit,OwnerCode) 
SELECT NEWID(),NULL,'E2F56879-5337-4BEF-8113-62845DF616EF',NoticeId,NULL,CompileDate,row_number() OVER(ORDER BY CompileDate),NULL,4
	,REPLICATE('0',4-len((row_number() OVER(ORDER BY CompileDate))))+cast((row_number() OVER(ORDER BY CompileDate)) as varchar)
	,null,4,REPLICATE('0',4-len((row_number() OVER(ORDER BY CompileDate))))+cast((row_number() OVER(ORDER BY CompileDate)) as varchar)
FROM InformationProject_Notice WHERE ProjectId IS NULL
ORDER BY CompileDate
GO

--安全人员资质修改
INSERT INTO QualityAudit_SafePersonQuality
(SafePersonQualityId,PersonId,CertificateNo,CertificateName,Grade,SendUnit,SendDate,LimitDate,LateCheckDate,ApprovalPerson,Remark,CompileMan,CompileDate,AuditDate)
SELECT A.PersonQualityId,A.PersonId,A.CertificateNo,A.CertificateName,A.Grade,A.SendUnit,A.SendDate,A.LimitDate,A.LateCheckDate,A.ApprovalPerson,A.Remark,A.CompileMan,A.CompileDate,A.AuditDate
FROM QualityAudit_PersonQuality A
LEFT JOIN SitePerson_Person ON A.PersonId = SitePerson_Person.PersonId
LEFT JOIN Base_WorkPost AS WorkPost ON WorkPost.WorkPostId = SitePerson_Person.WorkPostId 
LEFT JOIN QualityAudit_SafePersonQuality AS B ON B.PersonId = SitePerson_Person.PersonId 
WHERE WorkPost.IsHsse =1 AND B.SafePersonQualityId IS NULL
GO

--删除班前会多余审核记录
DELETE FROM Sys_FlowOperate WHERE MenuId ='F8ADCDBC-AAAD-4884-9935-2B63562E4779' 
AND DataId NOT IN (SELECT ClassMeetingId FROM Meeting_ClassMeeting)
GO