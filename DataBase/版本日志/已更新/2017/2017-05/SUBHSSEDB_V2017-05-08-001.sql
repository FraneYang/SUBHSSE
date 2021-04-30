ALTER TABLE QualityAudit_SafePersonQuality ADD AuditDate DATETIME NULL
GO
ALTER TABLE QualityAudit_ManagePersonQuality ADD AuditDate DATETIME NULL
GO

ALTER TABLE QualityAudit_SafePersonQuality ALTER COLUMN  CertificateNo NVARCHAR(50) NULL
GO
ALTER TABLE QualityAudit_SafePersonQuality ALTER COLUMN  CertificateName NVARCHAR(50) NULL
GO
ALTER TABLE QualityAudit_SafePersonQuality ALTER COLUMN  SendUnit NVARCHAR(50) NULL
GO
ALTER TABLE QualityAudit_SafePersonQuality ALTER COLUMN  SendDate DATETIME NULL
GO
ALTER TABLE QualityAudit_SafePersonQuality ALTER COLUMN  LimitDate DATETIME NULL
GO

ALTER TABLE QualityAudit_ManagePersonQuality ALTER COLUMN  CertificateNo NVARCHAR(50) NULL
GO
ALTER TABLE QualityAudit_ManagePersonQuality ALTER COLUMN  CertificateName NVARCHAR(50) NULL
GO
ALTER TABLE QualityAudit_ManagePersonQuality ALTER COLUMN  SendUnit NVARCHAR(50) NULL
GO
ALTER TABLE QualityAudit_ManagePersonQuality ALTER COLUMN  SendDate DATETIME NULL
GO
ALTER TABLE QualityAudit_ManagePersonQuality ALTER COLUMN  LimitDate DATETIME NULL
GO