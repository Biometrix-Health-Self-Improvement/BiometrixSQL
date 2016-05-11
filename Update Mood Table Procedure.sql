USE [Biometrix]
GO
if Object_ID('MoodUpdate') is NOT NULL
BEGIN
DROP PROCEDURE MoodUpdate
END
GO

CREATE PROCEDURE MoodUpdate @UserID VARCHAR(50), @LocalMoodID VARCHAR(50), @Date DATE, 
@Time TIME, @Depression VARCHAR(50), @Elevated VARCHAR(50), @Irritable VARCHAR(50), @Anxiety VARCHAR(50), 
@Sad VARCHAR(50), @Happy VARCHAR(50), @Anger VARCHAR(50), @Notes VARCHAR(255), @WebMoodID VARCHAR(50)
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

DECLARE @WebMoodID2 INT;
SET @WebMoodID2 = TRY_CONVERT(INT, @WebMoodID);
IF @WebMoodID = ''
BEGIN
	SET @WebMoodID2 = NULL;
END

Update dbo.Mood
SET [LocalMoodID] = @LocalMoodID2, [Date] = @Date, [Time] = @Time, [Depression] = @Depression2, [Elevated] = @Elevated2, 
[Irritable] = @Irritable2, [Anxiety] = @Anxiety2, [Sad] = @Sad2, [Happy] = @Happy2, [Anger] = @Anger2, 
[Notes] = @Notes
Where [WebMoodID] = @WebMoodID2 AND [UserID] = @UserID2
Select @@RowCount as NumRows, @WebMoodID2 as WebID
GO