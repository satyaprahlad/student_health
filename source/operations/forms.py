from bootstrap_modal_forms.forms import BSModalModelForm
from django import forms
from django.forms import ModelForm, DateTimeInput, DateInput, inlineformset_factory, DateTimeField, HiddenInput
from django.core.exceptions import ValidationError
from app.settings import audit_fields

from django.utils.translation import gettext_lazy as _

from operations.models import *

date_input = DateInput(attrs={'type': 'date', 'onfocus':'this.showPicker()'})

common_exclude_fields = ['is_active']

class PatientForm(ModelForm):
    class Meta:
        model = Patient
        exclude = audit_fields + []
        widgets = {
            'date_of_birth': date_input
        }

        # fields = ['first_name', 'last_name', 'gender', 'age', 'age_group', 'email', 'phone_number', 'parent_details',
        #           'parent_phone_number', 'referred_by', 'heard_from_source', 'heard_from_other_source', 'interested_in',
        #           'interested_in_other', 'address1', 'address2', 'city', 'state', 'pin_code', 'photo','is_active']

class EditPatientForm(ModelForm):
    class Meta:
        model = Patient
        exclude = audit_fields + []

class SymptomsForm(ModelForm):

    class Meta:
        model = Symptom
        exclude = audit_fields + common_exclude_fields + []
        widgets = {
                    'date': date_input
                }

class SymptomModalForm2(BSModalModelForm):
    class Meta:
        model = Symptom
        exclude = audit_fields + common_exclude_fields + ['description']
        widgets = {
            'date': date_input,
            'patient':HiddenInput()
        }

class ImmunizationModalForm(BSModalModelForm):
    class Meta:
        model = Immunization
        exclude = audit_fields + common_exclude_fields + ['description']
        widgets = {
            'date': date_input,
            'patient':HiddenInput()
        }
class HealthCareProviderForm(BSModalModelForm):
    class Meta:
        model= CareProvider
        fields = ['name', 'specialization', 'patient']
        widgets = {
            'patient': HiddenInput()
        }
class GuardianModalForm(BSModalModelForm):

    class Meta:
        model = Guardian
        fields = ['name', 'relation', 'patient']
        widgets = {
            'patient': HiddenInput()
        }

class UpdateCurrentConditionsModalForm(BSModalModelForm):
    class Meta:
        model=Patient
        fields = ['chronic_condition', 'recent_illness', 'past_30_days_condition', 'past_90_days_condition']

class UpdateKnownAllergiesModalForm(BSModalModelForm):
    class Meta:
        model=Patient
        fields = ['known_food_alergy', 'known_insects_alergy', 'known_medication_alergy', 'known_contact_alergy', 'known_common_pets_alergy', 'known_seasonal_alergy']
class NotesModalForm(BSModalModelForm):
    class Meta:
        model=Patient
        fields = ['notes']

class GuardianForm(ModelForm):
    class Meta:
        model = Guardian
        exclude = audit_fields + common_exclude_fields + []

class CareProviderForm(ModelForm):
    class Meta:
        model = CareProvider
        exclude = audit_fields + common_exclude_fields + []

SymptomsFormSet = inlineformset_factory(Patient, Symptom, form=SymptomsForm, extra=2)
SymptomsFormSetForEdit = inlineformset_factory(Patient, Symptom, form=SymptomsForm, extra=2, can_delete_extra=True, can_delete=False, edit_only=True)

GuardianFormSet = inlineformset_factory(Patient, Guardian, form=GuardianForm, extra=2)
GuardianFormForEdit = inlineformset_factory(Patient, Guardian, form=GuardianForm, extra=2, can_delete_extra=True, can_delete=False, edit_only=True)

CareProviderFormSet = inlineformset_factory(Patient, CareProvider, form=CareProviderForm, extra=2)
CareProviderFormForEdit = inlineformset_factory(Patient, CareProvider, form=CareProviderForm, extra=2, can_delete_extra=True, can_delete=False, edit_only=True)

