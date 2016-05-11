USE [Biometrix]
GO
if Object_ID('ExerciseUpdate') is NOT NULL
BEGIN
DROP PROCEDURE ExerciseUpdate
END
GO

CREATE PROCEDURE ExerciseUpdate @UserID VARCHAR(50), @LocalExerciseID VARCHAR(50), @Title VARCHAR(255), 
@Type VARCHAR(140), @Minutes VARCHAR(50), @Inty VARCHAR(50), @Notes VARCHAR(255), @DateEx DATE, @TimeEx TIME, 
@WebExerciseID VARCHAR(50)
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

DECLARE @WebExerciseID2 INT;
SET @WebExerciseID2 = TRY_CONVERT(INT, @WebExerciseID);
IF @WebExerciseID = ''
BEGIN
	SET @WebExerciseID2 = NULL;
END

Update dbo.Exercise
SET [LocalExerciseID] = @LocalExerciseID2, [Title] = @Title, [Type] = @Type, [Minutes] = @Minutes2, [Inty] = @Inty2, 
[Notes] = @Notes, [DateEx] = @DateEx, [TimeEx] = @TimeEx
Where [WebExerciseID] = @WebExerciseID2 AND [UserID] = @UserID2
Select @@RowCount as NumRows, @WebExerciseID2 as WebID
GO