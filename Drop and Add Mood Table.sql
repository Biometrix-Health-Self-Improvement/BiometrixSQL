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
	, [LocalMoodID] INT NOT NULL
	, [Date] DATE NOT NULL
	, [Time] TIME NOT NULL
	, [Depression] INT NULL
	, [Elevated] INT NULL
	, [Irritable] INT NULL
	, [Anxiety] INT NULL
	, [Notes] VARCHAR(255) NULL
);
GO