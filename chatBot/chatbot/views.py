from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.renderers import TemplateHTMLRenderer
from .models import ChatMessage
from .serializers import ChatMessageSerializer
from .groq_client import GroqClient

class ChatbotAPIView(APIView):
    def get(self, request):
        messages = ChatMessage.objects.all().order_by('created_at')
        serializer = ChatMessageSerializer(messages, many=True)
        return Response(serializer.data)

    def post(self, request):
        user_message = request.data.get('user_message')
        if not user_message:
            return Response(
                {'error': 'user_message is required'},
                status=status.HTTP_400_BAD_REQUEST
            )

        # Get response from Groq
        groq_client = GroqClient()
        bot_response = groq_client.get_chat_response(user_message)

        # Save to database
        chat = ChatMessage.objects.create(
            user_message=user_message,
            bot_response=bot_response
        )

        serializer = ChatMessageSerializer(chat)
        return Response(serializer.data, status=status.HTTP_201_CREATED)

class ChatbotLandingPage(APIView):
    renderer_classes = [TemplateHTMLRenderer]
    template_name = 'index.html'

    def get(self, request):
        messages = ChatMessage.objects.all().order_by('created_at')[:10]
        serializer = ChatMessageSerializer(messages, many=True)
        return Response({'messages': serializer.data})