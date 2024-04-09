CREATE VIEW PatientAppointmentView AS
SELECT p.Patient_ID, p.First_Name, p.Last_Name, p.Gender, p.DOB,
       a.Appointment_ID, a.Appointment_Date, a.Purpose, a.Status
FROM Patient p
INNER JOIN Appointment a ON p.Patient_ID = a.Patient_ID
WHERE a.Appointment_Date >= GETDATE()

CREATE VIEW DoctorScheduleView AS
SELECT d.Doctor_ID, d.First_Name, d.Last_Name, d.Specialization,
       a.Appointment_ID, a.Appointment_Date, a.Purpose, a.Status
FROM Doctor d
LEFT JOIN Appointment a ON d.Doctor_ID = a.Doctor_ID

CREATE VIEW PrescriptionDetailsView AS
SELECT p.Patient_ID, p.First_Name, p.Last_Name,
       pr.Prescription_ID, pr.Record_ID,
       m.Medicine_ID, m.Name AS Medicine_Name, m.Description AS Medicine_Description,
       pm.Dosage, pm.Frequency, pm.Duration
FROM Patient p
INNER JOIN Medical_History mh ON p.Patient_ID = mh.Patient_ID
INNER JOIN Prescription pr ON mh.Record_ID = pr.Record_ID
INNER JOIN PrescriptionMedicine pm ON pr.Prescription_ID = pm.Prescription_ID
INNER JOIN Medicine m ON pm.Medicine_ID = m.Medicine_ID

CREATE VIEW DoctorSpecializationView AS
SELECT Doctor_ID, First_Name, Last_Name, Phone_Number, Specialization, Email_ID AS Email
FROM Doctor;

CREATE VIEW DoctorPatientCountView AS
SELECT D.Doctor_ID, D.First_Name, D.Last_Name, D.Specialization, D.Phone_Number, D.Email_ID AS Email,
       COUNT(A.Patient_ID) AS Patient_Count
FROM Doctor D
LEFT JOIN Appointment A ON D.Doctor_ID = A.Doctor_ID
GROUP BY D.Doctor_ID, D.First_Name, D.Last_Name, D.Specialization, D.Phone_Number, D.Email_ID;
