Use Biometrix
GO
if Object_ID('SleepInsert') is NOT NULL
BEGIN
DROP PROCEDURE SleepInsert
END
GO

CREATE PROCEDURE SleepInsert @UserID VARCHAR(50), @LocalSleepID VARCHAR(50), @Date DATE, 
@Time TIME, @Duration TIME, @Quality VARCHAR(50), @Notes VARCHAR(300), @Health VARCHAR(20)
AS

DECLARE @UserID2 INT;
DECLARE @LocalSleepID2 INT;
DECLARE @Quality2 INT;


Set @UserID2 = TRY_CONVERT(INT, @UserID);
Set @LocalSleepID2 = TRY_CONVERT(INT, @LocalSleepID);
Set @Quality2 = TRY_CONVERT(INT, @Quality);

IF @UserID = ''
BEGIN
	Set @UserID2 = NULL;
END

IF @LocalSleepID = ''
BEGIN
	Set @LocalSleepID2 = NULL;
END

IF @Quality = ''
BEGIN
	Set @Quality2 = NULL;
END

Insert Into dbo.Sleep
([UserID], [LocalSleepID], [Date], [Time], [Duration], [Quality], [Notes], [Health])
Values
(@UserID2, @LocalSleepID2, @Date, @Time, @Duration, @Quality2, @Notes, @Health)

GO

