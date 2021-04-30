UPDATE Check_RectifyNotices SET States=5 WHERE ReCheckDate IS NOT NULL AND States IS NULL
GO
UPDATE Check_RectifyNotices SET States=5 WHERE CompleteDate IS NOT NULL AND States IS NULL AND IsRectify=1
GO
UPDATE Check_RectifyNotices SET States=5 WHERE  States IS NULL AND IsRectify=1
GO
UPDATE Check_RectifyNotices SET States=5 WHERE  States IS NULL AND ProjectId IN (SELECT ProjectId FROM Base_Project WHERE ProjectState=2 OR ProjectState=3)
GO
UPDATE Check_RectifyNotices SET States=0 WHERE  States IS NULL 
GO