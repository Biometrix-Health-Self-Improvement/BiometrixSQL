USE [Biometrix]
GO
if Object_ID('ExerciseInsert') is NOT NULL
BEGIN
DROP PROCEDURE ExerciseInsert
END
GO

CREATE PROCEDURE ExerciseInsert @UserID VARCHAR(50), @LocalExerciseID VARCHAR(50), @Title VARCHAR(255), 
@Type VARCHAR(140), @Minutes VARCHAR(50), @Inty VARCHAR(50), @Notes VARCHAR(255), @DateEx DATE, @TimeEx VARCHAR(50)
AS

DECLARE @UserID2 INT;
SET @UserID2 = TRY_CONVERT(INT, @UserID);
IF @UserID = ''
BEGIN
	SET @UserID2 = NULL;
END

DECLARE @LocalExerciseID2 INT;
SET @LocalExerciseID2 = TRY_CONVERT(INT, @LocalExerciseID);
IF @LocalExerciseID = ''
BEGIN
	SET @LocalExerciseID2 = NULL;
END

DECLARE @Minutes2 TINYINT;
SET @Minutes2 = TRY_CONVERT(TINYINT, @Minutes);
IF @Minutes = ''
BEGIN
	SET @Minutes2 = NULL;
END

DECLARE @Inty2 TINYINT;
SET @Inty2 = TRY_CONVERT(TINYINT, @Inty);
IF @Inty = ''
BEGIN
	SET @Inty2 = NULL;
END

Insert Into dbo.Exercise
([UserID], [LocalExerciseID], [Title], [Type], [Minutes], [Inty], [Notes], [DateEx], [TimeEx])
Values
(@UserID2, @LocalExerciseID2, @Title, @Type, @Minutes2, @Inty2, @Notes, @DateEx, @TimeEx)

Select [LocalExerciseID], [WebExerciseID] From dbo.Exercise
Where [UserID] = @UserID2 AND [LocalExerciseID] = @LocalExerciseID2
GO