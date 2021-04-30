--数据库升级脚本Ver3.4-->Ver3.5
USE [BUILD]
GO

/****** Object:  StoredProcedure [dbo].[P_Att_FactTimeUp]    Script Date: 11/11/2019 13:56:04 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[P_Att_FactTimeUp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[P_Att_FactTimeUp]
GO


/****** Object:  StoredProcedure [dbo].[P_Att_FactTimeUp]    Script Date: 11/11/2019 13:56:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--更新三个时段的实到时间(实到时间精度为分)
CREATE PROCEDURE [dbo].[P_Att_FactTimeUp]
AS
BEGIN
  Set NOCOUNT ON   
  DECLARE 	@P_Key	bigint,
		@IOTime	datetime,
                          @TempTime      datetime
  --第一时段上班时间
  DELETE FROM T_Att_TempIOTime
  INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,IOTime)
  SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key, CAST(Left(Convert(varchar(19),IORecord.IOTime,120),16)+N':00' As Datetime) AS IOTime
  FROM T_Att_TempCalc AS TmpCalc LEFT OUTER JOIN T_Att_IORecord AS IORecord ON TmpCalc.Person_Key = IORecord.Person_Key
  WHERE(TmpCalc.Seg1Enabled=1) and (TmpCalc.Seg1BTime is not NULL) and (IOTime Between (TmpCalc.Seg1BBTime) and (TmpCalc.Seg1BETime))
  ORDER BY IOTime ASC  
--Order by TmpCalc.Person_Key,IORecord.IOTime DESC
  
  --UPDATE T_Att_TempCalc SET Seg1BFactTime=T_Att_TempIOTime.IOTime FROM T_Att_TempCalc,T_Att_TempIOTime 
  --WHERE (T_Att_TempCalc.Seg1Enabled=1) and (T_Att_TempCalc.P_Key=T_Att_TempIOTime.P_Key) 
   DECLARE TempIOTime_Cursor CURSOR FOR 
	SELECT P_Key,IOTime		
		FROM   T_Att_TempIOTime
	Order By P_Key,IOTime ASC
   OPEN TempIOTime_Cursor
   FETCH NEXT FROM TempIOTime_Cursor
   INTO @P_Key,@IOTime
      WHILE @@FETCH_STATUS = 0
      BEGIN
         --Update T_Att_TempCalc Set Seg1BFactTime=@IOTime WHERE P_Key=@P_Key
          --2011/11/03取靠近上班时间的时间点
          Update T_Att_TempCalc Set Seg1BFactTime=CASE
                                                     WHEN Seg1BFactTime<= Seg1BTime  THEN Seg1BFactTime
                                                     ELSE  @IOTime                                            
                                                     END
                                                     WHERE P_Key=@P_Key    
        --print @P_key
        --print @IOTime	
        FETCH NEXT FROM TempIOTime_Cursor
        INTO @P_Key,@IOTime
      END
   CLOSE TempIOTime_Cursor
   DEALLOCATE TempIOTime_Cursor 


  --第一时段下班时间
  DELETE FROM T_Att_TempIOTime
  INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,IOTime)
  SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key, CAST(Left(Convert(varchar(19),IORecord.IOTime,120),16)+N':00' As Datetime) AS IOTime
  FROM T_Att_TempCalc AS TmpCalc LEFT OUTER JOIN T_Att_IORecord AS IORecord ON TmpCalc.Person_Key = IORecord.Person_Key
  WHERE (TmpCalc.Seg1Enabled=1) and (TmpCalc.Seg1ETime is not NULL) and (IOTime Between (TmpCalc.Seg1EBTime) and (TmpCalc.Seg1EETime))
  ORDER BY IOTime desc   
--Order by TmpCalc.Person_Key,IORecord.IOTime

  --UPDATE T_Att_TempCalc SET Seg1EFactTime=T_Att_TempIOTime.IOTime FROM T_Att_TempCalc,T_Att_TempIOTime 
  --WHERE  (T_Att_TempCalc.Seg1Enabled=1) and (T_Att_TempCalc.P_Key=T_Att_TempIOTime.P_Key) 
   DECLARE TempIOTime_Cursor CURSOR FOR 
	SELECT	P_Key,IOTime		
		FROM   T_Att_TempIOTime
	Order By P_Key,IOTime DESC
   OPEN TempIOTime_Cursor
   FETCH NEXT FROM TempIOTime_Cursor
   INTO @P_Key,@IOTime
      WHILE @@FETCH_STATUS = 0
      BEGIN
        --Update T_Att_TempCalc Set Seg1EFactTime=@IOTime WHERE P_Key=@P_Key
          --2011/11/03取靠近下班时间的时间点,两次的时间差在5分钟内取一时间点
          Update T_Att_TempCalc Set Seg1EFactTime=CASE
                                                     WHEN  ROUND( CONVERT(FLOAT,(@IOTime -Seg1BFactTime))*1440,0,1)<5 THEN NULL
                                                     WHEN Seg1EFactTime>= Seg1ETime  THEN Seg1EFactTime                                                   
                                                     ELSE  @IOTime                                            
                                                     END
                                                     WHERE P_Key=@P_Key    
        --print @P_key
        --print @IOTime	
        FETCH NEXT FROM TempIOTime_Cursor
        INTO @P_Key,@IOTime
      END
   CLOSE TempIOTime_Cursor
   DEALLOCATE TempIOTime_Cursor 


  --第二时段上班时间
  DELETE FROM T_Att_TempIOTime
  INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,IOTime)
  SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key, CAST(Left(Convert(varchar(19),IORecord.IOTime,120),16)+N':00' As Datetime) AS IOTime

  FROM T_Att_TempCalc AS TmpCalc LEFT OUTER JOIN T_Att_IORecord AS IORecord ON TmpCalc.Person_Key = IORecord.Person_Key
  WHERE (TmpCalc.Seg2Enabled=1) and (TmpCalc.Seg2BTime is not NULL) and (IOTime Between (TmpCalc.Seg2BBTime) and (TmpCalc.Seg2BETime))
  ORDER BY IOTime ASC   
--Order by TmpCalc.Person_Key,IORecord.IOTime DESC

  --UPDATE T_Att_TempCalc SET Seg2BFactTime=T_Att_TempIOTime.IOTime FROM T_Att_TempCalc,T_Att_TempIOTime 
  --WHERE  (T_Att_TempCalc.Seg2Enabled=1) and (T_Att_TempCalc.P_Key=T_Att_TempIOTime.P_Key) 

  
   DECLARE TempIOTime_Cursor CURSOR FOR 
	SELECT P_Key,IOTime		
		FROM   T_Att_TempIOTime
	Order By P_Key,IOTime  ASC
   OPEN TempIOTime_Cursor
   FETCH NEXT FROM TempIOTime_Cursor
   INTO @P_Key,@IOTime
      WHILE @@FETCH_STATUS = 0
      BEGIN
       -- Update T_Att_TempCalc Set Seg2BFactTime=@IOTime WHERE P_Key=@P_Key

       /* Update T_Att_TempCalc    SET Seg2BFactTime=CASE
                                                   WHEN  Seg1EFactTime>@IOTime THEN  Seg1EFactTime
                                                   WHEN  (Seg1EFactTime= @IOTime)THEN NULL
                                                   ELSE  @IOTime
                                                   END,

                                                   Seg1EFactTime=CASE
                                                   WHEN  Seg1EFactTime>@IOTime THEN  @IOTime
                                                   ELSE  Seg1EFactTime
                                                   END 
                                                   WHERE P_Key=@P_Key*/

          --2011/11/03取靠近一段下班时间点
          Update T_Att_TempCalc Set Seg2BFactTime=CASE
                                                     WHEN ROUND( CONVERT(FLOAT,(@IOTime -Seg1EFactTime))*1440,0,1)>5 THEN @IOTime                                                      
                                                     ELSE Seg2BFactTime   
                                                     --WHEN Seg2BFactTime<= Seg2BTime  THEN Seg2BFactTime
                                                     --WHEN  ROUND( CONVERT(FLOAT,(@IOTime -Seg1EFactTime))*1440,0,1)<5 THEN NULL
                                                     --ELSE  @IOTime                                            
                                                     END
                                                     WHERE P_Key=@P_Key    

        --print @P_key
        --print @IOTime	
        FETCH NEXT FROM TempIOTime_Cursor
        INTO @P_Key,@IOTime
      END
   CLOSE TempIOTime_Cursor
   DEALLOCATE TempIOTime_Cursor 


  --第二时段下班时间
  DELETE FROM T_Att_TempIOTime
  INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,IOTime)
  SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key, CAST(Left(Convert(varchar(19),IORecord.IOTime,120),16)+N':00' As Datetime) AS IOTime
  FROM T_Att_TempCalc AS TmpCalc LEFT OUTER JOIN T_Att_IORecord AS IORecord ON TmpCalc.Person_Key = IORecord.Person_Key
  WHERE (TmpCalc.Seg2Enabled=1) and (TmpCalc.Seg2ETime is not NULL) and (IOTime Between (TmpCalc.Seg2EBTime) and (TmpCalc.Seg2EETime))
  ORDER BY IOTime DESC   
--Order by TmpCalc.Person_Key,IORecord.IOTime

  --UPDATE T_Att_TempCalc SET Seg2EFactTime=T_Att_TempIOTime.IOTime FROM T_Att_TempCalc,T_Att_TempIOTime
  --WHERE  (T_Att_TempCalc.Seg2Enabled=1) and (T_Att_TempCalc.P_Key=T_Att_TempIOTime.P_Key) 
   DECLARE TempIOTime_Cursor CURSOR FOR 
	SELECT	P_Key,IOTime		
		FROM   T_Att_TempIOTime
	Order By P_Key,IOTime DESC
   OPEN TempIOTime_Cursor
   FETCH NEXT FROM TempIOTime_Cursor
   INTO @P_Key,@IOTime
      WHILE @@FETCH_STATUS = 0
      BEGIN
       --Update T_Att_TempCalc Set Seg2EFactTime=@IOTime WHERE P_Key=@P_Key
          --2011/11/03取靠近下班时间的时间点
          Update T_Att_TempCalc Set Seg2EFactTime=CASE
                                                     WHEN  ROUND( CONVERT(FLOAT,(@IOTime -Seg2BFactTime))*1440,0,1)<5 THEN NULL
                                                     WHEN Seg2EFactTime>= Seg2ETime  THEN Seg2EFactTime
                                                     ELSE  @IOTime                                            
                                                     END
                                                     WHERE P_Key=@P_Key    
        --print @P_key
        --print @IOTime	
        FETCH NEXT FROM TempIOTime_Cursor
        INTO @P_Key,@IOTime
      END
   CLOSE TempIOTime_Cursor
   DEALLOCATE TempIOTime_Cursor 



  --第三时段上班时间
  DELETE FROM T_Att_TempIOTime
  INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,IOTime)
  SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key, CAST(Left(Convert(varchar(19),IORecord.IOTime,120),16)+N':00' As Datetime) AS IOTime
  FROM T_Att_TempCalc AS TmpCalc  LEFT OUTER JOIN  T_Att_IORecord AS IORecord ON TmpCalc.Person_Key = IORecord.Person_Key
  WHERE (TmpCalc.Seg3Enabled=1) and (TmpCalc.Seg3BTime is not NULL) and (IOTime Between (TmpCalc.Seg3BBTime) and (TmpCalc.Seg3BETime))
  ORDER BY IOTime ASC   
--Order by TmpCalc.Person_Key,IORecord.IOTime DESC

  --UPDATE T_Att_TempCalc SET Seg3BFactTime=T_Att_TempIOTime.IOTime FROM T_Att_TempCalc,T_Att_TempIOTime 
  --WHERE  (T_Att_TempCalc.Seg3Enabled=1) and (T_Att_TempCalc.P_Key=T_Att_TempIOTime.P_Key)
   DECLARE TempIOTime_Cursor CURSOR FOR 
	SELECT P_Key,IOTime		
		FROM   T_Att_TempIOTime
	Order By P_Key,IOTime ASC
   OPEN TempIOTime_Cursor
   FETCH NEXT FROM TempIOTime_Cursor
   INTO @P_Key,@IOTime
      WHILE @@FETCH_STATUS = 0
      BEGIN
       -- Update T_Att_TempCalc Set Seg3BFactTime=@IOTime WHERE P_Key=@P_Key

      /* Update T_Att_TempCalc    SET Seg3BFactTime=CASE
                                                   WHEN  Seg2EFactTime> @IOTime THEN  Seg2EFactTime
                                                   WHEN  Seg2EFactTime= @IOTime THEN NULL
                                                   ELSE  @IOTime
                                                   END,

                                                   Seg2EFactTime=CASE
                                                   WHEN  Seg2EFactTime> @IOTime THEN  @IOTime
                                                   ELSE  Seg2EFactTime
                                                   END          
                                                   WHERE P_Key=@P_Key     --2011-12-02*/

          --2011/11/03取靠近上班班时间的时间点
          Update T_Att_TempCalc Set Seg3BFactTime=CASE 
                                                     WHEN ROUND( CONVERT(FLOAT,(@IOTime -Seg2EFactTime))*1440,0,1)>5 THEN @IOTime                                                      
                                                     ELSE Seg3BFactTime                                            
                                                     END
                                                     WHERE P_Key=@P_Key    

        --print @P_key
        --print @IOTime	
        FETCH NEXT FROM TempIOTime_Cursor
        INTO @P_Key,@IOTime
      END
   CLOSE TempIOTime_Cursor
   DEALLOCATE TempIOTime_Cursor 

  --第三时段下班时间
  DELETE FROM T_Att_TempIOTime
  INSERT INTO T_Att_TempIOTime
	(P_Key,Person_Key,IOTime)
  SELECT TmpCalc.P_Key AS P_Key, TmpCalc.Person_Key AS Person_Key, CAST(Left(Convert(varchar(19),IORecord.IOTime,120),16)+N':00' As Datetime) AS IOTime
  FROM T_Att_TempCalc AS TmpCalc   LEFT OUTER JOIN T_Att_IORecord AS IORecord ON TmpCalc.Person_Key = IORecord.Person_Key
  WHERE(TmpCalc.Seg3Enabled=1) and  (TmpCalc.Seg3ETime is not NULL) and (IOTime Between (TmpCalc.Seg3EBTime) and (TmpCalc.Seg3EETime))
  ORDER BY IOTime DESC   
--Order by TmpCalc.Person_Key,IORecord.IOTime

  --UPDATE T_Att_TempCalc SET Seg3EFactTime=T_Att_TempIOTime.IOTime FROM T_Att_TempCalc,T_Att_TempIOTime 
  --WHERE  (T_Att_TempCalc.Seg3Enabled=1) and (T_Att_TempCalc.P_Key=T_Att_TempIOTime.P_Key)
   DECLARE TempIOTime_Cursor CURSOR FOR 
	SELECT	P_Key,IOTime		
		FROM   T_Att_TempIOTime
	Order By P_Key,IOTime DESC
   OPEN TempIOTime_Cursor
   FETCH NEXT FROM TempIOTime_Cursor
   INTO @P_Key,@IOTime
      WHILE @@FETCH_STATUS = 0
      BEGIN
        Update T_Att_TempCalc Set Seg3EFactTime=@IOTime WHERE P_Key=@P_Key
        --print @P_key
        --print @IOTime	
        FETCH NEXT FROM TempIOTime_Cursor
        INTO @P_Key,@IOTime
      END
   CLOSE TempIOTime_Cursor
   DEALLOCATE TempIOTime_Cursor 
  Set NOCOUNT OFF
END

GO

/****** Object:  Table [dbo].[T_BD_Temp_InOutRecord]    Script Date: 11/11/2019 13:58:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[T_BD_Temp_InOutRecord](
	[P_Key] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonName] [varchar](20) NULL,
	[PersonSex] [varchar](2) NULL,
	[PersonIDCardCode] [varchar](20) NULL,
	[WorkTypeName] [varchar](200) NULL,
	[DepName] [varchar](255) NULL,
	[ControlNumber] [bigint] NULL,
	[ControlName] [varchar](255) NULL,
	[RecordTime] [datetime] NULL,
	[RecordTime2] [datetime] NULL,
	[ControlName2] [varchar](255) NULL,
	[ControlNumber2] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[P_Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  StoredProcedure [dbo].[P_Att_SumIoRecord]    Script Date: 11/11/2019 13:57:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[P_Att_SumIoRecord]
  @BeginDate AS datetime ,
  @EndDate AS datetime 
AS
BEGIN
    ---定义中间变量
		declare @dt datetime
		select @dt = @BeginDate
    --- 清空临时表
    delete from T_BD_Temp_InOutRecord;
    ---开始按照时间循环执行
		while @dt <= @EndDate
		begin
        ---处理逻辑
        --声明一个变量
				declare @PersonIDCardCode as VARCHAR(64);
				--声明一个游标用来遍历查询到的结果
				declare C_PersonIDCardCode CURSOR for select c.PersonIDCardCode from T_BD_InOutRecord_Log as c 
 INNER JOIN T_BD_Control cc on c.ControlNumber=cc.ControlNumber where 
  cc.IfAttend=1 AND 
        DateDiff(dd, c.RecordTime, @dt) = 0  GROUP BY c.PersonIDCardCode;
				--打开游标
				open C_PersonIDCardCode;
				--获取游标指向的数据
				fetch next from C_PersonIDCardCode into @PersonIDCardCode;
				--使用游标遍历集合
				while @@FETCH_STATUS = 0
				BEGIN
				--执行具体的操作
						print @PersonIDCardCode;
            INSERT INTO T_BD_Temp_InOutRecord([PersonName], [PersonSex], [PersonIDCardCode],
            [WorkTypeName], [DepName], [ControlNumber], [ControlName], [RecordTime],
            [ControlNumber2], [ControlName2], [RecordTime2])
             select * from (
							select top 1 b.PersonName,b.PersonSex,b.PersonIDCardCode,b.WorkTypeName,b.DepName,b.ControlNumber,b.ControlName,b.RecordTime,
						 (select  top 1 d.ControlNumber from T_BD_InOutRecord_Log as d INNER JOIN T_BD_Control cc1 on d.ControlNumber=cc1.ControlNumber where  
  cc1.IfAttend=1 AND   DateDiff(dd,d.RecordTime,@dt)=0  and d.PersonIDCardCode=b.PersonIDCardCode order by d.RecordTime desc) as 'ControlNumber2',
						 (select  top 1 e.ControlName from T_BD_InOutRecord_Log as e INNER JOIN T_BD_Control cc2 on e.ControlNumber=cc2.ControlNumber where  
  cc2.IfAttend=1 AND   DateDiff(dd,e.RecordTime,@dt)=0  and e.PersonIDCardCode=b.PersonIDCardCode order by e.RecordTime desc) as 'ControlName2',
						(select  top 1 f.RecordTime from T_BD_InOutRecord_Log as f INNER JOIN T_BD_Control cc3 on f.ControlNumber=cc3.ControlNumber where  
  cc3.IfAttend=1 AND   DateDiff(dd,f.RecordTime,@dt)=0 and f.PersonIDCardCode=b.PersonIDCardCode order by f.RecordTime desc) as 'RecordTime2'
						 from T_BD_InOutRecord_Log as b INNER JOIN T_BD_Control cc on b.ControlNumber=cc.ControlNumber where  
             cc.IfAttend=1 AND   DateDiff(dd,b.RecordTime,@dt)=0  and b.PersonIDCardCode=@PersonIDCardCode order by b.RecordTime asc 
						) a

				--游标指向下一条数据
						FETCH next from C_PersonIDCardCode into @PersonIDCardCode;
				END
				--关闭游标
				CLose C_PersonIDCardCode;
				--释放游标
				DEALLOCATE C_PersonIDCardCode;
 
				---中间变量加1
				select @dt = DATEADD(DAY,1,@dt)
		end
END
GO

