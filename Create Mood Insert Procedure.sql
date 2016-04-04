USE [Biometrix]
GO
if Object_ID('MoodInsert') is NOT NULL
BEGIN
DROP PROCEDURE MoodInsert
END
GO

CREATE PROCEDURE MoodInsert @UserID VARCHAR(50), @LocalMoodID VARCHAR(50), @Date DATE, 
@Time TIME, @Depression VARCHAR(50), @Elevated VARCHAR(50), @Irritable VARCHAR(50), @Anxiety VARCHAR(50), 
@Notes VARCHAR(255)
AS

DECLARE @UserID2 INT;
SET @UserID2 = TRY_CONVERT(INT, @UserID);
IF @UserID = ''
BEGIN
	SET @UserID2 = NULL;
END

DECLARE @LocalMoodID2 INT;
SET @LocalMoodID2 = TRY_CONVERT(INT, @LocalMoodID);
IF @LocalMoodID = ''
BEGIN
	SET @LocalMoodID2 = NULL;
END

DECLARE @Depression2 INT;
SET @Depression2 = TRY_CONVERT(INT, @Depression);
IF @Depression = ''
BEGIN
	SET @Depression2 = NULL;
END

DECLARE @Elevated2 INT;
SET @Elevated2 = TRY_CONVERT(INT, @Elevated);
IF @Elevated = ''
BEGIN
	SET @Elevated2 = NULL;
END

DECLARE @Irritable2 INT;
SET @Irritable2 = TRY_CONVERT(INT, @Irritable);
IF @Irritable = ''
BEGIN
	SET @Irritable2 = NULL;
END

DECLARE @Anxiety2 INT;
SET @Anxiety2 = TRY_CONVERT(INT, @Anxiety);
IF @Anxiety = ''
BEGIN
	SET @Anxiety2 = NULL;
END

Insert Into dbo.Mood
([UserID], [LocalMoodID], [Date], [Time], [Depression], [Elevated], [Irritable], [Anxiety], [Notes])
Values
(@UserID2, @LocalMoodID2, @Date, @Time, @Depression2, @Elevated2, @Irritable2, @Anxiety2, @Notes)

Select [LocalMoodID], [WebMoodID] From dbo.Mood
Where [UserID] = @UserID2 AND [LocalMoodID] = @LocalMoodID2
GO