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