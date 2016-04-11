USE [Biometrix]
GO
if Object_ID('DietDelete') is NOT NULL
BEGIN
DROP PROCEDURE DietDelete
END
GO

CREATE PROCEDURE DietDelete @UserID VARCHAR(50), @LocalDietID VARCHAR(50), @WebDietID VARCHAR(50)
AS

DECLARE @UserID2 INT;
SET @UserID2 = TRY_CONVERT(INT, @UserID);
IF @UserID = ''
BEGIN
	SET @UserID2 = NULL;
END

DECLARE @LocalDietID2 INT;
SET @LocalDietID2 = TRY_CONVERT(INT, @LocalDietID);
IF @LocalDietID = ''
BEGIN
	SET @LocalDietID2 = NULL;
END

DECLARE @WebDietID2 INT;
SET @WebDietID2 = TRY_CONVERT(INT, @WebDietID);
IF @WebDietID = ''
BEGIN
	SET @WebDietID2 = NULL;
END

Delete dbo.Diet
WHERE [WebDietID] = @WebDietID2 AND [UserID] = @UserID2 AND [LocalDietID] = @LocalDietID

GO