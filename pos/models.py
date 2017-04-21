from django.db import models
from django.conf import settings

# Create your models here.
class Store(models.Model):
    location = models.CharField(max_length=80)
    address = models.TextField()
    coordinate_x = models.DecimalField(max_digits=40, decimal_places=20)
    coordinate_y = models.DecimalField(max_digits=40, decimal_places=20)

    def __str__(self):
        return self.location

class Employee(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, related_name='employee')
    store = models.ForeignKey(Store)

    class Meta:
        ordering = ['pk', ]

    def __str__(self):
        return "{0} {1}".format(self.user.first_name, self.user.last_name)
