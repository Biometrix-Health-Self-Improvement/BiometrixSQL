Use Biometrix
GO
if Object_ID('DietInsert') is NOT NULL
BEGIN
DROP PROCEDURE DietInsert
END
GO

CREATE PROCEDURE DietInsert @UserID INT, @LocalDietID INT, @Date DATE, @FoodType VARCHAR(40), 
@Meal VARCHAR(20), @ServingSize VARCHAR(20), @Calories INT, @TotalFat INT, @SaturatedFat INT,
@TransFat INT, @Cholesterol INT, @Sodium INT, @TotalCarbs INT, @DietaryFiber INT, @Sugars INT,
@Protein INT, @VitaminA INT, @VitaminB INT, @Calcium INT, @Iron INT, @Notes VARCHAR(255)
AS

DECLARE @UserID2 INT;
Set @UserID2 = TRY_CONVERT(INT, @UserID);
IF @UserID = ''
BEGIN
    Set @UserID2 = NULL;
END
DECLARE @LocalDietID2 INT;
Set @LocalDietID2 = TRY_CONVERT(INT, @LocalDietID);
IF @LocalDietID = ''
BEGIN
    Set @LocalDietID2 = NULL;
END
DECLARE @Calories2 INT;
Set @Calories2 = TRY_CONVERT(INT, @Calories);
IF @Calories = ''
BEGIN
    Set @Calories2 = NULL;
END
DECLARE @TotalFat2 INT;
Set @TotalFat2 = TRY_CONVERT(INT, @TotalFat);
IF @TotalFat = ''
BEGIN
    Set @TotalFat2 = NULL;
END
DECLARE @SaturatedFat2 INT;
Set @SaturatedFat2 = TRY_CONVERT(INT, @SaturatedFat);
IF @SaturatedFat = ''
BEGIN
    Set @SaturatedFat2 = NULL;
END
DECLARE @TransFat2 INT;
Set @TransFat2 = TRY_CONVERT(INT, @TransFat);
IF @TransFat = ''
BEGIN
    Set @TransFat2 = NULL;
END
DECLARE @Cholesterol2 INT;
Set @Cholesterol2 = TRY_CONVERT(INT, @Cholesterol);
IF @Cholesterol = ''
BEGIN
    Set @Cholesterol2 = NULL;
END
DECLARE @Sodium2 INT;
Set @Sodium2 = TRY_CONVERT(INT, @Sodium);
IF @Sodium = ''
BEGIN
    Set @Sodium2 = NULL;
END
DECLARE @TotalCarbs2 INT;
Set @TotalCarbs2 = TRY_CONVERT(INT, @TotalCarbs);
IF @TotalCarbs = ''
BEGIN
    Set @TotalCarbs2 = NULL;
END
DECLARE @DietaryFiber2 INT;
Set @DietaryFiber2 = TRY_CONVERT(INT, @DietaryFiber);
IF @DietaryFiber = ''
BEGIN
    Set @DietaryFiber2 = NULL;
END
DECLARE @Sugars2 INT;
Set @Sugars2 = TRY_CONVERT(INT, @Sugars);
IF @Sugars = ''
BEGIN
    Set @Sugars2 = NULL;
END
DECLARE @Protein2 INT;
Set @Protein2 = TRY_CONVERT(INT, @Protein);
IF @Protein = ''
BEGIN
    Set @Protein2 = NULL;
END
DECLARE @VitaminA2 INT;
Set @VitaminA2 = TRY_CONVERT(INT, @VitaminA);
IF @VitaminA = ''
BEGIN
    Set @VitaminA2 = NULL;
END
DECLARE @VitaminB2 INT;
Set @VitaminB2 = TRY_CONVERT(INT, @VitaminB);
IF @VitaminB = ''
BEGIN
    Set @VitaminB2 = NULL;
END
DECLARE @Calcium2 INT;
Set @Calcium2 = TRY_CONVERT(INT, @Calcium);
IF @Calcium = ''
BEGIN
    Set @Calcium2 = NULL;
END
DECLARE @Iron2 INT;
Set @Iron2 = TRY_CONVERT(INT, @Iron);
IF @Iron = ''
BEGIN
    Set @Iron2 = NULL;
END


Insert Into dbo.Diet
([UserID], [LocalDietID], [Date], [FoodType], [Meal], [ServingSize], [Calories], [TotalFat],
[SaturatedFat], [TransFat], [Cholesterol], [Sodium], [TotalCarbohydrates], [DietaryFiber],
[Sugars], [Protein], [VitaminA], [VitaminB], [Calcium], [Iron], [Notes])
Values
(@UserID2, @LocalDietID2, @Date, @FoodType, @Meal, @ServingSize, @Calories2, @TotalFat2,
@SaturatedFat2, @TransFat2, @Cholesterol2, @Sodium2, @TotalCarbs2, @DietaryFiber2, 
@Sugars2, @Protein2, @VitaminA2, @VitaminB2, @Calcium2, @Iron2, @Notes)
GO

