USE PATIENT_MANAGEMENT;
ALTER TABLE Patient
ADD Weight DECIMAL(5,2);

ALTER TABLE Patient
ADD Height DECIMAL(5,2);


UPDATE Patient SET Weight = 70.0, Height = 175.0 WHERE Patient_ID = 1;
UPDATE Patient SET Weight = 65.0, Height = 165.0 WHERE Patient_ID = 2;
UPDATE Patient SET Weight = 80.0, Height = 180.0 WHERE Patient_ID = 3;
UPDATE Patient SET Weight = 55.0, Height = 160.0 WHERE Patient_ID = 4;
UPDATE Patient SET Weight = 90.0, Height = 190.0 WHERE Patient_ID = 5;
UPDATE Patient SET Weight = 60.0, Height = 170.0 WHERE Patient_ID = 6;
UPDATE Patient SET Weight = 75.0, Height = 175.0 WHERE Patient_ID = 7;
UPDATE Patient SET Weight = 58.0, Height = 168.0 WHERE Patient_ID = 8;
UPDATE Patient SET Weight = 85.0, Height = 182.0 WHERE Patient_ID = 9;
UPDATE Patient SET Weight = 64.0, Height = 162.0 WHERE Patient_ID = 10;
UPDATE Patient SET Weight = 77.0, Height = 176.0 WHERE Patient_ID = 11;
UPDATE Patient SET Weight = 68.0, Height = 169.0 WHERE Patient_ID = 12;
UPDATE Patient SET Weight = 82.0, Height = 178.0 WHERE Patient_ID = 13;
UPDATE Patient SET Weight = 57.0, Height = 163.0 WHERE Patient_ID = 14;
UPDATE Patient SET Weight = 88.0, Height = 185.0 WHERE Patient_ID = 15;
UPDATE Patient SET Weight = 63.0, Height = 164.0 WHERE Patient_ID = 16;
UPDATE Patient SET Weight = 92.0, Height = 188.0 WHERE Patient_ID = 17;
UPDATE Patient SET Weight = 66.0, Height = 167.0 WHERE Patient_ID = 18;
UPDATE Patient SET Weight = 78.0, Height = 172.0 WHERE Patient_ID = 19;
UPDATE Patient SET Weight = 59.0, Height = 161.0 WHERE Patient_ID = 20;



CREATE FUNCTION dbo.CalculateAge(@DOB DATE)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YEAR, @DOB, GETDATE()) - 
           CASE 
               WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR 
                    (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE())) 
               THEN 1 
               ELSE 0 
           END;
END;

ALTER TABLE Patient
ADD Age AS dbo.CalculateAge(DOB);

CREATE FUNCTION dbo.CalculateBMI(@Weight DECIMAL(5,2), @Height DECIMAL(5,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
    -- Assuming height is in centimeters, convert it to meters for BMI calculation
    DECLARE @HeightInMeters DECIMAL(10,2) = @Height / 100.0;
    RETURN ROUND(@Weight / (@HeightInMeters * @HeightInMeters), 2);
END

ALTER TABLE Patient
ADD BMI AS dbo.CalculateBMI(Weight, Height)

CREATE FUNCTION dbo.DaysUntilAppointment(@AppointmentDate DATE)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(DAY, GETDATE(), @AppointmentDate);
END;

ALTER TABLE Appointment
ADD Days_Until AS dbo.DaysUntilAppointment(Appointment_Date);
select * from appointment;

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
