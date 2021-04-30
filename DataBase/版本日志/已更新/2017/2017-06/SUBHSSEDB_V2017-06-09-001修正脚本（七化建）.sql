--蒲城半年报
UPDATE InformationProject_DrillPlanHalfYearReport SET ProjectId='b74601fc-f16f-4761-8885-e60f59c41b1a' 
WHERE DrillPlanHalfYearReportId IN ('c70df674-41cf-434b-95f7-ddc23933c204','e840c5d6-e137-45a3-9bc5-2e168493918c')
GO
--蒲城应急季报
UPDATE InformationProject_DrillConductedQuarterlyReport SET ProjectId='b74601fc-f16f-4761-8885-e60f59c41b1a' 
WHERE DrillConductedQuarterlyReportId='6f5dcd1d-f97e-4b1f-a928-19af1da2f2c1'
GO
--蒲城事故伤亡表
UPDATE InformationProject_AccidentCauseReport SET ProjectId='b74601fc-f16f-4761-8885-e60f59c41b1a' 
WHERE AccidentCauseReportId='990732f7-23ec-4b22-baf4-2441f38e8b23'
GO
--瓮福达州项目应急季报
UPDATE InformationProject_DrillConductedQuarterlyReport SET ProjectId='a14e223c-d18c-46b8-900a-8f9eed3a161d' 
WHERE DrillConductedQuarterlyReportId='989ac204-5719-438a-9398-a24108f93772'
GO
