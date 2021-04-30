update Sys_DataExchange set IsUpdate=0 where (MessageText like '%神华联合%' OR MessageText like '%十三%' OR MessageText like '%十四%' OR MessageText like '%十六%')
and (MessageText like '%"Type":0%' OR MessageText like '%"Type":2%' OR MessageText like '%"Type":3%')
GO