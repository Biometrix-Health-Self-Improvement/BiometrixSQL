Use Biometrix
GO
if Object_ID('ExerciseInsert') is NOT NULL
BEGIN
DROP PROCEDURE ExerciseInsert
END
GO

CREATE PROCEDURE ExerciseInsert @UserID INT, @Title VARCHAR(255), @Type VARCHAR(140), @MINUTES TINYINT,
@Reps TINYINT, @Laps TINYINT, @Weight SMALLINT, @Inty TINYINT, @Notes VARCHAR(255), @DateEx DATE, @TimeEx Varchar(50)
AS

Insert Into dbo.Exercise
([UserID], [Title], [Type], [Minutes], [Reps], [Laps], [Weight], [Inty], [Notes], [DateEx], [TimeEx])
Values
(@UserID, @Title, @Type, @Minutes, @Reps, @Laps, @Weight, @Inty, @Notes, @DateEx, @TimeEx)

GO

