Use Biometrix
GO
if Object_ID('ExerciseUpdate') is NOT NULL
BEGIN
DROP PROCEDURE ExerciseUpdate
END
GO

CREATE PROCEDURE ExerciseUpdate @UserID VARCHAR(50), @LocalExerciseID Varchar(50), @Title VARCHAR(255), @Type VARCHAR(140), @Minutes VARCHAR(50),
@Reps VARCHAR(50), @Laps VARCHAR(50), @Weight VARCHAR(50), @Inty VARCHAR(50), @Notes VARCHAR(255), @DateEx DATE, @TimeEx Varchar(50),
@WebExerciseID VARCHAR(50)
AS

DECLARE @UserID2 INT;
DECLARE @LocalExerciseID2 INT;
DECLARE @Minutes2 TINYINT;
DECLARE @Reps2 TINYINT;
DECLARE @Laps2 TINYINT;
DECLARE @Weight2 SMALLINT;
DECLARE @Inty2 TINYINT;
DECLARE @WebExerciseID2 INT;


Set @UserID2 = TRY_CONVERT(INT, @UserID);
Set @LocalExerciseID2 = TRY_CONVERT(INT, @LocalExerciseID);
Set @Minutes2 = TRY_CONVERT(TINYINT, @Type);
Set @Reps2 = TRY_CONVERT(TINYINT, @Reps);
Set @Laps2 = TRY_CONVERT(TINYINT, @Laps);
Set @Weight2 = TRY_CONVERT(SMALLINT, @Weight);
Set @Inty2 = TRY_CONVERT(TINYINT, @Inty);
Set @WebExerciseID2 = TRY_CONVERT(INT, @WebExerciseID);

IF @UserID = ''
BEGIN
	Set @UserID2 = NULL;
END

IF @LocalExerciseID = ''
BEGIN
	Set @LocalExerciseID2 = NULL;
END

IF @Minutes = ''
BEGIN
	Set @Minutes2 = NULL;
END

IF @Reps = ''
BEGIN
	Set @Reps2 = NULL;
END

IF @Laps = ''
BEGIN
	Set @Laps2 = NULL;
END

IF @Weight = ''
BEGIN
	Set @Weight2 = NULL;
END

IF @Inty = ''
BEGIN
	Set @Inty2 = NULL;
END

IF @WebExerciseID = ''
BEGIN
	Set @WebExerciseID2 = NULL;
END

Update dbo.Exercise
Set [LocalExerciseID] = @LocalExerciseID2, [Title] = @Title, [Type] = @Type, [Minutes] = @Minutes2, [Reps] = @Reps2, [Laps] = @Laps2, [Weight] = @Weight2, [Inty] = @Inty2, [Notes] = @Notes, [DateEx] = @DateEx, [TimeEx] = @TimeEx
WHERE [UserID] = @UserID2 AND [WebExerciseID] = @WebExerciseID2

GO

