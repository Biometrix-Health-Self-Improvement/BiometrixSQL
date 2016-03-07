Use Biometrix
GO
if Object_ID('MoodUpdate') is NOT NULL
BEGIN
DROP PROCEDURE MoodUpdate
END
GO

CREATE PROCEDURE MoodUpdate @UserID VARCHAR(50), @LocalMoodID Varchar(50),
@Date Date, @Time Time, @Depression VARCHAR(50), @Elevated VARCHAR(50), 
@Irritable VARCHAR(50), @Anxiety VARCHAR(50), @Notes VARCHAR(255),
@WebMoodID VARCHAR(50)
AS

DECLARE @UserID2 INT;
DECLARE @LocalMoodID2 INT;
DECLARE @WebMoodID2 INT;


Set @UserID2 = TRY_CONVERT(INT, @UserID);
Set @LocalMoodID2 = TRY_CONVERT(INT, @LocalMoodID);
Set @WebMoodID2 = TRY_CONVERT(INT, @WebMoodID);


IF @UserID = ''
BEGIN
	Set @UserID2 = NULL;
END
IF @LocalMoodID = ''
BEGIN
	Set @LocalMoodID2 = NULL;
END
IF @WebMoodID = ''
BEGIN
	Set @WebMoodID2 = NULL;
END

Update dbo.Mood
Set [LocalMoodID] = @LocalMoodID2, [Date] = @Date, [Time] = @Time, [Depression] = @Depression, [Elevated] = @Elevated, [Irritable] = @Irritable, [Anxiety] = @Anxiety, [Notes] = @Notes
WHERE [UserID] = @UserID2 AND [WebMoodID] = @WebMoodID2
GO

