from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import TemplateView
from django.shortcuts import render, redirect

class IndexPageView(LoginRequiredMixin, TemplateView):
    template_name = 'index.html'

    def get(self, request, *args, **kwargs):
       return redirect('operations:home')


    # def get(self, request, *args, **kwargs):
    #     return redirect('operations:admissions')


class ChangeLanguageView(TemplateView):
    template_name = 'change_language.html'
