CREATE DATABASE PATIENT_MANAGEMENT

USE PATIENT_MANAGEMENT;


CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY IDENTITY(1,1),
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    DOB DATE,
    Gender CHAR(1),
    Address VARCHAR(50),
    Phone_Number VARCHAR(15),
    Email VARCHAR(50)
);


CREATE TABLE Doctor (
    Doctor_ID INT PRIMARY KEY IDENTITY(1,1),
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Phone_Number VARCHAR(15),
    Specialization VARCHAR(50),
    Email_ID VARCHAR(50)
);


CREATE TABLE Appointment (
    Appointment_ID INT PRIMARY KEY IDENTITY(1,1),
    Patient_ID INT,
    Doctor_ID INT,
    Appointment_Date DATE,
    Purpose VARCHAR(50),
    Status VARCHAR(50),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);


CREATE TABLE Insurance (
    Insurance_ID INT PRIMARY KEY IDENTITY(1,1),
    Patient_ID INT,
    Policy_Number VARCHAR(50),
    Company_Name VARCHAR(50),
    Coverage_Details TEXT,
    Validity_Period DATE,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);


CREATE TABLE Medical_History (
    Record_ID INT PRIMARY KEY IDENTITY(1,1),
    Patient_ID INT,
    Doctor_ID INT,
    History_Type VARCHAR(50),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);


CREATE TABLE Prescription (
    Prescription_ID INT PRIMARY KEY IDENTITY(1,1),
    Record_ID INT,
    FOREIGN KEY (Record_ID) REFERENCES Medical_History(Record_ID)
);


CREATE TABLE Medicine (
    Medicine_ID INT PRIMARY KEY IDENTITY(1,1),
    Description TEXT,
    Name VARCHAR(50),
    Possible_Side_Effect VARCHAR(50)
);


CREATE TABLE PrescriptionMedicine (
    Prescription_ID INT,
    Medicine_ID INT,
    Dosage VARCHAR(50),
    Frequency VARCHAR(50),
    Duration VARCHAR(50),
    PRIMARY KEY (Prescription_ID, Medicine_ID),
    FOREIGN KEY (Prescription_ID) REFERENCES Prescription(Prescription_ID),
    FOREIGN KEY (Medicine_ID) REFERENCES Medicine(Medicine_ID)
);


CREATE TABLE Vaccine (
    Vaccine_ID INT PRIMARY KEY IDENTITY(1,1),
    Description TEXT,
    Name VARCHAR(50)
);


CREATE TABLE Disease (
    Disease_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Description TEXT
);


CREATE TABLE PatientAllergy (
    Allergy_ID INT,
    Patient_ID INT,
    Note TEXT,
    PRIMARY KEY (Allergy_ID, Patient_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);


CREATE TABLE Allergy (
    Allergy_ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50),
    Medication VARCHAR(50)
);


CREATE TABLE PatientGeneralHistory (
    PGRecord_ID INT PRIMARY KEY,
    Date_Of_Visit DATE,
    Doctor_Note TEXT,
    FOREIGN KEY (PGRecord_ID) REFERENCES Medical_History(Record_ID)
);


CREATE TABLE PatientDiseasesHistory (
    PDRecord_ID INT PRIMARY KEY,
    Disease_ID INT,
    Symptoms TEXT,
    FOREIGN KEY (PDRecord_ID) REFERENCES Medical_History(Record_ID)
);


CREATE TABLE PatientVaccineHistory (
    PVRecord_ID INT PRIMARY KEY,
    Vaccine_ID INT,
    Date_Of_Vaccination DATE,
    FOREIGN KEY (PVRecord_ID) REFERENCES Medical_History(Record_ID)
);


CREATE TABLE Family (
    Family_ID INT PRIMARY KEY IDENTITY(1,1),
    Patient_ID INT,
    Relative_Name VARCHAR(50),
    Relative_Relation VARCHAR(50),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);

ALTER TABLE Patient
ADD CONSTRAINT CHK_Patient_DOB
CHECK (DOB <= GETDATE() AND DOB > DATEADD(YEAR, -100, GETDATE()));

ALTER TABLE Appointment
ADD CONSTRAINT CHK_Appointment_Date
CHECK (Appointment_Date >= GETDATE() AND Appointment_Date < DATEADD(YEAR, 1, GETDATE()));

ALTER TABLE Patient
ADD CONSTRAINT CHK_Patient_Gender
CHECK (Gender IN ('M', 'F', 'O'));

ALTER TABLE Patient
ADD CONSTRAINT CHK_Patient_Email
CHECK (Email LIKE '%@%.%');

ALTER TABLE Insurance
ADD CONSTRAINT CHK_Insurance_Validity_Period
CHECK (Validity_Period >= GETDATE());


drop database PATIENT_MANAGEMENT

/* Q5

CREATE FUNCTION CheckInsuranceStatus(@ValidityPeriod DATE)
RETURNS VARCHAR(10)
AS
BEGIN
    DECLARE @Status VARCHAR(10)
    SET @Status = CASE 
                    WHEN @ValidityPeriod >= CAST(GETDATE() AS DATE) THEN 'Active'
                    ELSE 'Not Active'
                  END
    RETURN @Status
END


ALTER TABLE Insurance
ADD Status AS dbo.CheckInsuranceStatus(Validity_Period)

*/