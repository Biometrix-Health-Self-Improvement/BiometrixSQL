USE [Biometrix]
GO
if Object_ID('MedicationUpdate') is NOT NULL
BEGIN
DROP PROCEDURE MedicationUpdate
END
GO

CREATE PROCEDURE MedicationUpdate @UserID VARCHAR(50), @LocalMedicationID VARCHAR(50), 
@Date DATE, @Time TIME, @BrandName VARCHAR(255), @Prescriber VARCHAR(255), @Dose VARCHAR(255), @Instructions VARCHAR(255), 
@Warnings VARCHAR(255), @Notes VARCHAR(255), @WebMedicationID VARCHAR(50)
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

Update dbo.Medication
SET [LocalMedicationID] = @LocalMedicationID2, [Date] = @Date, [Time] = @Time, [BrandName] = @BrandName, 
[Prescriber] = @Prescriber, [Dose] = @Dose, [Instructions] = @Instructions, [Warnings] = @Warnings, [Notes] = @Notes
Where [WebMedicationID] = @WebMedicationID2 AND [UserID] = @UserID2
Select @@RowCount as NumRows
GO