from datetime import datetime
from functools import reduce
from django.core.validators import MaxValueValidator, MinValueValidator
from django.db import models
from django.utils.translation import gettext_lazy as _

from myutils.models import *
from myutils.utils import validate_non_future_date

class Patient(AuditModelMixin):
    first_name = models.CharField(_('First Name'), max_length=100, blank=False)
    last_name = models.CharField(_('Last Name'), max_length=100, blank=False)
    profile_pic = models.ImageField(upload_to='images/patient_pics', null=True, blank=True)
    gender = models.ForeignKey(GenderMaster, verbose_name=_('Gender'), on_delete=models.SET_NULL, null=True)
    date_of_birth = models.DateField(_('DOB'))
    weight = models.FloatField(validators=[
            MinValueValidator(0),#Indian pin code
            MaxValueValidator(500)
        ])
    height = models.CharField(max_length=30)
    chronic_condition = models.CharField(_('Chronic Conditions'), max_length=500, null=True, blank=True)
    recent_illness = models.CharField(_('Recent Illness'), max_length=500, null=True, blank=True)
    past_30_days_condition = models.CharField(_('Past 30 Days'), max_length=500, null=True, blank=True)
    past_90_days_condition = models.CharField(_('Past 90 Days'), max_length=500, null=True, blank=True)
    known_food_alergy = models.CharField(_('Food'), max_length=500, null=True, blank=True)
    known_insects_alergy = models.CharField(_('Insects'), max_length=500, null=True, blank=True)
    known_medication_alergy = models.CharField(_('Medications'), max_length=500, null=True, blank=True)
    known_contact_alergy = models.CharField(_('Contact'), max_length=500, null=True, blank=True)
    known_common_pets_alergy = models.CharField(_('Common Pets'), max_length=500, null=True, blank=True)
    known_seasonal_alergy = models.CharField(_('Seasonal') ,max_length=500, null=True, blank=True)
    notes =  models.TextField(_('Notes'), max_length=100, default='', null=True, blank=True)
    def get_full_name(self):
        """
        Return the first_name plus the last_name, with a space in between.
        """
        full_name = "%s %s" % (self.first_name, self.last_name)
        return full_name.strip()

    def get_days_older_than_today(self, input_date):
        today = datetime.today().date()
        diff = today-input_date
        return diff.days

    def __str__(self):
        return f"{self.first_name} {self.last_name}"


class CareProvider(CommonPersonAbstract):
    name = models.CharField(_('Name'), max_length=100)
    qualification = models.CharField(max_length=100)
    specialization = models.CharField(max_length=100, null=True, blank=True)
    institute = models.CharField(max_length=100, null=True, blank=True)
    patient = models.ForeignKey(Patient, related_name='care_providers', on_delete=models.CASCADE)

class Guardian(CommonPersonAbstract):
    relation = models.CharField(_('Relation'), max_length=20)
    patient = models.ForeignKey(Patient, related_name='guardians', on_delete=models.CASCADE)

class Symptom(CommonMasterAbstract):
    name = models.CharField(max_length=100, null=False )
    patient = models.ForeignKey(Patient, related_name='symptoms', on_delete=models.CASCADE)
    date = models.DateTimeField(default=datetime.now())

class Immunization(CommonMasterAbstract):
    name = models.CharField(max_length=100, null=False )
    patient = models.ForeignKey(Patient, related_name='immunizations', on_delete=models.CASCADE)
    date = models.DateTimeField(default=datetime.now())
