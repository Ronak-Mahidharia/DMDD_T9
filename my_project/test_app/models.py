from django.db import models

# Create your models here.
class ZipCode(models.Model):
    ZipCode = models.IntegerField(primary_key=True)
    State = models.CharField(max_length=50)
    City = models.CharField(max_length=50)
    Country = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'ZIPCODE'

    def __str__(self):
        return str(self.ZipCode)
