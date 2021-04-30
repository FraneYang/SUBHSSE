
CREATE VIEW [dbo].[View_QualityAudit_PersonQuality] 
 AS 
/*现场人员资质视图*/
SELECT q.PersonQualityId
      ,q.PersonId
	  ,p.CardNo
	  ,p.IdentityCard
	  ,p.ProjectId
	  ,p.UnitId
	  ,project.ProjectName
	  ,project.ProjectCode
      ,q.CertificateNo
      ,q.Grade
      ,q.SendUnit
      ,q.SendDate
      ,q.LimitDate
      ,q.LateCheckDate
      ,q.ApprovalPerson
      ,q.Remark
      ,q.CompileMan
	  ,u.UserName AS CompileManName
      ,q.CompileDate
      ,q.AuditDate
      ,q.CertificateId
	  ,c.CertificateName
  FROM dbo.QualityAudit_PersonQuality AS q
  LEFT JOIN dbo.SitePerson_Person AS p ON q.PersonId = p.PersonId
  LEFT JOIN dbo.Base_Project AS project ON project.ProjectId = p.ProjectId
  LEFT JOIN dbo.Sys_User AS u ON u.UserId = q.CompileMan
  LEFT JOIN dbo.Base_Certificate AS c ON c.CertificateId = q.CertificateId
  where q.CertificateId is not null

GO
