from django.contrib import admin
from Patient_app.models import Patient
from Patient_app.models import Allergy
from Patient_app.models import Disease
from Patient_app.models import Doctor
from Patient_app.models import Appointment
from Patient_app.models import Family
from Patient_app.models import Insurance
from Patient_app.models import MedicalHistory
from Patient_app.models import Medicine
from Patient_app.models import PatientAllergy
from Patient_app.models import PatientDiseasesHistory
from Patient_app.models import PatientGeneralHistory
from Patient_app.models import PatientVaccineHistory
from Patient_app.models import Prescription
from Patient_app.models import PrescriptionMedicine
from Patient_app.models import Vaccine

# Register your models here.
admin.site.register(Patient)
admin.site.register(Allergy)
admin.site.register(Disease)
admin.site.register(Doctor)
admin.site.register(Appointment)
admin.site.register(Family)
admin.site.register(Insurance)
admin.site.register(MedicalHistory)
admin.site.register(Medicine)
admin.site.register(PatientAllergy)
admin.site.register(PatientDiseasesHistory)
admin.site.register(PatientGeneralHistory)
admin.site.register(PatientVaccineHistory)
admin.site.register(Prescription)
admin.site.register(PrescriptionMedicine)
admin.site.register(Vaccine)
