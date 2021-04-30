UPDATE Base_Unit SET IsThisUnit=0
GO

INSERT INTO [dbo].[Base_Unit]
([UnitId],[UnitCode],[UnitName],[IsThisUnit],IsBuild)
VALUES
('A26E718E-C3B3-458E-A5A3-D2568A0F7D49','SHEG','山东省公路建设（集团）有限公司',1,1)
GO
