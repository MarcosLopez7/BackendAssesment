# -*- coding: utf-8 -*-
from django.shortcuts import render
from django.contrib.auth import login, logout, authenticate

from rest_framework.views import APIView
from rest_framework import status
from rest_framework.response import Response
from rest_framework.generics import ListAPIView, RetrieveAPIView, CreateAPIView
from rest_framework.authentication import SessionAuthentication, BasicAuthentication
from rest_framework.permissions import IsAuthenticated, IsAuthenticatedOrReadOnly, IsAdminUser

from .serializers import UserSerializer, EmployeeSerializer, EmployeeStoreSerializer, CreateUserSerializer, EmployeeRetrieveSerializer
from .models import Employee, Store

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
