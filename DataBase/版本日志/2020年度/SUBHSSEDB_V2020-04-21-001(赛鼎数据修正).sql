UPDATE Check_RectifyNotices SET CompleteManId=SignPerson
WHERE CompleteManId IS NULL
GO
UPDATE Check_RectifyNotices SET States=1 WHERE SignDate IS NULL
GO
UPDATE Check_RectifyNotices SET States=2
WHERE SignDate IS NOT NULL AND CompleteDate IS NULL
GO
UPDATE Check_RectifyNotices SET States=4
WHERE CompleteDate IS NOT NULL AND ReCheckDate IS NULL
GO
UPDATE Check_RectifyNotices SET States=5
WHERE ReCheckDate IS NOT NULL
GO