Use Biometrix
GO
if Object_ID('ExerciseInsert') is NOT NULL
BEGIN
DROP PROCEDURE ExerciseInsert
END
GO

CREATE PROCEDURE ExerciseInsert @UserID VARCHAR(50), @Title VARCHAR(255), @Type VARCHAR(140), @Minutes VARCHAR(50),
@Reps VARCHAR(50), @Laps VARCHAR(50), @Weight VARCHAR(50), @Inty VARCHAR(50), @Notes VARCHAR(255), @DateEx DATE, @TimeEx Varchar(50)
AS

DECLARE @UserID2 INT;
DECLARE @Minutes2 TINYINT;
DECLARE @Reps2 TINYINT;
DECLARE @Laps2 TINYINT;
DECLARE @Weight2 SMALLINT;
DECLARE @Inty2 TINYINT;


Set @UserID2 = TRY_CONVERT(INT, @UserID);
Set @Minutes2 = TRY_CONVERT(TINYINT, @Type);
Set @Reps2 = TRY_CONVERT(TINYINT, @Reps);
Set @Laps2 = TRY_CONVERT(TINYINT, @Laps);
Set @Weight2 = TRY_CONVERT(SMALLINT, @Weight);
Set @Inty2 = TRY_CONVERT(TINYINT, @Inty);

IF @UserID2 = 0
BEGIN
	Set @UserID2 = NULL;
END

IF @Minutes2 = 0
BEGIN
	Set @Minutes2 = NULL;
END

IF @Reps2 = 0
BEGIN
	Set @Reps2 = NULL;
END

IF @Laps2 = 0
BEGIN
	Set @Laps2 = NULL;
END

IF @Weight2 = 0
BEGIN
	Set @Weight2 = NULL;
END

IF @Inty2 = 0
BEGIN
	Set @Inty2 = NULL;
END



Insert Into dbo.Exercise
([UserID], [Title], [Type], [Minutes], [Reps], [Laps], [Weight], [Inty], [Notes], [DateEx], [TimeEx])
Values
(@UserID2, @Title, @Type, @Minutes2, @Reps2, @Laps2, @Weight2, @Inty2, @Notes, @DateEx, @TimeEx)

GO

