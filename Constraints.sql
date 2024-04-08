USE PATIENT_MANAGEMENT;

--Appointment date is in future
ALTER TABLE Appointment
ADD CONSTRAINT check_future_appointment_date
CHECK (Appointment_Date > GETDATE());

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

