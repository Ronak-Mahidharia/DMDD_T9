--data encryption
ALTER TABLE Patient
DROP COLUMN Email_Encrypted;

select * from patient

USE PATIENT_MANAGEMENT;
GO

-- Add EncryptedEmail column to the Patient table
ALTER TABLE Patient ADD EncryptedEmail VARBINARY(MAX);
GO

-- Create a master key for the database
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'admin@123';
GO

-- Create a self-signed certificate named PatientEmailCert
CREATE CERTIFICATE PatientEmailCert WITH SUBJECT = 'Patient Email Encryption';
GO

-- Create a symmetric key using AES 256 encryption algorithm and protect it with the certificate
CREATE SYMMETRIC KEY PatientEmailKey WITH ALGORITHM = AES_256 ENCRYPTION BY CERTIFICATE PatientEmailCert;
GO

-- Open the symmetric key and encrypt the Email column
OPEN SYMMETRIC KEY PatientEmailKey DECRYPTION BY CERTIFICATE PatientEmailCert;

UPDATE Patient SET EncryptedEmail = EncryptByKey(Key_GUID('PatientEmailKey'), Email);

CLOSE SYMMETRIC KEY PatientEmailKey;
GO

-- To decrypt and view the email, you must first open the symmetric key
OPEN SYMMETRIC KEY PatientEmailKey DECRYPTION BY CERTIFICATE PatientEmailCert;

SELECT Patient_ID, 
       Email,
       CONVERT(VARCHAR(50), DecryptByKey(EncryptedEmail)) AS DecryptedEmail
FROM Patient;

CLOSE SYMMETRIC KEY PatientEmailKey;
GO

select * from patient;
