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


# class ExpenditureItemForm(ModelForm):
#
#     class Meta:
#         model=ExpenditureItem
#         fields=['name','type','price','quantity','description']
#
#
# class SelectExpenditureItemForm(forms.Form):
#     fromdate=forms.DateField(widget=date_input)
#     todate=forms.DateField(widget=date_input)
#         # class Meta:
#         #     widgets = {
#         #         'valid_from': date_input, 'valid_till': date_input,
#         #     }
#
#
# class InventoryForm(ModelForm):
#     class Meta:
#         model=Inventory
#         #fields= '__all__'
#         fields=['name','type','price','quantity','description']
#
#
# class CourseEnrollForm(ModelForm):
#     class Meta:
#         model = StudentCourseAdmission
#         exclude = audit_fields + []
#         widgets = {
#             'valid_from': date_input, 'valid_till': date_input,
#             'due_for': date_input
#         }
#     def clean(self):
#         cleaned_data = super().clean()
#         valid_from = cleaned_data.get('valid_from')
#         valid_till = cleaned_data.get('valid_till')
#         if( valid_till <= valid_from):
#             raise ValidationError(_("Valid From %(valid_from)s should be less than Valid Till %(valid_till)s"), params={"valid_from": valid_from, "valid_till": valid_till}, code="Wrong dates")
#         return cleaned_data
#
# class CourseForm(ModelForm):
#     class Meta:
#         model = Course
#         exclude = audit_fields + []
#         widgets = {
#             'valid_from': date_input, 'valid_till': date_input,
#         }
#
#
# class PaymentForm(ModelForm):
#     class Meta:
#         model = Payment
#         exclude = audit_fields + []
#
# PaymentFormSet = inlineformset_factory(StudentCourseAdmission, Payment, form=PaymentForm, extra=3)
# PaymentFormSetForEdit = inlineformset_factory(StudentCourseAdmission, Payment, form=PaymentForm, extra=1, can_delete_extra=True, can_delete=False, edit_only=True)
#
# class MarkAttendanceForm(ModelForm):
#     class Meta:
#         model = Attendance
#         exclude = audit_fields + []
#         widgets = {
#             'marked_on': date_input ,'marked_for': forms.HiddenInput()
#         }
