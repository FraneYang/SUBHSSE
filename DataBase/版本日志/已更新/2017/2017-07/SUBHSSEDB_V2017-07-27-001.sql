UPDATE EduTrain_TrainRecord 
SET TrainPersonNum= (SELECT COUNT(*) FROM EduTrain_TrainRecordDetail B WHERE B.TrainingId=EduTrain_TrainRecord.TrainingId)
GO