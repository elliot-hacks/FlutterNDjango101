from django.urls import path
from .views import ChatbotAPIView, ChatbotLandingPage

urlpatterns = [
    path('api/chat/', ChatbotAPIView.as_view(), name='chatbot-api'),
    path('', ChatbotLandingPage.as_view(), name='chatbot-landing'),
]