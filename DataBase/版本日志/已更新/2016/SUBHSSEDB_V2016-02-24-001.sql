--��ȫ����������
ALTER TABLE HSSESystem_HSSEManageItem ALTER  COLUMN SortIndex NVARCHAR(50) NULL
GO

--��ȫ�����������
ALTER TABLE HSSESystem_HSSEMainDuty ADD SortIndex NVARCHAR(50) NULL
GO

--ְ�������¹�ԭ�����ƽ����ʱ������Ϊ��λС��
ALTER TABLE Information_AccidentCauseReport ALTER  COLUMN AverageTotalHours decimal(19,2) NULL
GO

 