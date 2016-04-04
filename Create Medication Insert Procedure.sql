USE [Biometrix]
GO
if Object_ID('MedicationInsert') is NOT NULL
BEGIN
DROP PROCEDURE MedicationInsert
END
GO

CREATE PROCEDURE MedicationInsert @UserID VARCHAR(50), @LocalMedicationID VARCHAR(50), 
@Date DATE, @Time TIME, @BrandName VARCHAR(255), @Prescriber VARCHAR(255), @Dose VARCHAR(255), @Instructions VARCHAR(255), 
@Warnings VARCHAR(255), @Notes VARCHAR(255)
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

Insert Into dbo.Medication
([UserID], [LocalMedicationID], [Date], [Time], [BrandName], [Prescriber], [Dose], [Instructions], [Warnings], 
[Notes])
Values
(@UserID2, @LocalMedicationID2, @Date, @Time, @BrandName, @Prescriber, @Dose, @Instructions, @Warnings, 
@Notes)

Select [LocalMedicationID], [WebMedicationID] From dbo.Medication
Where [UserID] = @UserID2 AND [LocalMedicationID] = @LocalMedicationID2
GO