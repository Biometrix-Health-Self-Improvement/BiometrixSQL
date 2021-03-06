USE [Biometrix]
GO

if Object_ID('[dbo].[Exercise]') is NOT NULL
BEGIN
DROP TABLE [dbo].[Exercise]
END
GO

CREATE TABLE [dbo].[Exercise](
	[WebExerciseID] INT PRIMARY KEY Identity(1,1)
	, [UserID] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[LoginTable]
	, [LocalExerciseID] INT NOT NULL
	, [Title] VARCHAR(255) NULL
	, [Type] VARCHAR(140) NULL
	, [Minutes] TINYINT NULL
	, [Inty] TINYINT NULL
	, [Notes] VARCHAR(255) NULL
	, [DateEx] DATE NOT NULL
	, [TimeEx] TIME NOT NULL
);
GO