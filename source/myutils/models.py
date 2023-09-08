from django.db import models
from django.conf import settings
from django.utils.translation import gettext_lazy as _
from django.utils import timezone
# Create your models here.
class ValidityMixin(models.Model):
    valid_from = models.DateTimeField()
    valid_till = models.DateTimeField()

    class Meta:
        abstract = True

class BaseTimestampedModel(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True

class BaseUserTrackedModel(models.Model):
    created_by = models.ForeignKey(settings.AUTH_USER_MODEL, null=True, default=None, on_delete=models.SET_NULL, related_name="created_%(class)s")
    updated_by = models.ForeignKey(settings.AUTH_USER_MODEL, null=True, default=None, on_delete=models.SET_NULL, related_name="updated_%(class)s")

    class Meta:
        abstract = True

class AuditModelMixin(BaseTimestampedModel,
                      BaseUserTrackedModel):
    class Meta:
        abstract = True

class CommonMasterAbstract(models.Model):
    name = models.CharField(max_length=20, null=False, unique=True)
    description = models.CharField(max_length=100, null=False)
    is_active = models.BooleanField(default=True, verbose_name="Is Active", null=True)

    def __str__(self):
        return f"{self.name}"
    class Meta:
        abstract = True


class CommonAbstract(models.Model):
    name = models.CharField(max_length=20, null=False, unique=True)
    description = models.CharField(max_length=100, null=False)
    is_active = models.BooleanField(default=True, verbose_name="Is Active", null=True)

    def __str__(self):
        return f"{self.name}"
    class Meta:
        abstract = True


class CommonPersonAbstract(AuditModelMixin):
    name = models.CharField(_('Name'), max_length=100)
    email =models.EmailField(_('Email'), null=True, blank=True)
    phone =models.CharField(_('Phone#'), max_length=20 ,null=True, blank=True)

    def __str__(self):
        return f"{self.name}"
    class Meta:
        abstract = True

class GenderMaster(CommonMasterAbstract):
    pass