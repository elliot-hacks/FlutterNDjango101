import os
from groq import Groq
from django.conf import settings

class GroqClient:
    def __init__(self):
        self.client = Groq(api_key=settings.GROQ_API_KEY)

    def get_chat_response(self, message, model="llama3-70b-8192"):
        try:
            chat_completion = self.client.chat.completions.create(
                messages=[
                    {
                        "role": "user",
                        "content": message
                    }
                ],
                model=model,
            )
            return chat_completion.choices[0].message.content
        except Exception as e:
            return f"Error getting response from Groq: {str(e)}"
