---����ʱ������λ����ʵ�ʼ�������Ҫִ�д˽ű�
---�쳽��ִ�д˽ű�
---�˼������������ȫ�����Ƴ�ʼ�ű�
DELETE FROM Check_ProjectCheckItemDetail
GO
DELETE FROM Check_ProjectCheckItemSet
GO
DELETE FROM Technique_CheckItemDetail
GO
DELETE FROM Technique_CheckItemSet
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','��ҵ���֤���','0','1','false',10,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','������Ϊ���','0','2','false',20,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('72B74888-8190-40B4-8C5D-9344F44C9683','�ֳ���ҵ���̼��','0','3','false',30,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('448B443C-B477-4C67-AAFA-DB03A0C5D17F','������ҵ���֤','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1A','true',40,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','������ҵ���֤','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1B','true',50,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('29828709-D103-413D-902F-1CDB90E2CFC1','��ʱ�õ���ҵ���֤','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1C','true',60,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('48F06310-5C74-4696-8249-3F5E1863D90C','���ּ�ʹ�����֤','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1D','true',70,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('366AC069-60BB-4D0A-A049-63CCCAEFC48C','���ص�װ��ҵ���֤','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1E','true',80,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','������ҵ���֤','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1F','true',90,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','���޿ռ���ҵ���֤','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1G','true',100,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('2C0660F9-D093-46E8-93E9-1D01D05EF718','�¿���Ŀ��ȫ���֤','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1H','true',110,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('A321A0E8-C438-4AAD-BDA1-460083ECDBF7','�ߴ���ҵ���֤','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1I','true',120,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','�ٱ�(���ڡ��ʵǡ�����)��ҵ���֤','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1J','true',130,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('79211283-4A46-4321-BF6E-0C349F24C16D','Σ�ջ�ѧ��Ʒʹ�����֤','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1K','true',140,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','HSE��֯������������ϵ����','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2A','true',150,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','�ֳ���ȫ����/��ʩ����涨','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2B','true',160,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('B8F280FA-3CAC-43FD-98AE-B759FCD8287D','���˷�����Ʒʹ��','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2C','true',170,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('DE7930B3-94A0-44AE-8479-39592EC9BAAB','HSE�����뾯ʾ����','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2D','true',180,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','HSE��ѵ����֤�ϸ�','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2E','true',190,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('5AEB3327-BA14-4405-A687-B30AAA81D5A8','��ʱ�ÿ�HSE����','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2F','true',200,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','�ֳ�������������','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2G','true',210,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('A44B1736-4563-4773-8C2D-140C6A76F103','HSE������������������','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2H','true',220,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','�ֳ�HSEӦ������','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2I','true',230,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('1AFA2D62-681A-4D58-86FA-E40C8B13DD88','HSE��Ϣ����涨','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2J','true',240,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','ʩ���ӡ����鰲ȫ�����','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2K','true',250,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','����ʩ�������鰲ȫ�����','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2L','true',260,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','ְҵ��������','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2M','true',270,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�õ����','72B74888-8190-40B4-8C5D-9344F44C9683','3A','true',280,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','������ҵ��ȫ����','72B74888-8190-40B4-8C5D-9344F44C9683','3B','true',290,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('0CD8C338-07B9-4AE3-A2A6-04485098FE91','�������','72B74888-8190-40B4-8C5D-9344F44C9683','3C','true',300,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('FD18318D-CF10-47A9-86C5-CC066B5119B3','���ּܹ���','72B74888-8190-40B4-8C5D-9344F44C9683','3D','true',310,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('EC986070-16BF-4343-8850-252D9A747358','�ߴ���ҵ����','72B74888-8190-40B4-8C5D-9344F44C9683','3E','true',320,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('82884781-F5B6-4623-A0BC-112DCA6665D9','������ҵ����','72B74888-8190-40B4-8C5D-9344F44C9683','3F','true',330,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('99431E70-833A-464D-8066-E41E230646DA','������ҵ��ȫ����','72B74888-8190-40B4-8C5D-9344F44C9683','3G','true',340,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('77205883-AE5F-4047-8241-6922A2CCE6C4','���޿ռ���ҵ��ȫ����','72B74888-8190-40B4-8C5D-9344F44C9683','3H','true',350,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('8DC2F97B-CB4F-4848-B528-6A8155C26771','��ƿ��ȫ����','72B74888-8190-40B4-8C5D-9344F44C9683','3I','true',360,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('C9288081-8BD3-4949-A9C6-6320F827D35B','Σ����Ʒ����','72B74888-8190-40B4-8C5D-9344F44C9683','3J','true',370,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('10A8AF77-8103-422D-AE72-FAEB058C4770','�����豸����','72B74888-8190-40B4-8C5D-9344F44C9683','3K','true',380,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('B8940917-27F4-438A-BA8E-744B54691F09','��������','72B74888-8190-40B4-8C5D-9344F44C9683','3L','true',390,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('E6635238-4A3D-4101-B8E2-8356CBF046C2','������������','72B74888-8190-40B4-8C5D-9344F44C9683','3M','true',400,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','������ȫ����','72B74888-8190-40B4-8C5D-9344F44C9683','3N','true',410,2,NULL)
GO

--����������
INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('20900CE0-1993-4800-8775-52F4FDDD0143','448B443C-B477-4C67-AAFA-DB03A0C5D17F','��������ҵ�ļ�������/��ʩ�������������λ',10)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('192906F1-2155-4AD5-9D47-E166D0A786E8','448B443C-B477-4C67-AAFA-DB03A0C5D17F','������ҵǰ������������ʵ��˵�λ������й�HSE��ʩ������������ҵ��Ա����HSE������HSE�������׺󷽿�ʩ��',20)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('103953E3-85B9-4063-BDA0-538E074B6DD9','448B443C-B477-4C67-AAFA-DB03A0C5D17F','��ȷʩ��������ʡ�ˮ�ġ����¹���ˮ����',30)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('FD94D84B-A417-4054-8F00-DFA05B10E835','448B443C-B477-4C67-AAFA-DB03A0C5D17F','��ȷ��عܵ������¡�������ʩ',40)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('F1E5D1AF-AC3E-403E-9077-E9B694E7F12A','448B443C-B477-4C67-AAFA-DB03A0C5D17F','��ȷ�����õ������Ա�־�����ʺ͵��������õĳ��ڹ۲��',50)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('1D5E572E-1F38-466E-93D8-E80F7465C26B','448B443C-B477-4C67-AAFA-DB03A0C5D17F','��ȷ���²����ɰ������',60)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('5986D8D5-8ECA-4C80-BC2C-2495C520D1D2','448B443C-B477-4C67-AAFA-DB03A0C5D17F','������ҵƱҪ������͵������ι�����������ֳ���ʶ����ȷ������ҵ�ķ�Χ��ʩ������',70)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('F12B2ADF-3C34-49EE-AEE5-1F9181E4A5FF','448B443C-B477-4C67-AAFA-DB03A0C5D17F','������װ�á�������ʩ����Ӧ��ר�˸���໤',80)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('BB15FD0C-1110-4018-9EE6-0655FDE2525B','448B443C-B477-4C67-AAFA-DB03A0C5D17F','������ҵ��Ա�Ƿ�������������֮һҪ��ʱ���棬��ͬ����ܼ�����ҵ��a)��Ҫռ�ù滮��׼��Χ����ĳ��أ�b)�����𻵵�·�����ߡ��������ʵ�ͨѶ�ȹ�����ʩ�ģ�c)��Ҫ��ʱͣˮ��ͣ�硢�жϵ�·��ͨ�ģ�d)��Ҫ���б��Ƶġ�',90)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('63F5F0B6-E1AE-45E0-9817-398CF0103617','448B443C-B477-4C67-AAFA-DB03A0C5D17F','�ڵ�·��(����������)���ɲ�װ�á�������ʩ��ʱ��Ӧ���ֳ���Χ���������ƣ�ҹ��Ӧ�辯ʾ��',100)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('ACB485AE-0649-436F-929B-85E4888F8635','448B443C-B477-4C67-AAFA-DB03A0C5D17F','���ڵع����ӡ���ʱ�����ݿ�����Ȱ��涨��ȡ���»�ӹ̵�ר�Ŵ�ʩ����ֹ̮�����ˣ���Ӧ������Χ����Χ���;����־��ҹ�����ƾ�ʾ��',110)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('827B6FF5-4FC1-44DA-BA14-B10C2A45848B','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','�ж�����ҵ�ļ�������/��ʩ�������������λ',120)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('AF93F228-1D59-4B17-84B5-B7AF2877F0F8','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','������ҵ��Ա�ϸ�ǰ�����밴�涨�����ϸ�ǰ�Ķ���ȫ���������ն�����ҵ�İ�ȫ����֪ʶ������ʹ����������',130)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('2711B5D3-CF0D-47DD-BE70-379A5B96B4C9','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','������ҵ��Ա�Ƿ���Ϥ��Χ�����ͳ���·��',140)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('7BCDFB08-00C7-4193-BBEB-FD16B3F97BED','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','������ҵ��ʩ���ֳ������밴�涨�����������ģ�������������·��ͨ',150)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('7E1C5703-386F-4B3B-9E05-E81A2CEBE93C','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','������ҵ��λ�����Ƿ��п�ȼ����ȼ���ױ���Ʒ���Ƿ���������ȡ����Ч�İ�ȫ������ʩ',160)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('47842163-042E-4A5B-AD48-9D49D0A0E923','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','���ⲿ�����Ĺܵ����豸���Ƿ������������',170)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('88E8255A-D474-47A4-86FE-7FB05BDE137D','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','�����Ƿ�����������ҵ��ִ��Ĺ�������ҵ',180)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('2DFA56AB-801B-4F5F-879A-304717F395CA','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','���п�ȼ���ױ������������б��ƺʹ�����ҵʱ���Ƿ��Ѷ��ֳ��Ŀ�ȼ���ױ����庬�����з����кϸ�',190)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('D651EBAB-E825-4609-9096-3C43D63AFB45','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','�Ƿ�����������ҵ����Ҫ��',200)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('8E296E80-E9ED-46BD-A252-35E0FA407E3F','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','�Ƿ�����߿���ҵ����Ҫ��',210)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('A30AA4B5-759F-4804-AD75-9F5ECEEB41E7','29828709-D103-413D-902F-1CDB90E2CFC1','���岼�߹淶������������ʱ�õ缼������/��ʩ��Ҫ��',220)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('83BC3116-8028-4C64-92D1-3CE451A9F659','29828709-D103-413D-902F-1CDB90E2CFC1','��/�������ֲ��������ڵ������á���������ɿ���������������',230)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('3BC4A468-4B8E-41D0-BC21-E715244A9798','29828709-D103-413D-902F-1CDB90E2CFC1','������������·����ѹ�ȼ�����Ҫ�󣬲��Ժϸ���·����λ�á��߶ȡ�֧�ŷ���Ҫ��',240)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('01AFADBA-6F7A-4215-9CF5-EEE9354C02CD','29828709-D103-413D-902F-1CDB90E2CFC1','����Ԫ�����õ��豸����·��������������Ҫ��',250)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0B3EDCA4-5598-4BED-9490-9A7BD51412C9','29828709-D103-413D-902F-1CDB90E2CFC1','��������װ��©�籣����������������Ҫ�����õ��¡����߽������Ҫ�󣬿��ص��������໥ƥ��',260)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0FC369CF-A331-4AA5-82B6-8DF6A9925662','29828709-D103-413D-902F-1CDB90E2CFC1','����䡢������ı�������(�ӵ�)��ʩ��ȷ�淶��������࣬�������������',270)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('32E962C0-CC90-4AFE-8ED6-79A0107DD2DE','29828709-D103-413D-902F-1CDB90E2CFC1','������·����ͷ��Ե���ã�����Ƥ��©������',280)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('752D7F3C-5E46-4782-933F-5B47AFEDFBC4','29828709-D103-413D-902F-1CDB90E2CFC1','�����豸�������ã��з��������ʩ���й淶���ɿ��Ľ��㡢�ӵش�ʩ',290)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('F345D6B5-C78D-441C-8452-C0C7A8B0C22C','29828709-D103-413D-902F-1CDB90E2CFC1','��װ��ʱ��·����Ա�е繤֤',300)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('7C27769D-4828-4CC6-9E71-E5AC03D4EF2B','29828709-D103-413D-902F-1CDB90E2CFC1','���������Χ����������������Ҫ�󣻲�����ά��ͨ���������ӵء������ظ��ӵط���Ҫ��',310)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('67E9E7F5-97DE-475D-ADDB-82C9614C4904','48F06310-5C74-4696-8249-3F5E1863D90C','���ּ���������ȶ��ԣ�����ʩ����������/��ʩ��Ҫ��',320)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('C1588ECA-04B6-4FFB-BB15-ECED1C538A47','48F06310-5C74-4696-8249-3F5E1863D90C','���ּ����˼���2m,���˼���1.6m,��ҵ�洦С��˼���1m',330)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0E89DFD9-5BCF-40E8-AE42-40EDF3092135','48F06310-5C74-4696-8249-3F5E1863D90C','ɨ�ظ���ȫ,��Ҫʱ����Ҫ�е��',340)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('A1C53824-C683-4C84-88C6-9EEF2B35F882','48F06310-5C74-4696-8249-3F5E1863D90C','���ּ���������ͨ��,�ݽ�(̤��)����400mm',350)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('E854751B-8D8D-4EA3-AF01-183CEE8C9281','48F06310-5C74-4696-8249-3F5E1863D90C','��ҵ����������,��������������ȡ�600mm',360)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('E4BE11E3-90A7-4BA3-BC18-9937AED09F07','48F06310-5C74-4696-8249-3F5E1863D90C','���ּ���ҵ������Ԥ�����ڷ�����λ',370)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('A8AD3B4D-E9E2-46A0-9D82-DE0913A76BFE','48F06310-5C74-4696-8249-3F5E1863D90C','���ּ���ҵ��,¥�ݼ�Ȼ���Ϊ˫����,�����ø߶�:��һ��������400mmΪ��,�ڶ���������1mΪ��',380)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('F76A6D99-B784-434D-8E50-3509AC463413','48F06310-5C74-4696-8249-3F5E1863D90C','�ۼ���ֹ������ɽ�����,���˼���ͷ����',390)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('031AF968-0EE2-4FD7-90E6-D2C8EE2F0F02','48F06310-5C74-4696-8249-3F5E1863D90C','�����š��׳š��̶��˴�����ȫ',400)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('C9F121A4-2051-4BF2-92F1-C6E1DA37B170','48F06310-5C74-4696-8249-3F5E1863D90C','���ͽ��ּܽӵط���Ҫ��',410)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('6395B9A9-24EC-4E9B-AACC-D4FF813C1132','48F06310-5C74-4696-8249-3F5E1863D90C','���ּ��ܹ�����ʩ��(����)��Ҫ��',420)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('84A2B5DA-0660-4E98-9323-43EA2771E7AB','366AC069-60BB-4D0A-A049-63CCCAEFC48C','�и����װ��ҵ�ļ�������/��ʩ,�����涨�����˽���',430)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('CD86C50D-E202-47B0-9E68-E975FC38E5D1','366AC069-60BB-4D0A-A049-63CCCAEFC48C','���ػ�е��װ���ܵ���ã����������װҪ��',440)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('1D9BC5C7-84E0-4F99-BCE6-7AD098C3E2F1','366AC069-60BB-4D0A-A049-63CCCAEFC48C','���ػ�е˾����������ҵ��Ա��֤�ϸ�',450)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('CD2D63F5-E6F6-45F0-A329-4E49E1AF5406','366AC069-60BB-4D0A-A049-63CCCAEFC48C','������ҵ�����Ͷ�������Ʒ��ȫ����λ���ܹ�����ʩ��Ҫ��',460)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('BABC5D6F-6FD1-445A-A0F3-353FED97BBE6','366AC069-60BB-4D0A-A049-63CCCAEFC48C','���ص�װָ�Ӻ�˾���ԡ�ʮ�������͸��Ը�λ��ȫ�ɲ����������',470)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('35D3AD57-4E1C-4FD8-9532-1B4AE67EE78D','366AC069-60BB-4D0A-A049-63CCCAEFC48C','�����Լ�ϸ�',480)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('97EFD3FD-9EF2-45D7-8D22-87B62AC986E1','366AC069-60BB-4D0A-A049-63CCCAEFC48C','רҵ����ϸ�',490)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('D81F93D7-9725-48B9-85EE-3E79A436A8C7','366AC069-60BB-4D0A-A049-63CCCAEFC48C','��ع���λ���ϼ��ϸ�',500)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0A1BFF93-CEDA-4DB9-9AA7-A354142B4772','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','ʹ�÷���Դ������Ӧ�İ�ȫ������ʩ�����¹�Ӧ��Ԥ������Ӧ��Ӧ����ʩ���豸',510)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0323C0AB-618A-425E-B560-6D77DDC0CCC0','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','����ʩ����ҵǰ����������ҵʱ�䡢�ص㡢���ݡ������ʩ�����ڸõص㼰�����ܷ�����ҵ���ܷ��䵽��ʩ����ҵ��Ա�������',520)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('A9E9F659-4C03-48F3-8FDD-CC2C39AC82AA','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','�����в��������ҵʩ����ȫ����Ա���������ҵʱ�䡢�ص㡢���ݡ���ʩ��ʩ����������ʩ���¹�Ӧ����ʩ��',530)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('5AE4E4AC-0A68-4FFF-B9D9-FD32B6ADBB4E','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','����ʩ����ҵʩ����������������ô�С���Ϲ涨Ҫ�󣬡���-����������Ŀ(������ʩ����ҵ���Ӻ�ɫ��ʾ��)������ר�˸���໤',540)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('AA622D3A-4C85-4D40-B51A-90AA8B4F255D','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','����ʩ����ҵ��ʹ�õ��豸�ȷ����йع涨Ҫ��',550)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('B25A79CB-549B-49F9-A448-97D4167CB725','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','����ʩ����ҵ��Ա�����ȷ����йع涨Ҫ��',560)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('4F300DCB-786B-4EE4-B28D-E065FC77B1D0','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','�н����޿ռ���ҵ��������/��ʩ�������������λ',570)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('54A720FC-3CF4-4411-B8DD-BF8AEA2D91CE','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','���������޿ռ�����ϵ�ķ��š����߼�ä��Ͽ������й��մ�ɨ����',580)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('67EFB3D1-59D2-44A0-BC94-8E0F22A8E0CB','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','ʢװ����ȼ�к�Һ�塢��������޿ռ䣬�������ȼ���壬���䱬ը����>4%ʱŨ��Ӧ<0.5%����ը����<4%ʱŨ��Ӧ<2%������19.5%~23.%Ϊ�ϸ��ж��к����ʲ��������ҹ涨�ġ�����������ж��к����ʵ��������Ũ�ȡ�ָ��',590)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('64B33809-C9C8-4451-BB5B-B89DF0AE9974','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','���޿ռ��ͨ������Ȼͨ����Сʱ���ϣ���Ҫʱ����ǿ��ͨ�������������������޿ռ��ڶ���ȱ��ʱ���Ͻ���ͨ������������',600)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('8DD20933-A830-44E8-B823-8FEAD2F7F0AD','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','ʹ�ò������𻨵Ĺ��ߣ�ʹ���ֳֵ綯����Ӧ��©�籣��',610)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('735D0042-A51F-404E-9DCC-4BCA68201749','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','������������޿ռ�Ҫ�жϵ�Դ���ڿ����Ϲҡ����˼��ޣ���ֹ��բ����־�ƣ���������ר�˼໤',620)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('A0D6743F-9183-41E0-9A0A-1C8666694B22','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','��������Ӧʹ�ð�ȫ��ѹ�����߾�Ե���á��ر�ʪ�����ͽ������޿ռ�����ҵ���еƵ�ѹӦ12V���»�ʹ��1:1�����ѹ��',630)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('BA8F697C-F960-4F31-B13B-FCBB6C9F5622','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','�������޿ռ�����ҵ����������ר�˼໤�����涨�������緽�����źţ����޿ռ������������ϰ����֤��ͨ����',640)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('7B0D34E2-BB33-4F51-8845-23C9FDE4BB6F','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','��ҵ��Ա���봩���ϰ�ȫ�涨���Ͷ�������װ�ͷ�������',650)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('1B149431-DBD6-4FBD-B831-47EF58B02B8D','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','�Ͻ�ʹ�õ����������������ҵ��Ա',660)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('940A90E4-F42F-48A7-8C69-C85E34457F56','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','ʢװ�ܲ����Ծ�������޿ռ�Ҫ�󰴹涨��������ۺ�������',670)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('6E15FE1F-5AA4-408F-B686-6E757E0A8CEE','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','���޿ռ����䱸һ��������Ӧ���Ȼ��þߺ�һ���������������',680)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('C919BF5F-48E4-42D4-8DB7-884D1C6744D9','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','��ҵǰ��Ǽ������Ա�����ߡ����ϵȣ���ֹ���������޿ռ���',690)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('9531CC02-FB0F-4CF9-A6E0-8CB224E1C14B','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','�Խ����޿ռ���ҵ��Ա���໤�˽��а�ȫӦ�������Ȼ������ȷ������������ȷÿ���˵�ְ��',700)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('3464F684-BCDF-4BA5-A65B-47AB8EECBB07','2C0660F9-D093-46E8-93E9-1D01D05EF718','�и���Ŀʩ����ҵ�ļ�������/��ʩ',710)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('4C6791A8-416E-4465-8C00-5E4998D64339','2C0660F9-D093-46E8-93E9-1D01D05EF718','��ҵǰ�����չ涨�����˼������׺���Ӧ�İ�ȫ����(����)',720)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('8E1C765A-78A7-4F14-BAC9-0B814F24B165','2C0660F9-D093-46E8-93E9-1D01D05EF718','ʩ����ҵ��Ա�Ͷ�������Ʒ�䱸��λ�����ϸ���Ŀʩ����ҵ��Ҫ��',730)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('3F7BD28A-0146-4822-9979-6AF5C85994F2','2C0660F9-D093-46E8-93E9-1D01D05EF718','��ʵ�˸���Ŀʩ����ҵ�İ�ȫ����������Ӧ��������',740)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('2BE8EA0D-85EC-4E08-BFB7-B423F7F19791','2C0660F9-D093-46E8-93E9-1D01D05EF718','������Ŀ���û�����ɨ�����롢��������ϸ�',750)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('F82127A5-1FC0-4395-91BC-FD06D742B397','2C0660F9-D093-46E8-93E9-1D01D05EF718','����ʩ����Ա�Ľ����������ϸ��ռ���ʩ��Ҫ����У����м��޵���Ӧ����',760)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('06A8CCDD-A51A-4799-9FBE-CF334078A342','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','�иߴ���ҵ��������/��ʩ�������������λ',770)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('47443105-B3C8-47A4-839E-01D59B216B05','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','��ҵ��Ա������������Ҫ��',780)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('FDD2402D-4B96-4AEF-B6D2-346F49B90CDD','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','��ҵ��Ա��װ���Ϲ���Ҫ�������ȫ����Я���й��ߴ�',790)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('382B979C-1D07-4DA0-BDC3-FFC3127DC332','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','��ҵ��Ա��� A������ʽ������ B������ʽ������',800)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('C0691603-7DDC-4803-9369-8919CAE579A8','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','�ֳ�����Ľ��ּܡ�����Χ�����ϰ�ȫ���',810)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('68D036AC-8483-4699-84D6-BE2D217398FF','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','��ֱ�ֲ���ҵ�м��и�����ʩ',820)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('B03C209B-427F-4709-9D6E-6B4528385C06','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','���ӻ����ݷ��ϰ�ȫ�涨',830)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('56A18A12-1055-421D-8A19-6B9A5C0D9FB7','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','��ʯ���ߵȲ�����������ҵӦ���貢վ�ڹ̶����ذ���',840)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('D66B349C-18CC-4631-9786-A166DC6F2A58','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','�ߴ���ҵ�г�����������װ��ʱ�ƹ淶������',850)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('6B238AAF-28C5-4F7C-95C9-2CB82F9C40AE','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','�ؼ��ߴ���ҵ����ͨѶ����',860)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('239509AE-751E-47F3-800D-E213E39E40D8','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','�и���Ŀ��ҵ��������/��ʩ�������������λ',870)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('1A4F7A8E-82CA-4B04-89B7-590CEB87F76E','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','��ҵ��Ա������������Ҫ��',880)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('73B491BB-27BA-4AB5-8B8F-B4B968410A3B','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','��ҵ��Ա��װ���Ϲ���Ҫ�������ȫ����Я�����ߴ�',890)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('3FC25B82-FE6F-406A-9F60-D2D3B00755FE','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','��ҵ���г�����������װ��ʱ�ƹ淶������',900)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('3971E0BC-7FB5-49C2-BB6C-B96AF3667C01','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','�ؼ��ߴ���ҵ����ͨѶ����',910)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0F6C44C6-6033-4F14-BDC1-1B08760EE65B','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','�����ٱ���ҵ֮3�����Ҫ��',920)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('1CDBA1E6-CBF0-4BC6-B004-DD6D021FB7C5','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','���϶�����ҵ֮5�����Ҫ��',930)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('5EBE4302-5D3C-41CD-8FC8-3FDF582FCF8F','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','�����ʵ���ҵ֮6�����Ҫ��',940)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('FDD25720-79ED-470C-A075-907C8BF203CB','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','����������ҵ֮2�����Ҫ��',950)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('84C26759-2DE8-4425-9F06-03583BA769C5','79211283-4A46-4321-BF6E-0C349F24C16D','��ʹ��Σ�ջ�ѧ��Ʒ�ļ�������/��ʩ�������������λ',960)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('613B27CB-0552-41EC-AB39-8144A7F26344','79211283-4A46-4321-BF6E-0C349F24C16D','��ҵ��Ա�Ƿ����ʹ��Σ����Ʒ����',970)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0C93FEF6-BA48-4A2E-9C3C-0858A0089040','79211283-4A46-4321-BF6E-0C349F24C16D','�Ƿ��˽�����Σ����Ʒ�����ܡ�������̺ͷ�����ʩ',980)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('336A2E4B-5AB9-442F-921F-7CC6381D617E','79211283-4A46-4321-BF6E-0C349F24C16D','��ҵ��Ա���˷�����Ʒ�Ƿ�ѡ�ú���',990)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('35F149AE-0FAA-4DC1-993F-D4C538500036','79211283-4A46-4321-BF6E-0C349F24C16D','�ֳ��Ƿ�߱����ַ�����ʩ',1000)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('74B54AB9-DD13-4F37-8AB0-77826D7A1A36','79211283-4A46-4321-BF6E-0C349F24C16D','��ʹ�õĹ����Ƿ�ȫ�ɿ�',1010)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('E6BC7BA0-3A3E-4493-9555-AA209CA0BE89','79211283-4A46-4321-BF6E-0C349F24C16D','��Ŀλ���Ƿ����þ�ʾ��־��Χ�辯ʾ��',1020)
GO

--HSSE������Ϊ����
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D9CBD92D-2620-464A-9CEF-8229A01AB6EB','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ������ʱ�õ�ʩ����֯��ƣ��Ƿ������ʱ�õ�Ʊ��',1030)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('45B59E53-26CD-4A5A-A9D4-96D9D40B7097','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','��ʱ�õ��Ƿ����TN��S����������ϵͳ��',1040)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4C43E6CA-DB9B-45C8-811C-923509349767','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ�ʵ��������硢����������������һ��һբһ��������',1050)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CB90F4D0-30B2-4A3D-B6AE-FE8EEA177E5D','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�����Ƿ��ص������裻�Ƿ��������ľ����ּ��ϣ�',1060)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B9467DF2-1707-4087-8C60-3461343EF15F','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','���½�ͷ�Ƿ��ι̿ɿ�����Ե���á���ȡ������ʩ������Ŀ�ľ����ƣ�',1070)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('28DC1137-631C-4A70-8806-D0EB4B3C127A','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','������ֹܡ����ּܡ��ܵ�֮���Ƿ��Ե�����������ý���˿�������£�',1080)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0328CAF9-5539-44E7-A068-5EC840E33C14','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�����Ϳ����������Ƿ���������������ȴ���1.5mm��',1090)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7374A38B-54FC-4094-A6A1-9720E6D95CE6','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ�����ý���˿������˿��Υ������',1100)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B442004C-83BB-438E-B2DD-36C44A2DE160','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�����Ϳ�������߿ںͳ��߿��Ƿ�����������棬��Դ���������Ƿ����ˮ��ͷ��',1110)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6C684E7C-25A3-4397-B187-698A09E5889B','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','���߶�ͷ�Ƿ������˨���ӻ�ѹ�ӣ��Ƿ���ڽ�о��ֱ�ӹ��ڵ�Դ�����ϵ�����',1120)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9A40909C-984C-4E5C-9777-FC59D1B779AB','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ӵ��������صȣ��Ƿ������Ӵ����ÿɿ�����ͷ�Ƿ�����ʴ����',1130)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('440B466E-46CD-47E4-B50B-1FCEC25C376A','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�����Ϳ������Ƿ���ꡢ���������š�������',1140)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BA8D99DB-965A-4A78-8E0B-11B50F7523EF','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','��������ÿ·�Ƿ�װ��©�籣������',1150)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B5015C44-D032-4C8B-AC62-B08BDF52AFC7','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ����������Ϳ�����©�籣������©�����Ӧ������30��A,�©�綯��ʱ��ӦС��0.1S��',1160)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('22349C64-B2AB-440A-BB9C-812F09FE6E0A','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�ƶ�ʽ���ֳ�ʽ�綯�����Ƿ�װ��©�綯������������15mA���©�綯��ʱ��С��0.1S��©�籣������',1170)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D9542FB7-462E-49F4-BE74-6AF12917884D','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�ƶ�ʽ���ֳ�ʽ�綯���ߵ�Դ���Ƿ����ͭо�������£�',1180)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4D330906-70A8-48FD-BD5A-8BEB47D71F6A','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','��С�����ػ����丽�����Ƿ����ܶϵ翪�أ�',1190)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FB003CD0-2046-45CC-9CF0-79F2F9D00304','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�ֳ������еƵ�ѹ�Ƿ񳬹�36V��',1200)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5C70449B-3C8C-49EC-8B16-7FC5B2260775','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','���������ڼ���ʪ������ʹ�õ��еƣ����ѹ�Ƿ񳬹�12V��',1210)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('75D6EA13-12FD-405A-AE00-14B569F9C198','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�纸������Ƿ�ӵؿɿ����Ƿ��̨�����ӵأ�',1220)
GO
INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('287B1022-DE1D-4411-812F-95085D348B8D','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�纸��һ�β�ĵ�Դ���Ƿ��Ե���ã��䳤���Ƿ����5�ף�	',1230)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('33AF2677-02F5-49FE-8559-A4010AA2437F','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�纸�����β��������Ƿ������Ƥ��Եͭо����£��䳤���Ƿ����30m��',1240)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5702F223-FF15-4C5D-889D-31E6B6ED7B77','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�������ߺͱ��������Ƿ�����õ���о�ߣ�',1250)
GO
INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F01EC02A-7310-4047-A517-E21A87E8A549','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�ֳ���������ĵ�ѹϵͳ����ѹ����ѹ�����Ե��Ƿ�ֱ�ӽӵأ���ӵص����Ƿ����4����',1260)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1F87772A-6BB7-4DC0-9C4F-3CA251614268','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','���õ��豸��صĵ纸�����������巿����ƽ̨���������ܵ��Ƿ��������ӵر�����',1270)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('91B29B1C-1322-4A0A-95F3-3C5E47854702','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�õ��豸�ı������߻򱣻������Ƿ�����',1280)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('208DC3D1-DDB2-4DAE-AED9-8473496FDCAE','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�õ��豸�ı������߻򱣻������Ƿ���ú��ӡ�ѹ�ӡ���˨���ӻ������ɿ��������ӣ�',1290)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BE73E705-D436-4EDD-90F2-1126A9BD79F6','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ񱣴����Զ����ص�����¼�����У���¼���ӵص�����Լ�¼��',1300)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BE1EED85-19A8-4CEE-89E0-6935FA79B007','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ��е繤�ռ��¼���Ұ�ʱ���㣻',1310)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B34CB203-538C-47F2-9385-533F015ECC51','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','�Ƿ����������ҵ����Ʊ��',1320)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('97DFC510-66B9-4BEE-9309-E12BF25AB2AF','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','��ҵƱ�Ƿ����������ҵ��ƽ��λ�á���Ⱥͷ�Χ����ҵ�ֶΣ���е���˹����ڣ����Ƿ��赥λ������˾���ܳа���λ�����׼��',1330)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6B914C6B-7089-498A-8635-4CB2BC08F90E','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','��ҵǰ�Ƿ�Ե������ι��̺͵�������������������',1340)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('64EA3AA1-2734-4E77-87B3-59619FE7BA1C','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','��ҵǰ�Ƿ��ƶ�ʩ����������ʵHSE�����ʩ��',1350)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B9FE4AA5-5995-47B9-8B1B-623F3D2E50F3','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','ʩ����λ�Ƿ���ȷ��ҵ�ֳ�HSE�����ˣ���ʩ�����̵İ�ȫ��ҵȫ�渺��',1360)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DBA711E2-B33F-4CC9-9524-0F61F1ABF6AB','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','������װ�á�������ʩ��ʱ���Ƿ���ר�˸���໤��',1370)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4396E81E-4591-46DC-967B-644B739CEF1F','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','����ǰ����ҵ��λ�Ƿ�������ʵ��˵�λ������й�HSE��ʩ������������ҵ��Ա����HSE������HSE�������ף�',1380)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1206407F-2D26-4CCF-9B84-A3F007EDD294','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','��ҵ��Ա����ҵ���Ƿ񰴹涨��װ������Ͷ�������Ʒ��',1390)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('974D952C-0251-411A-A2EC-9E5A439D26FF','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','�ڵ�·�ϡ�����װ�á�������ʩ��ʱ���Ƿ����ֳ���Χ���������ƣ�',1400)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('48BB029D-9C1E-4EF5-818E-34EA5239164C','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','ҹ�䶯����ҵʱ�Ƿ��辯ʾ�ƣ�',1410)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B854FA85-94BB-4585-AF44-56290589C50E','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','��׼������ҵ��ɺ�ʩ����λ�Ƿ������ҵƱҪ������͵������ι�����������ֳ���ʶ����ȷ������ҵ��Χ��ʩ��������',1420)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BD4E6F26-335E-48D0-B1ED-91B887735FDD','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','�ڵ��¹ܵ������µȲ����ʱ���Ƿ�ʹ�û�е���ڣ�',1430)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9E8390F1-46EF-490B-B0EC-8AD991D88518','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','��������Ԥ�ϲ����ĵ����豸���ܵ������¼��������ɱ���������ʱ���Ƿ�����ֹͣ��ҵ�����潨�赥λ����������ٽ�����ҵ��',1440)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F4E7F7A3-B7B8-4CA8-9193-901D8827D695','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','�����ж����к�����������ʵ�����ʱ���Ƿ�����ֹͣ��ҵ����ʱ���Ϸ����룬�����泧������',1450)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('245BD81C-DE03-45B3-A801-E34CCF051934','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','��ȷ��Ϊ�к����������ʱ���Ƿ񰴽����豸��ҵҪ�����Ʊ֤��������ҵʱҪ��ȡ������ʩ������ר�˼໤��',1460)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4DC17FE3-FC82-404C-9F8F-0A1C5E2EDE2B','0CD8C338-07B9-4AE3-A2A6-04485098FE91','�Ƿ��������ҵ����Ʊ��',1470)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5BA5D95C-E1E9-4D15-849E-16C778A81F66','0CD8C338-07B9-4AE3-A2A6-04485098FE91','�Ƿ�ȷ�������������������Ч�Բ����ں���λ�ã�',1480)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CCC3A185-751D-4859-9953-5A8C2B6120D6','0CD8C338-07B9-4AE3-A2A6-04485098FE91','�Ƿ��ʹ���������ģ���Ϥ����Ԥ������ҵ�����Ͱ�ȫ����·�ߣ�',1490)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A4FE62F3-B118-4DD8-8559-F8F0A3AD2953','0CD8C338-07B9-4AE3-A2A6-04485098FE91','�Ƿ�һ���û�Ʊֻ��һ���û���ҵ��',1500)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C34ADBFB-69F0-4AA9-AB30-8B3CF30EC4BA','0CD8C338-07B9-4AE3-A2A6-04485098FE91','�û�Ʊ�Ƿ����û�ִ��������Я����',1510)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3043EDAA-C5DA-4C6B-BB72-73215EB44441','0CD8C338-07B9-4AE3-A2A6-04485098FE91','�Ƿ��ϸ�ִ�С��������𡱣�',1520)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D172A2F6-788B-425B-A924-31A4D0C53E75','0CD8C338-07B9-4AE3-A2A6-04485098FE91','�û���ҵ�������Ƿ���ȷ���޻����������жϵ�Դ�󷽿��뿪�ֳ���',1530)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('05096855-B601-495A-90B8-8AA04D233929','0CD8C338-07B9-4AE3-A2A6-04485098FE91','�̶�ʩ���û����Ƿ������������ġ�ɰ�ء�����ˮԴ����������ͨ����ͨ��',1540)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('70E83E78-EAF4-4FDD-944A-9E44AA152F29','0CD8C338-07B9-4AE3-A2A6-04485098FE91','��ȼ�ױ�����ʩ��������ҵǰ�Ƿ��ȡ��Ǩ�����롢�û�����ϴ�����������ʪ�ȡ���ǿͨ��ȷ����ʩ��',1550)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1037C3E3-74C3-46E4-8861-F0857578F29E','0CD8C338-07B9-4AE3-A2A6-04485098FE91','�ߴ�������ҵ�Ƿ����÷�ֹ�𻨷ɽ�׹�����ʩ���������·��Ŀ�ȼ���ȼ���е�豸�����¡���ƿ�Ȳ�ȡ�ɿ��ķ�����ʩ��',1560)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C9C9B882-0252-4DD0-B7EC-2199948C437A','0CD8C338-07B9-4AE3-A2A6-04485098FE91','�ߴ�������ҵ�Ƿ������ʩ��ͬʱ���д�ֱ������ҵ��',1570)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F4AE7DA3-7FA0-45EA-AE00-A6966DD440CB','0CD8C338-07B9-4AE3-A2A6-04485098FE91','�ߴ��纸��벻�����ҵ��Ա��δ������ҵλ��֮ǰ���Ƿ�����Դ��',1580)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D4DC4573-E3B3-4D46-9F90-C74CE96A1ADF','0CD8C338-07B9-4AE3-A2A6-04485098FE91','ʹ����ƿ�Ĺ����Ƿ���ѵ���˺ϸ񣬳�֤�ϸڣ�',1590)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A03B7635-17AE-4654-97F0-81EC6B952428','0CD8C338-07B9-4AE3-A2A6-04485098FE91','��Ȳƿ�Ƿ������ȹ̣�ʹ��ʱ�Ƿ�װ�������',1600)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('48FE0E6A-31B4-4C61-9D3E-964F595B2DB6','0CD8C338-07B9-4AE3-A2A6-04485098FE91','����ƿ������Ȳƿ����ȼ��ƿ������Ƿ����10�ף�',1610)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F32C2075-E496-4BDC-AC5F-FE535BD6B7FF','FD18318D-CF10-47A9-86C5-CC066B5119B3','����ǰ���Ƿ����ʩ��Ҫ������跽����',1620)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D9276F82-C04A-45B5-A6E2-45AB8D394D9D','FD18318D-CF10-47A9-86C5-CC066B5119B3','���ּ��Ƿ�ѡ���⾶48��51mm,�ں�Ϊ3��3.5mm�ĸֹܣ�',1630)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3808F29E-1549-4495-8944-11AE9D9B9A5C','FD18318D-CF10-47A9-86C5-CC066B5119B3','���ְ���������Ƿ���8�Ŷ�п��˿��',1640)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6FCD12A3-004A-4B54-A98A-6B6450CEE1E7','FD18318D-CF10-47A9-86C5-CC066B5119B3','��ҵ��Ա�Ƿ�ȡ��������ҵ����֤��������״�����ϸߴ���ҵ��Ҫ��',1650)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6F574A3D-585C-45BA-8676-F63B8A4863D5','FD18318D-CF10-47A9-86C5-CC066B5119B3','���ͺ�������ּ�ʩ���������Ƿ���Ŀ���������ˡ�ҵ��������˾���ܳа�������������ҵ��Ա�������ף�',1660)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C3E69E25-561B-4A3E-A211-F5E0D852F402','FD18318D-CF10-47A9-86C5-CC066B5119B3','���ͺ�������ּ�ʩ���������Ƿ�����ҵ��Ա�������ף�',1670)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DD9D4C1A-14E2-42BF-AD34-65AA5E7D5ED2','FD18318D-CF10-47A9-86C5-CC066B5119B3','�ڵ�����·����������ּ�ʱ���Ƿ�����߱��ֹ涨�İ�ȫ���룻',1680)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A6B315F2-D5C6-42E4-9A9E-7C98BBF296D3','FD18318D-CF10-47A9-86C5-CC066B5119B3','��ҵ�����Ƿ����þ�ʾ��������ҵ��Ա�������ڣ�',1690)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1033D022-64BE-4FAF-91A6-D0AD6A2A2EDC','FD18318D-CF10-47A9-86C5-CC066B5119B3','�ڴ�����ּܹ����У�����ְ塢��δ�������������Ƿ���;ֹͣ��ҵ��',1700)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D7845732-45D5-4A04-8F50-177BC775C943','FD18318D-CF10-47A9-86C5-CC066B5119B3','�ӵ������ʱ���ػ��Ƿ�ƽ������ʵ��',1710)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1C926BD6-1D6C-43F7-B35D-4FDA73C16368','FD18318D-CF10-47A9-86C5-CC066B5119B3','�ӵ������ʱ���Ƿ�����ɨ�ظ��ֲ��ػ��Ĳ��㣻',1720)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7D8F4314-EB19-443F-BE5D-F057711D5B2A','FD18318D-CF10-47A9-86C5-CC066B5119B3','���ּ��Ƿ���¶����������γɵ���ʽ��',1730)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('AE27596B-44F9-45DD-8662-CD0A518B907B','FD18318D-CF10-47A9-86C5-CC066B5119B3','���ּ������Ƿ��ȶ��ι̣�����ҡ�ڻζ���',1740)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A73206BC-2FE9-419D-A9AD-D991100F0846','FD18318D-CF10-47A9-86C5-CC066B5119B3','�ӵ������������������ּ���ҵ�棬�Ƿ����������Ӻ�ͨ����',1750)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FDB5E915-E08A-417A-9080-B4E442B58F18','FD18318D-CF10-47A9-86C5-CC066B5119B3','���ּܵ���ҵ����ְ��Ƿ����̣�����Ӧ�ι̣�̽ͷ��ĳ��ȡ�300mm��',1760)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4D94E21E-5702-4F40-BFA7-F01A4E6900BE','FD18318D-CF10-47A9-86C5-CC066B5119B3','���ּܵ��ߵ���ƽ̨��࣬�Ƿ����õ��Ű壻',1770)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A6C816AD-B3EE-46E9-93A9-103FEE729516','FD18318D-CF10-47A9-86C5-CC066B5119B3','������ϣ��Ƿ�֪ͨHSE���ܲ��źͽ��ּ�ʹ�õ�λ��������ͬ������գ���ȷ�Ϻϸ���д�����ּܽ������յ�������ǩ��ȷ�ϣ��ҡ����ּ������պϸ� �ƺ󷽿�ʹ�ã�',1780)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9F5A59A7-E4B5-43FF-8CA5-7E2D20922944','FD18318D-CF10-47A9-86C5-CC066B5119B3','���պ�Ľ��ּ��κ��˲������ԸĶ�����������������ֲ��Ķ�ʱ�Ƿ�ʩ��������ͬ�⣬��ԭ��������������ɺ��������м�顢���ӡ�����������',1790)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('14C44CE9-C0AF-436E-8B3D-3E5C16B20FD8','FD18318D-CF10-47A9-86C5-CC066B5119B3','���ּ��Ƿ��ڼ�飬��籩������Ƿ����ȫ���飻',1800)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('451EE759-9657-4C76-84A7-3C66DB545100','FD18318D-CF10-47A9-86C5-CC066B5119B3','���ּ���ʹ�ù����У��Ƿ��������ܸ˺ͽ��ְ壻',1810)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BE42AF7E-EE97-4E4C-868C-80E019819598','FD18318D-CF10-47A9-86C5-CC066B5119B3','������ּ�ʱ���Ƿ���Χ�辯����������ר�˼໤����ֹ���˽�����ҵ���ڣ�',1820)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C5397629-7119-4038-AAF2-4821A345E69B','FD18318D-CF10-47A9-86C5-CC066B5119B3','�����ҵ�Ƿ�˳�����϶��²������׼����ͬʱ��ҵ��',1830)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('43612FA2-22D3-42EC-B926-BFDA55E55498','FD18318D-CF10-47A9-86C5-CC066B5119B3','��ж�µļܸˡ����Ӽ�������Ȳ��ϣ��Ƿ������ţ��Ͻ�����Ͷ����',1840)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('76F1EE8C-5909-4C41-9C0B-3E2AA53DA70B','FD18318D-CF10-47A9-86C5-CC066B5119B3','��ҵ��Ա���ܸ˼���ҵ�������ߵİ�ȫ���벻��ʱ���Ƿ��жϵ�Դ��',1850)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E381EA5F-65AA-4028-9F7C-EAAB1A313210','FD18318D-CF10-47A9-86C5-CC066B5119B3','��ж���⣩���Ľ��ָˡ��壬�Ƿ�һ��ȫ�����ꡣ',1860)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('204A96C4-4AAB-40AD-9DBA-8BAE6E650155','EC986070-16BF-4343-8850-252D9A747358','����������15��30�ף������ϸߴ���ҵʱ���Ƿ�����ˡ��ߴ���ҵƱ����',1870)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B2A358BC-9374-4652-8810-EA3149B8BA60','EC986070-16BF-4343-8850-252D9A747358','�ߴ���ҵ���������Ƿ��ŹҾ������',1880)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('43437189-E576-4D84-98FA-1C1901C1FC2A','EC986070-16BF-4343-8850-252D9A747358','ҹ��ߴ���ҵ�Ƿ��г����������',1890)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A8F65ABE-4A76-4EDD-9FC5-C34109CB684C','EC986070-16BF-4343-8850-252D9A747358','�Ƿ���а�ȫ�������������ף���ʵ��ȫ��ʩ��',1900)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A6BDDB8F-25F2-4C5C-B306-D145A93FBFB1','EC986070-16BF-4343-8850-252D9A747358','�Ƿ�ϵ�ð�ȫ�������ð�ȫñ��������㣻',1910)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C66E7CF9-0DB5-4A61-9EC8-59999A713D52','EC986070-16BF-4343-8850-252D9A747358','�ߴ���ҵ������ܿ����Ƿ񱣳��㹻�İ�ȫ���룻',1920)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('16D5F259-51A6-4241-8CAC-0653155588B6','EC986070-16BF-4343-8850-252D9A747358','�����������Ϻ��׵硢���ꡢ����ȶ��������������Ƿ����¶��ߴ���ҵ��',1930)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3724A8FF-C046-4091-95C8-8347FC5C02E4','EC986070-16BF-4343-8850-252D9A747358','����Ӧ���빤�ߴ����Ƿ�����Ͷ�����ߡ����Ϻͷ��ϵȣ�',1940)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('21036925-88BA-42E5-BA66-060853842853','EC986070-16BF-4343-8850-252D9A747358','�������̵ķ������ˣ��Ƿ����϶����ð�ȫ������գ�',1950)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4CDA7FA8-3DAF-4F03-9395-560B11540103','EC986070-16BF-4343-8850-252D9A747358','����ƽ̨��������ˣ��Ƿ����϶��¼ӹҰ�ȫ������ ',1960)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3844AAAA-FBC7-405A-B1BA-E33088A0A51E','EC986070-16BF-4343-8850-252D9A747358','�Ƿ�5�����ϵ�һ�����ʵ���ҵ���������������󣬷���ʹ�õ����ȴ�ֱ������ʩ���У�',1970)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DA4F95B8-06D1-4719-AE0E-D66DAD3C5308','EC986070-16BF-4343-8850-252D9A747358','�������������ݼܡ����ȵȹ�����װǰ���Ƿ����������ݡ����ּܵȸߴ���ҵ���ߣ�',1980)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6D536F83-B501-4CD0-A2B5-A1BDAE71E547','EC986070-16BF-4343-8850-252D9A747358','������װʱ���Ƿ���������ʱ�߿���ҵ��ȫ��ʩ���湹��ͬʱ�ϵ���λ��',1990)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('16FEF6EE-D64A-417D-909E-EB93DD50498E','EC986070-16BF-4343-8850-252D9A747358','��װ�еĴ�ģ����������,�Ƿ�վ�˺����ߣ�',2000)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3A7B8E6C-3168-449B-85AD-B446964E6094','EC986070-16BF-4343-8850-252D9A747358','ģ��δ�̶�ǰ�Ƿ�����µ�����',2010)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('AA6DBECA-0C45-40A5-9A82-50B20FF48950','EC986070-16BF-4343-8850-252D9A747358','֧��߶���3�����ϵ���ģ�壬�����Ƿ���б�ţ��Ƿ���ƽ̨��',2020)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('42D95ECF-ABB0-4558-A2F5-63D99DD664D8','EC986070-16BF-4343-8850-252D9A747358','�����Ͱ�װ�ֽ�Ǽ�ʱ,�Ƿ������ּܺ������',2030)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1C859B86-6B6E-437A-848A-6B10BB42CABD','EC986070-16BF-4343-8850-252D9A747358','����3�����ϵ����ֽ�,�Ƿ�������ƽ̨��',2040)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('320DA4DB-DF15-4CEE-9987-2ACFCF9438A8','EC986070-16BF-4343-8850-252D9A747358','�������2�����Ͽ�ܡ������ȹ���,�Ƿ������ƽ̨��',2050)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BD5C1E35-1E8B-4F16-996C-5D4043BAFF49','EC986070-16BF-4343-8850-252D9A747358','�ƶ�ʽƽ̨������Ƿ񳬹�10M2,�߶ȳ���5�ף�',2060)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('077040A2-7342-41CC-9673-0013669D554D','EC986070-16BF-4343-8850-252D9A747358','ģ�塢���ּܵȲ��ʱ,�Ƿ��·����ˣ�',2070)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('89D7D995-BECF-42AD-A47D-F2C0A0861387','EC986070-16BF-4343-8850-252D9A747358','�ṹʩ���Զ������Ƿ���Աͨ���ھ����谲ȫ�����',2080)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DD2384ED-F794-4FED-9829-F10BD93F2855','EC986070-16BF-4343-8850-252D9A747358','��������ʩ������׹�������ͨ����������Ӱ��ķ�Χ�ڣ��Ƿ���趥���ܷ�ֹ��͸��˫������ȣ�',2090)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5991001A-885C-40EF-BCD4-380F19DEADDC','EC986070-16BF-4343-8850-252D9A747358','�������ػ����ۻ�ת�뾶�ڵ�ͨ����������Ӱ��ķ�Χ�ڣ��Ƿ���趥���ܷ�ֹ��͸��˫������ȣ�',2100)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DBEF8245-76C9-4B86-BFFF-35D4B0B68EF9','82884781-F5B6-4623-A0BC-112DCA6665D9','���ػ�е�Ƿ��в�Ʒ�ϸ�֤����ȫʹ�á�ά��������˵���飻',2110)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('849ED22A-9452-4C60-AD1F-076EBD3E3F19','82884781-F5B6-4623-A0BC-112DCA6665D9','�Ƿ�ÿ����ҵǰ���а�ȫ��飬��������������豸��������м��޴���',2120)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6DB8C30A-4253-4631-8C6C-F17E4C477274','82884781-F5B6-4623-A0BC-112DCA6665D9','��˿����������������ж�ۡ���������������Ƿ���кϸ�֤��ʹ��˵���飻',2130)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('69482A77-87FC-4542-A2F9-1660FA05EA6F','82884781-F5B6-4623-A0BC-112DCA6665D9','�������豸�������ĵ�װ���Ƿ���Ƶ�װ��������������',2140)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('34BC768D-AF17-4F59-B59B-ACCEF28B9B91','82884781-F5B6-4623-A0BC-112DCA6665D9','��ҵǰ�Ƿ��ɼ�����Ա��������ҵ��Ա���м������ף�',2150)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2BF872B1-87B3-4093-9594-D74526D34644','82884781-F5B6-4623-A0BC-112DCA6665D9','������ҵ�У�����ָ���Ƿ��ϸ�ִ�е�װ������',2160)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('62086234-4BD3-4155-B5F8-DB8ED5F1E397','82884781-F5B6-4623-A0BC-112DCA6665D9','�Ƿ���������ָ��ǩ���������豸��װ�������ɽ����Ե��͵�װ��ҵ��',2170)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BFE48435-908B-46EB-8D6F-48B0170103B5','82884781-F5B6-4623-A0BC-112DCA6665D9','����ָ����Ա�Ƿ�ֹ���ȷ�����ȵ�λ������������ı�־�ϸ�ָ�ӣ�',2180)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3EDD8C19-E597-4469-AB1F-CEED99DADF44','82884781-F5B6-4623-A0BC-112DCA6665D9','��̨���ػ�����ͬһ����ʱ���Ƿ�ѡ����ͬ���ֺ���ͬ�������������ػ�е��',2190)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BFFD87C5-E305-4F1C-A08D-25F472B5B906','82884781-F5B6-4623-A0BC-112DCA6665D9','�Ƿ񾭹���ȫ������ѵ��ȡ�õط����ܲ���ǩ����������ҵ����֤�󣬷��ɴ�������ָ�ӺͲ�����ҵ��',2200)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E2E14DB4-418D-49FB-A841-E499BA378C6C','82884781-F5B6-4623-A0BC-112DCA6665D9','�Ƿ񰴹涨��ָ���źŽ���ָ�ӣ�',2210)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5DAE1453-0DD3-43F2-839C-5DF9D14CEAC7','82884781-F5B6-4623-A0BC-112DCA6665D9','�Ƿ���ʽ���ǰӦ�����Ե���',2220)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('19626525-0E8A-4ADD-93E4-C5A78008B09E','82884781-F5B6-4623-A0BC-112DCA6665D9','��װ�����У��κθ�λ���ֹ��ϣ��Ƿ�������ָ���߱��棻',2230)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3E49BC1A-BD06-4629-9DC0-68794F16B71F','82884781-F5B6-4623-A0BC-112DCA6665D9','�����λǰ���Ƿ�⿪��װ���ߣ�',2240)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2158B654-1CE5-4808-B761-C4BC815571C8','82884781-F5B6-4623-A0BC-112DCA6665D9','���ز�����Ա�Ƿ�ָ����Ա���źŽ��в������Խ���ͣ���źţ������ɺ��˷�������Ӧ����ִ�У�',2250)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A5AD1815-DDCC-4BD0-B7BC-3943D2009914','82884781-F5B6-4623-A0BC-112DCA6665D9','�Ƿ�ʹ�����ػ����������ػ�е������ػ������������Ʒ�������',2260)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('73DF6796-6289-4DD9-87C8-A768301472D5','82884781-F5B6-4623-A0BC-112DCA6665D9','�Ƿ����ƶ�������ȫװ��ʧ�顢��˿�����˵�����½�ֹ���ز�����',2270)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C670A478-3016-488C-AA90-A78CA09A447F','82884781-F5B6-4623-A0BC-112DCA6665D9','�������󡢵��Ҳ��λ�ƽ�⡢������Ǵ����˿��֮��δ�ӳĵ�ʱ�Ƿ񲻵����أ�',2280)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('02F2DA05-C419-4396-9F1B-A59116B8B665','82884781-F5B6-4623-A0BC-112DCA6665D9','�޷����峡�ء����������ָ���ź�ʱ�Ƿ�ֹͣ�������ز�����',2290)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('895A961A-4937-48BE-A7C4-8F0A9BE38448','82884781-F5B6-4623-A0BC-112DCA6665D9','���ػ�е����ۼܡ����ߡ����ߡ���˿�����·����͵����Ƿ�Զ��ߵ�ѹ�����·��',2300)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E7922276-2414-46ED-B335-09129F7F470A','82884781-F5B6-4623-A0BC-112DCA6665D9','��ͣ������Ϣʱ���Ƿ񽫵�����������ߺ͵��������ڿ��У�',2310)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DD76328A-D90F-4AA6-AA6B-0F8332A070B8','82884781-F5B6-4623-A0BC-112DCA6665D9','���� ���ü���λ��������ͣ����',2320)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('045D1F48-FF21-4D92-8405-291F596E2C4C','82884781-F5B6-4623-A0BC-112DCA6665D9','��̨���̨���ػ�е����ͬһ����ʱ����˿���Ƿ񱣳ִ�ֱ�� ',2330)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CD56903C-588D-46BA-B670-6A30564FDA2B','82884781-F5B6-4623-A0BC-112DCA6665D9','��̨���̨���ػ�е����ͬһ����ʱ�������������Ƿ񱣳�ͬ������̨���ػ�е�����غɲ��ó�����������75����',2340)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BABD897F-404E-4E8E-96AD-CF7689D20F6F','82884781-F5B6-4623-A0BC-112DCA6665D9','��̨���̨���ػ�е����ͬһ����ʱ����̨���ػ�е�����غ��Ƿ񳬹���������75����',2350)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D31172A7-AA0E-47D8-BBBC-AEE4346E19D7','82884781-F5B6-4623-A0BC-112DCA6665D9','˾����Ա�Ƿ񰴵�װ����ѡ��������������֤��ȷʹ�ã�',2360)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0BDF1ABA-545E-4E40-A265-2FDF61CA99F8','82884781-F5B6-4623-A0BC-112DCA6665D9','���������Ƿ��ο�������͵��������Ӧ��ͬһ��ֱ�ߣ�',2370)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('40AD6858-FE74-4827-BEF9-20650217FDA1','82884781-F5B6-4623-A0BC-112DCA6665D9','˾����Ա�Ƿ������������ڵ�����������ͣ����',2380)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0D12CA89-27DE-4B95-BF6C-6DF113E9B196','82884781-F5B6-4623-A0BC-112DCA6665D9','��������ʱ���������������������Ǵ��Ƿ�ӳĵ棻',2390)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('18B35FC9-810F-449C-A9EC-3FBF93BAF483','99431E70-833A-464D-8066-E41E230646DA','�Ƿ���У����߻�ʹ�úϸ�֤��',2400)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EC4A7073-6C10-4752-B9F4-065485DE0356','99431E70-833A-464D-8066-E41E230646DA','�Ƿ���з��乤����Ա����֤��',2410)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7693D0EC-9894-41A9-AA8D-518F8D72C7F1','99431E70-833A-464D-8066-E41E230646DA','�Ƿ��������װ��ʹ�õǼ�֤��',2420)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('99D56128-76D8-4571-B9C1-CF0783C94B08','99431E70-833A-464D-8066-E41E230646DA','�Ƿ��������װ�ù������֤��',2430)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('13D889BA-070F-4E1F-B486-1E6DCAF221DE','99431E70-833A-464D-8066-E41E230646DA','�Ƿ��������������ҵ���֤������ʩ���ְ���HSE�����ź������쵼��׼�󣬷��ɽ���������ҵ��',2440)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0BD5BED4-2A05-4705-A34F-7D150CB1E3F2','99431E70-833A-464D-8066-E41E230646DA','����ҵǰ�Ƿ��ƶ���ȫ������ʩ������ʵ��λ��',2450)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('444A904F-C146-4438-8AD9-E65460430D97','99431E70-833A-464D-8066-E41E230646DA','ʹ������װ�õĲ����Ƿ�����ҵǰ���뵽��HSE�����š��豸���Ű���Ǽ�������',2460)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7E790E6B-68D8-4D64-98FB-3661E99F957C','99431E70-833A-464D-8066-E41E230646DA','��ҵǰ���Ƿ񻮶�����ҵ���䣬ȷ����ҵʱ�䣬ȷ����Χ�޹���Ա��ȫ���롣��ʽ��ҵǰ����Ҫ�����峡��',2470)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('25BD3FC0-4610-4173-AE1D-8CEF0E4A3F1F','99431E70-833A-464D-8066-E41E230646DA','��ҵǰ���Ƿ񿱲��ʩ���ֳ��ĵ��Σ���ȷ���úþ����ߡ�����ƣ�ȷ��������������˲ʱ������С��2΢����/Сʱ��',2480)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A44D50C3-D57D-4D1C-B7E4-C777E95D3B11','99431E70-833A-464D-8066-E41E230646DA','����Ҫ·�ں���Ա����������Ƿ���ר�˿��أ�',2490)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5FE9D368-6B6E-498A-A235-004E93A7FD25','99431E70-833A-464D-8066-E41E230646DA','��ҵʱ���ֳ��Ƿ�������������������ҵ��Ա���ܽ���������ҵ��',2500)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('91D10C1D-6515-4F98-8FA2-19BB62E7777D','99431E70-833A-464D-8066-E41E230646DA','������Ա�Ƿ��֤�ϸڣ���Ϥ�йذ�ȫע����������Ļᣨ��ʹ�á��ᱣ�������顢���ų����ϣ������ã��úá��ܺá�ά�������ã���',2510)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7A208414-DDDE-475D-ADFB-F4FD913F0376','99431E70-833A-464D-8066-E41E230646DA','��ҵǰ�Ƿ񴩴��÷����þߣ�',2520)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5FBD1BFB-0EAF-4016-A83A-88AAFE723F5E','99431E70-833A-464D-8066-E41E230646DA','ҹ����ҵ�Ƿ��г����������',2530)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5D8D11C9-9BD2-4531-A67D-58CD5A6BD702','99431E70-833A-464D-8066-E41E230646DA','�ڽ�����������ҵ���Ƿ�����Ӧ�İ�ȫ��ʩ��',2540)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2335B7BF-E1B5-4DD8-9905-6D65B8E31AC7','99431E70-833A-464D-8066-E41E230646DA','������װ�á��豸ʹ�ù����У����������װ�á��豸�Ľ����Ƿ����ý��Ӽ�¼��',2550)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5939E1A2-7827-4413-AC9F-F083A3BD1F9C','99431E70-833A-464D-8066-E41E230646DA','������ͬλ��������ǰ�Ƿ��չ��ҹ涨�򵱵��������߲��Ű���׼��������',2560)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('448F239A-D850-49D9-A13B-E5923DDA70FB','99431E70-833A-464D-8066-E41E230646DA','���������Ƿ�������Я����������ǵİ�ȫ��Ա��������ҵ��ԱѺ�ˣ�������в���ϼ�⣬�Է����ⶪʧ��й©��ͬʱ�����÷�����Ʒ��',2570)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9BA8E101-EA35-4469-B30C-74871166EDCF','99431E70-833A-464D-8066-E41E230646DA','ÿ��ʹ�ý������Ƿ񽫳����豸һ���ͻأ��������ר�ô�������������ȼ���ױ����׸�ʴ��Ʒ�ڷ���һ��ָ��ר�˸��𱣹ܣ�',2580)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D810BE0C-4CB4-4EDA-ACBA-CEB1C688CD8C','99431E70-833A-464D-8066-E41E230646DA','ÿ��ʹ�ý����󣬱��뽫�����豸һ���ͻأ�ʮ��ָ��ר�˸��𱣹ܣ�',2590)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CBE6CBA9-7DC4-419C-815F-F1EA34A5DD57','99431E70-833A-464D-8066-E41E230646DA','�����Ƿ�ʵ��˫��˫���ƣ����ε��ˣ�ͬʱ���÷��𡢷�������й©������',2600)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('341A5209-26F2-4285-ADD8-07D945939343','99431E70-833A-464D-8066-E41E230646DA','���泡���Ƿ������ԵĹ��ʷ����Ա�־��',2610)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C5E943B0-78A7-4328-BEE4-7D2312EB43CE','99431E70-833A-464D-8066-E41E230646DA','���桢��ȡ��ʹ�á��黹�Ƿ�ʹ�õ�λ����HSE�����š��豸���ź�ʵ���������������',2620)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0FC81248-816B-4DD0-A3DF-02D5F32BD050','99431E70-833A-464D-8066-E41E230646DA','������̽��һ�����ַ���Դʧ�ع��ϣ��Ƿ��ȡ�������ȴ�ʩ��',2630)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('79BE2EF1-E5EE-40FB-9D32-BB5A19C81A40','77205883-AE5F-4047-8241-6922A2CCE6C4','�Ƿ�������޿ռ���ҵʩ����ȫ������������������',2640)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('483E77F6-B415-470F-A283-B2D30345ABDE','77205883-AE5F-4047-8241-6922A2CCE6C4','��ҵǰ�Ƿ��ɼ�����Ա�����޿ռ���ҵ��Ա���а�ȫ�������ף�',2650)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('34D946F0-5ABB-415F-95AA-BC435783AEA4','77205883-AE5F-4047-8241-6922A2CCE6C4','��ҵǰ�Ƿ��ɼ�����Ա�����޿ռ���ҵ��Ա���а�ȫ�������ף�',2660)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F2CC8471-61D0-4CDF-8CD9-3E7A2D94E9BD','77205883-AE5F-4047-8241-6922A2CCE6C4','��ȫ���������Ƿ����ü�¼��',2670)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5D6B4418-9FAF-4728-9484-C824756AEC5E','77205883-AE5F-4047-8241-6922A2CCE6C4','���ܽ��׵�ʩ����Ա�Ƿ��ڼ�¼��ǩ�֣�',2680)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A828A009-89C8-4157-ADB8-88DEE2273E2D','77205883-AE5F-4047-8241-6922A2CCE6C4','�����豸��װ�á��������ӵ�������ǰ�Ƿ�����к����ʶ��ԡ���ȼ�ԡ���ը�ԡ���ʴ�Լ�������',2690)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A91C5F65-4C58-4CEE-92CD-951BDB77CDAF','77205883-AE5F-4047-8241-6922A2CCE6C4','�Ƿ񾭼���ϸ񣬰�����ص���ҵƱ֤�󷽿ɽ����豸��װ�á��������ӵ���������ҵ��',2700)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('389B5744-CE21-493A-AB36-E5020E6E5C9B','77205883-AE5F-4047-8241-6922A2CCE6C4','���޿ռ�֮�����װǰ�Ƿ�������ص�װ�',2710)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('98E70408-041F-4F7C-A636-69583787575E','77205883-AE5F-4047-8241-6922A2CCE6C4','���޿ռ�֮������ҵǰ�Ƿ��������ҵ���֤��',2720)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('897E8E7A-0113-4B81-9ED0-0F7505D32B46','77205883-AE5F-4047-8241-6922A2CCE6C4','���޿ռ�֮�ڹ���������ҵǰ�Ƿ��������ҵ���֤��',2730)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('124DAF9A-9479-450C-AEF9-FD58EB622872','77205883-AE5F-4047-8241-6922A2CCE6C4','���޿ռ�֮�Ǹ���ҵǰ�Ƿ����ߴ���ҵ���֤�',2740)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B9B69AEA-A04E-4447-8A86-B3F6F0D02B4E','77205883-AE5F-4047-8241-6922A2CCE6C4','���޿ռ�֮������ҵǰ�Ƿ����������ҵ���֤��',2750)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('58B95955-6A8C-41F5-920E-50ECA4C30138','77205883-AE5F-4047-8241-6922A2CCE6C4','��ҵ��Ա�Ƿ���ȷ�����Ҫ���Ͷ�������Ʒ��',2760)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CA779737-EE85-445A-9EB4-46EC55DB1BE6','77205883-AE5F-4047-8241-6922A2CCE6C4','��ҵʱ���ֳ��Ƿ���ר�˸���໤��',2770)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D3E9F211-FC8C-4025-A6AC-6F5ED1FC6832','77205883-AE5F-4047-8241-6922A2CCE6C4','�����У��������Ƿ��ϸ����ر����ֵİ�ȫ������̣�',2780)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('928EE1A2-240D-4284-B2CB-E69ABA940F43','77205883-AE5F-4047-8241-6922A2CCE6C4','�����У��Ƿ����Υ��ָ�ӡ�Υ����ҵ��',2790)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A31E31DD-C24E-45D9-82D9-D04EB5DE1853','77205883-AE5F-4047-8241-6922A2CCE6C4','�ֳ�HSE��Ա�Ƿ񲻼�Ͻ����ֳ���ȫѲ�죬�������⼰ʱ����',2800)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B2182A60-2953-45EB-A523-69230EEC7793','77205883-AE5F-4047-8241-6922A2CCE6C4','�๤�ֻ�Ͻ�����ҵ���Ƿ��ֿ��Ǹ����ּ���໥Ӱ�켰��Ǳ�ڵ�Σ�ա�',2810)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('447F7482-3DEE-462F-B6E0-49DC11680FCF','8DC2F97B-CB4F-4848-B528-6A8155C26771','����ƿ�Ƿ�����Ȳ��ƿͬ�����䣻',2820)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B06E7898-D14A-4405-9196-FE840D26EACD','8DC2F97B-CB4F-4848-B528-6A8155C26771','��ƿװ��ǰ�Ƿ���÷���ñ�ͷ���Ȧ��',2830)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('070AD806-77AC-4F59-9755-ACBE2B30DB75','8DC2F97B-CB4F-4848-B528-6A8155C26771','���е����䳵���Ƿ����иɷ�������� ',2840)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1B2B77D4-64DC-4596-83FD-53CF82113D1C','8DC2F97B-CB4F-4848-B528-6A8155C26771','�˻���ƿ���Ƿ�����ж����',2850)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('877E724D-5666-4B1A-8CF0-B0D9DA2BEE86','8DC2F97B-CB4F-4848-B528-6A8155C26771','��ƿ�Ƿ�����ר�òֿ����档Ӧʹ����դ������������',2860)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5E0BFB3A-B8F8-4ECB-8737-B41FD8F1D81B','8DC2F97B-CB4F-4848-B528-6A8155C26771','��ƿר������ֿ��Ƿ�ʹ����դ������������',2870)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0467F788-D51F-4B43-95B9-3179224A21F4','8DC2F97B-CB4F-4848-B528-6A8155C26771','��ƿ�ѷŴ��Ƿ���������',2880)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('253E60E1-66F0-4BAC-8E36-913472C03F9B','8DC2F97B-CB4F-4848-B528-6A8155C26771','����ƿ������Ȳƿ����ȼ��ƿ������Ƿ����10�ף�',2890)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('45BCE2BB-2971-403E-A20A-5F5CD3B0339C','8DC2F97B-CB4F-4848-B528-6A8155C26771','ʹ����ƿ�Ĺ����Ƿ���ѵ���˺ϸ񣬳�֤�ϸڣ�',2900)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D9107273-5C07-4AA4-B2D5-9E3287558B35','8DC2F97B-CB4F-4848-B528-6A8155C26771','��ƿʹ��ǰ�Ƿ���а�ȫ״����飬��ʢװ�������ȷ�ϣ� ',2910)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7E5902A2-BEB6-4178-A12B-65932CB8FF46','8DC2F97B-CB4F-4848-B528-6A8155C26771','��ƿ�Ƿ����ţ�',2920)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('95F0F40D-7140-4BF0-AA79-17E1B55B39F5','8DC2F97B-CB4F-4848-B528-6A8155C26771','ƿ�����岻���þ����Ƿ����в�С��0.05MPa��ʣ��ѹ����',2930)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D68829C8-F622-4179-8A0A-28AED0BF4B18','8DC2F97B-CB4F-4848-B528-6A8155C26771','��Ȳƿ�Ƿ������ȹ̣�',2940)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5ACC74FC-0162-4958-A152-4BA9DB77E9EF','8DC2F97B-CB4F-4848-B528-6A8155C26771','��Ȳƿ�Ƿ�װʹ���������',2950)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7BD9098F-0FBE-4A3D-BE51-7EFDD36448C3','8DC2F97B-CB4F-4848-B528-6A8155C26771','��ƿʹ����Ա�Ƿ��ϸ�ִ���������ȫ������̣�',2960)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D2A550C0-07DF-427D-A7EB-E77594710A7E','8DC2F97B-CB4F-4848-B528-6A8155C26771','��ƿʹ����Ա�Ƿ��ȡ��ʩԤ���ػ�',2970)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CD767E03-A2C9-4DBB-A4C5-94B4E71A4447','C9288081-8BD3-4949-A9C6-6320F827D35B','ʹ�õ�λʹ��Σ����Ʒʱ���Ƿ���дΣ����Ʒ���뵥��',2980)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F8F2D562-79CB-462B-BAA5-DB309C15DEA0','C9288081-8BD3-4949-A9C6-6320F827D35B','�ɹ������ڽӵ�Σ����Ʒ���뵥���Ƿ�����������ˣ�',2990)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('52736519-2AC6-4002-9DF9-C84FF1A06FF8','C9288081-8BD3-4949-A9C6-6320F827D35B','�ɹ������ڽӵ�Σ����Ʒ���뵥���Ƿ���дΣ����Ʒ���ٵ���',3000)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A432604A-1366-4D1F-9876-8A5A6E93BB25','C9288081-8BD3-4949-A9C6-6320F827D35B','Σ����Ʒ���͵��ֳ�ʱ���Ƿ���Σ����Ʒ���ٵ���',3010)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('31360DFE-31E4-47DE-9380-1A62D3A7E606','C9288081-8BD3-4949-A9C6-6320F827D35B','Σ����Ʒ�����䲿���Ƿ�����ʹ�Ӧ����ǩ֤�����뵥��������ͬ�����������ʹ�õع������ذ������������',3020)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('431C0905-074D-42CC-8F03-BECA772F047D','C9288081-8BD3-4949-A9C6-6320F827D35B','Σ����Ʒ�Ƿ���ר��Ѻ�˺�װж��',3030)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1C5779BC-ED1F-439D-8DC5-EB47A5757B10','C9288081-8BD3-4949-A9C6-6320F827D35B','Ѻ�ˡ�װж��Ա�Ƿ񾭹���ѵ��������Ѻ�ˡ�װжΣ����Ʒ�����ʡ�Σ���Ȱ�ȫ��ʶ��',3040)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BE56D3F0-D769-475D-B6B9-9CCC0FE60C20','C9288081-8BD3-4949-A9C6-6320F827D35B','װжʱ�Ƿ�������ţ�װ�����ܹ��ߣ�Ҫ�������Σ�',3050)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B60B101D-E9E1-4B3E-B2D7-B5071A27D1EC','C9288081-8BD3-4949-A9C6-6320F827D35B','����ҹ��װжʱ���Ƿ��г�ֿɿ���������',3060)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('58E42E05-DE77-4A9A-96B0-E47772B5754E','C9288081-8BD3-4949-A9C6-6320F827D35B','ר�����䳵���Ƿ񱣳����ó������������䣻',3070)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E8C72140-E34C-4CFC-A959-D86CB12BB3E6','C9288081-8BD3-4949-A9C6-6320F827D35B','ר�����䳵���Ƿ��������ҡ�Σ�ա���ʶ��',3080)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7CFBEEA8-9296-4548-9526-41B07626E585','C9288081-8BD3-4949-A9C6-6320F827D35B','Σ����Ʒ���ǰ���Ƿ������������գ�',3090)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A815225F-ABB5-46A6-A5C6-F5FBDA86CF24','C9288081-8BD3-4949-A9C6-6320F827D35B','Σ����Ʒ�Ƿ������봢�棻',3100)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0C61CD00-547D-4D10-BBC4-36F6D564427D','C9288081-8BD3-4949-A9C6-6320F827D35B','�Ƿ񾭳����Σ����Ʒ���������ܺ���̬�����ü�¼����ȡ��Ӧ��ʩ����ֹΣ����Ʒ�����½��������¹ʣ�',3110)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('54D12F64-E33B-4CF5-BB76-C45940FF7224','C9288081-8BD3-4949-A9C6-6320F827D35B','���������ʵĴ��棬�Ƿ񰴹����йع涨��ǿ��������ʵ��˫�ˡ�˫�����ܣ��ϸ����ر����ƶȣ������ð�ȫ����������',3120)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9FD6FC0D-8707-49D3-84AF-109C1D603647','C9288081-8BD3-4949-A9C6-6320F827D35B','����Σ����Ʒ�Ŀⷿ���Ƿ�ע�⼾����Ԥ����',3130)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B4A7F1A8-D231-40AF-9C56-5BBA354585C5','C9288081-8BD3-4949-A9C6-6320F827D35B','��ҵ��Ա��ʹ��Σ����Ʒǰ���Ƿ����Σ����Ʒ��ʹ�����֤��',3140)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('99AFBC33-60EF-473E-B492-D75BA5049874','C9288081-8BD3-4949-A9C6-6320F827D35B','���֤ǩ����Ա�Ƿ����Σ����Ʒ���ٵ��е��й�Ҫ������������м��ȷ�ϣ�',3150)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D6B2463B-2FF3-400F-9AF7-C851CB1C3916','C9288081-8BD3-4949-A9C6-6320F827D35B','��ʹ��Σ���Խϴ��Σ����Ʒ�ĵط����Ƿ�����Ŀλ�����þ�ʾ��־��Χ�辯ʾ����',3160)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('70A9E544-0001-41AA-945F-C5E0DD2E76A1','C9288081-8BD3-4949-A9C6-6320F827D35B','�������¹�ʱ���Ƿ�������֯ʵʩӦ����ʩ��ʹ�¹���ʧ���͵���С�̶ȣ�',3170)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8A5FA335-DDE3-4FBD-B285-C4909BB48D40','C9288081-8BD3-4949-A9C6-6320F827D35B','Σ����Ʒ����ҵ���Ƿ񰴹涨���Ʊ��ܣ�',3180)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9518E65A-C31B-4468-8AD4-FB22B83EB9C3','C9288081-8BD3-4949-A9C6-6320F827D35B','������Σ����Ʒ�Ƿ����Դ���',3190)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('04E95DBB-9DFC-45CB-B94B-976AFBD84634','C9288081-8BD3-4949-A9C6-6320F827D35B','������Σ����Ʒ���������Դ����Ƿ����йز����Ͽɵ����ʸ�λ���д��� ',3200)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('67FEF797-02EC-484D-9B31-DD9A632161F0','C9288081-8BD3-4949-A9C6-6320F827D35B','Σ����Ʒ�Ĵ��桢���ĺͷ��������Ƿ���Σ����Ʒʹ�ø���������˶Ժͼ�¼��Σ����Ʒ�嵥�ϣ�����HSE���ܲ��ţ�',3210)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('973780F4-DA83-4E28-8D3C-6F498004D931','10A8AF77-8103-422D-AE72-FAEB058C4770','�����豸���й涨��ʹ��ǰ���������ڵء��мල��������ȡ�������豸׼��֤�ߣ�ʹ�õ�λ�Ƿ�����ȡ֤��',3220)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('974B0C09-55AD-4744-8239-E01F6BCFDDCB','10A8AF77-8103-422D-AE72-FAEB058C4770','�����豸�Ƿ񾭵ء����Ͷ����ż���ϸ�',3230)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('81AE9631-941B-4882-AB97-66F99355B98C','10A8AF77-8103-422D-AE72-FAEB058C4770','������Ա�Ƿ�����Ͷ����ſ��˺�ǩ���İ�ȫ����֤��',3240)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('009DEEEF-6784-4F0F-B74D-4D4D5140476D','10A8AF77-8103-422D-AE72-FAEB058C4770','�Ƿ�����ȫ��ȫ��������ƶȺͰ�ȫ������̣�',3250)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FCA30BB2-E290-40DE-A80A-CE76BEF8EE60','10A8AF77-8103-422D-AE72-FAEB058C4770','��������豸�����ܲ����Ƿ�浵�豸���������ļ���',3260)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D34F0163-C957-4022-920A-F7F1FF4C3BE8','10A8AF77-8103-422D-AE72-FAEB058C4770','��������豸�����ܲ����Ƿ�浵ʹ�á�ά�������������������¼��',3270)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5F5C112E-1339-4CDF-ABD1-4312C491E672','10A8AF77-8103-422D-AE72-FAEB058C4770','��������豸�����ܲ����Ƿ�浵�豸�������¹ʼ�¼��',3280)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('73221886-3511-4B2D-9791-7B13D24C1D29','10A8AF77-8103-422D-AE72-FAEB058C4770','��������豸�����ܲ����Ƿ�浵��װ�������¼���������ϣ�',3290)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FF9AE840-E6E0-4202-8127-997E6A55A174','10A8AF77-8103-422D-AE72-FAEB058C4770','ÿ��ʹ��ǰ�Ƿ��������λ����װ�á��ƶ������������Լ����������������ء���������װ�á��������İ�ȫ���İ�ȫ���ܵȣ�',3300)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6F8C577C-79A7-4F27-9380-26253B8CFD5A','10A8AF77-8103-422D-AE72-FAEB058C4770','ÿ��ʹ��ǰ�Ƿ����������̼��İ�ȫ״����',3310)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7B6DFC2D-2220-45E4-BC64-AEAF6A6638A1','10A8AF77-8103-422D-AE72-FAEB058C4770','ÿ��ʹ��ǰ�Ƿ����˿���İ�ȫ״����',3320)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('734C08F9-3308-4A01-B8FD-1F686A27CC41','10A8AF77-8103-422D-AE72-FAEB058C4770','ÿ��ʹ��ǰ�Ƿ��鰲ȫ����װ�õİ�ȫ���ܵȣ�',3330)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B8F2403C-A48A-41FE-BC6E-D89C6DB38616','10A8AF77-8103-422D-AE72-FAEB058C4770','���ػ�е�͵綯��«�Ƿ������༫��λ���������ͳ�����������',3340)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('649B8CE7-65D8-40B4-8D35-38046D18D2D1','10A8AF77-8103-422D-AE72-FAEB058C4770','���ػ�е�͵綯��«�Ƿ�������ָʾ����',3350)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EDBB4D8A-58D2-4C78-9685-C413C048D0E7','10A8AF77-8103-422D-AE72-FAEB058C4770','���ػ�е�͵綯��«�Ƿ����ê��װ�á����㷭��ȫ����',3360)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A947472D-A331-4084-A74D-4E60AB2A1A17','10A8AF77-8103-422D-AE72-FAEB058C4770','���ػ�е�͵綯��«�Ƿ�����ֹ���ۺ���װ�ã�',3370)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C5356402-9051-4766-97A6-7DF34ABBC8DF','10A8AF77-8103-422D-AE72-FAEB058C4770','���ػ�е�͵綯��«�Ƿ���黺�����ͼй�ǯ��',3380)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7764B1D7-1B01-433E-A496-3A08FC2CE4C3','10A8AF77-8103-422D-AE72-FAEB058C4770','���ݺ��������Ƿ���鳬�ر���װ�ã�',3390)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('846DA683-FFC0-4023-933C-26F9795DCD96','10A8AF77-8103-422D-AE72-FAEB058C4770','���ݺ��������Ƿ���鹩��ϵͳ��λ�ʹ��ౣ��װ�ã�',3400)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E388F2FD-8407-44FF-94A1-51D35D95D614','10A8AF77-8103-422D-AE72-FAEB058C4770','���ݺ��������Ƿ����ײ�׻���װ�á���Խ�ϡ��¼��޹���λ��ʱ�ı���װ�ã�',3410)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('90F0B890-AE84-47D7-8014-CE41BC6550C4','10A8AF77-8103-422D-AE72-FAEB058C4770','���ݺ��������Ƿ�����ֹ���ػ��������װ�ã�',3420)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A9D7DB36-F8AE-4073-8193-885ABF07D520','10A8AF77-8103-422D-AE72-FAEB058C4770','���ݺ��������Ƿ����ͣ������ϵͳ��������ʱ���������ƶ�װ�ü���ȫ��ֹͣװ�ã�',3430)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9EC96748-DE84-4362-9B00-976E8F0C6E1F','10A8AF77-8103-422D-AE72-FAEB058C4770','���ݺ��������Ƿ�����������װ�ã�',3440)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8671B9A9-4A1C-45D1-A4A7-7F1E14E4A497','10A8AF77-8103-422D-AE72-FAEB058C4770','ͣ��һ�����ϵ������豸�Ƿ����¼����飻',3450)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2DF5B53E-6179-40D8-80B9-73BA09165C74','10A8AF77-8103-422D-AE72-FAEB058C4770','�������޺͸���������豸�Ƿ����¼����飻',3460)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DF47319E-4910-4B70-8B2E-C7C64517EA00','10A8AF77-8103-422D-AE72-FAEB058C4770','�������ش��¹ʵ������豸�Ƿ����¼����飻',3470)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DF8400D6-EA46-4ACD-A134-D17D8C3F247C','10A8AF77-8103-422D-AE72-FAEB058C4770','����4�����ϵ����������豸�Ƿ����¼����飻',3480)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3ACAA79F-6A7E-4A39-AD47-79599A948E4A','10A8AF77-8103-422D-AE72-FAEB058C4770','¶����ҵ�����ػ�����9�����ϴ��ģ��Ƿ����¼����飻',3490)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9E039563-9447-4F84-8100-EDB23DBB92EA','B8940917-27F4-438A-BA8E-744B54691F09','�����Ƿ�������󣬲��ϸ����Ͻ�ʹ�ã�',3500)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('228A9F70-CC21-44DA-BA16-09AF8993023E','B8940917-27F4-438A-BA8E-744B54691F09','�Ƿ��鳵���������״̬���Ͻ�����������',3510)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FD150890-1CC1-4691-8600-6212D16B8020','B8940917-27F4-438A-BA8E-744B54691F09','�Ƿ񷢶��������������ã���תƽ�ȡ����������죬�����ȶ�������ѹ�����������ʲ����ڶ���ʵ�75%��',3520)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C7DA0B86-9A18-45EF-99F0-C0A1D1D30E73','B8940917-27F4-438A-BA8E-744B54691F09','�Ƿ�ת��ϵ������Ӧת����������㣬���������󣬳���ת������λ��ʱ�����������������и�������',3530)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C70F42A8-D175-480A-944E-8181B26B728F','B8940917-27F4-438A-BA8E-744B54691F09','�Ƿ��ƶ�ϵͳ��Ч���ƶ���ƽ�⣬��ʻϵͳ������ϵͳ�������Ǳ��ź�װ�÷����йر�׼Ҫ��',3540)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('42919F64-C4BF-4438-B846-0D365429912F','B8940917-27F4-438A-BA8E-744B54691F09','�����Ƿ��䱸һ�����������������Ӧ����������Ч״̬��',3550)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2774BCCD-831A-4F82-B0CF-B7F490DF784D','B8940917-27F4-438A-BA8E-744B54691F09','�����ŷź������Ƿ���Ϲ��ұ�׼Ҫ��',3560)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9E6F1975-7DED-47B0-9C89-AFDD866C0EF3','B8940917-27F4-438A-BA8E-744B54691F09','��ʻԱ�Ƿ���г�����ʻ֤����Ŀ�ڲ�������ʻ�ϸ�֤���׼���ʻ������',3570)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('33D83FE1-F31D-432D-8D00-CBC935ABCFA4','B8940917-27F4-438A-BA8E-744B54691F09','��ʻ����ʱ�Ƿ�Я����ʻ֤����ʻ֤��',3580)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2A4689C3-49E4-4A83-AA58-922D592D0FFB','B8940917-27F4-438A-BA8E-744B54691F09','��ʻ����ʱ�Ƿ���ȷʹ���Ͷ�������Ʒ��',3590)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E6E4746D-420B-40CF-A8D7-56A7BAA1DFE6','B8940917-27F4-438A-BA8E-744B54691F09','�Ƿ��ʻ��ִ�ղ����ϵĳ�����',3600)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EA19A74D-1576-42A4-B474-A9D196DA909A','B8940917-27F4-438A-BA8E-744B54691F09','�Ƿ�ƺ�ݳ���',3610)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E7A38368-BE56-46A7-B063-79E298290D42','B8940917-27F4-438A-BA8E-744B54691F09','�Ƿ�����ʻ�����̡���ʳ����̸���������а��г���ȫ�Ļ��',3620)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6E5F61FF-A930-48CC-AF95-F110F66AF6C2','B8940917-27F4-438A-BA8E-744B54691F09','�������ƣ�ͻ��м����а��г���ȫʱ���Ƿ��ʻ������',3630)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C68F4C85-BF15-4299-A6CF-266AC87DFEF6','B8940917-27F4-438A-BA8E-744B54691F09','��ʻԱӦ������ʻ��ȷ����ȫ���Ƿ񳬶����ˣ�',3640)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CC720FD7-51C7-4ADB-AF8B-F80EF7013EFF','B8940917-27F4-438A-BA8E-744B54691F09','����ǰ�Ƿ����á������������������˳�������·�ߺͰ�ȫ��ʩ��',3650)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('477D95D3-0D42-49B5-8558-FB3E0058A75D','B8940917-27F4-438A-BA8E-744B54691F09','���������Ƿ��������֤����',3660)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('030622CB-91CC-4759-B7FB-6444C488F111','B8940917-27F4-438A-BA8E-744B54691F09','�г�ǰ��鳵���ĵƹ��Ƿ����Ҫ�󣬳����й��ϲ����г���',3670)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0BB0DDE3-03EB-456B-AEDD-E1D8D1C116EC','B8940917-27F4-438A-BA8E-744B54691F09','ҹ���Ƿ�����г���',3680)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4643C2EE-BB2A-4EC2-A29F-8C021C85748F','B8940917-27F4-438A-BA8E-744B54691F09','�ᳵ�Ƿ���150m����ر�Զ���ƣ�������ơ�С�ƣ������٣�',3690)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7C3902D6-21C4-48F8-810D-0477397311A8','B8940917-27F4-438A-BA8E-744B54691F09','ҹ�䳬��ʱ���Ƿ�任��Զ�ƹ⣬��ת�����ʾ�⣻',3700)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0074CF6C-3965-40A4-BAA6-2AAAF8A916D1','B8940917-27F4-438A-BA8E-744B54691F09','ҹ����ʱͣ���Ƿ�·�ұߣ�����С�ơ�β�ƺ����յƣ���ֹ�����������������ң�',3710)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C06786E5-E344-46FA-9903-0C565D0B4235','B8940917-27F4-438A-BA8E-744B54691F09','��ѩ���г��Ƿ�֤�������������������ʹ������·�ܳ���©�磻',3720)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C7AB9C4F-6A5D-41A1-B59B-45994D3385D7','B8940917-27F4-438A-BA8E-744B54691F09','��ѩ���г��Ƿ��ر�ע�����˺�����������Ҫ������ʻ����ֹ�򻬣�',3730)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1A9DD590-13E2-4BD0-87B1-92619D939A77','B8940917-27F4-438A-BA8E-744B54691F09','����ʱ���Ƿ�򿪷���ƣ�������ʻ����ע�Ᵽ�ֳ��࣬������ʱ��Ҫֹͣ�г���',3740)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F3D558AA-715F-4BC8-98A7-49390CE4EA22','B8940917-27F4-438A-BA8E-744B54691F09','�ꡢѩ���������г����Ƿ���ǰ������һ���ľ��룬���������ƶ�����ֹ���кͼ�����',3750)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('52CAC3B8-A53B-4DE5-BBA3-BE8DD8C5D73C','B8940917-27F4-438A-BA8E-744B54691F09','�����¹�ʱ����ʻԱ�ͳ˿ͣ��Ƿ�ʵʩ�ԾȻ��ȣ�',3760)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('73267DFE-D425-424D-A21B-BEAA654FD973','E6635238-4A3D-4101-B8E2-8356CBF046C2','�Ƿ�����ȫ�ֳ���������������������磻',3770)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EE3D6367-FB74-473E-9405-97332FC637DF','E6635238-4A3D-4101-B8E2-8356CBF046C2','�Ƿ���ר���棩ְ��Ա����ʩ���ֳ��Ĺ���ͼල��',3780)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('87012A60-B752-4E8A-8292-E3715DB97A1D','E6635238-4A3D-4101-B8E2-8356CBF046C2','�Ƿ��ƶ�����λ������������취��ʵʩϸ��',3790)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5C5D4FFC-389C-4C52-ADDF-7646CF631A24','E6635238-4A3D-4101-B8E2-8356CBF046C2','�Ƿ�����ȫ���ֱ����ƶȣ����û���ͳ�ƹ�����',3800)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('24B6DA4F-9A0E-4619-8FD1-456535BC059B','E6635238-4A3D-4101-B8E2-8356CBF046C2','�Ƿ����û�������������������������',3810)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C0E4BACF-7A6D-45D4-96CF-F59D8C20E932','E6635238-4A3D-4101-B8E2-8356CBF046C2','��ҵ�ֳ���Ϣ�ҡ����߷����豸�����ģ��Ƿ�ʩ����ƽ��ͼ����Ҫ�󣬰ڷ��������򣬸��ֱ�־����ʶ��ȷ��Ŀ��',3820)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E7877ADD-2364-4DB4-A879-582B4EA7FFD6','E6635238-4A3D-4101-B8E2-8356CBF046C2','�ֳ���·�Ƿ�ƽ��ͨ�����õ���·���÷���Ҫ��ˮԴ���ú�����ˮӦͨ�����裻',3830)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('584BD139-03F8-4050-99FD-FBAC625ED459','E6635238-4A3D-4101-B8E2-8356CBF046C2','�ж��к���Ʒ����ȼ�ױ���Ʒ���Ƿ���ר�òֿⱣ�ܣ�����ҵ�ֳ���ʱ����ʱ��Ӧ�辯ʾ��ʶ�ƣ���ҪʱӦ��ר�˿�����',3840)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E4EBF6C2-9477-4381-8B18-9AEDE0E4901D','E6635238-4A3D-4101-B8E2-8356CBF046C2','�ж��к���Ʒ����ȼ�ױ���Ʒ������ҵ�ֳ���ʱ����ʱ���Ƿ��辯ʾ��ʶ�ƣ���Ҫʱ��ר�˿�����',3850)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('98018D10-8DF7-4355-8B26-92F77C78A477','E6635238-4A3D-4101-B8E2-8356CBF046C2','�Ƿ���������������ڴ�ţ����ͼ�ʱ���ռ��д��棬�Ͻ��͵��㵹�����϶Ե��������ȾʱӦ��ȡ��ʩ��������',3860)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('607C3D85-B046-4B31-BE38-B04307BF6648','E6635238-4A3D-4101-B8E2-8356CBF046C2','�������������ᡢ���ޡ���Ե֬���ײ����۳��Ĳ��ϵ��Ƿ����Ʊ��ܣ�',3870)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6931DA98-25EE-4F05-AD75-3482C3B0A0EF','E6635238-4A3D-4101-B8E2-8356CBF046C2','�������������ᡢ���ޡ���Ե֬���ײ����۳��Ĳ��ϵȶ��ֳ��������ʩ�����Ⱦʱ�Ƿ�ʱ����',3880)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FCF9625C-CBF2-49DC-8D8A-7F41954D9CCE','E6635238-4A3D-4101-B8E2-8356CBF046C2','��ҵ�ֳ��Ƿ񾭳���ɨ��������࣬����Ӧ���жѷŲ���ʱ����������ָ���ص㣻',3890)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BC87C434-24B2-433F-A1C3-EAB6EBD7AA7D','E6635238-4A3D-4101-B8E2-8356CBF046C2','���������������Ƿ�Զ���ж��к������������߼����ҵ������',3900)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5B77B35C-CE6E-48FB-BE6D-1EF7C19F3DB1','E6635238-4A3D-4101-B8E2-8356CBF046C2','�������������ڵĵ�·�Ƿ�ƽ̹ͨ�������㹻��������ʩ��',3910)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DF02D437-BE27-45FE-9855-E2D84291456D','E6635238-4A3D-4101-B8E2-8356CBF046C2','���������Ƿ�ʱ���������涨����Զ����������ָ���ص㣻',3920)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BF5BDA83-73A3-44B4-91DC-4F92AB3908E1','E6635238-4A3D-4101-B8E2-8356CBF046C2','���������Ƿ�Զ����ʳ����������ͨ�����ã�',3930)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B64A052E-8353-407A-8F90-98D58ED37B64','E6635238-4A3D-4101-B8E2-8356CBF046C2','������ˮ�Ƿ����ùܵ����ŷ����涨������',3940)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BA4FB38F-D853-401F-8928-8EC5C9C17D85','E6635238-4A3D-4101-B8E2-8356CBF046C2','���ֽ�����ʩ�����������������ȣ��Ƿ��㵹��ָ���ص㣻',3950)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6EB3AE26-F439-4E00-AB2E-181FFC7751BE','E6635238-4A3D-4101-B8E2-8356CBF046C2','���͸��ֽ�����ʩ���������������������Ƿ��з������Ĵ�ʩ��',3960)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('84738CA6-28A2-4698-846C-2AC3C682A4B1','E6635238-4A3D-4101-B8E2-8356CBF046C2','ʩ����������ˮ�Ƿ��ŷŵ�ָ������ˮ���ڣ���Ӧ���Ϲ�����ˮ�ŷű�׼��',3970)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E219B0C8-C783-4EF3-A1AA-F2DA1C478A08','E6635238-4A3D-4101-B8E2-8356CBF046C2','���ܶ���Χ�ⲿ��������ƻ���Ӱ���ʩ���������������⡢�񶯡����ߡ��۳����������ȾԴ�Ƿ��ȡ��Ӧ�ı�����ʩ��',3980)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('ACDADF07-24B1-4649-9C37-2B3BD6BEBA92','E6635238-4A3D-4101-B8E2-8356CBF046C2','ʩ�������������������нӴ����Ļ�ѧΣ��Ʒ�Ĵ����Ƿ����ݡ�Σ����Ʒ����涨��ִ�У�',3990)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2317A213-EF21-4AC2-8AF9-9107D3135A72','E6635238-4A3D-4101-B8E2-8356CBF046C2','ʩ�������������Ƿ�ע��Է��ֵĸ�������ı���������ʱ�������ﱣ�����ţ�',4000)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8B54BD91-93E1-4827-B5B1-ED819640FE89','E6635238-4A3D-4101-B8E2-8356CBF046C2','������ˮ����㣬������ش�����Ƿ�����֯�ŷŵ����ػ�������ָ���Ĺ�����ӵ��',4010)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9D8666AC-1440-444E-B5E9-60901BA13D19','E6635238-4A3D-4101-B8E2-8356CBF046C2','������Ƿ��ڽ�����������������������',4020)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E83E12DA-EBD8-4487-874B-A33AF5A1304C','E6635238-4A3D-4101-B8E2-8356CBF046C2','���������Ƿ���ר�˸������ռ�����������ߣ�',4030)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3F79EF0D-3C29-4267-B8D2-1A3F879EE0BA','E6635238-4A3D-4101-B8E2-8356CBF046C2','���������ĳ������Ƿ�Ӹǡ��ܷ⣬��ֹ;�����䣬��ɻ�����Ⱦ��',4040)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3A357EB1-6494-460A-9DE1-0D0C2ADDCB52','E6635238-4A3D-4101-B8E2-8356CBF046C2','�������Ƿ�������ҩ��ɱ���Ӭ������ȣ�',4050)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B1986C0E-37D4-4210-8511-79059933E4D6','E6635238-4A3D-4101-B8E2-8356CBF046C2','�����¯�ų��ķ������Ƿ�ﵽ���ҹ涨�����ŷŵı�׼�����򣬱����������',4060)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('35B89224-3561-4EBC-80CF-EC863B26EF07','E6635238-4A3D-4101-B8E2-8356CBF046C2','�Ƿ������ϵ��ػ������ž����Լල�Ͷ��ڳ�顢��⡣',4070)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DD2867C5-E587-4270-BCE4-0B0BC978D0F9','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ�������ʵ�ʣ��ƶ�ְ��������ѵ�����ƻ������ȫԱ������ʶ��',4080)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('65AC23FB-EC24-489B-B326-B1281B63981E','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ը�����Ա����HSE֪ʶ����ʱ���Ƿ�����Ӧ��������ȫ֪ʶ���ݣ�',4090)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('AA461D90-D445-405C-9C2E-D80F3DB68023','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ������𵵰���',4100)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('77E14C20-A222-4CE4-A8D4-6DE2BAA9195D','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ����÷����־��',4110)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4980BB91-E7B7-4F4B-88DB-B65405D3CE5B','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ�ȷ������Σ��Դ���㣩��ʵ���ϸ�Ĺ���',4120)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('67838BB1-D260-49C9-9A73-FA3AEEEF16F1','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ�ʵ�з���Ѳ�죬����Ѳ���¼��',4130)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8DB511AB-7790-4C7F-ACDD-25DBC8A81DEB','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ��ƶ�����Ӧ����ɢԤ����',4140)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8EC16597-B071-4A93-B3FD-8E32AA64E0F9','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ�����֯����������',4150)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EF2770B7-B79B-401A-AF9C-EEA83E640450','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ��κε�λ�����˲����𻵻�������ʹ�á������ͣ��������ʩ�����ģ�������ѹ��Ȧռ����˨��',4160)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('27547867-E33E-4044-A1D0-F2C38635AA30','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ�ռ�÷����ࣻ ',4170)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0C9F8839-E3B4-4CD1-A2FA-C1306580D372','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ��������ͨ����',4180)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('94F55EB1-4653-47FC-80D5-D18B6AF13990','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�ƶ�ʽ������������Ƿ�������ƹ淶��ʩ���ֳ�ʵ����Ҫ�����к������ã�',4190)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C7EF79BD-0795-47FE-9709-F8F205897585','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','���ĵİڷ�λ���Ƿ�������־����������Ų�ã�',4200)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D3CF500A-3D84-4677-A60A-F5BDC6D2EAF8','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ��ո����ƶ�ʽ�������ĵ�ʹ�ü�����Ҫ�󣬰��ڼ�顢��װҩ����',4210)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('91B69EEB-608E-403C-93D2-BA677565FE1B','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�����ƶ�ʽ����������ģ��Ƿ���Ʊ�����װ�ͼ��ҩ�����ڣ�����ר�˸���ά��������',4220)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('07E13966-8560-4A11-B04E-24BEE081B1FC','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','������㲿���Ƿ���ã�����Ǧ��ɿ���',4230)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('ADF2FB16-F38C-4CC2-8402-EC3D214E0B1A','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ�����ȫ������ʩ�����Ĺ���̨�ʣ�',4240)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9101E9C4-1AEF-4566-85A7-D9CE9D10EC48','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','�Ƿ���ʵ��¼������ʩ���ճ�����ͼ�������',4250)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EFE497D7-C2B6-4AF8-91ED-530E7B6C224D','B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','�Ƿ�����ȫ����ĿHSE��֯����',4260)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B1989595-91A5-47F3-8B7F-AC3B96B7B383','B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','�Ƿ�����ȫ����ĿHSE������ϵ',4270)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('AE42E8DE-9795-4204-840A-D049DE1F49F7','B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','��ĿHSE��֯������������ϵ�����Ƿ񾭹�����',4280)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6A7E24FD-5C35-483A-B7E7-69B01842464F','B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','�Ƿ�����ȫ����ĿHSE�����¼��̨��',4290)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6B81B783-8EC6-410D-A5D3-3B7C379CC0B9','B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','�Ƿ��ڼ��ʩ����λHSE�����¼��̨��',4300)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E2A3F1AA-BCCB-4076-B21F-7D065B4448C4','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','�ڿ���ǰ�Ƿ������ư�ȫ��������/��ʩ',4310)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('05FF76AC-0254-4007-8520-783270CF8C26','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','�Ƿ������ʱ�õ簲ȫ����������',4320)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('64BD9A68-6F3B-4FDA-A13B-EEE712C1C999','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','�Ƿ���Ƹߴ���ҵ��ȫ��������/��ʩ��',4330)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('77BC8332-7AE8-483A-B9E4-7AD4A1A30CC6','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','�Ƿ�������ء�������ҵ��ȫ��������/��ʩ��',4340)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1AD429A1-6009-4072-9A36-359AFBC87C75','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','�Ƿ������ƺ��伾��ʩ����ҵ��ȫ��������/��ʩ������������',4350)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D3743142-372D-443F-B220-8D7BF0663C7E','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','�Ƿ�������������ҵ��ȫ��������/��ʩ��',4360)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6EF7D2FA-0616-4764-A2BD-36C1F8A56964','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','��ȫ��������/��ʩ�Ƿ����������Ҫ���ݣ�����˵���ͱ��Ƶ����ݡ�������Ŀ�ſ�����Ҫʩ����ҵ�����衢����İ�ȫ�����ʩ����ȫ��ʩ�з����Ļ��������������ߺͲ��ϡ���ص�ͼ������˵���ȣ�',4370)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A6CDD328-5397-4E18-865B-2CA5C54C49F7','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','�Ƿ���ϱ�д��������׼����',4380)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BFC2457D-3AFA-488E-AF03-314CE052BE14','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','ʩ���ְ����Ƿ���֯������Ա��ȫ��ʩ����Ա���н��ף������ü�¼�����ܽ��׵�ʩ����ԱӦ�ڼ�¼��ǩ�֣�',4390)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9243AD28-649B-40BF-8BBB-87760F77723D','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','ʩ���ְ����Ƿ�����֯���йز�����ԱЭ������ʵ����鰲ȫ��������/��ʩ�еĸ������',4400)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('99075B34-E0EC-4C3E-905E-93BC1C4B192A','B8F280FA-3CAC-43FD-98AE-B759FCD8287D','�Ƿ����ʩ���ֳ�������Ա������ʱ���ڣ�����ͳһ��������������ȫñ������ֺЬ��',4410)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D78571AC-4734-444E-BA27-36C71AEDE51E','B8F280FA-3CAC-43FD-98AE-B759FCD8287D','���˷�����Ʒ�Ƿ���ȷ������Ͻ���������ϵ�ۡ���ȫñ��ϵ������ֺЬ����Ь���Ȳ��淶��Ϊ��',4420)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('03A8306C-E432-420F-88B8-79846D5D9275','B8F280FA-3CAC-43FD-98AE-B759FCD8287D','���˷���������ȫñ����Ŀ������ֺЬ�Ƿ���ڻ죨�裩������',4430)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4EB9FAFC-C889-4AD2-A2EC-67BF5828C709','B8F280FA-3CAC-43FD-98AE-B759FCD8287D','�Ƿ�������Σ������Ҫĳ�ַ������ܣ�ѡ�û��ֹѡ��ĳ�ָ��˷�����Ʒ��',4440)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('75157A2D-01B9-499B-AD18-80B4B4F60277','B8F280FA-3CAC-43FD-98AE-B759FCD8287D','ʩ����λHSE�������Ƿ��ڼ����˷�����Ʒʹ������������ü���¼��',4450)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C0DF4B57-EDBC-46DC-80DE-7923BCC8F9E1','DE7930B3-94A0-44AE-8479-39592EC9BAAB','ʩ���ְ���Ӧ�Ƿ��ȡ���ַ�ʽ����HSE�����������',4460)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A55088FB-D36B-4D73-9DEE-BE2D8BF3F9CA','DE7930B3-94A0-44AE-8479-39592EC9BAAB','ʩ���ְ����Ƿ��ڹ��ҡ���ȫ�����¡�����  119����ܣ������绷���ա��ڼ��Ա������HSE�����������',4470)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('260AA45A-A89C-4AB6-B429-F6D11EDA89A3','DE7930B3-94A0-44AE-8479-39592EC9BAAB','ʩ���ְ����Ƿ�����ʩ��������������ؾ�ʾ��־��HSE��ʾ��ʶ������ȫ��ʾ��־������ʾ��־�������������־��������ȫ��־�ȣ�',4480)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EF56C7C4-A662-4765-A36A-C14C64C09D34','DE7930B3-94A0-44AE-8479-39592EC9BAAB','�ڴ���Σ���Ըߵ���ҵʱ�����磺��װ��ҵ���ߴ���ҵ�����޿ռ���ҵ��ҹ����ҵ�������Ի�����ҵʱ�Ƿ���а�ȫ��ʾ��',4490)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B0BA1C0F-6C2B-4890-894B-5D043D38BB70','DE7930B3-94A0-44AE-8479-39592EC9BAAB','Σ�ղ�λ�ľ�ʾ��־�Ƿ���������¥�ݿڡ����ݾ��ڡ��׶��ڡ������ڡ�����ڡ����ӱ��صȣ�',4500)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B962DA39-DD78-4DAA-99B3-E4618E50296D','DE7930B3-94A0-44AE-8479-39592EC9BAAB','�Ƿ��ڽ�����������ָ���־����������ڷ�����ɢͨ������ȣ�',4510)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6768C9A2-2665-4A2E-9EF9-0F7B4271118E','DE7930B3-94A0-44AE-8479-39592EC9BAAB','�Ƿ����������������־�����������͹�ҵ�������ֿ���ţ����ֱ���б�ʶ��',4520)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0F8353DB-6E22-45ED-A36D-10B674AF5F1E','DE7930B3-94A0-44AE-8479-39592EC9BAAB','�Ƿ��������ʩ������ʾ�Ա�ʶ����𾯵绰������˨������ˮ����������ȴ�ŵ�λ�á�',4530)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('660D5D97-A4BD-4209-B144-9A1F3D03B61B','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','ȫ��Ա���Ƿ�μ���ҵ����֯��һ��HSE��ѵ��',4540)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('41F8B528-3695-41AE-8D19-61FE8B26ADC1','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','ȫ��Ա���Ƿ�μ����ܳа�����֯�Ķ���HSE��ѵ��',4550)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2CC203C3-4639-4CCA-A584-8B1BD0EC91D4','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','�Ƿ��ȫ��Ա�������˽����ֳ�ǰ������HSE��ѵ�����˳ɼ��Ƿ�LPEC HSE����ȷ�ϲ�������',4560)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A2028EB9-87B6-47C1-84DC-CAD9955850F8','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','�Ƿ��������ҵ��Ա��������ѵ��',4570)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('AD9A6482-A252-4C19-8846-6567B5557265','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','���н���ʩ���ֳ��Ĺ�����Ա������֮ǰ���Ƿ������һ��HSE��ѵ�ϸ�֤����֤�ϸڣ�',4580)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('034246CA-CF2E-4F3B-9278-5176A3DEFF7D','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','���н���ʩ���ֳ��Ĺ�����Ա������֮ǰ���Ƿ�������HSE��ѵ�ϸ�֤������HSE��ѵ�ϸ�֤�ԡ�ñǩ������ʽ��ʶ�����',4590)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BDC6D8DC-1431-401C-AF99-96E74C773C28','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','�Ƿ������HSE��ѵ�ϸ�֤�߽���ʩ���ֳ�������',4600)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BA776D04-038F-4929-A3C0-967FFD39EF63','5AEB3327-BA14-4405-A687-B30AAA81D5A8','�Ƿ�����˲�����1Сʱ��HSE��ѵ��',4610)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C23C4E32-1076-4AFA-906A-832F0ECAF0DD','5AEB3327-BA14-4405-A687-B30AAA81D5A8','�Ƿ�浵HSE��ѵ��¼��',4620)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7B886ED1-7C70-4047-8BF8-A30592A684AB','5AEB3327-BA14-4405-A687-B30AAA81D5A8','�Ƿ��������зÿͣ�����֮ǰ���������ÿ�֤����֤�볡��',4630)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('26849148-9F1B-4B3E-BF76-9C410301F3B3','5AEB3327-BA14-4405-A687-B30AAA81D5A8','�Ƿ�����޷ÿ�֤�ķÿͽ���ʩ���ֳ�������',4640)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4AFEB979-9833-47DF-BBDE-0D9D347523DC','5AEB3327-BA14-4405-A687-B30AAA81D5A8','��ʱ�ÿͽ����ֳ��Ƿ񴩴���װ����ȫñ��',4650)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E09803D8-4102-44D5-ACE9-DC8E4CBA0163','5AEB3327-BA14-4405-A687-B30AAA81D5A8','��ʱ�ÿͽ����ֳ��Ƿ�Υ��Я���̻�',4660)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E0A7D084-1A74-4290-871D-AD96C116A10C','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','�Ƿ���ʩ���ֳ�ͨ��֤��',4670)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('716C2ABD-770E-4573-9541-781943BA8669','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','˾���Ƿ��м�ʻ֤���г�֤��',4680)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C1FBF300-A2BE-47BA-B48E-90F1C391AF76','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','�Ƿ񰴹涨·�ߡ��ٶ���ʻ��',4690)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('78D4137B-6399-4181-B1CA-1EC3EE6FC97F','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','�Ƿ�ָ��λ��ͣ�ţ�',4700)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('24BCE911-6542-4E93-98AF-28553185D14C','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','�Ƿ��а�ȫ������ʩ��',4710)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1FC75E2D-B7FE-4D84-ABBE-AC0341C6F337','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','˾���Ƿ����ƣ�ͻ�ƺ�ݳ���',4720)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('96550036-7E3A-4092-81CA-597EA9F6BC4F','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','�Ƿ�����HSE��ѵ�ϸ�֤���޷ÿ�֤��Ա��',4730)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CB4BB408-7A09-4499-BFE7-337C34A132B8','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','������Ʒ�Ƿ�Ӱ�컷����',4740)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6CD12146-0EDE-48D1-A96B-BD8A169FDC16','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','�Ƿ������Υ����Ʒ��',4750)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5909A868-89CC-4467-94F1-B27EDD7160A7','A44B1736-4563-4773-8C2D-140C6A76F103','�Ƿ����з���������֯��������Ч���У�',4760)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('20D9E3B3-86C8-4ABF-B9C1-146E69A3268E','A44B1736-4563-4773-8C2D-140C6A76F103','�Ƿ�����˷���������������������棻',4770)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7CB59FEF-863D-4B6B-8D15-B9FE29A9C0DA','A44B1736-4563-4773-8C2D-140C6A76F103','���������Ƿ�ȱ�����Ӧ���������������ݣ�a)	����ֲ�����λ�������Ƽ���飻b)	����С����ɼ�����ʱ�䣻c)	�����������ֶΣ�d��������������������ʩ���Ա����ʽ��ʾ��',4780)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7C15A070-60BA-4CD6-BAF6-DF42D0C98B1D','A44B1736-4563-4773-8C2D-140C6A76F103','�����Ƿ�LPEC HSE�������������ش�������LPEC��Ŀ������������',4790)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D9AA06FF-E48F-4866-9BB2-EF0C28A4D594','A44B1736-4563-4773-8C2D-140C6A76F103','ʩ���ְ����Ƿ����ݱ�����֯ʵʩ����������',4800)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('86F55BBA-1F87-4430-8C65-FAC700A55519','A44B1736-4563-4773-8C2D-140C6A76F103','ʩ���ְ����Ƿ�������������������Լ죻',4810)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1309205F-ED13-480B-9FE5-D27DA572C642','A44B1736-4563-4773-8C2D-140C6A76F103','ʩ���ְ����Ƿ�������������ϱ�LPEC��Ŀ���������գ�',4820)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D0E10844-A4A1-48EF-990F-F7AB385EAD4B','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','�Ƿ�������ֳ�HSEӦ��Ԥ����',4830)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6DAB73C4-0EC1-43B7-9234-1FD8AC5D73E5','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','Ӧ��Ԥ�������Ƿ�ȱ�����Ӧ�������о������ݣ�
a)	����Ǳ���¹�Σ�յ����ʡ���ģ������״̬����ʱ�Ŀ��ܹ�ϵ��
b)	�ƶ����ⲿ������ϵ�ļƻ��������������Ԯ�����������ϵ��
c)	��ʩ���ⱨ����ͨѶ����Ĳ��裻
d)	Ӧ��ָ�����ĵĵص����֯��
e)	�ڽ���״̬���ֳ���Ա����Ϊ���������벽�裩��
f)	�ڽ���״̬�£����ֳ���Ա��������Ա����Ϊ��
g)	Ӧ��Ԥ���������Դ���ˡ������豸����õ������ͷ�ʽ��
h)	�ط������ͽ�����������ĵ�ַ�͵绰���������緽ʽ��
i)	Ӧ���豸�����ʣ�',4840)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2AC2B10D-7A96-4A8E-B48F-E307B9F46733','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','ʩ���ְ����Ƿ�����˳���Ӧ��ָ�Ӳ�������ȷ��Ҫְ��',4850)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E8892F7C-4204-4B64-A2C3-4B83225C4439','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','ʩ���ְ����Ƿ���Ӧ��Ԥ���ļƻ�����֯ʵʩ��Ӧ��������һ��ÿ����һ�Σ���',4860)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('24A81BA6-7F36-400D-B95F-481051B3445F','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','ʩ���ְ����Ƿ�浵��Ӧ��������¼��',4870)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9305942E-EC46-4461-9EF0-E2CC36BBC7A6','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','ʩ���ְ����Ƿ��н���״̬�µ�Ӧ���¼����ò��裻',4880)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('016609DB-78E8-4488-9C12-11B628E12B18','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','ʩ���ְ����Ƿ���¹ʽ��е�������������涨�����ƺ����ˣ�',4890)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1D000E88-3599-4459-BB2D-248225824243','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','�Ƿ���ȷ�涨���ļ������ϵĿ��Ʒ�Χ��',4900)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E86D19BB-77B2-48AA-A6C0-C5FF9DF3507C','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','�Ƿ���ȷHSE��Ϣ���ļ������Ȩ�ޣ�',4910)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F9EE02E6-7B80-49DD-93BF-666FF1851B38','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','ʩ���ְ����Ƿ�ר�˶�HSE��Ϣ�����������������ռ����������ࡢ���ݵȣ�',4920)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('01EC3F28-A91E-46E9-B2D2-D8D5C901D4F3','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','�Ƿ�������HSE�йص��ļ�����¼�����桢���Ⱦ����ཨ��̨�ʣ���������Ա���еǼǴ浵��',4930)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('581E13C1-F16F-4ACE-B400-F40C6C097C01','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','ʩ���ְ����Ƿ����й鵵���Ͼ���Ψһ�ı���ұ��������',4940)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('31B45DAA-5BD6-4CC7-83B5-16D6A09641A8','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','ʩ���ְ���HSE��Ϣ���ļ����Ĺ����Ƿ����н��Ĺ���������',4950)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9390BD32-7DE0-4A34-96D9-BAB69C55D800','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','�Ƿ������鳤��ȫ���������ƶȣ�',4960)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('15835C33-C89E-4661-B2F4-5F4FEE81FCA7','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','�Ƿ���ְ����ȫ���������ƶȣ�',4970)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('187FAF71-0A83-4A53-A3C7-EF3C735ED511','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','�Ƿ������ְ�������˹��֣���λ����ȫ���������������Ժϸ�',4980)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('57378A1F-FE57-4895-B3EC-1CD2655ABBD7','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','������Υ��ְ����ʩ����λ�Ƿ����Υ�����ٽ����������Ժϸ�',4990)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('29265703-23FB-4BAD-B47C-F7699CE2874B','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','�Ƿ���������ÿ��һ��������1��Сʱ���ҵ�ʱ�俪չ��ȫ���ÿ�°�ȫ�ʱ�䲻������4Сʱ��',5000)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('50A6AC69-49F2-4E3A-A8D9-E159022B9F67','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','��ǰ��ȫ�����Ƿ�����������һ�塱��',5010)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F5954DFE-7C8B-4893-81CC-80DA82E872B2','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','�Ƿ��������鰲ȫ�����Ͱ�ǰ��ȫ�����ɰ��鳤ָ��һ��ְ�������¼����¼Ҫ����鳤�Ľ���ͬ�����У�',5020)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9C49D294-C005-4259-8BC7-9901AE4E28D3','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','�Ƿ������ϸ�ʩ����ƽ�沼��ʩ�������衢���ߡ����ϲ�������ڷŻ��޼ƻ����裻',5030)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D147FE77-F7F0-460E-AC9C-A96C53C6F61B','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','�Ƿ���ȷ����Ͷ�������Ʒ��ͳһ��װ������HSE�涨��',5040)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8F56B6B3-C76E-45B0-BDED-718DD76554EA','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','�Ƿ��ֳ�������֯��ɨ�������ֳ������������ɾ������ࣻ�Ͻ��洦��С�㣻�豸�����������ϱ���������������Ͳ����������������֣�',5050)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8E9FC292-5832-4F77-BBE9-75C9D96EB843','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','�Ƿ�ʩ���ֳ����������÷�����������䣬��ʱ�������ϡ����ϣ�',5060)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9C98ABED-0D8E-4FCE-8732-BF8870A8286F','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','���߷����Ƿ�Ҫ������ڷţ����������Ͼ������壻',5070)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F556EE5F-0AC3-48F5-A7CD-84F864F06B3F','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','�ֳ���ˮ�ߡ����¡����ߡ��纸���ߡ��������Ƿ�ͳһ�滮�������ã�',5080)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6EBACB4C-EEB1-4A9A-A68B-DE0E72C28AC8','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','�Ƿ��������鰲ȫ�����Ͱ�ǰ��ȫ�����ɰ��鳤ָ��һ��ְ�������¼����¼Ҫ����鳤�Ľ���ͬ�����У��������������纸����ÿ���չ����̺ã�',5090)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8F47290E-18DB-4CA3-AFBB-E942A5A3EF9B','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','ʩ���ֳ��Ƿ��䱸��Ҫ�ļ�����Ʒ�;Ȼ�������',5100)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EA26D0B2-4FB3-4CB4-A064-DAEEE7C3174F','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','ʩ���ֳ���·�Ƿ�ָ��ר����ɨ��������ˮ����ֹ�������',5110)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('83F8C4ED-9695-4E17-B01C-3CD257B3BCC8','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','�ܱ�������ʩ���Ƿ��ȡͨ���ʩ���ڷ۳�������ҵ����Ա���Ƿ�����������֣�',5120)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2C9724D0-B1AD-4DAC-935B-099C97600F99','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','ʳ���Ƿ�������֤������������ֹʳ���ж��¼��ķ�����',5130)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D275A8B0-EE2A-4B23-9426-2A9BACE156AC','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','ʩ���ְ�����Ŀ���Ƿ��ƶ��˱���λ��ְҵ��������ְ��',5140)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A537B032-ED18-470F-A861-D31ED3EF0BA5','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','�Ƿ�����������Ŀְҵ������ְҵ�����ι����������ȫְҵ������������ƶȣ��ƶ�����Ŀְҵ������ְҵ�����ι����ƻ���ְҵ��������ʵʩϸ�򣬲��ලʵʩ��',5150)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('51D72675-154B-459E-B598-9D5CEAF556D1','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','�Ƿ����ְ��ִ�в�����̣��ռ���������֪ʶ����ȷʹ���Ͷ�������Ʒ�ͷ����������ģ�',5160)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C749B642-15D0-403D-8D74-AF26DFB1DC3B','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','�Ƿ񰴹涨��֯������ҵ��Ա���н�����飻',5170)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F05D05B8-7849-41C3-B15B-98E3FDEE3DAA','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','ʩ����ҵ�ĳ����������ߡ������ȷ�����ʩ���Ƿ��ǿά�޹���ȷ����ã�',5180)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('249ACBF2-07B0-447C-A415-409D825061DA','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','�ھ����ᡢ��ȸ�ʴ���ʻ�ѧ����Σ�յĳ����Ƿ����ϴ�豸��',5190)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EDFEDA04-68F9-4901-973E-28E811212F78','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','�Ƿ��ϸ�ִ�з���������ʩ�͹����ƶȣ�',5200)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BDF99630-4919-4F30-9B2C-1490AC8C1B07','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','ְҵ������ְҵ�����ι�������Ĺ����ѡ������豸���÷ѣ��Ƿ���Ա�֤��ר��ר�ã�',5210)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4C151F05-AF68-4084-A85C-454F223D65E3','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','ʩ���ְ����Ƿ�����ְ����������1000����רְְҵ����������Ա1�ˣ�����1000�����ְְҵ����������Ա1�ˣ�',5220)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EA323602-4145-481B-A04C-E40680EB9AA9','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','ʩ���ְ�����Ŀ���Ƿ�����ȫʩ���ֳ��Ĺ�����ȫ���ΰ�������֯��������ʵ������ȫ���������ƣ�',5230)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7A905765-D116-40E2-A03D-590B606337A8','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ�����ȫ������ȫ���ΰ�������������ƶȣ�ȷ������ʩ����',5240)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('923C3BFA-593E-4A5A-ABF5-EB366B555D38','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ�����ֳ���������Ա���ҵ��ͳһ�������ֳ�����֤��������Ա�ڰ������֤֮ǰ�Ƿ񾭹�ҵ����һ��HSE������',5250)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8384E6B9-F47C-4C8E-86FC-A1D2649554C0','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','���й���ʱ�Ƿ񰴹涨��װ�������Ϲ���Ҫ����ͱ���װ��',5260)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A137CE85-6F29-48AA-A860-309C3099391C','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ���ڳ�����Υ��������Ϊ��',5270)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('95942586-E9E9-4EF2-932C-6BADC43BE92D','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ���ڳ��������ƺ�������Ϊ��',5280)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C4708DB3-8B4A-492A-928F-D9353A1E2DE9','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ���ڳ����ڶ�Ź�ͶĲ���Ϊ��',5290)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('153AF25E-FA1B-4FE4-84E7-DAFD7681F00A','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ�Я����ʹ�����������Ƶ��߻�������������Ϊ������',5300)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('96B8A94F-7546-4F04-9EB3-FCF2C6C731C8','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','ʩ���ְ����Ƿ����Լ���ʩ���������ʱ��ʩ��Χ��װΧ���ʹ��ţ�������������',5310)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0ED14A5A-221F-493F-8E42-395C45C80575','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ�������ʩ���ֳ��ڹ�ҹ��ҹ��ʩ���Ƿ�������ҵ��������',5320)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A128C4B0-2900-4028-A6A5-D49D7843E8D8','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','�Ƿ���ڲ�����������������ȡ�֣�á�������������Ա������',5330)
GO
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('c3160175-f5a6-4259-b7a9-6032e4ea14d4','��ʱ�õ���','0',NULL,0,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e78b6db0-786c-4e39-8450-e9c6443992cc','������Ϊ���','0',NULL,0,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('d5bd7f74-f8ec-4c47-80f6-6faa0aa411e2','������ҵ���','0',NULL,0,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('c6dd5b8c-3319-40b3-9da1-110edd495f6e','���ּܼ��','0',NULL,0,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('8112de07-c875-49ad-931a-494bb631cdf7','ģ��֧�����','0',NULL,0,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('c1b5d2b4-84f9-475c-890a-8f12ee69536b','�ߴ���ҵ���ٱ߷������','0',NULL,0,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('aca76fe1-fc76-42d3-b091-75a6de5e384e','���ص�װ��ҵ���','0',NULL,0,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('fb982f06-b30e-4f12-ac61-03b413a78ea5','�����붯����','0',NULL,0,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('418c60a6-472d-4105-85af-b433720b066f','ʩ���ֳ�����ʩ�����','0',NULL,0,9,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('81068c1f-d6b2-4384-9676-078dd7521d14','���������','0',NULL,0,10,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('49593a7b-8df4-443c-b021-35832770f80e','������ҵ���','0',NULL,0,11,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('2afb98a2-082c-4ef1-896b-7d6f8a17967e','���޿ռ���ҵ���','0',NULL,0,12,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('af37ab63-18df-4b45-886c-5d123118d677','��ѹ��ɨ���','0',NULL,0,13,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e1b32273-8a63-432c-a224-375838b36ca3','��ƿ���','0',NULL,0,14,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('4a54cbb2-7072-4f4e-9928-a15d1d0ad256','Σ����Ʒ���','0',NULL,0,15,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('41128d20-b752-4874-8033-2b12ef63eea2','�ߴ��������','0',NULL,0,16,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('ff8c0592-b843-4ab8-b54b-7f3129edcde3','�����豸���','0',NULL,0,17,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('df5e1a00-accc-4b8c-a177-15216763197a','�Գ����','0',NULL,0,18,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('687f025d-06a4-460f-869c-57b3b34adad5','�����ۺϼ��','0',NULL,0,19,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('cf0bd845-0b30-4a42-b255-1a6c8a70900a','��ҵǰ���׼�⼰��Ʊ','2afb98a2-082c-4ef1-896b-7d6f8a17967e',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('845979c6-d39f-449a-94d9-fb26506061dd','��ҵʱ����','2afb98a2-082c-4ef1-896b-7d6f8a17967e',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('5ab6082e-f5d4-42d0-83e4-3cd1cdcd9b5c','����','2afb98a2-082c-4ef1-896b-7d6f8a17967e',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('0effae99-5429-4b76-8c52-c2138fa8ad66','��ȫװ��','41128d20-b752-4874-8033-2b12ef63eea2',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('bdbe9fb2-c771-4d49-b015-f82f0f22a3d9','���һ���','41128d20-b752-4874-8033-2b12ef63eea2',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('f33388d0-e584-4b0d-b5d3-9c1cb16c94a4','���߼�����','41128d20-b752-4874-8033-2b12ef63eea2',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('15243898-2109-4ba0-a3e7-bb9569b9e3c4','��ȫ��ҵ','41128d20-b752-4874-8033-2b12ef63eea2',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('6e9d31be-e922-47e0-b5a7-7943d6f09035','����������','41128d20-b752-4874-8033-2b12ef63eea2',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('7466bf20-11c8-4af7-a1ae-7e3b781e0e0e','��ȫ����','41128d20-b752-4874-8033-2b12ef63eea2',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('45d9774e-f8e9-41d9-ac7e-73d0d7142529','����','41128d20-b752-4874-8033-2b12ef63eea2',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('105b10cc-f4a6-482a-96c4-161ceeed80c4','�ֳ�Χ��','418c60a6-472d-4105-85af-b433720b066f',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('996c7f5d-2cbd-4cff-b386-7c5dd0be12d0','��չ���','418c60a6-472d-4105-85af-b433720b066f',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('c8b8638c-0c0d-409c-82a9-30640b83a985','ʩ������','418c60a6-472d-4105-85af-b433720b066f',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('8c9df280-84a6-4292-8cc0-42ef231e55b5','���϶ѷ�','418c60a6-472d-4105-85af-b433720b066f',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('bec226c6-94d9-48ad-bfe0-ecf870eab252','ʩ���ֳ�����','418c60a6-472d-4105-85af-b433720b066f',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('f6aaca10-0e64-4d2f-bebb-c28e2db1155a','�ֳ�����','418c60a6-472d-4105-85af-b433720b066f',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('d73e1da1-c823-4abd-800c-b057bf54d7f5','��������','418c60a6-472d-4105-85af-b433720b066f',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('49c32b06-f089-4b22-838e-f598e91f7709','����','418c60a6-472d-4105-85af-b433720b066f',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('356aab0e-c466-4228-97e6-4060e7ba92b4','�������','49593a7b-8df4-443c-b021-35832770f80e',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('897ea9a2-29c3-4254-8e76-424759300e9f','��ҵǰ׼�����峡','49593a7b-8df4-443c-b021-35832770f80e',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('a6903b17-0743-4e6f-9e8e-6972dadf7e40','��ҵʱ��ȫ��ʩ','49593a7b-8df4-443c-b021-35832770f80e',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('48838f9b-5f42-4ca2-965a-26db0c78bf87','٤��Դ�ù���','49593a7b-8df4-443c-b021-35832770f80e',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e63bd7b3-7e52-43fb-9d1b-689769ce103e','������Ӧ������','49593a7b-8df4-443c-b021-35832770f80e',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('043264f8-fb2f-4c85-9a05-0a20d36fa815','����','49593a7b-8df4-443c-b021-35832770f80e',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('d7397073-d676-4e83-9b7f-42ac2c296964','�����ƶȡ�Ӧ��Ԥ��','4a54cbb2-7072-4f4e-9928-a15d1d0ad256',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('666353e6-62f4-4e5e-ba3b-9faa6e9337da','��Ա��ѵ','4a54cbb2-7072-4f4e-9928-a15d1d0ad256',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('bf154090-d4c6-4eff-90b4-18949bf18259','Σ��Ʒ�ֿ�','4a54cbb2-7072-4f4e-9928-a15d1d0ad256',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('6a42ccb0-1d32-4d7d-b8e1-75878b5dc8f1','Σ��Ʒ�������','4a54cbb2-7072-4f4e-9928-a15d1d0ad256',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('3dfeba3b-3306-4c3b-801c-bc8ebfc37a58','Σ��Ʒ��������','4a54cbb2-7072-4f4e-9928-a15d1d0ad256',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('8e3119c3-9b7a-4647-80cb-c0586c0780ec','����','4a54cbb2-7072-4f4e-9928-a15d1d0ad256',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('1975bb25-94e9-4fd5-a74f-31fb39890b6d','������ȫ���','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('57a55f3e-8913-4250-b9ae-732dfcf1905b','�꼾��ȫ���','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('51331fed-663b-4e37-96b2-0a7f09889d7c','���ȫ���','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('b6b1d0cc-5482-4334-a371-414353c0148a','�缾��ȫ���','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e6b2580e-db2b-4bb5-a22c-353ec169f1e9','����ǰ��ȫ���','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e299e59f-0174-472a-9025-73f2e754b487','��դ��ҵ','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('d2cf710a-10dd-419e-8fbf-9337f6c0cfe4','�ͱ��','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('0da8615d-7683-4766-ac90-600cebe156cb','��¯','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('85868409-021f-4292-862a-37ddb2377026','ä����','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,9,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('c20dcb76-dd72-4b14-96c6-325ceacc948c','��·��ҵ','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,10,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('fc78746f-3235-4fa4-a72f-e32c8a661f2e','������ҵ','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,11,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('952273e0-f25d-4127-8cd6-9d18de94614f','��ȫ����','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,12,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('948bea04-992f-48d2-b4b9-4ac463e05656','����','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,13,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e417e882-ccff-43c4-b0bc-980e3d3d55d2','�����������ƶ�','81068c1f-d6b2-4384-9676-078dd7521d14',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('6f53fb3b-4693-4977-a7f5-833e0fc5b542','��������ʩ���','81068c1f-d6b2-4384-9676-078dd7521d14',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('365041cb-e8d5-4a9c-a628-6782d667491d','�õ簲ȫ�����Ŀ','81068c1f-d6b2-4384-9676-078dd7521d14',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('c1eaa17b-90d0-4424-8990-5d15b806a047','Υ������','81068c1f-d6b2-4384-9676-078dd7521d14',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('c9b216ab-e5cf-4bdc-bb8e-164a003fbdca','�����ʩ','81068c1f-d6b2-4384-9676-078dd7521d14',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('7149cfaa-492e-4bde-b0c6-c45022a74ca9','ʳ�ð�ȫ���','81068c1f-d6b2-4384-9676-078dd7521d14',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('57bd144d-ba78-4f1f-8043-13e9810b35af','�������������','81068c1f-d6b2-4384-9676-078dd7521d14',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('82b959e6-2870-48ec-88e4-f018b81c2e67','����','81068c1f-d6b2-4384-9676-078dd7521d14',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('86479986-bdbe-4b54-8b3d-0be6e2288637','ʩ������','8112de07-c875-49ad-931a-494bb631cdf7',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('19d176b3-b3fb-4de5-9a0b-aeb6ee9d5e08','֧��ϵͳ','8112de07-c875-49ad-931a-494bb631cdf7',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('a7a51b31-f27d-4b14-b042-c03ee57f4048','�����ȶ�','8112de07-c875-49ad-931a-494bb631cdf7',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('07167f93-7962-4f0b-8c63-6172a3e253a7','ʩ������','8112de07-c875-49ad-931a-494bb631cdf7',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('1857a9bc-bd05-46f0-a1ec-07aebf283b19','ģ����','8112de07-c875-49ad-931a-494bb631cdf7',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('cc54333a-2d80-43ae-831d-82c870e3d8cc','���ģ��','8112de07-c875-49ad-931a-494bb631cdf7',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e2387152-9b1a-4447-9a25-e227a4f74767','ģ������','8112de07-c875-49ad-931a-494bb631cdf7',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('ba1bc0fc-f118-4f2c-b148-68adf474b7c4','������ǿ��','8112de07-c875-49ad-931a-494bb631cdf7',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e3e137ae-67fa-41fe-acc5-bdae3a2bc6d0','�����·','8112de07-c875-49ad-931a-494bb631cdf7',NULL,1,9,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('b6bac4a0-a5d5-438a-9a8b-8eaa2218dcb2','��ҵ����','8112de07-c875-49ad-931a-494bb631cdf7',NULL,1,10,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('80081fe1-8a0f-4f29-b7b3-c27d8fa7a4fc','����','8112de07-c875-49ad-931a-494bb631cdf7',NULL,1,11,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('7fb552c4-382f-4bdd-a3d9-651c4a4ccc44','���ػ�е','aca76fe1-fc76-42d3-b091-75a6de5e384e',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('13aeb1e9-cacc-47f3-b4c2-73545e5d2ec8','��˿�����ê','aca76fe1-fc76-42d3-b091-75a6de5e384e',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('ee44f1a4-e662-4ecf-bcf0-48cab958dc6d','����','aca76fe1-fc76-42d3-b091-75a6de5e384e',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('25046ba3-7f1a-498d-b3fb-5d996a6dcbcd','˾����ָ�ӡ�������','aca76fe1-fc76-42d3-b091-75a6de5e384e',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('612a5624-6126-475a-8c9c-c036a4a0da95','������','aca76fe1-fc76-42d3-b091-75a6de5e384e',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('d84aa24c-d5bd-4fd4-bca3-263c625707d6','������ҵ','aca76fe1-fc76-42d3-b091-75a6de5e384e',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('ab5ac0de-4c65-4fb5-9e05-c990c40c4c96','��ҵƽ̨','aca76fe1-fc76-42d3-b091-75a6de5e384e',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('3109335f-7d58-4daf-b642-ab8bbe23305c','�����ѷ�','aca76fe1-fc76-42d3-b091-75a6de5e384e',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('b06783bc-7267-4aaa-b501-9549dcd7e096','����','aca76fe1-fc76-42d3-b091-75a6de5e384e',NULL,1,9,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('88e3eede-7ecf-4396-a9ff-7557b5855af0','����','aca76fe1-fc76-42d3-b091-75a6de5e384e',NULL,1,10,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('33488afc-9827-4749-b91c-48a0be11cc3b','����','aca76fe1-fc76-42d3-b091-75a6de5e384e',NULL,1,11,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('52a0821a-630d-4cb0-ad0e-93a4ed8c8fc0','��Ա���','af37ab63-18df-4b45-886c-5d123118d677',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('b0218b99-fe5a-4054-a741-9f9ff109f88e','�����뼼������','af37ab63-18df-4b45-886c-5d123118d677',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('ea73a6cb-c991-4e0f-a544-62334817aa21','��ȫ����','af37ab63-18df-4b45-886c-5d123118d677',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('b25021e1-de89-4297-bbf7-b74697ac1e9a','��ȫ��������','af37ab63-18df-4b45-886c-5d123118d677',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e4f2b15f-10c0-4f0d-9326-0f551213abdf','��ҵʹ�õ��豸������','af37ab63-18df-4b45-886c-5d123118d677',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('222f1d0b-d990-48ec-9a97-9c4cf4e15c33','��ѹ�ŷſڡ���ɨ��Ҫ��','af37ab63-18df-4b45-886c-5d123118d677',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('91292573-b241-4209-a8bf-c0126f4aad9a','Ӧ����ʩ','af37ab63-18df-4b45-886c-5d123118d677',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('dba6c0ed-0b65-4155-b9c1-fa95eab77a16','����','af37ab63-18df-4b45-886c-5d123118d677',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('6ffdb168-e839-46b9-8c94-200cd46ca0b6','��ԱΥ��','c1b5d2b4-84f9-475c-890a-8f12ee69536b',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('09b01f67-3d8f-4143-8d14-b67fb9b8c034','��ҵƽ̨���׶�','c1b5d2b4-84f9-475c-890a-8f12ee69536b',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('4ded0823-2756-4dbd-8d81-7ef1770b1245','�ٱ߼�������ҵ','c1b5d2b4-84f9-475c-890a-8f12ee69536b',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('b620dcfc-ae18-4d02-b28a-131765f2adad','����ע������','c1b5d2b4-84f9-475c-890a-8f12ee69536b',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('dccda995-156c-4c35-aa6d-b23f69561091','������','c3160175-f5a6-4259-b7a9-6032e4ea14d4',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('0ed3125e-e604-48c1-8e5f-21d5e9535def','�ӵ������/����ϵͳ','c3160175-f5a6-4259-b7a9-6032e4ea14d4',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('ab54ef75-9e0d-4d02-9dbd-a75da631cad5','������뿪����','c3160175-f5a6-4259-b7a9-6032e4ea14d4',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('749d84af-fe4e-44f1-9ad1-6a36193e3328','�ֳ�����','c3160175-f5a6-4259-b7a9-6032e4ea14d4',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('efa25d9a-0ddd-4a72-a92e-54cddc33ca07','�����·','c3160175-f5a6-4259-b7a9-6032e4ea14d4',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('79727f49-9c90-42fa-9547-9f0445972810','����װ��','c3160175-f5a6-4259-b7a9-6032e4ea14d4',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('484c1208-524f-40ce-ba77-ac751e97879e','�����װ��','c3160175-f5a6-4259-b7a9-6032e4ea14d4',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('73184d82-a823-40fc-942c-fe91c8482ab9','�õ缼�����ϵ���','c3160175-f5a6-4259-b7a9-6032e4ea14d4',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('ad4acbca-b373-45a3-9cd6-3082c33b3132','����','c3160175-f5a6-4259-b7a9-6032e4ea14d4',NULL,1,9,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e6e651f1-3024-49a8-a0e0-cfd5aff640b8','ʩ������','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('14b27bec-7906-4d2b-8bcd-e49169e1a21e','���˻���','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('f0660445-1d00-4105-a1b9-277acc8acb81','�����뽨���ṹ����','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('b0d4c8dd-5129-446c-b084-99db610f0f0e','�˼�����������','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('2e0177fe-678e-4fa4-9878-e18f28242a9b','���ּ����������','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('189a4cf1-8657-41a2-b7c4-b236c74d5645','����������','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('4733b9e2-8cf7-4caf-829a-a07ec1eab5f5','С�������','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('77e80467-5f83-47b2-a6a0-6c4254433949','�˼����','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('d64c102c-49e9-424f-a65a-844639a598a7','�����ڷ��','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,9,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('54fbf80c-0437-4b3d-8e45-01a94013e103','���ּܲ���','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,10,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('f3e52048-4d3f-475e-8848-5ec3948a78fb','ͨ��','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,11,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('c2f10e79-a2ec-46cd-a451-c74a5139beb1','ж��ƽ̨','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,12,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('5bd6a724-0458-4673-b4ff-dbdad99b3eb1','����','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,13,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('2d09b36d-38da-4704-b422-a027ab146bfb','ʩ������','d5bd7f74-f8ec-4c47-80f6-6faa0aa411e2',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('ed1b5241-4e32-4862-8b3e-a7f367c9e93b','�ٱ߷���','d5bd7f74-f8ec-4c47-80f6-6faa0aa411e2',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('7325a7e4-b556-4d8b-adaa-08e01ad9b653','�ӱ�֧��','d5bd7f74-f8ec-4c47-80f6-6faa0aa411e2',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('bf9f373e-a65a-4061-ac82-8107fd149bd7','��ˮ��ʩ','d5bd7f74-f8ec-4c47-80f6-6faa0aa411e2',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('7e9215ee-a40d-49ef-abb2-643131cbdbda','�ӱߺ���','d5bd7f74-f8ec-4c47-80f6-6faa0aa411e2',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('c01870ef-3b85-476d-94f3-277ac8dd46d4','����ͨ��','d5bd7f74-f8ec-4c47-80f6-6faa0aa411e2',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('85b580d3-2fac-4589-ae7f-aa677cce456a','��������','d5bd7f74-f8ec-4c47-80f6-6faa0aa411e2',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('210faabe-1cbe-435b-b891-b5dd40a3bf9a','����֧��,���μ��','d5bd7f74-f8ec-4c47-80f6-6faa0aa411e2',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e3de5c35-8180-4e65-a55b-3b9b1ebb0180','��ҵ����','d5bd7f74-f8ec-4c47-80f6-6faa0aa411e2',NULL,1,9,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('5e6764e8-68d1-4f7c-99c3-f48d9caa0f39','����','d5bd7f74-f8ec-4c47-80f6-6faa0aa411e2',NULL,1,10,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('30bb55cd-9be4-4d08-a090-e7f13fc81953','��Ա���','df5e1a00-accc-4b8c-a177-15216763197a',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('67d32618-1983-4e1c-b2b8-d648c4b88270','������������','df5e1a00-accc-4b8c-a177-15216763197a',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('80734bec-785c-4744-92c2-9146721159f3','��ȫ����','df5e1a00-accc-4b8c-a177-15216763197a',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('98045cc7-a4fe-4acc-a091-2826776cc866','��ȫ�����ʶ','df5e1a00-accc-4b8c-a177-15216763197a',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e6fa53f6-1dcd-419c-acd0-0db1b8f438cd','�Գ���Դ','df5e1a00-accc-4b8c-a177-15216763197a',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('5f36824f-ae8d-4ddd-90b7-c76e4d14b57a','��ȫ����','df5e1a00-accc-4b8c-a177-15216763197a',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('5ab2e2e8-84ec-4b97-8fe5-1cccc1ae0160','�豸��ȫ���','df5e1a00-accc-4b8c-a177-15216763197a',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e94c80fd-0fed-4f77-a839-1a009c93cd37','Ӧ����ʩ','df5e1a00-accc-4b8c-a177-15216763197a',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('4fe39381-e576-4510-bbda-d6e409f63af3','����','df5e1a00-accc-4b8c-a177-15216763197a',NULL,1,9,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('c7ba5d46-d93c-49b8-904c-cd44f86528f7','��ƿ���鼰�����¼','e1b32273-8a63-432c-a224-375838b36ca3',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('57e754a6-cf58-4c84-a4f3-93f776be804b','��ƿ���','e1b32273-8a63-432c-a224-375838b36ca3',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('4ee8f944-5b80-45ae-8e60-3c48ef2d26e9','��ƿʹ��','e1b32273-8a63-432c-a224-375838b36ca3',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('1a47c5fd-87a4-40ca-9ac8-8a6413f5cdd1','��ƿ����','e1b32273-8a63-432c-a224-375838b36ca3',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('edcf314e-6656-4cd9-86f3-8e1164451f05','����','e1b32273-8a63-432c-a224-375838b36ca3',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('78f2f6ec-24a2-4e7f-9b6e-eec942cc30ce','HSE��֯������������ϵ����','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('c454ca84-e2e6-4ac4-aff3-2a29270c88ac','�ֳ���ȫ����/��ʩ����涨','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('6d0a9f00-7aed-4386-bafe-f2e7af0f24b4','���˷�����Ʒʹ��','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('acf769bc-854f-4e4d-a711-463df386cdbb','HSE�����뾯ʾ����','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('b2e48682-2117-445c-9c18-eea717c1d8ef','HSE��ѵ����֤�ϸ�','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('44b0ad52-36c9-4cc9-a8a9-967a2f59a737','�ֳ�������������','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('5dbd0ce5-e64c-494d-924a-1d8462625cda','HSE������������������','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('52401d1b-43e6-47ec-8e04-abc81e4e6ca8','�ֳ�HSEӦ������','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('7d2095fd-47e4-4ba0-8af6-aa88acbb0b99','HSE��Ϣ����涨','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,9,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('dd5e6f9d-dd6e-4fe5-9007-70c5d9ce06b6','ʩ���ӡ����鰲ȫ�����','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,10,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('f716ddb1-3128-4608-b03e-d25811c8002a','ְҵ��������','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,11,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('f823abfb-8218-43cc-a160-bf0791b6f149','������ȫ���ΰ�����','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,12,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('68da4b77-9adc-4c5d-8f36-8a0fc935dd7a','����̬��','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,13,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('d458f341-8d70-4a7c-ba22-93c6dfba1ba7','����ȫ��ҵ���֤','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,14,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('0db0a2e7-2837-4863-aabb-d3332b525337','����','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,15,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('5b60d917-7e09-4952-a46c-04b5a10fa56c','������ȫ�����ƶ�','fb982f06-b30e-4f12-ac61-03b413a78ea5',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e87e9a29-8a9a-4e20-9a03-69733f9c001a','����������','fb982f06-b30e-4f12-ac61-03b413a78ea5',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('0a61cbd4-236d-4b9a-bb52-f72736c0f8fb','�ֳ�����','fb982f06-b30e-4f12-ac61-03b413a78ea5',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('855f5e09-ce6f-4f6d-8725-b5011b78a4f4','��������','fb982f06-b30e-4f12-ac61-03b413a78ea5',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('58e8d8d9-f576-4e5d-83aa-f2d6324b0c0c','�ճ������¼','fb982f06-b30e-4f12-ac61-03b413a78ea5',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('dd3b16b3-8582-4577-ab64-f47cc62a245b','��ȼ����������','fb982f06-b30e-4f12-ac61-03b413a78ea5',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('0b738600-c6e0-4e5b-8bba-f90d0c2eabb3','����ͨ������Ԯ��ʩ','fb982f06-b30e-4f12-ac61-03b413a78ea5',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('fd5d6b6d-537c-4b1d-879d-ab410c69699d','����','fb982f06-b30e-4f12-ac61-03b413a78ea5',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e90279e7-e307-4075-9fd4-42cd585b0aeb','�����豸','ff8c0592-b843-4ab8-b54b-7f3129edcde3',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('b050a452-78a0-44a9-9bac-b9f5c6d213cd','һ������豸','ff8c0592-b843-4ab8-b54b-7f3129edcde3',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('d94747b0-d340-4755-89c5-e7a90588ed4b','����','ff8c0592-b843-4ab8-b54b-7f3129edcde3',NULL,1,3,1,NULL);


--����� ��ϸ
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0005a322-9e84-4e35-8a96-bf2f9a9693d9','c1eaa17b-90d0-4424-8990-5d15b806a047','ʹ�õ紶������',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('005f99ad-dc94-4b0c-8320-cb5a4a8aa792','e6e651f1-3024-49a8-a0e0-cfd5aff640b8','���ּ�����ʩ������',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('010e4227-4129-4878-ad55-fb0287bccddb','043264f8-fb2f-4c85-9a05-0a20d36fa815','����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('01398d56-218c-4ca3-a4b9-e2f1ddc6981e','e87e9a29-8a9a-4e20-9a03-69733f9c001a','��������Ҫ���涨�䱸��������',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('017eb368-b868-4715-82eb-53458c823fc9','365041cb-e8d5-4a9c-a628-6782d667491d','����ר�������',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('018b8d69-3e86-4762-b1f2-8a4f054c8f87','cf0bd845-0b30-4a42-b255-1a6c8a70900a','�Ƿ񾭼���ϸ񣬰�����ص���ҵƱ֤�󷽿ɽ����豸��װ�á��������ӵ���������ҵ',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('01dc1f39-16c2-4bb5-8960-3dffc6396b9b','f823abfb-8218-43cc-a160-bf0791b6f149','�Ƿ�����ȫ������ȫ���ΰ�������������ƶȣ�ȷ������ʩ��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('03ce4c58-cd8d-49ad-ae9c-7b40fec636f2','ab54ef75-9e0d-4d02-9dbd-a75da631cad5','���������߳����Ƿ�����',9) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('03eedd50-5929-4bad-9743-938d677c9aaf','88e3eede-7ecf-4396-a9ff-7557b5855af0','��̨����������ҵʱ���޷���ײ��ʩ?',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('040d78a7-5e15-405a-9ef1-afafa9c4aaaf','e4f2b15f-10c0-4f0d-9326-0f551213abdf','����ѹ�͸�ѹˮ��ѹ���а�ȫ��������У��ϸ�֤�飬��й�ſڵĳߴ��������кѹ��Ҫ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0432f9c6-93a5-4583-8595-5edd4f4e02fc','d84aa24c-d5bd-4fd4-bca3-263c625707d6','�Ƿ���ڳ�����ҵ���?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('04d266b4-11f6-4044-8c94-47224bcd4dec','d2cf710a-10dd-419e-8fbf-9337f6c0cfe4','�Ͻ�ͬһ�ܵ�ͬʱ����(��)���ϳ��ä����ҵ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('051b6e4e-d295-44f7-97c2-cbacf6026faf','5dbd0ce5-e64c-494d-924a-1d8462625cda','�Ƿ�����˷����������������������',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('051e89b2-2cf9-457e-88ef-74374fc34548','f33388d0-e584-4b0d-b5d3-9c1cb16c94a4','��˿���ж�˿���ɹɡ�Ӳ�䡢��ʴ�������۸�����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('057486aa-6688-4749-bfc4-9e07a7fe85e9','e2387152-9b1a-4447-9a25-e227a4f74767','֧��ģ���Ƿ�����˰�ȫ��������',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('05e9b4a1-ee0a-47d6-9323-2bed54f51b1c','09b01f67-3d8f-4143-8d14-b67fb9b8c034','����Ϸ�����ʱ���������Ҷ��Ҷ�',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('061330c5-e907-4313-86f0-4dc1ba9ef140','f0660445-1d00-4105-a1b9-277acc8acb81','�����Ƿ���',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('06b8e206-6d72-411f-8327-0f90dc459882','c8b8638c-0c0d-409c-82a9-30640b83a985','�Ƿ�����ˮ��ʩ?��ˮ�Ƿ�ͨ��?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('06e6b0d3-721b-4906-9768-4e7d62f221ee','c20dcb76-dd72-4b14-96c6-325ceacc948c','���辯���ߣ����þ�ʾ�ƣ���ר�˼໤',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('07c5219b-0923-40f0-a1df-25457bb49814','189a4cf1-8657-41a2-b7c4-b236c74d5645','δ�������ճ������ձ�δ��������ǩ��ȷ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0883a20d-5a86-4d88-b64e-39e5690f2150','e2387152-9b1a-4447-9a25-e227a4f74767','���յ�����������������',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('08b2dfc1-142a-4bba-84ae-73d0def6835f','14b27bec-7906-4d2b-8bcd-e49169e1a21e','ÿ10���ӳ��Ƿ���ɨ�ظ�',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0955b2b1-3a84-402e-b346-809624facffe','dd5e6f9d-dd6e-4fe5-9007-70c5d9ce06b6','�Ƿ������鳤��ȫ���������ƶ�',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('09b482db-df38-44c5-9a6e-2565097c98de','13aeb1e9-cacc-47f3-b4c2-73545e5d2ec8','���ظ�˿ĥ�𡢶�˿�Ƿ񳬱�?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('09fea9ee-fe61-4f8a-94a1-be75603f1ef2','845979c6-d39f-449a-94d9-fb26506061dd','��ҵʱ���ֳ��Ƿ���ר�˸���໤�����ý�����¼��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0a0badc1-2e59-4017-acd8-5a26cc5e67dc','68da4b77-9adc-4c5d-8f36-8a0fc935dd7a','ʩ����Ա�Ƿ��������ȡ�֣�á������谲ȫ������Ա������',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0a436a01-3912-4a21-ad65-65d9dfcc5e78','86479986-bdbe-4b54-8b3d-0be6e2288637','ģ�幤������ʩ������?�����Ƿ�����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0a50550d-9eb8-478b-bb84-98373cea9d59','6a42ccb0-1d32-4d7d-b8e1-75878b5dc8f1','�Ƿ���Σ��Ʒ̨��?�����Ƿ����?',8) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0a56b146-c398-4744-b11f-de17260898d4','09b01f67-3d8f-4143-8d14-b67fb9b8c034','�����׿ڡ�Ԥ���ڼӸǰ����Χ��',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0b46f421-c397-4abb-98e5-ac2509b8fa9f','c20dcb76-dd72-4b14-96c6-325ceacc948c','�Ƿ������ҵƱ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0b8f4d5b-65b7-4823-a51e-e7b880be947f','7149cfaa-492e-4bde-b0c6-c45022a74ca9','���������Ƿ����ýӵ�',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0c00edb2-88a3-4452-ba19-af9266719b2b','e2387152-9b1a-4447-9a25-e227a4f74767','ģ����ǰ��ģ�������Ƿ�����׼',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0cb2cb6b-3461-440b-a4aa-a39c8a46c1a6','52401d1b-43e6-47ec-8e04-abc81e4e6ca8','ʩ���ְ����Ƿ�����˳���Ӧ��ָ�Ӳ�������ȷ��Ҫְ��',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0dcbcebb-ea9c-4670-9551-7f82f5e92599','5dbd0ce5-e64c-494d-924a-1d8462625cda','�����Ƿ�LPEC HSE��������',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0e9e5dc2-ce6b-4bbe-a4ef-cb6db53fa83e','7325a7e4-b556-4d8b-adaa-08e01ad9b653','֧����ʩ�Ƿ�����ֲ�����?�Ƿ��ȡ��ʩ',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0ebf46af-9c80-4455-958e-16eba4fd9448','78f2f6ec-24a2-4e7f-9b6e-eec942cc30ce','�Ƿ��ڼ��ʩ����λHSE�����¼��̨��',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0f2b71b1-d9e3-49b0-b411-0f1113a78626','85b580d3-2fac-4589-ae7f-aa677cce456a','ʩ����е�����Ƿ񾭹�����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0f40adcc-615d-4bf0-9daf-4ef0f626e8e9','07167f93-7962-4f0b-8c63-6172a3e253a7','ģ������Ƿ����',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0f702f16-0339-499f-a6ed-5ea83e252f02','80734bec-785c-4744-92c2-9146721159f3','�豸��ȫ����������ȫ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0ff84c13-ee44-4036-a4a9-1d134df2663b','44b0ad52-36c9-4cc9-a8a9-967a2f59a737','˾���Ƿ����ƣ�ͻ�ƺ�ݳ�',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('10354da3-b658-4c4d-9a4b-0de87cc74e9d','7fb552c4-382f-4bdd-a3d9-651c4a4ccc44','�Ǹ�ʹ��ǰ�Ƿ��Ե�?',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('104b715e-3e5f-45d4-9c6d-2edb85b02cd9','1857a9bc-bd05-46f0-a1ec-07aebf283b19','����ģ�����Ƿ���ڲ����롢���ߵȲ����ϰ�ȫҪ�������',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('10621449-2e20-4001-8af4-758f3263430b','3109335f-7d58-4daf-b642-ab8bbe23305c','���͹����ѷ������ȶ���ʩ?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('10f44b02-f46d-4887-8891-0975193e83ba','189a4cf1-8657-41a2-b7c4-b236c74d5645','ÿ���ǰ���δ���м��',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1168f418-5473-4558-9f95-89a63a692036','5f36824f-ae8d-4ddd-90b7-c76e4d14b57a','�Ƿ���ȼ���ױ����������������ɾ���',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('11ad2127-62db-4464-a111-f2830a8f9874','e299e59f-0174-472a-9025-73f2e754b487','�����������ҵ��Ա�Ƿ�ϵ�Ұ�ȫ��/��ȫ��',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('11c899c8-7457-4e2f-ba73-251e33591d08','44b0ad52-36c9-4cc9-a8a9-967a2f59a737','�Ƿ�����HSE��ѵ�ϸ�֤���޷ÿ�֤��Ա',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('11fc906c-16b6-457a-940e-27b54874c4bc','acf769bc-854f-4e4d-a711-463df386cdbb','�Ƿ����������������־�����������͹�ҵ�������ֿ���ţ����ֱ���б�ʶ',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('125bef1b-b333-4fec-b090-dc995c7bd1b3','78f2f6ec-24a2-4e7f-9b6e-eec942cc30ce','��ĿHSE��֯������������ϵ�����Ƿ񾭹�����',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('126b3396-ff1d-471d-85aa-7e9ab1b4ddf0','3109335f-7d58-4daf-b642-ab8bbe23305c','¥��ѷ��Ƿ񳬹�1.6m�߶�?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('129de7d2-2509-497e-bcc3-56fdd3680f27','e299e59f-0174-472a-9025-73f2e754b487','��ҵ���ٱ��·�8�����÷������������߸��������á��Ϸ�ʩ������ǣ�רְ��ȫԱѲ�ؼ�顣',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('139d1cd1-4957-49ed-a259-36e7587ce7f2','3109335f-7d58-4daf-b642-ab8bbe23305c','��������ѷŸ߶��Ƿ���Ϲ涨?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1407930c-c505-4dba-b6ed-b2376103cd0c','e87e9a29-8a9a-4e20-9a03-69733f9c001a','���������ô����ȼ�ױ���Ʒ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('143238e0-9ae3-4020-a6cd-4a9918d2e6ab','25046ba3-7f1a-498d-b3fb-5d996a6dcbcd','���ع����纸�����ް�ȫ����֤�ϸڣ�',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1490c1ce-1352-4661-8d4b-ddfba688d773','e299e59f-0174-472a-9025-73f2e754b487','��ҵ�ص��Ƿ��к��ʵ�����/����������ʩ���������ּܣ�',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1541b245-4342-4aa1-a8db-8555a7f38d03','bf9f373e-a65a-4061-ac82-8107fd149bd7','�����ʩ�����ÿ��⽵ˮ���Ƿ��з�ֹ�ٽ������������ʩ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1580a236-14a8-4b0c-8382-c6138f472d0d','6ffdb168-e839-46b9-8c94-200cd46ca0b6','��ֱ������ҵҪ��ר�˼໤',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('15888c31-6634-4f69-b8c5-498e3c5de223','a6903b17-0743-4e6f-9e8e-6972dadf7e40','������װ�á��豸ʹ�ù����У����������װ�á��豸�Ľ����Ƿ����ý��Ӽ�¼',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('15af5e7f-309f-4a35-8648-a67db49e1eea','e417e882-ccff-43c4-b0bc-980e3d3d55d2','ʩ����֯�������������԰�ȫ����ס�޵ķ���',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('161abedb-a9b0-4968-9ae2-ce08b3aaa5d6','365041cb-e8d5-4a9c-a628-6782d667491d','�ƾ߰�װ�߶ȣ��ն��Ƿ����Ҫ��',8) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('17b100c3-7249-43eb-8a9b-60f937783689','bdbe9fb2-c771-4d49-b015-f82f0f22a3d9','ǰ֧����֧���治��ֱ���������',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('17e8767f-c71a-4af0-8f31-d9750354ea06','c454ca84-e2e6-4ac4-aff3-2a29270c88ac','�ڿ���ǰ�Ƿ������ư�ȫ��������/��ʩ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('17f653f2-098b-496a-8567-b504220874db','51331fed-663b-4e37-96b2-0a7f09889d7c','�������Ʒ����������ܷ�ﵽ����Ҫ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1838c572-b7f0-4148-98a1-445bac8f0ec9','749d84af-fe4e-44f1-9ad1-6a36193e3328','������·���ƾ߰�װ����2.4mʱ���Ƿ�ʹ�ð�ȫ��ѹ����',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('18998cfc-1adc-4a1c-a14c-5a7e922e2646','48838f9b-5f42-4ca2-965a-26db0c78bf87','��Դ����Ƿ�������Ӧ����ķ�����Χ�����������޷ǹ�����Ա',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('199545b7-7f28-466b-9901-e43b6737db29','222f1d0b-d990-48ec-9a97-9c4cf4e15c33','�Ͻ���׼���ߡ����Ӻ����˲����ĳ��أ�',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('19b8d2b0-1f3a-4ac3-89de-ef668f738b32','57bd144d-ba78-4f1f-8043-13e9810b35af','�������޶ѷŵ�',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('19e68eac-d5e1-4279-a7bb-2ae772977de1','b620dcfc-ae18-4d02-b28a-131765f2adad','ѩ�졢��������Ӧ���ѩ��˪�����Ͳ�ȡ������ʩ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1a2bca7a-c5f1-4a9c-8ffa-c7f8ce131c1a','7fb552c4-382f-4bdd-a3d9-651c4a4ccc44','���ػ��Ƿ���ȡ��׼��֤?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1a468afc-9bfd-4336-8a51-36e8f9191407','67d32618-1983-4e1c-b2b8-d648c4b88270','�Ƿ��а�ȫ��������',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1ae22999-8d57-41f9-b71f-74edcf930a09','bf154090-d4c6-4eff-90b4-18949bf18259','���������Ƿ���÷�����?�������غ��۶����Ƿ�',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1b5326ca-19c3-46ea-baf1-0b78f9852e1a','8c9df280-84a6-4292-8cc0-42ef231e55b5','�Ƿ��������곡����?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1bf27560-53dd-4e9f-b9cf-0492c3c74f72','8c9df280-84a6-4292-8cc0-42ef231e55b5','�ѷ��Ƿ�����?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1d33783b-6430-49b4-a476-96fb635cfa32','c7ba5d46-d93c-49b8-904c-cd44f86528f7','��ƿ������Ƿ��л�е���ˡ����κ����ظ�ʴ',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1d80e6ad-0457-4c9c-adc6-83c58d365dc6','ab5ac0de-4c65-4fb5-9e05-c990c40c4c96','���ص�װ��Ա���޿ɿ������?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1e24ee10-5a8f-41d0-99a3-1165203705c5','b06783bc-7267-4aaa-b501-9549dcd7e096','���ص�װ���޾����־?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1e4b1af6-83db-4d29-9da5-fda8a4af7e20','b0d4c8dd-5129-446c-b084-99db610f0f0e','�������Ƿ��ؽ��ּܸ߶��������û�Ƕ��Ƿ����Ҫ��',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1e5b88ec-c12b-4b47-8def-8be70c444ee0','356aab0e-c466-4228-97e6-4060e7ba92b4','�Ƿ���У����߻��ϸ�֤',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1eb17448-a34e-4f7d-a7f7-662586ede3a8','d73e1da1-c823-4abd-800c-b057bf54d7f5','���޼��ȴ�ʩ�ͼ�������?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1f28b770-ef54-41d8-8533-1f283db8af66','efa25d9a-0ddd-4a72-a92e-54cddc33ca07','�Ƿ�ʹ����о��(����)',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1f5671a3-f00e-4422-8a4c-9c63157ee3ad','88e3eede-7ecf-4396-a9ff-7557b5855af0','�������߶ȳ����涨�߶�ʱ���Ƿ�װ��ǽװ��?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1fc7da6d-95e9-41f8-add8-7f44a2a12c69','6f53fb3b-4693-4977-a7f5-833e0fc5b542','���������޲ʸְ���',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('200420b2-672d-442e-8059-a8d105000cc3','d84aa24c-d5bd-4fd4-bca3-263c625707d6','��ҵ�������Ƿ��������֧��',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('20e7b169-89de-4572-8f87-ab8e639f6605','7fb552c4-382f-4bdd-a3d9-651c4a4ccc44','���ػ���װ���Ƿ�����?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('21d41784-5d23-4445-8e21-64d03296a5d7','dd3b16b3-8582-4577-ab64-f47cc62a245b','�����ڿⷿ��ʹ������',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('221f16a3-a3f2-4075-9c71-029ac1104809','0ed3125e-e604-48c1-8e5f-21d5e9535def','�Ƿ����TN-Sϵͳ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2256b02b-4131-49cd-8bea-5192f70a5691','48838f9b-5f42-4ca2-965a-26db0c78bf87','�Ƿ���٤��ԴԴ�������¼̨�ˣ������Ǽǣ���ר�˿������ε��ˣ����÷��𡢷����ȹ�����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('22d7c48d-7819-49f9-9c33-f6e6f7e78df3','ab54ef75-9e0d-4d02-9dbd-a75da631cad5','©�籣��װ�ò����Ƿ�ƥ��? �������Ƿ���Ч',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('23987919-3827-4ef6-8b29-b21f5896cb7a','3dfeba3b-3306-4c3b-801c-bc8ebfc37a58','Σ��Ʒ����ʱ�������ϵ�?�Ƿ���к���?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('24029143-4bc0-40d6-bc7f-c470100478f4','f6aaca10-0e64-4d2f-bebb-c28e2db1155a','�ֳ����������ϴ���',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('246f0fb9-1771-435d-b5e1-44e0ea382403','85868409-021f-4292-862a-37ddb2377026','�Ͻ�ͬһ�ܵ�ͬʱ����(��)���ϳ��ä����ҵ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('268e85e6-3ac4-4256-8e13-2a0c998c52d0','f823abfb-8218-43cc-a160-bf0791b6f149','�Ƿ���ڳ����ڶ�Ź�ͶĲ���Ϊ',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('26d7ec9a-371d-4cf5-bdd5-56e0531a5930','c8b8638c-0c0d-409c-82a9-30640b83a985','���ص����Ƿ�����Ӳ������?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2780b6d8-ee0a-445f-95d8-75272e9834a2','57a55f3e-8913-4250-b9ae-732dfcf1905b','��ʽ�ܡ����ּܵ��Ƿ��з��ױ���װ�ã�',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('286fd894-f345-4300-ba76-50ee81ecf552','484c1208-524f-40ce-ba77-ac751e97879e','�Ƿ���ϰ�ȫ�涨Ҫ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('287f2bfd-f8c4-4a10-a8cb-cf2b84644065','6d0a9f00-7aed-4386-bafe-f2e7af0f24b4','�Ƿ�������Σ������Ҫĳ�ַ������ܣ�ѡ�û��ֹѡ��ĳ�ָ��˷�����Ʒ',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('28bde7e7-384b-4d1c-8b39-01785d278d4f','996c7f5d-2cbd-4cff-b386-7c5dd0be12d0','ʩ���ֳ��������Ƿ��д���?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2a44ae3f-4d1b-47e0-acfc-39159299d6a5','996c7f5d-2cbd-4cff-b386-7c5dd0be12d0','����ʩ���ֳ���Ա�Ƿ����������?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2a678341-49a1-480e-8f52-83075b89762d','ab54ef75-9e0d-4d02-9dbd-a75da631cad5','��װλ���Ƿ�ǡ��?�����Ƿ񷽱�',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2b66aa4d-5efb-41ce-809e-1d64b255d152','dd5e6f9d-dd6e-4fe5-9007-70c5d9ce06b6','�Ƿ���������ÿ��һ��������1��Сʱ���ҵ�ʱ�俪չ��ȫ���ÿ�°�ȫ�ʱ�䲻������4Сʱ',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2b8c35f1-e638-4f17-8e09-3e630f48b403','5dbd0ce5-e64c-494d-924a-1d8462625cda','ʩ���ְ����Ƿ�������������ϱ�LPEC��Ŀ����������',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2bfca697-8376-4bb8-b619-984de355ddbb','5ab6082e-f5d4-42d0-83e4-3cd1cdcd9b5c','����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2c1066cf-5278-437b-8075-2e9a1120c946','6d0a9f00-7aed-4386-bafe-f2e7af0f24b4','���˷���������ȫñ����Ŀ������ֺЬ�Ƿ���ڻ죨�裩������',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2e0529ee-4910-4aad-8179-990fd9c0b022','6a42ccb0-1d32-4d7d-b8e1-75878b5dc8f1','��ʶ�Ƿ�������׼ȷ?',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2e7eeb77-aa70-4aa7-96c0-c31229ef0938','ab5ac0de-4c65-4fb5-9e05-c990c40c4c96','��ҵƽ̨�ٱ߷����Ƿ���Ϲ涨?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2f12927a-9001-4530-8551-dcc8a0fe1d93','2e0177fe-678e-4fa4-9878-e18f28242a9b','���ְ�����Ƿ����Ҫ��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2ff71ee8-30e3-441e-8503-65154d3eabc8','f3e52048-4d3f-475e-8848-5ec3948a78fb','ͨ�������Ƿ����Ҫ��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('301c83c6-02f4-49e4-8856-b98119190f30','73184d82-a823-40fc-942c-fe91c8482ab9','�����Ƿ���ר�˹���?�����Ƿ�����?�ļ������Ƿ���ȫ',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('303c4806-9f17-4f19-a7a7-be2a413cd59a','acf769bc-854f-4e4d-a711-463df386cdbb','�Ƿ��ڽ�����������ָ���־����������ڷ�����ɢͨ�������',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('307bdfa0-2c52-451b-a212-da8fb1ab2202','365041cb-e8d5-4a9c-a628-6782d667491d','����ϵͳ�Ƿ����1:1�ĸ����ѹ��',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('325aa48b-e90f-43c6-84c0-ca3377257465','3dfeba3b-3306-4c3b-801c-bc8ebfc37a58','������ⵥ?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('327c1cb5-70e5-4f1f-a898-4c778b0daf17','b050a452-78a0-44a9-9bac-b9f5c6d213cd','������Ա�����Ƿ���б���',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3340764f-f0d4-4f5b-819c-acb0e58b9322','0ed3125e-e604-48c1-8e5f-21d5e9535def','���������빤�������Ƿ���',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('33477f45-0eee-4fd2-9b5a-dd798e7a93a4','3dfeba3b-3306-4c3b-801c-bc8ebfc37a58','����Σ��Ʒ�ֿ��������Ա��������������ҵ����',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('335a30d3-ab06-45a6-ac38-7a1e9f32db2f','6a42ccb0-1d32-4d7d-b8e1-75878b5dc8f1','ǽ�����Ƿ���Ϲ涨?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('338734d5-cb2b-4594-9b44-5b5cb52b7c1e','25046ba3-7f1a-498d-b3fb-5d996a6dcbcd','˾���Ƿ��֤�ϸ�?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('33977f74-c3fb-4cec-8a4d-02a2071361cf','b6bac4a0-a5d5-438a-9a8b-8eaa2218dcb2','���߲���ʱ�Ƿ������㹻����',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('33ba44f5-a37f-4d49-ab92-15434bdefb16','efa25d9a-0ddd-4a72-a92e-54cddc33ca07','�ܿ���·�Ƿ����Ҫ��',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('34ba17c4-46f9-4cde-b1d5-de27a1044785','356aab0e-c466-4228-97e6-4060e7ba92b4','�Ƿ��������������ҵ���֤������ʩ���ְ���HSE�����ź������쵼��׼�󣬷��ɽ���������ҵ',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3534d3b2-203c-4ec8-a0cd-bbaf7fc0f16e','5dbd0ce5-e64c-494d-924a-1d8462625cda','�Ƿ����з���������֯��������Ч����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3542b804-c97c-4355-999e-20537020fc98','b25021e1-de89-4297-bbf7-b74697ac1e9a','�Ƿ�������Ұ�ȫ������̡�',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('355b55ba-34a7-46ea-9303-4028bc30e761','a6903b17-0743-4e6f-9e8e-6972dadf7e40','��ҵʱ���ֳ��Ƿ�������������������ҵ��Ա���ܽ���������ҵ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3590fc76-7565-41cc-b3a7-b094cee5e1dc','85868409-021f-4292-862a-37ddb2377026','��������ʹ�÷����ƾ�',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('35c44dfd-c342-4590-bd39-f1d4a4219249','6a42ccb0-1d32-4d7d-b8e1-75878b5dc8f1','��������Ƿ���Ϲ涨??',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3665ed4b-8e25-43e6-b01d-57d277e9843b','acf769bc-854f-4e4d-a711-463df386cdbb','ʩ���ְ����Ƿ�����ʩ��������������ؾ�ʾ��־��HSE��ʾ��',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('36d63187-0b20-4bf2-9c89-73f23b43ca78','4ee8f944-5b80-45ae-8e60-3c48ef2d26e9','�Ƿ�����֤��Աʹ����������Ȳ��ƿ��ҵ',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('377b500f-3cb4-4d4a-8b4f-a0fc9c2ed906','57a55f3e-8913-4250-b9ae-732dfcf1905b','�����豸����·�ľ�Ե�Ƿ�ﵽ����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('377e7d43-b5c2-4558-b4db-ed19d66e6613','e90279e7-e307-4075-9fd4-42cd585b0aeb','�Ƿ����ð�ȫ��ʾ��־',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('37d4c5c8-bdd7-4581-9f5d-23aef124a6d7','4733b9e2-8cf7-4caf-829a-a07ec1eab5f5','��������˽��㴦�Ƿ񰴹涨����С���',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3866764c-4752-4871-a544-a70944c7e34e','bf154090-d4c6-4eff-90b4-18949bf18259','�ֿ��Ƿ��䱸�㹻��������ʩ�����˵���������?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3926fd67-fb2b-479b-b508-153bb7f44769','d2cf710a-10dd-419e-8fbf-9337f6c0cfe4','��ֹ�������ô���֡����ߡ�������',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('393b957a-97a7-4ff4-9148-724c7deece41','ab54ef75-9e0d-4d02-9dbd-a75da631cad5','�Ƿ���ϡ������������������Ҫ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('397fdbfe-d4ff-43f6-873d-0e350ee564c6','cf0bd845-0b30-4a42-b255-1a6c8a70900a','��ҵǰ�Ƿ��ɼ�����Ա�����޿ռ���ҵ��Ա���а�ȫ�������ף��������ʩ����Ա����ǩ��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3a6acf02-3a3d-4acc-8313-03a3cb828398','ab54ef75-9e0d-4d02-9dbd-a75da631cad5','�Ƿ�������һ����һբ��һ©��һ�䡱',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3b7a1c5c-db9f-4a62-b072-5807b7ad0619','e6b2580e-db2b-4bb5-a22c-353ec169f1e9','ֵ����Ա��ʵ���',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3b836e4b-be49-48f1-b8a2-82024180c1d9','48838f9b-5f42-4ca2-965a-26db0c78bf87','��Դ�����Ƿ���Ϲ涨����ȫ��Ա��������ҵ��ԱѺ�ˣ�ͬʱ�����÷�����Ʒ',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3b8d99dc-c923-4fb1-ac49-5d45c9840af0','bdbe9fb2-c771-4d49-b015-f82f0f22a3d9','���һ���ǰ֧��֧���ڽ�����Ů��ǽ�ϻ����ܱ�Ե',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3c7ab826-237f-4f90-a87c-a1de6d06ed6b','c2f10e79-a2ec-46cd-a451-c74a5139beb1','ж��ƽ̨֧��ϵͳ��������ּ�����',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3d0a40cb-293d-4581-938d-c84c1096010d','1975bb25-94e9-4fd5-a74f-31fb39890b6d','��ú���ж���ȫ��ʩ��ʵ�����',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3d0ddf8c-6489-46e9-a641-03b77ac96c37','7325a7e4-b556-4d8b-adaa-08e01ad9b653','����֧���������Ƿ������Ʒ���',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3dcb9bb0-7b2c-440b-9aea-f7eef9c1ed9b','1975bb25-94e9-4fd5-a74f-31fb39890b6d','�����ְ�ȫ��ʩ��ʵ�����',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3ea9d2cc-0f43-4890-b678-d82d630a1097','f33388d0-e584-4b0d-b5d3-9c1cb16c94a4','�纸��ҵʱδ�Ը�˿����ȡ������ʩ',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3f330521-3ecd-4f50-ac43-b0375f733ebd','d94747b0-d340-4755-89c5-e7a90588ed4b','����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3f3618e8-ca73-4d69-b17e-5f3c37f7e5d7','79727f49-9c90-42fa-9547-9f0445972810','բ�ߡ��۶����������豸�����Ƿ�ƥ�䣿��װ�Ƿ����Ҫ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('40d3dfb1-7461-4a3c-8dc1-09c382194a97','6ffdb168-e839-46b9-8c94-200cd46ca0b6','�����׿ڡ��ٿ����Ե����׼��Ϣ��ͣ��',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('41bd42df-c0ed-46c3-9c92-9e502f97b512','612a5624-6126-475a-8c9c-c036a4a0da95','���ػ���ҵ��������Ƿ����˵����Ҫ��?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('424c79d7-54e1-4796-b78e-c74114609fc7','7e9215ee-a40d-49ef-abb2-643131cbdbda','��е�豸ʩ����۱߾����Ƿ����Ҫ��?��������Ҫ��ʱ���Ƿ�����Ӧ��ʩ����ʩ�Ƿ���Ч?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('42bf4afd-44d4-4ca5-9153-24e3376c086d','57a55f3e-8913-4250-b9ae-732dfcf1905b','�ߴ������Ƿ��з��ױ���װ�ã��ܷ�ﵽ����Ҫ��',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('43f7f41a-0416-4559-aaa8-8045c46d7105','44b0ad52-36c9-4cc9-a8a9-967a2f59a737','�Ƿ���ʩ���ֳ�ͨ��֤',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('445cc02e-4236-444e-b494-be378ce3643e','dd3b16b3-8582-4577-ab64-f47cc62a245b','�����ƷӦ���ࡢ�ֶ�洢',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4476b63c-5ef9-44ee-984e-fb62c1afe6ee','897ea9a2-29c3-4254-8e76-424759300e9f','��ҵǰ,������Σ����úþ����ߡ�����ƣ�������������˲ʱ������С��2΢����/Сʱ',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('44d02c5d-6de7-4424-bed7-23d29e6064bf','c9b216ab-e5cf-4bdc-bb8e-164a003fbdca','��Ŀ�����޶԰�ȫ�õ羯ʾ��ʾ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('44d7df48-3043-45b5-994e-2176628dd8c0','bdbe9fb2-c771-4d49-b015-f82f0f22a3d9','��֧��δ�̶���ǰ֧�ܵ��ڸ������������ӵĽڵ㴦',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('455115c0-7d06-4c77-95cb-a2aaac398394','52401d1b-43e6-47ec-8e04-abc81e4e6ca8','ʩ���ְ����Ƿ���¹ʽ��е�������������涨�����ƺ�����',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('45aca3c2-d86a-4ff2-aa96-d6a8810c862a','189a4cf1-8657-41a2-b7c4-b236c74d5645','���ּܴ���ǰ�Ƿ񽻵�',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('461cf988-17ef-49f6-9d2d-70544f7519ef','5ab6082e-f5d4-42d0-83e4-3cd1cdcd9b5c','����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('46238611-aa11-4093-bf06-f4bc81cb02fd','f0660445-1d00-4105-a1b9-277acc8acb81','���ּܸ߶���7m���ϣ������뽨���ṹ�����Ƿ���Ϲ涨Ҫ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('46273dfe-ec69-4c78-a57f-3f37523745be','2d09b36d-38da-4704-b422-a027ab146bfb','�Ƿ���������ӿ��ڣ�������ר����֤',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('466b5c9e-3d0e-4c26-842e-ddf343ea635c','0da8615d-7683-4766-ac90-600cebe156cb','���а�ȫ��������',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4696ff08-226b-4099-91a3-ed3e919bbf42','e90279e7-e307-4075-9fd4-42cd585b0aeb','�Ƿ񰴹涨���÷���װ��',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('470b893e-ef84-47a4-afc9-db6524f2cb99','8c9df280-84a6-4292-8cc0-42ef231e55b5','���������ѷ��Ƿ�����?�Ƿ������ơ�Ʒ��?',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4722989f-b9a1-4b21-b3f8-6be4fa959a24','85b580d3-2fac-4589-ae7f-aa677cce456a','�Ƿ񰴹涨��������?�Ƿ���',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4780e567-a701-4824-8a19-758a8d924eb2','c01870ef-3b85-476d-94f3-277ac8dd46d4','��Ա��������ר��ͨ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('479c8f63-d8aa-4d94-bee7-b2d96b12d076','e94c80fd-0fed-4f77-a839-1a009c93cd37','��ȫӦ����ʩ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('47a4cb00-e914-406a-9f14-6ef0ea4938d3','6ffdb168-e839-46b9-8c94-200cd46ca0b6','�޸�Ѫѹ�����ಡ���񲡵Ȳ��ʺ��ڸߴ���Ҳ�Ĳ�֢',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('47e41c37-e22e-4079-ae5f-d74d80da2d4d','f823abfb-8218-43cc-a160-bf0791b6f149','ʩ���ְ�����Ŀ���Ƿ�����ȫʩ���ֳ��Ĺ�����ȫ���ΰ�������֯��������ʵ������ȫ����������',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('47f51dd8-baf1-4edb-8c8c-d02b50412f90','c454ca84-e2e6-4ac4-aff3-2a29270c88ac','�Ƿ������ƺ��伾��ʩ����ҵ��ȫ��������/��ʩ������������',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4814422c-79fe-43c2-ba75-51ef1f763681','dd5e6f9d-dd6e-4fe5-9007-70c5d9ce06b6','�Ƿ��������鰲ȫ�����Ͱ�ǰ��ȫ�����ɰ��鳤ָ��һ��ְ�������¼����¼Ҫ����鳤�Ľ���ͬ������',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('48c6e73c-9920-41e5-a302-e20ab7c45399','4ee8f944-5b80-45ae-8e60-3c48ef2d26e9','��������Ȳ��ƿ��ƿ�塢ƿ���Ƿ�����֬',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('491c865a-e083-4cad-b03f-9e77b0ec37ed','105b10cc-f4a6-482a-96c4-161ceeed80c4','Χ�������Ƿ��̡��ȶ�������?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4952f544-5ece-4d9e-bbaa-c1d0fb81ade9','c454ca84-e2e6-4ac4-aff3-2a29270c88ac','�Ƿ��Σ���Խϴ�ķֲ�����̽���ר����֤',11) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('49c902f5-2781-4fe7-b37e-583c9f026a32','b2e48682-2117-445c-9c18-eea717c1d8ef','�Ƿ��������ҵ��Ա��������ѵ',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4a1365dc-35f0-4da7-be2e-2992d1ad88ce','09b01f67-3d8f-4143-8d14-b67fb9b8c034','���ڼ���ż����ˡ����ࡢ�ɶ��������ʱά��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4ba43d63-00cb-412d-a8fb-9e84aaf81af8','dccda995-156c-4c35-aa6d-b23f69561091','��ȫ�����Ƿ���Ϲ涨Ҫ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4bf4c267-a519-4be2-b70a-3c7112a65a4d','105b10cc-f4a6-482a-96c4-161ceeed80c4','Χ���Ƿ��ع���������������?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4c15ea11-b9f8-4250-9dbc-12b05f9aec2a','bf154090-d4c6-4eff-90b4-18949bf18259','�ֿ��Ƿ��б���װ��?����װ���Ƿ���Ч?',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4c4829c5-35d9-4d72-b67a-f0fc53d14eb7','14b27bec-7906-4d2b-8bcd-e49169e1a21e','ÿ10���ӳ������Ƿ��е�������ľ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4c644b23-b595-4694-a1e4-2d61df9509fc','c01870ef-3b85-476d-94f3-277ac8dd46d4','���õ�ͨ���Ƿ����Ҫ��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4cbabcd3-28b6-4fa7-8734-6a087240b2ba','efa25d9a-0ddd-4a72-a92e-54cddc33ca07','��·�������ޱ���',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4cd865b0-f58f-4b53-9bce-ec89800d47db','c8b8638c-0c0d-409c-82a9-30640b83a985','��ů�����Ƿ����̻�����?',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4df7044e-21ef-421e-a20a-53dad5dde0eb','cf0bd845-0b30-4a42-b255-1a6c8a70900a','�����豸��װ�á��������ӵ�������ǰ�Ƿ�����к����ʶ��ԡ���ȼ�Եȼ�����',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4e0d5359-bd50-4686-aeb9-12b51bda2c24','f823abfb-8218-43cc-a160-bf0791b6f149','�Ƿ�Я����ʹ�����������Ƶ��߻�������������Ϊ����',8) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4e1243bf-4c01-421b-8051-cf7790257903','44b0ad52-36c9-4cc9-a8a9-967a2f59a737','˾���Ƿ��м�ʻ֤���г�֤',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4f8457e9-f15c-4ae6-aa62-40f9838132a7','c454ca84-e2e6-4ac4-aff3-2a29270c88ac','�Ƿ�������ء�������ҵ��ȫ��������/��ʩ',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4f8d1e90-38a1-4ca2-a9d2-963cb85f35fd','c1eaa17b-90d0-4424-8990-5d15b806a047','ʹ�õ����ӽ��߲��淶',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4fd0bc1b-8873-4266-890f-0f2400f15c65','365041cb-e8d5-4a9c-a628-6782d667491d','��·���谵����ʸְ���',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('50380a9b-e9dd-4567-855a-4c880d08093d','356aab0e-c466-4228-97e6-4060e7ba92b4','�Ƿ�������Ա�볡��ѵ',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('50385c41-7a7d-41dd-805c-2bb96e21f697','ab54ef75-9e0d-4d02-9dbd-a75da631cad5','բ���Ƿ����Ҫ��?������',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('50396c1f-0fb2-4449-97b2-0da0af6dc4c0','b620dcfc-ae18-4d02-b28a-131765f2adad','�������ϴ�籩��Ũ��ȶ���������ֹͣ��ҵ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('503cf2ac-0eb6-492d-899e-3f386b1c206f','d64c102c-49e9-424f-a65a-844639a598a7','ʩ������ּ��������뽨����֮���Ƿ���з��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5081825d-38b6-4fcc-88c0-73288f61593f','09b01f67-3d8f-4143-8d14-b67fb9b8c034','ƽ̨���ְ��������Ρ��ٿ����л������ˣ���׼��̽ͷ��',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('51acf77e-1a46-4cd9-90a4-3661c8c16297','54fbf80c-0437-4b3d-8e45-01a94013e103','ľ��ֱ���������Ƿ����Ҫ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('51c71a84-bd6f-472e-8ed3-5aed0f89679f','acf769bc-854f-4e4d-a711-463df386cdbb','�ڴ���Σ���Ըߵ���ҵʱ���Ƿ���а�ȫ��ʾ',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('524122cc-c6a2-4f93-926a-07984b442468','c454ca84-e2e6-4ac4-aff3-2a29270c88ac','�Ƿ������ʱ�õ簲ȫ��������',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('524cb49c-115b-4e31-825a-ac64a8e6c490','85868409-021f-4292-862a-37ddb2377026','��Ӧ��ͨ���������ȣ�',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('52fbb222-d39c-40e4-8a57-fd30593626ad','88e3eede-7ecf-4396-a9ff-7557b5855af0','��������������?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('530b35d6-7197-458e-ae0f-d6b3126094c5','4733b9e2-8cf7-4caf-829a-a07ec1eab5f5','���ż���С��˲���ǽ���Ƿ����24cm',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('53138885-cdb2-4aad-95dc-d87d919298a8','48838f9b-5f42-4ca2-965a-26db0c78bf87','��Դʹ����Ա�Ƿ��з�������',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('53b8c21f-a760-4d4f-a011-0f63df1ddcc3','0a61cbd4-236d-4b9a-bb52-f72736c0f8fb','�����䱸�������ĺ��λ������ƿ����Ȳƿ����Ȳ�������Լ�������ȼ����ȼ���ϱ�����Ч����',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('53d60bd2-66dc-4d92-bac2-55f0a7dcd2ff','f33388d0-e584-4b0d-b5d3-9c1cb16c94a4','��ȫ��˿��������',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('54538995-1134-41d1-a75c-beb19f1f677c','78f2f6ec-24a2-4e7f-9b6e-eec942cc30ce','�Ƿ�����ȫ����ĿHSE������ϵ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('55c7cd29-b6c5-495c-a81d-1c921bc07e94','e90279e7-e307-4075-9fd4-42cd585b0aeb','������Ա�Ƿ�����Ͷ����ſ��˺�ǩ���İ�ȫ����֤��',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('56360fe3-e613-4f60-9f7d-bd265a6ed7eb','6a42ccb0-1d32-4d7d-b8e1-75878b5dc8f1','�Ƿ��ڼ��Σ��Ʒ�������?���������Ƿ�ʱ���д���?',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('569c8db6-8d4f-4aa2-9355-75b29421913e','efa25d9a-0ddd-4a72-a92e-54cddc33ca07','���¼���������Ƿ����Ҫ��',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('56d59fe7-e05b-45ee-bc4e-4579b297bcbc','51331fed-663b-4e37-96b2-0a7f09889d7c','�������ʩ��ʵ������ܷ�ﵽ����Ҫ��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('56eff197-cd76-4e83-8404-7c67aa004ebb','48838f9b-5f42-4ca2-965a-26db0c78bf87','��Դ�볡������ǰ�Ƿ��չ��ҹ涨�򵱵��������߲��Ű���׼������',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('57426021-11cc-4ce5-9c88-6c033b5df953','365041cb-e8d5-4a9c-a628-6782d667491d','���ء������߶��Ƿ�Ϊ1.3��',9) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('575462e3-6dd7-479e-80e0-49fc6e5a4a21','bdbe9fb2-c771-4d49-b015-f82f0f22a3d9','���ؿ�δ�̶���������������ƹ涨',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('59cc59e0-d2fa-4d73-bee7-e342f9b9a63a','4ee8f944-5b80-45ae-8e60-3c48ef2d26e9','�����Ƿ��ϻ���ѹ�����Ƿ�����',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('59e2ef41-685a-4e23-89dd-7a6ab7911d88','210faabe-1cbe-435b-b891-b5dd40a3bf9a','�Ƿ񰴹涨���л���֧�����μ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5a39b7fe-053d-4077-b9d1-494f1336db01','52401d1b-43e6-47ec-8e04-abc81e4e6ca8','Ӧ��Ԥ�������Ƿ�ȱ��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5a541a57-4e70-4364-8bb1-b67e1f3496f9','4ee8f944-5b80-45ae-8e60-3c48ef2d26e9','ƿ�����岻���þ����Ƿ����в�С��0.05MPa��ʣ��ѹ����',10) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5b07f1c1-4223-44c1-9de6-af64590b55b2','acf769bc-854f-4e4d-a711-463df386cdbb','ʩ���ְ����Ƿ��ڹ��ҡ���ȫ�����µ��ڼ��Ա������HSE���������',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5b1a5cab-0f41-409a-86fe-7d982a7f9d04','80734bec-785c-4744-92c2-9146721159f3','�ֳ���ȫ�ٱ߶����Ƿ����',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5b363179-eb72-4ae7-94c4-a4efd5d06d3f','ab54ef75-9e0d-4d02-9dbd-a75da631cad5','���������޸��뿪��',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5b4455a2-d7ab-4ba8-a393-56f03e26f168','365041cb-e8d5-4a9c-a628-6782d667491d','���߽�����Ƿ���и��ɼ����������',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5bd7a7cf-3f4d-4b2d-b85b-e62ae3edad6e','b6bac4a0-a5d5-438a-9a8b-8eaa2218dcb2','��ҵ��׶����ٱ����޷�����ʩ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5c48286b-a23f-4d9a-9b0f-d2b73d098bdb','e90279e7-e307-4075-9fd4-42cd585b0aeb','�����豸�Ƿ񾭵ء����Ͷ����ż���ϸ�',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5cd3d86d-ea2f-494c-95ee-f950c352c982','14b27bec-7906-4d2b-8bcd-e49169e1a21e','ÿ10���ӳ��Ƿ�����ˮ��ʩ',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5d7115b5-7376-461d-82d4-c4c3971d8024','15243898-2109-4ba0-a3e7-bb9569b9e3c4','��������ҵ��Աδ����ȫ���ð�ȫ���۹����ڶ������õ�ר�ð�ȫ����',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5da77270-dced-4d3b-a219-bed6cec2e4a2','f823abfb-8218-43cc-a160-bf0791b6f149','�Ƿ���ڳ��������ƺ�������Ϊ',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5e208321-b70a-404d-94d4-f1fb74787fa1','0ed3125e-e604-48c1-8e5f-21d5e9535def','�����ӵ����ظ��ӵ��Ƿ���Ϲ涨Ҫ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5e909a67-6b35-4d7d-a041-acf87b321caf','612a5624-6126-475a-8c9c-c036a4a0da95','�����̵��ʩ�Ƿ�ﵽҪ��?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5ebfc5d9-8da7-4ee4-833c-0ae326bdfbbc','f716ddb1-3128-4608-b03e-d25811c8002a','�ھ����ᡢ��ȸ�ʴ���ʻ�ѧ����Σ�յĳ����Ƿ����ϴ�豸',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5f57a3f2-f88e-4bd2-8f58-603ea0c838fb','c2f10e79-a2ec-46cd-a451-c74a5139beb1','ж��ƽ̨�Ƿ���Ƽ���',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5f59f8bd-8fdd-4a90-bbd1-4e71b1fd453d','0effae99-5429-4b76-8c52-c2138fa8ad66','δ��װ��׹��ȫ����ȫ��ʧ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5f885d07-5196-4fea-9185-bc29b8d83f77','845979c6-d39f-449a-94d9-fb26506061dd','�๤�ֻ�Ͻ�����ҵ���Ƿ��ֿ��Ǹ����ּ���໥Ӱ�켰��Ǳ�ڵ�Σ�ա�',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5f892647-33a4-45d4-a03e-f1e6d79f8863','c454ca84-e2e6-4ac4-aff3-2a29270c88ac','�Ƿ�������������ҵ��ȫ��������/��ʩ',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('60996980-9a26-4f36-bffb-c5db2f7255da','b2e48682-2117-445c-9c18-eea717c1d8ef','ȫ��Ա���Ƿ�μ����ܳа�����֯�Ķ���HSE��ѵ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('60d48cd0-f66f-4381-8bef-4f3dfddaf76f','d458f341-8d70-4a7c-ba22-93c6dfba1ba7','�Ƿ���ʩ����ҵǰ����ȫ��ҵ���֤',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('618aaf97-305e-442d-923d-55f5f2972bd5','85b580d3-2fac-4589-ae7f-aa677cce456a','��������ҵλ���Ƿ��ι̡���ȫ',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('61dd0501-24f9-48d8-bef3-aed890cf5329','1a47c5fd-87a4-40ca-9ac8-8a6413f5cdd1','����ʱ��ֹ��������Ȳ��ƿ����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6218aa78-c7a0-45c9-bd95-517a1fcd7d70','ba1bc0fc-f118-4f2c-b148-68adf474b7c4','ģ����ǰ���޻�����ǿ�ȱ���',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6268009d-893d-43a1-a48c-f010b022a259','f823abfb-8218-43cc-a160-bf0791b6f149','���й���ʱ�Ƿ񰴹涨��װ�������Ϲ���Ҫ����ͱ���װ',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('62eec6c3-e386-43b2-943e-2a85ce5c4277','cf0bd845-0b30-4a42-b255-1a6c8a70900a','�Ƿ��ڰ�������޿ռ���ҵƱ��������ҵƱ�����ء��������ߡ�������',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('63118ffa-df08-4f73-91a5-106cfa01ba81','0effae99-5429-4b76-8c52-c2138fa8ad66','δ���谲ȫ��ר�ð�ȫ�������ۻ�ȫ��δ�̶�����δ��װ����λװ�û�����λװ��ʧ��',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('631847bc-17e0-42fc-98c9-2482f41d43e6','54fbf80c-0437-4b3d-8e45-01a94013e103','�ֹ��Ƿ���������ʴ����',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('633f6eb0-7fea-4724-9f6d-6d67765ff236','e3e137ae-67fa-41fe-acc5-bdae3a2bc6d0','��ģ������������������ߵ����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6415bdc8-a1ce-4793-b802-ee07db049927','6ffdb168-e839-46b9-8c94-200cd46ca0b6','��׼������������������',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('648b66d2-8990-42e1-9294-f5f3c6a65530','bec226c6-94d9-48ad-bfe0-ecf870eab252','�����Ƿ�淶�����룿',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6514ece8-8e86-4f9e-9147-695c1bf43eaa','7e9215ee-a40d-49ef-abb2-643131cbdbda','�������Ͼ߶ѷž�۱߾����Ƿ������ƹ涨',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('652b7254-8f4a-400e-b6cd-ab128b6580ee','d7397073-d676-4e83-9b7f-42ac2c296964','���ް�ȫ����(��ҵ)�涨?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('65a2f66a-8ebd-441b-85fc-f9e0df70fdee','3dfeba3b-3306-4c3b-801c-bc8ebfc37a58','���޳��ⵥ?',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('66184f2d-4c7b-4d0d-8af2-4b1e974e4a7e','c7ba5d46-d93c-49b8-904c-cd44f86528f7','��ƿ����ɫ����������ɫ�Ƿ�����йع涨',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('66af1a18-6d92-4e3c-9b16-6ec7f75bf464','7466bf20-11c8-4af7-a1ae-7e3b781e0e0e','����ƽ̨�ܱߵķ������˻򵲽Ű�����ò����Ϲ淶Ҫ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('66efbdac-b693-4717-b60e-3c2844962048','5f36824f-ae8d-4ddd-90b7-c76e4d14b57a','������ȼ���ױ��������',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('675a9235-8721-4346-a626-862acebd95da','15243898-2109-4ba0-a3e7-bb9569b9e3c4','��������ҵ��Ա��������2��',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('681195f0-ad4c-4dad-9321-439056809070','b6b1d0cc-5482-4334-a371-414353c0148a','�����豸����ֱ�����豸�����蹤�̵�',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('68126764-9686-4797-97ec-b82cc4c2d69f','acf769bc-854f-4e4d-a711-463df386cdbb','ʩ���ְ���Ӧ�Ƿ��ȡ���ַ�ʽ����HSE���������',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6849bc17-8201-450b-b7dc-8b63936853f4','2e0177fe-678e-4fa4-9878-e18f28242a9b','�Ƿ���̽ͷ��',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6862fb08-0c6e-4003-9d7a-fb6d55883774','c9b216ab-e5cf-4bdc-bb8e-164a003fbdca','��Ŀ�����޶��õ�Υ��Ѳ�顢�����¼',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('68cebf09-08df-4603-9dbc-18bf3699a7f5','666353e6-62f4-4e5e-ba3b-9faa6e9337da','�ֿ������Ա�Ƿ���ѵ�������˺ϸ���֤�ϸڣ�',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('699a02c3-bed0-4c04-b62f-3a39b4b29668','e3e137ae-67fa-41fe-acc5-bdae3a2bc6d0','�ߵ�����Ƿ��ȹ�',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6ba4f38b-75fa-436f-a3b7-21ec7e5dfb53','b06783bc-7267-4aaa-b501-9549dcd7e096','�Ƿ���ר�˾���?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6bdd0ca3-1a6d-4b72-ae90-ba6e5a7dd47b','f823abfb-8218-43cc-a160-bf0791b6f149','�Ƿ�����ֳ���������Ա���ҵ��ͳһ�������ֳ�����֤���Ƿ񾭹�ҵ����һ��HSE����',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6cca1a9d-b111-437e-9e20-0cacf20d6a3b','b2e48682-2117-445c-9c18-eea717c1d8ef','ȫ��Ա���Ƿ�μ���ҵ����֯��һ��HSE��ѵ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6d14587c-3e17-4b31-9152-b8741bc3613a','897ea9a2-29c3-4254-8e76-424759300e9f','��ҵǰ���Ƿ񻮶�����ҵ���䣬ȷ����ҵʱ�䣬ȷ����Χ�޹���Ա��ȫ���롣',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6d9630fd-059b-46f1-b0f7-916ebc9c16d7','3dfeba3b-3306-4c3b-801c-bc8ebfc37a58','�Ƿ��ȡ�����ʩ��',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6e0bd7fb-e57a-4f73-be9d-7ae65453769f','e4f2b15f-10c0-4f0d-9326-0f551213abdf','��ѹ�豸������Ƿ�װ�����',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6e6a9464-fd83-4040-bca2-737ce5f67e4d','78f2f6ec-24a2-4e7f-9b6e-eec942cc30ce','�Ƿ�����ȫ����ĿHSE��֯����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6fcdc6ba-8b1a-4591-8df0-188ce555a14a','ed1b5241-4e32-4862-8b3e-a7f367c9e93b','�ٱ߼����������Ƿ����Ҫ��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('707bad72-7072-4f88-b4ad-92be5f8977a6','c1eaa17b-90d0-4424-8990-5d15b806a047','�����ҽ��Ҳ�����',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('70edc996-67db-472e-b363-59972b15fa10','bf154090-d4c6-4eff-90b4-18949bf18259','����ͨ���Ƿ�ͨ��?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('719954b1-140d-4ed3-ab7c-e1fc482d8fb6','b620dcfc-ae18-4d02-b28a-131765f2adad','�����帽����ҵӦ���ֹ涨�İ�ȫ������ȡ���������ʩ',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('71ac1488-9b64-47a7-93c6-98c0fbfb663e','210faabe-1cbe-435b-b891-b5dd40a3bf9a','�Ƿ񰴹涨�����ڽ��������Ҫ���ߺ͵�·���г����۲�',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('71d35589-d874-47ab-9141-00f0640f808e','7d2095fd-47e4-4ba0-8af6-aa88acbb0b99','ʩ���ְ����Ƿ����й鵵���Ͼ���Ψһ�ı���ұ������',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('71dc5d12-db8b-4b57-a20b-866b3bbc8b2b','845979c6-d39f-449a-94d9-fb26506061dd','�����У��������Ƿ��ϸ����ر����ֵİ�ȫ������̣�',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('71f76661-7c90-4cc2-b805-d4e4f7d900e4','0da8615d-7683-4766-ac90-600cebe156cb','�ֳ��ķ�������',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('72039bd3-68a9-4563-b0f4-18bf70467015','e417e882-ccff-43c4-b0bc-980e3d3d55d2','���ް�ȫ�õ硢�������������ʾ��',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('721128fc-0297-4053-a837-62d817958511','356aab0e-c466-4228-97e6-4060e7ba92b4','�Ƿ��������װ�ù������֤',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7242fd8e-56a3-4271-b8ce-272d9e7daba0','f716ddb1-3128-4608-b03e-d25811c8002a','�Ƿ����ְ��ִ�в�����̣��ռ���������֪ʶ����ȷʹ���Ͷ�������Ʒ�ͷ�����������',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('72f312ba-2d1f-4202-aa54-7031a55735aa','2d09b36d-38da-4704-b422-a027ab146bfb','���ӳ���5m����ר��֧�����',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('740871e8-29f0-4073-a18f-5ded2e4d91c5','bf9f373e-a65a-4061-ac82-8107fd149bd7','����ʩ���Ƿ�������Ч��ˮ��ʩ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('741a916c-b010-4f05-9d3a-f2f67527ab9d','c7ba5d46-d93c-49b8-904c-cd44f86528f7','��ƿ����ʹ�ü�¼�Ƿ���ȫ������',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('74c3f5a7-66cd-4b15-af71-5df28ab6204e','e417e882-ccff-43c4-b0bc-980e3d3d55d2','������Ŀ��ȫԱ���������õ簲װ����¼',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('74d317eb-e9c9-45f9-890d-5da02380c036','44b0ad52-36c9-4cc9-a8a9-967a2f59a737','�Ƿ��а�ȫ������ʩ',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('751ecb50-1e30-4e3a-8b92-316075c3fb7f','a7a51b31-f27d-4b14-b042-c03ee57f4048','֧��ģ������������Ƿ����Ҫ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('759c5331-eb3f-4d82-81b0-fbd8122d3752','356aab0e-c466-4228-97e6-4060e7ba92b4','�Ƿ��������װ��ʹ�õǼ�֤',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('76d0338f-82a5-434e-96af-97da6df00742','2d09b36d-38da-4704-b422-a027ab146bfb','����ʩ������֧������',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('77918dd4-2a49-41d5-8a92-43d747d5f0ec','c454ca84-e2e6-4ac4-aff3-2a29270c88ac','�Ƿ���ϱ�д��������׼����',8) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('78624485-311a-4399-a274-8a066cc29f4b','14b27bec-7906-4d2b-8bcd-e49169e1a21e','ÿ10���ӳ����˻����Ƿ�ƽ����ʵ?�Ƿ���Ϸ������Ҫ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7874a57f-801f-42b8-9dd6-9a5e6e10b74a','4ee8f944-5b80-45ae-8e60-3c48ef2d26e9','��������Ȳ��ƿʹ���ֳ��ļ���Ƿ����5��',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7888b354-6081-4084-8ce4-dafc3643da7b','4ded0823-2756-4dbd-8d81-7ef1770b1245','���Һϸ�İ�ȫ�����������������ʩ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('78a90770-0ecf-4fbd-bd79-e43acf07f4b1','ab5ac0de-4c65-4fb5-9e05-c990c40c4c96','��ҵƽ̨���ְ��Ƿ�����?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('78f589ba-6712-485e-9fc3-20c3731d1cae','67d32618-1983-4e1c-b2b8-d648c4b88270','������ר�ȫ��ʩ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('78fc3def-1369-456f-9ae5-0c16178550d9','e4f2b15f-10c0-4f0d-9326-0f551213abdf','��ѹ���������ѹ���ֽ���ѡ�ù�񣬲��ʵȼ���һ�µ�ä����룬���ò���ֱ���öϷ��Ÿ���',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7918032d-461d-4ae7-b1b8-ef9251fe2eed','bec226c6-94d9-48ad-bfe0-ecf870eab252','���ް�ȫ����?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('79568b6d-c0ac-4142-9407-ec3e3b93e5b3','666353e6-62f4-4e5e-ba3b-9faa6e9337da','�ֿ������Ա�Ƿ�֪��Ӧ��Ԥ���й�����?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('796609a6-0bf2-47cc-8ece-fbb8efa09ca6','7d2095fd-47e4-4ba0-8af6-aa88acbb0b99','ʩ���ְ����Ƿ�ר�˶�HSE��Ϣ�����������������ռ����������ࡢ���ݵ�',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('799ada95-4001-4f3c-8902-66fc6f886d7f','b25021e1-de89-4297-bbf7-b74697ac1e9a','�Ƿ��������ٱ߶��ڷ�����',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('79c90b2c-1955-4911-b25d-d79afcc37ed9','d7397073-d676-4e83-9b7f-42ac2c296964','����Ӧ��Ԥ��?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7a472813-4a17-4bc0-a541-924034f57f86','043264f8-fb2f-4c85-9a05-0a20d36fa815','����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7b246671-8954-4f4d-a44e-7af87b8e545a','6a42ccb0-1d32-4d7d-b8e1-75878b5dc8f1','ͨ������Ƿ���Ϲ涨?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7c38cf03-a8c5-4d33-853b-0122f9fea182','749d84af-fe4e-44f1-9ad1-6a36193e3328','�ƾ߽�������Ƿ���㱣��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7c670ff6-371b-4943-a7b4-f0e71d1cb3bd','d2cf710a-10dd-419e-8fbf-9337f6c0cfe4','��������ʹ�÷����ƾ�',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7c96cb91-01cd-46fc-b8bd-1a4cdcaf2c4f','4ee8f944-5b80-45ae-8e60-3c48ef2d26e9','��Ȳ��ƿҪ�������',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7c9fd949-823f-408c-87bf-4d8aedb98961','cc54333a-2d80-43ae-831d-82c870e3d8cc','�Ƿ�����δ���������ģ��',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7cbbec88-69b1-419a-9e48-68b845dc317b','7325a7e4-b556-4d8b-adaa-08e01ad9b653','�Ӳۿ������ð�ȫ�����Ƿ���ϰ�ȫҪ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7da058a0-8e1b-4b6b-bada-34c0a692270a','845979c6-d39f-449a-94d9-fb26506061dd','�����У��Ƿ����Υ��ָ�ӡ�Υ����ҵ��',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7ddbb924-02f4-42b3-b9fe-ed6e479fbd1f','2e0177fe-678e-4fa4-9878-e18f28242a9b','���ּ�����Ƿ�������Ŀʽ��ȫ��?�����Ƿ�����',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7de13f1e-f603-4567-a4d8-d50fac93721c','845979c6-d39f-449a-94d9-fb26506061dd','��ҵʱ�Ƿ�����������ҵ�Ǽ��ƣ��Ǽ�����Ҫ������ҵ��ɼ����������ؿ���',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7e6c3c14-6b9a-4a68-a421-be8671627bde','1a47c5fd-87a4-40ca-9ac8-8a6413f5cdd1','���䳵���䱸�����',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7eebc070-1d85-4cf7-9ad6-c74420a2e234','0da8615d-7683-4766-ac90-600cebe156cb','��Ա֤���Ƿ���֤��������Ҫ��',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7f282589-d39f-411d-b158-7fd624ebbbcb','7149cfaa-492e-4bde-b0c6-c45022a74ca9','���߲����Ƿ����',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7f3f3a09-1144-4e0c-aa42-cf0b5c1c7e70','1a47c5fd-87a4-40ca-9ac8-8a6413f5cdd1','����ʱ��ƿҪ�и�ó������Ȧ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('80799ffc-b25b-426a-bd63-12cb80a6136c','749d84af-fe4e-44f1-9ad1-6a36193e3328','�ֳ��������Ƿ�ʹ��36V�����µ�Դ����',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('80b98e72-4656-459a-b5e4-eb600592e212','b050a452-78a0-44a9-9bac-b9f5c6d213cd','�����豸�볡�Ƿ������������',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('80fca5c0-1465-48f5-a65d-e6cad258dd38','189a4cf1-8657-41a2-b7c4-b236c74d5645','������������������',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('817badbd-7846-47ce-af6e-11e1f4f13039','4ded0823-2756-4dbd-8d81-7ef1770b1245','��ȷ˩�Ұ�ȫ��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('81b7f730-8efc-49d9-a02e-3392c780efa0','dd5e6f9d-dd6e-4fe5-9007-70c5d9ce06b6','�Ƿ���ְ����ȫ���������ƶ�',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('82f795fd-5293-41f5-a94f-600502f81ffa','a6903b17-0743-4e6f-9e8e-6972dadf7e40','��ҵǰ�Ƿ񴩴��÷����þߣ�',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('847de177-0cfc-4ccd-a87d-4fa1544c68fd','4ee8f944-5b80-45ae-8e60-3c48ef2d26e9','��ƿʹ��ǰ�Ƿ���а�ȫ״����飬��ʢװ�������ȷ�ϣ�',8) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('84886ffa-fe54-40b1-8dc8-c86fa3eddf7c','e87e9a29-8a9a-4e20-9a03-69733f9c001a','�Ͻ����ᡢ�ֿ���������ʳ���Ͻ�����ȡů���Ͻ�ʹ�õ�¯����������',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('84b04526-5661-485b-9881-2ea1772dcbab','78f2f6ec-24a2-4e7f-9b6e-eec942cc30ce','�Ƿ�����ȫ����ĿHSE�����¼��̨��',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('862fee4c-4166-4641-842c-d006f850b954','c1eaa17b-90d0-4424-8990-5d15b806a047','Υ�����߽��ߣ����߲�����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8690f6cb-8639-4c0d-8228-fa02e834f475','efa25d9a-0ddd-4a72-a92e-54cddc33ca07','�Ƿ�ʹ����о�������һ���ߴ�����о������',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('86b3a054-ab34-43cd-8c69-85484952f5bf','dd3b16b3-8582-4577-ab64-f47cc62a245b','�����ȼҺ�塢���峡��������÷����͵����豸����������',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('86e27834-28a4-4ace-af85-d8b692cb6959','5dbd0ce5-e64c-494d-924a-1d8462625cda','ʩ���ְ����Ƿ����ݱ�����֯ʵʩ����������',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('870665e9-1ed5-4782-971f-36929f374699','57a55f3e-8913-4250-b9ae-732dfcf1905b','���϶ѷż����������Ƿ����³�������������',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('872b21c1-2781-4fc3-82f0-fd1d935e4fdb','f823abfb-8218-43cc-a160-bf0791b6f149','�Ƿ�������ʩ���ֳ��ڹ�ҹ��ҹ��ʩ���Ƿ�������ҵ������',10) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('88334d10-1bdf-42ba-9540-6b4a4ae764f9','7d2095fd-47e4-4ba0-8af6-aa88acbb0b99','�Ƿ���ȷHSE��Ϣ���ļ������Ȩ��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8852d648-cf18-4768-9d54-236725710f3c','19d176b3-b3fb-4de5-9a0b-aeb6ee9d5e08','֧��ϵͳ�Ƿ�������Ҫ��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('88f79c1c-a4a6-4558-9e71-dc925ef203a5','189a4cf1-8657-41a2-b7c4-b236c74d5645','������װʹ��ǰδ���н��׻򽻵�δ�������ּ�¼',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8970a5e0-1163-438f-8409-a4f21e458238','1975bb25-94e9-4fd5-a74f-31fb39890b6d','��������������׹�䰲ȫ��ʩ��ʵ�����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('89ac0978-cae1-460a-ba9a-352aa74461f4','30bb55cd-9be4-4d08-a090-e7f13fc81953','������ҵ��Ա�����֤�ϸ�',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('89bdf1ee-d401-40ea-a0d9-c72a495ab600','b6bac4a0-a5d5-438a-9a8b-8eaa2218dcb2','��ֱ��ҵ�������޸��������ʩ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('89ed5012-4727-48f5-be48-55860587373c','b0218b99-fe5a-4054-a741-9f9ff109f88e','�Ƿ��а�ȫ��������',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8a21fa6b-9179-48b0-87e8-416f6a313675','77e80467-5f83-47b2-a6a0-6c4254433949','�ֹ������Ƿ���ô��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8b78b406-0fbc-403a-9e49-c552d521392e','7149cfaa-492e-4bde-b0c6-c45022a74ca9','�﷿����״��',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8bb0ce96-767c-497a-b32f-c455af22fa95','749d84af-fe4e-44f1-9ad1-6a36193e3328','����ר�û�·�Ƿ�����©�籣��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8bbc5960-72b4-42f4-84e5-eb64a515a9db','98045cc7-a4fe-4acc-a091-2826776cc866','������ȫ�������',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8c88dd3c-c116-4211-bcd1-45e97d56f2d4','91292573-b241-4209-a8bf-c0126f4aad9a','���뱣������ͨ��ȫӦ��ͨ����',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8c9b7731-9698-4d59-bd8a-b20b3a5ff371','5f36824f-ae8d-4ddd-90b7-c76e4d14b57a','�Ƿ������������������',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8d14c066-5f15-4ad8-8696-ab353a67fea5','5f36824f-ae8d-4ddd-90b7-c76e4d14b57a','�з����ʩ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8d4e5ff0-d09f-4a13-ae53-50c835c19f48','44b0ad52-36c9-4cc9-a8a9-967a2f59a737','�Ƿ�ָ��λ��ͣ��',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8d55a8e8-22eb-40b0-b5f8-501e71b39dcb','acf769bc-854f-4e4d-a711-463df386cdbb','Σ�ղ�λ�ľ�ʾ��־�Ƿ���������¥�ݿڡ����ӱ��ص�',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8e023c81-5c8b-4012-9b2e-dd086d61d33c','e94c80fd-0fed-4f77-a839-1a009c93cd37','Ӧ����ϵ�����ͷ�ʽ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8e5600aa-5bfa-45a4-9f5f-7a0847234f26','09b01f67-3d8f-4143-8d14-b67fb9b8c034','�����ʩ�����ι̿ɿ�',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8e59b3a0-4353-4841-919b-71594d44be47','e90279e7-e307-4075-9fd4-42cd585b0aeb','����ϸ����ճ���ϸ��־',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8e6eb6bb-f557-474f-83a4-6dde419279ec','855f5e09-ce6f-4f6d-8725-b5011b78a4f4','����ʹ��ͭ˿����˿���汣��˿',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8ed2dc85-54ae-450b-90e9-f0a91406a165','e417e882-ccff-43c4-b0bc-980e3d3d55d2','������Ŀ��ȫԱ����������ȫ��������¼��',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8eed8c9b-3fd7-4434-a008-7ae0bcd23e1c','c7ba5d46-d93c-49b8-904c-cd44f86528f7','���������¼�Ƿ��й�����Ա��ʱ�˲�',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8f7e72af-ef15-4a75-983e-a2ee61cd7682','c8b8638c-0c0d-409c-82a9-30640b83a985','�����Ƿ��������̴�?�Ƿ�������������?',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8f80937f-effe-414a-bf47-dafd8377cf34','e63bd7b3-7e52-43fb-9d1b-689769ce103e','������̽��һ�����ַ���Դʧ�ع��ϣ��Ƿ��ȡ�������ȴ�ʩ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9053f610-72d4-4459-b7db-e2aeeaaadbf5','f716ddb1-3128-4608-b03e-d25811c8002a','ʩ���ְ�����Ŀ���Ƿ��ƶ��˱���λ��ְҵ��������ְ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9150b3da-c778-47a1-847f-5bb4754a8f7d','b0218b99-fe5a-4054-a741-9f9ff109f88e','�Ƿ��з�����ר�ȫ��ʩ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9157ffa1-f28c-47ef-833a-0e26cc36c999','a7a51b31-f27d-4b14-b042-c03ee57f4048','�Ƿ񰴹涨�����ݺ���֧��',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('925da871-5a0d-4c0f-a6e5-f5f892f12121','749d84af-fe4e-44f1-9ad1-6a36193e3328','��ʪ��ҵ�Ƿ�ʹ��36V���°�ȫ��ѹ',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9286f403-7d4a-43ec-986d-9e9028f9fefe','30bb55cd-9be4-4d08-a090-e7f13fc81953','��ȫ������Ʒ�����������Ҫ��������Ա���봩����������������۾��ͷ�������',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('935d272e-40b5-4282-80ce-f83cc75621bf','c454ca84-e2e6-4ac4-aff3-2a29270c88ac','ʩ���ְ����Ƿ�����֯���йز�����ԱЭ������ʵ����鰲ȫ��������/��ʩ�еĸ����',10) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('93e3b6b7-b64a-4b62-a275-e44011dfa4ae','b6bac4a0-a5d5-438a-9a8b-8eaa2218dcb2','��ֱ��ҵ���޸��������ʩ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9403e0b3-cf0b-47a5-a6a7-aa4abc1552f7','6f53fb3b-4693-4977-a7f5-833e0fc5b542','��������������',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('94156879-db74-45e4-ac7a-ded0dd11ed9b','efa25d9a-0ddd-4a72-a92e-54cddc33ca07','��ˡ��ᵣ�Ƿ����Ҫ��',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('94608dae-82be-4011-ae04-514b73364e48','6f53fb3b-4693-4977-a7f5-833e0fc5b542','���������������޶������',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('966276c0-1ad7-4b18-9c74-7f58925c227a','79727f49-9c90-42fa-9547-9f0445972810','�Ƿ�����������˿������˿',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('96f759b4-53d4-4b7e-b4ed-b9e9477094eb','86479986-bdbe-4b54-8b3d-0be6e2288637','�Ƿ���ݻ��������ͷ����ƶ�������԰�ȫ��ʩ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9702295e-26db-431d-940c-bbf1de493e34','749d84af-fe4e-44f1-9ad1-6a36193e3328','36V��ȫ��ѹ������·�Ƿ����?��ͷ�Ƿ��þ�Ե������',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('987c4b8d-5a27-4d5a-a2b4-797fd277a507','f716ddb1-3128-4608-b03e-d25811c8002a','ְҵ������ְҵ�����ι�������Ĺ����ѡ������豸���÷ѣ��Ƿ���Ա�֤��ר��ר��',8) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('98ddae90-1581-43f1-b2a9-efcfadabbca4','8c9df280-84a6-4292-8cc0-42ef231e55b5','�϶��Ƿ�������ơ�Ʒ�֡����ȱ���?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('98f65fa6-9ff8-42b6-9bed-dc7cddc7e311','98045cc7-a4fe-4acc-a091-2826776cc866','�ֳ���ȫ���䡢��ա���ʶ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9906687c-e37a-4873-9cd3-f0d62b0af333','0effae99-5429-4b76-8c52-c2138fa8ad66','��׹��ȫ�������궨��������ʹ��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('99555e7e-36c0-4315-af57-9210a9944387','d64c102c-49e9-424f-a65a-844639a598a7','ʩ��������ÿ��10m�Ƿ���ƽ����������ʩ���',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('997066b0-8b76-4221-9683-85d52ff6a14e','b620dcfc-ae18-4d02-b28a-131765f2adad','�Ǹ���ҵ��������˵�����̶��ο����Ǹ߹��ߺϸ�',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9a560f0b-1985-47ff-b139-4a77918779cc','5b60d917-7e09-4952-a46c-04b5a10fa56c','������ҵ�����ƶ��Ƿ�ȫ',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9a8a1559-3fd9-4fb6-af64-c15468b2082f','09b01f67-3d8f-4143-8d14-b67fb9b8c034','������롢�ȹ̲�׼������',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9b1d5dd3-f503-4a9c-8717-c04cf0a87927','57a55f3e-8913-4250-b9ae-732dfcf1905b','�ֳ��ĵ�·����ˮ��ʩ�Ƿ�ͨ��',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9c65afe8-b32f-4eeb-867e-90336db2fc20','6a42ccb0-1d32-4d7d-b8e1-75878b5dc8f1','�����Ƿ��п�ȼ����?',9) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9c783d9f-c3ed-4d18-bddb-3c4ec51ba747','ee44f1a4-e662-4ecf-bcf0-48cab958dc6d','����ʹ���Ƿ����?���������Ƿ�?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9cc35787-41f0-4552-b14a-51bfdded7c7e','5b60d917-7e09-4952-a46c-04b5a10fa56c','ʩ�����Ϻͻ�ѧΣ��Ʒ�ֿ�����ƶ��Ƿ�ȫ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9d29ab16-c950-4487-a089-0f7e76b99ee4','105b10cc-f4a6-482a-96c4-161ceeed80c4','��������Ҫ·�εĹ����Ƿ����ø���2.5m��Χ��?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9e3c0a38-726a-4bac-a755-f8b8e75f57ee','58e8d8d9-f576-4e5d-83aa-f2d6324b0c0c','��������¼��������ҵ������¼�Ƿ���ȫ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9e5e305f-d538-40a7-9d61-9362b9e32a92','5b60d917-7e09-4952-a46c-04b5a10fa56c','���ޱ���������ʩ����ƽ��ͼ',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9e6cd46a-873d-4525-86d6-87378017d2b6','bec226c6-94d9-48ad-bfe0-ecf870eab252','���������������������ڰ屨�ȣ�',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9e73e8f5-5604-4161-b942-b3877b7438d1','7fb552c4-382f-4bdd-a3d9-651c4a4ccc44','�������ޱ���װ��?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9fd51a4c-aef1-4e6d-889d-69b9c441e334','e299e59f-0174-472a-9025-73f2e754b487','��ҵ����һ����ҵ����Ƿ��ȡ�ɿ��ٱ߷�����ʩ',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a0171890-33f7-4e01-8292-d7c268a8dcbb','57e754a6-cf58-4c84-a4f3-93f776be804b','��ƿ���õ�ͨ���Ƿ����ã��Ƿ��з������¡����𡢸�ʴ����ɹ�Ĵ�ʩ�����޷��㵹��ʩ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a0438493-5da1-4d44-9973-405fd1c64ae9','c8b8638c-0c0d-409c-82a9-30640b83a985','�Ƿ��з�ֹ�ཬ����ˮ����ˮ�����������ˮ������ˮ�ӵ���ʩ?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a12c247c-46eb-4fab-8b79-32f13b7ca504','30bb55cd-9be4-4d08-a090-e7f13fc81953','�Ƿ���ר�˼໤���໤��Ա�Ƿ��ڸ�',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a1418bd7-6fee-40e9-bf89-1659b780b3bb','6f53fb3b-4693-4977-a7f5-833e0fc5b542','����������ˮ��ʽ����',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a1855892-c847-4b5e-87e5-4745e22e89ae','d7397073-d676-4e83-9b7f-42ac2c296964','����Σ��Ʒ�ֿⰲȫ��������ƶȣ�',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a2ec6ec4-08c0-4fc2-9443-9e5580e80a78','ab54ef75-9e0d-4d02-9dbd-a75da631cad5','������ڶ�·����Ƿ��б�ʶ',8) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a309cd82-e617-45ba-b094-04139ffd6ece','bf154090-d4c6-4eff-90b4-18949bf18259','���ް�ȫ��־�ƣ�',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a3219182-3ba3-4433-aef1-62ab8848d8f6','85868409-021f-4292-862a-37ddb2377026','����ʡ������ѹ�����¶ȡ���������Ӧ',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a33c98e9-d2df-4ef4-8d8b-9f4f634bbb5a','0a61cbd4-236d-4b9a-bb52-f72736c0f8fb','�����������������������Ҫ��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a450158f-ae1a-4f1d-aaac-e2987d4689ab','91292573-b241-4209-a8bf-c0126f4aad9a','�Ƿ��а�ȫӦ����ʩ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a47f5f13-8092-49e0-a784-0797f6c5c5ca','e87e9a29-8a9a-4e20-9a03-69733f9c001a','�������������Ͻ������ҽӼ��ײ��������߱����׹ܷ���',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a4cad7c8-134c-4fd3-bb7c-049ec949ff40','f33388d0-e584-4b0d-b5d3-9c1cb16c94a4','��ȫ��˿������ͺ��빤����˿������ͬ��δ��������',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a4ce0509-98ef-4700-bde9-3b0a9d7682da','222f1d0b-d990-48ec-9a97-9c4cf4e15c33','�Ͻ������豸����Ա����·������ڡ�',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a507b402-7c6f-4498-93c6-135b6534db3e','5f36824f-ae8d-4ddd-90b7-c76e4d14b57a','�䱸�ķ�������',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a521af4d-24b9-46af-a358-be7deec8f317','d73e1da1-c823-4abd-800c-b057bf54d7f5','�Ƿ��ѿ�չ����������������?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a5884468-b78f-44ea-852e-f8dda2e02fda','6ffdb168-e839-46b9-8c94-200cd46ca0b6','��ҵǰ��鰲ȫ�����ι̶̳ȡ���׼ʹ�ò��ϸ�İ�ȫ��',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a5d7c1f5-b1b6-49ea-a7bb-7b19ea20b4f2','666353e6-62f4-4e5e-ba3b-9faa6e9337da','����ص㡢�¹ʴ������ͷ���?',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a636ccbb-45ec-42de-a3e4-4b11d9e3ba35','15243898-2109-4ba0-a3e7-bb9569b9e3c4','����ƽ̨��װ���Ȳ����ϲ�Ʒ˵����͹淶Ҫ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a66dea4a-ca31-46ae-9ec5-0780b85f9875','b050a452-78a0-44a9-9bac-b9f5c6d213cd','����ϸ����ճ���ϸ��־',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a7a8b8a1-9744-4b8e-9353-70b0fae9f987','b620dcfc-ae18-4d02-b28a-131765f2adad','ҹ�����㹻������',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a816e144-a6a3-4eee-89a1-473a363f6920','0da8615d-7683-4766-ac90-600cebe156cb','�а�ȫ������ר�ȫ��ʩ',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a82559b9-66cf-4802-bd44-086db05623ab','19d176b3-b3fb-4de5-9a0b-aeb6ee9d5e08','�ֽ�������ģ���֧��ϵͳ������Ƽ���',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a878ac27-be65-44ef-adf2-460cdad14f2a','897ea9a2-29c3-4254-8e76-424759300e9f','����ҵǰ�Ƿ��ƶ���ȫ������ʩ������ʵ��λ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a8c587e3-aedc-4044-8c72-e5af629edc38','7d2095fd-47e4-4ba0-8af6-aa88acbb0b99','�Ƿ�������HSE�йص��ļ�����¼�����桢���Ⱦ����ཨ��̨�ʣ���������Ա���еǼǴ浵',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a9cdf328-81d2-4aed-97ae-dada1e58d642','5dbd0ce5-e64c-494d-924a-1d8462625cda','ʩ���ְ����Ƿ�������������������Լ�',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('aa12c177-1c8a-4b01-8672-324b83971b31','30bb55cd-9be4-4d08-a090-e7f13fc81953','������ҵ��Ա�����֤�ϸ�',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('aa6fbef3-b854-4e25-8ca0-b07e2a6a2ded','f823abfb-8218-43cc-a160-bf0791b6f149','ʩ���ְ����Ƿ����Լ���ʩ���������ʱ��ʩ��Χ��װΧ���ʹ��ţ�����������',9) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('aa72f361-8ff4-4fa2-9197-e3135c62c296','043264f8-fb2f-4c85-9a05-0a20d36fa815','����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('aaedc4fd-4143-4d4c-b10e-63e8cbe9a61c','b050a452-78a0-44a9-9bac-b9f5c6d213cd','�Ƿ񰴹涨���÷���װ��',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('abaffb6e-dbf6-48f0-bced-a7137769085e','365041cb-e8d5-4a9c-a628-6782d667491d','��·���߲�������ʸְ���',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ac9ae2b8-05c5-4569-b335-3d294a1cfd0f','15243898-2109-4ba0-a3e7-bb9569b9e3c4','����������Աδ����ѵ�ϸ�',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('acb0d2a1-f469-4483-9292-458fb60ed3e2','5bd6a724-0458-4673-b4ff-dbdad99b3eb1','����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ad610798-71de-4bf7-b459-cd22102136d9','07167f93-7962-4f0b-8c63-6172a3e253a7','ģ����ʩ�������Ƿ񳬹��涨Ҫ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('adbfecf2-a1b1-441f-9aea-55f42247a439','0ed3125e-e604-48c1-8e5f-21d5e9535def','ר�ñ������������Ƿ����Ҫ��',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('addf38bd-e37d-4070-b555-5606eae1573b','5ab2e2e8-84ec-4b97-8fe5-1cccc1ae0160','��ȫװ�á��ƶ�����λ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ae400645-1e3f-4a63-846d-1a495940cf41','7149cfaa-492e-4bde-b0c6-c45022a74ca9','������Ա�Ƿ񽡿���֤',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ae6b0708-418c-4b9e-9d9c-c79f15a435d7','7149cfaa-492e-4bde-b0c6-c45022a74ca9','ʳ������ù�ñ��ʵ�����',9) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('af213d76-0550-4146-a5db-3ffdf3a4830a','88e3eede-7ecf-4396-a9ff-7557b5855af0','˾�������ϸ�֤? 2.ָ�������ϸ�֤3.����ָ���Ƿ�ʹ�������Խ���?',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('af3f961a-6b4f-417e-8f2a-3e630d54926e','996c7f5d-2cbd-4cff-b386-7c5dd0be12d0','�Ƿ�������?�Ƿ��������ƶ�?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('af6eaa9a-b74a-46fb-bf58-55beffe6af66','d84aa24c-d5bd-4fd4-bca3-263c625707d6','�Ƿ���ڱ����������������͵�װ���?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('af98373f-63ce-4319-b968-65c9d8c4fe3d','5ab2e2e8-84ec-4b97-8fe5-1cccc1ae0160','�豸��ת��λ�İ�ȫ������',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('afe2390f-1519-4958-8b14-9ffcc9fda7cf','77e80467-5f83-47b2-a6a0-6c4254433949','ľ���ˡ�����ÿһ������Ƿ����1.5m',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('aff9e767-d6cf-43a9-8c6f-daa1ef9c108b','44b0ad52-36c9-4cc9-a8a9-967a2f59a737','�Ƿ������Υ����Ʒ',9) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b063dad4-636b-4fa3-b339-b646f2b00e0a','b2e48682-2117-445c-9c18-eea717c1d8ef','���н���ʩ���ֳ��Ĺ�����Ա������֮ǰ���Ƿ�������HSE��ѵ�ϸ�֤',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b0ad947e-583c-43b8-bd6a-24b8dd6c9fcc','7149cfaa-492e-4bde-b0c6-c45022a74ca9','�﷿ú���紶����',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b109c0fb-4532-462e-a804-dd1ef70aa5e7','4ded0823-2756-4dbd-8d81-7ef1770b1245','ʹ�ù��ߺ�����������壬������˩�Σ������µ�',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b1aee006-bc71-4726-b320-fbd23118378b','57a55f3e-8913-4250-b9ae-732dfcf1905b','�������ּ��Ƿ��з��ױ���װ�ã��ܷ�ﵽ',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b2222d7c-dad6-4b00-80ac-6aa63f2c99a3','c8b8638c-0c0d-409c-82a9-30640b83a985','��·�Ƿ�ͨ��?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b236ea2d-d217-455d-aeca-6e8c8e741673','f823abfb-8218-43cc-a160-bf0791b6f149','�Ƿ���ڲ�����������������ȡ�֣�á�������������Ա������',11) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b2bd14fa-a6ed-42d7-a610-db7955cc105b','15243898-2109-4ba0-a3e7-bb9569b9e3c4','�Ƿ񳬹���������',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b2c72590-53a1-4d12-8140-16edccb10760','5b60d917-7e09-4952-a46c-04b5a10fa56c','������ȫ�����ƶ��Ƿ�ȫ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b301437c-2fff-4099-8ac7-1a7fb82a518b','58e8d8d9-f576-4e5d-83aa-f2d6324b0c0c','���������������ƶ�ִ�и�����������������������ع鵵����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b342ee0a-7a02-486e-b064-126dae5de76a','25046ba3-7f1a-498d-b3fb-5d996a6dcbcd','�ߴ���ҵ�����źŴ���?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b3dc21d0-5afa-430e-8413-e66858c06f16','09b01f67-3d8f-4143-8d14-b67fb9b8c034','ջ��ջ��ͨ���з������ˣ����ݹ̶��ι̣�ͨ��������²�Ϊ��·����ҵ����ʱ��Ե��10cm���ϵĵ���',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b43fb046-f578-4971-81e6-370ded01f125','efa25d9a-0ddd-4a72-a92e-54cddc33ca07','�����Ƿ��ϻ�����Ƥ?��Ƥ�Ƿ��Ѱ���',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b456d350-890d-4646-83d9-64be16cf66d9','4ded0823-2756-4dbd-8d81-7ef1770b1245','�·�Ϊͨ������������������Ӧ�з������ר�˼໤',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b4722ff1-5ca9-4d5a-979f-14e5e8b8f2cd','bf154090-d4c6-4eff-90b4-18949bf18259','�����Ƿ�ͨ�硢�����������������ֱ��?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b48661cf-1fc8-4dbd-8b6a-aa678fc4d275','cf0bd845-0b30-4a42-b255-1a6c8a70900a','�Ƿ�������޿ռ���ҵʩ����ȫ������������������',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b48ed4d6-4c07-496f-9419-9cee9193c3c9','4ee8f944-5b80-45ae-8e60-3c48ef2d26e9','��ƿ�Ƿ����ţ�',9) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b53c9fcc-35cc-4170-ab5a-6176716b0470','e63bd7b3-7e52-43fb-9d1b-689769ce103e','�Ƿ��ϱ�������Ӧ��Ԥ����ר�ȫ�����ƶ�',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b5813b07-9f9d-4a23-9513-5a581d2437ca','68da4b77-9adc-4c5d-8f36-8a0fc935dd7a','�Ƿ����ʩ����λ������Ա�������ܰ���λ��������',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b5c2d9e7-eb1c-478a-a946-49f220dd1162','b0d4c8dd-5129-446c-b084-99db610f0f0e','ÿ10���ӳ����ˡ����ˡ�С��˼���Ƿ���Ϲ涨Ҫ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b6792a28-af05-4dfc-951c-4c8abdf0e53b','105b10cc-f4a6-482a-96c4-161ceeed80c4','һ��·�εĹ�����Χ�Ƿ����ø���1.8m��Χ��?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b6a1653f-5680-4f07-a4f0-59b7b206a78e','6d0a9f00-7aed-4386-bafe-f2e7af0f24b4','�Ƿ����ʩ���ֳ�������Ա������ʱ���ڣ�����ͳһ��������������ȫñ������ֺЬ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b7356ea9-a9b8-46de-80a5-8b1c188ec2d6','73184d82-a823-40fc-942c-fe91c8482ab9','���޵ؼ���ֵҡ���¼',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b87e36de-31da-443e-ab62-e5280f76eb33','f33388d0-e584-4b0d-b5d3-9c1cb16c94a4','��˿����ȫ����ǽ�Ǵ�δ���Ƭ',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b8877082-320d-4ab9-99ad-a714a27e1009','f716ddb1-3128-4608-b03e-d25811c8002a','�Ƿ�����������Ŀְҵ������ְҵ�����ι����������ȫְҵ������������ƶ�',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b8ae040b-1118-4d26-91f4-915838b92475','a6903b17-0743-4e6f-9e8e-6972dadf7e40','�ڽ�����������ҵ���Ƿ�����Ӧ�İ�ȫ��ʩ��',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b8e58d55-eab6-4dd9-9c52-814aaf6a82f3','0da8615d-7683-4766-ac90-600cebe156cb','Ӧ����ʩ�Ƿ��а�ȫӦ�������ͨ��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b99e88b7-936b-483b-9f53-6e97a9dd52ca','ba1bc0fc-f118-4f2c-b148-68adf474b7c4','��ģǰ������ǿ���Ƿ�����涨Ҫ��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ba90fca3-e29f-4d7d-a54d-536e3ede9ad5','d73e1da1-c823-4abd-800c-b057bf54d7f5','���ޱ���ҽҩ��?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('bad7d777-a292-42cf-87eb-726529bd918e','6f53fb3b-4693-4977-a7f5-833e0fc5b542','����������ר�˸���������ɨ������ֵ���',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('bb64de77-aa03-4abd-992f-a13450783cce','88e3eede-7ecf-4396-a9ff-7557b5855af0','�Ƿ��а�װ��������?�������Ƿ�ǩ��?',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('bbbce94b-4887-4e4c-a1a4-094a29040977','c2f10e79-a2ec-46cd-a451-c74a5139beb1','ж��ƽ̨�����޶����ر���',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('bc19166a-3d21-49f2-abac-6c94f1673d06','e6b2580e-db2b-4bb5-a22c-353ec169f1e9','����ȫ��ʩ��ʵ���',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('bc1d9158-8452-4c55-934c-16edafc295b7','d2cf710a-10dd-419e-8fbf-9337f6c0cfe4','�Ƿ��а�ȫ�����䣩��',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('bd68d135-9e5f-4a9a-9318-3090317f2d67','58e8d8d9-f576-4e5d-83aa-f2d6324b0c0c','������ȫ������������ȫ������¼�Ƿ���ȫ',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('bdcfe248-2359-4b59-a5ca-97803e7a6fdb','e6fa53f6-1dcd-419c-acd0-0db1b8f438cd','��Դ����������͵繤��Ʊ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('be9908f6-b1fb-4ed0-94ab-cee8bec4f12f','c454ca84-e2e6-4ac4-aff3-2a29270c88ac','ʩ���ְ����Ƿ���֯������Ա��ȫ��ʩ����Ա���н��ף������ü�¼�����ܽ��׵�ʩ����ԱӦ�ڼ�¼��ǩ��',9) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('bf13296a-0e91-43d1-a0a5-f40857a2fadf','88e3eede-7ecf-4396-a9ff-7557b5855af0','���޳��ߡ������������λ����',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('bf4ce3dc-a91f-4b5b-847f-d8c0e272b34e','897ea9a2-29c3-4254-8e76-424759300e9f','ʹ������װ�õĲ����Ƿ�����ҵǰ���뵽��HSE�����š��豸���Ű���Ǽ�����',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('bf907fd3-dafe-4b53-ab11-f17697b01e17','f3e52048-4d3f-475e-8848-5ec3948a78fb','�����Ƿ���������ͨ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('bf97148b-47a5-4514-901d-434077c68018','acf769bc-854f-4e4d-a711-463df386cdbb','�Ƿ��������ʩ������ʾ�Ա�ʶ����𾯵绰��������ȴ�ŵ�λ��',8) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c08bbc9c-33cc-4509-94f3-fe63e99af2db','7d2095fd-47e4-4ba0-8af6-aa88acbb0b99','�Ƿ���ȷ�涨���ļ������ϵĿ��Ʒ�Χ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c158b3f9-bd15-4994-ba8b-88de219abd06','6a42ccb0-1d32-4d7d-b8e1-75878b5dc8f1','Σ��Ʒ���淽ʽ���������Ƿ���Ϲ涨Ҫ��?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c23bdcbf-ddad-40eb-9bb3-bb7c6dc7871d','f716ddb1-3128-4608-b03e-d25811c8002a','�Ƿ��ϸ�ִ�з���������ʩ�͹����ƶ�',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c301146c-eec0-4f01-b081-d043e7f7f3ed','25046ba3-7f1a-498d-b3fb-5d996a6dcbcd','�Ƿ���ڷǱ�����˾����������?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c32f120c-74a9-4525-ac89-51f3a743fb81','44b0ad52-36c9-4cc9-a8a9-967a2f59a737','�Ƿ񰴹涨·�ߡ��ٶ���ʻ',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c32ff727-4c37-4a2e-8333-e9641fc7ee3e','c7ba5d46-d93c-49b8-904c-cd44f86528f7','��ƿ������¼�����������Ƿ���ȫ����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c3666def-3dc9-4058-b88f-357da84b6e08','6ffdb168-e839-46b9-8c94-200cd46ca0b6','��׼�����׶����塢����',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c383dca6-279b-4f52-990a-86717ce625bb','043264f8-fb2f-4c85-9a05-0a20d36fa815','����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c3a637a8-b758-4508-b358-9e35f927c89a','cc54333a-2d80-43ae-831d-82c870e3d8cc','��������Ƿ����þ��������˼໤',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c3eac302-0e98-46ee-ada4-2f3b24cd2105','4733b9e2-8cf7-4caf-829a-a07ec1eab5f5','С��������Ƿ�̶�',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c440eafa-8b3a-46d4-a3de-c501de11a0d2','7149cfaa-492e-4bde-b0c6-c45022a74ca9','�﷿��������ʩ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c4410d0d-1120-4381-b874-5459eeab8f21','d458f341-8d70-4a7c-ba22-93c6dfba1ba7','�Ƿ��հ�ȫ��ҵ���֤�������ð�ȫ���������ɰ�ȫ�໤��Ա',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c4be5f0e-5118-44dd-943e-5d306c94aa91','4ee8f944-5b80-45ae-8e60-3c48ef2d26e9','��ƿ�ڸߴ�ʹ����Ҫ���й̶�����',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c5a2f728-997f-47a0-858e-685c63379ae5','3dfeba3b-3306-4c3b-801c-bc8ebfc37a58','�����ղ��ϸ��Σ��Ʒ�Ƿ�ʱ�������ƴ���?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c675aee1-0e58-401b-ba6e-305ea5fb3e9d','7fb552c4-382f-4bdd-a3d9-651c4a4ccc44','���ذǸ�������Ƽ�����?�Ƿ�����?',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c689b37d-6b89-41e0-be26-e80773e420a0','222f1d0b-d990-48ec-9a97-9c4cf4e15c33','Ӧ�������������Եػ���գ���Ҫʱ���ŷſڼ���а壬���ڴ�ɨʱ���á�',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c6c48b2c-40af-4d00-bc75-6895d05be9f3','b2e48682-2117-445c-9c18-eea717c1d8ef','���н���ʩ���ֳ��Ĺ�����Ա������֮ǰ���Ƿ������һ��HSE��ѵ�ϸ�֤����֤�ϸ�',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c806d6b9-3722-4891-95e4-e1202cdc0018','a6903b17-0743-4e6f-9e8e-6972dadf7e40','������Ա�Ƿ��֤�ϸڣ���Ϥ�йذ�ȫע����������Ļ�����',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c8b00355-5d07-4d39-8476-620488ff6063','30bb55cd-9be4-4d08-a090-e7f13fc81953','���봩����ȫ������Ʒ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c956d20a-3aa7-443c-b093-8aad670d3b40','f716ddb1-3128-4608-b03e-d25811c8002a','ʩ����ҵ�ĳ����������ߡ������ȷ�����ʩ���Ƿ��ǿά�޹���ȷ�����',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('cae0ee67-9da1-4766-b492-18d5806bc046','2e0177fe-678e-4fa4-9878-e18f28242a9b','ʩ�����Ƿ�����1.2m�߷������˺͵��Ű�',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('cb089f66-63c6-42ba-9e78-e94b9f09b23f','b6b1d0cc-5482-4334-a371-414353c0148a','���蹤�̰�ȫ״����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('cc97df87-af20-403d-8f1d-6171b95c2fee','c2f10e79-a2ec-46cd-a451-c74a5139beb1','ж��ƽ̨�����Ƿ�������Ҫ��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ccb97ce2-2f03-4b68-9977-d1a3288f3b09','57e754a6-cf58-4c84-a4f3-93f776be804b','�ա�����ƿ�Ƿ���ר�ò��ֿ��ķ������������Ƿ������Ա�ʶ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ce9d0cad-3c92-4f4c-9847-b1c371430539','666353e6-62f4-4e5e-ba3b-9faa6e9337da','����������Ա�Ƿ���Ϥ�������ŵ�Σ��Ʒ���ࡢ��',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ceb41eff-5dbc-48a3-b9e3-67411cdb9159','52401d1b-43e6-47ec-8e04-abc81e4e6ca8','ʩ���ְ����Ƿ��н���״̬�µ�Ӧ���¼����ò���',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('cf0841da-2dac-4eba-a05c-50ca43105c20','ee44f1a4-e662-4ecf-bcf0-48cab958dc6d','�Ƿ������ƹ涨λ��?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('cfb6d557-5ba2-4e4b-90df-2f7981e61dbb','d2cf710a-10dd-419e-8fbf-9337f6c0cfe4','����ʡ������ѹ�����¶ȡ���������Ӧ',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d016938f-b409-409e-8d3a-4394d11fa23b','ab54ef75-9e0d-4d02-9dbd-a75da631cad5','������(ĩ��)�Ƿ���©�籣��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d06e6335-6c5b-4952-b4e0-c81dbe11edd6','52401d1b-43e6-47ec-8e04-abc81e4e6ca8','�Ƿ�������ֳ�HSEӦ��Ԥ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d154dfe2-cbbe-4c81-a504-11adda4a131f','0da8615d-7683-4766-ac90-600cebe156cb','��ʱ�õ��Ƿ���Ϲ淶Ҫ�󣨵�ѹ36V��Դ�͵ƾߣ�',8) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d191ac5d-0b6a-40fc-a54a-83b857555bcd','0a61cbd4-236d-4b9a-bb52-f72736c0f8fb','�ڸ߿պ�������ȡ��ʩ���ƻ𻨽���',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d21b28f2-0583-4358-9df5-7957765ab90c','14b27bec-7906-4d2b-8bcd-e49169e1a21e','ÿ10���ӳ�ľ���ּ������Ƿ���ػ�����ɨ�ظ�',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d21c0bdb-adbb-41ec-8fd6-004638c39df8','6f53fb3b-4693-4977-a7f5-833e0fc5b542','�����������䱸������',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d21eff9c-5024-4bdd-b815-f27227da0d73','d2cf710a-10dd-419e-8fbf-9337f6c0cfe4','��ȫ�໤��Ա��λ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d25aebd8-fdad-43a9-bc32-a13183176ff9','6ffdb168-e839-46b9-8c94-200cd46ca0b6','��ȷ������ȫñ�����Ь�ȷ�����Ʒ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d3743279-eb51-4884-bb5c-839116c92c90','52401d1b-43e6-47ec-8e04-abc81e4e6ca8','ʩ���ְ����Ƿ�浵��Ӧ��������¼',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d3ea4fde-45cd-4908-8acf-3fc976027e8a','b0d4c8dd-5129-446c-b084-99db610f0f0e','�Ƿ񰴹涨���ü�����',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d3eb923b-7efb-48de-9a7b-adccac787cc7','f716ddb1-3128-4608-b03e-d25811c8002a','ʩ���ְ����Ƿ�����ְ��������׼',9) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d4631cb4-fedb-48c9-b21e-4fd992d6b489','c1eaa17b-90d0-4424-8990-5d15b806a047','ʹ�õ�¯��ȡů',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d4bca1af-7feb-4961-929d-105e61aa1d75','e6b2580e-db2b-4bb5-a22c-353ec169f1e9','�����ְ�ȫ��ʩ��ʵ���',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d56c66fa-4606-46dd-9884-e92d3cbebd77','e417e882-ccff-43c4-b0bc-980e3d3d55d2','ר���棩ְ��ȫԱ�Ƿ񵽸ڣ�',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d69a4f1c-f040-49f6-8e91-02c721d8dee8','b2e48682-2117-445c-9c18-eea717c1d8ef','�Ƿ��ȫ��Ա�������˽����ֳ�ǰ������HSE��ѵ�����˳ɼ��Ƿ�LPEC HSE����ȷ�ϲ�����',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d6a26343-7fd1-4b0e-9fbe-e629165b7241','bf154090-d4c6-4eff-90b4-18949bf18259','�ֿ������Ƿ����ʩ����ƽ��涨?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d6be1f32-44e8-472b-a16f-e718d0de7857','3dfeba3b-3306-4c3b-801c-bc8ebfc37a58','Σ��Ʒ���ǰ�Ƿ����������װ��Σ�ձ�־�Ƚ��м������?����������޼�¼?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d7216940-5647-417e-b314-b973189f14c7','a6903b17-0743-4e6f-9e8e-6972dadf7e40','ҹ����ҵ�Ƿ��г����������',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d7746a51-f042-4f32-98e5-655d26dee756','6a42ccb0-1d32-4d7d-b8e1-75878b5dc8f1','����ֿ���Ա�Ƿ�ر��ֻ���',10) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d7a4164e-735f-497b-a8e9-08b6b8314a11','365041cb-e8d5-4a9c-a628-6782d667491d','����©�籣����������С��30����������С��0.1��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d7a7e933-c18b-4521-b770-55fd0cda1876','30bb55cd-9be4-4d08-a090-e7f13fc81953','��ȫ�໤��Ա��λ',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d7d0be2c-34ca-40fc-b84b-ee453538effd','a7a51b31-f27d-4b14-b042-c03ee57f4048','��������Ƿ���Ϲ涨Ҫ��',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d7ee40a6-1f0d-49d0-90b2-6dc9a285d6a2','7149cfaa-492e-4bde-b0c6-c45022a74ca9','�������ж����﷿',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d89cdde8-175f-45c8-b743-82d3f93455ad','0b738600-c6e0-4e5b-8bba-f90d0c2eabb3','�����������·��ͨ�����뱣�ֳ�ͨ��ʩ���ֳ�Ӧ������ʱ��������',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d9e96f2f-3f28-43c4-8ba8-eed5d321c184','cc54333a-2d80-43ae-831d-82c870e3d8cc','2m���ϸߴ���ҵ���޿ɿ������',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('da386294-8455-496f-a9cb-1877ca35eb02','f6aaca10-0e64-4d2f-bebb-c28e2db1155a','�ֳ��۳�����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dad36a48-83af-42ae-bb98-227479245866','6a42ccb0-1d32-4d7d-b8e1-75878b5dc8f1','�����Ʒ�����Ƿ���Ϲ涨?',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('db661675-0186-40f8-9afb-2130bf1d43b3','6f53fb3b-4693-4977-a7f5-833e0fc5b542','���������޹�������վ',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dbdf63f1-a461-407b-a21d-c8e376007806','b050a452-78a0-44a9-9bac-b9f5c6d213cd','�Ƿ����ð�ȫ��ʾ��־',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dc67bb6f-864c-4daf-a272-e256deb72d52','0da8615d-7683-4766-ac90-600cebe156cb','�а�ȫ�������',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dcf9726e-6dfe-4e2e-bf93-43203e54d071','6d0a9f00-7aed-4386-bafe-f2e7af0f24b4','ʩ����λHSE�������Ƿ��ڼ����˷�����Ʒʹ������������ü���¼',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dd1f8353-122e-4724-bc8b-aa5faf49c230','a7a51b31-f27d-4b14-b042-c03ee57f4048','�����ײ����޵�����ש���',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dd253046-a698-4709-891b-44446f37fe33','dd5e6f9d-dd6e-4fe5-9007-70c5d9ce06b6','�Ƿ������ְ�������˹��֣���λ����ȫ���������������Ժϸ�',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dd5c09e5-8d04-4747-aee9-d7c4c1e32781','845979c6-d39f-449a-94d9-fb26506061dd','��ҵ��Ա�Ƿ���ȷ�����Ҫ���Ͷ�������Ʒ��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dd756e38-92e9-443a-b988-cc6bc7b67501','52401d1b-43e6-47ec-8e04-abc81e4e6ca8','ʩ���ְ����Ƿ���Ӧ��Ԥ���ļƻ�����֯ʵʩ��Ӧ������',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dd7931fb-69f1-46f2-9fca-0e81b14a5b5e','d84aa24c-d5bd-4fd4-bca3-263c625707d6','ÿ����ҵǰ�Ƿ��Ե�����?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dd937cbc-a1f1-448f-975b-99aba49c3944','897ea9a2-29c3-4254-8e76-424759300e9f','����Ҫ·�ں���Ա����������Ƿ���ר�˿��أ�',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dda1a933-a723-4fe1-af23-802fbaea86d3','4ded0823-2756-4dbd-8d81-7ef1770b1245','�ߴ���ҵ����������',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('de1d3b14-b561-41b5-b042-50bdf24ea7f3','d2cf710a-10dd-419e-8fbf-9337f6c0cfe4','��Ӧ��ͨ���������ȣ�',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dea55ac4-1e67-460c-91be-4b69c4998a30','043264f8-fb2f-4c85-9a05-0a20d36fa815','����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('df051e8c-937a-41fd-9181-fc46f47831b9','dd3b16b3-8582-4577-ab64-f47cc62a245b','���������ϼ����ֿ�����',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dfddb908-e71e-48cb-85fb-cb4d649172fb','845979c6-d39f-449a-94d9-fb26506061dd','�ֳ�HSE��Ա�Ƿ񲻼�Ͻ����ֳ���ȫѲ�죬�������⼰ʱ����',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dff95199-855d-499b-a99d-ee34735f74d9','85b580d3-2fac-4589-ae7f-aa677cce456a','˾���Ƿ��֤�ϸ�',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e0f0d71d-a837-4b3b-823f-995abaa821b8','ed1b5241-4e32-4862-8b3e-a7f367c9e93b','��ȳ���2m�Ļ���ʩ�������ٱ߱�����ʩ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e10c36b9-a693-4078-bf92-273a49ba0e84','d94747b0-d340-4755-89c5-e7a90588ed4b','����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e2c09b4d-5544-4f5e-b3aa-ff32c2482bfc','4ee8f944-5b80-45ae-8e60-3c48ef2d26e9','��������Ȳ��ƿ���������ܱ�10�����Ƿ�������',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e2d66b49-9b6d-4232-8bb2-9c53e80e85f4','b6bac4a0-a5d5-438a-9a8b-8eaa2218dcb2','��������ҵ��Ա���ް�ȫ�����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e2f477c5-1478-4b84-b742-d1410aff9c9c','85868409-021f-4292-862a-37ddb2377026','��ֹ�������ô���֡����ߡ�������',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e378b21a-21e7-4012-8f66-23cfbcd7300f','e2387152-9b1a-4447-9a25-e227a4f74767','ģ�幤��������������',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e3eb261f-5ab3-426f-8efa-42c5998ee3cf','c454ca84-e2e6-4ac4-aff3-2a29270c88ac','��ȫ��������/��ʩ�Ƿ�˵�������ݡ���Ŀ�ſ���ʩ����ҵ���衢��ȫ�����ʩ��',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e40955c9-b077-4932-8575-010983e9c538','15243898-2109-4ba0-a3e7-bb9569b9e3c4','������װ�Ĺ��������ͬһ�������ҵĲ�Ʒ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e4619d3e-e7ad-414f-b44b-d7fce0d8312b','85b580d3-2fac-4589-ae7f-aa677cce456a','��ҵ�Ƿ������ҵ���',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e48f90bb-10e4-4a8f-9977-f996ab2a10f3','15243898-2109-4ba0-a3e7-bb9569b9e3c4','��ҵ��Աδ�ӵ��ڽ�������',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e4b1b370-8366-493f-8c3b-97a5ce818fa4','7149cfaa-492e-4bde-b0c6-c45022a74ca9','�﷿�Ƿ��а�ȫ�Ŵ�����',10) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e4c24778-40d1-4d21-8fbe-4226c1d13b26','e417e882-ccff-43c4-b0bc-980e3d3d55d2','����רҵ�繤��Ѳ��ά�޼�¼',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e4dbdcdf-75aa-4c34-bdd2-ef2697c22427','e94c80fd-0fed-4f77-a839-1a009c93cd37','��Ӧ��ͨ���������ȣ�',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e518be7b-aa34-4595-9657-9c131fc06827','68da4b77-9adc-4c5d-8f36-8a0fc935dd7a','��ȫ������Ա�Ƿ���������ְ��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e62f0da3-8fac-42f8-ab3a-9d4d717d769b','88e3eede-7ecf-4396-a9ff-7557b5855af0','�������ޱ���װ��?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e647eb03-f850-45b0-85c9-59a2e21ff305','1857a9bc-bd05-46f0-a1ec-07aebf283b19','��ģ�������޷��㵹��ʩ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e6ab613a-7ffc-4cb2-8697-5a9c60085df0','e6e651f1-3024-49a8-a0e0-cfd5aff640b8','���ּܸ߶ȳ����淶�涨������Ƽ����������',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e70a5c4c-453b-4c2b-9b86-3ddcc285ba76','73184d82-a823-40fc-942c-fe91c8482ab9','�繤Ѳ��ά���Ƿ��м�¼?��д�Ƿ���ʵ',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e7b89dad-f1a5-484f-a172-f01459f7765b','7d2095fd-47e4-4ba0-8af6-aa88acbb0b99','ʩ���ְ���HSE��Ϣ���ļ����Ĺ����Ƿ����н��Ĺ�������',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e7c132c3-70c9-42e6-bc2b-45658596884b','855f5e09-ce6f-4f6d-8725-b5011b78a4f4','���߽�����������õ緽�����õ��豸����Ҫ��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e7c1b4eb-8623-42ad-b652-24c9715325d0','57e754a6-cf58-4c84-a4f3-93f776be804b','�������õ���ƿ���ޡ���ƿ����ʵƿ����ʶ',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e802d244-b65c-477f-b396-4ce466253e49','0da8615d-7683-4766-ac90-600cebe156cb','�������޿ռ䰲ȫ��ҵ���Ʊ',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e8520a60-233e-4999-b453-03b5114f03fb','57bd144d-ba78-4f1f-8043-13e9810b35af','������������ר��ֵ���ɨ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e863031f-886a-4963-a2ce-47cb9c40ac9e','0a61cbd4-236d-4b9a-bb52-f72736c0f8fb','ʩ���ֳ����������Ч����������ʩ��ϸ���������ġ�����ר�˹���',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e866c894-5a28-4eca-86a2-34681bd4534d','85868409-021f-4292-862a-37ddb2377026','��ȫ�໤��Ա��λ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e896b9bd-978e-4085-a097-af600f7c8ebf','c8b8638c-0c0d-409c-82a9-30640b83a985','�����Ƿ��л�ˮ?',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e8b94b62-5953-4d03-88a5-756b7662b4d0','996c7f5d-2cbd-4cff-b386-7c5dd0be12d0','��ͷ�Ƿ�������ҵ��־?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e8cf1cdd-dce9-4c52-8248-0a4ad60b1da0','bdbe9fb2-c771-4d49-b015-f82f0f22a3d9','ǰ�����쳤�Ȳ����ϲ�Ʒ˵����涨',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e8fe2f85-e136-4881-8cf0-607277b0ed87','b25021e1-de89-4297-bbf7-b74697ac1e9a','�Ƿ����þ����ߣ����Ҿ�ʾ�ơ�',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('eae4bced-2099-4f34-a596-1217ed7bb8a3','d73e1da1-c823-4abd-800c-b057bf54d7f5','������Ա�Ƿ񾭹���ѵ?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ebc4d926-5238-43eb-b50b-36e3d03df7a0','bdbe9fb2-c771-4d49-b015-f82f0f22a3d9','ʹ����������ؿ��������������',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ebe95b12-2af1-42cc-8e3f-58f92eaf342a','8c9df280-84a6-4292-8cc0-42ef231e55b5','�������ϡ��������Ͼ��Ƿ���ƽ��ͼ���ֶѷ�?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ec161e9e-7d13-4d36-9bb6-8a0b433d1d65','7fb552c4-382f-4bdd-a3d9-651c4a4ccc44','�Ǹ���װ�Ƿ�������Ҫ��?',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ec740a5e-08c7-492b-905d-e9460ce3faf1','57bd144d-ba78-4f1f-8043-13e9810b35af','��������������ר��ֵ���ɨ',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ecb084eb-97f8-4cbb-b457-751c9a41e9f3','c1eaa17b-90d0-4424-8990-5d15b806a047','δ����׼��װ��������ͷ�Ҳ�����',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ece2bf69-9571-4772-9e29-2d3019d415ec','13aeb1e9-cacc-47f3-b4c2-73545e5d2ec8','�����Ƿ���Ϲ涨?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('edcb3b07-027f-4c51-bf6e-73c799b39b2b','f716ddb1-3128-4608-b03e-d25811c8002a','�Ƿ񰴹涨��֯������ҵ��Ա���н������',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('eddd60bd-0a0a-4409-9ebe-5beb337e19c2','f823abfb-8218-43cc-a160-bf0791b6f149','�Ƿ���ڳ�����Υ��������Ϊ',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ee13cd6e-66ed-4bb5-80ec-38df7c2f66c7','bec226c6-94d9-48ad-bfe0-ecf870eab252','���������Ƿ���ר�˹���װ����������ʱ����?',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ee30530c-2cde-4323-b5f7-5bc4dfab6ddb','7149cfaa-492e-4bde-b0c6-c45022a74ca9','������Ա���޶��ڼ��Ʊ��',8) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ef850fa0-410a-4324-9258-978051e7e1ff','c454ca84-e2e6-4ac4-aff3-2a29270c88ac','�Ƿ���Ƹߴ���ҵ��ȫ��������/��ʩ',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f04ea04f-f40e-46ec-bef7-ddb1272aa49f','5b60d917-7e09-4952-a46c-04b5a10fa56c','����������ȫ��ѵ�����ƶ��Ƿ�ȫ',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f0541c41-cf31-488e-983f-296de8d2ea48','57e754a6-cf58-4c84-a4f3-93f776be804b','��������Ȳ��ƿ���������Ƿ����ú��ʳ�����������ĺ���Ŀ�İ�ȫ��ʶ',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f0edeed9-a8f9-43f2-a2b1-b12cb7eefa38','dd5e6f9d-dd6e-4fe5-9007-70c5d9ce06b6','������Υ��ְ����ʩ����λ�Ƿ����Υ�����ٽ����������Ժϸ�',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f2109eb8-1e5c-4edf-91e4-06a5d90ab634','13aeb1e9-cacc-47f3-b4c2-73545e5d2ec8','��ê�����Ƿ�������Ҫ��?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f2e4fdb7-ab8f-40d8-a154-dd82031f325e','2d09b36d-38da-4704-b422-a027ab146bfb','����Ƽ������Ƿ񾭹��ϼ�����',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f31f6ab0-8fad-46b6-9636-fe2954ffca68','8c9df280-84a6-4292-8cc0-42ef231e55b5','��ȼ�ױ���Ʒ�Ƿ������?',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f394e991-df0b-436c-af1f-386ba4e3ac27','e90279e7-e307-4075-9fd4-42cd585b0aeb','�����豸���й涨��ʹ��ǰ�������ڵء��мල����ȡ�������豸׼��֤�ߣ�ʹ�õ�λ�Ƿ�����ȡ֤��',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f433c5b1-06ad-41d5-a147-99b853640eb3','5dbd0ce5-e64c-494d-924a-1d8462625cda','���������Ƿ�ȱ��',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f478c7df-829e-420e-a6e4-9ebfdc5d2bcc','25046ba3-7f1a-498d-b3fb-5d996a6dcbcd','ָ���Ƿ��֤�ϸ�?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f4e4be96-574e-43bd-ad08-7932f80b506b','b2e48682-2117-445c-9c18-eea717c1d8ef','�Ƿ������HSE��ѵ�ϸ�֤�߽���ʩ���ֳ�������',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f5e99588-b63d-4c35-a903-06f8cc4e18ca','13aeb1e9-cacc-47f3-b4c2-73545e5d2ec8','.�·�����ȫϵ���Ƿ����3.5��?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f677930f-75fd-4fbd-9fef-5e4a95fae49e','189a4cf1-8657-41a2-b7c4-b236c74d5645','���ּܴ�����Ϻ��Ƿ������������',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f6906f07-20f7-41c1-8838-e4ba31a2d511','b620dcfc-ae18-4d02-b28a-131765f2adad','ʯ���ߵȼ��������ݶ���ҵ����Ӧ�İ�ȫ������ʩ',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f699c5d7-0d06-4e6e-9579-4bf5aa0d72ad','356aab0e-c466-4228-97e6-4060e7ba92b4','�Ƿ��з��乤����Ա����֤',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f6cfb94d-33fb-4491-9454-188b209bf4a6','73184d82-a823-40fc-942c-fe91c8482ab9','����ר���õ�ʩ����֯���',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f6f32dbf-e4ef-42eb-8046-d9069eac1309','c7ba5d46-d93c-49b8-904c-cd44f86528f7','������ƿ�Ƿ���г�������ϸ�֤',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f7570f77-9735-4091-95cb-544fbf27b39d','7466bf20-11c8-4af7-a1ae-7e3b781e0e0e','�������彻����ҵδ���÷�������',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f81a9830-80d6-42ee-a91b-412db03dcbb0','e299e59f-0174-472a-9025-73f2e754b487','�Ƿ��и���ҵ����֮��Ľ��׼�δ�̶���դ�ı�ʶ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f96b44c9-8530-4b89-84f9-eaba4d0fe8d4','dd5e6f9d-dd6e-4fe5-9007-70c5d9ce06b6','��ǰ��ȫ�����Ƿ�����������һ�塱',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f9abda14-97bd-4302-87f8-52ba96b1f6e5','7fb552c4-382f-4bdd-a3d9-651c4a4ccc44','���ػ��Ƿ��г��ߺ�����������?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('fa0e146a-a3bf-44e2-ae29-b1f0f7864ff7','44b0ad52-36c9-4cc9-a8a9-967a2f59a737','������Ʒ�Ƿ�Ӱ�컷��',8) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('fa16e89c-e812-4046-b4b0-70029e3feb3a','2d09b36d-38da-4704-b422-a027ab146bfb','ʩ������������Ƿ�ǿ���ܷ�ָ��ʩ��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('fb2dcd1c-319a-4e78-ae1e-bf72b7f3fb1f','365041cb-e8d5-4a9c-a628-6782d667491d','�����Ƿ�������ֿ����û�·',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('fb737e36-5f34-4294-b16c-9544375f9a34','85b580d3-2fac-4589-ae7f-aa677cce456a','��������ҵʱ���Ƿ���������������ҵ�뾶��Χ��',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('fbb277c2-caad-40bf-95d7-5227421d1d92','bec226c6-94d9-48ad-bfe0-ecf870eab252','���Ŵ��Ƿ�������һͼ? �����Ƿ�������',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('fbfed64b-63bb-4fd9-8f02-939998c6bb5a','0b738600-c6e0-4e5b-8bba-f90d0c2eabb3','��ɢ�ߵ���¥�ݡ��µ�Ӧ���ֳ�ͨ�����öѷŲ��ϵƾߵ�',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('fc737f66-c037-40f8-9bed-061e21fcbede','ab54ef75-9e0d-4d02-9dbd-a75da631cad5','�����Ƿ����š���?�Ƿ��з����ʩ',10) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('fd295cbf-6e85-4835-811a-e866d2431b5e','dccda995-156c-4c35-aa6d-b23f69561091','������ʩ�Ƿ����Ҫ�󡢷���Ƿ�����',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('fd74f199-4800-40ca-add2-557af6026f0f','2e0177fe-678e-4fa4-9878-e18f28242a9b','���ְ��Ƿ�����',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('fd8e5963-8332-43da-af4d-d54a39f1de1b','6d0a9f00-7aed-4386-bafe-f2e7af0f24b4','���˷�����Ʒ�Ƿ���ȷ������Ͻ���������ϵ�ۡ���ȫñ��ϵ������ֺЬ����Ь���Ȳ��淶��Ϊ',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('fed4e31a-a711-40e9-afc7-390cd16bb5c4','e299e59f-0174-472a-9025-73f2e754b487','ʩ��������JSA',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ff3f78e4-9aef-4061-aff1-8723e682a8f7','e6e651f1-3024-49a8-a0e0-cfd5aff640b8','ʩ�������Ƿ���ָ��ʩ��',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ff48f454-e7fc-4606-ae39-9aa0a379f8f1','666353e6-62f4-4e5e-ba3b-9faa6e9337da','����������Ա�Ƿ���ѵ?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ff6c3d81-5c82-425b-aaf7-7c0e3d9f8963','189a4cf1-8657-41a2-b7c4-b236c74d5645','��������δ��������',2) ;