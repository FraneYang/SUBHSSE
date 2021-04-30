--将安全中的用户插入到平台用户表
INSERT TCCDB.dbo.Sys_User(UserId,UserName,Account,Password,IsPost,SystemType) 
SELECT UserId+'HSSE',UserName,Account,Password,IsPost,'HSSE' FROM Sys_User
GO

--创建INSERT触发器
CREATE TRIGGER User_TRIGGER_INSERT
ON dbo.Sys_User
AFTER INSERT
AS
BEGIN
	INSERT TCCDB.dbo.Sys_User(UserId,UserName,Account,Password,IsPost,SystemType) 
	SELECT UserId+'HSSE',UserName,Account,Password,IsPost,'HSSE' FROM inserted   
END
GO

--创建UPDATE触发器
CREATE TRIGGER User_TRIGGER_UPDATE
ON dbo.Sys_User
AFTER UPDATE
AS
BEGIN
	UPDATE TCCDB.dbo.Sys_User SET TCCDB.dbo.Sys_User.UserName= a.UserName,TCCDB.dbo.Sys_User.Account= a.Account,TCCDB.dbo.Sys_User.Password= a.Password,TCCDB.dbo.Sys_User.IsPost= a.IsPost
	FROM inserted a
	WHERE a.UserId+'HSSE'=TCCDB.dbo.Sys_User.UserId
END
GO

--创建DELETE触发器
CREATE TRIGGER User_TRIGGER_DELETE
ON dbo.Sys_User
AFTER DELETE
AS
BEGIN
	DELETE FROM TCCDB.dbo.Sys_User WHERE UserId IN (SELECT UserId+'HSSE' FROM deleted)
END
GO


--将安全中的项目插入到平台项目表
INSERT TCCDB.dbo.Base_Project(ProjectId,ProjectName,ProjectCode,ShortName,ProjectAddress,StartDate,EndDate,SystemType) 
SELECT ProjectId+'HSSE',ProjectName,ProjectCode,ShortName,ProjectAddress,StartDate,EndDate,'HSSE' FROM Base_Project
GO

--创建INSERT触发器
CREATE TRIGGER Project_TRIGGER_INSERT
ON dbo.Base_Project
AFTER INSERT
AS
BEGIN
	INSERT TCCDB.dbo.Base_Project(ProjectId,ProjectName,ProjectCode,ShortName,ProjectAddress,StartDate,EndDate,SystemType) 
	SELECT ProjectId+'HSSE',ProjectName,ProjectCode,ShortName,ProjectAddress,StartDate,EndDate,'HSSE' FROM inserted   
END
GO

--创建UPDATE触发器
CREATE TRIGGER Project_TRIGGER_UPDATE
ON dbo.Base_Project
AFTER UPDATE
AS
BEGIN
	UPDATE TCCDB.dbo.Base_Project SET TCCDB.dbo.Base_Project.ProjectName= a.ProjectName,TCCDB.dbo.Base_Project.ProjectCode= a.ProjectCode,TCCDB.dbo.Base_Project.ShortName= a.ShortName,TCCDB.dbo.Base_Project.ProjectAddress= a.ProjectAddress,TCCDB.dbo.Base_Project.StartDate= a.StartDate,TCCDB.dbo.Base_Project.EndDate= a.EndDate
	FROM inserted a
	WHERE a.ProjectId+'HSSE'=TCCDB.dbo.Base_Project.ProjectId
END
GO

--创建DELETE触发器
CREATE TRIGGER Project_TRIGGER_DELETE
ON dbo.Base_Project
AFTER DELETE
AS
BEGIN
	DELETE FROM TCCDB.dbo.Base_Project WHERE ProjectId IN (SELECT ProjectId+'HSSE' FROM deleted)
END
GO
