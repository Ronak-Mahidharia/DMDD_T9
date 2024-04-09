USE PATIENT_MANAGEMENT;

ALTER TABLE Patient
ADD CONSTRAINT CHK_Patient_DOB
CHECK (DOB <= GETDATE() AND DOB > DATEADD(YEAR, -100, GETDATE()));

--Appointment date is in future
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


-- Query which wont work now
--INSERT INTO Appointment (Appointment_Date, Patient_ID, Doctor_ID,Purpose,Status) VALUES (DATEADD(day, -3, GETDATE()), 1, 2,'regular Checkup','Scheduled');


--policy number format check
ALTER TABLE Insurance
ADD CONSTRAINT check_policy_number_format
CHECK (Policy_Number LIKE 'POL-[0-9][0-9][0-9]');

-- Query which wont work now
--INSERT INTO Insurance (Patient_ID, Policy_Number, Company_Name, Coverage_Details, Validity_Period) Values (1, 'PO-021', 'DEF Insurance', 'Health, Dental', '2024-11-30')

--Patient_id in medical history
ALTER TABLE Medical_History
ADD CONSTRAINT fk_patient_id FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID);

