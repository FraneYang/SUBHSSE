--违章曝光台管理
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('01D70BDC-DE60-4611-A203-C2D479AEF70F','违章曝光台管理','','ScriptEdit',39,'0','Menu_Project',0,0)
GO
UPDATE Sys_MenuProjectA SET SortIndex=10,SuperMenu='01D70BDC-DE60-4611-A203-C2D479AEF70F' 
WHERE MenuId='09186AA8-991C-49F0-9D46-5C798D54FE0B'
GO
--违章曝光台管理
INSERT INTO dbo.Sys_MenuProjectB(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('01D70BDC-DE60-4611-A203-C2D479AEF70F','现场施工动态管理','','ScriptEdit',9,'2A9D8CBC-137F-4199-A426-728F5D63FF2F','Menu_Project',0,0)
GO
UPDATE Sys_MenuProjectB SET SortIndex=10,SuperMenu='01D70BDC-DE60-4611-A203-C2D479AEF70F' 
WHERE MenuId='09186AA8-991C-49F0-9D46-5C798D54FE0B'
GO
ALTER TABLE [dbo].[InformationProject_Exposure] DROP CONSTRAINT [FK_InformationProject_Exposure_Base_Unit]
GO
ALTER TABLE InformationProject_Exposure ALTER COLUMN UnitId NVARCHAR(2000) NULL
GO
ALTER TABLE InformationProject_Exposure ADD UnitName NVARCHAR(2000) NULL
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InformationProject_Exposure', @level2type=N'COLUMN',@level2name=N'UnitName'
GO

UPDATE InformationProject_Exposure SET UnitName=B.UnitName
FROM Base_Unit B WHERE InformationProject_Exposure.UnitId=B.UnitId 
GO 

ALTER PROCEDURE [dbo].[SpGetVersionNumber]
 @tableName varchar(100),/*表名*/
 @columnName varchar(100),/*列名*/
 @projectId nvarchar(50),/*列名*/
 @returnVal nvarchar(10) output
/*获取版本号*/
AS
declare 
        @sql nvarchar(500),
        @old nvarchar(10),
        @newid varchar(10),
        @maxId nvarchar(10)/*已分配的最大值*/
select @sql=N'SELECT @maxId= MAX(CAST(SUBSTRING('+@columnName+',2,len(VersionNo)-3) AS INT)) from '+@tableName+' where ProjectId='''+@projectId+''''
EXEC sp_executesql @sql, N'@maxId nvarchar(10) OUTPUT', @maxId OUTPUT 
set @old=@maxId

IF(@old is null)
BEGIN
set @newid='V'+'1.0'
END

ELSE
BEGIN
set @newid = @old+1
set @newid = CAST(@newid as varchar(7))
set @newid = 'V'+@newid+'.0' 
END

SET @returnVal=@newid

GO


