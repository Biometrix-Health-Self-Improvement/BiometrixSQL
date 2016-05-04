USE [Biometrix]
GO
if Object_ID('SleepInsert') is NOT NULL
BEGIN
DROP PROCEDURE SleepInsert
END
GO

CREATE PROCEDURE SleepInsert @UserID VARCHAR(50), @LocalSleepID VARCHAR(50), @Date DATE, 
@Time TIME, @Duration TIME, @Quality VARCHAR(50), @Notes VARCHAR(300)
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

Insert Into dbo.Sleep
([UserID], [LocalSleepID], [Date], [Time], [Duration], [Quality], [Notes])
Values
(@UserID2, @LocalSleepID2, @Date, @Time, @Duration, @Quality2, @Notes)

Select [LocalSleepID], [WebSleepID] From dbo.Sleep
Where [UserID] = @UserID2 AND [LocalSleepID] = @LocalSleepID2
GO