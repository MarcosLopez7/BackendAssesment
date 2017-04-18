from .models import Employee, Store
from django.contrib.auth.models import User
from rest_framework.serializers import ModelSerializer

class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ['pk', 'username', 'first_name', 'last_name', 'is_superuser', 'is_staff']

class EmployeeUserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ['pk', 'first_name', 'last_name', 'is_staff'] 

class EmployeeStoreSerializer(ModelSerializer):
    class Meta:
        model = Store
        fields = ['pk', 'location']

class EmployeeSerializer(ModelSerializer):
    user = EmployeeUserSerializer()
    store = EmployeeStoreSerializer() 

    class Meta:
        model = Employee
        fields = ['pk', 'user', 'store']
