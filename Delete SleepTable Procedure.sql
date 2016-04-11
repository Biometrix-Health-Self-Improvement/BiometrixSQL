USE [Biometrix]
GO
if Object_ID('SleepDelete') is NOT NULL
BEGIN
DROP PROCEDURE SleepDelete
END
GO

CREATE PROCEDURE SleepDelete @UserID VARCHAR(50), @LocalSleepID VARCHAR(50), @WebSleepID VARCHAR(50)
AS

DECLARE @UserID2 INT;
SET @UserID2 = TRY_CONVERT(INT, @UserID);
IF @UserID = ''
BEGIN
	SET @UserID2 = NULL;
END

DECLARE @LocalSleepID2 INT;
SET @LocalSleepID2 = TRY_CONVERT(INT, @LocalSleepID);
IF @LocalSleepID = ''
BEGIN
	SET @LocalSleepID2 = NULL;
END

DECLARE @WebSleepID2 INT;
SET @WebSleepID2 = TRY_CONVERT(INT, @WebSleepID);
IF @WebSleepID = ''
BEGIN
	SET @WebSleepID2 = NULL;
END

Delete dbo.Sleep
WHERE [WebSleepID] = @WebSleepID2 AND [UserID] = @UserID2 AND [LocalSleepID] = @LocalSleepID

GO