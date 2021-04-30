INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('9AD1D84E-80E1-46B4-A749-E33C9BBB8BB4','日常巡检分析','InformationAnalysis/CheckDayAnalysis.aspx','PageHeaderFooter',30,'14DD34F2-0682-48D6-A199-108297A9825E','Menu_Project',1,0)
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('146C222E-DC61-4B48-9808-40C512EDA922','专项检查分析','InformationAnalysis/CheckSpecialAnalysis.aspx','PageHeaderFooter',40,'14DD34F2-0682-48D6-A199-108297A9825E','Menu_Project',1,0)
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('DD221429-B928-4775-9271-4CC10D486726','综合检查分析','InformationAnalysis/CheckColligationAnalysis.aspx','PageHeaderFooter',50,'14DD34F2-0682-48D6-A199-108297A9825E','Menu_Project',1,0)
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('D42DCCFB-0525-4A27-A770-6BC13019A5A9','开工前检查分析','InformationAnalysis/CheckWorkAnalysis.aspx','PageHeaderFooter',60,'14DD34F2-0682-48D6-A199-108297A9825E','Menu_Project',1,0)
GO

INSERT INTO dbo.Sys_MenuProjectA(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('2DDDCEDA-1D96-4C3E-8D73-6AD390BDD6AF','季节性/节假日检查分析','InformationAnalysis/CheckHolidayAnalysis.aspx','PageHeaderFooter',70,'14DD34F2-0682-48D6-A199-108297A9825E','Menu_Project',1,0)
GO
UPDATE Sys_Log SET LogSource=1 WHERE LogSource IS NULL
GO