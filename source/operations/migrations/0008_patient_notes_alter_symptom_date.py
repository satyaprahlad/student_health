# Generated by Django 4.1.7 on 2023-09-04 16:15

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('operations', '0007_patient_chronic_condition_alter_symptom_date'),
    ]

    operations = [
        migrations.AddField(
            model_name='patient',
            name='notes',
            field=models.TextField(blank=True, default='', max_length=100, null=True, verbose_name='Notes'),
        ),
        migrations.AlterField(
            model_name='symptom',
            name='date',
            field=models.DateTimeField(default=datetime.datetime(2023, 9, 4, 16, 15, 7, 79026)),
        ),
    ]
