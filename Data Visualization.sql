use PATIENT_MANAGEMENT;

CREATE OR ALTER VIEW ComprehensivePatientData AS
SELECT 
    P.Patient_ID, 
    P.First_Name AS Patient_First_Name, 
    P.Last_Name AS Patient_Last_Name, 
    P.DOB, 
    P.Gender, 
    P.Address, 
    P.Phone_Number AS Patient_Phone_Number, 
    P.Email AS Patient_Email, 
    D.Doctor_ID, 
    D.First_Name AS Doctor_First_Name, 
    D.Last_Name AS Doctor_Last_Name, 
    D.Specialization, 
    D.Email_ID AS Doctor_Email, 
    A.Appointment_ID, 
    A.Appointment_Date, 
    A.Purpose, 
    A.Status,
    MH.History_Type,
    MH.Record_ID AS Medical_Record_ID,
    PDH.Disease_ID,
    Dis.Name AS Disease_Name,
    Dis.Description AS Disease_Description,
    I.Policy_Number,
    I.Company_Name AS Insurance_Company,
    I.Coverage_Details,
    I.Validity_Period
FROM Patient P
JOIN Appointment A ON P.Patient_ID = A.Patient_ID
JOIN Doctor D ON A.Doctor_ID = D.Doctor_ID
LEFT JOIN Medical_History MH ON P.Patient_ID = MH.Patient_ID
LEFT JOIN PatientDiseasesHistory PDH ON MH.Record_ID = PDH.PDRecord_ID
LEFT JOIN Disease Dis ON PDH.Disease_ID = Dis.Disease_ID
LEFT JOIN Insurance I ON P.Patient_ID = I.Patient_ID;

select * from ComprehensivePatientData


drop view ComprehensivePatientData