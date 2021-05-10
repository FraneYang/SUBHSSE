UPDATE Manager_MonthReportB SET months='2021-04-01',monthreportdate='2021-05-03'
WHERE MonthReportId='19a76efc-8279-4ba2-99f9-160b65e38b3c' 
OR MonthReportId='323b8b47-be2a-4f6f-8d48-ac4315146faa' 
GO

INSERT INTO Base_Unit(UnitId,UnitCode,UnitName,ShortUnitName,IsBranch,DataSources)
VALUES('30a03745-5140-4647-bb73-5d04c7a2317d','GXLJ','广西华谊氯碱化工有限公司','华谊氯碱',0,'b54d4274-0bb6-4e04-b03a-9165b2a062fb')
GO
INSERT INTO Base_Unit(UnitId,UnitCode,UnitName,ShortUnitName,IsBranch,DataSources)
VALUES('ec121034-c0c7-4a5e-bb3f-58d6d3dbd021','SCPM','上海化工工程监理有限公司','上海化工',0,'a9a5dd5e-0762-4a08-976d-d71bc7b4eaf8')
GO

--广西华谊氯碱项目聚氯乙烯装置 a9a5dd5e-0762-4a08-976d-d71bc7b4eaf8
--月报id 323b8b47-be2a-4f6f-8d48-ac4315146faa

UPDATE Manager_MonthReportB set Manhours='49725',HseManhours='49725'
where MonthReportId='323b8b47-be2a-4f6f-8d48-ac4315146faa'
go
UPDATE Manager_MonthReportB set TotalManhours=TotalManhours+ Manhours,TotalHseManhours=TotalHseManhours+ HseManhours
where MonthReportId='323b8b47-be2a-4f6f-8d48-ac4315146faa'
go
UPDATE Manager_MonthReportB set NoEndDate='2021-05-03',SafetyManhours=TotalHseManhours
where MonthReportId='323b8b47-be2a-4f6f-8d48-ac4315146faa'
go
--项目单位
INSERT INTO Project_ProjectUnit(ProjectUnitId,ProjectId,UnitId,UnitType,InTime)
VALUES('1d0ffccf-3c45-4bf4-8ced-89f257e94bdf','a9a5dd5e-0762-4a08-976d-d71bc7b4eaf8','30a03745-5140-4647-bb73-5d04c7a2317d','4','2020-11-01')
GO
INSERT INTO Project_ProjectUnit(ProjectUnitId,ProjectId,UnitId,UnitType,InTime)
VALUES('6a77d1ba-81ab-4b69-a73e-0516c6d60260','a9a5dd5e-0762-4a08-976d-d71bc7b4eaf8','ec121034-c0c7-4a5e-bb3f-58d6d3dbd021','3','2020-11-01')
GO
--现场人员
UPDATE Manager_ManhoursSortB SET PersonTotal=265,ManhoursTotal=45882
WHERE ManhoursSortId='aace7a0f-5071-488c-b906-e2b422725b54'
GO
UPDATE  Manager_ManhoursSortB SET TotalManhoursTotal=TotalManhoursTotal+ManhoursTotal
WHERE ManhoursSortId='aace7a0f-5071-488c-b906-e2b422725b54'
GO
UPDATE Manager_ManhoursSortB SET PersonTotal=13,ManhoursTotal=3843
WHERE ManhoursSortId='53a158e4-2da2-4dd6-8342-d54ad512fa82'
GO
UPDATE  Manager_ManhoursSortB SET TotalManhoursTotal=TotalManhoursTotal+ManhoursTotal
WHERE ManhoursSortId='53a158e4-2da2-4dd6-8342-d54ad512fa82'
GO

UPDATE Manager_TrainSortB SET  TrainNumber=10,TotalTrainNum=11,TrainPersonNumber=150,TotalTrainPersonNum=156
WHERE TrainSortId='b10d13ee-f8e8-46c9-ba57-ec5ef73b4514'
GO
UPDATE Manager_MeetingSortB SET MeetingNumber=1,TotalMeetingNum=1,MeetingPersonNumber=9,TotalMeetingPersonNum=9
WHERE MeetingSortId='5864caaf-287a-4158-b636-df3a10d222fd'
GO
UPDATE Manager_MeetingSortB SET MeetingNumber=4,TotalMeetingNum=5,MeetingPersonNumber=36,TotalMeetingPersonNum=69
WHERE MeetingSortId='62376f07-f945-45c1-9cc1-d39d4a22226d'
GO
UPDATE Manager_CheckSortB SET CheckNumber=4,TotalCheckNum=4,ViolationNumber=40,TotalViolationNum=40
WHERE CheckSortId='01289c9d-a7f0-4833-8edf-6e94e8880a39'
GO
UPDATE Manager_CheckSortB SET CheckNumber=2,TotalCheckNum=5,ViolationNumber=5,TotalViolationNum=12
WHERE CheckSortId='9713b6ac-36a2-466c-b4bf-c0c945d13096'
GO
UPDATE Manager_CheckSortB SET CheckNumber=43,TotalCheckNum=43,ViolationNumber=43,TotalViolationNum=43
WHERE CheckSortId='ed86c44a-8955-4ea7-801d-1a05470b265f'
GO

--广西华谊氯碱项目公辅装置 b54d4274-0bb6-4e04-b03a-9165b2a062fb
--月报id 19a76efc-8279-4ba2-99f9-160b65e38b3c
UPDATE Manager_MonthReportB set Manhours='47205',HseManhours='47205'
where MonthReportId='19a76efc-8279-4ba2-99f9-160b65e38b3c'
go
UPDATE Manager_MonthReportB set TotalManhours=TotalManhours+ Manhours,TotalHseManhours=TotalHseManhours+ HseManhours
where MonthReportId='19a76efc-8279-4ba2-99f9-160b65e38b3c'
go

UPDATE Manager_MonthReportB set NoEndDate='2021-05-03',SafetyManhours=TotalHseManhours
where MonthReportId='19a76efc-8279-4ba2-99f9-160b65e38b3c'
go
--现场人员
UPDATE Manager_ManhoursSortB SET PersonTotal=16,ManhoursTotal=19586
WHERE ManhoursSortId='183c55d1-2e00-46b9-9a8d-058809855872'
GO
UPDATE  Manager_ManhoursSortB SET TotalManhoursTotal=TotalManhoursTotal+ManhoursTotal
WHERE ManhoursSortId='183c55d1-2e00-46b9-9a8d-058809855872'
GO

UPDATE Manager_ManhoursSortB SET PersonTotal=268,ManhoursTotal=25339
WHERE ManhoursSortId='4e7f33a0-026b-4a0c-8d1f-648b2aeebb23'
GO
UPDATE  Manager_ManhoursSortB SET TotalManhoursTotal=TotalManhoursTotal+ManhoursTotal
WHERE ManhoursSortId='4e7f33a0-026b-4a0c-8d1f-648b2aeebb23'
GO

UPDATE Manager_ManhoursSortB SET PersonTotal=13,ManhoursTotal=2280
WHERE ManhoursSortId='a34209c2-9f34-4428-9dbe-e70e19a02b6c'
GO
UPDATE  Manager_ManhoursSortB SET TotalManhoursTotal=TotalManhoursTotal+ManhoursTotal
WHERE ManhoursSortId='a34209c2-9f34-4428-9dbe-e70e19a02b6c'
GO

UPDATE Manager_TrainSortB SET  TrainNumber=12,TotalTrainNum=15,TrainPersonNumber=190,TotalTrainPersonNum=207
WHERE TrainSortId='baaff00e-4b14-477f-aeae-0e175ab09003'
GO

UPDATE Manager_MeetingSortB SET MeetingNumber=1,TotalMeetingNum=1,MeetingPersonNumber=9,TotalMeetingPersonNum=9
WHERE MeetingSortId='bd5ea900-3351-431b-9be2-4768ed208211'
GO
UPDATE Manager_MeetingSortB SET MeetingNumber=4,TotalMeetingNum=4,MeetingPersonNumber=36,TotalMeetingPersonNum=36
WHERE MeetingSortId='c45fd951-d7f6-492d-ad44-05d7f116b740'
GO

UPDATE Manager_CheckSortB SET CheckNumber=4,TotalCheckNum=4,ViolationNumber=36,TotalViolationNum=36
WHERE CheckSortId='c86f8f03-4780-4928-b742-bf641f678489'
GO
UPDATE Manager_CheckSortB SET CheckNumber=63,TotalCheckNum=63,ViolationNumber=63,TotalViolationNum=63
WHERE CheckSortId='1b696e79-a74e-40d1-8fd2-12a3b8a05b9c'
GO
