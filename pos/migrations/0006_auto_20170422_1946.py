# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-04-22 19:46
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pos', '0005_auto_20170422_1915'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='barcode',
            field=models.CharField(max_length=80, unique=True),
        ),
    ]
