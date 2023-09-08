from rest_framework import serializers
from rest_framework.serializers import ModelSerializer, IntegerField, FloatField, HyperlinkedModelSerializer

from operations.models import Patient

class PatientSerializer(ModelSerializer):
    # url = serializers.HyperlinkedIdentityField(
    #     view_name='patient_details',
    #     read_only=True
    # )
    class Meta:
        model = Patient
        fields = '__all__'
