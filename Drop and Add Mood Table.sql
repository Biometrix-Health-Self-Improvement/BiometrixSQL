USE [Biometrix]
GO

if Object_ID('[dbo].[Mood]') is NOT NULL
BEGIN
DROP TABLE [dbo].[Mood]
END
GO

CREATE TABLE [dbo].[Mood](
	[WebMoodID] INT PRIMARY KEY Identity(1,1)
	, [UserID] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[LoginTable]
	, [LocalMoodID] INT NULL
	, [Date] DATE NOT NULL
	, [Time] TIME NOT NULL
	, [Depression] VARCHAR(50) NULL
	, [Elevated] VARCHAR(50) NULL
	, [Irritable] VARCHAR(50) NULL
	, [Anxiety] VARCHAR(50) NULL
	, [Notes] VARCHAR(255) NULL
	);
GO
