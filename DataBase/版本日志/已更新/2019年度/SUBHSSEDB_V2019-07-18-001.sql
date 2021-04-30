
INSERT dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES  ('8713A053-4039-433C-B8B6-3B5A9283B184','23','分包商上传周报',23,'Report')

GO

CREATE PROCEDURE [dbo].[Sp_Manager_SubUploadWeekReport]
 @SubUploadWeekId NVARCHAR(50)
AS
/*******分包商上传周报********/
SELECT SubUploadWeek.SubUploadWeekId,
Project.ProjectName,--项目名称 
(CONVERT(NVARCHAR(20),SubUploadWeek.StartDate,23)+' 至 '+CONVERT(NVARCHAR(20),SubUploadWeek.EndDate,23)) AS ReportDate, --报告日期 
/***安全人工时统计 ***/
Unit.UnitName, --单位名称 
SubUploadWeek.PersonWeekNum, --本周人数 
SubUploadWeek.ManHours, --人工时 
SubUploadWeek.TotalManHours, --累计人工时 
SubUploadWeek.StartWorkDate,--开工日期 
SubUploadWeek.EndWorkDate,--中交日期 
SubUploadWeek.Remark, --备注 

/***HSE绩效统计 ***/
-----发生起数------ 
SubUploadWeek.HappenNum1,--未遂事件
SubUploadWeek.HappenNum2,--急救包扎事故
SubUploadWeek.HappenNum3,--医疗处置事故 
SubUploadWeek.HappenNum4,--工作受限事故
SubUploadWeek.HappenNum5,--损失工作日事故 
SubUploadWeek.HappenNum6, --死亡事故 
(SubUploadWeek.HappenNum1 + SubUploadWeek.HappenNum2 + SubUploadWeek.HappenNum3 + SubUploadWeek.HappenNum4 + SubUploadWeek.HappenNum5 + SubUploadWeek.HappenNum6)AS HappenNumTotal,--事故累计 
-----伤害人数------
SubUploadWeek.HurtPersonNum1,--未遂事件
SubUploadWeek.HurtPersonNum2,--急救包扎事故
SubUploadWeek.HurtPersonNum3,--医疗处置事故 
SubUploadWeek.HurtPersonNum4,--工作受限事故
SubUploadWeek.HurtPersonNum5,--损失工作日事故 
SubUploadWeek.HurtPersonNum6, --死亡事故 
(SubUploadWeek.HurtPersonNum1 + SubUploadWeek.HurtPersonNum2 + SubUploadWeek.HurtPersonNum3 + SubUploadWeek.HurtPersonNum4 + SubUploadWeek.HurtPersonNum5 + SubUploadWeek.HurtPersonNum6) AS HurtPersonNumTotal,----事故累计 
-----损失工时 ---
SubUploadWeek.LossHours1,--未遂事件
SubUploadWeek.LossHours2,--急救包扎事故
SubUploadWeek.LossHours3,--医疗处置事故 
SubUploadWeek.LossHours4,--工作受限事故
SubUploadWeek.LossHours5,--损失工作日事故 
SubUploadWeek.LossHours6, --死亡事故
(SubUploadWeek.LossHours1 + SubUploadWeek.LossHours2 + SubUploadWeek.LossHours3 + SubUploadWeek.LossHours4 + SubUploadWeek.LossHours5 + SubUploadWeek.LossHours6) AS LossHoursTotal, --事故累计 
-----直接经济损失----
SubUploadWeek.LossMoney1,--未遂事件
SubUploadWeek.LossMoney2,--急救包扎事故
SubUploadWeek.LossMoney3,--医疗处置事故 
SubUploadWeek.LossMoney4,--工作受限事故
SubUploadWeek.LossMoney5,--损失工作日事故 
SubUploadWeek.LossMoney6, --死亡事故
(SubUploadWeek.LossMoney1 + SubUploadWeek.LossMoney2 + SubUploadWeek.LossMoney3 + SubUploadWeek.LossMoney4 + SubUploadWeek.LossMoney5 + SubUploadWeek.LossMoney6) AS LossMoneyTotal, --事故累计

/***** HSE工作信息统计 ****/
SubUploadWeek.HSEPersonNum,--专职HSE人员（名）
SubUploadWeek.CheckNum,--HSE检查（次） 
SubUploadWeek.EmergencyDrillNum,--应急演练（次） 
SubUploadWeek.LicenseNum,--作业许可证（份）
SubUploadWeek.TrainNum,-- HSE教育培训（人次）  
SubUploadWeek.HazardNum,--危险源辨识（次）
SubUploadWeek.MeetingNum, --HSE会议（次） 

/*** HSE隐患整改统计 ****/
------ 隐患数 ------
SubUploadWeek.HiddenDanger1,--上级检查 
SubUploadWeek.HiddenDanger2,--总包商检查
SubUploadWeek.HiddenDanger3,--分包商检查   
(SubUploadWeek.HiddenDanger1 + SubUploadWeek.HiddenDanger2 + SubUploadWeek.HiddenDanger3) AS HiddenDangerTotal, --隐患累计 
------- 整改数 -------
SubUploadWeek.RectifyNum1,--上级检查 
SubUploadWeek.RectifyNum2,--总包商检查
SubUploadWeek.RectifyNum3,--分包商检查
(SubUploadWeek.RectifyNum1 + SubUploadWeek.RectifyNum2 + SubUploadWeek.RectifyNum3) AS RectifyNumTotal, --整改累计 

SubUploadWeek.ThisWorkSummary,--本周工作总结
SubUploadWeek.NextWorkPlan,--下周工作计划
SubUploadWeek.OtherProblems --其他存在的问题和应报告事项
FROM Manager_SubUploadWeek AS SubUploadWeek
LEFT JOIN dbo.Base_Project AS Project ON Project.ProjectId = SubUploadWeek.ProjectId
LEFT JOIN dbo.Base_Unit AS Unit ON Unit.UnitId = SubUploadWeek.UnitId
WHERE SubUploadWeek.SubUploadWeekId=@SubUploadWeekId
GO



