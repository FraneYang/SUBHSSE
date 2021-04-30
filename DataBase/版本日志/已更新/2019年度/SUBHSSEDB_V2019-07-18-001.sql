
INSERT dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES  ('8713A053-4039-433C-B8B6-3B5A9283B184','23','�ְ����ϴ��ܱ�',23,'Report')

GO

CREATE PROCEDURE [dbo].[Sp_Manager_SubUploadWeekReport]
 @SubUploadWeekId NVARCHAR(50)
AS
/*******�ְ����ϴ��ܱ�********/
SELECT SubUploadWeek.SubUploadWeekId,
Project.ProjectName,--��Ŀ���� 
(CONVERT(NVARCHAR(20),SubUploadWeek.StartDate,23)+' �� '+CONVERT(NVARCHAR(20),SubUploadWeek.EndDate,23)) AS ReportDate, --�������� 
/***��ȫ�˹�ʱͳ�� ***/
Unit.UnitName, --��λ���� 
SubUploadWeek.PersonWeekNum, --�������� 
SubUploadWeek.ManHours, --�˹�ʱ 
SubUploadWeek.TotalManHours, --�ۼ��˹�ʱ 
SubUploadWeek.StartWorkDate,--�������� 
SubUploadWeek.EndWorkDate,--�н����� 
SubUploadWeek.Remark, --��ע 

/***HSE��Чͳ�� ***/
-----��������------ 
SubUploadWeek.HappenNum1,--δ���¼�
SubUploadWeek.HappenNum2,--���Ȱ����¹�
SubUploadWeek.HappenNum3,--ҽ�ƴ����¹� 
SubUploadWeek.HappenNum4,--���������¹�
SubUploadWeek.HappenNum5,--��ʧ�������¹� 
SubUploadWeek.HappenNum6, --�����¹� 
(SubUploadWeek.HappenNum1 + SubUploadWeek.HappenNum2 + SubUploadWeek.HappenNum3 + SubUploadWeek.HappenNum4 + SubUploadWeek.HappenNum5 + SubUploadWeek.HappenNum6)AS HappenNumTotal,--�¹��ۼ� 
-----�˺�����------
SubUploadWeek.HurtPersonNum1,--δ���¼�
SubUploadWeek.HurtPersonNum2,--���Ȱ����¹�
SubUploadWeek.HurtPersonNum3,--ҽ�ƴ����¹� 
SubUploadWeek.HurtPersonNum4,--���������¹�
SubUploadWeek.HurtPersonNum5,--��ʧ�������¹� 
SubUploadWeek.HurtPersonNum6, --�����¹� 
(SubUploadWeek.HurtPersonNum1 + SubUploadWeek.HurtPersonNum2 + SubUploadWeek.HurtPersonNum3 + SubUploadWeek.HurtPersonNum4 + SubUploadWeek.HurtPersonNum5 + SubUploadWeek.HurtPersonNum6) AS HurtPersonNumTotal,----�¹��ۼ� 
-----��ʧ��ʱ ---
SubUploadWeek.LossHours1,--δ���¼�
SubUploadWeek.LossHours2,--���Ȱ����¹�
SubUploadWeek.LossHours3,--ҽ�ƴ����¹� 
SubUploadWeek.LossHours4,--���������¹�
SubUploadWeek.LossHours5,--��ʧ�������¹� 
SubUploadWeek.LossHours6, --�����¹�
(SubUploadWeek.LossHours1 + SubUploadWeek.LossHours2 + SubUploadWeek.LossHours3 + SubUploadWeek.LossHours4 + SubUploadWeek.LossHours5 + SubUploadWeek.LossHours6) AS LossHoursTotal, --�¹��ۼ� 
-----ֱ�Ӿ�����ʧ----
SubUploadWeek.LossMoney1,--δ���¼�
SubUploadWeek.LossMoney2,--���Ȱ����¹�
SubUploadWeek.LossMoney3,--ҽ�ƴ����¹� 
SubUploadWeek.LossMoney4,--���������¹�
SubUploadWeek.LossMoney5,--��ʧ�������¹� 
SubUploadWeek.LossMoney6, --�����¹�
(SubUploadWeek.LossMoney1 + SubUploadWeek.LossMoney2 + SubUploadWeek.LossMoney3 + SubUploadWeek.LossMoney4 + SubUploadWeek.LossMoney5 + SubUploadWeek.LossMoney6) AS LossMoneyTotal, --�¹��ۼ�

/***** HSE������Ϣͳ�� ****/
SubUploadWeek.HSEPersonNum,--רְHSE��Ա������
SubUploadWeek.CheckNum,--HSE��飨�Σ� 
SubUploadWeek.EmergencyDrillNum,--Ӧ���������Σ� 
SubUploadWeek.LicenseNum,--��ҵ���֤���ݣ�
SubUploadWeek.TrainNum,-- HSE������ѵ���˴Σ�  
SubUploadWeek.HazardNum,--Σ��Դ��ʶ���Σ�
SubUploadWeek.MeetingNum, --HSE���飨�Σ� 

/*** HSE��������ͳ�� ****/
------ ������ ------
SubUploadWeek.HiddenDanger1,--�ϼ���� 
SubUploadWeek.HiddenDanger2,--�ܰ��̼��
SubUploadWeek.HiddenDanger3,--�ְ��̼��   
(SubUploadWeek.HiddenDanger1 + SubUploadWeek.HiddenDanger2 + SubUploadWeek.HiddenDanger3) AS HiddenDangerTotal, --�����ۼ� 
------- ������ -------
SubUploadWeek.RectifyNum1,--�ϼ���� 
SubUploadWeek.RectifyNum2,--�ܰ��̼��
SubUploadWeek.RectifyNum3,--�ְ��̼��
(SubUploadWeek.RectifyNum1 + SubUploadWeek.RectifyNum2 + SubUploadWeek.RectifyNum3) AS RectifyNumTotal, --�����ۼ� 

SubUploadWeek.ThisWorkSummary,--���ܹ����ܽ�
SubUploadWeek.NextWorkPlan,--���ܹ����ƻ�
SubUploadWeek.OtherProblems --�������ڵ������Ӧ��������
FROM Manager_SubUploadWeek AS SubUploadWeek
LEFT JOIN dbo.Base_Project AS Project ON Project.ProjectId = SubUploadWeek.ProjectId
LEFT JOIN dbo.Base_Unit AS Unit ON Unit.UnitId = SubUploadWeek.UnitId
WHERE SubUploadWeek.SubUploadWeekId=@SubUploadWeekId
GO



