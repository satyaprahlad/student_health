from datetime import datetime
from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _

def validate_non_future_date(date_value):
    if datetime.today().date() < date_value:
        raise ValidationError(_("date %(value)s should not be future"), params={'value': date_value})