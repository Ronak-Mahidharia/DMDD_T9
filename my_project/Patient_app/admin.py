from django.contrib import admin
from Patient_app.models import Patient
from Patient_app.models import Allergy

# Register your models here.
admin.site.register(Patient)
admin.site.register(Allergy)