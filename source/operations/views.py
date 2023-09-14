import logging
import time

from bootstrap_modal_forms.generic import BSModalCreateView, BSModalUpdateView
from django.contrib import messages
from django.contrib.auth.mixins import LoginRequiredMixin
from django.db.models import Q
from django.http import StreamingHttpResponse
from django.shortcuts import redirect
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.utils.translation import gettext_lazy as _
from django.views import View
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import FormView, UpdateView, TemplateView
from rest_framework.response import Response
from rest_framework.views import APIView

from operations.forms import PatientForm, SymptomsFormSet, CareProviderFormSet, GuardianFormSet, EditPatientForm, \
    SymptomModalForm2, ImmunizationModalForm, NotesModalForm, UpdateCurrentConditionsModalForm, \
    UpdateKnownAllergiesModalForm, HealthCareProviderForm, GuardianModalForm
from operations.models import Patient
from operations.serializers import PatientSerializer
from medisearch_client import MediSearchClient
from app.settings import medisearch_api_key
logger = logging.getLogger(__name__)
class OprationsTemplateView(LoginRequiredMixin,TemplateView):
    template_name = 'operations_home.html'

class SearchPatientView(LoginRequiredMixin, APIView):
    serializer_class = PatientSerializer
    def get(self, request, format=None):
        q = request.GET.get('q')
        if not q.isnumeric() :
            objects = Patient.objects.filter(Q(first_name__icontains=q) | Q(last_name__icontains=q))
        else:
            objects = Patient.objects.filter(Q(id=int(q)))
        logger.info("objects are {0}".format(len(objects)))
        serializer = self.serializer_class(objects, many=True, context={'request': request})
        return Response(serializer.data)

@method_decorator(csrf_exempt, name='dispatch')
class CreatePatientView(LoginRequiredMixin, FormView):
    template_name = 'create_patient.html'
    form_class = PatientForm

    def get_context_data(self, **kwargs):
        super_ = super(CreatePatientView, self)
        context = super_.get_context_data(**kwargs)
        context['symptoms_form_set'] = SymptomsFormSet()
        context['care_provider_form_set'] = CareProviderFormSet()
        context['guardian_form_set'] = GuardianFormSet()
        context['mylist']= [i for i in range(10)]
        return context

    def form_valid(self, form, symptoms_form_set, care_provider_form_set, guardian_form_set):
        self.object = form.save(commit=False)
        # self.object.created_by = self.request.user
        # self.object.updated_by = self.request.user
        self.object.save()

        symptoms = symptoms_form_set.save(commit=False)
        for symptom in symptoms:
            symptom.patient = self.object
            # symptom.created_by = self.request.user
            # symptom.updated_by = self.request.user
            symptom.save()

        care_providers = care_provider_form_set.save(commit=False)
        for care_provider in care_providers:
            care_provider.patient = self.object
            # care_provider.created_by = self.request.user
            # care_provider.updated_by = self.request.user
            care_provider.save()

        guardians = guardian_form_set.save(commit=False)
        for guardian in guardians:
            guardian.patient = self.object
            # guardian.created_by = self.request.user
            # guardian.updated_by = self.request.user
            guardian.save()
        messages.success(self.request, _(f'Patient {self.object} record has been created.'))
        return redirect('operations:home')

    @csrf_exempt
    def post(self, request, *args, **kwargs):
        form_class = self.get_form_class()
        form = self.get_form(form_class)
        symptoms_form_set = SymptomsFormSet(self.request.POST)
        care_provider_form_set = CareProviderFormSet(self.request.POST)
        guardian_form_set = GuardianFormSet(self.request.POST)
        if form.is_valid() and symptoms_form_set.is_valid() and care_provider_form_set.is_valid() and guardian_form_set.is_valid():
            return self.form_valid(form, symptoms_form_set, care_provider_form_set, guardian_form_set)
        else:
            return self.form_invalid(form, symptoms_form_set, care_provider_form_set, guardian_form_set)

    def form_invalid(self, form, symptoms_form_set, care_provider_form_set, guardian_form_set):
        context = {}
        context['form'] = form
        context['symptoms_form_set'] =symptoms_form_set
        context['care_provider_form_set'] = care_provider_form_set
        context['guardian_form_set'] = guardian_form_set
        return self.render_to_response(context)

class EditPatientView(LoginRequiredMixin, UpdateView):
    model = Patient
    template_name = 'edit_patient.html'
    form_class = EditPatientForm
    pk_url_kwarg = 'id'
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context

    def form_invalid(self, form, payment_form_set):
        context = {}
        context['form'] = form
        context['payment_form_set'] =payment_form_set
        context['object'] = self.object
        return self.render_to_response(context
                                  )

    def form_valid(self, form, payment_form_set):
        self.object = form.save(commit=False)
        self.object.updated_by = self.request.user
        self.object.save()
        payments = payment_form_set.save_new_objects(commit=True)
        for payment in payments:
            payment.created_by = self.request.user
            payment.updated_by = self.request.user
            payment.save()
        messages.success(self.request, _(f'admission {self.object} has been updated successfully.'))
        return redirect(self.request.path)


class AddDetailsPatient(LoginRequiredMixin, BSModalCreateView):
    def get_success_url(self):
        return reverse_lazy('operations:patient_details', args=[self.kwargs['patient_id']] )
    def get_context_data(self, **kwargs):
        context  = super().get_context_data(**kwargs)
        form = context['form']
        patient = Patient.objects.get(id=self.kwargs['patient_id'])
        form.fields['patient'].initial=patient
        return context

    success_message = 'Success: Added.'
class AddSymptomView(AddDetailsPatient):
    template_name = 'modals/add_symptom.html'
    form_class = SymptomModalForm2

class AddImmunizerView(AddDetailsPatient):
    template_name = 'modals/add_immunizer.html'
    form_class = ImmunizationModalForm

class AddCareProviderView(AddDetailsPatient):
    template_name = 'modals/add_care_provider.html'
    form_class = HealthCareProviderForm

class AddGuardianView(AddDetailsPatient):
    template_name = 'modals/add_guardian.html'
    form_class = GuardianModalForm


class UpdateNotesView(BSModalUpdateView):
    model = Patient
    template_name = 'modals/update_notes.html'
    form_class = NotesModalForm
    success_message = 'Success: updated.'
    def get_success_url(self):
        return reverse_lazy('operations:patient_details', args=[self.kwargs['pk']] )

class UpdateCurrentConditions(UpdateNotesView):
    form_class = UpdateCurrentConditionsModalForm
    template_name = 'modals/update_curretn_conditions.html'

class UpdateKnownAllergies(UpdateNotesView):
    form_class = UpdateKnownAllergiesModalForm
    template_name = 'modals/update_known_alergies.html'

class MediSearchAIAPIView(APIView):
    def post(self, request, *args, **kwargs):
        convesation_id = request.data['conversation_id']

        api_key = medisearch_api_key
        client = MediSearchClient(api_key=api_key)
        tic = time.time()

        conversation = request.data['conversation']
        responses = client.send_user_message(conversation_id=convesation_id, conversation=conversation,
                                             should_stream_response=False, language="English")
        logger.info("time taken for api response".format(int(time.time() - tic)))
        for response in responses:
            return Response(data=response)
        return Response(data={})

#
#
# class MediSearchAIAPIView(View):
#     def post(self, request, *args, **kwargs):
#
#         convesation_id = request.data['conversation_id']
#
#         api_key = medisearch_api_key
#         client = MediSearchClient(api_key=api_key)
#         tic = time.time()
#
#         conversation = request.data['conversation']
#         responses = client.send_user_message(conversation_id=convesation_id, conversation=conversation,
#                                              should_stream_response=True, language="English")
#         logger.info("time taken for api response".format(int(time.time() - tic)))
#         response = StreamingHttpResponse(responses, content_type='text/plain')
#         for response in responses:
#             if response["event"] == "llm_response":
#                 conversation_store[convesation_id] = responses
#             elif response['event'] == "article":
#                 del conversation_store[convesation_id]
#             return Response(data=response)
#         return Response(data={})