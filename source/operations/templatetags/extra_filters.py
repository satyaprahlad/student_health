import json

from django import template

register = template.Library()

def keyvalue(dictionary, key):
    return dictionary.get(key)

def jsonify(object):
    return json.dumps(object)

register.filter('jsonify', jsonify)
jsonify.is_safe = True
register.filter('keyvalue', keyvalue)

def is_less_than_15_days(input_date):
    from datetime import datetime
    time_delta = datetime.today() - input_date
    return time_delta.days <= 15
register.filter(is_less_than_15_days)

def less_than_n_days_symptoms(symptoms, n):
    from datetime import datetime
    if n == 15:
        return list(filter(lambda x: (datetime.today()-x.date).days < 15 , symptoms))
    elif n == 30:
        return list(filter(lambda x: (datetime.today()-x.date).days > 15 and (datetime.today()-x.date).days < 30 , symptoms))
    elif n == 90:
        return list(filter(lambda x: (datetime.today()-x.date).days > 30 and (datetime.today()-x.date).days < 90 , symptoms))

register.filter(is_less_than_15_days)
def is_less_than_30_days(input_date):
    from datetime import datetime
    time_delta = datetime.today() - input_date
    return time_delta.days < 30 and time_delta.days > 15
register.filter(is_less_than_30_days)
def is_less_than_90_days(input_date):
    from datetime import datetime
    time_delta = datetime.today() - input_date
    return time_delta.days < 90 and time_delta.days > 30
register.filter(is_less_than_90_days)
def datesince(input_date, n):
    from datetime import datetime
    time_delta = datetime.today().date() - input_date
    return time_delta.days > n
datesince.is_safe=True
register.filter("date_since", datesince)

register.filter( less_than_n_days_symptoms)
#less_than_n_days_symptoms.is_safe = True



