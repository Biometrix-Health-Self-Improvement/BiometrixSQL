Use Biometrix
GO
if Object_ID('MoodInsert') is NOT NULL
BEGIN
DROP PROCEDURE MoodInsert
END
GO

CREATE PROCEDURE MoodInsert @UserID VARCHAR(50), @LocalMoodID Varchar(50),
@Date Date, @Time Time, @Depression VARCHAR(50), @Elevated VARCHAR(50), 
@Irritable VARCHAR(50), @Anxiety VARCHAR(50), @Notes VARCHAR(255)
AS

DECLARE @UserID2 INT;
DECLARE @LocalMoodID2 INT;


Set @UserID2 = TRY_CONVERT(INT, @UserID);
Set @LocalMoodID2 = TRY_CONVERT(INT, @LocalMoodID);


IF @UserID = ''
BEGIN
	Set @UserID2 = NULL;
END
IF @LocalMoodID = ''
BEGIN
	Set @LocalMoodID2 = NULL;
END

Insert Into dbo.Mood
([UserID], [LocalMoodID], [Date], [Time], [Depression], [Elevated], [Irritable], [Anxiety], [Notes])
Values
(@UserID2, @LocalMoodID2, @Date, @Time, @Depression, @Elevated, @Irritable, @Anxiety, @Notes)


Select [LocalMoodID], [WebMoodID] From dbo.Mood
Where [UserID] = @UserID2 AND [LocalMoodID] = @LocalMoodID2
GO
