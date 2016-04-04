USE [Biometrix]
GO

if Object_ID('[dbo].[Medication]') is NOT NULL
BEGIN
DROP TABLE [dbo].[Medication]
END
GO

CREATE TABLE [dbo].[Medication](
	[WebMedicationID] INT PRIMARY KEY Identity(1,1)
	, [UserID] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[LoginTable]
	, [LocalMedicationID] INT NOT NULL
	, [Date] DATE NOT NULL
	, [Time] TIME NOT NULL
	, [BrandName] VARCHAR(255) NULL
	, [Prescriber] VARCHAR(255) NULL
	, [Dose] VARCHAR(255) NULL
	, [Instructions] VARCHAR(255) NULL
	, [Warnings] VARCHAR(255) NULL
	, [Notes] VARCHAR(255) NULL
);
GO