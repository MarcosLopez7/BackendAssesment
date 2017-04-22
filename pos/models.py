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

    def __str__(self):
        return "Order to {0} at {1}".format(self.store.location, self.date_hour)

class Supplier(models.Model):
    name = models.CharField(max_length=80)

    def __str__(self):
        return self.name

def product_directory_path(instance, filename):
    # file will be uploaded to MEDIA_ROOT/user_<id>/<filename>
    return 'product_{0}'.format(instance.barcode)

class Product(models.Model):
    barcode = models.CharField(unique=True, max_length=80)
    name = models.CharField(max_length=80)
    store_price = models.DecimalField(max_digits=20, decimal_places=2)
    supplier_price = models.DecimalField(max_digits=20, decimal_places=2)
    image = models.FileField(upload_to=product_directory_path, null=True)
    supplier = models.ForeignKey(Supplier)
    type = models.CharField(max_length=80)

    def __str__(self):
        return self.name

class StoreProduct(models.Model):
    product = models.ForeignKey(Product)
    store = models.ForeignKey(Store)
    quantity = models.IntegerField()

    def __str__(self):
        return "id {3}: {0} in store {1}: {2} units".format(self.product.name, self.store.location, self.quantity, self.pk)

class OrderProduct(models.Model):
    product = models.ForeignKey(Product)
    quantity = models.IntegerField()
    delivery_date = models.DateTimeField()
    order = models.ForeignKey(Order)
    expiration_date = models.DateTimeField()

    def __str__(self):
        return "id {3}: {0} in order {1}: {2} units".format(self.product.name, str(self.order), self.quantity, self.pk)

class Sale(models.Model):
    date = models.DateTimeField()
    amount = models.DecimalField(max_digits=20, decimal_places=2)
    store = models.ForeignKey(Store)
    client = models.ForeignKey(Client, null=True)

    def __str__(self):
        return "id {0}: Sale for {1} in store {2}".format(self.pk, self.amount, str(self.store))

class SaleProduct(models.Model):
    product = models.ForeignKey(Product)
    sale = models.ForeignKey(Sale)
    quantity = models.IntegerField()

    def __str__(self):
        return "({0}) {1} sold in sale <{2}>".format(self.quantity, self.product.name, str(self.sale))
class Client(models.Model):
    gender = CharField(max_length=80)
    age = IntegerField()

    def __str__(self):
        return "id:{0}, Gender:{1}, Age:{2}".format(self.pk, self.gender, self.age)
