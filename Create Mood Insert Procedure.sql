USE [Biometrix]
GO
if Object_ID('MoodInsert') is NOT NULL
BEGIN
DROP PROCEDURE MoodInsert
END
GO

CREATE PROCEDURE MoodInsert @UserID VARCHAR(50), @LocalMoodID VARCHAR(50), @Date DATE, 
@Time TIME, @Depression VARCHAR(50), @Elevated VARCHAR(50), @Irritable VARCHAR(50), @Anxiety VARCHAR(50), 
@Sad VARCHAR(50), @Happy VARCHAR(50), @Anger VARCHAR(50), @Notes VARCHAR(255)
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

DECLARE @Sad2 INT;
SET @Sad2 = TRY_CONVERT(INT, @Sad);
IF @Sad = ''
BEGIN
	SET @Sad2 = NULL;
END

DECLARE @Happy2 INT;
SET @Happy2 = TRY_CONVERT(INT, @Happy);
IF @Happy = ''
BEGIN
	SET @Happy2 = NULL;
END

DECLARE @Anger2 INT;
SET @Anger2 = TRY_CONVERT(INT, @Anger);
IF @Anger = ''
BEGIN
	SET @Anger2 = NULL;
END

Insert Into dbo.Mood
([UserID], [LocalMoodID], [Date], [Time], [Depression], [Elevated], [Irritable], [Anxiety], [Sad], [Happy], 
[Anger], [Notes])
Values
(@UserID2, @LocalMoodID2, @Date, @Time, @Depression2, @Elevated2, @Irritable2, @Anxiety2, @Sad2, @Happy2, 
@Anger2, @Notes)

Select [LocalMoodID], [WebMoodID] From dbo.Mood
Where [UserID] = @UserID2 AND [LocalMoodID] = @LocalMoodID2
GO