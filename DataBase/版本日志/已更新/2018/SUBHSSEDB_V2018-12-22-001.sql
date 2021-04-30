--考试试题库
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('4D6BD686-DA06-45CC-9DB8-54B342651724','考试试题库','EduTrain/TestTraining.aspx','Page',18,'E26D223B-4CA2-4A6D-82D0-224CC9C8676D','Menu_Resource',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('C76092DA-3B6B-4E8E-AE8C-3F6F8B414FBD','4D6BD686-DA06-45CC-9DB8-54B342651724','增加',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('CFE56FF9-1769-47D3-AA27-C4433B195E6B','4D6BD686-DA06-45CC-9DB8-54B342651724','修改',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('12A7E3DB-F3A0-456E-A740-D52FE05AE7C7','4D6BD686-DA06-45CC-9DB8-54B342651724','删除',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('A31A9047-42E1-4AC1-A265-B0CAE93D2FA1','4D6BD686-DA06-45CC-9DB8-54B342651724','保存',4)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('655878A6-60BC-4414-9AA4-B9D3B6E4E45A','4D6BD686-DA06-45CC-9DB8-54B342651724','导出',5)
GO



CREATE VIEW [dbo].[View_Training_TestTrainingItem]  AS 
/*培训试题信息视图*/
SELECT Training.TrainingId
	,Training.TrainingCode
	,Training.TrainingName
	,Item.TrainingItemId	
	,Item.TrainingItemCode
	,Item.TrainingItemName
	,Item.Abstracts
	,Item.AttachUrl
	,Item.VersionNum
	,Item.TestType
	,Item.WorkPostIds
	,Item.WorkPostNames
	,Item.AItem
	,Item.BItem
	,Item.CItem
	,Item.DItem
	,Item.EItem
	,Item.Score
	,Item.AnswerItems
 FROM dbo.Training_TestTrainingItem AS Item
 LEFT JOIN Training_TestTraining AS Training ON Item.TrainingId = Training.TrainingId

GO


update dbo.Sys_MenuProjectA set MenuName='教育培训与考试'
where MenuId='6A0506EB-05CE-4BB3-9BA9-866389F01E1C'
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('B782A26B-D85C-4F84-8B45-F7AA47B3159E','培训计划','EduTrain/Plan.aspx','PageHeaderFooter',30,'6A0506EB-05CE-4BB3-9BA9-866389F01E1C','Menu_Project',1,0)
	GO
	--培训计划按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('183C5CD1-18B6-435A-9ED7-0EA21EFC7CA1','B782A26B-D85C-4F84-8B45-F7AA47B3159E','增加',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('86FC3F6D-C736-41E2-A0E8-2BD8171FAC4A','B782A26B-D85C-4F84-8B45-F7AA47B3159E','修改',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('1CBED8C8-72CF-4BE6-873F-467A08A6859C','B782A26B-D85C-4F84-8B45-F7AA47B3159E','删除',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3663ECFA-469B-4C06-A421-1F2A273F0C05','B782A26B-D85C-4F84-8B45-F7AA47B3159E','保存',4)  
	GO
	
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('E108F75D-89D0-4DCA-8356-A156C328805C','培训任务','EduTrain/Task.aspx','PageHeaderFooter',40,'6A0506EB-05CE-4BB3-9BA9-866389F01E1C','Menu_Project',1,0)
	GO
	--培训任务按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
    VALUES('4973E74E-8B1A-490B-9361-8FB21DDEB986','E108F75D-89D0-4DCA-8356-A156C328805C','增加',1)  
    INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
    VALUES('3DCE4661-7BFF-4AA2-A6A9-3E3CE4637EAD','E108F75D-89D0-4DCA-8356-A156C328805C','修改',2)  
    INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
    VALUES('29077269-07FF-410A-862F-C31BD3C6231D','E108F75D-89D0-4DCA-8356-A156C328805C','删除',3)  
    INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
    VALUES('2010AFB3-9073-4A27-BF46-F769840DA232','E108F75D-89D0-4DCA-8356-A156C328805C','保存',4)  
    GO
    
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('6C314522-AF62-4476-893E-5F42C09C3077','培训试题','EduTrain/TestTrainRecord.aspx','PageHeaderFooter',50,'6A0506EB-05CE-4BB3-9BA9-866389F01E1C','Menu_Project',1,0)
	GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('FAF7F4A4-A4BC-4D94-9E88-0CF5A380DB34','考试计划','EduTrain/TestPlan.aspx','PageHeaderFooter',60,'6A0506EB-05CE-4BB3-9BA9-866389F01E1C','Menu_Project',1,0)
	GO
	--考试计划按钮
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
    VALUES('0099F6A7-8C7D-48D5-B928-3F6F784CC07E','FAF7F4A4-A4BC-4D94-9E88-0CF5A380DB34','增加',1)  
    INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
    VALUES('2FCD1CE6-8D9F-4819-A175-EB1EB8828276','FAF7F4A4-A4BC-4D94-9E88-0CF5A380DB34','修改',2)  
    INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
    VALUES('F3264DC8-F77C-40C1-ADC2-6ABE22C5F3F4','FAF7F4A4-A4BC-4D94-9E88-0CF5A380DB34','删除',3)  
    INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
    VALUES('03E3D2AE-FCFC-46E2-8298-34F35378DDC1','FAF7F4A4-A4BC-4D94-9E88-0CF5A380DB34','保存',4)  
    GO
    
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('0EEB138D-84F9-4686-8CBB-CAEAA6CF1B2A','考试记录','EduTrain/TestRecord.aspx','PageHeaderFooter',70,'6A0506EB-05CE-4BB3-9BA9-866389F01E1C','Menu_Project',1,0)
	GO
	
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('6FF941C1-8A00-4A74-8111-C892FC30A8DA','考试统计','EduTrain/TestStatistics.aspx','PageHeaderFooter',80,'6A0506EB-05CE-4BB3-9BA9-866389F01E1C','Menu_Project',1,0)
	GO
	
INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('1C80EF15-B75B-473D-B190-CE12E4DDA287','模拟考试','EduTrain/ModelTestRecord.aspx','PageHeaderFooter',90,'6A0506EB-05CE-4BB3-9BA9-866389F01E1C','Menu_Project',1,0)
	GO


INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('DB4F6793-24F8-4C3F-B6CD-4ACBA38CCB25','手机APP上传内容','Personal/APPFile.aspx','SmartphoneDisk',50,'0','Menu_Personal',1,0)
GO



CREATE VIEW [dbo].[View_Common_Attach_Image]
/*手机APP上传内容列表视图*/
AS
SELECT a.attach_image_id,
    a.image_series,
    a.file_name,
	a.file_size,
    a.file_type,
    a.created_date,                      
    a.created_by,
	a.series_desc,
	a.file_path,
	a.series_timestamp,
	user1.UserName as created_byManName
FROM dbo.Attach_Image AS a
LEFT JOIN dbo.Sys_User AS user1 ON  a.created_by =user1.UserId


GO


