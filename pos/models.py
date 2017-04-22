from django.db import models
from django.conf import settings
from django.core.files.storage import Storage

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

class Order(models.Model):
    date_hour = models.DateTimeField()
    store = models.ForeignKey(Store)

class Supplier(models.Model):
    name = models.CharField(max_length=80)

def product_directory_path(instance, filename):
    # file will be uploaded to MEDIA_ROOT/user_<id>/<filename>
    return 'product_{0}'.format(instance.barcode)

class Product(models.Model):
    barcode = models.IntegerField(unique=True)
    name = models.CharField(max_length=80)
    store_price = models.DecimalField(max_digits=20, decimal_places=2)
    supplier_price = models.DecimalField(max_digits=20, decimal_places=2)
    image = models.FileField(upload_to=product_directory_path, null=True)
    supplier = models.ForeignKey(Supplier)
    type = models.CharField(max_length=80)

class StoreProduct(models.Model):
    product = models.ForeignKey(Product)
    store = models.ForeignKey(Store)
    quantity = models.IntegerField()

class OrderProduct(models.Model):
    product = models.ForeignKey(Product)
    quantity = models.IntegerField()
    delivery_date = models.DateTimeField()
    order = models.ForeignKey(Order)
    expiration_date = models.DateTimeField()
