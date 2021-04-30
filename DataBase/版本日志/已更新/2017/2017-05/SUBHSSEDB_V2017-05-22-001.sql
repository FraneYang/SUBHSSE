UPDATE AttachFile SET ToKeyId =SafePersonQualityId
FROM  QualityAudit_SafePersonQuality
WHERE ToKeyId=PersonId AND MenuId='750F5074-45B9-470E-AE1E-6204957421E6'
GO

UPDATE AttachFile SET ToKeyId =ManagePersonQualityId
FROM  QualityAudit_ManagePersonQuality
WHERE ToKeyId=PersonId AND MenuId='07435F23-F87D-4F52-B32C-A3DA95B10DA2'
GO

