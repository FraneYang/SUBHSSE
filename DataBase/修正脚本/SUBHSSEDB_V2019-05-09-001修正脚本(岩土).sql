
UPDATE Project_ProjectUser SET UserId ='ccfe2c2a-ea35-4fd8-ae8d-ca8863571935'
WHERE UserId='1ecac6de-4599-4d03-a064-dc6be53a82a0'
GO
UPDATE Project_ProjectUser SET UserId ='a0755702-8043-432c-8b5a-726f85a00581'
WHERE UserId='e1844ace-aa17-481c-a4e6-a910f9199c38'
GO
UPDATE Project_ProjectUser SET UserId ='b81af4a6-52eb-42e4-a2d2-7015701518ed'
WHERE UserId='0809df57-3708-4753-ae3f-50aa6aff6925'
GO
UPDATE Project_ProjectUser SET UserId ='5ddffe96-7a2f-49c9-bdfd-ca6cab399f1f'
WHERE UserId='d4164b66-6ef5-4a44-8430-1649eba87122' OR UserId='981d3e1d-fea9-42a9-918d-c7df593f1f0c'
GO
UPDATE Project_ProjectUser SET UserId ='e567f8c4-e7db-429e-8a07-c635c4be0baf'
WHERE UserId='04aaf2be-4933-4e4f-ac1a-9073a56251ab' 
GO
DELETE FROM Sys_Log WHERE UserId IN ('8f7efbee-0976-41ce-9c1b-a21b85313b68','1ecac6de-4599-4d03-a064-dc6be53a82a0'
,'e1844ace-aa17-481c-a4e6-a910f9199c38','0809df57-3708-4753-ae3f-50aa6aff6925','d4164b66-6ef5-4a44-8430-1649eba87122'
,'981d3e1d-fea9-42a9-918d-c7df593f1f0c','04aaf2be-4933-4e4f-ac1a-9073a56251ab')
GO
DELETE FROM Sys_User WHERE UserId IN ('8f7efbee-0976-41ce-9c1b-a21b85313b68','1ecac6de-4599-4d03-a064-dc6be53a82a0'
,'e1844ace-aa17-481c-a4e6-a910f9199c38','0809df57-3708-4753-ae3f-50aa6aff6925','d4164b66-6ef5-4a44-8430-1649eba87122'
,'981d3e1d-fea9-42a9-918d-c7df593f1f0c','04aaf2be-4933-4e4f-ac1a-9073a56251ab')
GO
