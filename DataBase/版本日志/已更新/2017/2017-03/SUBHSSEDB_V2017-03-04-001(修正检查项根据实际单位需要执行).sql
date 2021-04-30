---升级时，各单位根据实际检查情况需要执行此脚本
---天辰不执行此脚本
---此检查项根据最初安全软件设计初始脚本
DELETE FROM Check_ProjectCheckItemDetail
GO
DELETE FROM Check_ProjectCheckItemSet
GO
DELETE FROM Technique_CheckItemDetail
GO
DELETE FROM Technique_CheckItemSet
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','作业许可证检查','0','1','false',10,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','管理行为检查','0','2','false',20,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('72B74888-8190-40B4-8C5D-9344F44C9683','现场作业过程检查','0','3','false',30,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('448B443C-B477-4C67-AAFA-DB03A0C5D17F','破土作业许可证','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1A','true',40,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','动火作业许可证','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1B','true',50,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('29828709-D103-413D-902F-1CDB90E2CFC1','临时用电作业许可证','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1C','true',60,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('48F06310-5C74-4696-8249-3F5E1863D90C','脚手架使用许可证','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1D','true',70,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('366AC069-60BB-4D0A-A049-63CCCAEFC48C','起重吊装作业许可证','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1E','true',80,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','射线作业许可证','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1F','true',90,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','受限空间作业许可证','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1G','true',100,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('2C0660F9-D093-46E8-93E9-1D01D05EF718','新开项目安全许可证','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1H','true',110,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('A321A0E8-C438-4AAD-BDA1-460083ECDBF7','高处作业许可证','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1I','true',120,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','临边(洞口、攀登、悬空)作业许可证','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1J','true',130,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('79211283-4A46-4321-BF6E-0C349F24C16D','危险化学物品使用许可证','0BDE0BAF-4633-4864-90EF-AD9FF7266FC8','1K','true',140,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','HSE组织机构及管理体系运行','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2A','true',150,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','现场安全方案/措施管理规定','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2B','true',160,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('B8F280FA-3CAC-43FD-98AE-B759FCD8287D','个人防护用品使用','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2C','true',170,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('DE7930B3-94A0-44AE-8479-39592EC9BAAB','HSE宣传与警示管理','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2D','true',180,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','HSE培训及持证上岗','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2E','true',190,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('5AEB3327-BA14-4405-A687-B30AAA81D5A8','临时访客HSE管理','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2F','true',200,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','现场车辆进出管理','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2G','true',210,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('A44B1736-4563-4773-8C2D-140C6A76F103','HSE风险评估和隐患治理','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2H','true',220,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','现场HSE应急管理','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2I','true',230,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('1AFA2D62-681A-4D58-86FA-E40C8B13DD88','HSE信息管理规定','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2J','true',240,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','施工队、班组安全活动管理','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2K','true',250,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','文明施工、班组安全活动管理','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2L','true',260,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','职业卫生管理','B4B5CF58-2DE6-4086-B5FA-2CA3F11A3178','2M','true',270,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','用电管理','72B74888-8190-40B4-8C5D-9344F44C9683','3A','true',280,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','动土作业安全管理','72B74888-8190-40B4-8C5D-9344F44C9683','3B','true',290,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('0CD8C338-07B9-4AE3-A2A6-04485098FE91','动火管理','72B74888-8190-40B4-8C5D-9344F44C9683','3C','true',300,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('FD18318D-CF10-47A9-86C5-CC066B5119B3','脚手架管理','72B74888-8190-40B4-8C5D-9344F44C9683','3D','true',310,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('EC986070-16BF-4343-8850-252D9A747358','高处作业管理','72B74888-8190-40B4-8C5D-9344F44C9683','3E','true',320,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('82884781-F5B6-4623-A0BC-112DCA6665D9','起重作业管理','72B74888-8190-40B4-8C5D-9344F44C9683','3F','true',330,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('99431E70-833A-464D-8066-E41E230646DA','射线作业安全管理','72B74888-8190-40B4-8C5D-9344F44C9683','3G','true',340,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('77205883-AE5F-4047-8241-6922A2CCE6C4','受限空间作业安全管理','72B74888-8190-40B4-8C5D-9344F44C9683','3H','true',350,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('8DC2F97B-CB4F-4848-B528-6A8155C26771','气瓶安全管理','72B74888-8190-40B4-8C5D-9344F44C9683','3I','true',360,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('C9288081-8BD3-4949-A9C6-6320F827D35B','危险物品管理','72B74888-8190-40B4-8C5D-9344F44C9683','3J','true',370,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('10A8AF77-8103-422D-AE72-FAEB058C4770','特种设备管理','72B74888-8190-40B4-8C5D-9344F44C9683','3K','true',380,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('B8940917-27F4-438A-BA8E-744B54691F09','车辆管理','72B74888-8190-40B4-8C5D-9344F44C9683','3L','true',390,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('E6635238-4A3D-4101-B8E2-8356CBF046C2','环境保护管理','72B74888-8190-40B4-8C5D-9344F44C9683','3M','true',400,2,NULL)
GO

INSERT INTO dbo.Technique_CheckItemSet(CheckItemSetId, CheckItemName, SupCheckItem, MapCode, IsEndLever, SortIndex,CheckType,IsBuiltIn)
VALUES('18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','消防安全管理','72B74888-8190-40B4-8C5D-9344F44C9683','3N','true',410,2,NULL)
GO

--插入检查内容
INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('20900CE0-1993-4800-8775-52F4FDDD0143','448B443C-B477-4C67-AAFA-DB03A0C5D17F','有破土作业的技术方案/措施，交底清楚、到位',10)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('192906F1-2155-4AD5-9D47-E166D0A786E8','448B443C-B477-4C67-AAFA-DB03A0C5D17F','破土作业前，必须逐条落实审核单位意见及有关HSE措施，并对所有作业人员进行HSE教育和HSE技术交底后方可施工',20)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('103953E3-85B9-4063-BDA0-538E074B6DD9','448B443C-B477-4C67-AAFA-DB03A0C5D17F','明确施工区域地质、水文、地下供排水管线',30)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('FD94D84B-A417-4054-8F00-DFA05B10E835','448B443C-B477-4C67-AAFA-DB03A0C5D17F','明确埋地管道、电缆、电信设施',40)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('F1E5D1AF-AC3E-403E-9077-E9B694E7F12A','448B443C-B477-4C67-AAFA-DB03A0C5D17F','明确测量用的永久性标志、地质和地震部门设置的长期观察孔',50)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('1D5E572E-1F38-466E-93D8-E80F7465C26B','448B443C-B477-4C67-AAFA-DB03A0C5D17F','明确地下不明物、砂巷等情况',60)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('5986D8D5-8ECA-4C80-BC2C-2495C520D1D2','448B443C-B477-4C67-AAFA-DB03A0C5D17F','根据作业票要求事项和地下隐蔽工程情况进行现场标识，明确破土作业的范围和施工方法',70)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('F12B2ADF-3C34-49EE-AEE5-1F9181E4A5FF','448B443C-B477-4C67-AAFA-DB03A0C5D17F','在生产装置、灌区内施工，应设专人负责监护',80)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('BB15FD0C-1110-4018-9EE6-0655FDE2525B','448B443C-B477-4C67-AAFA-DB03A0C5D17F','所有作业人员是否清楚有下列情况之一要及时报告，经同意后方能继续作业：a)需要占用规划批准范围以外的场地；b)可能损坏道路、管线、电力、邮电通讯等公共设施的；c)需要临时停水、停电、中断道路交通的；d)需要进行爆破的。',90)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('63F5F0B6-E1AE-45E0-9817-398CF0103617','448B443C-B477-4C67-AAFA-DB03A0C5D17F','在道路上(包括居民区)、成产装置、灌区内施工时，应在现场设围栏及警告牌，夜间应设警示灯',100)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('ACB485AE-0649-436F-929B-85E4888F8635','448B443C-B477-4C67-AAFA-DB03A0C5D17F','开挖地沟、坑、池时，根据开挖深度按规定采取放坡或加固等专门措施，防止坍塌伤人，且应在其周围设置围栏和警告标志，夜间设红灯警示。',110)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('827B6FF5-4FC1-44DA-BA14-B10C2A45848B','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','有动火作业的技术方案/措施，交底清楚、到位',120)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('AF93F228-1D59-4B17-84B5-B7AF2877F0F8','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','动火作业人员上岗前，必须按规定进行上岗前的动火安全教育，掌握动火作业的安全基础知识，并会使用消防器材',130)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('2711B5D3-CF0D-47DD-BE70-379A5B96B4C9','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','动火作业人员是否熟悉周围环境和撤离路线',140)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('7BCDFB08-00C7-4193-BBEB-FD16B3F97BED','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','动火作业的施工现场，必须按规定配置消防器材，并保持消防道路畅通',150)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('7E1C5703-386F-4B3B-9E05-E81A2CEBE93C','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','动火作业部位附近是否有可燃、易燃、易爆物品，是否已清理或采取了有效的安全防范措施',160)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('47842163-042E-4A5B-AD48-9D49D0A0E923','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','与外部相连的管道与设备，是否查清有无险情',170)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('88E8255A-D474-47A4-86FE-7FB05BDE137D','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','附近是否有与明火作业相抵触的工种在作业',180)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('2DFA56AB-801B-4F5F-879A-304717F395CA','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','在有可燃、易爆气体的区域进行爆破和锤击作业时，是否已对现场的可燃、易爆气体含量进行分析切合格',190)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('D651EBAB-E825-4609-9096-3C43D63AFB45','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','是否满足特殊作业动火要求',200)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('8E296E80-E9ED-46BD-A252-35E0FA407E3F','14F2DA76-A9A9-4CAD-ADFE-D9C42F6AEF63','是否满足高空作业动火要求',210)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('A30AA4B5-759F-4804-AD75-9F5ECEEB41E7','29828709-D103-413D-902F-1CDB90E2CFC1','整体布线规范、合理，符合临时用电技术方案/措施的要求',220)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('83BC3116-8028-4C64-92D1-3CE451A9F659','29828709-D103-413D-902F-1CDB90E2CFC1','总/分配电箱分布合理，箱内电器配置、布线整齐可靠，电器性能良好',230)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('3BC4A468-4B8E-41D0-BC21-E715244A9798','29828709-D103-413D-902F-1CDB90E2CFC1','采用五线制线路，电压等级符合要求，测试合格；线路架设位置、高度、支撑符合要求',240)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('01AFADBA-6F7A-4215-9CF5-EEE9354C02CD','29828709-D103-413D-902F-1CDB90E2CFC1','电气元件、用电设备、线路容量、负荷满足要求',250)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0B3EDCA4-5598-4BED-9490-9A7BD51412C9','29828709-D103-413D-902F-1CDB90E2CFC1','开关箱内装设漏电保护器技术参数符合要求；所用电缆、导线截面符合要求，开关电气容量相互匹配',260)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0FC369CF-A331-4AA5-82B6-8DF6A9925662','29828709-D103-413D-902F-1CDB90E2CFC1','配电箱、开关箱的保护接零(接地)措施正确规范；箱内清洁，无杂物，箱门有锁',270)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('32E962C0-CC90-4AFE-8ED6-79A0107DD2DE','29828709-D103-413D-902F-1CDB90E2CFC1','电气线路、接头绝缘良好，无破皮、漏电现象',280)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('752D7F3C-5E46-4782-933F-5B47AFEDFBC4','29828709-D103-413D-902F-1CDB90E2CFC1','电气设备性能良好，有防雨防潮措施；有规范、可靠的接零、接地措施',290)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('F345D6B5-C78D-441C-8452-C0C7A8B0C22C','29828709-D103-413D-902F-1CDB90E2CFC1','安装临时线路的人员有电工证',300)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('7C27769D-4828-4CC6-9E71-E5AC03D4EF2B','29828709-D103-413D-902F-1CDB90E2CFC1','配电盘与周围物体的屏护距离符合要求；操作、维护通道、工作接地、零线重复接地符合要求',310)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('67E9E7F5-97DE-475D-ADDB-82C9614C4904','48F06310-5C74-4696-8249-3F5E1863D90C','脚手架整体具有稳定性，符合施工技术方案/措施的要求',320)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('C1588ECA-04B6-4FFB-BB15-ECED1C538A47','48F06310-5C74-4696-8249-3F5E1863D90C','脚手架立杆间距≤2m,大横杆间距≤1.6m,作业面处小横杆间距≤1m',330)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0E89DFD9-5BCF-40E8-AE42-40EDF3092135','48F06310-5C74-4696-8249-3F5E1863D90C','扫地杆齐全,必要时立杆要有垫板',340)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('A1C53824-C683-4C84-88C6-9EEF2B35F882','48F06310-5C74-4696-8249-3F5E1863D90C','脚手架设有上下通道,梯阶(踏步)间距≤400mm',350)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('E854751B-8D8D-4EA3-AF01-183CEE8C9281','48F06310-5C74-4696-8249-3F5E1863D90C','作业面跳板满铺,特殊情况下铺设宽度≥600mm',360)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('E4BE11E3-90A7-4BA3-BC18-9937AED09F07','48F06310-5C74-4696-8249-3F5E1863D90C','脚手架作业面四周预留洞口防护到位',370)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('A8AD3B4D-E9E2-46A0-9D82-DE0913A76BFE','48F06310-5C74-4696-8249-3F5E1863D90C','脚手架作业面,楼梯间等护栏为双护栏,其设置高度:第一道护栏以400mm为宜,第二道护栏以1m为宜',380)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('F76A6D99-B784-434D-8E50-3509AC463413','48F06310-5C74-4696-8249-3F5E1863D90C','扣件与钢管连接松紧适宜,各杆件接头合适',390)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('031AF968-0EE2-4FD7-90E6-D2C8EE2F0F02','48F06310-5C74-4696-8249-3F5E1863D90C','剪刀撑、抛撑、固定杆搭设齐全',400)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('C9F121A4-2051-4BF2-92F1-C6E1DA37B170','48F06310-5C74-4696-8249-3F5E1863D90C','大型脚手架接地符合要求',410)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('6395B9A9-24EC-4E9B-AACC-D4FF813C1132','48F06310-5C74-4696-8249-3F5E1863D90C','脚手架能够满足施工(承载)的要求',420)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('84A2B5DA-0660-4E98-9323-43EA2771E7AB','366AC069-60BB-4D0A-A049-63CCCAEFC48C','有该项吊装作业的技术方案/措施,并按规定进行了交底',430)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('CD86C50D-E202-47B0-9E68-E975FC38E5D1','366AC069-60BB-4D0A-A049-63CCCAEFC48C','起重机械吊装性能等完好，并能满足吊装要求',440)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('1D9BC5C7-84E0-4F99-BCE6-7AD098C3E2F1','366AC069-60BB-4D0A-A049-63CCCAEFC48C','起重机械司机和起重作业人员持证上岗',450)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('CD2D63F5-E6F6-45F0-A329-4E49E1AF5406','366AC069-60BB-4D0A-A049-63CCCAEFC48C','起重作业所需劳动保护用品齐全、到位、能够满足施工要求',460)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('BABC5D6F-6FD1-445A-A0F3-353FED97BBE6','366AC069-60BB-4D0A-A049-63CCCAEFC48C','起重吊装指挥和司机对“十不吊”和各自岗位安全成产责任制清楚',470)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('35D3AD57-4E1C-4FD8-9532-1B4AE67EE78D','366AC069-60BB-4D0A-A049-63CCCAEFC48C','班组自检合格',480)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('97EFD3FD-9EF2-45D7-8D22-87B62AC986E1','366AC069-60BB-4D0A-A049-63CCCAEFC48C','专业复检合格',490)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('D81F93D7-9725-48B9-85EE-3E79A436A8C7','366AC069-60BB-4D0A-A049-63CCCAEFC48C','相关管理单位联合检查合格',500)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0A1BFF93-CEDA-4DB9-9AA7-A354142B4772','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','使用放射源，有相应的安全防护措施，有事故应急预案和相应的应急措施和设备',510)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0323C0AB-618A-425E-B560-6D77DDC0CCC0','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','放射施工作业前，将放射作业时间、地点、内容、设防措施等向在该地点及其周周放射作业可能辐射到的施工作业人员交代清楚',520)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('A9E9F659-4C03-48F3-8FDD-CC2C39AC82AA','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','向所有参与放射作业施工的全体人员交代清楚作业时间、地点、内容、设施措施、自身保护措施和事故应急措施等',530)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('5AE4E4AC-0A68-4FFF-B9D9-FD32B6ADBB4E','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','放射施工作业施工设防、警戒区设置大小符合规定要求，“旗-绳”警戒醒目(晚间放射施工作业增加红色警示灯)，并设专人负责监护',540)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('AA622D3A-4C85-4D40-B51A-90AA8B4F255D','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','放射施工作业所使用的设备等符合有关规定要求',550)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('B25A79CB-549B-49F9-A448-97D4167CB725','D61D5E9C-3378-4FC1-83F6-FB4F66B2EAC5','放射施工作业人员防护等符合有关规定要求',560)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('4F300DCB-786B-4EE4-B28D-E065FC77B1D0','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','有进受限空间作业技术方案/措施，交底清楚，到位',570)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('54A720FC-3CF4-4411-B8DD-BF8AEA2D91CE','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','所有与受限空间有联系的阀门、管线加盲板断开，进行工艺吹扫蒸煮',580)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('67EFB3D1-59D2-44A0-BC94-8E0F22A8E0CB','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','盛装过可燃有害液体、气体的受限空间，分析其可燃气体，当其爆炸下限>4%时浓度应<0.5%，爆炸下限<4%时浓度应<2%；含氧19.5%~23.%为合格，有毒有害物质不超过国家规定的“车间空气中有毒有害物质的最高允许浓度”指标',590)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('64B33809-C9C8-4451-BB5B-B89DF0AE9974','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','受限空间打开通气孔自然通风两小时以上，必要时采用强制通风或佩戴呼吸器；但受限空间内动焊缺氧时，严禁用通氧气方法补氧',600)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('8DD20933-A830-44E8-B823-8FEAD2F7F0AD','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','使用不产生火花的工具；使用手持电动工具应有漏电保护',610)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('735D0042-A51F-404E-9DCC-4BCA68201749','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','带搅拌机的受限空间要切断电源，在开关上挂“有人检修，禁止合闸”标志牌；上锁或设专人监护',620)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('A0D6743F-9183-41E0-9A0A-1C8666694B22','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','所用照明应使用安全电压，电线绝缘良好。特别潮湿场所和金属受限空间内作业，行灯电压应12V以下或使用1:1隔离变压器',630)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('BA8F697C-F960-4F31-B13B-FCBB6C9F5622','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','进入受限空间内作业，外面需有专人监护；并规定互相联络方法和信号；受限空间出入口内外无障碍物，保证畅通无阻',640)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('7B0D34E2-BB33-4F51-8845-23C9FDE4BB6F','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','作业人员必须穿符合安全规定的劳动保护着装和防护器具',650)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('1B149431-DBD6-4FBD-B831-47EF58B02B8D','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','严禁使用吊车、卷扬机运送作业人员',660)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('940A90E4-F42F-48A7-8C69-C85E34457F56','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','盛装能产生自聚物的受限空间要求按规定蒸煮和做聚合物试验',670)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('6E15FE1F-5AA4-408F-B686-6E757E0A8CEE','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','受限空间外配备一定数量的应急救护用具和一定数量的灭火器材',680)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('C919BF5F-48E4-42D4-8DB7-884D1C6744D9','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','作业前后登记清点人员、工具、材料等，防止遗留在受限空间内',690)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('9531CC02-FB0F-4CF9-A6E0-8CB224E1C14B','B57C6ECB-1891-49EC-9D21-1DF4FD07C9B1','对进受限空间作业人员及监护人进行安全应急处理、救护方法等方面教育，并明确每个人的职责',700)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('3464F684-BCDF-4BA5-A65B-47AB8EECBB07','2C0660F9-D093-46E8-93E9-1D01D05EF718','有该项目施工作业的技术方案/措施',710)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('4C6791A8-416E-4465-8C00-5E4998D64339','2C0660F9-D093-46E8-93E9-1D01D05EF718','作业前，按照规定进行了技术交底和相应的安全交底(教育)',720)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('8E1C765A-78A7-4F14-BAC9-0B814F24B165','2C0660F9-D093-46E8-93E9-1D01D05EF718','施工作业人员劳动保护用品配备到位，符合该项目施工作业的要求',730)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('3F7BD28A-0146-4822-9979-6AF5C85994F2','2C0660F9-D093-46E8-93E9-1D01D05EF718','落实了该项目施工作业的安全责任区和相应的责任人',740)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('2BE8EA0D-85EC-4E08-BFB7-B423F7F19791','2C0660F9-D093-46E8-93E9-1D01D05EF718','检修项目的置换、吹扫、隔离、化验分析合格',750)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('F82127A5-1FC0-4395-91BC-FD06D742B397','2C0660F9-D093-46E8-93E9-1D01D05EF718','检修施工人员的教育、交底严格按照检修施工要求进行，履行检修的相应手续',760)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('06A8CCDD-A51A-4799-9FBE-CF334078A342','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','有高处作业技术方案/措施，交底清楚、到位',770)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('47443105-B3C8-47A4-839E-01D59B216B05','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','作业人员身体条件符合要求',780)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('FDD2402D-4B96-4AEF-B6D2-346F49B90CDD','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','作业人员着装符合工作要求、佩戴安全带、携带有工具袋',790)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('382B979C-1D07-4DA0-BDC3-FFC3127DC332','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','作业人员佩戴 A、过滤式呼吸器 B、空气式呼吸器',800)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('C0691603-7DDC-4803-9369-8919CAE579A8','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','现场搭设的脚手架、防护围栏符合安全规程',810)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('68D036AC-8483-4699-84D6-BE2D217398FF','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','垂直分层作业中间有隔离设施',820)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('B03C209B-427F-4709-9D6E-6B4528385C06','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','梯子或绳梯符合安全规定',830)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('56A18A12-1055-421D-8A19-6B9A5C0D9FB7','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','在石棉瓦等不承重物上作业应搭设并站在固定承重板上',840)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('D66B349C-18CC-4631-9786-A166DC6F2A58','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','高处作业有充足照明，安装临时灯规范、合理',850)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('6B238AAF-28C5-4F7C-95C9-2CB82F9C40AE','A321A0E8-C438-4AAD-BDA1-460083ECDBF7','特级高处作业配有通讯工具',860)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('239509AE-751E-47F3-800D-E213E39E40D8','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','有该项目作业技术方案/措施，交底清楚、到位',870)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('1A4F7A8E-82CA-4B04-89B7-590CEB87F76E','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','作业人员身体条件符合要求',880)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('73B491BB-27BA-4AB5-8B8F-B4B968410A3B','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','作业人员着装符合工作要求、佩戴安全带、携带工具袋',890)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('3FC25B82-FE6F-406A-9F60-D2D3B00755FE','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','作业处有充足照明，安装临时灯规范、合理',900)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('3971E0BC-7FB5-49C2-BB6C-B96AF3667C01','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','特级高处作业配有通讯工具',910)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0F6C44C6-6033-4F14-BDC1-1B08760EE65B','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','符合临边作业之3项具体要求',920)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('1CDBA1E6-CBF0-4BC6-B004-DD6D021FB7C5','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','符合洞口作业之5项具体要求',930)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('5EBE4302-5D3C-41CD-8FC8-3FDF582FCF8F','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','符合攀登作业之6项具体要求',940)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('FDD25720-79ED-470C-A075-907C8BF203CB','A3E0CB1E-FC5D-4C8F-B76D-E9E21311C184','符合悬空作业之2项具体要求',950)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('84C26759-2DE8-4425-9F06-03583BA769C5','79211283-4A46-4321-BF6E-0C349F24C16D','有使用危险化学物品的技术方案/措施，交底清楚、到位',960)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('613B27CB-0552-41EC-AB39-8144A7F26344','79211283-4A46-4321-BF6E-0C349F24C16D','作业人员是否具有使用危险物品资质',970)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('0C93FEF6-BA48-4A2E-9C3C-0858A0089040','79211283-4A46-4321-BF6E-0C349F24C16D','是否了解所用危险物品的性能、操作规程和防护措施',980)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('336A2E4B-5AB9-442F-921F-7CC6381D617E','79211283-4A46-4321-BF6E-0C349F24C16D','作业人员个人防护用品是否选用合适',990)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('35F149AE-0FAA-4DC1-993F-D4C538500036','79211283-4A46-4321-BF6E-0C349F24C16D','现场是否具备各种防护设施',1000)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('74B54AB9-DD13-4F37-8AB0-77826D7A1A36','79211283-4A46-4321-BF6E-0C349F24C16D','所使用的工具是否安全可靠',1010)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId, CheckItemSetId, CheckContent, SortIndex)
VALUES('E6BC7BA0-3A3E-4493-9555-AA209CA0BE89','79211283-4A46-4321-BF6E-0C349F24C16D','醒目位置是否设置警示标志，围设警示带',1020)
GO

--HSSE管理行为检查表
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D9CBD92D-2620-464A-9CEF-8229A01AB6EB','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否编制临时用电施工组织设计；是否办理临时用电票；',1030)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('45B59E53-26CD-4A5A-A9D4-96D9D40B7097','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','临时用电是否采用TN－S三相五线制系统；',1040)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4C43E6CA-DB9B-45C8-811C-923509349767','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否实行三级配电、两级保护、做到“一机一闸一保护”；',1050)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CB90F4D0-30B2-4A3D-B6AE-FE8EEA177E5D','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','电缆是否沿地面明设；是否架设在树木或脚手架上；',1060)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B9467DF2-1707-4087-8C60-3461343EF15F','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','电缆接头是否牢固可靠，绝缘良好。采取防潮措施，有醒目的警告牌；',1070)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('28DC1137-631C-4A70-8806-D0EB4B3C127A','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','电缆与钢管、脚手架、管道之间是否绝缘防护，不得用金属丝绑扎电缆；',1080)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0328CAF9-5539-44E7-A068-5EC840E33C14','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','配电箱和开关箱箱体是否用铁板制作，厚度大于1.5mm；',1090)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7374A38B-54FC-4094-A6A1-9720E6D95CE6','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否存在用金属丝代替熔丝的违规现象；',1100)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B442004C-83BB-438E-B2DD-36C44A2DE160','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','配电箱和开关箱进线口和出线口是否设在箱的下面，电源的引出线是否设防水弯头；',1110)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6C684E7C-25A3-4397-B187-698A09E5889B','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','导线端头是否采用螺栓连接或压接，是否存在将芯线直接挂在电源开关上的现象；',1120)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9A40909C-984C-4E5C-9777-FC59D1B779AB','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','接触器、开关等，是否动作灵活，接触良好可靠，触头是否有烧蚀现象；',1130)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('440B466E-46CD-47E4-B50B-1FCEC25C376A','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','配电箱和开关箱是否防雨、防尘，有门、有锁；',1140)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BA8D99DB-965A-4A78-8E0B-11B50F7523EF','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','开关箱中每路是否装设漏电保护器；',1150)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B5015C44-D032-4C8B-AC62-B08BDF52AFC7','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否做到配电箱和开关箱漏电保护器的漏电电流应不大于30ｍA,额定漏电动作时间应小于0.1S；',1160)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('22349C64-B2AB-440A-BB9C-812F09FE6E0A','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','移动式和手持式电动工具是否装设额定漏电动作电流不大于15mA，额定漏电动作时间小于0.1S的漏电保护器；',1170)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D9542FB7-462E-49F4-BE74-6AF12917884D','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','移动式和手持式电动工具电源线是否采用铜芯多股软电缆；',1180)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4D330906-70A8-48FD-BD5A-8BEB47D71F6A','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','中小型起重机或其附近，是否设能断电开关；',1190)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FB003CD0-2046-45CC-9CF0-79F2F9D00304','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','现场照明行灯电压是否超过36V；',1200)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5C70449B-3C8C-49EC-8B16-7FC5B2260775','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','金属容器内及潮湿环境下使用的行灯，其电压是否超过12V；',1210)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('75D6EA13-12FD-405A-AE00-14B569F9C198','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','电焊机外壳是否接地可靠，是否多台串联接地；',1220)
GO
INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('287B1022-DE1D-4411-812F-95085D348B8D','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','电焊机一次侧的电源线是否绝缘良好，其长度是否大于5米；	',1230)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('33AF2677-02F5-49FE-8559-A4010AA2437F','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','电焊机二次侧引出线是否采用橡皮绝缘铜芯软电缆，其长度是否大于30m；',1240)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5702F223-FF15-4C5D-889D-31E6B6ED7B77','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','工作零线和保护零线是否均采用电缆芯线；',1250)
GO
INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F01EC02A-7310-4047-A517-E21A87E8A549','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','现场保护接零的低压系统、变压器低压侧中性点是否直接接地，其接地电阻是否大于4Ω；',1260)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1F87772A-6BB7-4DC0-9C4F-3CA251614268','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','与用电设备相关的电焊机房、金属板房、钢平台、金属构架等是否作接零或接地保护；',1270)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('91B29B1C-1322-4A0A-95F3-3C5E47854702','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','用电设备的保护零线或保护地线是否并联；',1280)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('208DC3D1-DDB2-4DAE-AED9-8473496FDCAE','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','用电设备的保护零线或保护地线是否采用焊接、压接、螺栓连接或其他可靠方法连接；',1290)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BE73E705-D436-4EDD-90F2-1126A9BD79F6','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否保存有自动开关调整记录、电表校验记录、接地电阻测试记录；',1300)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BE1EED85-19A8-4CEE-89E0-6935FA79B007','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否有电工日检记录，且按时按点；',1310)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B34CB203-538C-47F2-9385-533F015ECC51','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','是否办理破土作业工作票；',1320)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('97DFC510-66B9-4BEE-9309-E12BF25AB2AF','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','作业票是否标明破土作业的平面位置、深度和范围及作业手段（机械或人工开挖），是否建设单位、监理公司、总承包单位审核批准；',1330)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6B914C6B-7089-498A-8635-4CB2BC08F90E','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','作业前是否对地下隐蔽工程和地质资料情况掌握清楚；',1340)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('64EA3AA1-2734-4E77-87B3-59619FE7BA1C','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','作业前是否制定施工方案，落实HSE管理措施；',1350)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B9FE4AA5-5995-47B9-8B1B-623F3D2E50F3','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','施工单位是否明确作业现场HSE负责人，对施工过程的安全作业全面负责；',1360)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DBA711E2-B33F-4CC9-9524-0F61F1ABF6AB','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','在生产装置、罐区内施工时，是否设专人负责监护；',1370)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4396E81E-4591-46DC-967B-644B739CEF1F','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','破土前，作业单位是否逐条落实审核单位意见及有关HSE措施，并对所有作业人员进行HSE教育和HSE技术交底；',1380)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1206407F-2D26-4CCF-9B84-A3F007EDD294','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','作业人员在作业中是否按规定着装和佩戴劳动保护用品；',1390)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('974D952C-0251-411A-A2EC-9E5A439D26FF','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','在道路上、生产装置、罐区内施工时，是否在现场设围栏及警告牌；',1400)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('48BB029D-9C1E-4EF5-818E-34EA5239164C','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','夜间动土作业时是否设警示灯；',1410)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B854FA85-94BB-4585-AF44-56290589C50E','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','获准破土作业许可后，施工单位是否根据作业票要求事项和地下隐蔽工程情况进行现场标识，明确破土作业范围和施工方法；',1420)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BD4E6F26-335E-48D0-B1ED-91B887735FDD','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','在地下管道、电缆等不清楚时，是否使用机械开挖；',1430)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9E8390F1-46EF-490B-B0EC-8AD991D88518','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','发现事先预料不到的地下设备、管道、电缆及其它不可辨别的埋设物时，是否立即停止作业，报告建设单位，经处理后再进行作业；',1440)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F4E7F7A3-B7B8-4CA8-9193-901D8827D695','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','出现有毒、有害气体或不明性质的物料时，是否立即停止作业，及时向上风向撤离，并报告厂方处理；',1450)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('245BD81C-DE03-45B3-A801-E34CCF051934','52AD156A-C6A6-4FFB-B9BD-7A1588E4CD0A','当确定为有害气体或物料时，是否按进入设备作业要求办理票证，重新作业时要采取防毒措施，并派专人监护；',1460)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4DC17FE3-FC82-404C-9F8F-0A1C5E2EDE2B','0CD8C338-07B9-4AE3-A2A6-04485098FE91','是否办理动火作业工作票；',1470)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5BA5D95C-E1E9-4D15-849E-16C778A81F66','0CD8C338-07B9-4AE3-A2A6-04485098FE91','是否确保灭火器配置数量、有效性并放在合适位置；',1480)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CCC3A185-751D-4859-9953-5A8C2B6120D6','0CD8C338-07B9-4AE3-A2A6-04485098FE91','是否会使用消防器材，熟悉防火预案、作业环境和安全撤离路线；',1490)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A4FE62F3-B118-4DD8-8559-F8F0A3AD2953','0CD8C338-07B9-4AE3-A2A6-04485098FE91','是否一张用火票只限一处用火作业；',1500)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C34ADBFB-69F0-4AA9-AB30-8B3CF30EC4BA','0CD8C338-07B9-4AE3-A2A6-04485098FE91','用火票是否由用火执行人随身携带；',1510)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3043EDAA-C5DA-4C6B-BB72-73215EB44441','0CD8C338-07B9-4AE3-A2A6-04485098FE91','是否严格执行“三不动火”；',1520)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D172A2F6-788B-425B-A924-31A4D0C53E75','0CD8C338-07B9-4AE3-A2A6-04485098FE91','用火作业结束后，是否检查确认无火种遗留，切断电源后方可离开现场；',1530)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('05096855-B601-495A-90B8-8AA04D233929','0CD8C338-07B9-4AE3-A2A6-04485098FE91','固定施工用火区是否配置消防器材、砂池、消防水源，保持消防通道畅通；',1540)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('70E83E78-EAF4-4FDD-944A-9E44AA152F29','0CD8C338-07B9-4AE3-A2A6-04485098FE91','易燃易爆场所施工动火作业前是否采取拆迁、隔离、置换、清洗、敞开、提高湿度、加强通风等防火措施；',1550)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1037C3E3-74C3-46E4-8861-F0857578F29E','0CD8C338-07B9-4AE3-A2A6-04485098FE91','高处动火作业是否设置防止火花飞溅坠落的设施，并对其下方的可燃物、易燃物、机械设备、电缆、气瓶等采取可靠的防护措施；',1560)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C9C9B882-0252-4DD0-B7EC-2199948C437A','0CD8C338-07B9-4AE3-A2A6-04485098FE91','高处动火作业是否与防腐施工同时进行垂直交叉作业；',1570)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F4AE7DA3-7FA0-45EA-AE00-A6966DD440CB','0CD8C338-07B9-4AE3-A2A6-04485098FE91','高处电焊、氩弧焊作业人员在未到达作业位置之前，是否开启电源；',1580)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D4DC4573-E3B3-4D46-9F90-C74CE96A1ADF','0CD8C338-07B9-4AE3-A2A6-04485098FE91','使用气瓶的工人是否培训考核合格，持证上岗；',1590)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A03B7635-17AE-4654-97F0-81EC6B952428','0CD8C338-07B9-4AE3-A2A6-04485098FE91','乙炔瓶是否立放稳固，使用时是否安装阻火器；',1600)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('48FE0E6A-31B4-4C61-9D3E-964F595B2DB6','0CD8C338-07B9-4AE3-A2A6-04485098FE91','氧气瓶库与乙炔瓶等易燃气瓶库相距是否大于10米；',1610)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F32C2075-E496-4BDC-AC5F-FE535BD6B7FF','FD18318D-CF10-47A9-86C5-CC066B5119B3','搭设前，是否根据施工要求报审搭设方案；',1620)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D9276F82-C04A-45B5-A6E2-45AB8D394D9D','FD18318D-CF10-47A9-86C5-CC066B5119B3','脚手架是否选用外径48～51mm,壁厚为3～3.5mm的钢管；',1630)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3808F29E-1549-4495-8944-11AE9D9B9A5C','FD18318D-CF10-47A9-86C5-CC066B5119B3','脚手板绑扎材料是否用8号镀锌铁丝；',1640)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6FCD12A3-004A-4B54-A98A-6B6450CEE1E7','FD18318D-CF10-47A9-86C5-CC066B5119B3','作业人员是否取得特种作业操作证，且身体状况符合高处作业的要求；',1650)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6F574A3D-585C-45BA-8676-F63B8A4863D5','FD18318D-CF10-47A9-86C5-CC066B5119B3','大型和特殊脚手架施工方案，是否经项目技术负责人、业主、监理公司和总承包方审批，向作业人员技术交底；',1660)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C3E69E25-561B-4A3E-A211-F5E0D852F402','FD18318D-CF10-47A9-86C5-CC066B5119B3','大型和特殊脚手架施工方案，是否向作业人员技术交底；',1670)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DD9D4C1A-14E2-42BF-AD34-65AA5E7D5ED2','FD18318D-CF10-47A9-86C5-CC066B5119B3','在电力线路附近搭设脚手架时，是否与电线保持规定的安全距离；',1680)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A6B315F2-D5C6-42E4-9A9E-7C98BBF296D3','FD18318D-CF10-47A9-86C5-CC066B5119B3','作业区域是否设置警示带，非作业人员不得入内；',1690)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1033D022-64BE-4FAF-91A6-D0AD6A2A2EDC','FD18318D-CF10-47A9-86C5-CC066B5119B3','在搭设脚手架过程中，如脚手板、杆未绑扎、锁紧，是否中途停止作业；',1700)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D7845732-45D5-4A04-8F50-177BC775C943','FD18318D-CF10-47A9-86C5-CC066B5119B3','从地面搭设时，地基是否平整、坚实；',1710)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1C926BD6-1D6C-43F7-B35D-4FDA73C16368','FD18318D-CF10-47A9-86C5-CC066B5119B3','从地面搭设时，是否增设扫地杆弥补地基的不足；',1720)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7D8F4314-EB19-443F-BE5D-F057711D5B2A','FD18318D-CF10-47A9-86C5-CC066B5119B3','脚手架是否从下而上逐渐扩大，形成倒塔式；',1730)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('AE27596B-44F9-45DD-8662-CD0A518B907B','FD18318D-CF10-47A9-86C5-CC066B5119B3','脚手架整体是否稳定牢固，不得摇摆晃动；',1740)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A73206BC-2FE9-419D-A9AD-D991100F0846','FD18318D-CF10-47A9-86C5-CC066B5119B3','从地面或操作基础面至脚手架作业面，是否有上下梯子和通道；',1750)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FDB5E915-E08A-417A-9080-B4E442B58F18','FD18318D-CF10-47A9-86C5-CC066B5119B3','脚手架的作业面脚手板是否满铺，绑扎应牢固，探头板的长度≯300mm；',1760)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4D94E21E-5702-4F40-BFA7-F01A4E6900BE','FD18318D-CF10-47A9-86C5-CC066B5119B3','脚手架的走道和平台外侧，是否设置挡脚板；',1770)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A6C816AD-B3EE-46E9-93A9-103FEE729516','FD18318D-CF10-47A9-86C5-CC066B5119B3','搭设完毕，是否通知HSE主管部门和脚手架使用单位，三方共同检查验收，经确认合格，填写《脚手架交接验收单》，并签字确认，挂“脚手架已验收合格” 牌后方可使用；',1780)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9F5A59A7-E4B5-43FF-8CA5-7E2D20922944','FD18318D-CF10-47A9-86C5-CC066B5119B3','验收后的脚手架任何人不得擅自改动，特殊情况下需作局部改动时是否经施工负责人同意，由原架设班组操作，完成后仍须履行检查、交接、验收手续；',1790)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('14C44CE9-C0AF-436E-8B3D-3E5C16B20FD8','FD18318D-CF10-47A9-86C5-CC066B5119B3','脚手架是否定期检查，大风暴和雨后是否进行全面检查；',1800)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('451EE759-9657-4C76-84A7-3C66DB545100','FD18318D-CF10-47A9-86C5-CC066B5119B3','脚手架在使用过程中，是否随意拆除架杆和脚手板；',1810)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BE42AF7E-EE97-4E4C-868C-80E019819598','FD18318D-CF10-47A9-86C5-CC066B5119B3','拆除脚手架时，是否周围设警戒区，并派专人监护，禁止行人进入作业区内；',1820)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C5397629-7119-4038-AAF2-4821A345E69B','FD18318D-CF10-47A9-86C5-CC066B5119B3','拆除作业是否按顺序由上而下拆除，不准上下同时作业；',1830)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('43612FA2-22D3-42EC-B926-BFDA55E55498','FD18318D-CF10-47A9-86C5-CC066B5119B3','拆卸下的架杆、连接件、跳板等材料，是否采用溜放，严禁向下投掷；',1840)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('76F1EE8C-5909-4C41-9C0B-3E2AA53DA70B','FD18318D-CF10-47A9-86C5-CC066B5119B3','作业人员、架杆及作业面等与电线的安全距离不足时，是否切断电源；',1850)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E381EA5F-65AA-4028-9F7C-EAAB1A313210','FD18318D-CF10-47A9-86C5-CC066B5119B3','已卸（解）开的脚手杆、板，是否一次全部拆完。',1860)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('204A96C4-4AAB-40AD-9DBA-8BAE6E650155','EC986070-16BF-4343-8850-252D9A747358','进行三级（15～30米）、以上高处作业时，是否办理了《高处作业票》；',1870)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B2A358BC-9374-4652-8810-EA3149B8BA60','EC986070-16BF-4343-8850-252D9A747358','高处作业区域四周是否张挂警戒带；',1880)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('43437189-E576-4D84-98FA-1C1901C1FC2A','EC986070-16BF-4343-8850-252D9A747358','夜间高处作业是否有充足的照明；',1890)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A8F65ABE-4A76-4EDD-9FC5-C34109CB684C','EC986070-16BF-4343-8850-252D9A747358','是否进行安全教育及技术交底，落实安全措施；',1900)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A6BDDB8F-25F2-4C5C-B306-D145A93FBFB1','EC986070-16BF-4343-8850-252D9A747358','是否系好安全带、戴好安全帽，衣着灵便；',1910)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C66E7CF9-0DB5-4A61-9EC8-59999A713D52','EC986070-16BF-4343-8850-252D9A747358','高处作业与电气架空线是否保持足够的安全距离；',1920)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('16D5F259-51A6-4241-8CAC-0653155588B6','EC986070-16BF-4343-8850-252D9A747358','在六级风以上和雷电、暴雨、大雾等恶劣气候条件下是否进行露天高处作业；',1930)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3724A8FF-C046-4091-95C8-8347FC5C02E4','EC986070-16BF-4343-8850-252D9A747358','工具应放入工具袋，是否上下投掷工具、余料和废料等；',1940)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('21036925-88BA-42E5-BA66-060853842853','EC986070-16BF-4343-8850-252D9A747358','建筑工程的防护栏杆，是否自上而下用安全立网封闭；',1950)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4CDA7FA8-3DAF-4F03-9395-560B11540103','EC986070-16BF-4343-8850-252D9A747358','接料平台两侧的栏杆，是否自上而下加挂安全立网； ',1960)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3844AAAA-FBC7-405A-B1BA-E33088A0A51E','EC986070-16BF-4343-8850-252D9A747358','是否5米以上的一次性攀登作业，办理审批手续后，方可使用吊篮等垂直载人设施进行；',1970)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DA4F95B8-06D1-4719-AE0E-D66DAD3C5308','EC986070-16BF-4343-8850-252D9A747358','钢柱、钢梁、屋架、管廊等构件吊装前，是否先设置爬梯、脚手架等高处作业工具；',1980)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6D536F83-B501-4CD0-A2B5-A1BDAE71E547','EC986070-16BF-4343-8850-252D9A747358','构件吊装时，是否搭设进行临时高空作业安全设施，随构件同时上吊就位；',1990)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('16FEF6EE-D64A-417D-909E-EB93DD50498E','EC986070-16BF-4343-8850-252D9A747358','吊装中的大模板等屋面板上,是否站人和行走；',2000)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3A7B8E6C-3168-449B-85AD-B446964E6094','EC986070-16BF-4343-8850-252D9A747358','模板未固定前是否进行下道工序；',2010)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('AA6DBECA-0C45-40A5-9A82-50B20FF48950','EC986070-16BF-4343-8850-252D9A747358','支设高度在3米以上的柱模板，四周是否设斜撑，是否设平台；',2020)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('42D95ECF-ABB0-4558-A2F5-63D99DD664D8','EC986070-16BF-4343-8850-252D9A747358','绑扎和安装钢筋骨架时,是否搭设脚手架和马道；',2030)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1C859B86-6B6E-437A-848A-6B10BB42CABD','EC986070-16BF-4343-8850-252D9A747358','绑扎3米以上的柱钢筋,是否搭设操作平台；',2040)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('320DA4DB-DF15-4CEE-9987-2ACFCF9438A8','EC986070-16BF-4343-8850-252D9A747358','浇筑离地2米以上框架、过梁等构件,是否设操作平台；',2050)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BD5C1E35-1E8B-4F16-996C-5D4043BAFF49','EC986070-16BF-4343-8850-252D9A747358','移动式平台的面积是否超过10M2,高度超过5米；',2060)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('077040A2-7342-41CC-9673-0013669D554D','EC986070-16BF-4343-8850-252D9A747358','模板、脚手架等拆除时,是否下方有人；',2070)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('89D7D995-BECF-42AD-A47D-F2C0A0861387','EC986070-16BF-4343-8850-252D9A747358','结构施工自二层起，是否凡人员通道口均搭设安全防护棚；',2080)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DD2384ED-F794-4FED-9829-F10BD93F2855','EC986070-16BF-4343-8850-252D9A747358','由于上下施工可能坠落物件的通道，在其受影响的范围内，是否搭设顶部能防止穿透的双层防护廊；',2090)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5991001A-885C-40EF-BCD4-380F19DEADDC','EC986070-16BF-4343-8850-252D9A747358','处于起重机吊臂回转半径内的通道，在其受影响的范围内，是否搭设顶部能防止穿透的双层防护廊；',2100)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DBEF8245-76C9-4B86-BFFF-35D4B0B68EF9','82884781-F5B6-4623-A0BC-112DCA6665D9','起重机械是否有产品合格证、安全使用、维护、保养说明书；',2110)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('849ED22A-9452-4C60-AD1F-076EBD3E3F19','82884781-F5B6-4623-A0BC-112DCA6665D9','是否每天作业前进行安全检查，发现问题的起重设备，必须进行检修处理；',2120)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6DB8C30A-4253-4631-8C6C-F17E4C477274','82884781-F5B6-4623-A0BC-112DCA6665D9','钢丝绳、吊钩、卡环、卸扣、绳卡及卷扬机等是否具有合格证及使用说明书；',2130)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('69482A77-87FC-4542-A2F9-1660FA05EA6F','82884781-F5B6-4623-A0BC-112DCA6665D9','大中型设备、构件的吊装，是否编制吊装方案，并审批；',2140)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('34BC768D-AF17-4F59-B59B-ACCEF28B9B91','82884781-F5B6-4623-A0BC-112DCA6665D9','作业前是否由技术人员向起重作业人员进行技术交底；',2150)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2BF872B1-87B3-4093-9594-D74526D34644','82884781-F5B6-4623-A0BC-112DCA6665D9','起重作业中，起重指挥是否严格执行吊装方案；',2160)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('62086234-4BD3-4155-B5F8-DB8ED5F1E397','82884781-F5B6-4623-A0BC-112DCA6665D9','是否由起重总指挥签发“大型设备吊装起吊令”方可进行试吊和吊装作业；',2170)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BFE48435-908B-46EB-8D6F-48B0170103B5','82884781-F5B6-4623-A0BC-112DCA6665D9','起重指挥人员是否分工明确、调度到位，并佩戴鲜明的标志上岗指挥；',2180)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3EDD8C19-E597-4469-AB1F-CEED99DADF44','82884781-F5B6-4623-A0BC-112DCA6665D9','多台起重机吊运同一重物时，是否选用相同机种和相同起重能力的起重机械；',2190)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BFFD87C5-E305-4F1C-A08D-25F472B5B906','82884781-F5B6-4623-A0BC-112DCA6665D9','是否经过安全技术培训，取得地方主管部门签发的特种作业操作证后，方可从事起重指挥和操作作业；',2200)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E2E14DB4-418D-49FB-A841-E499BA378C6C','82884781-F5B6-4623-A0BC-112DCA6665D9','是否按规定的指挥信号进行指挥；',2210)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5DAE1453-0DD3-43F2-839C-5DF9D14CEAC7','82884781-F5B6-4623-A0BC-112DCA6665D9','是否正式起吊前应进行试吊；',2220)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('19626525-0E8A-4ADD-93E4-C5A78008B09E','82884781-F5B6-4623-A0BC-112DCA6665D9','吊装过程中，任何岗位出现故障，是否立即向指挥者报告；',2230)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3E49BC1A-BD06-4629-9DC0-68794F16B71F','82884781-F5B6-4623-A0BC-112DCA6665D9','重物就位前，是否解开吊装索具；',2240)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2158B654-1CE5-4808-B761-C4BC815571C8','82884781-F5B6-4623-A0BC-112DCA6665D9','起重操作人员是否按指挥人员的信号进行操作，对紧急停车信号，不论由何人发出，均应立即执行；',2250)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A5AD1815-DDCC-4BD0-B7BC-3943D2009914','82884781-F5B6-4623-A0BC-112DCA6665D9','是否使用起重机或其它起重机械起吊超载或重量不清的物品和埋置物；',2260)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('73DF6796-6289-4DD9-87C8-A768301472D5','82884781-F5B6-4623-A0BC-112DCA6665D9','是否在制动器、安全装置失灵、钢丝绳损伤等情况下禁止起重操作；',2270)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C670A478-3016-488C-AA90-A78CA09A447F','82884781-F5B6-4623-A0BC-112DCA6665D9','吊物捆绑、吊挂不牢或不平衡、吊物棱角处与钢丝绳之间未加衬垫时是否不得起重；',2280)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('02F2DA05-C419-4396-9F1B-A59116B8B665','82884781-F5B6-4623-A0BC-112DCA6665D9','无法看清场地、吊物情况和指挥信号时是否停止进行起重操作；',2290)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('895A961A-4937-48BE-A7C4-8F0A9BE38448','82884781-F5B6-4623-A0BC-112DCA6665D9','起重机械及其臂架、吊具、辅具、钢丝绳、缆风绳和吊物是否远离高低压输电线路；',2300)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E7922276-2414-46ED-B335-09129F7F470A','82884781-F5B6-4623-A0BC-112DCA6665D9','在停工或休息时，是否将吊物、吊笼、吊具和吊索悬吊在空中；',2310)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DD76328A-D90F-4AA6-AA6B-0F8332A070B8','82884781-F5B6-4623-A0BC-112DCA6665D9','不得 利用极限位置限制器停车；',2320)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('045D1F48-FF21-4D92-8405-291F596E2C4C','82884781-F5B6-4623-A0BC-112DCA6665D9','两台或多台起重机械吊运同一重物时，钢丝绳是否保持垂直； ',2330)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CD56903C-588D-46BA-B670-6A30564FDA2B','82884781-F5B6-4623-A0BC-112DCA6665D9','两台或多台起重机械吊运同一重物时，升降、运行是否保持同步；各台起重机械所承载荷不得超过其额定能力的75％；',2340)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BABD897F-404E-4E8E-96AD-CF7689D20F6F','82884781-F5B6-4623-A0BC-112DCA6665D9','两台或多台起重机械吊运同一重物时，各台起重机械所承载荷是否超过其额定能力的75％；',2350)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D31172A7-AA0E-47D8-BBBC-AEE4346E19D7','82884781-F5B6-4623-A0BC-112DCA6665D9','司索人员是否按吊装方案选择吊具与吊索并保证正确使用；',2360)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0BDF1ABA-545E-4E40-A265-2FDF61CA99F8','82884781-F5B6-4623-A0BC-112DCA6665D9','吊物捆绑是否牢靠，吊点和吊物的重心应在同一垂直线；',2370)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('40AD6858-FE74-4827-BEF9-20650217FDA1','82884781-F5B6-4623-A0BC-112DCA6665D9','司索人员是否随吊物起吊或在吊钩、吊物下停留；',2380)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0D12CA89-27DE-4B95-BF6C-6DF113E9B196','82884781-F5B6-4623-A0BC-112DCA6665D9','吊挂重物时，起吊绳、链所经过的棱角处是否加衬垫；',2390)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('18B35FC9-810F-449C-A9EC-3FBF93BAF483','99431E70-833A-464D-8066-E41E230646DA','是否具有Ｘ射线机使用合格证；',2400)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EC4A7073-6C10-4752-B9F4-065485DE0356','99431E70-833A-464D-8066-E41E230646DA','是否具有放射工作人员资质证；',2410)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7693D0EC-9894-41A9-AA8D-518F8D72C7F1','99431E70-833A-464D-8066-E41E230646DA','是否具有射线装置使用登记证；',2420)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('99D56128-76D8-4571-B9C1-CF0783C94B08','99431E70-833A-464D-8066-E41E230646DA','是否具有射线装置工作许可证；',2430)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('13D889BA-070F-4E1F-B486-1E6DCAF221DE','99431E70-833A-464D-8066-E41E230646DA','是否申请办理射线作业许可证，并经施工分包方HSE管理部门和主管领导批准后，方可进行射线作业；',2440)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0BD5BED4-2A05-4705-A34F-7D150CB1E3F2','99431E70-833A-464D-8066-E41E230646DA','在作业前是否制定安全技术措施，并落实到位；',2450)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('444A904F-C146-4438-8AD9-E65460430D97','99431E70-833A-464D-8066-E41E230646DA','使用射线装置的部门是否在作业前必须到其HSE管理部门、设备部门办理登记手续；',2460)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7E790E6B-68D8-4D64-98FB-3661E99F957C','99431E70-833A-464D-8066-E41E230646DA','作业前，是否划定好作业区间，确定作业时间，确保周围无关人员安全撤离。正式作业前，还要进行清场；',2470)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('25BD3FC0-4610-4173-AE1D-8CEF0E4A3F1F','99431E70-833A-464D-8066-E41E230646DA','作业前，是否勘察好施工现场的地形，正确设置好警戒线、警戒灯，确保警戒线外射线瞬时剂量率小于2微戈瑞/小时；',2480)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A44D50C3-D57D-4D1C-B7E4-C777E95D3B11','99431E70-833A-464D-8066-E41E230646DA','对重要路口和人员经常出入口是否派专人看守；',2490)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5FE9D368-6B6E-498A-A235-004E93A7FD25','99431E70-833A-464D-8066-E41E230646DA','作业时，现场是否有两名及以上射线作业人员才能进行射线作业；',2500)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('91D10C1D-6515-4F98-8FA2-19BB62E7777D','99431E70-833A-464D-8066-E41E230646DA','放射人员是否持证上岗，熟悉有关安全注意事项，做到四会（会使用、会保养、会检查、会排除故障），三好（用好、管好、维护保养好）；',2510)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7A208414-DDDE-475D-ADFB-F4FD913F0376','99431E70-833A-464D-8066-E41E230646DA','作业前是否穿戴好防护用具；',2520)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5FBD1BFB-0EAF-4016-A83A-88AAFE723F5E','99431E70-833A-464D-8066-E41E230646DA','夜间作业是否有充足的照明；',2530)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5D8D11C9-9BD2-4531-A67D-58CD5A6BD702','99431E70-833A-464D-8066-E41E230646DA','在金属容器内作业，是否有相应的安全措施；',2540)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2335B7BF-E1B5-4DD8-9905-6D65B8E31AC7','99431E70-833A-464D-8066-E41E230646DA','在射线装置、设备使用过程中，如果有射线装置、设备的交接是否做好交接记录；',2550)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5939E1A2-7827-4413-AC9F-F083A3BD1F9C','99431E70-833A-464D-8066-E41E230646DA','放射性同位素在运输前是否按照国家规定向当地卫生防疫部门办理准运手续；',2560)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('448F239A-D850-49D9-A13B-E5923DDA70FB','99431E70-833A-464D-8066-E41E230646DA','自行运输是否由随身携带剂量监测仪的安全人员或射线作业人员押运，对其进行不间断监测，以防意外丢失和泄漏，同时穿戴好防护用品；',2570)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9BA8E101-EA35-4469-B30C-74871166EDCF','99431E70-833A-464D-8066-E41E230646DA','每天使用结束后，是否将成套设备一起送回，并存放在专用处所，不得与易燃、易爆、易腐蚀物品摆放在一起，指派专人负责保管；',2580)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D810BE0C-4CB4-4EDA-ACBA-CEB1C688CD8C','99431E70-833A-464D-8066-E41E230646DA','每天使用结束后，必须将成套设备一起送回，十分指派专人负责保管；',2590)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CBE6CBA9-7DC4-419C-815F-F1EA34A5DD57','99431E70-833A-464D-8066-E41E230646DA','贮存是否实行双人双锁制，责任到人，同时做好防火、防盗、防泄漏工作；',2600)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('341A5209-26F2-4285-ADD8-07D945939343','99431E70-833A-464D-8066-E41E230646DA','贮存场所是否有明显的国际放射性标志；',2610)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C5E943B0-78A7-4328-BEE4-7D2312EB43CE','99431E70-833A-464D-8066-E41E230646DA','贮存、领取、使用、归还是否经使用单位所在HSE管理部门、设备部门核实，做到帐物相符；',2620)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0FC81248-816B-4DD0-A3DF-02D5F32BD050','99431E70-833A-464D-8066-E41E230646DA','γ射线探伤一旦出现放射源失控故障，是否采取紧急补救措施；',2630)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('79BE2EF1-E5EE-40FB-9D32-BB5A19C81A40','77205883-AE5F-4047-8241-6922A2CCE6C4','是否编制受限空间作业施工安全技术方案，并审批；',2640)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('483E77F6-B415-470F-A283-B2D30345ABDE','77205883-AE5F-4047-8241-6922A2CCE6C4','作业前是否由技术人员向受限空间作业人员进行安全技术交底；',2650)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('34D946F0-5ABB-415F-95AA-BC435783AEA4','77205883-AE5F-4047-8241-6922A2CCE6C4','作业前是否由技术人员向受限空间作业人员进行安全技术交底；',2660)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F2CC8471-61D0-4CDF-8CD9-3E7A2D94E9BD','77205883-AE5F-4047-8241-6922A2CCE6C4','安全技术交底是否做好记录；',2670)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5D6B4418-9FAF-4728-9484-C824756AEC5E','77205883-AE5F-4047-8241-6922A2CCE6C4','接受交底的施工人员是否在记录上签字；',2680)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A828A009-89C8-4157-ADB8-88DEE2273E2D','77205883-AE5F-4047-8241-6922A2CCE6C4','进入设备、装置、容器、坑道、井下前是否进行有害物质毒性、可燃性、爆炸性、腐蚀性监测分析；',2690)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A91C5F65-4C58-4CEE-92CD-951BDB77CDAF','77205883-AE5F-4047-8241-6922A2CCE6C4','是否经检验合格，办理相关的作业票证后方可进入设备、装置、容器、坑道、井下作业；',2700)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('389B5744-CE21-493A-AB36-E5020E6E5C9B','77205883-AE5F-4047-8241-6922A2CCE6C4','受限空间之大件吊装前是否办理起重吊装令；',2710)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('98E70408-041F-4F7C-A636-69583787575E','77205883-AE5F-4047-8241-6922A2CCE6C4','受限空间之动火作业前是否办理动火作业许可证；',2720)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('897E8E7A-0113-4B81-9ED0-0F7505D32B46','77205883-AE5F-4047-8241-6922A2CCE6C4','受限空间之挖沟、动土作业前是否办理动土作业许可证；',2730)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('124DAF9A-9479-450C-AEF9-FD58EB622872','77205883-AE5F-4047-8241-6922A2CCE6C4','受限空间之登高作业前是否办理高处作业许可证令；',2740)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B9B69AEA-A04E-4447-8A86-B3F6F0D02B4E','77205883-AE5F-4047-8241-6922A2CCE6C4','受限空间之射线作业前是否办理射线作业许可证；',2750)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('58B95955-6A8C-41F5-920E-50ECA4C30138','77205883-AE5F-4047-8241-6922A2CCE6C4','作业人员是否正确配戴必要的劳动保护用品；',2760)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CA779737-EE85-445A-9EB4-46EC55DB1BE6','77205883-AE5F-4047-8241-6922A2CCE6C4','作业时，现场是否有专人负责监护；',2770)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D3E9F211-FC8C-4025-A6AC-6F5ED1FC6832','77205883-AE5F-4047-8241-6922A2CCE6C4','工作中，各工种是否严格遵守本工种的安全操作规程；',2780)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('928EE1A2-240D-4284-B2CB-E69ABA940F43','77205883-AE5F-4047-8241-6922A2CCE6C4','工作中，是否存在违章指挥、违章作业；',2790)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A31E31DD-C24E-45D9-82D9-D04EB5DE1853','77205883-AE5F-4047-8241-6922A2CCE6C4','现场HSE人员是否不间断进行现场安全巡检，发现问题及时处理；',2800)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B2182A60-2953-45EB-A523-69230EEC7793','77205883-AE5F-4047-8241-6922A2CCE6C4','多工种混合交叉作业，是否充分考虑各工种间的相互影响及其潜在的危险。',2810)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('447F7482-3DEE-462F-B6E0-49DC11680FCF','8DC2F97B-CB4F-4848-B528-6A8155C26771','氧气瓶是否与乙炔气瓶同车运输；',2820)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B06E7898-D14A-4405-9196-FE840D26EACD','8DC2F97B-CB4F-4848-B528-6A8155C26771','气瓶装车前是否戴好防护帽和防震圈；',2830)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('070AD806-77AC-4F59-9755-ACBE2B30DB75','8DC2F97B-CB4F-4848-B528-6A8155C26771','所有的运输车辆是否配有干粉灭火器； ',2840)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1B2B77D4-64DC-4596-83FD-53CF82113D1C','8DC2F97B-CB4F-4848-B528-6A8155C26771','运回气瓶后是否立即卸车；',2850)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('877E724D-5666-4B1A-8CF0-B0D9DA2BEE86','8DC2F97B-CB4F-4848-B528-6A8155C26771','气瓶是否置于专用仓库贮存。应使用铁栅栏与外界隔开；',2860)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5E0BFB3A-B8F8-4ECB-8737-B41FD8F1D81B','8DC2F97B-CB4F-4848-B528-6A8155C26771','气瓶专用贮存仓库是否使用铁栅栏与外界隔开；',2870)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0467F788-D51F-4B43-95B9-3179224A21F4','8DC2F97B-CB4F-4848-B528-6A8155C26771','气瓶堆放处是否有照明；',2880)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('253E60E1-66F0-4BAC-8E36-913472C03F9B','8DC2F97B-CB4F-4848-B528-6A8155C26771','氧气瓶库与乙炔瓶等易燃气瓶库相距是否大于10米；',2890)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('45BCE2BB-2971-403E-A20A-5F5CD3B0339C','8DC2F97B-CB4F-4848-B528-6A8155C26771','使用气瓶的工人是否培训考核合格，持证上岗；',2900)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D9107273-5C07-4AA4-B2D5-9E3287558B35','8DC2F97B-CB4F-4848-B528-6A8155C26771','气瓶使用前是否进行安全状况检查，对盛装气体进行确认； ',2910)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7E5902A2-BEB6-4178-A12B-65932CB8FF46','8DC2F97B-CB4F-4848-B528-6A8155C26771','气瓶是否立放；',2920)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('95F0F40D-7140-4BF0-AA79-17E1B55B39F5','8DC2F97B-CB4F-4848-B528-6A8155C26771','瓶内气体不得用尽，是否留有不小于0.05MPa的剩余压力；',2930)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D68829C8-F622-4179-8A0A-28AED0BF4B18','8DC2F97B-CB4F-4848-B528-6A8155C26771','乙炔瓶是否立放稳固；',2940)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5ACC74FC-0162-4958-A152-4BA9DB77E9EF','8DC2F97B-CB4F-4848-B528-6A8155C26771','乙炔瓶是否安装使用阻火器；',2950)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7BD9098F-0FBE-4A3D-BE51-7EFDD36448C3','8DC2F97B-CB4F-4848-B528-6A8155C26771','气瓶使用人员是否严格执行气焊、割安全操作规程；',2960)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D2A550C0-07DF-427D-A7EB-E77594710A7E','8DC2F97B-CB4F-4848-B528-6A8155C26771','气瓶使用人员是否采取措施预防回火；',2970)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CD767E03-A2C9-4DBB-A4C5-94B4E71A4447','C9288081-8BD3-4949-A9C6-6320F827D35B','使用单位使用危险物品时，是否填写危险物品申请单；',2980)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F8F2D562-79CB-462B-BAA5-DB309C15DEA0','C9288081-8BD3-4949-A9C6-6320F827D35B','采购部门在接到危险物品申请单后是否做到认真审核；',2990)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('52736519-2AC6-4002-9DF9-C84FF1A06FF8','C9288081-8BD3-4949-A9C6-6320F827D35B','采购部门在接到危险物品申请单后是否填写危险物品跟踪单；',3000)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A432604A-1366-4D1F-9876-8A5A6E93BB25','C9288081-8BD3-4949-A9C6-6320F827D35B','危险物品运送到现场时，是否附有危险物品跟踪单；',3010)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('31360DFE-31E4-47DE-9380-1A62D3A7E606','C9288081-8BD3-4949-A9C6-6320F827D35B','危险物品的运输部门是否持物资供应部门签证的申请单、购销合同或调拨单，到使用地公安机关办理相关手续；',3020)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('431C0905-074D-42CC-8F03-BECA772F047D','C9288081-8BD3-4949-A9C6-6320F827D35B','危险物品是否有专人押运和装卸；',3030)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1C5779BC-ED1F-439D-8DC5-EB47A5757B10','C9288081-8BD3-4949-A9C6-6320F827D35B','押运、装卸人员是否经过培训，掌握所押运、装卸危险物品的性质、危害等安全常识；',3040)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BE56D3F0-D769-475D-B6B9-9CCC0FE60C20','C9288081-8BD3-4949-A9C6-6320F827D35B','装卸时是否轻拿轻放，装车不能过高，要捆紧捆牢；',3050)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B60B101D-E9E1-4B3E-B2D7-B5071A27D1EC','C9288081-8BD3-4949-A9C6-6320F827D35B','必须夜间装卸时，是否有充分可靠的照明；',3060)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('58E42E05-DE77-4A9A-96B0-E47772B5754E','C9288081-8BD3-4949-A9C6-6320F827D35B','专用运输车辆是否保持良好车况，限速运输；',3070)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E8C72140-E34C-4CFC-A959-D86CB12BB3E6','C9288081-8BD3-4949-A9C6-6320F827D35B','专用运输车上是否明显悬挂“危险”标识；',3080)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7CFBEEA8-9296-4548-9526-41B07626E585','C9288081-8BD3-4949-A9C6-6320F827D35B','危险物品入库前，是否进行认真的验收；',3090)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A815225F-ABB5-46A6-A5C6-F5FBDA86CF24','C9288081-8BD3-4949-A9C6-6320F827D35B','危险物品是否分类隔离储存；',3100)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0C61CD00-547D-4D10-BBC4-36F6D564427D','C9288081-8BD3-4949-A9C6-6320F827D35B','是否经常检查危险物品的物理性能和形态，作好记录，采取相应措施，防止危险物品质量下降而引起事故；',3110)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('54D12F64-E33B-4CF5-BB76-C45940FF7224','C9288081-8BD3-4949-A9C6-6320F827D35B','对特殊物质的储存，是否按国家有关规定加强管理，必须实行双人、双锁保管，严格遵守保管制度，并做好安全保卫工作；',3120)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9FD6FC0D-8707-49D3-84AF-109C1D603647','C9288081-8BD3-4949-A9C6-6320F827D35B','储存危险物品的库房，是否注意季节性预防；',3130)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B4A7F1A8-D231-40AF-9C56-5BBA354585C5','C9288081-8BD3-4949-A9C6-6320F827D35B','作业人员在使用危险物品前，是否办理危险物品的使用许可证；',3140)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('99AFBC33-60EF-473E-B492-D75BA5049874','C9288081-8BD3-4949-A9C6-6320F827D35B','许可证签发人员是否根据危险物品跟踪单中的有关要求对相关事项进行检查确认；',3150)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D6B2463B-2FF3-400F-9AF7-C851CB1C3916','C9288081-8BD3-4949-A9C6-6320F827D35B','在使用危险性较大的危险物品的地方，是否在醒目位置设置警示标志，围设警示带；',3160)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('70A9E544-0001-41AA-945F-C5E0DD2E76A1','C9288081-8BD3-4949-A9C6-6320F827D35B','当发生事故时，是否立即组织实施应急措施，使事故损失降低到最小程度；',3170)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8A5FA335-DDE3-4FBD-B285-C4909BB48D40','C9288081-8BD3-4949-A9C6-6320F827D35B','危险物品在作业后，是否按规定妥善保管；',3180)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9518E65A-C31B-4468-8AD4-FB22B83EB9C3','C9288081-8BD3-4949-A9C6-6320F827D35B','废弃的危险物品是否擅自处理；',3190)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('04E95DBB-9DFC-45CB-B94B-976AFBD84634','C9288081-8BD3-4949-A9C6-6320F827D35B','废弃的危险物品不允许擅自处理，是否由有关部门认可的有资格单位进行处理； ',3200)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('67FEF797-02EC-484D-9B31-DD9A632161F0','C9288081-8BD3-4949-A9C6-6320F827D35B','危险物品的储存、消耗和废弃数量是否由危险物品使用负责人认真核对和记录在危险物品清单上，并报HSE主管部门；',3210)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('973780F4-DA83-4E28-8D3C-6F498004D931','10A8AF77-8103-422D-AE72-FAEB058C4770','特种设备若有规定在使用前必须向所在地、市监督部门申请取得特种设备准用证者，使用单位是否申请取证；',3220)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('974B0C09-55AD-4744-8239-E01F6BCFDDCB','10A8AF77-8103-422D-AE72-FAEB058C4770','特种设备是否经地、市劳动部门检验合格；',3230)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('81AE9631-941B-4882-AB97-66F99355B98C','10A8AF77-8103-422D-AE72-FAEB058C4770','操作人员是否持有劳动部门考核后签发的安全操作证；',3240)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('009DEEEF-6784-4F0F-B74D-4D4D5140476D','10A8AF77-8103-422D-AE72-FAEB058C4770','是否建立健全安全管理规章制度和安全操作规程；',3250)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FCA30BB2-E290-40DE-A80A-CE76BEF8EE60','10A8AF77-8103-422D-AE72-FAEB058C4770','检查特种设备的主管部门是否存档设备出厂技术文件；',3260)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D34F0163-C957-4022-920A-F7F1FF4C3BE8','10A8AF77-8103-422D-AE72-FAEB058C4770','检查特种设备的主管部门是否存档使用、维护、保养、检查和试验记录；',3270)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5F5C112E-1339-4CDF-ABD1-4312C491E672','10A8AF77-8103-422D-AE72-FAEB058C4770','检查特种设备的主管部门是否存档设备及人身事故记录；',3280)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('73221886-3511-4B2D-9791-7B13D24C1D29','10A8AF77-8103-422D-AE72-FAEB058C4770','检查特种设备的主管部门是否存档安装、修理记录和验收资料；',3290)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FF9AE840-E6E0-4202-8127-997E6A55A174','10A8AF77-8103-422D-AE72-FAEB058C4770','每日使用前是否检查各类限位保护装置、制动器、控制器以及电梯厅门联锁开关、紧急报警装置、升降机的安全钩的安全性能等；',3300)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6F8C577C-79A7-4F27-9380-26253B8CFD5A','10A8AF77-8103-422D-AE72-FAEB058C4770','每日使用前是否检查轨道及紧固件的安全状况；',3310)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7B6DFC2D-2220-45E4-BC64-AEAF6A6638A1','10A8AF77-8103-422D-AE72-FAEB058C4770','每日使用前是否检查钢丝绳的安全状况；',3320)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('734C08F9-3308-4A01-B8FD-1F686A27CC41','10A8AF77-8103-422D-AE72-FAEB058C4770','每日使用前是否检查安全防护装置的安全性能等；',3330)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B8F2403C-A48A-41FE-BC6E-D89C6DB38616','10A8AF77-8103-422D-AE72-FAEB058C4770','起重机械和电动葫芦是否检验各类极限位置限制器和超载限制器；',3340)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('649B8CE7-65D8-40B4-8D35-38046D18D2D1','10A8AF77-8103-422D-AE72-FAEB058C4770','起重机械和电动葫芦是否检验幅度指示器；',3350)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EDBB4D8A-58D2-4C78-9685-C413C048D0E7','10A8AF77-8103-422D-AE72-FAEB058C4770','起重机械和电动葫芦是否检验锚定装置、防倾翻安全钩；',3360)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A947472D-A331-4084-A74D-4E60AB2A1A17','10A8AF77-8103-422D-AE72-FAEB058C4770','起重机械和电动葫芦是否检验防止吊臂后倾装置；',3370)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C5356402-9051-4766-97A6-7DF34ABBC8DF','10A8AF77-8103-422D-AE72-FAEB058C4770','起重机械和电动葫芦是否检验缓冲器和夹轨钳；',3380)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7764B1D7-1B01-433E-A496-3A08FC2CE4C3','10A8AF77-8103-422D-AE72-FAEB058C4770','电梯和升降机是否检验超重保护装置；',3390)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('846DA683-FFC0-4023-933C-26F9795DCD96','10A8AF77-8103-422D-AE72-FAEB058C4770','电梯和升降机是否检验供电系统相位和错相保护装置；',3400)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E388F2FD-8407-44FF-94A1-51D35D95D614','10A8AF77-8103-422D-AE72-FAEB058C4770','电梯和升降机是否检验撞底缓冲装置、超越上、下极限工作位置时的保护装置；',3410)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('90F0B890-AE84-47D7-8014-CE41BC6550C4','10A8AF77-8103-422D-AE72-FAEB058C4770','电梯和升降机是否检验防止超重或断绳保护装置；',3420)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A9D7DB36-F8AE-4073-8193-885ABF07D520','10A8AF77-8103-422D-AE72-FAEB058C4770','电梯和升降机是否检验停电或电气系统发生故障时轿厢慢速移动装置及安全门停止装置；',3430)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9EC96748-DE84-4362-9B00-976E8F0C6E1F','10A8AF77-8103-422D-AE72-FAEB058C4770','电梯和升降机是否检验紧急报警装置；',3440)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8671B9A9-4A1C-45D1-A4A7-7F1E14E4A497','10A8AF77-8103-422D-AE72-FAEB058C4770','停用一年以上的特种设备是否重新检查检验；',3450)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2DF5B53E-6179-40D8-80B9-73BA09165C74','10A8AF77-8103-422D-AE72-FAEB058C4770','经过大修和改造的特种设备是否重新检查检验；',3460)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DF47319E-4910-4B70-8B2E-C7C64517EA00','10A8AF77-8103-422D-AE72-FAEB058C4770','发生过重大事故的特种设备是否重新检查检验；',3470)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DF8400D6-EA46-4ACD-A134-D17D8C3F247C','10A8AF77-8103-422D-AE72-FAEB058C4770','经过4级以上地震后的特种设备是否重新检查检验；',3480)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3ACAA79F-6A7E-4A39-AD47-79599A948E4A','10A8AF77-8103-422D-AE72-FAEB058C4770','露天作业的起重机经受9级以上大风的，是否重新检查检验；',3490)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9E039563-9447-4F84-8100-EDB23DBB92EA','B8940917-27F4-438A-BA8E-744B54691F09','车辆是否进行年审，不合格车辆严禁使用；',3500)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('228A9F70-CC21-44DA-BA16-09AF8993023E','B8940917-27F4-438A-BA8E-744B54691F09','是否检查车辆处于完好状态，严禁带病出车；',3510)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FD150890-1CC1-4691-8600-6212D16B8020','B8940917-27F4-438A-BA8E-744B54691F09','是否发动机动力性能良好，运转平稳、不得有异响，怠速稳定，机油压力正常，功率不低于额定功率的75%；',3520)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C7DA0B86-9A18-45EF-99F0-C0A1D1D30E73','B8940917-27F4-438A-BA8E-744B54691F09','是否转向系方向盘应转动灵活，操纵轻便，无阻滞现象，车轮转到极限位置时，不得与其它部件有干涉现象；',3530)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C70F42A8-D175-480A-944E-8181B26B728F','B8940917-27F4-438A-BA8E-744B54691F09','是否制动系统有效，制动力平衡，行驶系统、传动系统、电气仪表及信号装置符合有关标准要求；',3540)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('42919F64-C4BF-4438-B846-0D365429912F','B8940917-27F4-438A-BA8E-744B54691F09','车辆是否配备一定数量的灭火器，且应处于良好有效状态；',3550)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2774BCCD-831A-4F82-B0CF-B7F490DF784D','B8940917-27F4-438A-BA8E-744B54691F09','废气排放和噪音是否符合国家标准要求；',3560)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9E6F1975-7DED-47B0-9C89-AFDD866C0EF3','B8940917-27F4-438A-BA8E-744B54691F09','驾驶员是否持有车辆驾驶证和项目内部车辆驾驶上岗证后才准予驾驶车辆；',3570)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('33D83FE1-F31D-432D-8D00-CBC935ABCFA4','B8940917-27F4-438A-BA8E-744B54691F09','驾驶车辆时是否携带驾驶证、行驶证；',3580)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2A4689C3-49E4-4A83-AA58-922D592D0FFB','B8940917-27F4-438A-BA8E-744B54691F09','驾驶车辆时是否正确使用劳动防护用品；',3590)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E6E4746D-420B-40CF-A8D7-56A7BAA1DFE6','B8940917-27F4-438A-BA8E-744B54691F09','是否驾驶与执照不符合的车辆；',3600)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EA19A74D-1576-42A4-B474-A9D196DA909A','B8940917-27F4-438A-BA8E-744B54691F09','是否酒后驾车；',3610)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E7A38368-BE56-46A7-B063-79E298290D42','B8940917-27F4-438A-BA8E-744B54691F09','是否在行驶中吸烟、饮食、攀谈或做其它有碍行车安全的活动；',3620)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6E5F61FF-A930-48CC-AF95-F110F66AF6C2','B8940917-27F4-438A-BA8E-744B54691F09','身体过度疲劳或患有疾病有碍行车安全时，是否驾驶车辆；',3630)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C68F4C85-BF15-4299-A6CF-266AC87DFEF6','B8940917-27F4-438A-BA8E-744B54691F09','驾驶员应谨慎驾驶，确保安全、是否超额载人；',3640)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CC720FD7-51C7-4ADB-AF8B-F80EF7013EFF','B8940917-27F4-438A-BA8E-744B54691F09','出车前是否做好“三交待”，即交待乘车人数、路线和安全措施；',3650)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('477D95D3-0D42-49B5-8558-FB3E0058A75D','B8940917-27F4-438A-BA8E-744B54691F09','货车载人是否办理“代客证”；',3660)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('030622CB-91CC-4759-B7FB-6444C488F111','B8940917-27F4-438A-BA8E-744B54691F09','行车前检查车辆的灯光是否符合要求，车灯有故障不得行车；',3670)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0BB0DDE3-03EB-456B-AEDD-E1D8D1C116EC','B8940917-27F4-438A-BA8E-744B54691F09','夜间是否高速行车；',3680)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4643C2EE-BB2A-4EC2-A29F-8C021C85748F','B8940917-27F4-438A-BA8E-744B54691F09','会车是否在150m以外关闭远光大灯，开近光灯、小灯，并减速；',3690)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7C3902D6-21C4-48F8-810D-0477397311A8','B8940917-27F4-438A-BA8E-744B54691F09','夜间超车时，是否变换近远灯光，打开转向灯以示意；',3700)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0074CF6C-3965-40A4-BAA6-2AAAF8A916D1','B8940917-27F4-438A-BA8E-744B54691F09','夜间临时停车是否靠路右边，并打开小灯、尾灯和牌照灯，防止与往来车辆发生碰挂；',3710)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C06786E5-E344-46FA-9903-0C565D0B4235','B8940917-27F4-438A-BA8E-744B54691F09','雨雪中行车是否保证雨刮器性能正常，不得使电气线路受潮、漏电；',3720)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C7AB9C4F-6A5D-41A1-B59B-45994D3385D7','B8940917-27F4-438A-BA8E-744B54691F09','雨雪中行车是否特别注意行人和往来车辆，要减速行驶，防止打滑；',3730)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1A9DD590-13E2-4BD0-87B1-92619D939A77','B8940917-27F4-438A-BA8E-744B54691F09','有雾时，是否打开防雾灯，缓慢行驶，并注意保持车距，遇大雾时，要停止行车；',3740)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F3D558AA-715F-4BC8-98A7-49390CE4EA22','B8940917-27F4-438A-BA8E-744B54691F09','雨、雪、雾天气行车，是否与前车保持一定的距离，尽量少用制动，禁止滑行和急打方向；',3750)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('52CAC3B8-A53B-4DE5-BBA3-BE8DD8C5D73C','B8940917-27F4-438A-BA8E-744B54691F09','发生事故时，驾驶员和乘客，是否实施自救互救；',3760)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('73267DFE-D425-424D-A21B-BEAA654FD973','E6635238-4A3D-4101-B8E2-8356CBF046C2','是否建立健全现场环境保护管理机构和网络；',3770)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EE3D6367-FB74-473E-9405-97332FC637DF','E6635238-4A3D-4101-B8E2-8356CBF046C2','是否设专（兼）职人员负责施工现场的管理和监督；',3780)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('87012A60-B752-4E8A-8292-E3715DB97A1D','E6635238-4A3D-4101-B8E2-8356CBF046C2','是否制订本单位环境保护管理办法和实施细则；',3790)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5C5D4FFC-389C-4C52-ADDF-7646CF631A24','E6635238-4A3D-4101-B8E2-8356CBF046C2','是否建立健全各种报表制度，做好环境统计工作；',3800)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('24B6DA4F-9A0E-4619-8FD1-456535BC059B','E6635238-4A3D-4101-B8E2-8356CBF046C2','是否做好环境保护的宣传、教育工作；',3810)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C0E4BACF-7A6D-45D4-96CF-F59D8C20E932','E6635238-4A3D-4101-B8E2-8356CBF046C2','作业现场休息室、工具房和设备、器材，是否按施工总平面图布置要求，摆放整齐有序，各种标志、标识正确醒目；',3820)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E7877ADD-2364-4DB4-A879-582B4EA7FFD6','E6635238-4A3D-4101-B8E2-8356CBF046C2','现场道路是否平整通畅，用电线路布置符合要求，水源设置合理，排水应通畅无阻；',3830)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('584BD139-03F8-4050-99FD-FBAC625ED459','E6635238-4A3D-4101-B8E2-8356CBF046C2','有毒有害物品、易燃易爆物品等是否设专用仓库保管；在作业现场临时放置时，应设警示标识牌，必要时应设专人看护；',3840)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E4EBF6C2-9477-4381-8B18-9AEDE0E4901D','E6635238-4A3D-4101-B8E2-8356CBF046C2','有毒有害物品、易燃易爆物品等在作业现场临时放置时，是否设警示标识牌，必要时设专人看护；',3850)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('98018D10-8DF7-4355-8B26-92F77C78A477','E6635238-4A3D-4101-B8E2-8356CBF046C2','是否各种油料在容器内存放，废油及时回收集中储存，严禁就地倾倒，油料对地面造成污染时应采取措施进行清理；',3860)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('607C3D85-B046-4B31-BE38-B04307BF6648','E6635238-4A3D-4101-B8E2-8356CBF046C2','防腐保温用油漆、岩棉、绝缘脂和易产生粉尘的材料等是否妥善保管；',3870)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6931DA98-25EE-4F05-AD75-3482C3B0A0EF','E6635238-4A3D-4101-B8E2-8356CBF046C2','防腐保温用油漆、岩棉、绝缘脂和易产生粉尘的材料等对现场地面或设施造成污染时是否及时清理；',3880)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('FCF9625C-CBF2-49DC-8D8A-7F41954D9CCE','E6635238-4A3D-4101-B8E2-8356CBF046C2','作业现场是否经常打扫并保持清洁，垃圾应集中堆放并及时清理、运送至指定地点；',3890)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BC87C434-24B2-433F-A1C3-EAB6EBD7AA7D','E6635238-4A3D-4101-B8E2-8356CBF046C2','生活暂设区设置是否远离有毒有害、噪声及射线检测作业场所；',3900)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5B77B35C-CE6E-48FB-BE6D-1EF7C19F3DB1','E6635238-4A3D-4101-B8E2-8356CBF046C2','生活暂设区区内的道路是否平坦通畅，有足够的照明设施；',3910)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DF02D437-BE27-45FE-9855-E2D84291456D','E6635238-4A3D-4101-B8E2-8356CBF046C2','生活垃圾是否及时清理，并按规定运至远离生活区的指定地点；',3920)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BF5BDA83-73A3-44B4-91DC-4F92AB3908E1','E6635238-4A3D-4101-B8E2-8356CBF046C2','厕所设置是否远离饮食卫生场所并通风良好；',3930)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B64A052E-8353-407A-8F90-98D58ED37B64','E6635238-4A3D-4101-B8E2-8356CBF046C2','生活污水是否设置管道，排放至规定沟渠；',3940)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BA4FB38F-D853-401F-8928-8EC5C9C17D85','E6635238-4A3D-4101-B8E2-8356CBF046C2','各种建筑、施工垃圾和生活垃圾等，是否倾倒到指定地点；',3950)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6EB3AE26-F439-4E00-AB2E-181FFC7751BE','E6635238-4A3D-4101-B8E2-8356CBF046C2','运送各种建筑、施工垃圾和生活垃圾车辆是否有防撒播的措施；',3960)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('84738CA6-28A2-4698-846C-2AC3C682A4B1','E6635238-4A3D-4101-B8E2-8356CBF046C2','施工、生活污水是否排放到指定的排水渠内，且应符合国家污水排放标准；',3970)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E219B0C8-C783-4EF3-A1AA-F2DA1C478A08','E6635238-4A3D-4101-B8E2-8356CBF046C2','可能对周围外部环境造成破坏或影响的施工生产性噪声、光、振动、射线、粉尘、毒物等污染源是否采取相应的保护措施；',3980)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('ACDADF07-24B1-4649-9C37-2B3BD6BEBA92','E6635238-4A3D-4101-B8E2-8356CBF046C2','施工生产、工作或生活中接触到的化学危险品的处理是否依据《危险物品管理规定》执行；',3990)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2317A213-EF21-4AC2-8AF9-9107D3135A72','E6635238-4A3D-4101-B8E2-8356CBF046C2','施工生产过程中是否注意对发现的各种文物的保护，并及时报告文物保护部门；',4000)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8B54BD91-93E1-4827-B5B1-ED819640FE89','E6635238-4A3D-4101-B8E2-8356CBF046C2','生活污水、粪便，经化粪池处理后，是否有组织排放到当地环保部门指定的沟渠或河道里；',4010)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9D8666AC-1440-444E-B5E9-60901BA13D19','E6635238-4A3D-4101-B8E2-8356CBF046C2','化粪池是否定期进行清理，并做好消毒工作；',4020)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E83E12DA-EBD8-4487-874B-A33AF5A1304C','E6635238-4A3D-4101-B8E2-8356CBF046C2','生活垃圾是否有专人负责定期收集、清除，运走；',4030)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3F79EF0D-3C29-4267-B8D2-1A3F879EE0BA','E6635238-4A3D-4101-B8E2-8356CBF046C2','运送垃圾的车辆，是否加盖、密封，防止途中撒落，造成环境污染；',4040)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('3A357EB1-6494-460A-9DE1-0D0C2ADDCB52','E6635238-4A3D-4101-B8E2-8356CBF046C2','垃圾箱是否定期喷洒药物杀灭苍蝇、老鼠等；',4050)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B1986C0E-37D4-4210-8511-79059933E4D6','E6635238-4A3D-4101-B8E2-8356CBF046C2','生活锅炉排出的废气，是否达到国家规定允许排放的标准，否则，必须进行治理；',4060)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('35B89224-3561-4EBC-80CF-EC863B26EF07','E6635238-4A3D-4101-B8E2-8356CBF046C2','是否积极配合当地环保部门经常性监督和定期抽查、监测。',4070)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('DD2867C5-E587-4270-BCE4-0B0BC978D0F9','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否结合自身实际，制订职工消防培训教育计划，提高全员消防意识；',4080)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('65AC23FB-EC24-489B-B326-B1281B63981E','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','对各类人员进行HSE知识教育时，是否有相应的消防安全知识内容；',4090)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('AA461D90-D445-405C-9C2E-D80F3DB68023','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否建立防火档案；',4100)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('77E14C20-A222-4CE4-A8D4-6DE2BAA9195D','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否设置防火标志；',4110)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4980BB91-E7B7-4F4B-88DB-B65405D3CE5B','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否确定火灾危险源（点），实行严格的管理；',4120)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('67838BB1-D260-49C9-9A73-FA3AEEEF16F1','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否实行防火巡检，做好巡检记录；',4130)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8DB511AB-7790-4C7F-ACDD-25DBC8A81DEB','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否制订灭火和应急疏散预案；',4140)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8EC16597-B071-4A93-B3FD-8E32AA64E0F9','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否定期组织消防演练；',4150)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EF2770B7-B79B-401A-AF9C-EEA83E640450','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否任何单位、个人不得损坏或者擅自使用、拆除、停用消防设施、器材，不得埋压、圈占消火栓；',4160)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('27547867-E33E-4044-A1D0-F2C38635AA30','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否占用防火间距； ',4170)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0C9F8839-E3B4-4CD1-A2FA-C1306580D372','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否堵塞消防通道；',4180)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('94F55EB1-4653-47FC-80D5-D18B6AF13990','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','移动式消防灭火器材是否按消防设计规范和施工现场实际需要，进行合理配置；',4190)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C7EF79BD-0795-47FE-9709-F8F205897585','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','器材的摆放位置是否设立标志，不得随意挪置；',4200)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D3CF500A-3D84-4677-A60A-F5BDC6D2EAF8','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否按照各类移动式消防器材的使用及性能要求，按期检查、充装药剂；',4210)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('91B69EEB-608E-403C-93D2-BA677565FE1B','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','各类移动式消防灭火器材，是否挂牌标明充装和检查药剂日期，并由专人负责维护保养；',4220)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('07E13966-8560-4A11-B04E-24BEE081B1FC','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','灭火器零部件是否完好，保险铅封可靠；',4230)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('ADF2FB16-F38C-4CC2-8402-EC3D214E0B1A','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否建立健全消防设施、器材管理台帐；',4240)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9101E9C4-1AEF-4566-85A7-D9CE9D10EC48','18D13FB6-0B9D-4CB0-AC3C-AAA67F27F419','是否如实记录消防设施的日常管理和检查情况；',4250)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EFE497D7-C2B6-4AF8-91ED-530E7B6C224D','B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','是否建立健全了项目HSE组织机构',4260)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B1989595-91A5-47F3-8B7F-AC3B96B7B383','B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','是否建立健全了项目HSE管理体系',4270)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('AE42E8DE-9795-4204-840A-D049DE1F49F7','B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','项目HSE组织机构及管理体系运行是否经过报审',4280)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6A7E24FD-5C35-483A-B7E7-69B01842464F','B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','是否建立健全了项目HSE管理记录及台账',4290)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6B81B783-8EC6-410D-A5D3-3B7C379CC0B9','B1758ADE-5B0C-40EC-B400-5C382EDCF4CA','是否定期检查施工单位HSE管理记录及台账',4300)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E2A3F1AA-BCCB-4076-B21F-7D065B4448C4','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','在开工前是否必须编制安全技术方案/措施',4310)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('05FF76AC-0254-4007-8520-783270CF8C26','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','是否编制临时用电安全技术方案；',4320)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('64BD9A68-6F3B-4FDA-A13B-EEE712C1C999','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','是否编制高处作业安全技术方案/措施；',4330)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('77BC8332-7AE8-483A-B9E4-7AD4A1A30CC6','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','是否编制起重、运输作业安全技术方案/措施；',4340)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1AD429A1-6009-4072-9A36-359AFBC87C75','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','是否必须编制寒冷季节施工作业安全技术方案/措施；（寒冷区域）',4350)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D3743142-372D-443F-B220-8D7BF0663C7E','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','是否必须编制射线作业安全技术方案/措施；',4360)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6EF7D2FA-0616-4764-A2BD-36C1F8A56964','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','安全技术方案/措施是否包括如下主要内容：编制说明和编制的依据、工程项目概况、主要施工作业程序步骤、具体的安全管理措施、安全措施中发生的机、索、工、器具和材料、相关的图表及文字说明等；',4370)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A6CDD328-5397-4E18-865B-2CA5C54C49F7','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','是否符合编写、审查和批准程序',4380)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BFC2457D-3AFA-488E-AF03-314CE052BE14','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','施工分包方是否组织技术人员向全体施工人员进行交底，并做好记录，接受交底的施工人员应在记录上签字；',4390)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9243AD28-649B-40BF-8BBB-87760F77723D','803A5E17-7DF1-4B6D-9409-E0E0F5D39DDD','施工分包方是否负责组织其有关部门人员协调、落实、检查安全技术方案/措施中的各项工作。',4400)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('99075B34-E0EC-4C3E-905E-93BC1C4B192A','B8F280FA-3CAC-43FD-98AE-B759FCD8287D','是否进入施工现场所有人员在所有时间内，必须统一穿防护服、戴安全帽、穿护趾鞋；',4410)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D78571AC-4734-444E-BA27-36C71AEDE51E','B8F280FA-3CAC-43FD-98AE-B759FCD8287D','个人防护用品是否正确配戴，严禁防护服不系扣、安全帽不系带、护趾鞋当拖鞋穿等不规范行为；',4420)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('03A8306C-E432-420F-88B8-79846D5D9275','B8F280FA-3CAC-43FD-98AE-B759FCD8287D','个人防护服、安全帽、护目镜、护趾鞋是否存在混（借）用现象；',4430)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4EB9FAFC-C889-4AD2-A2EC-67BF5828C709','B8F280FA-3CAC-43FD-98AE-B759FCD8287D','是否根据造成危害或需要某种防护功能，选用或禁止选用某种个人防护用品；',4440)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('75157A2D-01B9-499B-AD18-80B4B4F60277','B8F280FA-3CAC-43FD-98AE-B759FCD8287D','施工单位HSE管理部门是否定期检查个人防护用品使用情况，并做好检查记录。',4450)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C0DF4B57-EDBC-46DC-80DE-7923BCC8F9E1','DE7930B3-94A0-44AE-8479-39592EC9BAAB','施工分包方应是否采取各种方式进行HSE方面的宣传；',4460)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A55088FB-D36B-4D73-9DEE-BE2D8BF3F9CA','DE7930B3-94A0-44AE-8479-39592EC9BAAB','施工分包方是否在国家“安全生产月”，“  119”活动周，“世界环境日”期间对员工进行HSE方面的宣传；',4470)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('260AA45A-A89C-4AB6-B429-F6D11EDA89A3','DE7930B3-94A0-44AE-8479-39592EC9BAAB','施工分包方是否在其施工区域内设置相关警示标志；HSE警示标识包括安全警示标志、防火警示标志、固体废物分类标志、消防安全标志等；',4480)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EF56C7C4-A662-4765-A36A-C14C64C09D34','DE7930B3-94A0-44AE-8479-39592EC9BAAB','在从事危险性高的作业时，例如：吊装作业、高处作业、有限空间作业、夜间作业、放射性环境作业时是否进行安全警示；',4490)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B0BA1C0F-6C2B-4890-894B-5D043D38BB70','DE7930B3-94A0-44AE-8479-39592EC9BAAB','危险部位的警示标志是否设立，如楼梯口、电梯井口、孔洞口、桥梁口、隧道口、基坑边沿等；',4500)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('B962DA39-DD78-4DAA-99B3-E4618E50296D','DE7930B3-94A0-44AE-8479-39592EC9BAAB','是否在紧急场所设置指令标志，如紧急出口方向、疏散通道方向等；',4510)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6768C9A2-2665-4A2E-9EF9-0F7B4271118E','DE7930B3-94A0-44AE-8479-39592EC9BAAB','是否设立固体废物分类标志，生活垃圾和工业固体废物分开存放，并分别进行标识；',4520)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0F8353DB-6E22-45ED-A36D-10B674AF5F1E','DE7930B3-94A0-44AE-8479-39592EC9BAAB','是否对消防设施进行提示性标识，如火警电话、消防栓、消防水带、灭火器等存放的位置。',4530)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('660D5D97-A4BD-4209-B144-9A1F3D03B61B','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','全体员工是否参加了业主组织的一级HSE培训；',4540)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('41F8B528-3695-41AE-8D19-61FE8B26ADC1','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','全体员工是否参加了总承包方组织的二级HSE培训；',4550)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2CC203C3-4639-4CCA-A584-8B1BD0EC91D4','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','是否对全体员工进行了进入现场前的三级HSE培训；考核成绩是否报LPEC HSE管理部确认并备案；',4560)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A2028EB9-87B6-47C1-84DC-CAD9955850F8','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','是否对特种作业人员进行了培训；',4570)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('AD9A6482-A252-4C19-8846-6567B5557265','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','所有进入施工现场的工作人员，进场之前，是否办理了一级HSE培训合格证，持证上岗；',4580)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('034246CA-CF2E-4F3B-9278-5176A3DEFF7D','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','所有进入施工现场的工作人员，进场之前，是否办理二级HSE培训合格证，二级HSE培训合格证以“帽签”的形式标识清楚；',4590)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BDC6D8DC-1431-401C-AF99-96E74C773C28','D3ADAF1D-7799-42E9-BBFD-EB89D93DBED6','是否存在无HSE培训合格证者进入施工现场的现象；',4600)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BA776D04-038F-4929-A3C0-967FFD39EF63','5AEB3327-BA14-4405-A687-B30AAA81D5A8','是否进行了不少于1小时的HSE培训；',4610)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C23C4E32-1076-4AFA-906A-832F0ECAF0DD','5AEB3327-BA14-4405-A687-B30AAA81D5A8','是否存档HSE培训记录；',4620)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7B886ED1-7C70-4047-8BF8-A30592A684AB','5AEB3327-BA14-4405-A687-B30AAA81D5A8','是否做到所有访客，进场之前，必须借领访客证，持证入场；',4630)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('26849148-9F1B-4B3E-BF76-9C410301F3B3','5AEB3327-BA14-4405-A687-B30AAA81D5A8','是否存在无访客证的访客进入施工现场的现象；',4640)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4AFEB979-9833-47DF-BBDE-0D9D347523DC','5AEB3327-BA14-4405-A687-B30AAA81D5A8','临时访客进入现场是否穿戴工装、安全帽；',4650)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E09803D8-4102-44D5-ACE9-DC8E4CBA0163','5AEB3327-BA14-4405-A687-B30AAA81D5A8','临时访客进入现场是否违规携带烟火；',4660)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E0A7D084-1A74-4290-871D-AD96C116A10C','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','是否有施工现场通行证；',4670)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('716C2ABD-770E-4573-9541-781943BA8669','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','司机是否有驾驶证、行车证；',4680)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C1FBF300-A2BE-47BA-B48E-90F1C391AF76','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','是否按规定路线、速度行驶；',4690)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('78D4137B-6399-4181-B1CA-1EC3EE6FC97F','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','是否按指定位置停放；',4700)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('24BCE911-6542-4E93-98AF-28553185D14C','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','是否有安全防护措施；',4710)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1FC75E2D-B7FE-4D84-ABBE-AC0341C6F337','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','司机是否过度疲劳或酒后驾车；',4720)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('96550036-7E3A-4092-81CA-597EA9F6BC4F','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','是否搭乘无HSE培训合格证或无访客证人员；',4730)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('CB4BB408-7A09-4499-BFE7-337C34A132B8','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','运载物品是否影响环境；',4740)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6CD12146-0EDE-48D1-A96B-BD8A169FDC16','6FF1023B-FCDE-4EC5-9778-439CA1D1D0D7','是否搭运载违禁物品；',4750)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('5909A868-89CC-4467-94F1-B27EDD7160A7','A44B1736-4563-4773-8C2D-140C6A76F103','是否设有风险评估组织机构并有效运行；',4760)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('20D9E3B3-86C8-4ABF-B9C1-146E69A3268E','A44B1736-4563-4773-8C2D-140C6A76F103','是否编制了风险评估结果及隐患治理报告；',4770)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7CB59FEF-863D-4B6B-8D15-B9FE29A9C0DA','A44B1736-4563-4773-8C2D-140C6A76F103','报告内容是否缺项？至少应包括下列四项内容：a)	分项（分部）或单位工程名称及简介；b)	评估小组组成及评估时间；c)	评估方法及手段；d）评估结果及隐患治理措施，以表格形式列示。',4780)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7C15A070-60BA-4CD6-BAF6-DF42D0C98B1D','A44B1736-4563-4773-8C2D-140C6A76F103','报告是否经LPEC HSE经理审批，（重大问题由LPEC项目经理审批）；',4790)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D9AA06FF-E48F-4866-9BB2-EF0C28A4D594','A44B1736-4563-4773-8C2D-140C6A76F103','施工分包方是否依据报告组织实施了隐患治理；',4800)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('86F55BBA-1F87-4430-8C65-FAC700A55519','A44B1736-4563-4773-8C2D-140C6A76F103','施工分包方是否对隐患治理结果进行了自检；',4810)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1309205F-ED13-480B-9FE5-D27DA572C642','A44B1736-4563-4773-8C2D-140C6A76F103','施工分包方是否对隐患治理结果上报LPEC项目部考核验收；',4820)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D0E10844-A4A1-48EF-990F-F7AB385EAD4B','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','是否编制了现场HSE应急预案；',4830)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6DAB73C4-0EC1-43B7-9234-1FD8AC5D73E5','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','应急预案内容是否缺项？至少应包括下列九项内容：
a)	评估潜在事故危险的性质、规模及紧急状态发生时的可能关系；
b)	制订与外部机构联系的计划，包括与紧急救援服务机构的联系；
c)	设施内外报警和通讯联络的步骤；
d)	应急指挥中心的地点和组织；
e)	在紧急状态中现场人员的行为（包括撤离步骤）；
f)	在紧急状态下，非现场人员和其他人员的行为；
g)	应急预案所需的资源（人、物资设备）获得的渠道和方式；
h)	地方政府和紧急服务机构的地址和电话及其它联络方式；
i)	应急设备、物资：',4840)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2AC2B10D-7A96-4A8E-B48F-E307B9F46733','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','施工分包方是否成立了成立应急指挥部，并明确主要职责：',4850)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E8892F7C-4204-4B64-A2C3-4B83225C4439','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','施工分包方是否按照应急预案的计划，组织实施了应急演练（一般每半年一次）：',4860)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('24A81BA6-7F36-400D-B95F-481051B3445F','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','施工分包方是否存档有应急演练记录；',4870)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9305942E-EC46-4461-9EF0-E2CC36BBC7A6','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','施工分包方是否有紧急状态下的应急事件处置步骤；',4880)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('016609DB-78E8-4488-9C12-11B628E12B18','0DE6C919-02AD-4297-B6E1-D0D60C31DEA7','施工分包方是否对事故进行调查分析，并按规定处理善后事宜；',4890)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('1D000E88-3599-4459-BB2D-248225824243','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','是否明确规定了文件、资料的控制范围；',4900)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('E86D19BB-77B2-48AA-A6C0-C5FF9DF3507C','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','是否明确HSE信息及文件处理的权限；',4910)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F9EE02E6-7B80-49DD-93BF-666FF1851B38','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','施工分包方是否专人对HSE信息及处理结果反馈进行收集、整理、归类、传递等；',4920)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('01EC3F28-A91E-46E9-B2D2-D8D5C901D4F3','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','是否所有与HSE有关的文件、记录、报告、表格等均分类建立台帐，并交资料员进行登记存档；',4930)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('581E13C1-F16F-4ACE-B400-F40C6C097C01','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','施工分包方是否所有归档资料均有唯一的编号且编号连续；',4940)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('31B45DAA-5BD6-4CC7-83B5-16D6A09641A8','1AFA2D62-681A-4D58-86FA-E40C8B13DD88','施工分包方HSE信息及文件借阅共享是否履行借阅共享手续；',4950)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9390BD32-7DE0-4A34-96D9-BAB69C55D800','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','是否建立班组长安全生产责任制度；',4960)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('15835C33-C89E-4661-B2F4-5F4FEE81FCA7','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','是否建立职工安全生产责任制度；',4970)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('187FAF71-0A83-4A53-A3C7-EF3C735ED511','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','是否对所有职工进行了工种（岗位）安全生产教育，并考试合格；',4980)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('57378A1F-FE57-4895-B3EC-1CD2655ABBD7','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','对严重违章职工，施工单位是否进行违章者再教育，并考试合格；',4990)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('29265703-23FB-4BAD-B47C-F7699CE2874B','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','是否做到班组每周一早上利用1个小时左右的时间开展安全活动，每月安全活动时间不得少于4小时；',5000)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('50A6AC69-49F2-4E3A-A8D9-E159022B9F67','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','班前安全讲话是否做到“三交一清”；',5010)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F5954DFE-7C8B-4893-81CC-80DA82E872B2','F7AA4D86-D92A-4683-B7AD-A11BF9D9EA5B','是否做到班组安全活动情况和班前安全讲话由班组长指派一名职工负责记录，记录要与班组长的讲话同步进行；',5020)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9C49D294-C005-4259-8BC7-9901AE4E28D3','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','是否做到严格按施工总平面布置施工，暂设、机具、材料不得随意摆放或无计划搭设；',5030)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D147FE77-F7F0-460E-AC9C-A96C53C6F61B','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','是否正确佩戴劳动保护用品，统一着装并符合HSE规定；',5040)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8F56B6B3-C76E-45B0-BDED-718DD76554EA','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','是否现场定期组织清扫，保持现场环境卫生、干净、整洁；严禁随处大小便；设备、配件或材料上保持无泥土、污物和不文明的漫画和文字；',5050)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8E9FC292-5832-4F77-BBE9-75C9D96EB843','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','是否施工现场按区域设置废料箱和垃圾箱，及时回收余料、废料；',5060)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('9C98ABED-0D8E-4FCE-8732-BF8870A8286F','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','工具房等是否按要求整齐摆放，做到工完料尽场地清；',5070)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F556EE5F-0AC3-48F5-A7CD-84F864F06B3F','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','现场的水线、电缆、导线、电焊把线、二次线是否统一规划，合理布置；',5080)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('6EBACB4C-EEB1-4A9A-A68B-DE0E72C28AC8','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','是否做到班组安全活动情况和班前安全讲话由班组长指派一名职工负责记录，记录要与班组长的讲话同步进行；做到氧气带、电焊把线每日收工后盘好；',5090)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8F47290E-18DB-4CA3-AFBB-E942A5A3EF9B','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','施工现场是否配备必要的急救用品和救护车辆；',5100)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EA26D0B2-4FB3-4CB4-A064-DAEEE7C3174F','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','施工现场道路是否指定专人清扫，定期洒水，防止尘土飞扬；',5110)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('83F8C4ED-9695-4E17-B01C-3CD257B3BCC8','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','密闭容器内施工是否采取通风措施，在粉尘环境作业的人员，是否配戴防尘口罩；',5120)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('2C9724D0-B1AD-4DAC-935B-099C97600F99','889BE6F2-C413-4EC5-8F42-6CAA3EB2724D','食堂是否做到保证饭菜质量，防止食物中毒事件的发生。',5130)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('D275A8B0-EE2A-4B23-9426-2A9BACE156AC','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','施工分包方项目部是否制定了本单位的职业卫生管理职责；',5140)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A537B032-ED18-470F-A861-D31ED3EF0BA5','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','是否建立和完善项目职业卫生与职业病防治管理机构，健全职业卫生管理规章制度，制订本项目职业卫生与职业病防治工作计划和职业卫生管理实施细则，并监督实施；',5150)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('51D72675-154B-459E-B598-9D5CEAF556D1','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','是否教育职工执行操作规程，普及防尘防毒知识，正确使用劳动保护用品和防尘防毒器材；',5160)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C749B642-15D0-403D-8D74-AF26DFB1DC3B','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','是否按规定组织安排作业人员进行健康检查；',5170)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('F05D05B8-7849-41C3-B15B-98E3FDEE3DAA','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','施工企业的尘、毒、射线、噪声等防护设施，是否加强维修管理，确保完好；',5180)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('249ACBF2-07B0-447C-A415-409D825061DA','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','在具有酸、碱等腐蚀物质或化学烧伤危险的场所是否设冲洗设备；',5190)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EDFEDA04-68F9-4901-973E-28E811212F78','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','是否严格执行防尘防毒措施和管理制度；',5200)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('BDF99630-4919-4F30-9B2C-1490AC8C1B07','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','职业卫生与职业病防治工作所需的管理经费、仪器设备购置费，是否得以保证，专款专用；',5210)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('4C151F05-AF68-4084-A85C-454F223D65E3','8A6E4DD8-8433-4080-8F91-A538EA8F0CFE','施工分包方是否做到职工总数超过1000人设专职职业卫生管理人员1人，不足1000人设兼职职业卫生管理人员1人；',5220)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('EA323602-4145-481B-A04C-E40680EB9AA9','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','施工分包方项目部是否建立健全施工现场的公共安全与治安保卫组织机构，落实各级安全保卫责任制；',5230)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('7A905765-D116-40E2-A03D-590B606337A8','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否建立健全公共安全与治安保卫各项管理制度，确保文明施工；',5240)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('923C3BFA-593E-4A5A-ABF5-EB366B555D38','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否进入现场的所有人员佩戴业主统一制作的现场出入证，所有人员在办理出入证之前是否经过业主的一级HSE教育；',5250)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('8384E6B9-F47C-4C8E-86FC-A1D2649554C0','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','进行工作时是否按规定着装，穿符合工作要求的劳保服装；',5260)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A137CE85-6F29-48AA-A860-309C3099391C','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否存在厂区内违规吸烟行为；',5270)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('95942586-E9E9-4EF2-932C-6BADC43BE92D','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否存在厂区内饮酒和吸毒行为；',5280)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('C4708DB3-8B4A-492A-928F-D9353A1E2DE9','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否存在厂区内斗殴和赌博行为；',5290)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('153AF25E-FA1B-4FE4-84E7-DAFD7681F00A','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否携带、使用武器、管制刀具或用其它物体作为武器；',5300)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('96B8A94F-7546-4F04-9EB3-FCF2C6C731C8','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','施工分包方是否在自己的施工区域和临时设施周围安装围栏和大门，并设置门卫；',5310)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('0ED14A5A-221F-493F-8E42-395C45C80575','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否有人在施工现场内过夜，夜间施工是否事先向业主报批；',5320)
GO

INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)
VALUES('A128C4B0-2900-4028-A6A5-D49D7843E8D8','DF4DBD4D-3DF2-401E-96A6-C7F24249CD37','是否存在不服从门卫管理，无理取闹，谩骂和侮辱门卫人员的现象。',5330)
GO
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('c3160175-f5a6-4259-b7a9-6032e4ea14d4','临时用电检查','0',NULL,0,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e78b6db0-786c-4e39-8450-e9c6443992cc','管理行为检查','0',NULL,0,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('d5bd7f74-f8ec-4c47-80f6-6faa0aa411e2','动土作业检查','0',NULL,0,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('c6dd5b8c-3319-40b3-9da1-110edd495f6e','脚手架检查','0',NULL,0,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('8112de07-c875-49ad-931a-494bb631cdf7','模板支护检查','0',NULL,0,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('c1b5d2b4-84f9-475c-890a-8f12ee69536b','高处作业及临边防护检查','0',NULL,0,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('aca76fe1-fc76-42d3-b091-75a6de5e384e','起重吊装作业检查','0',NULL,0,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('fb982f06-b30e-4f12-ac61-03b413a78ea5','消防与动火检查','0',NULL,0,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('418c60a6-472d-4105-85af-b433720b066f','施工现场文明施工检查','0',NULL,0,9,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('81068c1f-d6b2-4384-9676-078dd7521d14','生活区检查','0',NULL,0,10,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('49593a7b-8df4-443c-b021-35832770f80e','射线作业检查','0',NULL,0,11,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('2afb98a2-082c-4ef1-896b-7d6f8a17967e','受限空间作业检查','0',NULL,0,12,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('af37ab63-18df-4b45-886c-5d123118d677','试压吹扫检查','0',NULL,0,13,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e1b32273-8a63-432c-a224-375838b36ca3','气瓶检查','0',NULL,0,14,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('4a54cbb2-7072-4f4e-9928-a15d1d0ad256','危险物品检查','0',NULL,0,15,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('41128d20-b752-4874-8033-2b12ef63eea2','高处吊篮检查','0',NULL,0,16,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('ff8c0592-b843-4ab8-b54b-7f3129edcde3','机具设备检查','0',NULL,0,17,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('df5e1a00-accc-4b8c-a177-15216763197a','试车检查','0',NULL,0,18,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('687f025d-06a4-460f-869c-57b3b34adad5','其他综合检查','0',NULL,0,19,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('cf0bd845-0b30-4a42-b255-1a6c8a70900a','作业前交底检测及办票','2afb98a2-082c-4ef1-896b-7d6f8a17967e',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('845979c6-d39f-449a-94d9-fb26506061dd','作业时管理','2afb98a2-082c-4ef1-896b-7d6f8a17967e',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('5ab6082e-f5d4-42d0-83e4-3cd1cdcd9b5c','其他','2afb98a2-082c-4ef1-896b-7d6f8a17967e',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('0effae99-5429-4b76-8c52-c2138fa8ad66','安全装置','41128d20-b752-4874-8033-2b12ef63eea2',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('bdbe9fb2-c771-4d49-b015-f82f0f22a3d9','悬挂机构','41128d20-b752-4874-8033-2b12ef63eea2',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('f33388d0-e584-4b0d-b5d3-9c1cb16c94a4','吊具及材质','41128d20-b752-4874-8033-2b12ef63eea2',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('15243898-2109-4ba0-a3e7-bb9569b9e3c4','安全作业','41128d20-b752-4874-8033-2b12ef63eea2',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('6e9d31be-e922-47e0-b5a7-7943d6f09035','交底与验收','41128d20-b752-4874-8033-2b12ef63eea2',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('7466bf20-11c8-4af7-a1ae-7e3b781e0e0e','安全防护','41128d20-b752-4874-8033-2b12ef63eea2',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('45d9774e-f8e9-41d9-ac7e-73d0d7142529','其他','41128d20-b752-4874-8033-2b12ef63eea2',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('105b10cc-f4a6-482a-96c4-161ceeed80c4','现场围档','418c60a6-472d-4105-85af-b433720b066f',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('996c7f5d-2cbd-4cff-b386-7c5dd0be12d0','封闭管理','418c60a6-472d-4105-85af-b433720b066f',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('c8b8638c-0c0d-409c-82a9-30640b83a985','施工工地','418c60a6-472d-4105-85af-b433720b066f',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('8c9df280-84a6-4292-8cc0-42ef231e55b5','材料堆放','418c60a6-472d-4105-85af-b433720b066f',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('bec226c6-94d9-48ad-bfe0-ecf870eab252','施工现场标牌','418c60a6-472d-4105-85af-b433720b066f',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('f6aaca10-0e64-4d2f-bebb-c28e2db1155a','现场环境','418c60a6-472d-4105-85af-b433720b066f',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('d73e1da1-c823-4abd-800c-b057bf54d7f5','保健急救','418c60a6-472d-4105-85af-b433720b066f',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('49c32b06-f089-4b22-838e-f598e91f7709','其他','418c60a6-472d-4105-85af-b433720b066f',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('356aab0e-c466-4228-97e6-4060e7ba92b4','资质审查','49593a7b-8df4-443c-b021-35832770f80e',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('897ea9a2-29c3-4254-8e76-424759300e9f','作业前准备与清场','49593a7b-8df4-443c-b021-35832770f80e',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('a6903b17-0743-4e6f-9e8e-6972dadf7e40','作业时安全措施','49593a7b-8df4-443c-b021-35832770f80e',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('48838f9b-5f42-4ca2-965a-26db0c78bf87','伽马源γ管理','49593a7b-8df4-443c-b021-35832770f80e',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e63bd7b3-7e52-43fb-9d1b-689769ce103e','无损检测应急管理','49593a7b-8df4-443c-b021-35832770f80e',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('043264f8-fb2f-4c85-9a05-0a20d36fa815','其他','49593a7b-8df4-443c-b021-35832770f80e',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('d7397073-d676-4e83-9b7f-42ac2c296964','规章制度、应急预案','4a54cbb2-7072-4f4e-9928-a15d1d0ad256',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('666353e6-62f4-4e5e-ba3b-9faa6e9337da','人员培训','4a54cbb2-7072-4f4e-9928-a15d1d0ad256',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('bf154090-d4c6-4eff-90b4-18949bf18259','危险品仓库','4a54cbb2-7072-4f4e-9928-a15d1d0ad256',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('6a42ccb0-1d32-4d7d-b8e1-75878b5dc8f1','危险品贮存管理','4a54cbb2-7072-4f4e-9928-a15d1d0ad256',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('3dfeba3b-3306-4c3b-801c-bc8ebfc37a58','危险品出入库管理','4a54cbb2-7072-4f4e-9928-a15d1d0ad256',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('8e3119c3-9b7a-4647-80cb-c0586c0780ec','其他','4a54cbb2-7072-4f4e-9928-a15d1d0ad256',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('1975bb25-94e9-4fd5-a74f-31fb39890b6d','冬季安全检查','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('57a55f3e-8913-4250-b9ae-732dfcf1905b','雨季安全检查','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('51331fed-663b-4e37-96b2-0a7f09889d7c','暑季安全检查','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('b6b1d0cc-5482-4334-a371-414353c0148a','风季安全检查','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e6b2580e-db2b-4bb5-a22c-353ec169f1e9','假日前安全检查','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e299e59f-0174-472a-9025-73f2e754b487','格栅作业','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('d2cf710a-10dd-419e-8fbf-9337f6c0cfe4','送变电','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('0da8615d-7683-4766-ac90-600cebe156cb','烘炉','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('85868409-021f-4292-862a-37ddb2377026','盲板抽堵','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,9,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('c20dcb76-dd72-4b14-96c6-325ceacc948c','断路作业','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,10,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('fc78746f-3235-4fa4-a72f-e32c8a661f2e','爆破作业','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,11,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('952273e0-f25d-4127-8cd6-9d18de94614f','安全保卫','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,12,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('948bea04-992f-48d2-b4b9-4ac463e05656','其他','687f025d-06a4-460f-869c-57b3b34adad5',NULL,1,13,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e417e882-ccff-43c4-b0bc-980e3d3d55d2','生活区管理制度','81068c1f-d6b2-4384-9676-078dd7521d14',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('6f53fb3b-4693-4977-a7f5-833e0fc5b542','生活区设施检查','81068c1f-d6b2-4384-9676-078dd7521d14',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('365041cb-e8d5-4a9c-a628-6782d667491d','用电安全检查项目','81068c1f-d6b2-4384-9676-078dd7521d14',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('c1eaa17b-90d0-4424-8990-5d15b806a047','违规现象','81068c1f-d6b2-4384-9676-078dd7521d14',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('c9b216ab-e5cf-4bdc-bb8e-164a003fbdca','管理措施','81068c1f-d6b2-4384-9676-078dd7521d14',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('7149cfaa-492e-4bde-b0c6-c45022a74ca9','食堂安全检查','81068c1f-d6b2-4384-9676-078dd7521d14',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('57bd144d-ba78-4f1f-8043-13e9810b35af','生活区卫生检查','81068c1f-d6b2-4384-9676-078dd7521d14',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('82b959e6-2870-48ec-88e4-f018b81c2e67','其他','81068c1f-d6b2-4384-9676-078dd7521d14',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('86479986-bdbe-4b54-8b3d-0be6e2288637','施工方案','8112de07-c875-49ad-931a-494bb631cdf7',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('19d176b3-b3fb-4de5-9a0b-aeb6ee9d5e08','支撑系统','8112de07-c875-49ad-931a-494bb631cdf7',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('a7a51b31-f27d-4b14-b042-c03ee57f4048','立柱稳定','8112de07-c875-49ad-931a-494bb631cdf7',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('07167f93-7962-4f0b-8c63-6172a3e253a7','施工荷载','8112de07-c875-49ad-931a-494bb631cdf7',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('1857a9bc-bd05-46f0-a1ec-07aebf283b19','模板存放','8112de07-c875-49ad-931a-494bb631cdf7',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('cc54333a-2d80-43ae-831d-82c870e3d8cc','拆除模板','8112de07-c875-49ad-931a-494bb631cdf7',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e2387152-9b1a-4447-9a25-e227a4f74767','模板验收','8112de07-c875-49ad-931a-494bb631cdf7',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('ba1bc0fc-f118-4f2c-b148-68adf474b7c4','混凝土强度','8112de07-c875-49ad-931a-494bb631cdf7',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e3e137ae-67fa-41fe-acc5-bdae3a2bc6d0','运输道路','8112de07-c875-49ad-931a-494bb631cdf7',NULL,1,9,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('b6bac4a0-a5d5-438a-9a8b-8eaa2218dcb2','作业环境','8112de07-c875-49ad-931a-494bb631cdf7',NULL,1,10,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('80081fe1-8a0f-4f29-b7b3-c27d8fa7a4fc','其他','8112de07-c875-49ad-931a-494bb631cdf7',NULL,1,11,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('7fb552c4-382f-4bdd-a3d9-651c4a4ccc44','起重机械','aca76fe1-fc76-42d3-b091-75a6de5e384e',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('13aeb1e9-cacc-47f3-b4c2-73545e5d2ec8','钢丝绳与地锚','aca76fe1-fc76-42d3-b091-75a6de5e384e',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('ee44f1a4-e662-4ecf-bcf0-48cab958dc6d','吊点','aca76fe1-fc76-42d3-b091-75a6de5e384e',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('25046ba3-7f1a-498d-b3fb-5d996a6dcbcd','司机、指挥、操作工','aca76fe1-fc76-42d3-b091-75a6de5e384e',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('612a5624-6126-475a-8c9c-c036a4a0da95','地耐力','aca76fe1-fc76-42d3-b091-75a6de5e384e',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('d84aa24c-d5bd-4fd4-bca3-263c625707d6','起重作业','aca76fe1-fc76-42d3-b091-75a6de5e384e',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('ab5ac0de-4c65-4fb5-9e05-c990c40c4c96','作业平台','aca76fe1-fc76-42d3-b091-75a6de5e384e',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('3109335f-7d58-4daf-b642-ab8bbe23305c','构件堆放','aca76fe1-fc76-42d3-b091-75a6de5e384e',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('b06783bc-7267-4aaa-b501-9549dcd7e096','警戒','aca76fe1-fc76-42d3-b091-75a6de5e384e',NULL,1,9,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('88e3eede-7ecf-4396-a9ff-7557b5855af0','塔吊','aca76fe1-fc76-42d3-b091-75a6de5e384e',NULL,1,10,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('33488afc-9827-4749-b91c-48a0be11cc3b','其他','aca76fe1-fc76-42d3-b091-75a6de5e384e',NULL,1,11,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('52a0821a-630d-4cb0-ad0e-93a4ed8c8fc0','人员检查','af37ab63-18df-4b45-886c-5d123118d677',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('b0218b99-fe5a-4054-a741-9f9ff109f88e','方案与技术交底','af37ab63-18df-4b45-886c-5d123118d677',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('ea73a6cb-c991-4e0f-a544-62334817aa21','安全防火','af37ab63-18df-4b45-886c-5d123118d677',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('b25021e1-de89-4297-bbf7-b74697ac1e9a','安全防护与检查','af37ab63-18df-4b45-886c-5d123118d677',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e4f2b15f-10c0-4f0d-9326-0f551213abdf','作业使用的设备和器具','af37ab63-18df-4b45-886c-5d123118d677',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('222f1d0b-d990-48ec-9a97-9c4cf4e15c33','试压排放口、吹扫口要求','af37ab63-18df-4b45-886c-5d123118d677',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('91292573-b241-4209-a8bf-c0126f4aad9a','应急措施','af37ab63-18df-4b45-886c-5d123118d677',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('dba6c0ed-0b65-4155-b9c1-fa95eab77a16','其他','af37ab63-18df-4b45-886c-5d123118d677',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('6ffdb168-e839-46b9-8c94-200cd46ca0b6','人员违章','c1b5d2b4-84f9-475c-890a-8f12ee69536b',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('09b01f67-3d8f-4143-8d14-b67fb9b8c034','作业平台及孔洞','c1b5d2b4-84f9-475c-890a-8f12ee69536b',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('4ded0823-2756-4dbd-8d81-7ef1770b1245','临边及悬空作业','c1b5d2b4-84f9-475c-890a-8f12ee69536b',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('b620dcfc-ae18-4d02-b28a-131765f2adad','其它注意事项','c1b5d2b4-84f9-475c-890a-8f12ee69536b',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('dccda995-156c-4c35-aa6d-b23f69561091','外电防护','c3160175-f5a6-4259-b7a9-6032e4ea14d4',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('0ed3125e-e604-48c1-8e5f-21d5e9535def','接地与接零/保护系统','c3160175-f5a6-4259-b7a9-6032e4ea14d4',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('ab54ef75-9e0d-4d02-9dbd-a75da631cad5','配电箱与开关箱','c3160175-f5a6-4259-b7a9-6032e4ea14d4',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('749d84af-fe4e-44f1-9ad1-6a36193e3328','现场照明','c3160175-f5a6-4259-b7a9-6032e4ea14d4',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('efa25d9a-0ddd-4a72-a92e-54cddc33ca07','配电线路','c3160175-f5a6-4259-b7a9-6032e4ea14d4',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('79727f49-9c90-42fa-9547-9f0445972810','电器装置','c3160175-f5a6-4259-b7a9-6032e4ea14d4',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('484c1208-524f-40ce-ba77-ac751e97879e','变配电装置','c3160175-f5a6-4259-b7a9-6032e4ea14d4',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('73184d82-a823-40fc-942c-fe91c8482ab9','用电技术资料档案','c3160175-f5a6-4259-b7a9-6032e4ea14d4',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('ad4acbca-b373-45a3-9cd6-3082c33b3132','其他','c3160175-f5a6-4259-b7a9-6032e4ea14d4',NULL,1,9,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e6e651f1-3024-49a8-a0e0-cfd5aff640b8','施工方案','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('14b27bec-7906-4d2b-8bcd-e49169e1a21e','立杆基础','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('f0660445-1d00-4105-a1b9-277acc8acb81','架体与建筑结构拉结','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('b0d4c8dd-5129-446c-b084-99db610f0f0e','杆件间距与剪刀撑','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('2e0177fe-678e-4fa4-9878-e18f28242a9b','脚手架与防护栏杆','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('189a4cf1-8657-41a2-b7c4-b236c74d5645','交底与验收','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('4733b9e2-8cf7-4caf-829a-a07ec1eab5f5','小横杆设置','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('77e80467-5f83-47b2-a6a0-6c4254433949','杆件搭接','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('d64c102c-49e9-424f-a65a-844639a598a7','架体内封闭','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,9,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('54fbf80c-0437-4b3d-8e45-01a94013e103','脚手架材质','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,10,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('f3e52048-4d3f-475e-8848-5ec3948a78fb','通道','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,11,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('c2f10e79-a2ec-46cd-a451-c74a5139beb1','卸料平台','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,12,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('5bd6a724-0458-4673-b4ff-dbdad99b3eb1','其他','c6dd5b8c-3319-40b3-9da1-110edd495f6e',NULL,1,13,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('2d09b36d-38da-4704-b422-a027ab146bfb','施工方案','d5bd7f74-f8ec-4c47-80f6-6faa0aa411e2',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('ed1b5241-4e32-4862-8b3e-a7f367c9e93b','临边防护','d5bd7f74-f8ec-4c47-80f6-6faa0aa411e2',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('7325a7e4-b556-4d8b-adaa-08e01ad9b653','坑壁支护','d5bd7f74-f8ec-4c47-80f6-6faa0aa411e2',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('bf9f373e-a65a-4061-ac82-8107fd149bd7','排水措施','d5bd7f74-f8ec-4c47-80f6-6faa0aa411e2',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('7e9215ee-a40d-49ef-abb2-643131cbdbda','坑边荷载','d5bd7f74-f8ec-4c47-80f6-6faa0aa411e2',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('c01870ef-3b85-476d-94f3-277ac8dd46d4','上下通道','d5bd7f74-f8ec-4c47-80f6-6faa0aa411e2',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('85b580d3-2fac-4589-ae7f-aa677cce456a','土方开挖','d5bd7f74-f8ec-4c47-80f6-6faa0aa411e2',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('210faabe-1cbe-435b-b891-b5dd40a3bf9a','基坑支护,变形监测','d5bd7f74-f8ec-4c47-80f6-6faa0aa411e2',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e3de5c35-8180-4e65-a55b-3b9b1ebb0180','作业环境','d5bd7f74-f8ec-4c47-80f6-6faa0aa411e2',NULL,1,9,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('5e6764e8-68d1-4f7c-99c3-f48d9caa0f39','其他','d5bd7f74-f8ec-4c47-80f6-6faa0aa411e2',NULL,1,10,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('30bb55cd-9be4-4d08-a090-e7f13fc81953','人员检查','df5e1a00-accc-4b8c-a177-15216763197a',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('67d32618-1983-4e1c-b2b8-d648c4b88270','方案技术交底','df5e1a00-accc-4b8c-a177-15216763197a',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('80734bec-785c-4744-92c2-9146721159f3','安全防护','df5e1a00-accc-4b8c-a177-15216763197a',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('98045cc7-a4fe-4acc-a091-2826776cc866','安全警戒标识','df5e1a00-accc-4b8c-a177-15216763197a',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e6fa53f6-1dcd-419c-acd0-0db1b8f438cd','试车电源','df5e1a00-accc-4b8c-a177-15216763197a',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('5f36824f-ae8d-4ddd-90b7-c76e4d14b57a','安全防火','df5e1a00-accc-4b8c-a177-15216763197a',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('5ab2e2e8-84ec-4b97-8fe5-1cccc1ae0160','设备安全检查','df5e1a00-accc-4b8c-a177-15216763197a',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e94c80fd-0fed-4f77-a839-1a009c93cd37','应急措施','df5e1a00-accc-4b8c-a177-15216763197a',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('4fe39381-e576-4510-bbda-d6e409f63af3','其他','df5e1a00-accc-4b8c-a177-15216763197a',NULL,1,9,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('c7ba5d46-d93c-49b8-904c-cd44f86528f7','气瓶检验及出入记录','e1b32273-8a63-432c-a224-375838b36ca3',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('57e754a6-cf58-4c84-a4f3-93f776be804b','气瓶存放','e1b32273-8a63-432c-a224-375838b36ca3',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('4ee8f944-5b80-45ae-8e60-3c48ef2d26e9','气瓶使用','e1b32273-8a63-432c-a224-375838b36ca3',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('1a47c5fd-87a4-40ca-9ac8-8a6413f5cdd1','气瓶运输','e1b32273-8a63-432c-a224-375838b36ca3',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('edcf314e-6656-4cd9-86f3-8e1164451f05','其他','e1b32273-8a63-432c-a224-375838b36ca3',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('78f2f6ec-24a2-4e7f-9b6e-eec942cc30ce','HSE组织机构及管理体系运行','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('c454ca84-e2e6-4ac4-aff3-2a29270c88ac','现场安全方案/措施管理规定','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('6d0a9f00-7aed-4386-bafe-f2e7af0f24b4','个人防护用品使用','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('acf769bc-854f-4e4d-a711-463df386cdbb','HSE宣传与警示管理','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('b2e48682-2117-445c-9c18-eea717c1d8ef','HSE培训及持证上岗','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('44b0ad52-36c9-4cc9-a8a9-967a2f59a737','现场车辆进出管理','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('5dbd0ce5-e64c-494d-924a-1d8462625cda','HSE风险评估和隐患治理','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('52401d1b-43e6-47ec-8e04-abc81e4e6ca8','现场HSE应急管理','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('7d2095fd-47e4-4ba0-8af6-aa88acbb0b99','HSE信息管理规定','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,9,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('dd5e6f9d-dd6e-4fe5-9007-70c5d9ce06b6','施工队、班组安全活动管理','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,10,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('f716ddb1-3128-4608-b03e-d25811c8002a','职业卫生管理','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,11,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('f823abfb-8218-43cc-a160-bf0791b6f149','公共安全与治安保卫','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,12,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('68da4b77-9adc-4c5d-8f36-8a0fc935dd7a','管理态度','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,13,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('d458f341-8d70-4a7c-ba22-93c6dfba1ba7','办理安全作业许可证','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,14,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('0db0a2e7-2837-4863-aabb-d3332b525337','其他','e78b6db0-786c-4e39-8450-e9c6443992cc',NULL,1,15,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('5b60d917-7e09-4952-a46c-04b5a10fa56c','消防安全管理制度','fb982f06-b30e-4f12-ac61-03b413a78ea5',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e87e9a29-8a9a-4e20-9a03-69733f9c001a','生活区防火','fb982f06-b30e-4f12-ac61-03b413a78ea5',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('0a61cbd4-236d-4b9a-bb52-f72736c0f8fb','现场防火','fb982f06-b30e-4f12-ac61-03b413a78ea5',NULL,1,3,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('855f5e09-ce6f-4f6d-8725-b5011b78a4f4','电器防火','fb982f06-b30e-4f12-ac61-03b413a78ea5',NULL,1,4,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('58e8d8d9-f576-4e5d-83aa-f2d6324b0c0c','日常管理记录','fb982f06-b30e-4f12-ac61-03b413a78ea5',NULL,1,5,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('dd3b16b3-8582-4577-ab64-f47cc62a245b','易燃物消防管理','fb982f06-b30e-4f12-ac61-03b413a78ea5',NULL,1,6,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('0b738600-c6e0-4e5b-8bba-f90d0c2eabb3','消防通道及救援设施','fb982f06-b30e-4f12-ac61-03b413a78ea5',NULL,1,7,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('fd5d6b6d-537c-4b1d-879d-ab410c69699d','其他','fb982f06-b30e-4f12-ac61-03b413a78ea5',NULL,1,8,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('e90279e7-e307-4075-9fd4-42cd585b0aeb','特种设备','ff8c0592-b843-4ab8-b54b-7f3129edcde3',NULL,1,1,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('b050a452-78a0-44a9-9bac-b9f5c6d213cd','一般机具设备','ff8c0592-b843-4ab8-b54b-7f3129edcde3',NULL,1,2,1,NULL);
INSERT INTO [dbo].[Technique_CheckItemSet]([CheckItemSetId],[CheckItemName],[SupCheckItem],[MapCode],[IsEndLever],[SortIndex],[CheckType],[IsBuiltIn]) VALUES('d94747b0-d340-4755-89c5-e7a90588ed4b','其他','ff8c0592-b843-4ab8-b54b-7f3129edcde3',NULL,1,3,1,NULL);


--检查项 明细
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0005a322-9e84-4e35-8a96-bf2f9a9693d9','c1eaa17b-90d0-4424-8990-5d15b806a047','使用电炊具做饭',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('005f99ad-dc94-4b0c-8320-cb5a4a8aa792','e6e651f1-3024-49a8-a0e0-cfd5aff640b8','脚手架有无施工方案',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('010e4227-4129-4878-ad55-fb0287bccddb','043264f8-fb2f-4c85-9a05-0a20d36fa815','其它',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('01398d56-218c-4ca3-a4b9-e2f1ddc6981e','e87e9a29-8a9a-4e20-9a03-69733f9c001a','生活区需要按规定配备消防器材',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('017eb368-b868-4715-82eb-53458c823fc9','365041cb-e8d5-4a9c-a628-6782d667491d','有无专用配电箱',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('018b8d69-3e86-4762-b1f2-8a4f054c8f87','cf0bd845-0b30-4a42-b255-1a6c8a70900a','是否经检验合格，办理相关的作业票证后方可进入设备、装置、容器、坑道、井下作业',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('01dc1f39-16c2-4bb5-8960-3dffc6396b9b','f823abfb-8218-43cc-a160-bf0791b6f149','是否建立健全公共安全与治安保卫各项管理制度，确保文明施工',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('03ce4c58-cd8d-49ad-ae9c-7b40fec636f2','ab54ef75-9e0d-4d02-9dbd-a75da631cad5','电箱下引线出线是否整齐',9) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('03eedd50-5929-4bad-9743-938d677c9aaf','88e3eede-7ecf-4396-a9ff-7557b5855af0','两台以上塔吊作业时有无防碰撞措施?',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('040d78a7-5e15-405a-9ef1-afafa9c4aaaf','e4f2b15f-10c0-4f0d-9326-0f551213abdf','体试压和高压水试压设有安全阀，且有校验合格证书，且泄放口的尺寸必须满足泻压的要求',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0432f9c6-93a5-4583-8595-5edd4f4e02fc','d84aa24c-d5bd-4fd4-bca3-263c625707d6','是否存在超载作业情况?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('04d266b4-11f6-4044-8c94-47224bcd4dec','d2cf710a-10dd-419e-8fbf-9337f6c0cfe4','严禁同一管道同时两处(含)以上抽堵盲板作业',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('051b6e4e-d295-44f7-97c2-cbacf6026faf','5dbd0ce5-e64c-494d-924a-1d8462625cda','是否编制了风险评估结果及隐患治理报告',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('051e89b2-2cf9-457e-88ef-74374fc34548','f33388d0-e584-4b0d-b5d3-9c1cb16c94a4','钢丝绳有断丝、松股、硬弯、锈蚀或有油污附着物',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('057486aa-6688-4749-bfc4-9e07a7fe85e9','e2387152-9b1a-4447-9a25-e227a4f74767','支拆模板是否进行了安全技术交底',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('05e9b4a1-ee0a-47d6-9323-2bed54f51b1c','09b01f67-3d8f-4143-8d14-b67fb9b8c034','废物废废渣及时清理，不得乱丢乱堆',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('061330c5-e907-4313-86f0-4dc1ba9ef140','f0660445-1d00-4105-a1b9-277acc8acb81','拉结是否坚固',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('06b8e206-6d72-411f-8327-0f90dc459882','c8b8638c-0c0d-409c-82a9-30640b83a985','是否有排水设施?排水是否通畅?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('06e6b0d3-721b-4906-9768-4e7d62f221ee','c20dcb76-dd72-4b14-96c6-325ceacc948c','拉设警戒线，设置警示牌，派专人监护',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('07c5219b-0923-40f0-a1df-25457bb49814','189a4cf1-8657-41a2-b7c4-b236c74d5645','未履行验收程序，验收表未经责任人签字确认',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0883a20d-5a86-4d88-b64e-39e5690f2150','e2387152-9b1a-4447-9a25-e227a4f74767','验收单有无量化验收内容',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('08b2dfc1-142a-4bba-84ae-73d0def6835f','14b27bec-7906-4d2b-8bcd-e49169e1a21e','每10米延长是否有扫地杆',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0955b2b1-3a84-402e-b346-809624facffe','dd5e6f9d-dd6e-4fe5-9007-70c5d9ce06b6','是否建立班组长安全生产责任制度',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('09b482db-df38-44c5-9a6e-2565097c98de','13aeb1e9-cacc-47f3-b4c2-73545e5d2ec8','起重钢丝磨损、断丝是否超标?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('09fea9ee-fe61-4f8a-94a1-be75603f1ef2','845979c6-d39f-449a-94d9-fb26506061dd','作业时，现场是否有专人负责监护，做好进出记录；',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0a0badc1-2e59-4017-acd8-5a26cc5e67dc','68da4b77-9adc-4c5d-8f36-8a0fc935dd7a','施工人员是否出现无理取闹，谩骂和侮辱安全管理人员的现象',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0a436a01-3912-4a21-ad65-65d9dfcc5e78','86479986-bdbe-4b54-8b3d-0be6e2288637','模板工程有无施工方案?方案是否经审批',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0a50550d-9eb8-478b-bb84-98373cea9d59','6a42ccb0-1d32-4d7d-b8e1-75878b5dc8f1','是否建立危险品台帐?帐物是否相符?',8) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0a56b146-c398-4744-b11f-de17260898d4','09b01f67-3d8f-4143-8d14-b67fb9b8c034','井、孔口、预留口加盖板或设围栏',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0b46f421-c397-4abb-98e5-ac2509b8fa9f','c20dcb76-dd72-4b14-96c6-325ceacc948c','是否办理作业票',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0b8f4d5b-65b7-4823-a51e-e7b880be947f','7149cfaa-492e-4bde-b0c6-c45022a74ca9','厨房电器是否良好接地',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0c00edb2-88a3-4452-ba19-af9266719b2b','e2387152-9b1a-4447-9a25-e227a4f74767','模板拆除前拆模板申请是否已批准',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0cb2cb6b-3461-440b-a4aa-a39c8a46c1a6','52401d1b-43e6-47ec-8e04-abc81e4e6ca8','施工分包方是否成立了成立应急指挥部，并明确主要职责',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0dcbcebb-ea9c-4670-9551-7f82f5e92599','5dbd0ce5-e64c-494d-924a-1d8462625cda','报告是否经LPEC HSE经理审批',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0e9e5dc2-ce6b-4bbe-a4ef-cb6db53fa83e','7325a7e4-b556-4d8b-adaa-08e01ad9b653','支护设施是否产生局部变形?是否采取措施',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0ebf46af-9c80-4455-958e-16eba4fd9448','78f2f6ec-24a2-4e7f-9b6e-eec942cc30ce','是否定期检查施工单位HSE管理记录及台账',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0f2b71b1-d9e3-49b0-b411-0f1113a78626','85b580d3-2fac-4589-ae7f-aa677cce456a','施工机械进场是否经过验收',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0f40adcc-615d-4bf0-9daf-4ef0f626e8e9','07167f93-7962-4f0b-8c63-6172a3e253a7','模板堆料是否均匀',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0f702f16-0339-499f-a6ed-5ea83e252f02','80734bec-785c-4744-92c2-9146721159f3','设备安全防护栏杆齐全',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('0ff84c13-ee44-4036-a4a9-1d134df2663b','44b0ad52-36c9-4cc9-a8a9-967a2f59a737','司机是否过度疲劳或酒后驾车',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('10354da3-b658-4c4d-9a4b-0de87cc74e9d','7fb552c4-382f-4bdd-a3d9-651c4a4ccc44','扒杆使用前是否经试吊?',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('104b715e-3e5f-45d4-9c6d-2edb85b02cd9','1857a9bc-bd05-46f0-a1ec-07aebf283b19','各种模板存放是否存在不整齐、过高等不符合安全要求的问题',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('10621449-2e20-4001-8af4-758f3263430b','3109335f-7d58-4daf-b642-ab8bbe23305c','大型构件堆放有无稳定措施?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('10f44b02-f46d-4887-8891-0975193e83ba','189a4cf1-8657-41a2-b7c4-b236c74d5645','每天班前班后未进行检查',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1168f418-5473-4558-9f95-89a63a692036','5f36824f-ae8d-4ddd-90b7-c76e4d14b57a','是否易燃、易爆物和垃圾必须清理干净。',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('11ad2127-62db-4464-a111-f2830a8f9874','e299e59f-0174-472a-9025-73f2e754b487','拆除区域内作业人员是否系挂安全带/安全绳',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('11c899c8-7457-4e2f-ba73-251e33591d08','44b0ad52-36c9-4cc9-a8a9-967a2f59a737','是否搭乘无HSE培训合格证或无访客证人员',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('11fc906c-16b6-457a-940e-27b54874c4bc','acf769bc-854f-4e4d-a711-463df386cdbb','是否设立固体废物分类标志，生活垃圾和工业固体废物分开存放，并分别进行标识',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('125bef1b-b333-4fec-b090-dc995c7bd1b3','78f2f6ec-24a2-4e7f-9b6e-eec942cc30ce','项目HSE组织机构及管理体系运行是否经过报审',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('126b3396-ff1d-471d-85aa-7e9ab1b4ddf0','3109335f-7d58-4daf-b642-ab8bbe23305c','楼板堆放是否超过1.6m高度?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('129de7d2-2509-497e-bcc3-56fdd3680f27','e299e59f-0174-472a-9025-73f2e754b487','作业区临边下方8米设置防护栏，警戒线各方向设置”上方施工”标记，专职安全员巡回检查。',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('139d1cd1-4957-49ed-a259-36e7587ce7f2','3109335f-7d58-4daf-b642-ab8bbe23305c','其它物件堆放高度是否符合规定?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1407930c-c505-4dba-b6ed-b2376103cd0c','e87e9a29-8a9a-4e20-9a03-69733f9c001a','生活区不得存放易燃易爆物品',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('143238e0-9ae3-4020-a6cd-4a9918d2e6ab','25046ba3-7f1a-498d-b3fb-5d996a6dcbcd','起重工、电焊工有无安全操作证上岗？',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1490c1ce-1352-4661-8d4b-ddfba688d773','e299e59f-0174-472a-9025-73f2e754b487','作业地点是否有合适的照明/进出便利设施（包括脚手架）',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1541b245-4342-4aa1-a8db-8555a7f38d03','bf9f373e-a65a-4061-ac82-8107fd149bd7','深基础施工采用坑外降水，是否有防止临近建筑物沉降措施',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1580a236-14a8-4b0c-8382-c6138f472d0d','6ffdb168-e839-46b9-8c94-200cd46ca0b6','垂直交叉作业要派专人监护',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('15888c31-6634-4f69-b8c5-498e3c5de223','a6903b17-0743-4e6f-9e8e-6972dadf7e40','在射线装置、设备使用过程中，如果有射线装置、设备的交接是否做好交接记录',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('15af5e7f-309f-4a35-8648-a67db49e1eea','e417e882-ccff-43c4-b0bc-980e3d3d55d2','施工组织设计中有无针对性安全文明住宿的方案',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('161abedb-a9b0-4968-9ae2-ce08b3aaa5d6','365041cb-e8d5-4a9c-a628-6782d667491d','灯具安装高度，照度是否符合要求',8) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('17b100c3-7249-43eb-8a9b-60f937783689','bdbe9fb2-c771-4d49-b015-f82f0f22a3d9','前支架与支撑面不垂直或脚轮受力',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('17e8767f-c71a-4af0-8f31-d9750354ea06','c454ca84-e2e6-4ac4-aff3-2a29270c88ac','在开工前是否必须编制安全技术方案/措施',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('17f653f2-098b-496a-8567-b504220874db','51331fed-663b-4e37-96b2-0a7f09889d7c','防暑降温用品发放情况。能否达到避雷要求。',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1838c572-b7f0-4148-98a1-445bac8f0ec9','749d84af-fe4e-44f1-9ad1-6a36193e3328','室内线路及灯具安装底于2.4m时，是否使用安全电压供电',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('18998cfc-1adc-4a1c-a14c-5a7e922e2646','48838f9b-5f42-4ca2-965a-26db0c78bf87','γ源检测是否设置相应距离的防护范围，做到场内无非工作人员',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('199545b7-7f28-466b-9901-e43b6737db29','222f1d0b-d990-48ec-9a97-9c4cf4e15c33','严禁对准电线、基坑和有人操作的场地；',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('19b8d2b0-1f3a-4ac3-89de-ef668f738b32','57bd144d-ba78-4f1f-8043-13e9810b35af','垃圾有无堆放点',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('19e68eac-d5e1-4279-a7bb-2ae772977de1','b620dcfc-ae18-4d02-b28a-131765f2adad','雪天、冰冻天气应清除雪、霜、冰和采取防滑措施',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1a2bca7a-c5f1-4a9c-8ffa-c7f8ce131c1a','7fb552c4-382f-4bdd-a3d9-651c4a4ccc44','起重机是否已取得准用证?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1a468afc-9bfd-4336-8a51-36e8f9191407','67d32618-1983-4e1c-b2b8-d648c4b88270','是否有安全技术交底',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1ae22999-8d57-41f9-b71f-74edcf930a09','bf154090-d4c6-4eff-90b4-18949bf18259','库内照明是否采用防爆型?电气开关和熔断器是否安',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1b5326ca-19c3-46ea-baf1-0b78f9852e1a','8c9df280-84a6-4292-8cc0-42ef231e55b5','是否做到工完场地清?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1bf27560-53dd-4e9f-b9cf-0492c3c74f72','8c9df280-84a6-4292-8cc0-42ef231e55b5','堆放是否整齐?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1d33783b-6430-49b4-a476-96fb635cfa32','c7ba5d46-d93c-49b8-904c-cd44f86528f7','气瓶外表面是否有机械损伤、变形和严重腐蚀',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1d80e6ad-0457-4c9c-adc6-83c58d365dc6','ab5ac0de-4c65-4fb5-9e05-c990c40c4c96','起重吊装人员有无可靠立足点?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1e24ee10-5a8f-41d0-99a3-1165203705c5','b06783bc-7267-4aaa-b501-9549dcd7e096','起重吊装有无警戒标志?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1e4b1af6-83db-4d29-9da5-fda8a4af7e20','b0d4c8dd-5129-446c-b084-99db610f0f0e','剪刀撑是否沿脚手架高度连续设置或角度是否符合要求',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1e5b88ec-c12b-4b47-8def-8be70c444ee0','356aab0e-c466-4228-97e6-4060e7ba92b4','是否具有Ｘ射线机合格证',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1eb17448-a34e-4f7d-a7f7-662586ede3a8','d73e1da1-c823-4abd-800c-b057bf54d7f5','有无急救措施和急救器材?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1f28b770-ef54-41d8-8533-1f283db8af66','efa25d9a-0ddd-4a72-a92e-54cddc33ca07','是否使用五芯线(电缆)',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1f5671a3-f00e-4422-8a4c-9c63157ee3ad','88e3eede-7ecf-4396-a9ff-7557b5855af0','当塔吊高度超过规定高度时，是否安装附墙装置?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('1fc7da6d-95e9-41f8-add8-7f44a2a12c69','6f53fb3b-4693-4977-a7f5-833e0fc5b542','生活区有无彩钢板活动房',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('200420b2-672d-442e-8059-a8d105000cc3','d84aa24c-d5bd-4fd4-bca3-263c625707d6','作业结束后是否收起吊车支腿',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('20e7b169-89de-4572-8f87-ab8e639f6605','7fb552c4-382f-4bdd-a3d9-651c4a4ccc44','起重机安装后是否经验收?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('21d41784-5d23-4445-8e21-64d03296a5d7','dd3b16b3-8582-4577-ab64-f47cc62a245b','不得在库房内使用明火',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('221f16a3-a3f2-4075-9c71-029ac1104809','0ed3125e-e604-48c1-8e5f-21d5e9535def','是否采用TN-S系统',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2256b02b-4131-49cd-8bea-5192f70a5691','48838f9b-5f42-4ca2-965a-26db0c78bf87','是否有伽马源源库管理，记录台账，出入库登记，派专人看管责任到人，做好防火、防盗等工作；',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('22d7c48d-7819-49f9-9c33-f6e6f7e78df3','ab54ef75-9e0d-4d02-9dbd-a75da631cad5','漏电保护装置参数是否匹配? 保护器是否有效',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('23987919-3827-4ef6-8b29-b21f5896cb7a','3dfeba3b-3306-4c3b-801c-bc8ebfc37a58','危险品出库时有无领料单?是否进行核验?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('24029143-4bc0-40d6-bc7f-c470100478f4','f6aaca10-0e64-4d2f-bebb-c28e2db1155a','现场垃圾、废料处理',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('246f0fb9-1771-435d-b5e1-44e0ea382403','85868409-021f-4292-862a-37ddb2377026','严禁同一管道同时两处(含)以上抽堵盲板作业',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('268e85e6-3ac4-4256-8e13-2a0c998c52d0','f823abfb-8218-43cc-a160-bf0791b6f149','是否存在厂区内斗殴和赌博行为',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('26d7ec9a-371d-4cf5-bdd5-56e0531a5930','c8b8638c-0c0d-409c-82a9-30640b83a985','工地地面是否已做硬化处理?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2780b6d8-ee0a-445f-95d8-75272e9834a2','57a55f3e-8913-4250-b9ae-732dfcf1905b','门式架、脚手架等是否有防雷保护装置，',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('286fd894-f345-4300-ba76-50ee81ecf552','484c1208-524f-40ce-ba77-ac751e97879e','是否符合安全规定要求',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('287f2bfd-f8c4-4a10-a8cb-cf2b84644065','6d0a9f00-7aed-4386-bafe-f2e7af0f24b4','是否根据造成危害或需要某种防护功能，选用或禁止选用某种个人防护用品',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('28bde7e7-384b-4d1c-8b39-01785d278d4f','996c7f5d-2cbd-4cff-b386-7c5dd0be12d0','施工现场进出口是否有大门?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2a44ae3f-4d1b-47e0-acfc-39159299d6a5','996c7f5d-2cbd-4cff-b386-7c5dd0be12d0','进入施工现场人员是否佩戴工作卡?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2a678341-49a1-480e-8f52-83075b89762d','ab54ef75-9e0d-4d02-9dbd-a75da631cad5','安装位置是否恰当?操作是否方便',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2b66aa4d-5efb-41ce-809e-1d64b255d152','dd5e6f9d-dd6e-4fe5-9007-70c5d9ce06b6','是否做到班组每周一早上利用1个小时左右的时间开展安全活动，每月安全活动时间不得少于4小时',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2b8c35f1-e638-4f17-8e09-3e630f48b403','5dbd0ce5-e64c-494d-924a-1d8462625cda','施工分包方是否对隐患治理结果上报LPEC项目部考核验收',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2bfca697-8376-4bb8-b619-984de355ddbb','5ab6082e-f5d4-42d0-83e4-3cd1cdcd9b5c','其他',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2c1066cf-5278-437b-8075-2e9a1120c946','6d0a9f00-7aed-4386-bafe-f2e7af0f24b4','个人防护服、安全帽、护目镜、护趾鞋是否存在混（借）用现象',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2e0529ee-4910-4aad-8179-990fd9c0b022','6a42ccb0-1d32-4d7d-b8e1-75878b5dc8f1','标识是否清晰、准确?',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2e7eeb77-aa70-4aa7-96c0-c31229ef0938','ab5ac0de-4c65-4fb5-9e05-c990c40c4c96','作业平台临边防护是否符合规定?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2f12927a-9001-4530-8551-dcc8a0fe1d93','2e0177fe-678e-4fa4-9878-e18f28242a9b','脚手板材质是否符合要求',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('2ff71ee8-30e3-441e-8503-65154d3eabc8','f3e52048-4d3f-475e-8848-5ec3948a78fb','通道设置是否符合要求',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('301c83c6-02f4-49e4-8856-b98119190f30','73184d82-a823-40fc-942c-fe91c8482ab9','档案是否有专人管理?管理是否有序?文件资料是否齐全',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('303c4806-9f17-4f19-a7a7-be2a413cd59a','acf769bc-854f-4e4d-a711-463df386cdbb','是否在紧急场所设置指令标志，如紧急出口方向、疏散通道方向等',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('307bdfa0-2c52-451b-a212-da8fb1ab2202','365041cb-e8d5-4a9c-a628-6782d667491d','供电系统是否采用1:1的隔离变压器',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('325aa48b-e90f-43c6-84c0-ca3377257465','3dfeba3b-3306-4c3b-801c-bc8ebfc37a58','有无入库单?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('327c1cb5-70e5-4f1f-a898-4c778b0daf17','b050a452-78a0-44a9-9bac-b9f5c6d213cd','操作人员资质是否进行报验',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3340764f-f0d4-4f5b-819c-acb0e58b9322','0ed3125e-e604-48c1-8e5f-21d5e9535def','保护零线与工作零线是否混接',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('33477f45-0eee-4fd2-9b5a-dd798e7a93a4','3dfeba3b-3306-4c3b-801c-bc8ebfc37a58','进入危险品仓库区域的人员、机动车辆、作业车辆',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('335a30d3-ab06-45a6-ac38-7a1e9f32db2f','6a42ccb0-1d32-4d7d-b8e1-75878b5dc8f1','墙距宽度是否符合规定?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('338734d5-cb2b-4594-9b44-5b5cb52b7c1e','25046ba3-7f1a-498d-b3fb-5d996a6dcbcd','司机是否持证上岗?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('33977f74-c3fb-4cec-8a4d-02a2071361cf','b6bac4a0-a5d5-438a-9a8b-8eaa2218dcb2','光线不足时是否设置足够照明',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('33ba44f5-a37f-4d49-ab92-15434bdefb16','efa25d9a-0ddd-4a72-a92e-54cddc33ca07','架空线路是否符合要求',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('34ba17c4-46f9-4cde-b1d5-de27a1044785','356aab0e-c466-4228-97e6-4060e7ba92b4','是否申请办理射线作业许可证，并经施工分包方HSE管理部门和主管领导批准后，方可进行射线作业',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3534d3b2-203c-4ec8-a0cd-bbaf7fc0f16e','5dbd0ce5-e64c-494d-924a-1d8462625cda','是否设有风险评估组织机构并有效运行',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3542b804-c97c-4355-999e-20537020fc98','b25021e1-de89-4297-bbf7-b74697ac1e9a','是否必须悬挂安全操作规程。',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('355b55ba-34a7-46ea-9303-4028bc30e761','a6903b17-0743-4e6f-9e8e-6972dadf7e40','作业时，现场是否有两名及以上射线作业人员才能进行射线作业；',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3590fc76-7565-41cc-b3a7-b094cee5e1dc','85868409-021f-4292-862a-37ddb2377026','工作照明使用防爆灯具',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('35c44dfd-c342-4590-bd39-f1d4a4219249','6a42ccb0-1d32-4d7d-b8e1-75878b5dc8f1','垛距限制是否符合规定??',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3665ed4b-8e25-43e6-b01d-57d277e9843b','acf769bc-854f-4e4d-a711-463df386cdbb','施工分包方是否在其施工区域内设置相关警示标志，HSE警示等',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('36d63187-0b20-4bf2-9c89-73f23b43ca78','4ee8f944-5b80-45ae-8e60-3c48ef2d26e9','是否有无证人员使用氧气、乙炔气瓶作业',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('377b500f-3cb4-4d4a-8b4f-a0fc9c2ed906','57a55f3e-8913-4250-b9ae-732dfcf1905b','电气设备、线路的绝缘是否达到电气',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('377e7d43-b5c2-4558-b4db-ed19d66e6613','e90279e7-e307-4075-9fd4-42cd585b0aeb','是否设置安全警示标志',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('37d4c5c8-bdd7-4581-9f5d-23aef124a6d7','4733b9e2-8cf7-4caf-829a-a07ec1eab5f5','立杆与大横杆交点处是否按规定设置小横杆',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3866764c-4752-4871-a544-a70944c7e34e','bf154090-d4c6-4eff-90b4-18949bf18259','仓库是否配备足够的消防设施、适宜的消防器材?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3926fd67-fb2b-479b-b508-153bb7f44769','d2cf710a-10dd-419e-8fbf-9337f6c0cfe4','禁止用铁器敲打扳手、管线、法兰等',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('393b957a-97a7-4ff4-9148-724c7deece41','ab54ef75-9e0d-4d02-9dbd-a75da631cad5','是否符合“三级配电两级保护”要求',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('397fdbfe-d4ff-43f6-873d-0e350ee564c6','cf0bd845-0b30-4a42-b255-1a6c8a70900a','作业前是否由技术人员向受限空间作业人员进行安全技术交底，并有相关施工人员进行签字',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3a6acf02-3a3d-4acc-8313-03a3cb828398','ab54ef75-9e0d-4d02-9dbd-a75da631cad5','是否做到“一机、一闸、一漏、一箱”',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3b7a1c5c-db9f-4a62-b072-5807b7ad0619','e6b2580e-db2b-4bb5-a22c-353ec169f1e9','值班人员落实情况',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3b836e4b-be49-48f1-b8a2-82024180c1d9','48838f9b-5f42-4ca2-965a-26db0c78bf87','γ源运输是否符合规定，安全人员或射线作业人员押运，同时穿戴好防护用品',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3b8d99dc-c923-4fb1-ac49-5d45c9840af0','bdbe9fb2-c771-4d49-b015-f82f0f22a3d9','悬挂机构前支架支撑在建筑物女儿墙上或挑檐边缘',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3c7ab826-237f-4f90-a87c-a1de6d06ed6b','c2f10e79-a2ec-46cd-a451-c74a5139beb1','卸料平台支撑系统不得与脚手架连结',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3d0a40cb-293d-4581-938d-c84c1096010d','1975bb25-94e9-4fd5-a74f-31fb39890b6d','防煤气中毒安全措施落实情况。',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3d0ddf8c-6489-46e9-a641-03b77ac96c37','7325a7e4-b556-4d8b-adaa-08e01ad9b653','特殊支护的作法是否符合设计方案',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3dcb9bb0-7b2c-440b-9aea-f7eef9c1ed9b','1975bb25-94e9-4fd5-a74f-31fb39890b6d','防火灾安全措施落实情况。',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3ea9d2cc-0f43-4890-b678-d82d630a1097','f33388d0-e584-4b0d-b5d3-9c1cb16c94a4','电焊作业时未对钢丝绳采取保护措施',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3f330521-3ecd-4f50-ac43-b0375f733ebd','d94747b0-d340-4755-89c5-e7a90588ed4b','其它',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('3f3618e8-ca73-4d69-b17e-5f3c37f7e5d7','79727f49-9c90-42fa-9547-9f0445972810','闸具、熔断器参数与设备容量是否匹配？安装是否符合要求',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('40d3dfb1-7461-4a3c-8dc1-09c382194a97','6ffdb168-e839-46b9-8c94-200cd46ca0b6','井、孔口、临空面边缘、不准休息和停留',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('41bd42df-c0ed-46c3-9c92-9e502f97b512','612a5624-6126-475a-8c9c-c036a4a0da95','起重机作业面地耐力是否符合说明书要求?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('424c79d7-54e1-4796-b78e-c74114609fc7','7e9215ee-a40d-49ef-abb2-643131cbdbda','机械设备施工与槽边距离是否符合要求?当不符合要求时，是否有相应措施？措施是否有效?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('42bf4afd-44d4-4ca5-9153-24e3376c086d','57a55f3e-8913-4250-b9ae-732dfcf1905b','高大建筑物是否有防雷保护装置，能否达到避雷要求。',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('43f7f41a-0416-4559-aaa8-8045c46d7105','44b0ad52-36c9-4cc9-a8a9-967a2f59a737','是否有施工现场通行证',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('445cc02e-4236-444e-b494-be378ce3643e','dd3b16b3-8582-4577-ab64-f47cc62a245b','库存物品应分类、分垛存储',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4476b63c-5ef9-44ee-984e-fb62c1afe6ee','897ea9a2-29c3-4254-8e76-424759300e9f','作业前,勘察地形，设置好警戒线、警戒灯，警戒线外射线瞬时剂量率小于2微戈瑞/小时',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('44d02c5d-6de7-4424-bed7-23d29e6064bf','c9b216ab-e5cf-4bdc-bb8e-164a003fbdca','项目部有无对安全用电警示标示',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('44d7df48-3043-45b5-994e-2176628dd8c0','bdbe9fb2-c771-4d49-b015-f82f0f22a3d9','上支架未固定在前支架调节杆与悬挑梁连接的节点处',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('455115c0-7d06-4c77-95cb-a2aaac398394','52401d1b-43e6-47ec-8e04-abc81e4e6ca8','施工分包方是否对事故进行调查分析，并按规定处理善后事宜',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('45aca3c2-d86a-4ff2-aa96-d6a8810c862a','189a4cf1-8657-41a2-b7c4-b236c74d5645','脚手架搭设前是否交底',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('461cf988-17ef-49f6-9d2d-70544f7519ef','5ab6082e-f5d4-42d0-83e4-3cd1cdcd9b5c','其它',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('46238611-aa11-4093-bf06-f4bc81cb02fd','f0660445-1d00-4105-a1b9-277acc8acb81','脚手架高度在7m以上，架体与建筑结构拉结是否符合规定要求',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('46273dfe-ec69-4c78-a57f-3f37523745be','2d09b36d-38da-4704-b422-a027ab146bfb','是否属于深基坑开挖，并进行专家论证',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('466b5c9e-3d0e-4c26-842e-ddf343ea635c','0da8615d-7683-4766-ac90-600cebe156cb','进行安全技术交底',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4696ff08-226b-4099-91a3-ed3e919bbf42','e90279e7-e307-4075-9fd4-42cd585b0aeb','是否按规定设置防护装置',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('470b893e-ef84-47a4-afc9-db6524f2cb99','8c9df280-84a6-4292-8cc0-42ef231e55b5','建筑垃圾堆放是否整齐?是否标出名称、品种?',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4722989f-b9a1-4b21-b3f8-6be4fa959a24','85b580d3-2fac-4589-ae7f-aa677cce456a','是否按规定程序挖土?是否超挖',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4780e567-a701-4824-8a19-758a8d924eb2','c01870ef-3b85-476d-94f3-277ac8dd46d4','人员上下有无专用通道',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('479c8f63-d8aa-4d94-bee7-b2d96b12d076','e94c80fd-0fed-4f77-a839-1a009c93cd37','安全应急措施',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('47a4cb00-e914-406a-9f14-6ef0ea4938d3','6ffdb168-e839-46b9-8c94-200cd46ca0b6','无高血压、心脏病精神病等不适合于高处作也的病症',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('47e41c37-e22e-4079-ae5f-d74d80da2d4d','f823abfb-8218-43cc-a160-bf0791b6f149','施工分包方项目部是否建立健全施工现场的公共安全与治安保卫组织机构，落实各级安全保卫责任制',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('47f51dd8-baf1-4edb-8c8c-d02b50412f90','c454ca84-e2e6-4ac4-aff3-2a29270c88ac','是否必须编制寒冷季节施工作业安全技术方案/措施；（寒冷区域）',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4814422c-79fe-43c2-ba75-51ef1f763681','dd5e6f9d-dd6e-4fe5-9007-70c5d9ce06b6','是否做到班组安全活动情况和班前安全讲话由班组长指派一名职工负责记录，记录要与班组长的讲话同步进行',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('48c6e73c-9920-41e5-a302-e20ab7c45399','4ee8f944-5b80-45ae-8e60-3c48ef2d26e9','氧气、乙炔气瓶的瓶体、瓶咀是否有油脂',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('491c865a-e083-4cad-b03f-9e77b0ec37ed','105b10cc-f4a6-482a-96c4-161ceeed80c4','围档材料是否坚固、稳定、整洁?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4952f544-5ece-4d9e-bbaa-c1d0fb81ade9','c454ca84-e2e6-4ac4-aff3-2a29270c88ac','是否对危险性较大的分部分项工程进行专家论证',11) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('49c902f5-2781-4fe7-b37e-583c9f026a32','b2e48682-2117-445c-9c18-eea717c1d8ef','是否对特种作业人员进行了培训',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4a1365dc-35f0-4da7-be2e-2992d1ad88ce','09b01f67-3d8f-4143-8d14-b67fb9b8c034','定期检查排架损伤、腐朽、松动清况，及时维护',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4ba43d63-00cb-412d-a8fb-9e84aaf81af8','dccda995-156c-4c35-aa6d-b23f69561091','安全距离是否符合规定要求',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4bf4c267-a519-4be2-b70a-3c7112a65a4d','105b10cc-f4a6-482a-96c4-161ceeed80c4','围档是否沿工地四周连续设置?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4c15ea11-b9f8-4250-9dbc-12b05f9aec2a','bf154090-d4c6-4eff-90b4-18949bf18259','仓库是否有避雷装置?避雷装置是否有效?',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4c4829c5-35d9-4d72-b67a-f0fc53d14eb7','14b27bec-7906-4d2b-8bcd-e49169e1a21e','每10米延长立杆是否有底座、垫木',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4c644b23-b595-4694-a1e4-2d61df9509fc','c01870ef-3b85-476d-94f3-277ac8dd46d4','设置的通道是否符合要求',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4cbabcd3-28b6-4fa7-8734-6a087240b2ba','efa25d9a-0ddd-4a72-a92e-54cddc33ca07','线路过道有无保护',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4cd865b0-f58f-4b53-9bce-ec89800d47db','c8b8638c-0c0d-409c-82a9-30640b83a985','温暖季节是否有绿化布置?',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4df7044e-21ef-421e-a20a-53dad5dde0eb','cf0bd845-0b30-4a42-b255-1a6c8a70900a','进入设备、装置、容器、坑道、井下前是否进行有害物质毒性、可燃性等监测分析',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4e0d5359-bd50-4686-aeb9-12b51bda2c24','f823abfb-8218-43cc-a160-bf0791b6f149','是否携带、使用武器、管制刀具或用其它物体作为武器',8) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4e1243bf-4c01-421b-8051-cf7790257903','44b0ad52-36c9-4cc9-a8a9-967a2f59a737','司机是否有驾驶证、行车证',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4f8457e9-f15c-4ae6-aa62-40f9838132a7','c454ca84-e2e6-4ac4-aff3-2a29270c88ac','是否编制起重、运输作业安全技术方案/措施',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4f8d1e90-38a1-4ca2-a9d2-963cb85f35fd','c1eaa17b-90d0-4424-8990-5d15b806a047','使用电褥子接线不规范',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('4fd0bc1b-8873-4266-890f-0f2400f15c65','365041cb-e8d5-4a9c-a628-6782d667491d','线路敷设暗敷与彩钢板内',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('50380a9b-e9dd-4567-855a-4c880d08093d','356aab0e-c466-4228-97e6-4060e7ba92b4','是否做好人员入场培训',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('50385c41-7a7d-41dd-805c-2bb96e21f697','ab54ef75-9e0d-4d02-9dbd-a75da631cad5','闸具是否符合要求?有无损坏',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('50396c1f-0fb2-4449-97b2-0da0af6dc4c0','b620dcfc-ae18-4d02-b28a-131765f2adad','六级以上大风暴雨浓雾等恶劣天气，停止作业',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('503cf2ac-0eb6-492d-899e-3f386b1c206f','d64c102c-49e9-424f-a65a-844639a598a7','施工层脚手架内立杆与建筑物之间是否进行封闭',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5081825d-38b6-4fcc-88c0-73288f61593f','09b01f67-3d8f-4143-8d14-b67fb9b8c034','平台脚手板铺满钉牢、临空面有护身栏杆，不准有探头板',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('51acf77e-1a46-4cd9-90a4-3661c8c16297','54fbf80c-0437-4b3d-8e45-01a94013e103','木杆直径、材质是否符合要求',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('51c71a84-bd6f-472e-8ed3-5aed0f89679f','acf769bc-854f-4e4d-a711-463df386cdbb','在从事危险性高的作业时，是否进行安全警示',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('524122cc-c6a2-4f93-926a-07984b442468','c454ca84-e2e6-4ac4-aff3-2a29270c88ac','是否编制临时用电安全技术方案',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('524cb49c-115b-4e31-825a-ac64a8e6c490','85868409-021f-4292-862a-37ddb2377026','有应急通道（照明等）',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('52fbb222-d39c-40e4-8a57-fd30593626ad','88e3eede-7ecf-4396-a9ff-7557b5855af0','有无力矩限制器?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('530b35d6-7197-458e-ae0f-d6b3126094c5','4733b9e2-8cf7-4caf-829a-a07ec1eab5f5','单排架子小横杆插入墙体是否大于24cm',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('53138885-cdb2-4aad-95dc-d87d919298a8','48838f9b-5f42-4ca2-965a-26db0c78bf87','γ源使用人员是否有辐射检测器',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('53b8c21f-a760-4d4f-a011-0f63df1ddcc3','0a61cbd4-236d-4b9a-bb52-f72736c0f8fb','焊割配备消防器材焊割部位与氧气瓶、乙炔瓶、乙炔发生器以及各种易燃、可燃材料必须有效隔离',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('53d60bd2-66dc-4d92-bac2-55f0a7dcd2ff','f33388d0-e584-4b0d-b5d3-9c1cb16c94a4','安全钢丝绳不悬垂',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('54538995-1134-41d1-a75c-beb19f1f677c','78f2f6ec-24a2-4e7f-9b6e-eec942cc30ce','是否建立健全了项目HSE管理体系',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('55c7cd29-b6c5-495c-a81d-1c921bc07e94','e90279e7-e307-4075-9fd4-42cd585b0aeb','操作人员是否持有劳动部门考核后签发的安全操作证；',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('56360fe3-e613-4f60-9f7d-bd265a6ed7eb','6a42ccb0-1d32-4d7d-b8e1-75878b5dc8f1','是否定期检查危险品贮存情况?发现问题是否及时进行处理?',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('569c8db6-8d4f-4aa2-9355-75b29421913e','efa25d9a-0ddd-4a72-a92e-54cddc33ca07','电缆架设或埋设是否符合要求',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('56d59fe7-e05b-45ee-bc4e-4579b297bcbc','51331fed-663b-4e37-96b2-0a7f09889d7c','防暑降温设施落实情况。能否达到避雷要求。',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('56eff197-cd76-4e83-8404-7c67aa004ebb','48838f9b-5f42-4ca2-965a-26db0c78bf87','γ源入场在运输前是否按照国家规定向当地卫生防疫部门办理准运手续',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('57426021-11cc-4ce5-9c88-6c033b5df953','365041cb-e8d5-4a9c-a628-6782d667491d','开关、插座高度是否为1.3米',9) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('575462e3-6dd7-479e-80e0-49fc6e5a4a21','bdbe9fb2-c771-4d49-b015-f82f0f22a3d9','配重块未固定或重量不符合设计规定',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('59cc59e0-d2fa-4d73-bee7-e342f9b9a63a','4ee8f944-5b80-45ae-8e60-3c48ef2d26e9','气管是否老化，压力表是否正常',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('59e2ef41-685a-4e23-89dd-7a6ab7911d88','210faabe-1cbe-435b-b891-b5dd40a3bf9a','是否按规定进行基坑支护变形监测',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5a39b7fe-053d-4077-b9d1-494f1336db01','52401d1b-43e6-47ec-8e04-abc81e4e6ca8','应急预案内容是否缺项',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5a541a57-4e70-4364-8bb1-b67e1f3496f9','4ee8f944-5b80-45ae-8e60-3c48ef2d26e9','瓶内气体不得用尽，是否留有不小于0.05MPa的剩余压力；',10) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5b07f1c1-4223-44c1-9de6-af64590b55b2','acf769bc-854f-4e4d-a711-463df386cdbb','施工分包方是否在国家“安全生产月等期间对员工进行HSE方面的宣传',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5b1a5cab-0f41-409a-86fe-7d982a7f9d04','80734bec-785c-4744-92c2-9146721159f3','现场安全临边洞口是否防护',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5b363179-eb72-4ae7-94c4-a4efd5d06d3f','ab54ef75-9e0d-4d02-9dbd-a75da631cad5','电箱内有无隔离开关',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5b4455a2-d7ab-4ba8-a393-56f03e26f168','365041cb-e8d5-4a9c-a628-6782d667491d','导线截面积是否进行负荷计算留有余地',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5bd7a7cf-3f4d-4b2d-b85b-e62ae3edad6e','b6bac4a0-a5d5-438a-9a8b-8eaa2218dcb2','作业面孔洞及临边有无防护措施',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5c48286b-a23f-4d9a-9b0f-d2b73d098bdb','e90279e7-e307-4075-9fd4-42cd585b0aeb','特种设备是否经地、市劳动部门检验合格；',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5cd3d86d-ea2f-494c-95ee-f950c352c982','14b27bec-7906-4d2b-8bcd-e49169e1a21e','每10米延长是否有排水措施',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5d7115b5-7376-461d-82d4-c4c3971d8024','15243898-2109-4ba0-a3e7-bb9569b9e3c4','吊篮内作业人员未将安全带用安全锁扣挂置在独立设置的专用安全绳上',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5da77270-dced-4d3b-a219-bed6cec2e4a2','f823abfb-8218-43cc-a160-bf0791b6f149','是否存在厂区内饮酒和吸毒行为',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5e208321-b70a-404d-94d4-f1fb74787fa1','0ed3125e-e604-48c1-8e5f-21d5e9535def','工作接地与重复接地是否符合规定要求',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5e909a67-6b35-4d7d-a041-acf87b321caf','612a5624-6126-475a-8c9c-c036a4a0da95','地面铺垫措施是否达到要求?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5ebfc5d9-8da7-4ee4-833c-0ae326bdfbbc','f716ddb1-3128-4608-b03e-d25811c8002a','在具有酸、碱等腐蚀物质或化学烧伤危险的场所是否设冲洗设备',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5f57a3f2-f88e-4bd2-8f58-603ea0c838fb','c2f10e79-a2ec-46cd-a451-c74a5139beb1','卸料平台是否经设计计算',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5f59f8bd-8fdd-4a90-bbd1-4e71b1fd453d','0effae99-5429-4b76-8c52-c2138fa8ad66','未安装防坠安全锁或安全锁失灵',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5f885d07-5196-4fea-9185-bc29b8d83f77','845979c6-d39f-449a-94d9-fb26506061dd','多工种混合交叉作业，是否充分考虑各工种间的相互影响及其潜在的危险。',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('5f892647-33a4-45d4-a03e-f1e6d79f8863','c454ca84-e2e6-4ac4-aff3-2a29270c88ac','是否必须编制射线作业安全技术方案/措施',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('60996980-9a26-4f36-bffb-c5db2f7255da','b2e48682-2117-445c-9c18-eea717c1d8ef','全体员工是否参加了总承包方组织的二级HSE培训',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('60d48cd0-f66f-4381-8bef-4f3dfddaf76f','d458f341-8d70-4a7c-ba22-93c6dfba1ba7','是否在施工作业前办理安全作业许可证',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('618aaf97-305e-442d-923d-55f5f2972bd5','85b580d3-2fac-4589-ae7f-aa677cce456a','挖土机作业位置是否牢固、安全',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('61dd0501-24f9-48d8-bef3-aed890cf5329','1a47c5fd-87a4-40ca-9ac8-8a6413f5cdd1','运输时禁止氧气、乙炔气瓶混运',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6218aa78-c7a0-45c9-bd95-517a1fcd7d70','ba1bc0fc-f118-4f2c-b148-68adf474b7c4','模板拆除前有无混凝土强度报告',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6268009d-893d-43a1-a48c-f010b022a259','f823abfb-8218-43cc-a160-bf0791b6f149','进行工作时是否按规定着装，穿符合工作要求的劳保服装',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('62eec6c3-e386-43b2-943e-2a85ce5c4277','cf0bd845-0b30-4a42-b255-1a6c8a70900a','是否在办理除受限空间作业票外的相关作业票如起重、动火、射线、动土等',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('63118ffa-df08-4f73-91a5-106cfa01ba81','0effae99-5429-4b76-8c52-c2138fa8ad66','未挂设安全带专用安全绳、锁扣或安全绳未固定吊篮未安装上限位装置或上限位装置失灵',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('631847bc-17e0-42fc-98c9-2482f41d43e6','54fbf80c-0437-4b3d-8e45-01a94013e103','钢管是否弯曲、锈蚀严重',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('633f6eb0-7fea-4724-9f6d-6d67765ff236','e3e137ae-67fa-41fe-acc5-bdae3a2bc6d0','在模板上运输混凝土有无走道垫板',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6415bdc8-a1ce-4793-b802-ee07db049927','6ffdb168-e839-46b9-8c94-200cd46ca0b6','不准沿绳、立杆攀爬上下',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('648b66d2-8990-42e1-9294-f5f3c6a65530','bec226c6-94d9-48ad-bfe0-ecf870eab252','标牌是否规范、整齐？',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6514ece8-8e86-4f9e-9147-695c1bf43eaa','7e9215ee-a40d-49ef-abb2-643131cbdbda','积土、料具堆放距槽边距离是否符合设计规定',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('652b7254-8f4a-400e-b6cd-ab128b6580ee','d7397073-d676-4e83-9b7f-42ac2c296964','有无安全操作(作业)规定?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('65a2f66a-8ebd-441b-85fc-f9e0df70fdee','3dfeba3b-3306-4c3b-801c-bc8ebfc37a58','有无出库单?',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('66184f2d-4c7b-4d0d-8af2-4b1e974e4a7e','c7ba5d46-d93c-49b8-904c-cd44f86528f7','气瓶的漆色、字样、环色是否符合有关规定',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('66af1a18-6d92-4e3c-9b16-6ec7f75bf464','7466bf20-11c8-4af7-a1ae-7e3b781e0e0e','吊篮平台周边的防护栏杆或挡脚板的设置不符合规范要求',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('66efbdac-b693-4717-b60e-3c2844962048','5f36824f-ae8d-4ddd-90b7-c76e4d14b57a','清理易燃、易爆物和垃圾',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('675a9235-8721-4346-a626-862acebd95da','15243898-2109-4ba0-a3e7-bb9569b9e3c4','吊篮内作业人员数量超过2人',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('681195f0-ad4c-4dad-9321-439056809070','b6b1d0cc-5482-4334-a371-414353c0148a','起重设备、垂直运输设备、架设工程等',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('68126764-9686-4797-97ec-b82cc4c2d69f','acf769bc-854f-4e4d-a711-463df386cdbb','施工分包方应是否采取各种方式进行HSE方面的宣传',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6849bc17-8201-450b-b7dc-8b63936853f4','2e0177fe-678e-4fa4-9878-e18f28242a9b','是否有探头板',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6862fb08-0c6e-4003-9d7a-fb6d55883774','c9b216ab-e5cf-4bdc-bb8e-164a003fbdca','项目部有无对用电违规巡查、处理记录',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('68cebf09-08df-4603-9dbc-18bf3699a7f5','666353e6-62f4-4e5e-ba3b-9faa6e9337da','仓库管理人员是否经培训，经考核合格后持证上岗？',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('699a02c3-bed0-4c04-b62f-3a39b4b29668','e3e137ae-67fa-41fe-acc5-bdae3a2bc6d0','走道垫板是否稳固',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6ba4f38b-75fa-436f-a3b7-21ec7e5dfb53','b06783bc-7267-4aaa-b501-9549dcd7e096','是否设专人警戒?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6bdd0ca3-1a6d-4b72-ae90-ba6e5a7dd47b','f823abfb-8218-43cc-a160-bf0791b6f149','是否进入现场的所有人员佩戴业主统一制作的现场出入证，是否经过业主的一级HSE教育',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6cca1a9d-b111-437e-9e20-0cacf20d6a3b','b2e48682-2117-445c-9c18-eea717c1d8ef','全体员工是否参加了业主组织的一级HSE培训',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6d14587c-3e17-4b31-9152-b8741bc3613a','897ea9a2-29c3-4254-8e76-424759300e9f','作业前，是否划定好作业区间，确定作业时间，确保周围无关人员安全撤离。',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6d9630fd-059b-46f1-b0f7-916ebc9c16d7','3dfeba3b-3306-4c3b-801c-bc8ebfc37a58','是否采取防火措施？',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6e0bd7fb-e57a-4f73-be9d-7ae65453769f','e4f2b15f-10c0-4f0d-9326-0f551213abdf','试压设备与管线是否安装缓冲罐',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6e6a9464-fd83-4040-bca2-737ce5f67e4d','78f2f6ec-24a2-4e7f-9b6e-eec942cc30ce','是否建立健全了项目HSE组织机构',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('6fcdc6ba-8b1a-4591-8df0-188ce555a14a','ed1b5241-4e32-4862-8b3e-a7f367c9e93b','临边及其它防护是否符合要求',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('707bad72-7072-4f88-b4ad-92be5f8977a6','c1eaa17b-90d0-4424-8990-5d15b806a047','地面乱接乱布电线',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('70edc996-67db-472e-b363-59972b15fa10','bf154090-d4c6-4eff-90b4-18949bf18259','消防通道是否通畅?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('719954b1-140d-4ed3-ab7c-e1fc482d8fb6','b620dcfc-ae18-4d02-b28a-131765f2adad','带电体附近作业应保持规定的安全距离或采取防护隔离措施',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('71ac1488-9b64-47a7-93c6-98c0fbfb663e','210faabe-1cbe-435b-b891-b5dd40a3bf9a','是否按规定对毗邻建筑物和重要管线和道路进行沉降观察',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('71d35589-d874-47ab-9141-00f0640f808e','7d2095fd-47e4-4ba0-8af6-aa88acbb0b99','施工分包方是否所有归档资料均有唯一的编号且编号连续',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('71dc5d12-db8b-4b57-a20b-866b3bbc8b2b','845979c6-d39f-449a-94d9-fb26506061dd','工作中，各工种是否严格遵守本工种的安全操作规程；',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('71f76661-7c90-4cc2-b805-d4e4f7d900e4','0da8615d-7683-4766-ac90-600cebe156cb','现场的防火器材',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('72039bd3-68a9-4563-b0f4-18bf70467015','e417e882-ccff-43c4-b0bc-980e3d3d55d2','有无安全用电、防火、文明用语标示牌',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('721128fc-0297-4053-a837-62d817958511','356aab0e-c466-4228-97e6-4060e7ba92b4','是否具有射线装置工作许可证',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7242fd8e-56a3-4271-b8ce-272d9e7daba0','f716ddb1-3128-4608-b03e-d25811c8002a','是否教育职工执行操作规程，普及防尘防毒知识，正确使用劳动保护用品和防尘防毒器材',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('72f312ba-2d1f-4202-aa54-7031a55735aa','2d09b36d-38da-4704-b422-a027ab146bfb','基坑超过5m有无专项支护设计',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('740871e8-29f0-4073-a18f-5ded2e4d91c5','bf9f373e-a65a-4061-ac82-8107fd149bd7','基坑施工是否设置有效排水措施',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('741a916c-b010-4f05-9d3a-f2f67527ab9d','c7ba5d46-d93c-49b8-904c-cd44f86528f7','气瓶操作使用记录是否齐全、完整',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('74c3f5a7-66cd-4b15-af71-5df28ab6204e','e417e882-ccff-43c4-b0bc-980e3d3d55d2','有无项目安全员对生活区用电安装检查记录',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('74d317eb-e9c9-45f9-890d-5da02380c036','44b0ad52-36c9-4cc9-a8a9-967a2f59a737','是否有安全防护措施',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('751ecb50-1e30-4e3a-8b92-316075c3fb7f','a7a51b31-f27d-4b14-b042-c03ee57f4048','支撑模板的立柱材料是否符合要求',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('759c5331-eb3f-4d82-81b0-fbd8122d3752','356aab0e-c466-4228-97e6-4060e7ba92b4','是否具有射线装置使用登记证',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('76d0338f-82a5-434e-96af-97da6df00742','2d09b36d-38da-4704-b422-a027ab146bfb','基础施工有无支护方案',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('77918dd4-2a49-41d5-8a92-43d747d5f0ec','c454ca84-e2e6-4ac4-aff3-2a29270c88ac','是否符合编写、审查和批准程序',8) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('78624485-311a-4399-a274-8a066cc29f4b','14b27bec-7906-4d2b-8bcd-e49169e1a21e','每10米延长立杆基础是否平整坚实?是否符合方案设计要求',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7874a57f-801f-42b8-9dd6-9a5e6e10b74a','4ee8f944-5b80-45ae-8e60-3c48ef2d26e9','氧气、乙炔气瓶使用现场的间距是否大于5米',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7888b354-6081-4084-8ce4-dafc3643da7b','4ded0823-2756-4dbd-8d81-7ef1770b1245','悬挂合格的安全网或搭设其它防护设施',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('78a90770-0ecf-4fbd-bd79-e43acf07f4b1','ab5ac0de-4c65-4fb5-9e05-c990c40c4c96','作业平台脚手板是否满铺?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('78f589ba-6712-485e-9fc3-20c3731d1cae','67d32618-1983-4e1c-b2b8-d648c4b88270','方案和专项安全措施',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('78fc3def-1369-456f-9ae5-0c16178550d9','e4f2b15f-10c0-4f0d-9326-0f551213abdf','试压部分与非试压部分界面选用规格，材质等级相一致的盲板隔离，不得采用直接用断阀门隔离',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7918032d-461d-4ae7-b1b8-ef9251fe2eed','bec226c6-94d9-48ad-bfe0-ecf870eab252','有无安全标语?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('79568b6d-c0ac-4142-9407-ec3e3b93e5b3','666353e6-62f4-4e5e-ba3b-9faa6e9337da','仓库管理人员是否知道应急预案有关内容?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('796609a6-0bf2-47cc-8ece-fbb8efa09ca6','7d2095fd-47e4-4ba0-8af6-aa88acbb0b99','施工分包方是否专人对HSE信息及处理结果反馈进行收集、整理、归类、传递等',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('799ada95-4001-4f3c-8902-66fc6f886d7f','b25021e1-de89-4297-bbf7-b74697ac1e9a','是否必须进行临边洞口防护。',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('79c90b2c-1955-4911-b25d-d79afcc37ed9','d7397073-d676-4e83-9b7f-42ac2c296964','有无应急预案?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7a472813-4a17-4bc0-a541-924034f57f86','043264f8-fb2f-4c85-9a05-0a20d36fa815','其他',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7b246671-8954-4f4d-a44e-7af87b8e545a','6a42ccb0-1d32-4d7d-b8e1-75878b5dc8f1','通道宽度是否符合规定?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7c38cf03-a8c5-4d33-853b-0122f9fea182','749d84af-fe4e-44f1-9ad1-6a36193e3328','灯具金属外壳是否接零保护',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7c670ff6-371b-4943-a7b4-f0e71d1cb3bd','d2cf710a-10dd-419e-8fbf-9337f6c0cfe4','工作照明使用防爆灯具',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7c96cb91-01cd-46fc-b8bd-1a4cdcaf2c4f','4ee8f944-5b80-45ae-8e60-3c48ef2d26e9','乙炔气瓶要有阻火器',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7c9fd949-823f-408c-87bf-4d8aedb98961','cc54333a-2d80-43ae-831d-82c870e3d8cc','是否留有未拆除的悬空模板',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7cbbec88-69b1-419a-9e48-68b845dc317b','7325a7e4-b556-4d8b-adaa-08e01ad9b653','坑槽开挖设置安全边坡是否符合安全要求',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7da058a0-8e1b-4b6b-bada-34c0a692270a','845979c6-d39f-449a-94d9-fb26506061dd','工作中，是否存在违章指挥、违章作业；',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7ddbb924-02f4-42b3-b9fe-ed6e479fbd1f','2e0177fe-678e-4fa4-9878-e18f28242a9b','脚手架外侧是否设置密目式安全网?网间是否严密',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7de13f1e-f603-4567-a4d8-d50fac93721c','845979c6-d39f-449a-94d9-fb26506061dd','作业时是否悬挂受限作业登记牌（登记牌上要张贴作业许可及进出工人胸卡）',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7e6c3c14-6b9a-4a68-a421-be8671627bde','1a47c5fd-87a4-40ca-9ac8-8a6413f5cdd1','运输车辆配备灭火器',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7eebc070-1d85-4cf7-9ad6-c74420a2e234','0da8615d-7683-4766-ac90-600cebe156cb','人员证件是否有证件并符合要求',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7f282589-d39f-411d-b158-7fd624ebbbcb','7149cfaa-492e-4bde-b0c6-c45022a74ca9','电线布局是否合理',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('7f3f3a09-1144-4e0c-aa42-cf0b5c1c7e70','1a47c5fd-87a4-40ca-9ac8-8a6413f5cdd1','运输时气瓶要有钢贸及防震圈',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('80799ffc-b25b-426a-bd63-12cb80a6136c','749d84af-fe4e-44f1-9ad1-6a36193e3328','手持照明灯是否使用36V及以下电源供电',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('80b98e72-4656-459a-b5e4-eb600592e212','b050a452-78a0-44a9-9bac-b9f5c6d213cd','机具设备入场是否进行审批报验',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('80fca5c0-1465-48f5-a65d-e6cad258dd38','189a4cf1-8657-41a2-b7c4-b236c74d5645','有无量化的验收内容',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('817badbd-7846-47ce-af6e-11e1f4f13039','4ded0823-2756-4dbd-8d81-7ef1770b1245','正确拴挂安全网',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('81b7f730-8efc-49d9-a02e-3392c780efa0','dd5e6f9d-dd6e-4fe5-9007-70c5d9ce06b6','是否建立职工安全生产责任制度',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('82f795fd-5293-41f5-a94f-600502f81ffa','a6903b17-0743-4e6f-9e8e-6972dadf7e40','作业前是否穿戴好防护用具；',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('847de177-0cfc-4ccd-a87d-4fa1544c68fd','4ee8f944-5b80-45ae-8e60-3c48ef2d26e9','气瓶使用前是否进行安全状况检查，对盛装气体进行确认；',8) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('84886ffa-fe54-40b1-8dc8-c86fa3eddf7c','e87e9a29-8a9a-4e20-9a03-69733f9c001a','严禁宿舍、仓库内生火、煮食、严禁明火取暖，严禁使用电炉、电热器具',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('84b04526-5661-485b-9881-2ea1772dcbab','78f2f6ec-24a2-4e7f-9b6e-eec942cc30ce','是否建立健全了项目HSE管理记录及台账',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('862fee4c-4166-4641-842c-d006f850b954','c1eaa17b-90d0-4424-8990-5d15b806a047','违规破线接线，接线不合理',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8690f6cb-8639-4c0d-8228-fa02e834f475','efa25d9a-0ddd-4a72-a92e-54cddc33ca07','是否使用四芯电缆外加一根线代替五芯电缆题',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('86b3a054-ab34-43cd-8c69-85484952f5bf','dd3b16b3-8582-4577-ab64-f47cc62a245b','存放易燃液体、气体场所必须采用防爆型电器设备及照明工具',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('86e27834-28a4-4ace-af85-d8b692cb6959','5dbd0ce5-e64c-494d-924a-1d8462625cda','施工分包方是否依据报告组织实施了隐患治理',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('870665e9-1ed5-4782-971f-36929f374699','57a55f3e-8913-4250-b9ae-732dfcf1905b','材料堆放及土方工程是否有下沉、倒塌的现象',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('872b21c1-2781-4fc3-82f0-fd1d935e4fdb','f823abfb-8218-43cc-a160-bf0791b6f149','是否有人在施工现场内过夜，夜间施工是否事先向业主报批',10) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('88334d10-1bdf-42ba-9540-6b4a4ae764f9','7d2095fd-47e4-4ba0-8af6-aa88acbb0b99','是否明确HSE信息及文件处理的权限',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8852d648-cf18-4768-9d54-236725710f3c','19d176b3-b3fb-4de5-9a0b-aeb6ee9d5e08','支撑系统是否符合设计要求',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('88f79c1c-a4a6-4558-9e71-dc925ef203a5','189a4cf1-8657-41a2-b7c4-b236c74d5645','吊篮安装使用前未进行交底或交底未留有文字记录',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8970a5e0-1163-438f-8409-a4f21e458238','1975bb25-94e9-4fd5-a74f-31fb39890b6d','防冻、防滑、防坠落安全措施落实情况。',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('89ac0978-cae1-460a-ba9a-352aa74461f4','30bb55cd-9be4-4d08-a090-e7f13fc81953','特种作业人员必须持证上岗',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('89bdf1ee-d401-40ea-a0d9-c72a495ab600','b6bac4a0-a5d5-438a-9a8b-8eaa2218dcb2','垂直作业上下有无隔离防护措施',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('89ed5012-4727-48f5-be48-55860587373c','b0218b99-fe5a-4054-a741-9f9ff109f88e','是否有安全技术交底',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8a21fa6b-9179-48b0-87e8-416f6a313675','77e80467-5f83-47b2-a6a0-6c4254433949','钢管立杆是否采用搭接',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8b78b406-0fbc-403a-9e49-c552d521392e','7149cfaa-492e-4bde-b0c6-c45022a74ca9','伙房卫生状况',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8bb0ce96-767c-497a-b32f-c455af22fa95','749d84af-fe4e-44f1-9ad1-6a36193e3328','照明专用回路是否设置漏电保护',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8bbc5960-72b4-42f4-84e5-eb64a515a9db','98045cc7-a4fe-4acc-a091-2826776cc866','张贴安全操作规程',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8c88dd3c-c116-4211-bcd1-45e97d56f2d4','91292573-b241-4209-a8bf-c0126f4aad9a','必须保留和疏通安全应急通道。',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8c9b7731-9698-4d59-bd8a-b20b3a5ff371','5f36824f-ae8d-4ddd-90b7-c76e4d14b57a','是否配有消防、灭火器材',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8d14c066-5f15-4ad8-8696-ab353a67fea5','5f36824f-ae8d-4ddd-90b7-c76e4d14b57a','有防火措施',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8d4e5ff0-d09f-4a13-ae53-50c835c19f48','44b0ad52-36c9-4cc9-a8a9-967a2f59a737','是否按指定位置停放',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8d55a8e8-22eb-40b0-b5f8-501e71b39dcb','acf769bc-854f-4e4d-a711-463df386cdbb','危险部位的警示标志是否设立，如楼梯口、基坑边沿等',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8e023c81-5c8b-4012-9b2e-dd086d61d33c','e94c80fd-0fed-4f77-a839-1a009c93cd37','应急联系方法和方式',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8e5600aa-5bfa-45a4-9f5f-7a0847234f26','09b01f67-3d8f-4143-8d14-b67fb9b8c034','按设计施工、牢固可靠',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8e59b3a0-4353-4841-919b-71594d44be47','e90279e7-e307-4075-9fd4-42cd585b0aeb','检验合格后是粘贴合格标志',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8e6eb6bb-f557-474f-83a4-6dde419279ec','855f5e09-ce6f-4f6d-8725-b5011b78a4f4','不得使用铜丝、铁丝代替保险丝',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8ed2dc85-54ae-450b-90e9-f0a91406a165','e417e882-ccff-43c4-b0bc-980e3d3d55d2','有无项目安全员对生活区安全文明检查记录。',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8eed8c9b-3fd7-4434-a008-7ae0bcd23e1c','c7ba5d46-d93c-49b8-904c-cd44f86528f7','以上两项记录是否有管理人员及时核查',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8f7e72af-ef15-4a75-983e-a2ee61cd7682','c8b8638c-0c0d-409c-82a9-30640b83a985','工地是否设置吸烟处?是否有人随意吸烟?',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('8f80937f-effe-414a-bf47-dafd8377cf34','e63bd7b3-7e52-43fb-9d1b-689769ce103e','γ射线探伤一旦出现放射源失控故障，是否采取紧急补救措施；',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9053f610-72d4-4459-b7db-e2aeeaaadbf5','f716ddb1-3128-4608-b03e-d25811c8002a','施工分包方项目部是否制定了本单位的职业卫生管理职责',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9150b3da-c778-47a1-847f-5bb4754a8f7d','b0218b99-fe5a-4054-a741-9f9ff109f88e','是否有方案和专项安全措施',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9157ffa1-f28c-47ef-833a-0e26cc36c999','a7a51b31-f27d-4b14-b042-c03ee57f4048','是否按规定设置纵横向支撑',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('925da871-5a0d-4c0f-a6e5-f5f892f12121','749d84af-fe4e-44f1-9ad1-6a36193e3328','潮湿作业是否使用36V以下安全电压',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9286f403-7d4a-43ec-986d-9e9028f9fefe','30bb55cd-9be4-4d08-a090-e7f13fc81953','安全防护用品穿戴必须符合要求，所有人员必须穿戴防护服，并佩戴眼睛和防护器具',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('935d272e-40b5-4282-80ce-f83cc75621bf','c454ca84-e2e6-4ac4-aff3-2a29270c88ac','施工分包方是否负责组织其有关部门人员协调、落实、检查安全技术方案/措施中的各项工作',10) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('93e3b6b7-b64a-4b62-a275-e44011dfa4ae','b6bac4a0-a5d5-438a-9a8b-8eaa2218dcb2','垂直作业有无隔离防护措施',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9403e0b3-cf0b-47a5-a6a7-aa4abc1552f7','6f53fb3b-4693-4977-a7f5-833e0fc5b542','生活区有无门卫',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('94156879-db74-45e4-ac7a-ded0dd11ed9b','efa25d9a-0ddd-4a72-a92e-54cddc33ca07','电杆、横担是否符合要求',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('94608dae-82be-4011-ae04-514b73364e48','6f53fb3b-4693-4977-a7f5-833e0fc5b542','生活区各工种有无独立的灶房',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('966276c0-1ad7-4b18-9c74-7f58925c227a','79727f49-9c90-42fa-9547-9f0445972810','是否用其它金属丝代替熔丝',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('96f759b4-53d4-4b7e-b4ed-b9e9477094eb','86479986-bdbe-4b54-8b3d-0be6e2288637','是否根据混凝土输送方法制定有针对性安全措施',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9702295e-26db-431d-940c-bbf1de493e34','749d84af-fe4e-44f1-9ad1-6a36193e3328','36V安全电压照明线路是否混乱?接头是否用绝缘布包扎',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('987c4b8d-5a27-4d5a-a2b4-797fd277a507','f716ddb1-3128-4608-b03e-d25811c8002a','职业卫生与职业病防治工作所需的管理经费、仪器设备购置费，是否得以保证，专款专用',8) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('98ddae90-1581-43f1-b2a9-efcfadabbca4','8c9df280-84a6-4292-8cc0-42ef231e55b5','料堆是否挂有名称、品种、规格等标牌?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('98f65fa6-9ff8-42b6-9bed-dc7cddc7e311','98045cc7-a4fe-4acc-a091-2826776cc866','现场安全警戒、封闭、标识',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9906687c-e37a-4873-9cd3-f0d62b0af333','0effae99-5429-4b76-8c52-c2138fa8ad66','防坠安全锁超过标定期限仍在使用',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('99555e7e-36c0-4315-af57-9210a9944387','d64c102c-49e9-424f-a65a-844639a598a7','施工层以下每隔10m是否用平网或其它措施封闭',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('997066b0-8b76-4221-9683-85d52ff6a14e','b620dcfc-ae18-4d02-b28a-131765f2adad','登高作业，电杆立杆等埋设固定牢靠，登高工具合格',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9a560f0b-1985-47ff-b139-4a77918779cc','5b60d917-7e09-4952-a46c-04b5a10fa56c','动火作业审批制度是否健全',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9a8a1559-3fd9-4fb6-af64-c15468b2082f','09b01f67-3d8f-4143-8d14-b67fb9b8c034','堆物、整齐、稳固不准超负荷',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9b1d5dd3-f503-4a9c-8717-c04cf0a87927','57a55f3e-8913-4250-b9ae-732dfcf1905b','现场的道路、排水设施是否畅通。',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9c65afe8-b32f-4eeb-867e-90336db2fc20','6a42ccb0-1d32-4d7d-b8e1-75878b5dc8f1','库内是否有可燃杂物?',9) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9c783d9f-c3ed-4d18-bddb-3c4ec51ba747','ee44f1a4-e662-4ecf-bcf0-48cab958dc6d','索具使用是否合理?绳径倍数是否够?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9cc35787-41f0-4552-b14a-51bfdded7c7e','5b60d917-7e09-4952-a46c-04b5a10fa56c','施工材料和化学危险品仓库管理制度是否健全',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9d29ab16-c950-4487-a089-0f7e76b99ee4','105b10cc-f4a6-482a-96c4-161ceeed80c4','在市区主要路段的工地是否设置高于2.5m的围档?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9e3c0a38-726a-4bac-a755-f8b8e75f57ee','58e8d8d9-f576-4e5d-83aa-f2d6324b0c0c','消防检查记录及动火作业审批记录是否齐全',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9e5e305f-d538-40a7-9d61-9362b9e32a92','5b60d917-7e09-4952-a46c-04b5a10fa56c','有无编制消防设施布置平面图',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9e6cd46a-873d-4525-86d6-87378017d2b6','bec226c6-94d9-48ad-bfe0-ecf870eab252','有无宣传栏、读报栏、黑板报等？',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9e73e8f5-5604-4161-b942-b3877b7438d1','7fb552c4-382f-4bdd-a3d9-651c4a4ccc44','吊钩有无保险装置?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('9fd51a4c-aef1-4e6d-889d-69b9c441e334','e299e59f-0174-472a-9025-73f2e754b487','作业超过一个作业班次是否采取可靠临边防护措施',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a0171890-33f7-4e01-8292-d7c268a8dcbb','57e754a6-cf58-4c84-a4f3-93f776be804b','气瓶放置点通风是否良好，是否有防范高温、明火、腐蚀、日晒的措施，有无防倾倒措施',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a0438493-5da1-4d44-9973-405fd1c64ae9','c8b8638c-0c0d-409c-82a9-30640b83a985','是否有防止泥浆、污水、废水外流或堵塞下水道和排水河道措施?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a12c247c-46eb-4fab-8b79-32f13b7ca504','30bb55cd-9be4-4d08-a090-e7f13fc81953','是否派专人监护，监护人员是否在岗',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a1418bd7-6fee-40e9-bf89-1659b780b3bb','6f53fb3b-4693-4977-a7f5-833e0fc5b542','生活区有无水冲式公厕',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a1855892-c847-4b5e-87e5-4745e22e89ae','d7397073-d676-4e83-9b7f-42ac2c296964','有无危险品仓库安全管理规章制度？',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a2ec6ec4-08c0-4fc2-9443-9e5580e80a78','ab54ef75-9e0d-4d02-9dbd-a75da631cad5','配电箱内多路配电是否有标识',8) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a309cd82-e617-45ba-b094-04139ffd6ece','bf154090-d4c6-4eff-90b4-18949bf18259','有无安全标志牌？',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a3219182-3ba3-4433-aef1-62ab8848d8f6','85868409-021f-4292-862a-37ddb2377026','其材质、规格与压力、温度、介质相适应',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a33c98e9-d2df-4ef4-8d8b-9f4f634bbb5a','0a61cbd4-236d-4b9a-bb52-f72736c0f8fb','消防器材配置数量必须符合要求',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a450158f-ae1a-4f1d-aaac-e2987d4689ab','91292573-b241-4209-a8bf-c0126f4aad9a','是否有安全应急措施',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a47f5f13-8092-49e0-a784-0797f6c5c5ca','e87e9a29-8a9a-4e20-9a03-69733f9c001a','生活区内宿舍严禁乱拖乱接简易插座，电线必须套管敷设',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a4cad7c8-134c-4fd3-bb7c-049ec949ff40','f33388d0-e584-4b0d-b5d3-9c1cb16c94a4','安全钢丝绳规格、型号与工作钢丝绳不相同或未独立悬挂',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a4ce0509-98ef-4700-bde9-3b0a9d7682da','222f1d0b-d990-48ec-9a97-9c4cf4e15c33','严禁对着设备、人员、道路及出入口。',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a507b402-7c6f-4498-93c6-135b6534db3e','5f36824f-ae8d-4ddd-90b7-c76e4d14b57a','配备的防火器材',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a521af4d-24b9-46af-a358-be7deec8f317','d73e1da1-c823-4abd-800c-b057bf54d7f5','是否已开展卫生防病宣传教育?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a5884468-b78f-44ea-852e-f8dda2e02fda','6ffdb168-e839-46b9-8c94-200cd46ca0b6','作业前检查安全绳的牢固程度、不准使用不合格的安全绳',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a5d7c1f5-b1b6-49ea-a7bb-7b19ea20b4f2','666353e6-62f4-4e5e-ba3b-9faa6e9337da','贮存地点、事故处理程序和方法?',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a636ccbb-45ec-42de-a3e4-4b11d9e3ba35','15243898-2109-4ba0-a3e7-bb9569b9e3c4','吊篮平台组装长度不符合产品说明书和规范要求',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a66dea4a-ca31-46ae-9ec5-0780b85f9875','b050a452-78a0-44a9-9bac-b9f5c6d213cd','检验合格后是粘贴合格标志',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a7a8b8a1-9744-4b8e-9353-70b0fae9f987','b620dcfc-ae18-4d02-b28a-131765f2adad','夜间有足够的照明',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a816e144-a6a3-4eee-89a1-473a363f6920','0da8615d-7683-4766-ac90-600cebe156cb','有安全方案和专项安全措施',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a82559b9-66cf-4802-bd44-086db05623ab','19d176b3-b3fb-4de5-9a0b-aeb6ee9d5e08','现浇混凝土模板的支撑系统有无设计计算',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a878ac27-be65-44ef-adf2-460cdad14f2a','897ea9a2-29c3-4254-8e76-424759300e9f','在作业前是否制定安全技术措施，并落实到位',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a8c587e3-aedc-4044-8c72-e5af629edc38','7d2095fd-47e4-4ba0-8af6-aa88acbb0b99','是否所有与HSE有关的文件、记录、报告、表格等均分类建立台帐，并交资料员进行登记存档',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('a9cdf328-81d2-4aed-97ae-dada1e58d642','5dbd0ce5-e64c-494d-924a-1d8462625cda','施工分包方是否对隐患治理结果进行了自检',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('aa12c177-1c8a-4b01-8672-324b83971b31','30bb55cd-9be4-4d08-a090-e7f13fc81953','特种作业人员必须持证上岗',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('aa6fbef3-b854-4e25-8ca0-b07e2a6a2ded','f823abfb-8218-43cc-a160-bf0791b6f149','施工分包方是否在自己的施工区域和临时设施周围安装围栏和大门，并设置门卫',9) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('aa72f361-8ff4-4fa2-9197-e3135c62c296','043264f8-fb2f-4c85-9a05-0a20d36fa815','其它',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('aaedc4fd-4143-4d4c-b10e-63e8cbe9a61c','b050a452-78a0-44a9-9bac-b9f5c6d213cd','是否按规定设置防护装置',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('abaffb6e-dbf6-48f0-bced-a7137769085e','365041cb-e8d5-4a9c-a628-6782d667491d','线路加线槽明敷与彩钢板面',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ac9ae2b8-05c5-4569-b335-3d294a1cfd0f','15243898-2109-4ba0-a3e7-bb9569b9e3c4','操作升降人员未经培训合格',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('acb0d2a1-f469-4483-9292-458fb60ed3e2','5bd6a724-0458-4673-b4ff-dbdad99b3eb1','其他',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ad610798-71de-4bf7-b459-cd22102136d9','07167f93-7962-4f0b-8c63-6172a3e253a7','模板上施工荷载是否超过规定要求',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('adbfecf2-a1b1-441f-9aea-55f42247a439','0ed3125e-e604-48c1-8e5f-21d5e9535def','专用保护零线设置是否符合要求',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('addf38bd-e37d-4070-b555-5606eae1573b','5ab2e2e8-84ec-4b97-8fe5-1cccc1ae0160','安全装置、制动、限位等',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ae400645-1e3f-4a63-846d-1a495940cf41','7149cfaa-492e-4bde-b0c6-c45022a74ca9','炊事人员是否健康有证',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ae6b0708-418c-4b9e-9d9c-c79f15a435d7','7149cfaa-492e-4bde-b0c6-c45022a74ca9','食物有无霉烂变质的现象',9) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('af213d76-0550-4146-a5db-3ffdf3a4830a','88e3eede-7ecf-4396-a9ff-7557b5855af0','司机有无上岗证? 2.指挥有无上岗证3.高塔指挥是否使用旗语或对讲机?',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('af3f961a-6b4f-417e-8f2a-3e630d54926e','996c7f5d-2cbd-4cff-b386-7c5dd0be12d0','是否有门卫?是否有门卫制度?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('af6eaa9a-b74a-46fb-bf58-55beffe6af66','d84aa24c-d5bd-4fd4-bca3-263c625707d6','是否存在被吊物体重量不明就吊装情况?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('af98373f-63ce-4319-b968-65c9d8c4fe3d','5ab2e2e8-84ec-4b97-8fe5-1cccc1ae0160','设备旋转部位的安全防护等',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('afe2390f-1519-4958-8b14-9ffcc9fda7cf','77e80467-5f83-47b2-a6a0-6c4254433949','木立杆、大横杆每一处搭接是否大于1.5m',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('aff9e767-d6cf-43a9-8c6f-daa1ef9c108b','44b0ad52-36c9-4cc9-a8a9-967a2f59a737','是否搭运载违禁物品',9) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b063dad4-636b-4fa3-b339-b646f2b00e0a','b2e48682-2117-445c-9c18-eea717c1d8ef','所有进入施工现场的工作人员，进场之前，是否办理二级HSE培训合格证',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b0ad947e-583c-43b8-bd6a-24b8dd6c9fcc','7149cfaa-492e-4bde-b0c6-c45022a74ca9','伙房煤气电炊混用',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b109c0fb-4532-462e-a804-dd1ef70aa5e7','4ded0823-2756-4dbd-8d81-7ef1770b1245','使用工具和易下落的物体，有绳子拴牢，不的下掉',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b1aee006-bc71-4726-b320-fbd23118378b','57a55f3e-8913-4250-b9ae-732dfcf1905b','金属井字架是否有防雷保护装置，能否达到',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b2222d7c-dad6-4b00-80ac-6aa63f2c99a3','c8b8638c-0c0d-409c-82a9-30640b83a985','道路是否通畅?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b236ea2d-d217-455d-aeca-6e8c8e741673','f823abfb-8218-43cc-a160-bf0791b6f149','是否存在不服从门卫管理，无理取闹，谩骂和侮辱门卫人员的现象',11) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b2bd14fa-a6ed-42d7-a610-db7955cc105b','15243898-2109-4ba0-a3e7-bb9569b9e3c4','是否超过最大承载力',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b2c72590-53a1-4d12-8140-16edccb10760','5b60d917-7e09-4952-a46c-04b5a10fa56c','消防安全管理制度是否健全',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b301437c-2fff-4099-8ac7-1a7fb82a518b','58e8d8d9-f576-4e5d-83aa-f2d6324b0c0c','按各项消防管理制度执行各级动火审批手续并做好相关归档工作',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b342ee0a-7a02-486e-b064-126dae5de76a','25046ba3-7f1a-498d-b3fb-5d996a6dcbcd','高处作业有无信号传递?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b3dc21d0-5afa-430e-8413-e66858c06f16','09b01f67-3d8f-4143-8d14-b67fb9b8c034','栈道栈桥通道有扶手栏杆，扶梯固定牢固，通道外外侧下部为道路或作业场所时边缘有10cm以上的档板',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b43fb046-f578-4971-81e6-370ded01f125','efa25d9a-0ddd-4a72-a92e-54cddc33ca07','电线是否老化、破皮?破皮是否已包扎',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b456d350-890d-4646-83d9-64be16cf66d9','4ded0823-2756-4dbd-8d81-7ef1770b1245','下方为通道或其它工作场所，应有防护棚或专人监护',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b4722ff1-5ca9-4d5a-979f-14e5e8b8f2cd','bf154090-d4c6-4eff-90b4-18949bf18259','库内是否通风、干燥、阴凉、避免阳光直射?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b48661cf-1fc8-4dbd-8b6a-aa678fc4d275','cf0bd845-0b30-4a42-b255-1a6c8a70900a','是否编制受限空间作业施工安全技术方案，并审批；',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b48ed4d6-4c07-496f-9419-9cee9193c3c9','4ee8f944-5b80-45ae-8e60-3c48ef2d26e9','气瓶是否立放；',9) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b53c9fcc-35cc-4170-ab5a-6176716b0470','e63bd7b3-7e52-43fb-9d1b-689769ce103e','是否上报无损检测应急预案及专项安全管理制度',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b5813b07-9f9d-4a23-9513-5a581d2437ca','68da4b77-9adc-4c5d-8f36-8a0fc935dd7a','是否存在施工单位管理人员不服从总包单位管理的情况',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b5c2d9e7-eb1c-478a-a946-49f220dd1162','b0d4c8dd-5129-446c-b084-99db610f0f0e','每10米延长立杆、大横杆、小横杆间距是否符合规定要求',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b6792a28-af05-4dfc-951c-4c8abdf0e53b','105b10cc-f4a6-482a-96c4-161ceeed80c4','一般路段的工地周围是否设置高于1.8m的围档?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b6a1653f-5680-4f07-a4f0-59b7b206a78e','6d0a9f00-7aed-4386-bafe-f2e7af0f24b4','是否进入施工现场所有人员在所有时间内，必须统一穿防护服、戴安全帽、穿护趾鞋',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b7356ea9-a9b8-46de-80a5-8b1c188ec2d6','73184d82-a823-40fc-942c-fe91c8482ab9','有无地极阻值摇测记录',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b87e36de-31da-443e-ab62-e5280f76eb33','f33388d0-e584-4b0d-b5d3-9c1cb16c94a4','钢丝绳或安全绳与墙角处未垫垫片',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b8877082-320d-4ab9-99ad-a714a27e1009','f716ddb1-3128-4608-b03e-d25811c8002a','是否建立和完善项目职业卫生与职业病防治管理机构，健全职业卫生管理规章制度',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b8ae040b-1118-4d26-91f4-915838b92475','a6903b17-0743-4e6f-9e8e-6972dadf7e40','在金属容器内作业，是否有相应的安全措施；',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b8e58d55-eab6-4dd9-9c52-814aaf6a82f3','0da8615d-7683-4766-ac90-600cebe156cb','应急措施是否有安全应急程序和通道',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('b99e88b7-936b-483b-9f53-6e97a9dd52ca','ba1bc0fc-f118-4f2c-b148-68adf474b7c4','拆模前混凝土强度是否过到规定要求',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ba90fca3-e29f-4d7d-a54d-536e3ede9ad5','d73e1da1-c823-4abd-800c-b057bf54d7f5','有无保健医药箱?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('bad7d777-a292-42cf-87eb-726529bd918e','6f53fb3b-4693-4977-a7f5-833e0fc5b542','生活区有无专人负责垃圾清扫及卫生值班表',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('bb64de77-aa03-4abd-992f-a13450783cce','88e3eede-7ecf-4396-a9ff-7557b5855af0','是否有安装验收资料?责任人是否签署?',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('bbbce94b-4887-4e4c-a1a4-094a29040977','c2f10e79-a2ec-46cd-a451-c74a5139beb1','卸料平台有无限定荷载标牌',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('bc19166a-3d21-49f2-abac-6c94f1673d06','e6b2580e-db2b-4bb5-a22c-353ec169f1e9','防盗全措施落实情况',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('bc1d9158-8452-4c55-934c-16edafc295b7','d2cf710a-10dd-419e-8fbf-9337f6c0cfe4','是否有安全（警戒）线',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('bd68d135-9e5f-4a9a-9318-3090317f2d67','58e8d8d9-f576-4e5d-83aa-f2d6324b0c0c','消防安全教育及消防安全技术记录是否齐全',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('bdcfe248-2359-4b59-a5ca-97803e7a6fdb','e6fa53f6-1dcd-419c-acd0-0db1b8f438cd','电源的申请或有送电工作票',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('be9908f6-b1fb-4ed0-94ab-cee8bec4f12f','c454ca84-e2e6-4ac4-aff3-2a29270c88ac','施工分包方是否组织技术人员向全体施工人员进行交底，并做好记录，接受交底的施工人员应在记录上签字',9) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('bf13296a-0e91-43d1-a0a5-f40857a2fadf','88e3eede-7ecf-4396-a9ff-7557b5855af0','有无超高、变幅、行走限位器？',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('bf4ce3dc-a91f-4b5b-847f-d8c0e272b34e','897ea9a2-29c3-4254-8e76-424759300e9f','使用射线装置的部门是否在作业前必须到其HSE管理部门、设备部门办理登记手续',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('bf907fd3-dafe-4b53-ab11-f17697b01e17','f3e52048-4d3f-475e-8848-5ec3948a78fb','架体是否设置上下通道',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('bf97148b-47a5-4514-901d-434077c68018','acf769bc-854f-4e4d-a711-463df386cdbb','是否对消防设施进行提示性标识，如火警电话、灭火器等存放的位置',8) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c08bbc9c-33cc-4509-94f3-fe63e99af2db','7d2095fd-47e4-4ba0-8af6-aa88acbb0b99','是否明确规定了文件、资料的控制范围',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c158b3f9-bd15-4994-ba8b-88de219abd06','6a42ccb0-1d32-4d7d-b8e1-75878b5dc8f1','危险品贮存方式、贮存量是否符合规定要求?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c23bdcbf-ddad-40eb-9bb3-bb7c6dc7871d','f716ddb1-3128-4608-b03e-d25811c8002a','是否严格执行防尘防毒措施和管理制度',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c301146c-eec0-4f01-b081-d043e7f7f3ed','25046ba3-7f1a-498d-b3fb-5d996a6dcbcd','是否存在非本机型司机操作现象?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c32f120c-74a9-4525-ac89-51f3a743fb81','44b0ad52-36c9-4cc9-a8a9-967a2f59a737','是否按规定路线、速度行驶',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c32ff727-4c37-4a2e-8333-e9641fc7ee3e','c7ba5d46-d93c-49b8-904c-cd44f86528f7','气瓶出入库记录、借用手续是否齐全完整',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c3666def-3dc9-4058-b88f-357da84b6e08','6ffdb168-e839-46b9-8c94-200cd46ca0b6','不准向下抛丢物体、材料',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c383dca6-279b-4f52-990a-86717ce625bb','043264f8-fb2f-4c85-9a05-0a20d36fa815','其它',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c3a637a8-b758-4508-b358-9e35f927c89a','cc54333a-2d80-43ae-831d-82c870e3d8cc','拆除区域是否设置警戒且有人监护',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c3eac302-0e98-46ee-ada4-2f3b24cd2105','4733b9e2-8cf7-4caf-829a-a07ec1eab5f5','小横杆两端是否固定',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c440eafa-8b3a-46d4-a3de-c501de11a0d2','7149cfaa-492e-4bde-b0c6-c45022a74ca9','伙房有排烟设施',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c4410d0d-1120-4381-b874-5459eeab8f21','d458f341-8d70-4a7c-ba22-93c6dfba1ba7','是否按照安全作业许可证内容设置安全防护或增派安全监护人员',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c4be5f0e-5118-44dd-943e-5d306c94aa91','4ee8f944-5b80-45ae-8e60-3c48ef2d26e9','气瓶在高处使用需要进行固定捆绑',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c5a2f728-997f-47a0-858e-685c63379ae5','3dfeba3b-3306-4c3b-801c-bc8ebfc37a58','对验收不合格的危险品是否及时作出妥善处理?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c675aee1-0e58-401b-ba6e-305ea5fb3e9d','7fb552c4-382f-4bdd-a3d9-651c4a4ccc44','起重扒杆有无设计计算书?是否经审批?',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c689b37d-6b89-41e0-be26-e80773e420a0','222f1d0b-d990-48ec-9a97-9c4cf4e15c33','应朝向无人区，对地或天空，必要时在排放口加设靶板，并在吹扫时设置。',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c6c48b2c-40af-4d00-bc75-6895d05be9f3','b2e48682-2117-445c-9c18-eea717c1d8ef','所有进入施工现场的工作人员，进场之前，是否办理了一级HSE培训合格证，持证上岗',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c806d6b9-3722-4891-95e4-e1202cdc0018','a6903b17-0743-4e6f-9e8e-6972dadf7e40','放射人员是否持证上岗，熟悉有关安全注意事项，做到四会三好',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c8b00355-5d07-4d39-8476-620488ff6063','30bb55cd-9be4-4d08-a090-e7f13fc81953','必须穿戴安全防护用品',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('c956d20a-3aa7-443c-b093-8aad670d3b40','f716ddb1-3128-4608-b03e-d25811c8002a','施工企业的尘、毒、射线、噪声等防护设施，是否加强维修管理，确保完好',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('cae0ee67-9da1-4766-b492-18d5806bc046','2e0177fe-678e-4fa4-9878-e18f28242a9b','施工层是否设置1.2m高防护栏杆和档脚板',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('cb089f66-63c6-42ba-9e78-e94b9f09b23f','b6b1d0cc-5482-4334-a371-414353c0148a','暂设工程安全状况。',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('cc97df87-af20-403d-8f1d-6171b95c2fee','c2f10e79-a2ec-46cd-a451-c74a5139beb1','卸料平台搭设是否符合设计要求',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ccb97ce2-2f03-4b68-9977-d1a3288f3b09','57e754a6-cf58-4c84-a4f3-93f776be804b','空、满气瓶是否有专用并分开的放置区域，区域是否有明显标识',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ce9d0cad-3c92-4f4c-9847-b1c371430539','666353e6-62f4-4e5e-ba3b-9faa6e9337da','义务消防人员是否熟悉各区域存放的危险品种类、特',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ceb41eff-5dbc-48a3-b9e3-67411cdb9159','52401d1b-43e6-47ec-8e04-abc81e4e6ca8','施工分包方是否有紧急状态下的应急事件处置步骤',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('cf0841da-2dac-4eba-a05c-50ca43105c20','ee44f1a4-e662-4ecf-bcf0-48cab958dc6d','是否符合设计规定位置?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('cfb6d557-5ba2-4e4b-90df-2f7981e61dbb','d2cf710a-10dd-419e-8fbf-9337f6c0cfe4','其材质、规格与压力、温度、介质相适应',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d016938f-b409-409e-8d3a-4394d11fa23b','ab54ef75-9e0d-4d02-9dbd-a75da631cad5','开关箱(末级)是否有漏电保护',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d06e6335-6c5b-4952-b4e0-c81dbe11edd6','52401d1b-43e6-47ec-8e04-abc81e4e6ca8','是否编制了现场HSE应急预案',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d154dfe2-cbbe-4c81-a504-11adda4a131f','0da8615d-7683-4766-ac90-600cebe156cb','临时用电是否符合规范要求（低压36V电源和灯具）',8) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d191ac5d-0b6a-40fc-a54a-83b857555bcd','0a61cbd4-236d-4b9a-bb52-f72736c0f8fb','在高空焊割必须采取措施控制火花溅落',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d21b28f2-0583-4358-9df5-7957765ab90c','14b27bec-7906-4d2b-8bcd-e49169e1a21e','每10米延长木脚手架立杆是否埋地或有无扫地杆',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d21c0bdb-adbb-41ec-8fd6-004638c39df8','6f53fb3b-4693-4977-a7f5-833e0fc5b542','生活区有无配备灭火题材',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d21eff9c-5024-4bdd-b815-f27227da0d73','d2cf710a-10dd-419e-8fbf-9337f6c0cfe4','安全监护人员到位',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d25aebd8-fdad-43a9-bc32-a13183176ff9','6ffdb168-e839-46b9-8c94-200cd46ca0b6','正确穿戴安全帽、软底鞋等防护用品',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d3743279-eb51-4884-bb5c-839116c92c90','52401d1b-43e6-47ec-8e04-abc81e4e6ca8','施工分包方是否存档有应急演练记录',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d3ea4fde-45cd-4908-8acf-3fc976027e8a','b0d4c8dd-5129-446c-b084-99db610f0f0e','是否按规定设置剪刀撑',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d3eb923b-7efb-48de-9a7b-adccac787cc7','f716ddb1-3128-4608-b03e-d25811c8002a','施工分包方是否做到职工总数标准',9) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d4631cb4-fedb-48c9-b21e-4fd992d6b489','c1eaa17b-90d0-4424-8990-5d15b806a047','使用电炉子取暖',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d4bca1af-7feb-4961-929d-105e61aa1d75','e6b2580e-db2b-4bb5-a22c-353ec169f1e9','防火灾安全措施落实情况',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d56c66fa-4606-46dd-9884-e92d3cbebd77','e417e882-ccff-43c4-b0bc-980e3d3d55d2','专（兼）职安全员是否到岗：',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d69a4f1c-f040-49f6-8e91-02c721d8dee8','b2e48682-2117-445c-9c18-eea717c1d8ef','是否对全体员工进行了进入现场前的三级HSE培训；考核成绩是否报LPEC HSE管理部确认并备案',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d6a26343-7fd1-4b0e-9fbe-e629165b7241','bf154090-d4c6-4eff-90b4-18949bf18259','仓库设置是否符合施工总平面规定?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d6be1f32-44e8-472b-a16f-e718d0de7857','3dfeba3b-3306-4c3b-801c-bc8ebfc37a58','危险品入库前是否对数量、包装、危险标志等进行检查验收?检查验收有无记录?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d7216940-5647-417e-b314-b973189f14c7','a6903b17-0743-4e6f-9e8e-6972dadf7e40','夜间作业是否有充足的照明；',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d7746a51-f042-4f32-98e5-655d26dee756','6a42ccb0-1d32-4d7d-b8e1-75878b5dc8f1','进入仓库人员是否关闭手机？',10) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d7a4164e-735f-497b-a8e9-08b6b8314a11','365041cb-e8d5-4a9c-a628-6782d667491d','有无漏电保护器、电流小于30毫安、动作小于0.1秒',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d7a7e933-c18b-4521-b770-55fd0cda1876','30bb55cd-9be4-4d08-a090-e7f13fc81953','安全监护人员到位',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d7d0be2c-34ca-40fc-b84b-ee453538effd','a7a51b31-f27d-4b14-b042-c03ee57f4048','立柱间距是否符合规定要求',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d7ee40a6-1f0d-49d0-90b2-6dc9a285d6a2','7149cfaa-492e-4bde-b0c6-c45022a74ca9','各工种有独立伙房',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d89cdde8-175f-45c8-b743-82d3f93455ad','0b738600-c6e0-4e5b-8bba-f90d0c2eabb3','建筑物内外道路和通道必须保持畅通，施工现场应设置临时消防车道',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('d9e96f2f-3f28-43c4-8ba8-eed5d321c184','cc54333a-2d80-43ae-831d-82c870e3d8cc','2m以上高处作业有无可靠立足点',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('da386294-8455-496f-a9cb-1877ca35eb02','f6aaca10-0e64-4d2f-bebb-c28e2db1155a','现场粉尘处理',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dad36a48-83af-42ae-bb98-227479245866','6a42ccb0-1d32-4d7d-b8e1-75878b5dc8f1','与禁忌品距离是否符合规定?',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('db661675-0186-40f8-9afb-2130bf1d43b3','6f53fb3b-4693-4977-a7f5-833e0fc5b542','生活区有无共建垃圾站',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dbdf63f1-a461-407b-a21d-c8e376007806','b050a452-78a0-44a9-9bac-b9f5c6d213cd','是否设置安全警示标志',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dc67bb6f-864c-4daf-a272-e256deb72d52','0da8615d-7683-4766-ac90-600cebe156cb','有安全操作规程',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dcf9726e-6dfe-4e2e-bf93-43203e54d071','6d0a9f00-7aed-4386-bafe-f2e7af0f24b4','施工单位HSE管理部门是否定期检查个人防护用品使用情况，并做好检查记录',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dd1f8353-122e-4724-bc8b-aa5faf49c230','a7a51b31-f27d-4b14-b042-c03ee57f4048','立柱底部有无垫板或用砖垫高',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dd253046-a698-4709-891b-44446f37fe33','dd5e6f9d-dd6e-4fe5-9007-70c5d9ce06b6','是否对所有职工进行了工种（岗位）安全生产教育，并考试合格',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dd5c09e5-8d04-4747-aee9-d7c4c1e32781','845979c6-d39f-449a-94d9-fb26506061dd','作业人员是否正确配戴必要的劳动保护用品；',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dd756e38-92e9-443a-b988-cc6bc7b67501','52401d1b-43e6-47ec-8e04-abc81e4e6ca8','施工分包方是否按照应急预案的计划，组织实施了应急演练',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dd7931fb-69f1-46f2-9fca-0e81b14a5b5e','d84aa24c-d5bd-4fd4-bca3-263c625707d6','每次作业前是否经试吊检验?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dd937cbc-a1f1-448f-975b-99aba49c3944','897ea9a2-29c3-4254-8e76-424759300e9f','对重要路口和人员经常出入口是否派专人看守；',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dda1a933-a723-4fe1-af23-802fbaea86d3','4ded0823-2756-4dbd-8d81-7ef1770b1245','高处作业拉设生命线',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('de1d3b14-b561-41b5-b042-50bdf24ea7f3','d2cf710a-10dd-419e-8fbf-9337f6c0cfe4','有应急通道（照明等）',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dea55ac4-1e67-460c-91be-4b69c4998a30','043264f8-fb2f-4c85-9a05-0a20d36fa815','其他',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('df051e8c-937a-41fd-9181-fc46f47831b9','dd3b16b3-8582-4577-ab64-f47cc62a245b','油漆库与调料间必须分开设置',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dfddb908-e71e-48cb-85fb-cb4d649172fb','845979c6-d39f-449a-94d9-fb26506061dd','现场HSE人员是否不间断进行现场安全巡检，发现问题及时处理；',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('dff95199-855d-499b-a99d-ee34735f74d9','85b580d3-2fac-4589-ae7f-aa677cce456a','司机是否持证上岗',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e0f0d71d-a837-4b3b-823f-995abaa821b8','ed1b5241-4e32-4862-8b3e-a7f367c9e93b','深度超过2m的基坑施工有无临边保护措施',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e10c36b9-a693-4078-bf92-273a49ba0e84','d94747b0-d340-4755-89c5-e7a90588ed4b','其它',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e2c09b4d-5544-4f5e-b3aa-ff32c2482bfc','4ee8f944-5b80-45ae-8e60-3c48ef2d26e9','氧气、乙炔气瓶放置区域周边10米内是否有明火',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e2d66b49-9b6d-4232-8bb2-9c53e80e85f4','b6bac4a0-a5d5-438a-9a8b-8eaa2218dcb2','基坑内作业人员有无安全立足点',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e2f477c5-1478-4b84-b742-d1410aff9c9c','85868409-021f-4292-862a-37ddb2377026','禁止用铁器敲打扳手、管线、法兰等',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e378b21a-21e7-4012-8f66-23cfbcd7300f','e2387152-9b1a-4447-9a25-e227a4f74767','模板工程有无验收手续',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e3eb261f-5ab3-426f-8efa-42c5998ee3cf','c454ca84-e2e6-4ac4-aff3-2a29270c88ac','安全技术方案/措施是否说明和依据、项目概况、施工作业步骤、安全管理措施等',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e40955c9-b077-4932-8575-010983e9c538','15243898-2109-4ba0-a3e7-bb9569b9e3c4','吊篮组装的构配件不是同一生产厂家的产品',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e4619d3e-e7ad-414f-b44b-d7fce0d8312b','85b580d3-2fac-4589-ae7f-aa677cce456a','作业是否办理作业许可',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e48f90bb-10e4-4a8f-9977-f996ab2a10f3','15243898-2109-4ba0-a3e7-bb9569b9e3c4','作业人员未从地在进出吊篮',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e4b1b370-8366-493f-8c3b-97a5ce818fa4','7149cfaa-492e-4bde-b0c6-c45022a74ca9','伙房是否有安全门窗上锁',10) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e4c24778-40d1-4d21-8fbe-4226c1d13b26','e417e882-ccff-43c4-b0bc-980e3d3d55d2','有无专业电工周巡检维修记录',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e4dbdcdf-75aa-4c34-bdd2-ef2697c22427','e94c80fd-0fed-4f77-a839-1a009c93cd37','有应急通道（照明等）',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e518be7b-aa34-4595-9657-9c131fc06827','68da4b77-9adc-4c5d-8f36-8a0fc935dd7a','安全管理人员是否履行自身职责',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e62f0da3-8fac-42f8-ab3a-9d4d717d769b','88e3eede-7ecf-4396-a9ff-7557b5855af0','吊钩有无保险装置?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e647eb03-f850-45b0-85c9-59a2e21ff305','1857a9bc-bd05-46f0-a1ec-07aebf283b19','大模板存放有无防倾倒措施',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e6ab613a-7ffc-4cb2-8697-5a9c60085df0','e6e651f1-3024-49a8-a0e0-cfd5aff640b8','脚手架高度超过规范规定有无设计计算书或经审批',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e70a5c4c-453b-4c2b-9b86-3ddcc285ba76','73184d82-a823-40fc-942c-fe91c8482ab9','电工巡视维修是否有记录?填写是否真实',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e7b89dad-f1a5-484f-a172-f01459f7765b','7d2095fd-47e4-4ba0-8af6-aa88acbb0b99','施工分包方HSE信息及文件借阅共享是否履行借阅共享手续',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e7c132c3-70c9-42e6-bc2b-45658596884b','855f5e09-ce6f-4f6d-8725-b5011b78a4f4','电线截面必须满足用电方案或用电设备荷载要求',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e7c1b4eb-8623-42ad-b652-24c9715325d0','57e754a6-cf58-4c84-a4f3-93f776be804b','单独放置的气瓶有无“空瓶”或“实瓶”标识',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e802d244-b65c-477f-b396-4ce466253e49','0da8615d-7683-4766-ac90-600cebe156cb','办理受限空间安全作业许可票',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e8520a60-233e-4999-b453-03b5114f03fb','57bd144d-ba78-4f1f-8043-13e9810b35af','公厕卫生有无专人值班打扫',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e863031f-886a-4963-a2ce-47cb9c40ac9e','0a61cbd4-236d-4b9a-bb52-f72736c0f8fb','施工现场必须合理、有效配置消防设施或合格的消防器材、且有专人管理',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e866c894-5a28-4eca-86a2-34681bd4534d','85868409-021f-4292-862a-37ddb2377026','安全监护人员到位',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e896b9bd-978e-4085-a097-af600f7c8ebf','c8b8638c-0c0d-409c-82a9-30640b83a985','工地是否有积水?',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e8b94b62-5953-4d03-88a5-756b7662b4d0','996c7f5d-2cbd-4cff-b386-7c5dd0be12d0','门头是否设置企业标志?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e8cf1cdd-dce9-4c52-8248-0a4ad60b1da0','bdbe9fb2-c771-4d49-b015-f82f0f22a3d9','前梁外伸长度不符合产品说明书规定',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('e8fe2f85-e136-4881-8cf0-607277b0ed87','b25021e1-de89-4297-bbf7-b74697ac1e9a','是否设置警戒线；悬挂警示牌。',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('eae4bced-2099-4f34-a596-1217ed7bb8a3','d73e1da1-c823-4abd-800c-b057bf54d7f5','急救人员是否经过培训?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ebc4d926-5238-43eb-b50b-36e3d03df7a0','bdbe9fb2-c771-4d49-b015-f82f0f22a3d9','使用破损的配重块或采用其他替代物',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ebe95b12-2af1-42cc-8e3f-58f92eaf342a','8c9df280-84a6-4292-8cc0-42ef231e55b5','建筑材料、构件、料具是否按总平面图布局堆放?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ec161e9e-7d13-4d36-9bb6-8a0b433d1d65','7fb552c4-382f-4bdd-a3d9-651c4a4ccc44','扒杆组装是否符合设计要求?',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ec740a5e-08c7-492b-905d-e9460ce3faf1','57bd144d-ba78-4f1f-8043-13e9810b35af','生活区卫生有无专人值班打扫',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ecb084eb-97f8-4cbb-b457-751c9a41e9f3','c1eaa17b-90d0-4424-8990-5d15b806a047','未按标准安装插座而床头乱布电线',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ece2bf69-9571-4772-9e29-2d3019d415ec','13aeb1e9-cacc-47f3-b4c2-73545e5d2ec8','滑轮是否符合规定?',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('edcb3b07-027f-4c51-bf6e-73c799b39b2b','f716ddb1-3128-4608-b03e-d25811c8002a','是否按规定组织安排作业人员进行健康检查',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('eddd60bd-0a0a-4409-9ebe-5beb337e19c2','f823abfb-8218-43cc-a160-bf0791b6f149','是否存在厂区内违规吸烟行为',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ee13cd6e-66ed-4bb5-80ec-38df7c2f66c7','bec226c6-94d9-48ad-bfe0-ecf870eab252','生活垃圾是否有专人管理、装入容器、及时处理?',5) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ee30530c-2cde-4323-b5f7-5bc4dfab6ddb','7149cfaa-492e-4bde-b0c6-c45022a74ca9','炊事人员有无定期检查票据',8) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ef850fa0-410a-4324-9258-978051e7e1ff','c454ca84-e2e6-4ac4-aff3-2a29270c88ac','是否编制高处作业安全技术方案/措施',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f04ea04f-f40e-46ec-bef7-ddb1272aa49f','5b60d917-7e09-4952-a46c-04b5a10fa56c','工人消防安全培训教育制度是否健全',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f0541c41-cf31-488e-983f-296de8d2ea48','57e754a6-cf58-4c84-a4f3-93f776be804b','氧气、乙炔气瓶放置区域是否配置合适充足的消防器材和醒目的安全标识',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f0edeed9-a8f9-43f2-a2b1-b12cb7eefa38','dd5e6f9d-dd6e-4fe5-9007-70c5d9ce06b6','对严重违章职工，施工单位是否进行违章者再教育，并考试合格',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f2109eb8-1e5c-4edf-91e4-06a5d90ab634','13aeb1e9-cacc-47f3-b4c2-73545e5d2ec8','地锚埋设是否符合设计要求?',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f2e4fdb7-ab8f-40d8-a154-dd82031f325e','2d09b36d-38da-4704-b422-a027ab146bfb','护设计及方案是否经过上级审批',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f31f6ab0-8fad-46b6-9636-fe2954ffca68','8c9df280-84a6-4292-8cc0-42ef231e55b5','易燃易爆物品是否分类存放?',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f394e991-df0b-436c-af1f-386ba4e3ac27','e90279e7-e307-4075-9fd4-42cd585b0aeb','特种设备若有规定在使用前须向所在地、市监督部门取得特种设备准用证者，使用单位是否申请取证；',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f433c5b1-06ad-41d5-a147-99b853640eb3','5dbd0ce5-e64c-494d-924a-1d8462625cda','报告内容是否缺项',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f478c7df-829e-420e-a6e4-9ebfdc5d2bcc','25046ba3-7f1a-498d-b3fb-5d996a6dcbcd','指挥是否持证上岗?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f4e4be96-574e-43bd-ad08-7932f80b506b','b2e48682-2117-445c-9c18-eea717c1d8ef','是否存在无HSE培训合格证者进入施工现场的现象',7) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f5e99588-b63d-4c35-a903-06f8cc4e18ca','13aeb1e9-cacc-47f3-b4c2-73545e5d2ec8','.缆风绳安全系数是否大于3.5倍?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f677930f-75fd-4fbd-9fef-5e4a95fae49e','189a4cf1-8657-41a2-b7c4-b236c74d5645','脚手架搭设完毕后是否办理验收手续',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f6906f07-20f7-41c1-8838-e4ba31a2d511','b620dcfc-ae18-4d02-b28a-131765f2adad','石棉瓦等简易轻型屋顶作业有相应的安全防护措施',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f699c5d7-0d06-4e6e-9579-4bf5aa0d72ad','356aab0e-c466-4228-97e6-4060e7ba92b4','是否有放射工作人员资质证',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f6cfb94d-33fb-4491-9454-188b209bf4a6','73184d82-a823-40fc-942c-fe91c8482ab9','有无专项用电施工组织设计',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f6f32dbf-e4ef-42eb-8046-d9069eac1309','c7ba5d46-d93c-49b8-904c-cd44f86528f7','所有气瓶是否均有出厂检验合格证',4) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f7570f77-9735-4091-95cb-544fbf27b39d','7466bf20-11c8-4af7-a1ae-7e3b781e0e0e','多层或立体交叉作业未设置防护顶板',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f81a9830-80d6-42ee-a91b-412db03dcbb0','e299e59f-0174-472a-9025-73f2e754b487','是否有各作业班组之间的交底及未固定格栅的标识',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f96b44c9-8530-4b89-84f9-eaba4d0fe8d4','dd5e6f9d-dd6e-4fe5-9007-70c5d9ce06b6','班前安全讲话是否做到“三交一清”',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('f9abda14-97bd-4302-87f8-52ba96b1f6e5','7fb552c4-382f-4bdd-a3d9-651c4a4ccc44','起重机是否有超高和力距限制器?',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('fa0e146a-a3bf-44e2-ae29-b1f0f7864ff7','44b0ad52-36c9-4cc9-a8a9-967a2f59a737','运载物品是否影响环境',8) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('fa16e89c-e812-4046-b4b0-70029e3feb3a','2d09b36d-38da-4704-b422-a027ab146bfb','施工方案针对性是否强，能否指导施工',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('fb2dcd1c-319a-4e78-ae1e-bf72b7f3fb1f','365041cb-e8d5-4a9c-a628-6782d667491d','照明是否与插座分开设置回路',6) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('fb737e36-5f34-4294-b16c-9544375f9a34','85b580d3-2fac-4589-ae7f-aa677cce456a','挖土机作业时，是否有人在挖土机作业半径范围内',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('fbb277c2-caad-40bf-95d7-5227421d1d92','bec226c6-94d9-48ad-bfe0-ecf870eab252','大门处是否有七牌一图? 内容是否完整？',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('fbfed64b-63bb-4fd9-8f02-939998c6bb5a','0b738600-c6e0-4e5b-8bba-f90d0c2eabb3','疏散走道、楼梯、坡道应保持畅通，不得堆放材料灯具等',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('fc737f66-c037-40f8-9bed-061e21fcbede','ab54ef75-9e0d-4d02-9dbd-a75da631cad5','电箱是否有门、锁?是否有防雨措施',10) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('fd295cbf-6e85-4835-811a-e866d2431b5e','dccda995-156c-4c35-aa6d-b23f69561091','防护措施是否符合要求、封闭是否严密',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('fd74f199-4800-40ca-add2-557af6026f0f','2e0177fe-678e-4fa4-9878-e18f28242a9b','脚手板是否满铺',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('fd8e5963-8332-43da-af4d-d54a39f1de1b','6d0a9f00-7aed-4386-bafe-f2e7af0f24b4','个人防护用品是否正确配戴，严禁防护服不系扣、安全帽不系带、护趾鞋当拖鞋穿等不规范行为',2) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('fed4e31a-a711-40e9-afc7-390cd16bb5c4','e299e59f-0174-472a-9025-73f2e754b487','施工方案或JSA',1) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ff3f78e4-9aef-4061-aff1-8723e682a8f7','e6e651f1-3024-49a8-a0e0-cfd5aff640b8','施工方案是否能指导施工',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ff48f454-e7fc-4606-ae39-9aa0a379f8f1','666353e6-62f4-4e5e-ba3b-9faa6e9337da','义务消防人员是否经培训?',3) ;
 INSERT INTO dbo.Technique_CheckItemDetail(CheckItemDetailId,CheckItemSetId,CheckContent,SortIndex)VALUES('ff6c3d81-5c82-425b-aaf7-7c0e3d9f8963','189a4cf1-8657-41a2-b7c4-b236c74d5645','验收内容未进行量化',2) ;