# -*- coding: utf-8 -*-
from django.shortcuts import render
from django.contrib.auth import login, logout, authenticate

from rest_framework.views import APIView
from rest_framework import status
from rest_framework.response import Response
from rest_framework.generics import ListAPIView, RetrieveAPIView, CreateAPIView
from rest_framework.authentication import SessionAuthentication, BasicAuthentication
from rest_framework.permissions import IsAuthenticated, IsAuthenticatedOrReadOnly, IsAdminUser

from .serializers import UserSerializer, EmployeeSerializer, EmployeeStoreSerializer, CreateUserSerializer, EmployeeRetrieveSerializer, EmployeeEditSerializer, UserEditSerializer, EmployeeStoreSerializer, StoreSerializer, CreateStoreSerializer, OrderSerializer, CreateOrderSerializer
from .models import Employee, Store, Order

# Create your views here.
class LoginView(APIView):

    def post(self, request):

        username = self.request.data['username']
        password = self.request.data['password']

        user = authenticate(username=username, password=password)

        if user is not None:

            if user.is_active:

                login(request, user)
                serializer = UserSerializer(user)

                return Response(serializer.data, status=status.HTTP_202_ACCEPTED)

            else:
                return Response('invalid', status=status.HTTP_401_UNAUTHORIZED)

        else:
            return Response('invalid', status=status.HTTP_401_UNAUTHORIZED)

class AdminView(ListAPIView):
    #authentication_classes = (SessionAuthentication, BasicAuthentication)
    #permission_classes = (IsAdminUser,)
    queryset = Employee.objects.all()
    serializer_class = EmployeeSerializer

class CreateEmployeeStoreView(ListAPIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    queryset = Store.objects.all()
    serializer_class = EmployeeStoreSerializer

class CreateUserEmployeeView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)

    def post(self, request):
        serializer = CreateUserSerializer(data=self.request.data)

        if serializer.is_valid():
            instance = serializer.save()
            instance.set_password(self.request.data['password'])
            instance.save()

            store_location = self.request.data['store']
            store = Store.objects.get(location=store_location)

            employee = Employee()
            employee.user = instance
            employee.store = store
            employee.save()

            return Response('created', status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)

class RetrieveEmployeeView(RetrieveAPIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    queryset = Employee.objects.all()
    serializer_class = EmployeeRetrieveSerializer
    lookup_field = 'pk'


class EmployeeToEditView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    def get(self, request, pk):
        instance = Employee.objects.filter(pk=pk)
        stores = Store.objects.all().exclude(location__exact=instance[0].store.location)
        store_serializer = EmployeeStoreSerializer(stores, many=True)
        serializer = EmployeeEditSerializer(instance, many=True)
        response = serializer.data + store_serializer.data

        return Response(response, status=status.HTTP_202_ACCEPTED)


class EditUserEmployeeView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    def put(self, request, pk):

        instance_employee = Employee.objects.get(pk=pk)
        serializer = UserEditSerializer(data=request.data, instance=instance_employee.user)

        if serializer.is_valid():
            store_location = self.request.data['store']
            store = Store.objects.get(location=store_location)

            instance_employee.user = serializer.save()
            instance_employee.store = store
            instance_employee.save()

            return Response('updated', status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)


class DeleteUserEmployeeView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    def delete(self, request, pk):
        employee = Employee.objects.get(pk=pk)
        employee.user.delete()
        employee.delete()

        return Response('deleted', status=status.HTTP_202_ACCEPTED)

class RetrieveStoresView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    def get(self, request):
        stores = Store.objects.all()
        store_serializer = StoreSerializer(stores, many=True)
        response = store_serializer.data

        return Response(response, status=status.HTTP_202_ACCEPTED)

class RetrieveStoreView(RetrieveAPIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    queryset = Store.objects.all()
    serializer_class = StoreSerializer
    lookup_field = 'pk'

class EditStoreView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    def put(self, request, pk):

        instance_store = Store.objects.get(pk=pk)
        serializer = StoreSerializer(data=self.request.data, instance=instance_store)

        if serializer.is_valid():
            serializer.save()

            return Response('updated', status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)

class CreateStoreView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)

    def post(self, request):
        serializer = CreateStoreSerializer(data=self.request.data)

        if serializer.is_valid():
            instance = serializer.save()
            instance.save()

            return Response('created', status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)

class DeleteStoreView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    def delete(self, request, pk):
        store = Store.objects.get(pk=pk)
        # orders = Order.objects.get(store=store)
        # products = StoreProduct.objects.get(store=store)
        # employees = Employee.objects.get(store=store)
        store.delete()

        return Response('deleted', status=status.HTTP_202_ACCEPTED)

class RetrieveOrdersView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)
    def get(self, request):
        orders = Order.objects.all()
        order_serializer = OrderSerializer(orders, many=True)
        response = order_serializer.data

        return Response(response, status=status.HTTP_202_ACCEPTED)

class CreateOrderView(APIView):
    # authentication_classes = (SessionAuthentication, BasicAuthentication)
    # permission_classes = (IsAdminUser,)

    def post(self, request):
        serializer = CreateOrderSerializer(data=self.request.data)

        if serializer.is_valid():
            instance = serializer.save()
            instance.save()

            return Response('created', status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_406_NOT_ACCEPTABLE)
