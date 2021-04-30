ALTER PROCEDURE [dbo].[SpPersonStatistic]
@ProjectId nvarchar(50),
@StartTime nvarchar(15),
@EndTime nvarchar(15)
AS
/*�ֳ���Ա����ͳ����ͼ-ͳ�����ݴ��Ż�*/
BEGIN
SELECT  NEWID() AS Number
		,Unit.UnitName
		,Checking.WorkAreaName
		,WorkPost.WorkPostName
		,COUNT(Checking.CheckingId) AS PersonCount
	FROM SitePerson_Checking AS Checking
		LEFT JOIN SitePerson_Person AS Person ON Checking.PersonId =Person.PersonId
		LEFT JOIN Base_Unit AS Unit ON Person.UnitId=Unit.UnitId
		LEFT JOIN Base_WorkPost WorkPost ON WorkPost.WorkPostId=Person.WorkPostId
	WHERE Checking.ProjectId= @ProjectId
	AND Checking.IntoOutTime>=@StartTime and Checking.IntoOutTime < @EndTime
	GROUP BY Unit.UnitName,Checking.WorkAreaName,WorkPost.WorkPostName

UNION 
	SELECT NEWID() AS Number 
		,Unit.UnitName
		,WorkArea.WorkAreaName
		,WorkPost.WorkPostName
		,COUNT(PersonInOut.PersonInOutId) AS PersonCount
	FROM SitePerson_PersonInOut AS PersonInOut
		LEFT JOIN SitePerson_Person AS Person ON PersonInOut.PersonId =Person.PersonId
		LEFT JOIN Base_Unit AS Unit ON Person.UnitId=Unit.UnitId
		LEFT JOIN Base_WorkPost WorkPost ON WorkPost.WorkPostId=Person.WorkPostId
		LEFT JOIN ProjectData_WorkArea WorkArea ON WorkArea.WorkAreaId=Person.WorkAreaId
	WHERE Person.ProjectId= @ProjectId AND 
	 PersonInOut.ChangeTime>=@StartTime and PersonInOut.ChangeTime < @EndTime
	 	GROUP BY Unit.UnitName,WorkAreaName,WorkPost.WorkPostName
END
GO


ALTER VIEW [dbo].[View_SitePerson_Checking]
AS
/*��Ա������ͼ*/
SELECT ch.CheckingId,person.CardNo,ch.ProjectId,person.IdentityCard,ch.WorkAreaId,ch.IntoOutTime,ch.IntoOut,
       ch.[Address],ch.WorkAreaName,person.PersonName,person.UnitId,unit.UnitName,ch.States
from  dbo.SitePerson_Checking ch 
      left join dbo.SitePerson_Person person on ch.PersonId=person.PersonId
      left join dbo.Base_Unit unit on person.UnitId=unit.UnitId
UNION 
SELECT PersonInOut.PersonInOutId,person.CardNo,person.ProjectId,person.IdentityCard,person.WorkAreaId,PersonInOut.ChangeTime,PersonInOut.IsIn,
       null as Address,WorkArea.WorkAreaName,person.PersonName,person.UnitId,unit.UnitName, '2' as States
from  dbo.SitePerson_PersonInOut PersonInOut 
      left join dbo.SitePerson_Person person on PersonInOut.PersonId=person.PersonId
      left join dbo.Base_Unit unit on person.UnitId=unit.UnitId
	  left join dbo.ProjectData_WorkArea WorkArea on Person.WorkAreaId=WorkArea.WorkAreaId
GO


UPDATE Sys_MenuProjectA SET SuperMenu='467A0CB9-737D-4451-965E-869EBC3A4BD6' 
WHERE SuperMenu='7E7245CF-9820-43A6-AD45-D156601467DD'
GO
DELETE FROM Sys_MenuProjectA WHERE MenuId='7E7245CF-9820-43A6-AD45-D156601467DD'
GO
UPDATE Sys_MenuProjectA SET MenuName='��ȫѲ��',SortIndex=26
WHERE MenuId='2FC8AA2A-F421-4174-A05E-2711167AF141' 
GO

UPDATE Sys_MenuProjectA SET MenuName='��ȫѲ���¼',SortIndex=27
WHERE MenuId='23855EB9-0BB1-4B3E-BA69-3C0222F5E2A4'
GO

UPDATE Sys_MenuProjectA SET MenuName='ר����(APP)',SortIndex=32
WHERE MenuId='B7A5F84B-843A-4C13-9844-023D8B4A41AC'
GO

UPDATE Sys_MenuProjectA SET MenuName='�쵼����(APP)',SortIndex=65
WHERE MenuId='247B76AA-01BF-4A40-BB4C-B3EAF441F538'
GO

UPDATE Sys_MenuProjectA SET SortIndex=120
WHERE MenuId='D322F726-B4D3-4807-BA5F-3ADF91E1F084'
GO
UPDATE Sys_MenuProjectA SET SortIndex=130
WHERE MenuId='D0A9B1CC-493F-4CAC-9EC9-C3A89D1D5DB3'
GO
UPDATE Sys_MenuProjectA SET SortIndex=140
WHERE MenuId='9959896B-67DB-43C8-B1D2-EDAFDD7F5A27'
GO
UPDATE Sys_MenuProjectA SET SortIndex=150
WHERE MenuId='3A6E2DC0-3983-4040-BE13-3A6BDA338FED'
GO
UPDATE Sys_MenuProjectA SET SortIndex=160
WHERE MenuId='36FDA642-5BB9-4C29-AFF2-190397242F0A'
GO
UPDATE Sys_MenuProjectA SET SortIndex=170
WHERE MenuId='710A1A13-89C2-4DBA-B940-99D1B91E8F3E'
GO

UPDATE Sys_MenuProjectB SET SuperMenu='467A0CB9-737D-4451-965E-869EBC3A4BD6' 
WHERE SuperMenu='7E7245CF-9820-43A6-AD45-D156601467DD'
GO
DELETE FROM Sys_MenuProjectB WHERE MenuId='7E7245CF-9820-43A6-AD45-D156601467DD'
GO
UPDATE Sys_MenuProjectB SET MenuName='��ȫѲ��',SortIndex=26
WHERE MenuId='2FC8AA2A-F421-4174-A05E-2711167AF141' 
GO

UPDATE Sys_MenuProjectB SET MenuName='��ȫѲ���¼',SortIndex=27
WHERE MenuId='23855EB9-0BB1-4B3E-BA69-3C0222F5E2A4'
GO

UPDATE Sys_MenuProjectB SET MenuName='ר����(APP)',SortIndex=32
WHERE MenuId='B7A5F84B-843A-4C13-9844-023D8B4A41AC'
GO

UPDATE Sys_MenuProjectA SET MenuName='�쵼����(APP)',SortIndex=65
WHERE MenuId='247B76AA-01BF-4A40-BB4C-B3EAF441F538'
GO

UPDATE Sys_MenuProjectB SET SortIndex=120
WHERE MenuId='D322F726-B4D3-4807-BA5F-3ADF91E1F084'
GO
UPDATE Sys_MenuProjectB SET SortIndex=130
WHERE MenuId='D0A9B1CC-493F-4CAC-9EC9-C3A89D1D5DB3'
GO
UPDATE Sys_MenuProjectB SET SortIndex=140
WHERE MenuId='9959896B-67DB-43C8-B1D2-EDAFDD7F5A27'
GO
UPDATE Sys_MenuProjectB SET SortIndex=150
WHERE MenuId='3A6E2DC0-3983-4040-BE13-3A6BDA338FED'
GO
UPDATE Sys_MenuProjectB SET SortIndex=160
WHERE MenuId='36FDA642-5BB9-4C29-AFF2-190397242F0A'
GO
UPDATE Sys_MenuProjectB SET SortIndex=170
WHERE MenuId='710A1A13-89C2-4DBA-B940-99D1B91E8F3E'
GO

CREATE TABLE [dbo].[SeDin_MonthReport5](
	[MonthReport5Id] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[UnitName] [nvarchar](50) NULL,
	[T01] [int] NULL,
	[T02] [int] NULL,
	[T03] [int] NULL,
	[T04] [int] NULL,
	[T05] [int] NULL,
	[T06] [int] NULL,
	[D01] [int] NULL,
	[D02] [int] NULL,
	[D03] [int] NULL,
	[D04] [int] NULL,
	[S01] [int] NULL,
 CONSTRAINT [PK_SeDin_MonthReport5] PRIMARY KEY CLUSTERED 
(
	[MonthReport5Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SeDin_MonthReport5]  WITH CHECK ADD  CONSTRAINT [FK_SeDin_MonthReport5_SeDin_MonthReport5] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[SeDin_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[SeDin_MonthReport5] CHECK CONSTRAINT [FK_SeDin_MonthReport5_SeDin_MonthReport5]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport5', @level2type=N'COLUMN',@level2name=N'MonthReport5Id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport5', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����豸-������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport5', @level2type=N'COLUMN',@level2name=N'T01'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����豸-�Ĵ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport5', @level2type=N'COLUMN',@level2name=N'T02'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����豸-����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport5', @level2type=N'COLUMN',@level2name=N'T03'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����豸-��ʽ���ػ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport5', @level2type=N'COLUMN',@level2name=N'T04'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����豸-������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport5', @level2type=N'COLUMN',@level2name=N'T05'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����豸-�泵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport5', @level2type=N'COLUMN',@level2name=N'T06'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ͻ����豸-�ھ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport5', @level2type=N'COLUMN',@level2name=N'D01'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ͻ����豸-װ�ػ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport5', @level2type=N'COLUMN',@level2name=N'D02'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ͻ����豸-�ϰ峵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport5', @level2type=N'COLUMN',@level2name=N'D03'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ͻ����豸-׮��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport5', @level2type=N'COLUMN',@level2name=N'D04'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������豸-����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport5', @level2type=N'COLUMN',@level2name=N'S01'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����±�-���´��͡������豸Ͷ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport5'
GO



CREATE TABLE [dbo].[SeDin_MonthReport6](
	[MonthReport6Id] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[SafetyMonth] [decimal](18, 2) NULL,
	[SafetyYear] [decimal](18, 2) NULL,
	[SafetyTotal] [decimal](18, 2) NULL,
	[LaborMonth] [decimal](18, 2) NULL,
	[LaborYear] [decimal](18, 2) NULL,
	[LaborTotal] [decimal](18, 2) NULL,
	[ProgressMonth] [decimal](18, 2) NULL,
	[ProgressYear] [decimal](18, 2) NULL,
	[ProgressTotal] [decimal](18, 2) NULL,
	[EducationMonth] [decimal](18, 2) NULL,
	[EducationYear] [decimal](18, 2) NULL,
	[EducationTotal] [decimal](18, 2) NULL,
	[SumMonth] [decimal](18, 2) NULL,
	[SumYear] [decimal](18, 2) NULL,
	[SumTotal] [decimal](18, 2) NULL,
	[ContractMonth] [decimal](18, 2) NULL,
	[ContractYear] [decimal](18, 2) NULL,
	[ContractTotal] [decimal](18, 2) NULL,
	[ConstructionCost] [decimal](18, 2) NULL,
 CONSTRAINT [PK_SeDin_MonthReport6] PRIMARY KEY CLUSTERED 
(
	[MonthReport6Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SeDin_MonthReport6]  WITH CHECK ADD  CONSTRAINT [FK_SeDin_MonthReport6_SeDin_MonthReport6] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[SeDin_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[SeDin_MonthReport6] CHECK CONSTRAINT [FK_SeDin_MonthReport6_SeDin_MonthReport6]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport6', @level2type=N'COLUMN',@level2name=N'MonthReport6Id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport6', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ����Ͷ��-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport6', @level2type=N'COLUMN',@level2name=N'SafetyMonth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ����Ͷ��-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport6', @level2type=N'COLUMN',@level2name=N'SafetyYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ����Ͷ��-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport6', @level2type=N'COLUMN',@level2name=N'SafetyTotal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ͷ�������ְҵ����Ͷ��-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport6', @level2type=N'COLUMN',@level2name=N'LaborMonth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ͷ�������ְҵ����Ͷ��-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport6', @level2type=N'COLUMN',@level2name=N'LaborYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ͷ�������ְҵ����Ͷ��-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport6', @level2type=N'COLUMN',@level2name=N'LaborTotal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ��������Ͷ��-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport6', @level2type=N'COLUMN',@level2name=N'ProgressMonth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ��������Ͷ��-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport6', @level2type=N'COLUMN',@level2name=N'ProgressYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ��������Ͷ��-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport6', @level2type=N'COLUMN',@level2name=N'ProgressTotal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ������ѵͶ��-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport6', @level2type=N'COLUMN',@level2name=N'EducationMonth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ������ѵͶ��-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport6', @level2type=N'COLUMN',@level2name=N'EducationYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ������ѵͶ��-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport6', @level2type=N'COLUMN',@level2name=N'EducationTotal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϼ�-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport6', @level2type=N'COLUMN',@level2name=N'SumMonth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϼ�-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport6', @level2type=N'COLUMN',@level2name=N'SumYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϼ�-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport6', @level2type=N'COLUMN',@level2name=N'SumTotal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ɺ�ͬ��-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport6', @level2type=N'COLUMN',@level2name=N'ContractMonth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ɺ�ͬ��-���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport6', @level2type=N'COLUMN',@level2name=N'ContractYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ɺ�ͬ��-�ۼ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport6', @level2type=N'COLUMN',@level2name=N'ContractTotal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������ռ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport6', @level2type=N'COLUMN',@level2name=N'ConstructionCost'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����±�-��ȫ��������Ͷ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport6'
GO



CREATE TABLE [dbo].[SeDin_MonthReport7](
	[MonthReport7Id] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[SpecialMontNum] [int] NULL,
	[SpecialYearNum] [int] NULL,
	[SpecialTotalNum] [int] NULL,
	[SpecialMontPerson] [int] NULL,
	[SpecialYearPerson] [int] NULL,
	[SpecialTotalPerson] [int] NULL,
	[EmployeeMontNum] [int] NULL,
	[EmployeeYearNum] [int] NULL,
	[EmployeeTotalNum] [int] NULL,
	[EmployeeMontPerson] [int] NULL,
	[EmployeeYearPerson] [int] NULL,
	[EmployeeTotalPerson] [int] NULL,
 CONSTRAINT [PK_SeDin_MonthReport7] PRIMARY KEY CLUSTERED 
(
	[MonthReport7Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SeDin_MonthReport7]  WITH CHECK ADD  CONSTRAINT [FK_SeDin_MonthReport7_SeDin_MonthReport7] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[SeDin_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[SeDin_MonthReport7] CHECK CONSTRAINT [FK_SeDin_MonthReport7_SeDin_MonthReport7]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport7', @level2type=N'COLUMN',@level2name=N'MonthReport7Id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport7', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ר�ȫ��ѵ-�´�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport7', @level2type=N'COLUMN',@level2name=N'SpecialMontNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ר�ȫ��ѵ-���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport7', @level2type=N'COLUMN',@level2name=N'SpecialYearNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ר�ȫ��ѵ-��Ŀ�ۼƴ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport7', @level2type=N'COLUMN',@level2name=N'SpecialTotalNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ר�ȫ��ѵ-����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport7', @level2type=N'COLUMN',@level2name=N'SpecialMontPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ר�ȫ��ѵ-����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport7', @level2type=N'COLUMN',@level2name=N'SpecialYearPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ר�ȫ��ѵ-��Ŀ�ۼ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport7', @level2type=N'COLUMN',@level2name=N'SpecialTotalPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ա���볡��ȫ��ѵ-�´�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport7', @level2type=N'COLUMN',@level2name=N'EmployeeMontNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ա���볡��ȫ��ѵ-���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport7', @level2type=N'COLUMN',@level2name=N'EmployeeYearNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ա���볡��ȫ��ѵ-��Ŀ�ۼƴ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport7', @level2type=N'COLUMN',@level2name=N'EmployeeTotalNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ա���볡��ȫ��ѵ-����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport7', @level2type=N'COLUMN',@level2name=N'EmployeeMontPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ա���볡��ȫ��ѵ-����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport7', @level2type=N'COLUMN',@level2name=N'EmployeeYearPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ա���볡��ȫ��ѵ-��Ŀ�ۼ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport7', @level2type=N'COLUMN',@level2name=N'EmployeeTotalPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����±�-��ĿHSE��ѵͳ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport7'
GO

CREATE TABLE [dbo].[SeDin_MonthReport8](
	[MonthReport8Id] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[WeekMontNum] [int] NULL,
	[WeekTotalNum] [int] NULL,
	[WeekMontPerson] [int] NULL,
	[MonthMontNum] [int] NULL,
	[MonthTotalNum] [int] NULL,
	[MonthMontPerson] [int] NULL,
	[SpecialMontNum] [int] NULL,
	[SpecialTotalNum] [int] NULL,
	[SpecialMontPerson] [int] NULL,
 CONSTRAINT [PK_SeDin_MonthReport8] PRIMARY KEY CLUSTERED 
(
	[MonthReport8Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SeDin_MonthReport8]  WITH CHECK ADD  CONSTRAINT [FK_SeDin_MonthReport8_SeDin_MonthReport8] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[SeDin_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[SeDin_MonthReport8] CHECK CONSTRAINT [FK_SeDin_MonthReport8_SeDin_MonthReport8]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport8', @level2type=N'COLUMN',@level2name=N'MonthReport8Id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport8', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������-�´�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport8', @level2type=N'COLUMN',@level2name=N'WeekMontNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������-��Ŀ�ۼƴ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport8', @level2type=N'COLUMN',@level2name=N'WeekTotalNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������-����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport8', @level2type=N'COLUMN',@level2name=N'WeekMontPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������-�´�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport8', @level2type=N'COLUMN',@level2name=N'MonthMontNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������-��Ŀ�ۼƴ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport8', @level2type=N'COLUMN',@level2name=N'MonthTotalNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������-����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport8', @level2type=N'COLUMN',@level2name=N'MonthMontPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ר������-�´�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport8', @level2type=N'COLUMN',@level2name=N'SpecialMontNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ר������-��Ŀ�ۼƴ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport8', @level2type=N'COLUMN',@level2name=N'SpecialTotalNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ר������-����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport8', @level2type=N'COLUMN',@level2name=N'SpecialMontPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����±�-��ĿHSE��ѵͳ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport8'
GO

CREATE TABLE [dbo].[SeDin_MonthReport8Item](
	[MonthReport8ItemId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[UnitName] [nvarchar](50) NULL,
	[TeamName] [nvarchar](50) NULL,
	[ClassNum] [int] NULL,
	[ClassPersonNum] [int] NULL,
 CONSTRAINT [PK_SeDin_MonthReport8Item] PRIMARY KEY CLUSTERED 
(
	[MonthReport8ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SeDin_MonthReport8Item]  WITH CHECK ADD  CONSTRAINT [FK_SeDin_MonthReport8Item_SeDin_MonthReport8Item] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[SeDin_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[SeDin_MonthReport8Item] CHECK CONSTRAINT [FK_SeDin_MonthReport8Item_SeDin_MonthReport8Item]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ϸID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport8Item', @level2type=N'COLUMN',@level2name=N'MonthReport8ItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport8Item', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport8Item', @level2type=N'COLUMN',@level2name=N'UnitName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport8Item', @level2type=N'COLUMN',@level2name=N'TeamName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ǰ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport8Item', @level2type=N'COLUMN',@level2name=N'ClassNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ǰ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport8Item', @level2type=N'COLUMN',@level2name=N'ClassPersonNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����±�-��ĿHSE����ͳ�ư�ǰ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport8Item'
GO

CREATE TABLE [dbo].[SeDin_MonthReport9](
	[MonthReport9Id] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[DailyMonth] [int] NULL,
	[DailyYear] [int] NULL,
	[DailyTotal] [int] NULL,
	[WeekMonth] [int] NULL,
	[WeekYear] [int] NULL,
	[WeekTotal] [int] NULL,
	[SpecialMonth] [int] NULL,
	[SpecialYear] [int] NULL,
	[SpecialTotal] [int] NULL,
	[MonthlyMonth] [int] NULL,
	[MonthlyYear] [int] NULL,
	[MonthlyTotal] [int] NULL,
 CONSTRAINT [PK_SeDin_MonthReport9] PRIMARY KEY CLUSTERED 
(
	[MonthReport9Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SeDin_MonthReport9]  WITH CHECK ADD  CONSTRAINT [FK_SeDin_MonthReport9_SeDin_MonthReport9] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[SeDin_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[SeDin_MonthReport9] CHECK CONSTRAINT [FK_SeDin_MonthReport9_SeDin_MonthReport9]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9', @level2type=N'COLUMN',@level2name=N'MonthReport9Id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ճ�Ѳ��-�´�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9', @level2type=N'COLUMN',@level2name=N'DailyMonth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ճ�Ѳ��-���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9', @level2type=N'COLUMN',@level2name=N'DailyYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ճ�Ѳ��-���ۼ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9', @level2type=N'COLUMN',@level2name=N'DailyTotal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ϼ��-�´�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9', @level2type=N'COLUMN',@level2name=N'WeekMonth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ϼ��-���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9', @level2type=N'COLUMN',@level2name=N'WeekYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ϼ��-���ۼ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9', @level2type=N'COLUMN',@level2name=N'WeekTotal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ר����-�´�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9', @level2type=N'COLUMN',@level2name=N'SpecialMonth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ר����-���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9', @level2type=N'COLUMN',@level2name=N'SpecialYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ר����-���ۼ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9', @level2type=N'COLUMN',@level2name=N'SpecialTotal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ۺ�HSE���-�´�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9', @level2type=N'COLUMN',@level2name=N'MonthlyMonth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ۺ�HSE���-���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9', @level2type=N'COLUMN',@level2name=N'MonthlyYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ۺ�HSE���-���ۼ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9', @level2type=N'COLUMN',@level2name=N'MonthlyTotal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����±�-��ĿHSE���ͳ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9'
GO


CREATE TABLE [dbo].[SeDin_MonthReport9Item_Rectification](
	[MonthReport9ItemId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[UnitName] [nvarchar](50) NULL,
	[IssuedMonth] [int] NULL,
	[RectificationMoth] [int] NULL,
	[IssuedTotal] [int] NULL,
	[RectificationTotal] [int] NULL,
 CONSTRAINT [PK_SeDin_MonthReport9Item_Rectification] PRIMARY KEY CLUSTERED 
(
	[MonthReport9ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SeDin_MonthReport9Item_Rectification]  WITH CHECK ADD  CONSTRAINT [FK_SeDin_MonthReport9Item_Rectification_SeDin_MonthReport9Item_Rectification] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[SeDin_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[SeDin_MonthReport9Item_Rectification] CHECK CONSTRAINT [FK_SeDin_MonthReport9Item_Rectification_SeDin_MonthReport9Item_Rectification]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ϸID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Rectification', @level2type=N'COLUMN',@level2name=N'MonthReport9ItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Rectification', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Rectification', @level2type=N'COLUMN',@level2name=N'UnitName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�·����������£�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Rectification', @level2type=N'COLUMN',@level2name=N'IssuedMonth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����������������£�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Rectification', @level2type=N'COLUMN',@level2name=N'RectificationMoth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�·��������ۼƣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Rectification', @level2type=N'COLUMN',@level2name=N'IssuedTotal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������������ۼƣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Rectification', @level2type=N'COLUMN',@level2name=N'RectificationTotal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'[�����±�-�������ĵ�]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Rectification'
GO


CREATE TABLE [dbo].[SeDin_MonthReport9Item_Special](
	[MonthReport9ItemId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[TypeName] [nvarchar](50) NULL,
	[CheckMonth] [int] NULL,
	[CheckYear] [int] NULL,
	[CheckTotal] [int] NULL,
 CONSTRAINT [PK_SeDin_MonthReport9Item_Special] PRIMARY KEY CLUSTERED 
(
	[MonthReport9ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SeDin_MonthReport9Item_Special]  WITH CHECK ADD  CONSTRAINT [FK_SeDin_MonthReport9Item_Special_SeDin_MonthReport9Item_Special] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[SeDin_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[SeDin_MonthReport9Item_Special] CHECK CONSTRAINT [FK_SeDin_MonthReport9Item_Special_SeDin_MonthReport9Item_Special]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ϸID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Special', @level2type=N'COLUMN',@level2name=N'MonthReport9ItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Special', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Special', @level2type=N'COLUMN',@level2name=N'TypeName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����������£�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Special', @level2type=N'COLUMN',@level2name=N'CheckMonth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������������ۼƣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Special', @level2type=N'COLUMN',@level2name=N'CheckYear'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������Ŀ���ۼƣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Special', @level2type=N'COLUMN',@level2name=N'CheckTotal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'[�����±�-ר����]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Special'
GO

CREATE TABLE [dbo].[SeDin_MonthReport9Item_Stoppage](
	[MonthReport9ItemId] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[UnitName] [nvarchar](50) NULL,
	[IssuedMonth] [int] NULL,
	[StoppageMonth] [int] NULL,
	[IssuedTotal] [int] NULL,
	[StoppageTotal] [int] NULL,
 CONSTRAINT [PK_SeDin_MonthReport9Item_Stoppage] PRIMARY KEY CLUSTERED 
(
	[MonthReport9ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SeDin_MonthReport9Item_Stoppage]  WITH CHECK ADD  CONSTRAINT [FK_SeDin_MonthReport9Item_Stoppage_SeDin_MonthReport9Item_Stoppage] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[SeDin_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[SeDin_MonthReport9Item_Stoppage] CHECK CONSTRAINT [FK_SeDin_MonthReport9Item_Stoppage_SeDin_MonthReport9Item_Stoppage]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ϸID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Stoppage', @level2type=N'COLUMN',@level2name=N'MonthReport9ItemId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Stoppage', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��λ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Stoppage', @level2type=N'COLUMN',@level2name=N'UnitName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�·����������£�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Stoppage', @level2type=N'COLUMN',@level2name=N'IssuedMonth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ͣ�����������£�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Stoppage', @level2type=N'COLUMN',@level2name=N'StoppageMonth'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�·��������ۼƣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Stoppage', @level2type=N'COLUMN',@level2name=N'IssuedTotal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ͣ���������ۼƣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Stoppage', @level2type=N'COLUMN',@level2name=N'StoppageTotal'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'[�����±�-ͣ����]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport9Item_Stoppage'
GO

CREATE TABLE [dbo].[SeDin_MonthReport10](
	[MonthReport10Id] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[SafeMonthNum] [int] NULL,
	[SafeTotalNum] [int] NULL,
	[SafeMonthMoney] [decimal](18, 2) NULL,
	[SafeTotalMoney] [decimal](18, 2) NULL,
	[HseMonthNum] [int] NULL,
	[HseTotalNum] [int] NULL,
	[HseMonthMoney] [decimal](18, 2) NULL,
	[HseTotalMoney] [decimal](18, 2) NULL,
	[ProduceMonthNum] [int] NULL,
	[ProduceTotalNum] [int] NULL,
	[ProduceMonthMoney] [decimal](18, 2) NULL,
	[ProduceTotalMoney] [decimal](18, 2) NULL,
	[AccidentMonthNum] [int] NULL,
	[AccidentTotalNum] [int] NULL,
	[AccidentMonthMoney] [decimal](18, 2) NULL,
	[AccidentTotalMoney] [decimal](18, 2) NULL,
	[ViolationMonthNum] [int] NULL,
	[ViolationTotalNum] [int] NULL,
	[ViolationMonthMoney] [decimal](18, 2) NULL,
	[ViolationTotalMoney] [decimal](18, 2) NULL,
	[ManageMonthNum] [int] NULL,
	[ManageTotalNum] [int] NULL,
	[ManageMonthMoney] [decimal](18, 2) NULL,
	[ManageTotalMoney] [decimal](18, 2) NULL,
 CONSTRAINT [PK_SeDin_MonthReport10] PRIMARY KEY CLUSTERED 
(
	[MonthReport10Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SeDin_MonthReport10]  WITH CHECK ADD  CONSTRAINT [FK_SeDin_MonthReport10_SeDin_MonthReport10] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[SeDin_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[SeDin_MonthReport10] CHECK CONSTRAINT [FK_SeDin_MonthReport10_SeDin_MonthReport10]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'MonthReport10Id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ��ʱ�����������£�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'SafeMonthNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ��ʱ���������ۼƣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'SafeTotalNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ��ʱ�������£�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'SafeMonthMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ��ʱ�����ۼƣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'SafeTotalMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE��Ч���˽������������£�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'HseMonthNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE��Ч���˽����������ۼƣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'HseTotalNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE��Ч���˽��������£�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'HseMonthMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'HSE��Ч���˽������ۼƣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'HseTotalMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ�����Ƚ����˽����������£�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'ProduceMonthNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ�����Ƚ����˽��������ۼƣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'ProduceTotalNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ�����Ƚ����˽������£�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'ProduceMonthMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ�����Ƚ����˽����ۼƣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'ProduceTotalMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�¹����δ������������£�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'AccidentMonthNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�¹����δ����������ۼƣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'AccidentTotalNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�¹����δ��������£�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'AccidentMonthMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�¹����δ������ۼƣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'AccidentTotalMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Υ�´������������£�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'ViolationMonthNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Υ�´����������ۼƣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'ViolationTotalNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Υ�´��������£�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'ViolationMonthMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Υ�´������ۼƣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'ViolationTotalMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ���������������£�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'ManageMonthNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ�������������ۼƣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'ManageTotalNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ�����������£�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'ManageMonthMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ȫ���������ۼƣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10', @level2type=N'COLUMN',@level2name=N'ManageTotalMoney'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����±�-10����Ŀ�������ͳ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport10'
GO

CREATE TABLE [dbo].[SeDin_MonthReport11](
	[MonthReport11Id] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[RiskWorkNum] [int] NULL,
	[RiskFinishedNum] [int] NULL,
	[RiskWorkNext] [nvarchar](500) NULL,
	[LargeWorkNum] [int] NULL,
	[LargeFinishedNum] [int] NULL,
	[LargeWorkNext] [nvarchar](500) NULL,
 CONSTRAINT [PK_SeDin_MonthReport11] PRIMARY KEY CLUSTERED 
(
	[MonthReport11Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SeDin_MonthReport11]  WITH CHECK ADD  CONSTRAINT [FK_SeDin_MonthReport11_SeDin_MonthReport11] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[SeDin_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[SeDin_MonthReport11] CHECK CONSTRAINT [FK_SeDin_MonthReport11_SeDin_MonthReport11]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport11', @level2type=N'COLUMN',@level2name=N'MonthReport11Id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport11', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Σ���Խϴ�ֲ�����̱�������ʩ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport11', @level2type=N'COLUMN',@level2name=N'RiskWorkNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Σ���Խϴ�ֲ���������깤' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport11', @level2type=N'COLUMN',@level2name=N'RiskFinishedNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Σ���Խϴ�ֲ����������ʩ���ƻ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport11', @level2type=N'COLUMN',@level2name=N'RiskWorkNext'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����һ����ģΣ�󹤳̱�������ʩ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport11', @level2type=N'COLUMN',@level2name=N'LargeWorkNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����һ����ģΣ�󹤳����깤' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport11', @level2type=N'COLUMN',@level2name=N'LargeFinishedNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����һ����ģΣ�󹤳�����ʩ���ƻ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport11', @level2type=N'COLUMN',@level2name=N'LargeWorkNext'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����±�-11����ĿΣ�󹤳�ʩ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport11'
GO

CREATE TABLE [dbo].[SeDin_MonthReport12](
	[MonthReport12Id] [nvarchar](50) NOT NULL,
	[MonthReportId] [nvarchar](50) NULL,
	[MultipleSiteInput] [decimal](18, 2) NULL,
	[MultipleSitePerson] [int] NULL,
	[MultipleSiteNum] [int] NULL,
	[MultipleSiteTotalNum] [int] NULL,
	[MultipleSiteNext] [nvarchar](500) NULL,
	[MultipleDesktopInput] [decimal](18, 2) NULL,
	[MultipleDesktopPerson] [int] NULL,
	[MultipleDesktopNum] [int] NULL,
	[MultipleDesktopTotalNum] [int] NULL,
	[MultipleDesktopNext] [nvarchar](500) NULL,
	[SingleSiteInput] [decimal](18, 2) NULL,
	[SingleSitePerson] [int] NULL,
	[SingleSiteNum] [int] NULL,
	[SingleSiteTotalNum] [int] NULL,
	[SingleSiteNext] [nvarchar](500) NULL,
	[SingleDesktopInput] [decimal](18, 2) NULL,
	[SingleDesktopPerson] [int] NULL,
	[SingleDesktopNum] [int] NULL,
	[SingleDesktopTotalNum] [int] NULL,
	[SingleDesktopNext] [nvarchar](500) NULL,
 CONSTRAINT [PK_SeDin_MonthReport12] PRIMARY KEY CLUSTERED 
(
	[MonthReport12Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SeDin_MonthReport12]  WITH CHECK ADD  CONSTRAINT [FK_SeDin_MonthReport12_SeDin_MonthReport12] FOREIGN KEY([MonthReportId])
REFERENCES [dbo].[SeDin_MonthReport] ([MonthReportId])
GO

ALTER TABLE [dbo].[SeDin_MonthReport12] CHECK CONSTRAINT [FK_SeDin_MonthReport12_SeDin_MonthReport12]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12', @level2type=N'COLUMN',@level2name=N'MonthReport12Id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�±�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12', @level2type=N'COLUMN',@level2name=N'MonthReportId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۺ������ֳ�ֱ��Ͷ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12', @level2type=N'COLUMN',@level2name=N'MultipleSiteInput'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۺ������ֳ���������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12', @level2type=N'COLUMN',@level2name=N'MultipleSitePerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۺ������ֳ����´���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12', @level2type=N'COLUMN',@level2name=N'MultipleSiteNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۺ������ֳ���Ŀ�ۼƴ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12', @level2type=N'COLUMN',@level2name=N'MultipleSiteTotalNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۺ������ֳ����¼ƻ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12', @level2type=N'COLUMN',@level2name=N'MultipleSiteNext'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۺ���������ֱ��Ͷ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12', @level2type=N'COLUMN',@level2name=N'MultipleDesktopInput'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۺ����������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12', @level2type=N'COLUMN',@level2name=N'MultipleDesktopPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۺ��������汾�´���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12', @level2type=N'COLUMN',@level2name=N'MultipleDesktopNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۺ�����������Ŀ�ۼƴ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12', @level2type=N'COLUMN',@level2name=N'MultipleDesktopTotalNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ۺ������������¼ƻ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12', @level2type=N'COLUMN',@level2name=N'MultipleDesktopNext'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���������ֳ�ֱ��Ͷ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12', @level2type=N'COLUMN',@level2name=N'SingleSiteInput'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���������ֳ���������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12', @level2type=N'COLUMN',@level2name=N'SingleSitePerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���������ֳ����´���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12', @level2type=N'COLUMN',@level2name=N'SingleSiteNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���������ֳ���Ŀ�ۼƴ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12', @level2type=N'COLUMN',@level2name=N'SingleSiteTotalNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���������ֳ����¼ƻ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12', @level2type=N'COLUMN',@level2name=N'SingleSiteNext'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������������ֱ��Ͷ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12', @level2type=N'COLUMN',@level2name=N'SingleDesktopInput'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12', @level2type=N'COLUMN',@level2name=N'SingleDesktopPerson'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����������汾�´���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12', @level2type=N'COLUMN',@level2name=N'SingleDesktopNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������������Ŀ�ۼƴ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12', @level2type=N'COLUMN',@level2name=N'SingleDesktopTotalNum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���������������¼ƻ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12', @level2type=N'COLUMN',@level2name=N'SingleDesktopNext'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����±�-12����ĿӦ���������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SeDin_MonthReport12'
GO


