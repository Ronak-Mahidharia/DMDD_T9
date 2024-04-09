USE PATIENT_MANAGEMENT;

-- DML trigger to prevent scheduling appointments on weekends (Saturday and Sunday)
CREATE TRIGGER prevent_weekend_appointments
ON Appointment
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @AppointmentDate DATETIME;
    DECLARE @DayOfWeek INT;

    SELECT @AppointmentDate = Appointment_Date FROM inserted;
    SELECT @DayOfWeek = DATEPART(dw, @AppointmentDate);

    IF (@DayOfWeek = 1 OR @DayOfWeek = 7)
    BEGIN
        RAISERROR ('Appointments cannot be scheduled on weekends.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

--INSERT INTO Appointment (Patient_ID, Doctor_ID, Appointment_Date, Purpose, Status) VALUES (1, 1, '2024-04-08', 'Regular checkup', 'Scheduled');


-- DML trigger to prevent inserting prescriptions with incorrect dosage frequency
CREATE TRIGGER prevent_invalid_prescription_frequency
ON PrescriptionMedicine
AFTER INSERT
AS
BEGIN
    DECLARE @Frequency VARCHAR(50);

    SELECT @Frequency = Frequency FROM inserted;

    IF (@Frequency NOT IN ('Once daily', 'Twice daily', 'As needed'))
    BEGIN
        RAISERROR ('Invalid dosage frequency. Please use "Once daily", "Twice daily", or "As needed".', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- This query will work because it specifies a valid dosage frequency.
--INSERT INTO PrescriptionMedicine (Prescription_ID, Medicine_ID, Dosage, Frequency, Duration) VALUES (20, 1, '500mg', 'Twice daily', '7 days');

-- This query won't work because it specifies an invalid dosage frequency.
--INSERT INTO PrescriptionMedicine (Prescription_ID, Medicine_ID, Dosage, Frequency, Duration) VALUES (20, 2, '200mg', 'Three times a day', '3 days');



