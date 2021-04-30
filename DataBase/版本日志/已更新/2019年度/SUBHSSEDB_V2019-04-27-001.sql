alter table dbo.Training_TestTraining add TrainTypeId nvarchar(50) null
GO

alter table Training_TestTraining add constraint FK_Training_TestTraining_Base_TrainType
foreign key (TrainTypeId) references Base_TrainType (TrainTypeId)
GO