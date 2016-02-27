USE [Biometrix]
GO

if Object_ID('[dbo].[Sleep]') is NOT NULL
BEGIN
DROP TABLE [dbo].[Sleep]
END
GO

CREATE TABLE [dbo].[Sleep](
	[WebSleepID] INT PRIMARY KEY Identity(1,1)
	, [UserID] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[LoginTable]
	, [LocalSleepID] INT NULL
	, [Date] DATE NOT NULL
	, [Time] TIME NOT NULL
	, [Duration] TIME NOT NULL
	, [Quality] INT NULL
	, [Notes] VARCHAR(300) NULL
	, [Health] VARCHAR(20) NULL
	);
GO
