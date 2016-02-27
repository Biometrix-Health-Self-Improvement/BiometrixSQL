USE [Biometrix]
GO

if Object_ID('[dbo].[Exercise]') is NOT NULL
BEGIN
DROP TABLE [dbo].[Exercise]
END
GO

CREATE TABLE [dbo].[Exercise](
	[ExerciseID] INT PRIMARY KEY Identity(1,1)
	, [UserID] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[LoginTable]
	, [Title] VARCHAR(255) NULL
	, [Type] VARCHAR(140) NULL
	, [Minutes] TINYINT NULL
	, [Reps] TINYINT NULL
	, [Laps] TINYINT NULL
	, [Weight] SMALLINT NULL
	, [Inty] TINYINT NULL
	, [Notes] VARCHAR(255) NULL
	, [DateEx] DATE NOT NULL
	, [TimeEx] VARCHAR(50) NOT NULL
	);
GO