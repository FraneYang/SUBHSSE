--��������˵� MenuType=Menu_Server
--��Ŀ����
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('255E0F80-BF0B-4317-BB75-361FF7B343D9','��Ŀ����','','LorryGo',10,'0','Menu_Server',0,0)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('B830399C-CA36-4C23-A170-21E556D052DD','��Ŀ��Ϣ','ProjectData/ProjectSet.aspx','Page',10,'255E0F80-BF0B-4317-BB75-361FF7B343D9','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('5133D10A-D667-4FFC-B2D5-83200770F573','B830399C-CA36-4C23-A170-21E556D052DD','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('146A757C-94C1-4EB5-B46C-A59CB431578A','B830399C-CA36-4C23-A170-21E556D052DD','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('F0D8E2D1-0C53-4BDE-A6CB-29BD83B326F3','B830399C-CA36-4C23-A170-21E556D052DD','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('23BDF245-F51F-41DF-8E99-FD55971AD759','B830399C-CA36-4C23-A170-21E556D052DD','����',4)    
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('EB9C4E5E-15DB-426A-9800-6B03E64EC5DE','��Ŀ��λ','ProjectData/ProjectUnit.aspx','Page',20,'255E0F80-BF0B-4317-BB75-361FF7B343D9','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('22296C9B-4D01-488D-A745-B0EEC16A0AE6','EB9C4E5E-15DB-426A-9800-6B03E64EC5DE','ѡ��',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('5E4B837C-3A4B-407F-B913-855D5765E24A','EB9C4E5E-15DB-426A-9800-6B03E64EC5DE','ɾ��',2)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('0CF5F6A1-4AEB-4034-9C3B-591838E1290A','��Ŀ�û�','ProjectData/ProjectUser.aspx','Page',30,'255E0F80-BF0B-4317-BB75-361FF7B343D9','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('AB549AC0-C476-4345-AE78-D12A151B9C0C','0CF5F6A1-4AEB-4034-9C3B-591838E1290A','ѡ��',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('9F74198F-731F-4547-85A4-B206F28EE581','0CF5F6A1-4AEB-4034-9C3B-591838E1290A','ɾ��',2)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('C73EC3F3-6743-4A09-8433-E7DCC22E88C0','��Ŀ��ͼ','ProjectData/ProjectMap.aspx','Page',40,'255E0F80-BF0B-4317-BB75-361FF7B343D9','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('96B93562-0028-46E0-AEB1-F299F1D240CC','C73EC3F3-6743-4A09-8433-E7DCC22E88C0','����',4)
GO


INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('2572CDC8-BA26-4C74-B6F7-CB3D63E91E72','��ȫ��ϵ','','LayoutContent',15,'0','Menu_Server',0,0)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('8IDKGJE2-09B1-6UIO-3EFM-5TGED48F0001','��ȫ��֯��ϵ','HSSESystem/HSSEOrganize.aspx','Page',10,'2572CDC8-BA26-4C74-B6F7-CB3D63E91E72','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('F2A62F79-1DE3-45A1-968A-8F4E3A4B86F5','8IDKGJE2-09B1-6UIO-3EFM-5TGED48F0001','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('C94F1D8C-6136-4537-B292-D24B5576BE78','8IDKGJE2-09B1-6UIO-3EFM-5TGED48F0001','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('CAFE85FE-3E1C-4085-B712-3B5472C5AC1B','8IDKGJE2-09B1-6UIO-3EFM-5TGED48F0001','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('D8753465-5A46-43D0-9DB0-8EB3CF428160','8IDKGJE2-09B1-6UIO-3EFM-5TGED48F0001','����',4)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('32F5CC8C-E0F4-456C-AB88-77E36269FA50','��ȫ�������','HSSESystem/HSSEManage.aspx','Page',20,'2572CDC8-BA26-4C74-B6F7-CB3D63E91E72','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('80C2E451-230E-4745-9181-57110932CC5B','32F5CC8C-E0F4-456C-AB88-77E36269FA50','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('1EA5718F-1F20-450F-9DE4-CCE15FA6449D','32F5CC8C-E0F4-456C-AB88-77E36269FA50','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('8EF9CA97-59D8-45C9-8B80-DD18C12CD3C2','32F5CC8C-E0F4-456C-AB88-77E36269FA50','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('475C9311-B934-4FB7-9748-1689D46DDF01','32F5CC8C-E0F4-456C-AB88-77E36269FA50','����',4)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('499E23C1-057C-4B04-B92A-973B1DACD546','��ȫ�ƶ�','HSSESystem/SafetyInstitution.aspx','Page',30,'2572CDC8-BA26-4C74-B6F7-CB3D63E91E72','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('6FBBD758-50F5-4CE0-92C5-C257F9BAF6E9','499E23C1-057C-4B04-B92A-973B1DACD546','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('AE12A59C-9C6E-4567-B968-3D24126E28E0','499E23C1-057C-4B04-B92A-973B1DACD546','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B4FD39CE-F8ED-4FE7-A9B7-BCB0223ECE71','499E23C1-057C-4B04-B92A-973B1DACD546','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('EF6103C1-B51E-4DC3-8B80-2AF1F18D907B','499E23C1-057C-4B04-B92A-973B1DACD546','����',4)
GO

--��ȫ����(����)
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('4RGASWE2-09B1-4607-DCS2-WDFCVG693G6D','��ȫ����(����)','','ChartBar',20,'0','Menu_Server',0,0)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('ERDXV53M-09B1-6UIO-3EFM-5DVZDF329001','��ȫ��Ϣ�ϱ�','','Report',10,'4RGASWE2-09B1-4607-DCS2-WDFCVG693G6D','Menu_Server',0,0)
GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('3156A9F0-276D-4AD4-BF84-45CF6DFC215C','����ʱ��ȫͳ���±�','Information/MillionsMonthlyReport.aspx','Page',10,'ERDXV53M-09B1-6UIO-3EFM-5DVZDF329001','Menu_Server',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8C0E3DDA-8883-4A8E-B288-C009B807C39D','3156A9F0-276D-4AD4-BF84-45CF6DFC215C','����',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8C720351-FD57-4C2D-9FCB-C8BB7FE48E65','3156A9F0-276D-4AD4-BF84-45CF6DFC215C','�޸�',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('9084F09C-AA75-42B4-8357-6CDD0661CE8D','3156A9F0-276D-4AD4-BF84-45CF6DFC215C','ɾ��',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('00C79282-699E-4CCA-988E-1F36671C2F37','3156A9F0-276D-4AD4-BF84-45CF6DFC215C','����',4)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('1889FE33-E72D-4E70-B51D-2AE411E08693','3156A9F0-276D-4AD4-BF84-45CF6DFC215C','���沢�ϱ�',5)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('08C103D2-6DB3-435E-A3DC-0C1F99CC51FF','3156A9F0-276D-4AD4-BF84-45CF6DFC215C','�ύ',6)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('AE5A454F-578E-4C52-969B-20AB87006A73','3156A9F0-276D-4AD4-BF84-45CF6DFC215C','����',7)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('88D736EA-3ADC-4100-B17E-A1A1F16D9D2A','3156A9F0-276D-4AD4-BF84-45CF6DFC215C','��ӡ',8)
	GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('4BC71D2E-7D94-48C1-A61A-139637825AA5','ְ�������¹�ԭ�������','Information/AccidentCauseReport.aspx','Page',20,'ERDXV53M-09B1-6UIO-3EFM-5DVZDF329001','Menu_Server',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('9D7EDCF0-32CD-4BB6-AA0F-6914E2B0F2D1','4BC71D2E-7D94-48C1-A61A-139637825AA5','����',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('FB9C1CDD-3CB8-4AEC-B940-563B3BA59E17','4BC71D2E-7D94-48C1-A61A-139637825AA5','�޸�',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('FABAAF0B-C618-43B7-907A-217B6A1E5F6E','4BC71D2E-7D94-48C1-A61A-139637825AA5','ɾ��',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('385833BA-BD03-4DB2-9380-C76395368782','4BC71D2E-7D94-48C1-A61A-139637825AA5','����',4)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('34472641-62F3-4E40-BEB3-770C3D833D03','4BC71D2E-7D94-48C1-A61A-139637825AA5','���沢�ϱ�',5)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('1CBB8571-E8D1-4EE0-AB08-4C3305BE27C6','4BC71D2E-7D94-48C1-A61A-139637825AA5','�ύ',6)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A71F1236-204F-4B34-B887-19B31CE56F63','4BC71D2E-7D94-48C1-A61A-139637825AA5','����',7)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C90343CD-4DBE-4C3B-BEDD-888C9B514F8B','4BC71D2E-7D94-48C1-A61A-139637825AA5','��ӡ',8)
	GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('A3894BAD-3F4A-4BB4-98CF-A76C588AE53F','��ȫ�������ݼ���','Information/SafetyQuarterlyReport.aspx','Page',30,'ERDXV53M-09B1-6UIO-3EFM-5DVZDF329001','Menu_Server',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('AD2043D6-871F-47FE-B6CC-0CA5CD50C0BA','A3894BAD-3F4A-4BB4-98CF-A76C588AE53F','����',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('19657A9D-6AEB-47BA-BC3F-B916C68B515B','A3894BAD-3F4A-4BB4-98CF-A76C588AE53F','�޸�',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('07E601FD-AE73-4F2B-A9D2-613B34ED654A','A3894BAD-3F4A-4BB4-98CF-A76C588AE53F','ɾ��',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D3BBA6C4-4D71-4533-9A47-9459AA30C2D2','A3894BAD-3F4A-4BB4-98CF-A76C588AE53F','����',4)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('90ED2D85-1184-4E46-8832-8C1215B6C59D','A3894BAD-3F4A-4BB4-98CF-A76C588AE53F','���沢�ϱ�',5)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('BED22C29-BA30-4BD2-A244-8588F2A0635B','A3894BAD-3F4A-4BB4-98CF-A76C588AE53F','����',6)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C4922011-37CD-4B79-820A-D8CAAE39144D','A3894BAD-3F4A-4BB4-98CF-A76C588AE53F','��ӡ',7)
	GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('7985C759-8EB9-4B7D-AC65-00541280B46C','Ӧ��������չ�������','Information/DrillConductedQuarterlyReport.aspx','Page',40,'ERDXV53M-09B1-6UIO-3EFM-5DVZDF329001','Menu_Server',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3D866C54-0A39-4A56-B771-7F3C63CF6A32','7985C759-8EB9-4B7D-AC65-00541280B46C','����',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F65F199A-5D28-42D0-B08F-390376CAAC31','7985C759-8EB9-4B7D-AC65-00541280B46C','�޸�',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('7FA97C99-A026-4934-95AC-50FF173B889D','7985C759-8EB9-4B7D-AC65-00541280B46C','ɾ��',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('1689FECD-6F18-4B1E-8190-706F2124B4C6','7985C759-8EB9-4B7D-AC65-00541280B46C','����',4)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6358C4DD-5B0E-4DB5-8FD1-AED403EF1D43','7985C759-8EB9-4B7D-AC65-00541280B46C','���沢�ϱ�',5)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C1E0471F-568C-4B85-ADED-FCDD27F8C3DA','7985C759-8EB9-4B7D-AC65-00541280B46C','�ύ',6)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('5231B22C-BF0B-478B-92DD-1C1B30BC7270','7985C759-8EB9-4B7D-AC65-00541280B46C','����',7)	
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('25A11FB5-AB22-42CC-9E94-29FF9221B25B','7985C759-8EB9-4B7D-AC65-00541280B46C','��ӡ',8)	
	GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('70DEB27A-D6FF-4D57-879B-0270F2967FA0','Ӧ�����������ƻ����걨','Information/DrillPlanHalfYearReport.aspx','Page',50,'ERDXV53M-09B1-6UIO-3EFM-5DVZDF329001','Menu_Server',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A034BF05-9859-4920-97F0-20190D94E6F4','70DEB27A-D6FF-4D57-879B-0270F2967FA0','����',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A821D1EC-5E54-4386-80E8-D1718CF00E7D','70DEB27A-D6FF-4D57-879B-0270F2967FA0','�޸�',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('6345E13D-F311-4839-927E-ADEF36D7CB5E','70DEB27A-D6FF-4D57-879B-0270F2967FA0','ɾ��',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A4115079-DDEC-4B42-836D-4B79B999E011','70DEB27A-D6FF-4D57-879B-0270F2967FA0','����',4)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('DE6CADAC-6981-45F6-BF19-0BFC6F1F2AFE','70DEB27A-D6FF-4D57-879B-0270F2967FA0','���沢�ϱ�',5)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C495E44F-DF2C-4071-829C-8C06DA30F9FE','70DEB27A-D6FF-4D57-879B-0270F2967FA0','�ύ',6)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('F287B0ED-D725-4CD3-B422-5319112F452B','70DEB27A-D6FF-4D57-879B-0270F2967FA0','����',7)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('30F188D4-84D4-4D3C-8ECE-B499ACB1C3C8','70DEB27A-D6FF-4D57-879B-0270F2967FA0','��ӡ',8)
	GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('D17F199E-D6A6-4669-8D1D-7857DD8750CA','�ֹ�˾��ȫ��Ϣ','','Report',15,'4RGASWE2-09B1-4607-DCS2-WDFCVG693G6D','Menu_Server',0,0)
GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('73D51CC9-044A-4A1C-B9E6-648EDC393F4F','����ʱ��ȫͳ���±�','Information/SubMillionsMonthlyReport.aspx','Page',10,'D17F199E-D6A6-4669-8D1D-7857DD8750CA','Menu_Server',1,0)
	GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('85AE7EDB-ABAE-4BC4-A8FA-A9EB835A5304','ְ�������¹�ԭ�������','Information/SubAccidentCauseReport.aspx','Page',20,'D17F199E-D6A6-4669-8D1D-7857DD8750CA','Menu_Server',1,0)
	GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('DCF198C4-44B2-41CD-9436-8A8B4B733680','��ȫ�������ݼ���','Information/SubSafetyQuarterlyReport.aspx','Page',30,'D17F199E-D6A6-4669-8D1D-7857DD8750CA','Menu_Server',1,0)
	GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('F9B562A7-8EC1-4988-AEDB-781BDD228251','Ӧ��������չ�������','Information/SubDrillConductedQuarterlyReport.aspx','Page',40,'D17F199E-D6A6-4669-8D1D-7857DD8750CA','Menu_Server',1,0)
	GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('F4B84DC6-2284-45E4-9765-468A17132411','Ӧ�����������ƻ����걨','Information/SubDrillPlanHalfYearReport.aspx','Page',50,'D17F199E-D6A6-4669-8D1D-7857DD8750CA','Menu_Server',1,0)
	GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('C0F4A4A5-D5D3-4952-9A90-9B27F5FA9DFA','��ȫ��Ϣ����','','ChartBar',20,'4RGASWE2-09B1-4607-DCS2-WDFCVG693G6D','Menu_Server',0,0)
GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('598568A0-A338-499F-888C-1B73665837F9','�˹�ʱ���÷���','Information/AnalyseWorkTimeCost.aspx','Page',10,'C0F4A4A5-D5D3-4952-9A90-9B27F5FA9DFA','Menu_Server',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('8A76D0BB-417C-44C4-B042-5AA74E60738B','598568A0-A338-499F-888C-1B73665837F9','ͳ��',1)
	GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('8396C9E2-3376-4144-978A-CC6041EC6C6A','��ȫ�¹ʷ���','Information/AnalyseSafeAccident.aspx','Page',20,'C0F4A4A5-D5D3-4952-9A90-9B27F5FA9DFA','Menu_Server',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('CC64B935-25EB-41D0-9D8E-D6D97151D2C5','8396C9E2-3376-4144-978A-CC6041EC6C6A','ͳ��',1)
	GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('5B645281-A055-4AA1-9245-DACBD984C76F','��ȫ��������','Information/AnalyseHiddenDanger.aspx','Page',30,'C0F4A4A5-D5D3-4952-9A90-9B27F5FA9DFA','Menu_Server',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('ACF63F9B-692D-4610-A8F9-5FDBFEAA2551','5B645281-A055-4AA1-9245-DACBD984C76F','ͳ��',1)
	GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('195D508D-E929-4B91-891E-307DC4E4338F','��Դ��Դͳ��','Information/AnalyseResource.aspx','Page',40,'C0F4A4A5-D5D3-4952-9A90-9B27F5FA9DFA','Menu_Server',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('3B462DFF-C9BB-4646-92B0-7E8AB52FBC1E','195D508D-E929-4B91-891E-307DC4E4338F','ͳ��',1)
	GO

--HSSE����������  �����±������ܽ�
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('70E51ABF-81C8-49CB-89AC-CF0542A201D6','HSSE����������','','CalendarEdit',30,'0','Menu_Server',0,0)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('26CE4208-7DEE-46A2-A1D2-9C182D9C1DFC','�����±�','ManagementReport/MonthReport.aspx','BorderDraw',10,'70E51ABF-81C8-49CB-89AC-CF0542A201D6','Menu_Server',1,0)
GO

-- �ܲ������±�B
INSERT INTO Sys_MenuCommon (MenuId,MenuName,Url,Icon,SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)  
VALUES('B995396A-B01C-4F03-858A-FFDC853BA4B8','�����±�B','ManagementReport/MonthReportB.aspx','BorderDraw',15,'70E51ABF-81C8-49CB-89AC-CF0542A201D6','Menu_Server',1,0)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('02ECC264-707D-412D-B74A-E2C2F2704BFA','��ȫ���ݻ���','ManagementReport/ManagerStatistic.aspx','LayoutSidebar',16,'70E51ABF-81C8-49CB-89AC-CF0542A201D6','Menu_Server',1,0)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('0E7FB959-A955-4F89-BF9F-023BD3CCD3CF','�±��뼯�ű���У��','ManagementReport/ReportCheck.aspx','LayoutSidebar',17,'70E51ABF-81C8-49CB-89AC-CF0542A201D6','Menu_Server',1,0)
GO
	--�ܲ������±�B��ť
	INSERT INTO Sys_ButtonToMenu (ButtonToMenuId,MenuId,ButtonName,SortIndex)  
	VALUES('3CCFF0D8-AD10-467C-9C90-F2AD0853EBF1','B995396A-B01C-4F03-858A-FFDC853BA4B8','����',1)
	GO
	INSERT INTO Sys_ButtonToMenu (ButtonToMenuId,MenuId,ButtonName,SortIndex)  
	VALUES('49A82E21-9EF5-4346-9C12-8E6B668F1D28','B995396A-B01C-4F03-858A-FFDC853BA4B8','�޸�',2)
	GO
	INSERT INTO Sys_ButtonToMenu (ButtonToMenuId,MenuId,ButtonName,SortIndex)  
	VALUES('E2141097-2F61-4B3E-9BC5-968D824A53C9','B995396A-B01C-4F03-858A-FFDC853BA4B8','ɾ��',3)
	GO
	INSERT INTO Sys_ButtonToMenu (ButtonToMenuId,MenuId,ButtonName,SortIndex)  
	VALUES('832D9BEB-BDA9-4327-850D-8C0820D2F99F','B995396A-B01C-4F03-858A-FFDC853BA4B8','����',4)
	GO

INSERT INTO Sys_MenuCommon (MenuId,MenuName,Url,Icon,SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)  
VALUES('49CD6BDA-5C82-49D1-B1D1-3F2F4082C725','���⹤����Ŀ�¶�HSSEͳ�Ʊ�','ManagementReport/MonthReportE.aspx','BorderDraw',18,'70E51ABF-81C8-49CB-89AC-CF0542A201D6','Menu_Server',1,0)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('8051C9AA-801D-4001-9CB6-833CB407A169','HSSE���ܽ�','Manager/ManagerTotalMonthServer.aspx','LayoutSidebar',20,'70E51ABF-81C8-49CB-89AC-CF0542A201D6','Menu_Server',1,0)
GO

--����HSSE�������������Ӳ˵�
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('D67D1C85-3798-47A9-A0DB-B4DB47FF2E7D','�����ϱ����','ManagementReport/ReportRemind.aspx','LayoutSidebar',40,'70E51ABF-81C8-49CB-89AC-CF0542A201D6','Menu_Server',1,0)
GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('CD3F50A6-38ED-479C-B1F1-E6628C5A269C','D67D1C85-3798-47A9-A0DB-B4DB47FF2E7D','ɾ��',1)
	GO
	
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('7FCDEC52-9665-4F92-BCC1-E518924D6728','��ȫ�����±�','ManagementReport/MonthReportD.aspx','BorderDraw',60,'70E51ABF-81C8-49CB-89AC-CF0542A201D6','Menu_Server',1,0)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('306A1C97-B6B1-4AE4-AFC1-6933E821C129','��ȫ�ļ��ϱ�','ManagementReport/ServerSafeReport.aspx','LayoutContent',70,'70E51ABF-81C8-49CB-89AC-CF0542A201D6','Menu_Server',1,0)
GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D2962F87-E4A5-41B1-A611-46B1B52DBD7F','306A1C97-B6B1-4AE4-AFC1-6933E821C129','����',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C2513D2A-0F57-4EDF-9BBB-45DBD97EC155','306A1C97-B6B1-4AE4-AFC1-6933E821C129','�޸�',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('28028063-C78C-4263-AF0F-1FC3ABFB3E5D','306A1C97-B6B1-4AE4-AFC1-6933E821C129','ɾ��',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4066D25B-52C9-49DA-8F2F-93B613A2113E','306A1C97-B6B1-4AE4-AFC1-6933E821C129','����',4)
	GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('2C673125-AAA4-4F41-A827-0F04DFE55DED','�ֹ�˾��ȫ�ļ��ϱ�','ManagementReport/ServerSafeUnitReport.aspx','LayoutContent',80,'70E51ABF-81C8-49CB-89AC-CF0542A201D6','Menu_Server',1,0)
GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('C64B9541-DD9B-4513-9C0E-6B1CE12A8504','2C673125-AAA4-4F41-A827-0F04DFE55DED','����',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('02CA0F51-C700-4762-B1F4-78D56D04322B','2C673125-AAA4-4F41-A827-0F04DFE55DED','�޸�',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('D60B2120-C2EE-4422-B0AA-CF5B32E8027D','2C673125-AAA4-4F41-A827-0F04DFE55DED','ɾ��',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('62D89111-C266-44A0-8C77-85890DF2FFEA','2C673125-AAA4-4F41-A827-0F04DFE55DED','����',4)
	GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('CB9F7531-1CC6-475D-82D3-0EE8BB225C28','��ȫ���ù���','CostGoods/ServerHSSECostManage.aspx','BorderDraw',90,'70E51ABF-81C8-49CB-89AC-CF0542A201D6','Menu_Server',1,0)
GO

--��ҵ��ȫ����
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('CD9FC4C8-4B02-4619-8B02-50DA6AE6146E','��ҵ��ȫ����','','DateMagnify',40,'0','Menu_Server',0,0)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('1C6F9CA9-FDAC-4CE5-A19C-5536538851E1','��ȫ�ල��鱨��','Supervise/SuperviseCheckReport.aspx','BorderDraw',10,'CD9FC4C8-4B02-4619-8B02-50DA6AE6146E','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('BA4D569B-72C6-4CDF-804A-E4EC0876FBEA','1C6F9CA9-FDAC-4CE5-A19C-5536538851E1','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('9366B357-1653-4291-B633-7E17A0C94C8A','1C6F9CA9-FDAC-4CE5-A19C-5536538851E1','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('277FB77A-F77C-40E8-924E-C2EA5EF97472','1C6F9CA9-FDAC-4CE5-A19C-5536538851E1','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('EAC337F8-DEEC-42F0-8534-53B3E78A15AA','1C6F9CA9-FDAC-4CE5-A19C-5536538851E1','����',4)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('55976B16-2C33-406E-B514-2FE42D031071','��ȫ�ල�������','Supervise/SuperviseCheckRectify.aspx','LayoutSidebar',20,'CD9FC4C8-4B02-4619-8B02-50DA6AE6146E','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('6C1BE2E8-CD60-413F-94DD-A9FC69B2E21A','55976B16-2C33-406E-B514-2FE42D031071','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('D3855716-E792-4009-81C9-802BF8DA70EC','55976B16-2C33-406E-B514-2FE42D031071','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('789372B4-0590-499A-9E1D-368348AB6EBB','55976B16-2C33-406E-B514-2FE42D031071','����',4)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('A8C027B4-B0E8-4D97-A8CD-584987224D06','55976B16-2C33-406E-B514-2FE42D031071','���沢�ϱ�',5)
GO

--���Ű�ȫ�ල
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('A24B7926-EF69-456E-8A24-936D30384680','���Ű�ȫ�ල','','PageFind',50,'0','Menu_Server',0,0)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('1969C3C3-9257-49CD-977D-546CA18DC91C','��ȫ�ල���֪ͨ��','ServerCheck/CheckNotice.aspx','Page',5,'A24B7926-EF69-456E-8A24-936D30384680','Menu_Server',1,0)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('B9950CB5-C47A-4C0A-A6CC-C7DDBBDE7D1E','��ҵ�ϱ��ල��鱨��','ServerCheck/UpCheckReport.aspx','Page',10,'A24B7926-EF69-456E-8A24-936D30384680','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('CF8120E3-17CD-4237-AEC6-5FB824CE6960','B9950CB5-C47A-4C0A-A6CC-C7DDBBDE7D1E','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('B0D365B4-8A99-4D9B-8F72-535937457E83','B9950CB5-C47A-4C0A-A6CC-C7DDBBDE7D1E','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('BBFF157D-AB21-4CCD-B1DC-32395E3645BE','B9950CB5-C47A-4C0A-A6CC-C7DDBBDE7D1E','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4590DDA7-5F0B-4327-B6A8-A44B328176F4','B9950CB5-C47A-4C0A-A6CC-C7DDBBDE7D1E','����',4)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('CD2FB445-1C0B-4F13-85EE-36F26F4A6180','B9950CB5-C47A-4C0A-A6CC-C7DDBBDE7D1E','���沢�ϱ�',5)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('3D1CFA31-96A9-496E-9A94-318670C9D658','��ҵ��ȫ�ļ��ϱ�','ServerCheck/SubUnitReport.aspx','Page',20,'A24B7926-EF69-456E-8A24-936D30384680','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('7075349F-B55F-457E-8EA3-0CBAD0863DB0','3D1CFA31-96A9-496E-9A94-318670C9D658','����',1)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('12C61C54-D3B3-4B07-AAA9-8B9FAA176E75','3D1CFA31-96A9-496E-9A94-318670C9D658','�޸�',2)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('CD5B2ADD-36C0-43AC-AB31-4BE79EC4E957','3D1CFA31-96A9-496E-9A94-318670C9D658','ɾ��',3)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('457BE203-8D81-4421-BDFE-75CE47E4DF67','3D1CFA31-96A9-496E-9A94-318670C9D658','����',4)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('4A87774E-FEA5-479A-97A3-9BBA09E4862E','�����·��ල�������','ServerCheck/CheckRectify.aspx','Page',30,'A24B7926-EF69-456E-8A24-936D30384680','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('9F683E31-9E50-49AE-9782-EBD0CB82DDD8','4A87774E-FEA5-479A-97A3-9BBA09E4862E','�޸�',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('A0FACD5D-87F5-4D52-83D4-3B641D5E58E9','4A87774E-FEA5-479A-97A3-9BBA09E4862E','����',2)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('091D7D24-E706-465A-95FD-8EF359CB8667','�����·��ල��鱨��','ServerCheck/CheckInfoReport.aspx','Page',40,'A24B7926-EF69-456E-8A24-936D30384680','Menu_Server',1,0)
GO

--��Ч����
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('ACF13D4F-53CC-4F3A-A76D-0B7FB97554A9','��Ч����','','BuildingEdit',60,'0','Menu_Server',0,0)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('DEE90726-E00D-462B-A4BF-7E36180DD5B8','��Ч����','ProjectEvaluation/ProjectEvaluation.aspx','Page',10,'ACF13D4F-53CC-4F3A-A76D-0B7FB97554A9','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('BD80E37E-C93B-4237-A5C8-01856625638F','DEE90726-E00D-462B-A4BF-7E36180DD5B8','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('FDC3F84E-AA3D-47BD-97FE-6A6D1EE9EBFA','DEE90726-E00D-462B-A4BF-7E36180DD5B8','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('6E1FC020-19F5-461F-B12F-72057671273C','DEE90726-E00D-462B-A4BF-7E36180DD5B8','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('04AB7BF7-C527-45D4-B98D-082F10D25CA0','DEE90726-E00D-462B-A4BF-7E36180DD5B8','����',4)
GO	

--ְҵ����
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('E0A00DAC-2276-4AC5-B67B-60887C91DD62','ְҵ����','','FolderHeart',70,'0','Menu_Server',0,0)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('D4802FF6-0AE0-4F9B-9D69-FD895CF9F5C0','Σ�����','OccupationHealth/HazardDetection.aspx','Page',10,'E0A00DAC-2276-4AC5-B67B-60887C91DD62','Menu_Server',1,0)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('DB06084F-742F-49F1-A9B9-1100919E49DB','������','OccupationHealth/PhysicalExamination.aspx','Page',20,'E0A00DAC-2276-4AC5-B67B-60887C91DD62','Menu_Server',1,0)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('52DA3277-DCC1-4612-8083-A576BF85953A','ְҵ���¹�','OccupationHealth/OccupationalDiseaseAccident.aspx','Page',30,'E0A00DAC-2276-4AC5-B67B-60887C91DD62','Menu_Server',1,0)
GO


--��������
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('B441D5ED-DA97-4E2B-98C1-6E8E5D08EF7B','��������','','BoxWorld',80,'0','Menu_Server',0,0)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('FD4E234C-265F-4B45-A35A-C9659AF9C173','�����������','Environmental/EnvironmentalMonitoring.aspx','Page',10,'B441D5ED-DA97-4E2B-98C1-6E8E5D08EF7B','Menu_Server',1,0)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('6C36DBFF-E765-4FC9-B978-51ADBE696C10','ͻ�������¼�','Environmental/UnexpectedEnvironmental.aspx','Page',20,'B441D5ED-DA97-4E2B-98C1-6E8E5D08EF7B','Menu_Server',1,0)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('6A8EAA9C-08E9-4F1F-B824-67B60D49258A','�����¼�Ӧ��Ԥ��','Environmental/EnvironmentalEmergencyPlan.aspx','Page',30,'B441D5ED-DA97-4E2B-98C1-6E8E5D08EF7B','Menu_Server',1,0)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('FB943BD9-33A5-4680-82C1-29A4741D8636','��������','Environmental/EIAReport.aspx','Page',40,'B441D5ED-DA97-4E2B-98C1-6E8E5D08EF7B','Menu_Server',1,0)
GO

--��ȫ�¹�
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('192147D8-FFD1-44BD-8BC4-9DCA3E73D708','��ȫ�¹�','','BookError',90,'0','Menu_Server',0,0)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('DC871FCA-FBA8-4533-B5D6-DF64BCE40287','�¹ʿ챨','ProjectAccident/AccidentReport.aspx','Page',10,'192147D8-FFD1-44BD-8BC4-9DCA3E73D708','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('909965F2-74EB-459C-9CED-048B1E7209E2','DC871FCA-FBA8-4533-B5D6-DF64BCE40287','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('7F2A59B1-D432-4020-93B3-4A2DCB14AB94','DC871FCA-FBA8-4533-B5D6-DF64BCE40287','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('CD262F07-6DE4-4483-BC18-35AE4E510EC6','DC871FCA-FBA8-4533-B5D6-DF64BCE40287','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('E408C483-28D2-4C28-90B5-ACC5714BEE12','DC871FCA-FBA8-4533-B5D6-DF64BCE40287','����',4)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('BE2F6161-7C17-41FF-A314-8C0AE323D5A4','�¹ʴ���','ProjectAccident/AccidentStatistics.aspx','Page',20,'192147D8-FFD1-44BD-8BC4-9DCA3E73D708','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('35BE5ECC-1C60-443A-A4CF-D50DE1AEF6A9','BE2F6161-7C17-41FF-A314-8C0AE323D5A4','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('79EF2D71-10C5-431D-B32C-E2B763499DE2','BE2F6161-7C17-41FF-A314-8C0AE323D5A4','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('8546C60C-7F22-444D-9E7E-6B43041A7506','BE2F6161-7C17-41FF-A314-8C0AE323D5A4','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('F6A09314-E743-4BE2-9AF7-D392F453D32D','BE2F6161-7C17-41FF-A314-8C0AE323D5A4','����',4)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('71A5556F-1590-4D4C-9A31-703DCD5C2910','�¹�ͳ��','ProjectAccident/AccidentAnalysis.aspx','Page',30,'192147D8-FFD1-44BD-8BC4-9DCA3E73D708','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('F8C602CA-9C88-454C-9911-9EABCD07263E','71A5556F-1590-4D4C-9A31-703DCD5C2910','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('876AC7CB-B33C-4E2F-A1D0-24056FAA0CC6','71A5556F-1590-4D4C-9A31-703DCD5C2910','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('A7E8F8B4-501F-4567-B52D-E8A98B7202C6','71A5556F-1590-4D4C-9A31-703DCD5C2910','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('AFCAAAF4-60F8-4E27-AFAC-D41D7B9A714D','71A5556F-1590-4D4C-9A31-703DCD5C2910','����',4)
GO

--������ȫ�¹��Ӳ˵�
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('6F2C0F0A-3CF6-4B28-AFE2-FB7415ECDB91','�¹�̨��','ProjectAccident/AccidentData.aspx','Page',40,'192147D8-FFD1-44BD-8BC4-9DCA3E73D708','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('DFBD3C31-5742-402E-8FE8-07DF2B6AFB63','6F2C0F0A-3CF6-4B28-AFE2-FB7415ECDB91','ɾ��',1)
GO

--��Ϣ���� ��֪ͨ����ĿͼƬ
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('3CF6CF02-6994-4D90-9061-E4D837AA5FDA','��Ϣ����','','ComputerMagnify',100,'0','Menu_Server',0,0)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('E2F56879-5337-4BEF-8113-62845DF616EF','����֪ͨ','InformationProject/Notice.aspx','Page',10,'3CF6CF02-6994-4D90-9061-E4D837AA5FDA','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('98CC881C-14DF-49B5-9526-FD8A7DB34CDC','E2F56879-5337-4BEF-8113-62845DF616EF','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('CF8E97B8-8D0B-4C7F-9023-9055A83B39F9','E2F56879-5337-4BEF-8113-62845DF616EF','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('540793D4-2052-44CA-8ED3-2A62A41F920D','E2F56879-5337-4BEF-8113-62845DF616EF','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('45E78659-62A0-4246-A401-D1F546800D96','E2F56879-5337-4BEF-8113-62845DF616EF','����',4)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('65584C4E-B020-443C-8964-27B148F4874A','E2F56879-5337-4BEF-8113-62845DF616EF','�ύ',5)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('83DB2477-91EF-4A98-9AEA-0CA9D063E70C','E2F56879-5337-4BEF-8113-62845DF616EF','����',6)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('278DF0FE-35E2-470F-9AE4-23C57EDF797F','��ĿͼƬ','InformationProject/Picture.aspx','Page',20,'3CF6CF02-6994-4D90-9061-E4D837AA5FDA','Menu_Server',1,0)
GO

----��Ϣͳ��
--INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
--VALUES('6D49438F-E055-45EE-9917-73C96652B992','��Ϣͳ��','InformationProject/InfoStatistic.aspx','Page',30,'3CF6CF02-6994-4D90-9061-E4D837AA5FDA','Menu_Server',1,0)
--GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('0987D15D-3A2B-4B59-953A-A30B661E225A','��Ŀ��ȫ��������','','ApplicationForm',105,'0','Menu_Server',0,0)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
VALUES('60E00925-3357-441E-BD2F-2DF8C91BDDE6','����Ŀ¼����','SafetyData/SafetyData.aspx','ApplicationForm',10,'0987D15D-3A2B-4B59-953A-A30B661E225A','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('35B96704-27A3-4D0F-B901-6A3BFF3B30C6','60E00925-3357-441E-BD2F-2DF8C91BDDE6','����',1)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('462AC76D-0A1E-4C72-91B1-4D54D889D574','60E00925-3357-441E-BD2F-2DF8C91BDDE6','�޸�',2)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('2218FED0-A83E-472D-B522-05184F4F6AB4','60E00925-3357-441E-BD2F-2DF8C91BDDE6','ɾ��',3)
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('F21DA753-FBD4-4340-9B1C-A0CD9991933A','60E00925-3357-441E-BD2F-2DF8C91BDDE6','����',4)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
VALUES('039BD08A-9C38-4C28-81EE-A6CA86F580B2','���˼ƻ��ܱ�','SafetyData/SafetyDataPlan.aspx','ApplicationFormMagnify',20,'0987D15D-3A2B-4B59-953A-A30B661E225A','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('54260F45-3072-40DA-AE94-CCA60690FB9A','039BD08A-9C38-4C28-81EE-A6CA86F580B2','ɾ��',1)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('6476423F-C459-47FB-952F-38894DC28308','039BD08A-9C38-4C28-81EE-A6CA86F580B2','�޸�',2)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('1EBA5027-3873-4861-ACB4-DA1B4A0236EF','039BD08A-9C38-4C28-81EE-A6CA86F580B2','����',4)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('90993D28-2530-4DB9-8C0A-56EF92356796','039BD08A-9C38-4C28-81EE-A6CA86F580B2','����',1)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
VALUES('74A51BC9-EE10-4534-A4A7-37889B07753C','��Ŀ�ϱ�����','SafetyData/ProjectSafetyData.aspx','ApplicationFormMagnify',30,'0987D15D-3A2B-4B59-953A-A30B661E225A','Menu_Server',1,0)
GO

--INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
--VALUES('2A405839-FD14-4398-8AEE-48B44BFDA1F6','��ȫ�������Ͽ���','SafetyData/SafetyDataCheck.aspx','ApplicationFormEdit',40,'0987D15D-3A2B-4B59-953A-A30B661E225A','Menu_Server',1,0)
--GO
--INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
--VALUES('B0AB1506-96FD-4AB3-96C7-BD4E1673C47B','2A405839-FD14-4398-8AEE-48B44BFDA1F6','����',1)
--INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
--VALUES('9378264A-F377-46EA-8457-34EFE3336F00','2A405839-FD14-4398-8AEE-48B44BFDA1F6','�޸�',2)
--INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
--VALUES('6BD90B0F-4EAF-4141-9381-38120EB00664','2A405839-FD14-4398-8AEE-48B44BFDA1F6','ɾ��',3)
--INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
--VALUES('08A89FC7-5774-4150-9224-FF19A08046F2','2A405839-FD14-4398-8AEE-48B44BFDA1F6','����',4)
--GO

--������Ŀ��ȫ���������Ӳ˵�
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
VALUES('A139FF69-8B74-489B-AB5F-526B2207DD89','��˾��ȫ�˹�ʱ����','SafetyData/AccidentData.aspx','ApplicationFormMagnify',50,'0987D15D-3A2B-4B59-953A-A30B661E225A','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
VALUES('4C8EBAE4-9C31-4EE5-BCD1-2D0C1F0E28C3','A139FF69-8B74-489B-AB5F-526B2207DD89','ɾ��',1)
GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit) 
VALUES('1364D490-6614-4E0D-8BF8-EEFAE2B26AE7','����̨��','SafetyData/AccidentStatisc.aspx','ApplicationFormMagnify',60,'0987D15D-3A2B-4B59-953A-A30B661E225A','Menu_Server',1,0)
GO
--�ļ��� ����Ŀ���ϡ����ż������
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('C4BD5635-39BC-4DE8-85CF-652B2C33CBB4','�ļ���','','LaptopMagnify',110,'0','Menu_Server',0,0)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('6621CF4A-EAD4-40AF-9FFE-51DA4348C10C','�ļ���A(�����)','InformationProject/FileCabinetA.aspx','Page',10,'C4BD5635-39BC-4DE8-85CF-652B2C33CBB4','Menu_Server',1,0)
GO
INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('DDD1CE30-F8B9-4011-A20F-7AC60B34788C','�ļ���B(��ҵ)','InformationProject/FileCabinetB.aspx','Page',20,'C4BD5635-39BC-4DE8-85CF-652B2C33CBB4','Menu_Server',1,0)
GO

--INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
--VALUES('397E64C8-B092-4A6A-B4D6-6B9A525448BD','��Ŀ����','','ApplicationForm',120,'0','Menu_Server',0,0)
--GO
--INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
--VALUES('D0E2C9C6-58FA-4316-B634-65267C709F5E','�ֳ����ڼ�¼','Door/InOutRecord.aspx','Page',10,'397E64C8-B092-4A6A-B4D6-6B9A525448BD','Menu_Server',1,0)
--GO
--INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
--VALUES('6D0CCC58-2152-4D56-A95A-47F19D962E8C','��Ŀ�˹�ʱ','Door/InOutManHours.aspx','Page',20,'397E64C8-B092-4A6A-B4D6-6B9A525448BD','Menu_Server',1,0)
--GO
--INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
--VALUES('C1562943-6B79-438E-B0D7-95CD159360CA','��Ƶ���','Door/VideoMonitor.aspx','Page',30,'397E64C8-B092-4A6A-B4D6-6B9A525448BD','Menu_Server',1,0)
--GO


INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('6E3101D6-7A1C-4047-B372-1758E884372E','��Ա��ѵ�뿼��','','TableEdit',130,'0','Menu_Server',0,0)
GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('939B6481-75E3-4CEA-B248-5FB069797094','��Ա��Ϣ','ServerTest/PersonInfo.aspx','PageHeaderFooter',10,'6E3101D6-7A1C-4047-B372-1758E884372E','Menu_Server',1,0)
	GO
	--��Ա��Ϣ��ť
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('DE547890-0A95-44B7-A70F-D99A84C988A8','939B6481-75E3-4CEA-B248-5FB069797094','����',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4DBC00D8-C877-4083-8E2D-2920355E180D','939B6481-75E3-4CEA-B248-5FB069797094','�޸�',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('AD6B0547-FDED-44D8-AAEB-A459669AA9D3','939B6481-75E3-4CEA-B248-5FB069797094','ɾ��',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('2CD73EDA-E699-4688-B497-892C3B3D6482','939B6481-75E3-4CEA-B248-5FB069797094','����',4)  
	GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('335D6EA7-B6A1-4065-A9C8-6DB5C2E3FE08','��ѵ�ƻ�','EduTrain/Plan.aspx','PageHeaderFooter',20,'6E3101D6-7A1C-4047-B372-1758E884372E','Menu_Server',1,0)
	GO
		--��ѵ�ƻ���ť
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('4951679A-1AA6-4864-AD7F-6D872BA90625','335D6EA7-B6A1-4065-A9C8-6DB5C2E3FE08','����',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('12DA20C9-3780-49E5-A489-4A42EF81B0A0','335D6EA7-B6A1-4065-A9C8-6DB5C2E3FE08','�޸�',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('51DEC512-8772-4699-BDBF-BD3C1D282552','335D6EA7-B6A1-4065-A9C8-6DB5C2E3FE08','ɾ��',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('170A8A51-B7CB-4B5E-BD3D-292708F74E18','335D6EA7-B6A1-4065-A9C8-6DB5C2E3FE08','����',4)  
	GO

	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('CB91E53D-CDA2-48EE-AF13-102A6D355391','��ѵ��¼','ServerTest/TrainRecord.aspx','PageHeaderFooter',25,'6E3101D6-7A1C-4047-B372-1758E884372E','Menu_Server',1,0)
	GO
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('03D7B380-CC0F-41A9-A60D-64456FECBF49','CB91E53D-CDA2-48EE-AF13-102A6D355391','ɾ��',3)
	GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('0DE63603-F9D3-40DB-89DE-2621E794482B','���Լƻ�','EduTrain/TestPlan.aspx','PageHeaderFooter',30,'6E3101D6-7A1C-4047-B372-1758E884372E','Menu_Server',1,0)
	GO    
	--���Լƻ���ť
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('85EC3EF9-414F-418A-A2E2-609FAB7908C0','0DE63603-F9D3-40DB-89DE-2621E794482B','����',1)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('72DB701F-BBE5-4485-A7DF-7454C19D4810','0DE63603-F9D3-40DB-89DE-2621E794482B','�޸�',2)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('9C8EF57C-C679-44B9-B110-F856BF3CB154','0DE63603-F9D3-40DB-89DE-2621E794482B','ɾ��',3)
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('A9036715-6B42-455D-86B6-416D0E92BFAE','0DE63603-F9D3-40DB-89DE-2621E794482B','����',4)  
	GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('67408019-C050-462A-9BAB-E594DC1A99DE','���Լ�¼','EduTrain/TestRecord.aspx','PageHeaderFooter',40,'6E3101D6-7A1C-4047-B372-1758E884372E','Menu_Server',1,0)
	GO	
	INSERT INTO dbo.Sys_ButtonToMenu(ButtonToMenuId,MenuId,ButtonName,SortIndex)
	VALUES('0B9778F0-1E98-4172-AE1F-CE4E16DBEDB9','67408019-C050-462A-9BAB-E594DC1A99DE','����',4) 
	--INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	--VALUES('CB37413A-2937-49B2-8A1B-2882EA392C66','����ͳ��','EduTrain/TestStatistics.aspx','PageHeaderFooter',50,'6E3101D6-7A1C-4047-B372-1758E884372E','Menu_Server',1,0)
	--GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('3C98D6FF-3566-4376-BC76-2287B68F6FFD','ģ�⿼��','EduTrain/ModelTestRecord.aspx','PageHeaderFooter',50,'6E3101D6-7A1C-4047-B372-1758E884372E','Menu_Server',1,0)
	GO

INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
VALUES('7A510CD1-3112-495E-964E-0D786D94EDAC','����ͳ��','','ShapeAlignLeft',140,'0','Menu_Server',0,0)
GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('657F95F5-D6E5-4195-8722-E22F7EA52447','��ѵͳ��','DataStatistics/TrainingTaskStatistics.aspx','PageHeaderFooter',5,'7A510CD1-3112-495E-964E-0D786D94EDAC','Menu_Server',1,0)
	GO	
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('DEA788B4-F2F8-4671-B363-63E428649C3B','����ͳ��','DataStatistics/TestStatistics.aspx','PageHeaderFooter',10,'7A510CD1-3112-495E-964E-0D786D94EDAC','Menu_Server',1,0)
	GO	
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('FBB09DE4-B94C-4850-8597-63B27E19916A','��ѵ����ͳ��','DataStatistics/TrainingTestStatistics.aspx','PageHeaderFooter',15,'7A510CD1-3112-495E-964E-0D786D94EDAC','Menu_Server',1,0)
	GO	
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('ABE9C6E1-83FB-42BE-B1EC-ECF6DD8B9847','��ȫ���ͳ��','DataStatistics/CheckStatistics.aspx','PageHeaderFooter',20,'7A510CD1-3112-495E-964E-0D786D94EDAC','Menu_Server',1,0)
	GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('9F6964CB-994E-424E-9D39-F59B1A2F1CCF','��������ͳ��','DataStatistics/RectifyNoticesStatistics.aspx','PageHeaderFooter',30,'7A510CD1-3112-495E-964E-0D786D94EDAC','Menu_Server',1,0)
	GO
	INSERT INTO dbo.Sys_MenuCommon(MenuId,MenuName,Url,Icon, SortIndex,SuperMenu,MenuType,IsEnd,IsUnit)
	VALUES('F07B8A6C-D9E0-41E8-9BCB-F965B5C2DFD6','��ȫ����ͳ��','DataStatistics/MeetStatistics.aspx','PageHeaderFooter',40,'7A510CD1-3112-495E-964E-0D786D94EDAC','Menu_Server',1,0)
	GO

	select NEWID()