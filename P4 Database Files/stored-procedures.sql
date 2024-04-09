CREATE PROCEDURE GetDoctorAvailability
    @Doctor_ID INT,
    @Appointment_Date DATE,
    @AvailableSlots INT OUTPUT
AS
BEGIN
    DECLARE @TotalSlots INT

    -- Assuming each appointment slot is 30 minutes
    SET @TotalSlots = 16

    -- Subtract booked appointments on the given date
    SELECT @AvailableSlots = @TotalSlots - COUNT(*)
    FROM Appointment
    WHERE Doctor_ID = @Doctor_ID
    AND Appointment_Date = @Appointment_Date
END

CREATE PROCEDURE GeneratePatientReport
    @Patient_ID INT,
    @ReportText NVARCHAR(MAX) OUTPUT
AS
BEGIN
    SET @ReportText = ''

    -- Append patient general history
    SELECT @ReportText = @ReportText + 'Patient General History:' + CHAR(13) + CHAR(10)
    SELECT @ReportText = @ReportText + 'Date of Visit: ' + CONVERT(NVARCHAR(MAX), Date_Of_Visit) + CHAR(13) + CHAR(10)
                         + 'Doctor Note: ' + CONVERT(NVARCHAR(MAX), ISNULL(Doctor_Note, '')) + CHAR(13) + CHAR(10)
    FROM PatientGeneralHistory
    WHERE PGRecord_ID IN (SELECT Record_ID FROM Medical_History WHERE Patient_ID = @Patient_ID)

    -- Append patient diseases history
    SELECT @ReportText = @ReportText + CHAR(13) + CHAR(10) + 'Patient Diseases History:' + CHAR(13) + CHAR(10)
    SELECT @ReportText = @ReportText + 'Disease ID: ' + CONVERT(NVARCHAR(MAX), Disease_ID) + CHAR(13) + CHAR(10)
                         + 'Symptoms: ' + CONVERT(NVARCHAR(MAX), ISNULL(Symptoms, '')) + CHAR(13) + CHAR(10)
    FROM PatientDiseasesHistory
    WHERE PDRecord_ID IN (SELECT Record_ID FROM Medical_History WHERE Patient_ID = @Patient_ID)

    -- Append patient vaccine history
    SELECT @ReportText = @ReportText + CHAR(13) + CHAR(10) + 'Patient Vaccine History:' + CHAR(13) + CHAR(10)
    SELECT @ReportText = @ReportText + 'Vaccine ID: ' + CONVERT(NVARCHAR(MAX), Vaccine_ID) + CHAR(13) + CHAR(10)
                         + 'Date of Vaccination: ' + CONVERT(NVARCHAR(MAX), Date_Of_Vaccination) + CHAR(13) + CHAR(10)
    FROM PatientVaccineHistory
    WHERE PVRecord_ID IN (SELECT Record_ID FROM Medical_History WHERE Patient_ID = @Patient_ID)
END

CREATE PROCEDURE GetPatientInfo
    @First_Name VARCHAR(50),
    @Last_Name VARCHAR(50),
    @DOB DATE,
    @PatientInfo NVARCHAR(MAX) OUTPUT
AS
BEGIN
    SET @PatientInfo = ''

    -- Check if the patient exists
    IF EXISTS (SELECT 1 FROM Patient WHERE First_Name = @First_Name AND Last_Name = @Last_Name AND DOB = @DOB)
    BEGIN
        -- Retrieve patient details
        SELECT @PatientInfo = 'Patient Found:' + CHAR(13) + CHAR(10) +
                              'First Name: ' + First_Name + CHAR(13) + CHAR(10) +
                              'Last Name: ' + Last_Name + CHAR(13) + CHAR(10) +
                              'DOB: ' + CONVERT(VARCHAR, DOB, 101)
        FROM Patient
        WHERE First_Name = @First_Name AND Last_Name = @Last_Name AND DOB = @DOB
    END
    ELSE
    BEGIN
        SET @PatientInfo = 'Patient Not Found'
    END
END

CREATE PROCEDURE GetPatientInsuranceDetails
    @Patient_ID INT,
    @InsuranceDetails NVARCHAR(MAX) OUTPUT
AS
BEGIN
    SET @InsuranceDetails = ''

    SELECT @InsuranceDetails = @InsuranceDetails + 'Policy Number: ' + ISNULL(Policy_Number, '') + CHAR(13) + CHAR(10)
                                 + 'Company Name: ' + ISNULL(Company_Name, '') + CHAR(13) + CHAR(10)
                                 + 'Coverage Details: ' + ISNULL(Coverage_Details, '') + CHAR(13) + CHAR(10)
                                 + 'Validity Period: ' + CONVERT(NVARCHAR(MAX), Validity_Period) + CHAR(13) + CHAR(10)
    FROM Insurance
    WHERE Patient_ID = @Patient_ID
END

CREATE PROCEDURE DeleteDoctorAppointment
    @Doctor_ID INT,
    @DeletedCount INT OUTPUT
AS
BEGIN
    SET @DeletedCount = 0

    DELETE FROM Appointment
    WHERE Doctor_ID = @Doctor_ID

    SET @DeletedCount = @@ROWCOUNT
END

