# Generated by Django 4.1.7 on 2023-11-04 14:51

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('operations', '0002_alter_immunization_date_alter_symptom_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='immunization',
            name='date',
            field=models.DateTimeField(default=datetime.datetime(2023, 11, 4, 14, 51, 52, 459195)),
        ),
        migrations.AlterField(
            model_name='symptom',
            name='date',
            field=models.DateTimeField(default=datetime.datetime(2023, 11, 4, 14, 51, 52, 458863)),
        ),
    ]