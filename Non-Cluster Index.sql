--PATIENT
CREATE NONCLUSTERED INDEX idx_patient_last_name ON Patient(Last_Name);
CREATE NONCLUSTERED INDEX idx_patient_dob ON Patient(DOB);
CREATE NONCLUSTERED INDEX idx_patient_email ON Patient(Email);

--APPOINMENT
CREATE NONCLUSTERED INDEX idx_appointment_date ON Appointment(Appointment_Date);
CREATE NONCLUSTERED INDEX idx_appointment_patient_id ON Appointment(Patient_ID);
CREATE NONCLUSTERED INDEX idx_appointment_doctor_id ON Appointment(Doctor_ID);

--DOCTOR
CREATE NONCLUSTERED INDEX idx_doctor_email_id ON Doctor(Email_ID);
CREATE NONCLUSTERED INDEX idx_doctor_first_name_last_name
	ON Doctor (First_Name, Last_Name);

