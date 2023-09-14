from django.urls import path
from . import views
from rest_framework.urlpatterns import format_suffix_patterns

from .views import CreatePatientView, OprationsTemplateView, SearchPatientView, EditPatientView, AddSymptomView, \
    AddImmunizerView, UpdateNotesView, UpdateCurrentConditions, UpdateKnownAllergies, \
    AddCareProviderView, AddGuardianView, MediSearchAIAPIView

app_name = 'operations'


urlpatterns = [
    # path('add/student', CreateStudentView.as_view(), name='add_student'),
    path('add/patient', CreatePatientView.as_view(), name='add_patient'),
    path('', OprationsTemplateView.as_view(), name='home'),
    path('search-patient', SearchPatientView.as_view(), name='search_patient'),
    path('patients/<int:id>/edit', EditPatientView.as_view(), name='patient_details'),
    path('patients/<int:patient_id>/add-symptom', AddSymptomView.as_view(), name='add_symptom_to_patient'),
    path('patients/<int:patient_id>/add-guardian', AddGuardianView.as_view(), name='add_guardian'),
    path('patients/<int:patient_id>/add-care-provider', AddCareProviderView.as_view(), name='add_care_provider'),
    path('patients/<int:patient_id>/add-immunizer', AddImmunizerView.as_view(), name='add_immunizer_to_patient'),
    path('patients/<int:pk>/update-notes', UpdateNotesView.as_view(), name='add_notes_to_patient'),
    path('patients/<int:pk>/update-current-conditions', UpdateCurrentConditions.as_view(), name='update_current_conditions'),
    path('patients/<int:pk>/update-known-allergies', UpdateKnownAllergies.as_view(), name='update_known_allergies'),
    path('medi-search', MediSearchAIAPIView.as_view(), name= 'medi_search_ai')
]
urlpatterns = format_suffix_patterns(urlpatterns)