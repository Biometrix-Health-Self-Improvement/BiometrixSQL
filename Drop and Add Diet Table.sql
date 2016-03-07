USE [Biometrix]
GO

if Object_ID('[dbo].[Diet]') is NOT NULL
BEGIN
DROP TABLE [dbo].[Diet]
END
GO

CREATE TABLE [dbo].[Diet](
	[WebDietID] INT PRIMARY KEY Identity(1,1)
	, [UserID] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[LoginTable]
	, [LocalDietID] INT NULL
	, [Date] DATE NOT NULL
	, [FoodType] VARCHAR(40) NULL
	, [Meal] VARCHAR(20) NULL
	, [ServingSize] VARCHAR(20) NULL
	, [Calories] INT NULL
	, [TotalFat] INT NULL
	, [SaturatedFat] INT NULL
	, [TransFat] INT NULL
	, [Cholesterol] INT NULL
	, [Sodium] INT NULL
	, [TotalCarbs] INT NULL
	, [DietaryFiber] INT NULL
	, [Sugars] INT NULL
	, [Protein] INT NULL
	, [VitaminA] INT NULL
	, [VitaminB] INT NULL
	, [Calcium] INT NULL
	, [Iron] INT NULL
	, [Notes] VARCHAR(255) NULL
	);
GO
