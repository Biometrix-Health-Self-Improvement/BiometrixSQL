USE [Biometrix]
GO
if Object_ID('MoodDelete') is NOT NULL
BEGIN
DROP PROCEDURE MoodDelete
END
GO

CREATE PROCEDURE MoodDelete @UserID VARCHAR(50), @LocalMoodID VARCHAR(50), @WebMoodID VARCHAR(50)
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

DECLARE @WebMoodID2 INT;
SET @WebMoodID2 = TRY_CONVERT(INT, @WebMoodID);
IF @WebMoodID = ''
BEGIN
	SET @WebMoodID2 = NULL;
END

Delete dbo.Mood
WHERE [WebMoodID] = @WebMoodID2 AND [UserID] = @UserID2 AND [LocalMoodID] = @LocalMoodID
Select @@RowCount as NumRows
GO