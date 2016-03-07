Use Biometrix
GO
if Object_ID('SleepUpdate') is NOT NULL
BEGIN
DROP PROCEDURE SleepUpdate
END
GO

CREATE PROCEDURE SleepUpdate @UserID VARCHAR(50), @LocalSleepID VARCHAR(50), @Date DATE, 
@Time TIME, @Duration TIME, @Quality VARCHAR(50), @Notes VARCHAR(300), @Health VARCHAR(20),
@WebSleepID VARCHAR(50)
AS

DECLARE @UserID2 INT;
DECLARE @LocalSleepID2 INT;
DECLARE @Quality2 INT;
DECLARE @WebSleepID2 INT;


Set @UserID2 = TRY_CONVERT(INT, @UserID);
Set @LocalSleepID2 = TRY_CONVERT(INT, @LocalSleepID);
Set @Quality2 = TRY_CONVERT(INT, @Quality);
Set @WebSleepID2 = TRY_CONVERT(INT, @WebSleepID);

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

IF @WebSleepID = ''
BEGIN
	Set @WebSleepID2 = NULL;
END

Update dbo.Sleep
Set [LocalSleepID] = @LocalSleepID2, [Date] =@Date, [Time] =@Time, [Duration] =@Duration, [Quality] = @Quality2, [Notes] = @Notes, [Health] = @Health
WHERE [UserID] = @UserID2 AND [WebSleepID] = @WebSleepID2


GO

