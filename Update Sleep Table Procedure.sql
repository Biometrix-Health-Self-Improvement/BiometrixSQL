USE [Biometrix]
GO
if Object_ID('SleepUpdate') is NOT NULL
BEGIN
DROP PROCEDURE SleepUpdate
END
GO

CREATE PROCEDURE SleepUpdate @UserID VARCHAR(50), @LocalSleepID VARCHAR(50), @Date DATE, 
@Time TIME, @Duration TIME, @Quality VARCHAR(50), @Notes VARCHAR(300), @Health VARCHAR(20), @WebSleepID VARCHAR(50)
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

DECLARE @Quality2 INT;
SET @Quality2 = TRY_CONVERT(INT, @Quality);
IF @Quality = ''
BEGIN
	SET @Quality2 = NULL;
END

DECLARE @WebSleepID2 INT;
SET @WebSleepID2 = TRY_CONVERT(INT, @WebSleepID);
IF @WebSleepID = ''
BEGIN
	SET @WebSleepID2 = NULL;
END

Update dbo.Sleep
SET [LocalSleepID] = @LocalSleepID2, [Date] = @Date, [Time] = @Time, [Duration] = @Duration, [Quality] = @Quality2, 
[Notes] = @Notes, [Health] = @Health
Where [WebSleepID] = @WebSleepID2 AND [UserID] = @UserID2

GO