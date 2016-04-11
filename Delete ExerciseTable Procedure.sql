USE [Biometrix]
GO
if Object_ID('ExerciseDelete') is NOT NULL
BEGIN
DROP PROCEDURE ExerciseDelete
END
GO

CREATE PROCEDURE ExerciseDelete @UserID VARCHAR(50), @LocalExerciseID VARCHAR(50), @WebExerciseID VARCHAR(50)
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

DECLARE @WebExerciseID2 INT;
SET @WebExerciseID2 = TRY_CONVERT(INT, @WebExerciseID);
IF @WebExerciseID = ''
BEGIN
	SET @WebExerciseID2 = NULL;
END

Delete dbo.Exercise
WHERE [WebExerciseID] = @WebExerciseID2 AND [UserID] = @UserID2 AND [LocalExerciseID] = @LocalExerciseID

GO