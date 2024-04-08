from django.db import models

# Create your models here.
#from django.db import models

class Patient(models.Model):
    Patient_ID = models.AutoField(primary_key=True)
    First_Name = models.CharField(max_length=50, null=True)
    Last_Name = models.CharField(max_length=50, null=True)
    DOB = models.DateField(null=True)
    Gender = models.CharField(max_length=1, null=True)
    Address = models.CharField(max_length=50, null=True)
    Phone_Number = models.CharField(max_length=15, null=True)
    Email = models.CharField(max_length=50, null=True)

    class Meta:
        managed = False
        db_table = 'Patient'

    def __str__(self):
        return f"{self.First_Name} {self.Last_Name}"

class Allergy(models.Model):
    Allergy_ID = models.AutoField(primary_key=True)
    Name = models.CharField(max_length=50, null=True)
    Medication = models.CharField(max_length=50, null=True)

    class Meta:
        managed = False
        db_table = 'Allergy'

    def __str__(self):
        return self.Name


class Disease(models.Model):
    Disease_ID = models.AutoField(primary_key=True)
    Name = models.CharField(max_length=50, null=True)
    Description = models.TextField(null=True)

    class Meta:
        managed = False
        db_table = 'Disease'

    def __str__(self):
        return self.Name

class Doctor(models.Model):
    Doctor_ID = models.AutoField(primary_key=True)
    First_Name = models.CharField(max_length=50, null=True)
    Last_Name = models.CharField(max_length=50, null=True)
    Phone_Number = models.CharField(max_length=15, null=True)
    Specialization = models.CharField(max_length=50, null=True)
    Email_ID = models.CharField(max_length=50, null=True)

    class Meta:
        managed = False
        db_table = 'Doctor'

    def __str__(self):
        return f"{self.First_Name} {self.Last_Name}"

class Appointment(models.Model):
    Appointment_ID = models.AutoField(primary_key=True)
    Patient_ID = models.ForeignKey(Patient, on_delete=models.CASCADE, null=True)
    Doctor_ID = models.ForeignKey(Doctor, on_delete=models.CASCADE, null=True)
    Appointment_Date = models.DateField(null=True)
    Purpose = models.CharField(max_length=50, null=True)
    Status = models.CharField(max_length=50, null=True)

    class Meta:
        managed = False
        db_table = 'Appointment'

    def __str__(self):
        return f"Appointment ID: {self.Appointment_ID}, Patient: {self.Patient_ID}, Doctor: {self.Doctor_ID}, Date: {self.Appointment_Date}, Purpose: {self.Purpose}, Status: {self.Status}"


class Family(models.Model):
    Family_ID = models.AutoField(primary_key=True)
    Patient_ID = models.ForeignKey(Patient, on_delete=models.CASCADE, null=True)
    Relative_Name = models.CharField(max_length=50, null=True)
    Relative_Relation = models.CharField(max_length=50, null=True)

    class Meta:
        managed = False
        db_table = 'Family'

    def __str__(self):
        return f"Family ID: {self.Family_ID}, Patient: {self.Patient_ID}, Relative Name: {self.Relative_Name}, Relation: {self.Relative_Relation}"

class Insurance(models.Model):
    Insurance_ID = models.AutoField(primary_key=True)
    Patient_ID = models.ForeignKey(Patient, on_delete=models.CASCADE, null=True)
    Policy_Number = models.CharField(max_length=50, null=True)
    Company_Name = models.CharField(max_length=50, null=True)
    Coverage_Details = models.TextField(null=True)
    Validity_Period = models.DateField(null=True)

    class Meta:
        managed = False
        db_table = 'Insurance'

    def __str__(self):
        return f"Insurance ID: {self.Insurance_ID}, Patient: {self.Patient_ID}, Policy Number: {self.Policy_Number}, Company Name: {self.Company_Name}, Validity Period: {self.Validity_Period}"

class MedicalHistory(models.Model):
    Record_ID = models.AutoField(primary_key=True)
    Patient_ID = models.ForeignKey(Patient, on_delete=models.CASCADE, null=True)
    Doctor_ID = models.ForeignKey(Doctor, on_delete=models.CASCADE, null=True)
    History_Type = models.CharField(max_length=50, null=True)

    class Meta:
        managed = False
        db_table = 'Medical_History'

    def __str__(self):
        return f"Record ID: {self.Record_ID}, Patient: {self.Patient_ID}, Doctor: {self.Doctor_ID}, History Type: {self.History_Type}"

class Medicine(models.Model):
    Medicine_ID = models.AutoField(primary_key=True)
    Description = models.TextField(null=True)
    Name = models.CharField(max_length=50, null=True)
    Possible_Side_Effect = models.CharField(max_length=50, null=True)

    class Meta:
        managed = False
        db_table = 'Medicine'

    def __str__(self):
        return self.Name


class PatientAllergy(models.Model):
    Allergy_ID = models.ForeignKey(Allergy, on_delete=models.CASCADE)
    Patient_ID = models.ForeignKey(Patient, on_delete=models.CASCADE)
    Note = models.TextField(null=True)

    class Meta:
        managed = False
        db_table = 'PatientAllergy'
        unique_together = (('Allergy_ID', 'Patient_ID'),)

    def __str__(self):
        return f"Allergy ID: {self.Allergy_ID}, Patient ID: {self.Patient_ID}, Note: {self.Note}"

class PatientDiseasesHistory(models.Model):
    PDRecord_ID = models.OneToOneField(MedicalHistory, on_delete=models.CASCADE, primary_key=True)
    Disease_ID = models.ForeignKey(Disease, on_delete=models.CASCADE, null=True)
    Symptoms = models.TextField(null=True)

    class Meta:
        managed = False
        db_table = 'PatientDiseasesHistory'

    def __str__(self):
        return f"PDRecord ID: {self.PDRecord_ID}, Disease ID: {self.Disease_ID}, Symptoms: {self.Symptoms}"


class PatientGeneralHistory(models.Model):
    PGRecord_ID = models.OneToOneField(MedicalHistory, on_delete=models.CASCADE, primary_key=True)
    Date_Of_Visit = models.DateField(null=True)
    Doctor_Note = models.TextField(null=True)

    class Meta:
        managed = False
        db_table = 'PatientGeneralHistory'

    def __str__(self):
        return f"PGRecord ID: {self.PGRecord_ID}, Date of Visit: {self.Date_Of_Visit}, Doctor Note: {self.Doctor_Note}"

class Vaccine(models.Model):
    Vaccine_ID = models.AutoField(primary_key=True)
    Description = models.TextField(null=True)
    Name = models.CharField(max_length=50, null=True)

    class Meta:
        managed = False
        db_table = 'Vaccine'

    def __str__(self):
        return self.Name

class PatientVaccineHistory(models.Model):
    PVRecord_ID = models.OneToOneField(MedicalHistory, on_delete=models.CASCADE, primary_key=True, related_name='vaccine_history_record')
    Vaccine_ID = models.ForeignKey(Vaccine, on_delete=models.CASCADE, null=True, related_name='vaccine_history_vaccine')
    Date_Of_Vaccination = models.DateField(null=True)

    class Meta:
        managed = False
        db_table = 'PatientVaccineHistory'

    def __str__(self):
        return f"PVRecord ID: {self.PVRecord_ID}, Vaccine ID: {self.Vaccine_ID}, Date of Vaccination: {self.Date_Of_Vaccination}"

class Prescription(models.Model):
    Prescription_ID = models.AutoField(primary_key=True)
    Record_ID = models.ForeignKey(MedicalHistory, on_delete=models.CASCADE, null=True)

    class Meta:
        managed = False
        db_table = 'Prescription'

    def __str__(self):
        return f"Prescription ID: {self.Prescription_ID}, Record ID: {self.Record_ID}"

class PrescriptionMedicine(models.Model):
    Prescription_ID = models.ForeignKey(Prescription, on_delete=models.CASCADE)
    Medicine_ID = models.ForeignKey(Medicine, on_delete=models.CASCADE)
    Dosage = models.CharField(max_length=50, null=True)
    Frequency = models.CharField(max_length=50, null=True)
    Duration = models.CharField(max_length=50, null=True)

    class Meta:
        managed = False
        db_table = 'PrescriptionMedicine'
        unique_together = (('Prescription_ID', 'Medicine_ID'),)

    def __str__(self):
        return f"Prescription ID: {self.Prescription_ID}, Medicine ID: {self.Medicine_ID}, Dosage: {self.Dosage}, Frequency: {self.Frequency}, Duration: {self.Duration}"


