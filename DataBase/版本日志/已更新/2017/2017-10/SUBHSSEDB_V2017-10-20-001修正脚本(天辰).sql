--����ȫ�е��û����뵽ƽ̨�û���
INSERT TCCDB.dbo.Sys_User(UserId,UserName,Account,Password,IsPost,SystemType) 
SELECT UserId+'HSSE',UserName,Account,Password,IsPost,'HSSE' FROM Sys_User
GO

--����INSERT������
CREATE TRIGGER User_TRIGGER_INSERT
ON dbo.Sys_User
AFTER INSERT
AS
BEGIN
	INSERT TCCDB.dbo.Sys_User(UserId,UserName,Account,Password,IsPost,SystemType) 
	SELECT UserId+'HSSE',UserName,Account,Password,IsPost,'HSSE' FROM inserted   
END
GO

--����UPDATE������
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

--����DELETE������
CREATE TRIGGER User_TRIGGER_DELETE
ON dbo.Sys_User
AFTER DELETE
AS
BEGIN
	DELETE FROM TCCDB.dbo.Sys_User WHERE UserId IN (SELECT UserId+'HSSE' FROM deleted)
END
GO


--����ȫ�е���Ŀ���뵽ƽ̨��Ŀ��
INSERT TCCDB.dbo.Base_Project(ProjectId,ProjectName,ProjectCode,ShortName,ProjectAddress,StartDate,EndDate,SystemType) 
SELECT ProjectId+'HSSE',ProjectName,ProjectCode,ShortName,ProjectAddress,StartDate,EndDate,'HSSE' FROM Base_Project
GO

--����INSERT������
CREATE TRIGGER Project_TRIGGER_INSERT
ON dbo.Base_Project
AFTER INSERT
AS
BEGIN
	INSERT TCCDB.dbo.Base_Project(ProjectId,ProjectName,ProjectCode,ShortName,ProjectAddress,StartDate,EndDate,SystemType) 
	SELECT ProjectId+'HSSE',ProjectName,ProjectCode,ShortName,ProjectAddress,StartDate,EndDate,'HSSE' FROM inserted   
END
GO

--����UPDATE������
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

--����DELETE������
CREATE TRIGGER Project_TRIGGER_DELETE
ON dbo.Base_Project
AFTER DELETE
AS
BEGIN
	DELETE FROM TCCDB.dbo.Base_Project WHERE ProjectId IN (SELECT ProjectId+'HSSE' FROM deleted)
END
GO
