UPDATE Sys_CodeRecords SET MenuId='0038D764-D628-46F0-94FF-D0A22C3C45A3'
WHERE MenuId='C3B6B222-44DC-46F3-B783-B1FC0F743C48'
GO
UPDATE Sys_CodeRecords SET CompileDate=(SELECT CheckedDate FROM Check_RectifyNotices 
WHERE RectifyNoticesId=DataId)
WHERE MenuId='0038D764-D628-46F0-94FF-D0A22C3C45A3'
GO

UPDATE Sys_CodeRecords SET RuleCodes='CC-7--GW--015-',Code='CC-7--GW--015-'+replicate('0', (4-len(SortIndex)))+CAST(SortIndex as varchar(4))
,OwnerRuleCodes='CC-7--GW--015-',OwnerCode='CC-7--GW--015-'+replicate('0', (4-len(SortIndex)))+CAST(SortIndex as varchar(4))
WHERE ProjectId = 'c93c7a26-65d5-4cd9-811b-2f2fae8b4b50' AND MenuId='0038D764-D628-46F0-94FF-D0A22C3C45A3'
GO

UPDATE Check_RectifyNotices SET RectifyNoticesCode=(SELECT Code FROM Sys_CodeRecords WHERE DataId=RectifyNoticesId)
GO