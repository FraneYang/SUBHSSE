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
select @sql=N'SELECT @maxId= MAX(CAST(SUBSTRING('+@columnName+',2,len('+@columnName+')-3) AS INT)) from '+@tableName+' where ProjectId='''+@projectId+''''
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

UPDATE Sys_MenuProjectB SET MenuName='现场人员考勤统计' WHERE MenuId='7D36E853-CC79-48B9-9E7F-E34797B4E87E'
GO
UPDATE Sys_MenuProjectA SET MenuName='现场人员考勤统计' WHERE MenuId='7D36E853-CC79-48B9-9E7F-E34797B4E87E'
GO