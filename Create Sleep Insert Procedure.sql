Use Biometrix
GO
if Object_ID('SleepInsert') is NOT NULL
BEGIN
DROP PROCEDURE SleepInsert
END
GO

CREATE PROCEDURE SleepInsert @UserID INT, @LocalSleepID INT, @Date DATE, 
@Time TIME, @Duration TIME, @Quality INT, @Notes VARCHAR(300), @Health VARCHAR(20)
AS

Insert Into dbo.Sleep
([UserID], [LocalSleepID], [Date], [Time], [Duration], [Quality], [Notes], [Health])
Values
(@UserID, @LocalSleepID, @Date, @Time, @Duration, @Quality, @Notes, @Health)

GO

