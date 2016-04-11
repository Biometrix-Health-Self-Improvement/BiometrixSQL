USE [Biometrix]
GO
if Object_ID('MedicationDelete') is NOT NULL
BEGIN
DROP PROCEDURE MedicationDelete
END
GO

CREATE PROCEDURE MedicationDelete @UserID VARCHAR(50), @LocalMedicationID VARCHAR(50), 
@WebMedicationID VARCHAR(50)
AS

DECLARE @UserID2 INT;
SET @UserID2 = TRY_CONVERT(INT, @UserID);
IF @UserID = ''
BEGIN
	SET @UserID2 = NULL;
END

DECLARE @LocalMedicationID2 INT;
SET @LocalMedicationID2 = TRY_CONVERT(INT, @LocalMedicationID);
IF @LocalMedicationID = ''
BEGIN
	SET @LocalMedicationID2 = NULL;
END

DECLARE @WebMedicationID2 INT;
SET @WebMedicationID2 = TRY_CONVERT(INT, @WebMedicationID);
IF @WebMedicationID = ''
BEGIN
	SET @WebMedicationID2 = NULL;
END

Delete dbo.Medication
WHERE [WebMedicationID] = @WebMedicationID2 AND [UserID] = @UserID2 AND [LocalMedicationID] = @LocalMedicationID

GO