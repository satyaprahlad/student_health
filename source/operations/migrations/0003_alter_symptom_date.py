# Generated by Django 4.1.7 on 2023-08-31 22:41

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('operations', '0002_alter_symptom_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='symptom',
            name='date',
            field=models.DateTimeField(default=datetime.datetime(2023, 8, 31, 22, 41, 8, 800581)),
        ),
    ]