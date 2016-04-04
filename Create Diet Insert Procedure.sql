USE [Biometrix]
GO
if Object_ID('DietInsert') is NOT NULL
BEGIN
DROP PROCEDURE DietInsert
END
GO

CREATE PROCEDURE DietInsert @UserID VARCHAR(50), @LocalDietID VARCHAR(50), @Date DATE, 
@FoodType VARCHAR(40), @Meal VARCHAR(20), @ServingSize VARCHAR(20), @Calories VARCHAR(50), @TotalFat VARCHAR(50), 
@SaturatedFat VARCHAR(50), @TransFat VARCHAR(50), @Cholesterol VARCHAR(50), @Sodium VARCHAR(50), 
@TotalCarbs VARCHAR(50), @DietaryFiber VARCHAR(50), @Sugars VARCHAR(50), @Protein VARCHAR(50), 
@VitaminA VARCHAR(50), @VitaminB VARCHAR(50), @Calcium VARCHAR(50), @Iron VARCHAR(50), @Notes VARCHAR(255)
AS

DECLARE @UserID2 INT;
SET @UserID2 = TRY_CONVERT(INT, @UserID);
IF @UserID = ''
BEGIN
	SET @UserID2 = NULL;
END

DECLARE @LocalDietID2 INT;
SET @LocalDietID2 = TRY_CONVERT(INT, @LocalDietID);
IF @LocalDietID = ''
BEGIN
	SET @LocalDietID2 = NULL;
END

DECLARE @Calories2 INT;
SET @Calories2 = TRY_CONVERT(INT, @Calories);
IF @Calories = ''
BEGIN
	SET @Calories2 = NULL;
END

DECLARE @TotalFat2 INT;
SET @TotalFat2 = TRY_CONVERT(INT, @TotalFat);
IF @TotalFat = ''
BEGIN
	SET @TotalFat2 = NULL;
END

DECLARE @SaturatedFat2 INT;
SET @SaturatedFat2 = TRY_CONVERT(INT, @SaturatedFat);
IF @SaturatedFat = ''
BEGIN
	SET @SaturatedFat2 = NULL;
END

DECLARE @TransFat2 INT;
SET @TransFat2 = TRY_CONVERT(INT, @TransFat);
IF @TransFat = ''
BEGIN
	SET @TransFat2 = NULL;
END

DECLARE @Cholesterol2 INT;
SET @Cholesterol2 = TRY_CONVERT(INT, @Cholesterol);
IF @Cholesterol = ''
BEGIN
	SET @Cholesterol2 = NULL;
END

DECLARE @Sodium2 INT;
SET @Sodium2 = TRY_CONVERT(INT, @Sodium);
IF @Sodium = ''
BEGIN
	SET @Sodium2 = NULL;
END

DECLARE @TotalCarbs2 INT;
SET @TotalCarbs2 = TRY_CONVERT(INT, @TotalCarbs);
IF @TotalCarbs = ''
BEGIN
	SET @TotalCarbs2 = NULL;
END

DECLARE @DietaryFiber2 INT;
SET @DietaryFiber2 = TRY_CONVERT(INT, @DietaryFiber);
IF @DietaryFiber = ''
BEGIN
	SET @DietaryFiber2 = NULL;
END

DECLARE @Sugars2 INT;
SET @Sugars2 = TRY_CONVERT(INT, @Sugars);
IF @Sugars = ''
BEGIN
	SET @Sugars2 = NULL;
END

DECLARE @Protein2 INT;
SET @Protein2 = TRY_CONVERT(INT, @Protein);
IF @Protein = ''
BEGIN
	SET @Protein2 = NULL;
END

DECLARE @VitaminA2 INT;
SET @VitaminA2 = TRY_CONVERT(INT, @VitaminA);
IF @VitaminA = ''
BEGIN
	SET @VitaminA2 = NULL;
END

DECLARE @VitaminB2 INT;
SET @VitaminB2 = TRY_CONVERT(INT, @VitaminB);
IF @VitaminB = ''
BEGIN
	SET @VitaminB2 = NULL;
END

DECLARE @Calcium2 INT;
SET @Calcium2 = TRY_CONVERT(INT, @Calcium);
IF @Calcium = ''
BEGIN
	SET @Calcium2 = NULL;
END

DECLARE @Iron2 INT;
SET @Iron2 = TRY_CONVERT(INT, @Iron);
IF @Iron = ''
BEGIN
	SET @Iron2 = NULL;
END

Insert Into dbo.Diet
([UserID], [LocalDietID], [Date], [FoodType], [Meal], [ServingSize], [Calories], [TotalFat], [SaturatedFat], 
[TransFat], [Cholesterol], [Sodium], [TotalCarbs], [DietaryFiber], [Sugars], [Protein], [VitaminA], [VitaminB], 
[Calcium], [Iron], [Notes])
Values
(@UserID2, @LocalDietID2, @Date, @FoodType, @Meal, @ServingSize, @Calories2, @TotalFat2, @SaturatedFat2, 
@TransFat2, @Cholesterol2, @Sodium2, @TotalCarbs2, @DietaryFiber2, @Sugars2, @Protein2, @VitaminA2, @VitaminB2, 
@Calcium2, @Iron2, @Notes)

Select [LocalDietID], [WebDietID] From dbo.Diet
Where [UserID] = @UserID2 AND [LocalDietID] = @LocalDietID2
GO