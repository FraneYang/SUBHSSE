-- ϵͳ��������
INSERT INTO Sys_Const (ID,ConstValue,ConstText,SortIndex,GroupId)  --�±��ϱ�ʱ��
VALUES('E909CD49-9081-443F-8B40-24F098272B3D','MonthReprotDate','10',1,'SysSet')
GO
INSERT INTO Sys_Const (ID,ConstValue,ConstText,SortIndex,GroupId) --�����ϱ�ʱ�� ��һ����
VALUES('0686A181-F820-4F13-BE6D-738C9D50D63E','QuarterReprotMonth_1','3',2,'SysSet')
GO
INSERT INTO Sys_Const (ID,ConstValue,ConstText,SortIndex,GroupId) --�����ϱ�ʱ�� ��һ����
VALUES('F1FA467C-A1EA-4B51-BE4B-D5A3B6925AF7','QuarterReprotDate_1','26',3,'SysSet')
GO
INSERT INTO Sys_Const (ID,ConstValue,ConstText,SortIndex,GroupId) --�����ϱ�ʱ�� �ڶ�����
VALUES('D899B811-9EAC-44D4-93C2-42F212B2A080','QuarterReprotMonth_2','6',4,'SysSet')
GO
INSERT INTO Sys_Const (ID,ConstValue,ConstText,SortIndex,GroupId) --�����ϱ�ʱ�� �ڶ�����
VALUES('804C1BE3-1F3D-48E9-A4E3-51E641EA120C','QuarterReprotDate_2','26',5,'SysSet')
GO
INSERT INTO Sys_Const (ID,ConstValue,ConstText,SortIndex,GroupId) --�����ϱ�ʱ�� ��������
VALUES('63CCF760-3E42-4DD4-AA37-5AB845C411A4','QuarterReprotMonth_3','9',6,'SysSet')
GO
INSERT INTO Sys_Const (ID,ConstValue,ConstText,SortIndex,GroupId) --�����ϱ�ʱ�� ��������
VALUES('41C0C3ED-31A2-4DE0-89FC-B91E28A8EA5F','QuarterReprotDate_3','26',7,'SysSet')
GO
INSERT INTO Sys_Const (ID,ConstValue,ConstText,SortIndex,GroupId) --�����ϱ�ʱ�� ���ļ���
VALUES('E4148C94-EA99-44B0-9444-C29B70C77C72','QuarterReprotMonth_4','12',8,'SysSet')
GO
INSERT INTO Sys_Const (ID,ConstValue,ConstText,SortIndex,GroupId) --�����ϱ�ʱ�� ���ļ���
VALUES('1EC24125-AA73-4F02-9F35-AF51277E042F','QuarterReprotDate_4','26',9,'SysSet')
GO
INSERT INTO Sys_Const (ID,ConstValue,ConstText,SortIndex,GroupId) --�����ϱ�ʱ�� �ϰ�����
VALUES('145917FB-CDE9-42FF-A69F-7F19672344F2','HalfYearMonth_1','6',10,'SysSet')
GO
INSERT INTO Sys_Const (ID,ConstValue,ConstText,SortIndex,GroupId) --�����ϱ�ʱ�� �ϰ�����
VALUES('543EFFC0-E121-4A61-95E7-96B555B80E2E','HalfYearDate_1','26',11,'SysSet')
GO
INSERT INTO Sys_Const (ID,ConstValue,ConstText,SortIndex,GroupId) --�����ϱ�ʱ�� �°�����
VALUES('1D1B7E14-6A5E-436C-A65B-87C09124D6A1','HalfYearMonth_2','12',12,'SysSet')
GO
INSERT INTO Sys_Const (ID,ConstValue,ConstText,SortIndex,GroupId) --�����ϱ�ʱ�� �°�����
VALUES('060DA304-75A5-4D8C-90EE-AB7B117677F5','HalfYearDate_2','26',13,'SysSet')
GO
--��/��
INSERT INTO Sys_Const (ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('D7B5EE3F-C070-403D-9287-E25F281229D6','True','��',1,'0001')
GO
INSERT INTO Sys_Const (ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('C067159D-EC24-40DC-93C8-C0FF5DA89020','False','��',2,'0001')
GO

-- �Ա���/Ů
INSERT INTO Sys_Const (ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('6DE626DA-BCF5-464C-9449-54DF5F47EA7B','1','��',1,'0002')
GO
INSERT INTO Sys_Const (ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('A7092032-559E-4EC1-9104-305B80F0ECC4','2','Ů',2,'0002')
GO

/**********����״��***************/
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('A8A7F64D-39FA-4F0D-A828-7725D3BAD57F0','δ��','δ��',1,'0003')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('D2CA2922-924D-414F-9200-2589C0C6D431','�ѻ�','�ѻ�',2,'0003')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('0F0FDE76-38DF-47ED-90F5-B461EB8CDC4E','����','����',3,'0003')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('CB28CD02-D12A-4BC1-A124-91BE69F8B2D2','ɥż','ɥż',4,'0003')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('82B95ECB-CC1B-4CD0-A827-DF7C6FCCF63F','δ˵��','δ˵��',5,'0003')
GO
/**********�Ļ��̶�**************/
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('F5704416-9C41-4AA2-939C-260337BCC872','��ʿ������','��ʿ������',1,'0004')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('74DE6396-D363-4F1E-962B-0C2D547181F9','�о���','�о���',2,'0004')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('DDE9EC0C-6D77-4E8A-82EF-2D1F5F4FC0D2','����','����',3,'0004')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('AC53F279-BCD3-4183-90FF-BEEBB05BBDBE','ר��','ר��',4,'0004')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('3616391D-13EF-4CFC-868F-4AA708190D72','����','����',5,'0004')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('6CE18362-38C3-44EE-A0F9-9446BF9B9138','����','����',6,'0004')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('CBC32930-4D99-41EE-992F-A352FEF640D5','Сѧ������','Сѧ������',7,'0004')
GO
/******����*****/
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4B420968-C6B9-4E1F-BF7D-C2076D1D0C10','����','����',1,'0005')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('C3DFF299-7530-43A3-8706-7F8A16A0AD36','����','����',2,'0005')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('CE9A8CDA-897D-4614-B784-70C23FA9CA44','׳��','׳��',3,'0005')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('3C199EC7-5EA4-41B4-97CD-64F947883F99','����','����',4,'0005')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('250752A7-8648-414E-B79A-719865CC97AF','����','����',5,'0005')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('56C99737-1E2D-41E6-8700-A10E6A0AF489','ά�����','ά�����',6,'0005')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('FFC3FACB-F135-48A9-B411-4BABD5390172','������','������',7,'0005')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('2DA95986-8660-4747-A56F-C307B644708B','����','����',8,'0005')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('628E5432-BAB1-40A3-AF74-943CEEA555E9','�ɹ���','�ɹ���',9,'0005')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('525B6E87-3B61-43AA-A0E3-41EB74F84612','����','����',10,'0005')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('1A2380C8-8E39-4417-8922-4E4FDCAF12EB','������','������',11,'0005')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('D5F0EE71-FBE0-4768-8125-7B6C84AB5BD4','����','����',12,'0005')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('01F69357-6224-4A45-B1B8-E14458EB2FA2','����','����',13,'0005')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('5B5932FD-4B25-4A8D-85E3-A26D13B842C5','������','������',14,'0005')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('CA953687-04B5-447E-8AE5-8B55862F8B7D','����','����',15,'0005')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('04B20FBC-405D-488D-B648-020298573D09','����','����',16,'0005')
GO
/*****Σ��Դ��������******/
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('9E394C78-2C3A-4809-8DD8-AEBEA1604A29','I','I',1,'0006')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('F9C65328-E823-4980-AD63-5DDD86AD9D5F','��','��',2,'0006')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('36F14107-686E-4C20-89C2-C47BC2AED713','��','��',3,'0006')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('619EB90A-BE4C-44D0-BDF5-0382D759ED9A','��','��',4,'0006')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('AEC1885D-6282-4580-940E-E4046517B0E0','��','��',5,'0006')
GO
/****Σ�ռ���****/
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('8D97C51C-6253-4276-9498-71563CE1D350','1','1��',1,'0007')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('3276B596-6A70-404A-A654-452694C0BAAB','2','2��',2,'0007')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('C5BE90E8-4EFC-441C-8795-D5FBA457CFEB','3','3��',3,'0007')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('650A321B-8EC7-449D-9C2F-A1EAB7449BE0','4','4��',4,'0007')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('46C35A27-5DDC-417A-BEEC-A20E8CB865DF','5','5��',5,'0007')
GO

/****���****/
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('08512BB0-18AC-4AB6-A71C-AA6A382FEA51','2010','2010��',2010,'0008')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('E63DB0F1-B129-4152-A642-E0829C6FCF92','2011','2011��',2011,'0008')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('D60217FE-D9D8-4E2A-9FDA-F966E7003C4B','2012','2012��',2012,'0008')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('D35DFE6A-8186-4150-A0AE-02320D36DC5A','2013','2013��',2013,'0008')
GO

INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('8EB3A33A-2DC5-4F9B-8CA8-900B3F5D87AD','2014','2014��',2014,'0008')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('8F8149A1-EA63-4457-8A07-60BE31D7AEE6','2015','2015��',2015,'0008')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('47C58759-8652-46CD-A296-852266711566','2016','2016��',2016,'0008')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('E3D1C073-321A-4785-AE2B-F0F3EA6B2EC0','2017','2017��',2017,'0008')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('5E73DEEA-4B99-4FD0-8628-FCB2C6140363','2018','2018��',2018,'0008')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('3D26B11E-9F1C-48F4-8B27-A8BC7FA95C53','2019','2019��',2019,'0008')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('04BCEBAC-AD96-42EA-B94E-90C005FC7307','2020','2020��',2020,'0008')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('658AAE9C-0044-46F6-94BD-D059627150DA','2021','2021��',2021,'0008')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('6CB345EC-6EC3-4D17-B4EE-C9E4102384E2','2022','2022��',2022,'0008')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('3D77FEB7-C350-4089-928B-3469C89CE547','2023','2023��',2023,'0008')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4669EBF8-5972-4AF4-9F09-A7D6DB2C97A5','2024','2024��',2024,'0008')
GO
/****�·�****/
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('E697CE9C-2289-47DA-AF97-057049E47AB6','1','һ��',1,'0009')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('E03462B1-2703-4F86-BA95-C01DB4502138','2','����',2,'0009')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('04F15D49-5429-481A-8C0A-39D51C5180FB','3','����',3,'0009')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('D8EDF396-5D5D-45B1-9576-B35D16F52370','4','����',4,'0009')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('D2CBFB4A-DBA5-4FB1-B6D0-D0FB13023641','5','����',5,'0009')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('0A7FB9F8-9E82-4ABD-848D-279259946974','6','����',6,'0009')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('A50FB247-CCF3-48B8-BF8D-0F21B6C415B1','7','����',7,'0009')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('35F53EA8-682D-4CCA-A4DA-5C1031585164','8','����',8,'0009')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('30D2F23C-18E3-40C5-8280-44A09D3BDFAC','9','����',9,'0009')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('11D33104-F761-4B12-B557-130469849D5F','10','ʮ��',10,'0009')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('7A6A21EC-7635-4D01-B3A0-8B42B8B44006','11','ʮһ��',11,'0009')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('6E65A6D5-75AE-4157-81E5-C349CC3B1ECD','12','ʮ����',12,'0009')
GO

/****����****/
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('BB0FF7F0-75D3-44EF-9AFE-9707071D7CB7','1','�ϰ���',1,'0010')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('F64492AD-EA56-4EAC-BBD8-D8ED9F8C7369','2','�°���',2,'0010')
GO

/*����*/
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('19A7BC42-78B6-484B-8908-02202273A7A6','1','��һ����',1,'0011')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('A39205E4-8AE4-4A3B-9A65-B8F27BC6D6CE','2','�ڶ�����',2,'0011')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('782EE135-17B0-44B5-A1F3-6F4A9F18B67D','3','��������',3,'0011')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('492A97EC-00F7-4208-8C7E-029353F3B5B8','4','���ļ���',4,'0011')
GO

/****�¹�����****/
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('D250CC08-9F3B-45D2-AB95-16BCE27D257C','�ܼ�','�ܼ�',1,'0012')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('E51259BE-CC49-435E-85B2-023CC5F54282','������','������',2,'0012')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('C2D42132-0255-4F7B-A6D5-E3EC7838ED0E','�����˺�','�����˺�',3,'0012')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('F8DBADCF-A398-4EDD-9D38-7E6303A62986','�����˺�','�����˺�',4,'0012')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('2273B380-D754-46AB-8026-FAD118008A63','�����˺�','�����˺�',5,'0012')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('A78D769E-7A05-4A28-83C1-A66783CC13F8','����','����',6,'0012')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('289A7C7E-01E9-4DCB-8141-3A8BA015B8FA','����','����',7,'0012')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('785BE436-DBA8-4984-8C47-AB0047F4809C','����','����',8,'0012')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('3CF31D4F-1593-4EFE-949C-343E4199453A','����','����',9,'0012')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('BBBA0610-E54D-4A34-A130-7244770B80E2','�ߴ�׹��','�ߴ�׹��',10,'0012')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('AF5BA76F-AFAC-4ED7-A650-A65193CA5E2F','̮��','̮��',11,'0012')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('2B9A2D72-0125-47A5-8C1E-09BF43EE1E74','ð��Ƭ��','ð��Ƭ��',12,'0012')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('A684F545-1B48-4787-A3E6-DE67FEBD2D21','����','����',13,'0012')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('9E8CAAFD-4F33-4EF6-A6E4-BAFCD85AEE15','����ը','����ը',14,'0012')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('F9F416C0-CEDB-4608-BC96-D164CBF7D7BB','��ѧ��ը','��ѧ��ը',15,'0012')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('0B6F24A1-65C4-4572-A629-B90E93063128','�ж�����Ϣ','�ж�����Ϣ',16,'0012')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('8807BF35-0591-4414-A2E9-9BA1801DDE37','����','����',17,'0012')
GO

/****��ɫ���****/
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('BAEC82D6-682C-4969-8EDE-9E7742F541D9','1','һ���ɫ',1,'0013')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('519A687C-4A88-4DDA-BFB0-4EA11ABDF849','2','�����ɫ',2,'0013')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('BA1A1EC2-BEC1-450D-948E-E9502049A97F','3','�쵼��ɫ',3,'0013')
GO

/****��ť��������****/
--INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
--VALUES('414E2CB4-FD5B-48AF-835F-65046CA24FE4','����','����',1,'MenuButton')
--GO
--INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
--VALUES('27CC011F-73C5-4944-BDF7-159711541FAE','�޸�','�޸�',2,'MenuButton')
--GO
--INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
--VALUES('B6DA9D7F-BAB0-4F93-A24F-649A6553D27D','ɾ��','ɾ��',3,'MenuButton')
--GO
--INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
--VALUES('B5B7CC79-4D74-48F2-AA11-94F71768D53E','����','����',4,'MenuButton')
--GO
--INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
--VALUES('1F0E6E63-1224-4E62-85ED-D05C57AB4733','���沢�ϱ�','���沢�ϱ�',5,'MenuButton')
--GO
--INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
--VALUES('4B0532C1-0ACF-4EC1-B2D7-DD5285635D3D','���','���',6,'MenuButton')
--GO
--INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
--VALUES('A841D283-9F02-465B-B608-3E6758077FE1','�ϴ���Դ','�ϴ���Դ',7,'MenuButton')
--GO
--INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
--VALUES('2110A36E-FB9F-48F6-BCC0-B77EFE81D79E','����','����',8,'MenuButton')
--GO
--INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
--VALUES('147988B2-A7EB-44B9-AE7C-58C6CDCEB223','ѡ��','ѡ��',9,'MenuButton')
--GO
--INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
--VALUES('0FB4E582-71C3-4720-90B4-00A821519758','��ӡ','��ӡ',10,'MenuButton')
--GO
--INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
--VALUES('2B261FC5-55B6-4C0C-9EAC-95225611E9CB','����','����',11,'MenuButton')
--GO
--INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
--VALUES('D5E8A565-C7DD-4CC0-AF13-B7542D109930','����','����',12,'MenuButton')
--GO
--INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
--VALUES('B6204227-D4B1-4239-B013-42359D0AE7A7','ͳ��','ͳ��',13,'MenuButton')
--GO
--INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
--VALUES('03F8EF12-61F7-4069-8E43-ECEBD877728B','ͬ��','ͬ��',14,'MenuButton')
--GO

--/****��λ��Ŀ����****/
--INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
--VALUES('0D303412-CCF5-47B0-92CB-68D0E8AD8FEE','1','�ܰ�',1,'UnitClass')
--GO
--INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
--VALUES('E4EC115A-90FD-40A8-86DB-BD4A9585202E','2','�ְ�',2,'UnitClass')
--GO
--INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
--VALUES('696A7B14-997E-4892-BBCD-01463D295460','3','����',3,'UnitClass')
--GO

-- ��Դ�ϴ����״̬��δ��ˣ�δͨ������ͨ�� 
INSERT INTO Sys_Const (ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('25DC9192-7B97-45BC-9F8A-9E8BA79EFE67','1','δ���',1,'UploadResources')
GO
INSERT INTO Sys_Const (ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('762A484D-31A2-4146-9093-4BBAAD01E129','2','δ����',2,'UploadResources')
GO
INSERT INTO Sys_Const (ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('A504D7B0-F830-4A71-AEF1-FAC8A069E522','3','�Ѳ���',3,'UploadResources')
GO

/*��������*/
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('F89AECC1-1247-4B7B-A5E0-D85F22440727','1','�±�',1,'ReportType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('3DAF4D61-6DFC-40C6-B704-F51EF0458E1B','2','����',2,'ReportType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('9DA87838-3CC5-40DF-8315-E0272CF62613','3','���걨',3,'ReportType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('30751E5D-96BB-4A30-B5E1-89FF65362574','4','�챨',4,'ReportType')
GO

--��ӡ����
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4C57E704-DB54-479F-B946-010049D0DE0C','1','����ʱ��ȫͳ���±�',1,'Report')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('C7D60BE0-2C52-49FF-B0E2-F0D8D3B2CA10','2','ְ�������¹�ԭ�������',2,'Report')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('B03ACB80-0F6C-4A19-BCD1-BC1FAA601BD0','3','��ȫ�������ݼ���',3,'Report')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('B6020919-CB6D-42BF-84D2-538A3B06135F','4','Ӧ��������չ�������',4,'Report')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('F077DC71-E050-42D3-B58A-10F0C2757406','5','Ӧ�����������ƻ����걨',5,'Report')
GO
INSERT INTO Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('A9187195-BED4-4C02-8CD5-D3FFD132A401','6','��Ŀ�ֳ�����ʱ��ȫͳ���±�',6,'Report')
GO
INSERT INTO Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('F402D196-891E-45A7-B160-DF9D0EA131F4','7','��Ŀ�ֳ�ְ�������¹�ԭ�����',7,'Report')
GO
INSERT INTO Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('EDCEED08-93DE-483B-89C8-3C33BC2297BE','8','��Ŀ�ֳ���ȫ�������ݼ���',8,'Report')
GO
INSERT INTO Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('70A69D64-1CF4-4342-9C32-5F26645C4491','9','��Ŀ�ֳ�Ӧ��������չ�������',9,'Report')
GO
INSERT INTO Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('2831174B-B9D5-4291-B59F-48FF32DF5861','10','��Ŀ�ֳ�Ӧ�����������ƻ����걨��',10,'Report')
GO
INSERT INTO Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('1C939B14-75F8-450C-9359-13186A279E43','11','��ѵ��¼',11,'Report')
GO
INSERT INTO Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
Values('782C896E-8CE7-4C15-99B0-EF3E3542C82D','12','����Σ��Դ��ʶ������',12,'Report')
GO
INSERT INTO Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
Values('7A702DDF-5274-4E32-AF08-F096B72E1A0D','13','����Σ��Դ��ʶ������(��Ҫ��������)',13,'Report')
GO
INSERT INTO Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
Values('92FFAFA4-4037-4F52-B8C3-F63E032CE5C0','14','ְҵ������ȫΣ��Դ��ʶ������',14,'Report')
GO
INSERT INTO Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
Values('CDB21652-8053-4AC9-9691-650E04F4A716','15','ְҵ������ȫΣ��Դ��ʶ������(�ش�Σ��Դ)',15,'Report')
GO
INSERT INTO Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
Values('005434A8-2FCA-43B2-925A-D7321C029F8C','16','HSSE��־�߹��������ռ�',16,'Report')
GO
INSERT dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES  ('8713A053-4039-433C-B8B6-3B5A9283B184','23','�ְ����ϴ��ܱ�',23,'Report')
GO

/*ͼ������*/
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('8F1A3DCA-879E-46AF-92BC-D68CFF4A8CF6','Column','����ͼ',1,'ChartType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4CCBC24C-7931-4BC5-9AE5-DB8286257386','Line','����ͼ',2,'ChartType')
GO

--INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
--VALUES('03BBB623-EF4B-464A-BACE-EA451AC8CC07','Pie','����ͼ',3,'ChartType')
--GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('7CDF872A-6819-44EA-8070-9F7C604A9FDD','StackedArea','�ѻ����ͼ',4,'ChartType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('A746604F-2533-46B8-872C-66EDF352A614','StackedArea100','�ٷֱȶѻ����ͼ',5,'ChartType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('1E30C420-E84B-4222-A7FA-F6765AE3C73F','StepLine','������ͼ',6,'ChartType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('B4E4D6E2-E257-480E-93ED-8F46FCBFF811','Stock','�ɼ�ͼ',7,'ChartType')
GO

/*��Դ�ϱ�״̬*/
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('ED557D0A-9B48-4767-AAC9-3A7A4AF9848C','1','����λ',1,'UpState')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('B0AC388C-2999-4F6F-8CCA-E9FBC6F39441','2','���ϱ�',2,'UpState')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('289F0414-41A8-4708-A239-F76A6BA86957','3','���ϱ�',3,'UpState')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('7384A538-5F3C-4D10-89FE-F28505FEAE50','4','�ϱ�ʧ��',4,'UpState')
GO

/*�ල�����������*/
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('D607C894-0032-4D1B-B28D-A441F1534195','1','�ۺ�����',1,'CheckRectType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('10A79A34-774D-4EC8-B56B-66716FD5386C','2','��������',2,'CheckRectType')
GO

--���˵�
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId) VALUES('1','1','HSSEʵʩ�ƻ�������涨',1,'sysMenu')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId) VALUES('2','2','HSSE��ѵ���ֳ���Ա����',2,'sysMenu')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId) VALUES('3','3','HSSE�������',3,'sysMenu')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId) VALUES('4','4','��ȫ��ҵ���֤����',4,'sysMenu')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId) VALUES('5','5','HSSEΣ��Դ��ʶ������',5,'sysMenu')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId) VALUES('6','6','ʩ������/HSSE�������',6,'sysMenu')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId) VALUES('7','7','HSSE������',7,'sysMenu')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId) VALUES('8','8','HSSE�������',8,'sysMenu')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId) VALUES('9','9','HSSE���ü����ʹ���',9,'sysMenu')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId) VALUES('10','10','HSSE��������',10,'sysMenu')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId) VALUES('11','11','HSSEӦ����Ӧ����',11,'sysMenu')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId) VALUES('12','12','HSSE��Ϣ����',12,'sysMenu')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId) VALUES('13','13','HSSE�¹ʴ���Ԥ��',13,'sysMenu')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId) VALUES('14','14','HSSE����������',14,'sysMenu')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId) VALUES('15','15','HSSE��Ч���۹���',15,'sysMenu')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId) VALUES('16','16','HSSE���ɷ����ʶ',16,'sysMenu')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId) VALUES('17','17','�����ļ�����',17,'sysMenu')
GO


--�˵�����
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('C6BA3325-1EBF-463A-AB14-51DF09B8BBF8','1','�������ò˵�',1,'MenuType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('109CB08E-774B-45D5-A29E-27A1840208B9','2','��������˵�',2,'MenuType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('1E203266-C960-43D6-96DA-43076933A239','3','��Ŀ�ֳ��˵�',3,'MenuType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('7CAD59B6-F61E-49AF-8432-EE2989D5DF23','4','������Դ�˵�',4,'MenuType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('1F6A11DB-923E-45B7-B04F-AEDE0F44681F','5','������Ϣ�˵�',5,'MenuType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('77424619-1DE9-44B7-A683-609D63EE11C9','6','ϵͳ���ò˵�',6,'MenuType')
GO

--��Ŀ����
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('07C853E4-BF3A-437E-90A1-44A45211E5E4','1','EPC',1,'ProjectType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('3753DAE7-C2CF-4C31-B970-4FB5B88C9DA4','2','EPCM',2,'ProjectType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('05C4234A-86EA-49D0-B868-BF7218746331','3','PMC',3,'ProjectType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('C361419D-EE17-4480-AB21-DF1438BF4D14','4','����',4,'ProjectType')
GO

--��Ŀ��λ����
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('D95611A1-731C-4C28-B914-856DB6300692','1','�ܰ�',1,'ProjectUnitType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('12729AD0-9CDB-41D8-B088-12D23DB7608C','2','ʩ���ְ�',2,'ProjectUnitType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('06BD8FC6-C044-42E3-BACB-A276E1A6F062','3','����',3,'ProjectUnitType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('6E93D814-74CF-4447-A537-A1762B6E8401','4','ҵ��',4,'ProjectUnitType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('ACB6DD56-D788-4BBA-AA7E-9E3CB7573918','5','����',5,'ProjectUnitType')
GO

--��������
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('F0A37E9B-779C-4F59-A639-C3010960CE4B','1','��֯����',1,'SignType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('6C4A41DF-A330-4FB1-AB52-12FC93531204','2','�������',2,'SignType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('C294C6C3-3F5F-406B-974E-A60A328090D6','3','��ʶ����',3,'SignType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('7D95A06F-F6ED-4AAA-AC89-1D21037FF9E2','4','�����淶ͼ��',4,'SignType')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4D54AD76-05D9-4014-A509-0AA37156D598','5','����ʩ������',5,'SignType')
GO

--������:��������
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('96D3669D-9496-4BAB-9EC3-B2A835AD6285','1','��',1,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('985A299C-E63F-46B9-A533-A5CFACBFF430','2','����',2,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('61174112-CA6B-46C6-8751-C6E31DB1C1F0','3','��',3,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('C3A2DDFE-CFC3-4ECE-B2FD-6688965DE684','4','����',4,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('E4EF7E95-1CA7-4462-8762-1177E5B617A3','5','������',5,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('79739C15-08CC-4F94-A486-AF3E88BB6981','6','���ѩ',6,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('454AAE20-A665-47AA-A7B1-40A405874753','7','С��',7,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('91EFD90C-6380-4DFA-B4EE-7AF4CAA79669','8','����',8,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('9F9736ED-B8C0-455E-85DE-138522416C52','9','����',9,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('B0639D12-530D-42C0-827D-D90A70561A00','10','����',10,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('A71E625C-1A48-40C2-B012-9C3CDA705244','11','��ѩ',11,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('B2E53A18-462C-4081-AE25-7E578C96B11B','12','Сѩ',12,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('F72F69AE-2955-4A36-88AD-0DEC30510F31','13','��ѩ',13,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('22A603C1-2E8B-4948-8200-7429A3C285D8','14','��ѩ',14,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('8A6BD09C-5ED7-4BEF-A16E-A0103FAC06FD','15','��ѩ',15,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('14EE260C-7055-4779-98FB-A05315B8E3DD','16','��',16,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('552AD25B-9029-46E3-9D27-32262F9DBF75','17','ɳ����',17,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('D62673F3-C602-441E-A340-4731811C9019','18','����',18,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('BFA7547B-3732-4BBD-A972-A6FF8322E57E','19','��ɳ',19,'Weather')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('46797BDA-AF10-46F1-91D5-7B91B21BD951','20','��',20,'Weather')
GO

--������:�����ʩ
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('3DB4A7BE-A9AC-47E9-9C63-E3804F6782A9','1','��������',1,'HandleStep')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('A875A010-92E6-49DD-9825-20B50101FA5D','2','��ͷ����',2,'HandleStep')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('ACAC4FB5-4466-4089-A059-71A7A5572288','3','��������֪ͨ��',3,'HandleStep')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('4957AD1E-9BE5-4A7F-8E16-3B7D02BFB895','4','HSSE����֪ͨ��',4,'HandleStep')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('A661BAF8-6F61-4DB7-B152-FC3339F11E6D','5','��ʱ����',5,'HandleStep')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('70E31BBD-C01B-4D7F-8F0E-D1E56B84B091','6','����',6,'HandleStep')
GO

--������:Σ��Դ��Ӧ�����׶�
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('B840CF8F-ED62-4F2D-9140-0E552015A9D6','1','�ػ�������׮',1,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('145E6655-B0F5-48D9-AFA0-7BF5D13ECE85','2','�������ֽ�������ṹ',2,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('C3BFD8C6-E951-4549-8FE5-AF06AD933688','3','��������',3,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('415F4593-53E1-4610-9964-7D9129D87425','4','���¹ܵ�',4,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('4950110D-6ACE-4144-BFE4-3988FC1E1D1C','5','�ֽṹ',5,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('8105CFF5-5986-4361-B700-406C2536D9DA','6','�豸����е���ܵ���װ',6,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('9D927E44-CB2B-48EE-B07F-8EEC8A8F58C8','7','�����Ǳ�װ',7,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('E9305293-B2BB-4E03-87EF-0B8485AA50A7','8','�������·���',8,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('C5737F60-9B4D-41AE-964F-8566FBF85B09','9','��ɨ���Գ�',9,'WorkStage')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('6D93F7B7-CE7C-4DFE-86E0-FFC7ADACA20E','10','������ҵ',10,'WorkStage')
GO

--������:����Σ��Դ����
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('E8784339-4589-44BC-A7B1-56B6841A978C','01','������',1,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('0E868857-C504-4695-88F1-9A3E26E2CEE5','02','�ﳾ��',2,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('BBE8A43F-7338-47F4-8E94-5C87FBC66DCA','03','��ˮ�ŷ���',3,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('26D4409C-D81B-4EA1-B91E-8E0FD2782CE6','04','��Դ��Դ��',4,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('17ED987F-2236-410B-8C80-45AACE417AB1','05','�̷�����',5,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('0C5A1360-FBA9-4972-9382-41087BF7E117','06','������',6,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('EC40FEC8-96BA-4BC9-8EA7-69140CD289A2','07','й©��',7,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('1226FA6E-2D8E-4545-8E79-139872B88BDA','08','����Ⱦ��',8,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('D08B8589-95D5-4C12-8112-EEFF99897FFA','09','�ж��к�����',9,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('618BBBF5-9388-44F4-9B1E-7A30DB14B7D3','10','������',10,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('BDF50C6B-E16B-48B3-96BC-C615FCAC62E3','11','��ζ��',11,'EnvironmentalType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('4AEF82F9-C227-4205-8484-8F940B4C75D6','12','ͻ���¼�',12,'EnvironmentalType')
GO

--������:����Σ��ԴС����
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('F820F010-FF7E-4DBE-ABDC-80FCC28136D4','1','��Դ��Դ��',1,'EnvironmentalSmallType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('4D15B20D-975B-44FE-B2FB-97F557A38DB8','2','��Ⱦ��',2,'EnvironmentalSmallType')
GO
--������:Σ���Խϴ�Ĺ����嵥����
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('A39208D9-5CF8-464A-A97E-A3614AC1CC0A','1','����֧������ˮ����',1,'LargerHazardType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('7F7FFA9D-DB53-4791-9F4A-801AD974866C','2','�������ڹ���',2,'LargerHazardType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('C9317182-DB5A-4217-AFF3-B87775DEB81A','3','ģ�幤�̼�֧����ϵ',3,'LargerHazardType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('6253E62B-BD9E-4863-A892-0465BBCBE57B','4','���ص�װ����װ��ж����',4,'LargerHazardType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('334139FF-749A-4E0C-9FD9-F35FB88E54A8','5','���ּܹ���',5,'LargerHazardType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('308C7203-A289-4B44-9940-C603559DF024','6','��������ƹ���',6,'LargerHazardType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('6CA96A4C-3FB8-46CC-BAA6-6C45E3FF659C','7','����',7,'LargerHazardType')
GO

---�¹��˺�����
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('53591CA9-1B8E-4031-AC56-D156DC907170','1','����',1,'Accident')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('1A185805-22AA-4FB0-A2F2-F5A553CF9919','2','����',2,'Accident')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('C619C405-374D-4BEB-B5E8-F14107B79120','3','����',3,'Accident')
GO

INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('F17300B0-4465-40EB-8672-8929F4249A25','1','ʩ����λ���鱨��',1,'AccidentReport')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('11275CA4-C215-4446-997F-07F0B7C139C0','2','�ܰ������鱨��',2,'AccidentReport')
GO

INSERT INTO Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES ('3FA9824D-9382-4139-AF5C-0EE91A1F39CA','1','����',1,'RewardOrPunish')
GO
INSERT INTO Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES ('D13B379C-DCE9-403E-89B8-EBEEDD551052','3','����',2,'RewardOrPunish')
GO  

INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4725617A-C91B-43D7-80C2-C4441A233BF6','1','PPEΥ��',1,'ViolationName')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('70A3FB1F-DB72-499E-92DF-2F10A7C0F4DB','2','����Υ��',2,'ViolationName')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('EE7C7078-3675-4358-9721-912CC7BD69DE','1','��ȫ��',1,'ViolationType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('5FB257CB-B797-4712-A99F-2D8C1A7C604A','2','������',2,'ViolationType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('514C4CD0-51DF-4DCA-8544-F4A65572CB9B','3','�ͱ�Ь',3,'ViolationType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('DD8AD9C3-4662-4F0E-AD43-32D7DA5CCEB2','4','��ȫñ',4,'ViolationType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('CE193F13-B66E-4E59-AABB-2485635312FF','5','��Ŀ��',5,'ViolationType')
GO

--������:��λ����
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('0B705F90-BB2B-4C22-A336-90C0B677A95A','1','һ������λ',1,'PostType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('89164C32-F817-4082-B646-F950769C91C4','2','������ҵ��Ա',2,'PostType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('67B9987E-38B2-42C3-B0A7-678426DD0E93','3','һ����ҵ��λ',3,'PostType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('6CDB171F-59C9-4B60-92FE-2AFFDF115D6D','4','���ֹ�����Ա',4,'PostType')
GO

INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('919A66A8-31F1-4A0E-BC6A-43D3C298748F','1','�ػ�����',1,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('20E8B2C4-4558-4D43-BAF9-8491FD084E31','2','��׮',2,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('8BF8B210-0A4D-42DB-99D1-AB048096101D','3','����֧���뽵ˮ����',3,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('F522C5C5-5CF3-496D-8525-D9EB47824359','4','�������ڹ���',4,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('71DA9BF5-8361-4779-A4CB-5FF0D6953FCD','5','ģ�幤��',5,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('19423BF8-5DD8-4D1E-8B00-E7609C7294D3','6','����ʩ��',6,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('65084AC5-4DF1-4C00-8B52-A3D3BA86A805','7','�ֽ�������ṹ',7,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('D299251C-DF2C-470F-A312-6ED86E6640CC','8','���¹ܵ�',8,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('9B045E0B-8F43-4EC6-A4A6-042301921D16','9','�ֽṹ',9,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('FD7178A6-87DE-44E1-950A-FEAFB7876C10','10','�豸��װ',10,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('06CDB55E-D01C-455E-8BE0-2008791D2631','11','�������ص�װ����',11,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4C61E43B-2FEC-4DE9-A465-359D4CE1C0E3','12','���ּܹ���',12,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('A1C5C018-AB81-4A90-9E4D-0732F0369529','13','��е��װ',13,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('63FE38FA-4B28-444E-9AB6-0E0079655CE5','14','�ܵ���װ',14,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('D8360FBA-C1A6-4D6B-8FF4-A52309AAB646','15','�����Ǳ�װ',15,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('AB8ACCB5-414D-4D2F-901D-155BB677B849','16','�������·���',16,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('D8B14844-9FD6-422B-B61F-45185C105E03','17','���',17,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('84E6BF94-5EBA-4B4B-B733-16D57AF6D4EF','18','���ƹ���',18,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('577500B4-FACE-45C0-9BFA-6B63A4B72FB3','19','��ѹ',19,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4A561C7F-932F-44B7-9B84-A7F2595B5C9C','20','��ɨ',20,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('D135FDFA-7AAA-448A-9A92-7FA8CDF32431','21','�Գ�',21,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('156689CE-E4C7-4563-BC84-4C1841C8752C','22','�Գ�����',22,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4ACE9E4C-8529-4DE5-A9B3-5F47543E8D95','23','������',23,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('27CFC82A-A0B8-4BA8-8E52-01554E903A56','90','ȫ����׼',24,'CNProfessional')
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('3C03AC5D-3AE8-46AC-A946-72A1C9583431','91','����',91,'CNProfessional')
GO

GO
--ʩ����������
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('E4A1B5BE-EFF4-42AC-A59C-CE1B2010F788','1','ʩ���������',1,'InvestigateType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4F8BB7DD-E94F-405D-B050-CB0B5CB74DE8','2','HSSE�������',2,'InvestigateType')
GO

--������:��ҵ��ȫ�������Ͽ�������
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('48A8C791-50EB-449A-B350-0FF77F4D8D44','1','�±�',1,'SafetyDataCheckType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('C0451870-70F6-4823-A1B3-9B49CA42B91B','2','����',2,'SafetyDataCheckType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('69B934E2-A377-4509-BE3D-C344FDA13E4C','3','��ʱ��',3,'SafetyDataCheckType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('5C08FF81-AD70-4391-A42B-01688BD3AD15','4','������',4,'SafetyDataCheckType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('01E3D64E-A302-429F-B22B-ADF5B650A73B','5','���걨',5,'SafetyDataCheckType')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('3C8DEDE0-E6C5-41C0-9113-9FD2DEEC3FC2','6','����',6,'SafetyDataCheckType')
GO

--�����������������
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('B15975E8-867B-42C8-8D99-570E9D3DA6E9','6','��֤�ϸ�',1,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('7E82B247-B419-47E4-AD19-205DB2BD7C5B','7','����Υ��',2,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('407E76ED-E334-41FC-86EC-BB0E8EB5CE39','8','�õ�',3,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('49245CD9-EBB4-497C-A083-62B83BA5A1E8','9','����',4,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('779B1C38-198E-421F-B93E-306E82168BEC','10','����',5,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('894BFF6F-4EBB-4E63-87DB-CF324FC38AF1','11','���ּ�',6,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('BBB85FF5-873A-455D-A077-860EA0A3329F','12','�ߴ���ҵ',7,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('EE89D46A-A513-43BD-9024-6C30BC0BE8BD','13','��װ',8,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('A296D1E0-0F95-4601-8636-F5D48ADD6A3B','14','����',9,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('6EA4E1F2-392C-4D8B-AEC7-E8AB1E18900B','15','���޿ռ�',10,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('7A963C66-C3A8-4517-AD87-56BD90DD50C8','16','��ƿ',11,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4D8CADD9-F976-414D-87EB-6B17454DDF52','17','Σ����Ʒ',12,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('10A08BDF-88BF-481C-AA93-548E8081B34F','18','�����豸',13,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('B90B14C5-5F52-461C-9824-D1CED893BE93','19','��������',14,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('F2E6994A-E6F0-45B2-9754-D875C1F4F2E6','20','������ȫ',15,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('60E933E5-9142-4C8A-A3C0-0B6AD04E09D0','21','����ʩ��',16,'ViolationTypeOther')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('31AB3064-54FC-4881-8518-1DEA628EBD21','22','ְҵ����',17,'ViolationTypeOther')
GO

--������Ӧ����������
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4B7CB6A5-0223-4C3C-BA6B-9C8CF6E3E358','1','�ۺ������ֳ�',1,'DrillRecordType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('DDF67DFE-6CC3-425F-ACAF-C9965BE278A0','2','�ۺ���������',2,'DrillRecordType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('AE42B48F-CDCB-4536-8798-81C430A0BC5A','3','ר�������ֳ�',3,'DrillRecordType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('E07F28DD-8072-4B58-8F22-005E89290489','4','ר����������',4,'DrillRecordType')
GO

--�廷�����±�������
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('DFB42D2F-1CA2-4E21-AABB-BBE1FBE75F5C','MonthReportCEdit1.aspx','1 ��Ŀ�ſ�',1,'MonthReportCItem')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('2CA1F0E6-37FE-4267-85EB-E07764D5BE80','MonthReportCEdit2.aspx','2 ������Ŀ�ֳ�HSE����Ͷ�����',2,'MonthReportCItem')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('D8141695-CD8C-4724-98A5-C5DD015FA917','MonthReportCEdit3.aspx','3 ������Ŀ�ֳ�HSE�˹���ͳ��',3,'MonthReportCItem')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('244E173B-43D8-4D37-B4BE-FFBAF6EC18B7','MonthReportCEdit4.aspx','4 ������ĿHSE�ֳ�����',4,'MonthReportCItem')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('890B9A0E-DA44-471A-92BD-E7150E4FFC7C','MonthReportCEdit5.aspx','5 ������ĿHSE��ҵ����',5,'MonthReportCItem')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('7EC9E717-5869-4B16-8D38-7CD156C0330A','MonthReportCEdit6.aspx','6 ������ĿHSE���ù���',6,'MonthReportCItem')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('80488E9F-5289-4A77-A7E8-0B13FEF14ABA','MonthReportCEdit7.aspx','7 HSE�¹�/�¼�����',7,'MonthReportCItem')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('FC2F863C-248D-424C-998D-9FC00B55C13D','MonthReportCEdit8.aspx','8 �����������',8,'MonthReportCItem')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('C11BB760-8C4D-489F-8FA3-324BD0CBEB38','MonthReportCEdit9.aspx','9 ���¹����ƻ�',9,'MonthReportCItem')
GO
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('671D47D7-511A-404C-B864-3179483F3579','MonthReportCEdit10.aspx','10 ���ڵ���Ҫ���⼰�Ľ���ʩ�� ��Ҫ��Ŀ������Ŀ���ܡ���˾��ز��š�ҵ��Э���������',10,'MonthReportCItem')
GO

--������:���������±�������
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('FF36D1CA-E87F-430C-9D9F-5ADF5629F656','MonthReportDEdit1.aspx','1 ��ί������Ҫ',1,'MonthReportDItem')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('967B0FD2-A834-48E0-9CD2-A645B439FEC1','MonthReportDEdit2.aspx','2 ��ȫ�������������±�',2,'MonthReportDItem')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('5BEBEE49-0256-477B-A100-57F7C3581679','MonthReportDEdit3.aspx','3 ���ܽ�',3,'MonthReportDItem')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('A5EC533A-40B8-4AAE-8064-997553585A28','MonthReportDEdit4.aspx','4 ������ְҵ�����±���',4,'MonthReportDItem')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('503A902F-73F8-4467-8976-470BD0EAB8CD','MonthReportDEdit5.aspx','5 ��ȫ����ʦÿ��Ѳ���¼��',5,'MonthReportDItem')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('8DC49F74-9F25-4EED-9B07-9AD8A1378FF1','MonthReportDEdit6.aspx','6 Υ���¼���ܱ�',6,'MonthReportDItem')
GO
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('69C20627-27C1-4EF1-9F9C-29032F98B17D','MonthReportDEdit7.aspx','7 ʩ����λ�°�ȫ���˱�',7,'MonthReportDItem')
GO

--������:�˹�ʱ�±��Ƿ�ƽ����ȡֵ
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('CF93B8A3-16EB-4872-9859-C10ECE287E11','1','�˹�ʱ�±��Ƿ�ƽ����ȡֵ',1,'IsMonthReportGetAVG')
GO
--�����±���������
INSERT INTO dbo.Sys_Const(ID,ConstValue,ConstText,SortIndex,GroupId)
VALUES('D1D8A032-2803-496E-B4F2-7A8637F74520','6','�����±���������',1,'MonthReportFreezeDay')  
GO
--�Ƿ���Զ�ִ�в��
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('71EF5F88-575B-483D-8A6C-96E4A40A3BEA','0','�Ƿ��Զ���ȡ��������',1,'Synchronization')
GO

--�Ƿ�̶�����
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('4DABA60A-00A9-44B0-8EC0-CFF27AC525E1','0','�Ƿ�̶�����',1,'MenuFlowOperate')
GO

--�Ƿ��벩��������ȡ
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('9F2FCD13-10E0-4CB2-80E8-CC2CBB91E031','0','�Ƿ��벩��������ȡ',1,'ChangeData')
GO

--������-��ҵƱ
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('F10AD877-DD48-4D92-AD66-64210E516C64','2E58D4F1-2FF1-450E-8A00-1CE3BBCF8D4B','������ҵƱ',1,'LicenseType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('21F0402D-1A1E-4E03-915D-8914029BE957','DA1CAE8E-B5BF-4AC0-9996-AF6CAA412CA9','�ߴ���ҵƱ',2,'LicenseType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('C96C6527-6078-4E50-8B31-40D731DE8CCA','AEC9166D-1C91-45F0-8BFE-D3D0479A28C7','���޿ռ���ҵƱ',3,'LicenseType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('D5B893A3-9896-4246-959C-64AB8B168025','F72FF20B-D3EB-46A5-97F7-C99B2473A140','������ҵƱ',4,'LicenseType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('41F9D0A5-B3C7-4409-88E3-DA729D2AE1A8','4E607E83-41FC-4F49-B26F-A21CFE38328F','��·��ռ������ҵƱ',5,'LicenseType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('89BC9EA1-19E3-4DC4-84F7-4D87678B5794','755C6AC9-2E38-4D4F-AF33-33CB1744A907','������ҵƱ',6,'LicenseType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('AA5C7DDF-88F1-48EB-8C43-6E5903AA6A39','7BBAE649-7B00-4475-A911-BFE3A37AC55B','ҹ��ʩ����ҵƱ',7,'LicenseType')
INSERT INTO dbo.Sys_Const(ID, ConstValue, ConstText, SortIndex, GroupId)
VALUES('FA801286-038C-43DE-9AA8-7B300DA4FB94','A1BE3AB6-9D4A-41E7-8870-E73423165451','��װ��ҵƱ',8,'LicenseType')
GO
delete from Sys_Const where GroupId='LicenseType'