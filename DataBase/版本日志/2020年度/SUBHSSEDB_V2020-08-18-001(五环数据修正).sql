update Sys_DataExchange set IsUpdate=0 where (MessageText like '%������%' OR MessageText like '%ʮ��%' OR MessageText like '%ʮ��%' OR MessageText like '%ʮ��%')
and (MessageText like '%"Type":0%' OR MessageText like '%"Type":2%' OR MessageText like '%"Type":3%')
GO