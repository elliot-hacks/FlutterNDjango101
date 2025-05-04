from django.contrib import admin
from .models import ChatMessage

class ChatMessageAdmin(admin.ModelAdmin):
    # Fields to display in the list view
    list_display = ('id', 'truncated_user_message', 'truncated_bot_response', 'created_at')
    # Fields that can be used to filter the list
    list_filter = ('created_at',)
    # Fields that can be searched
    search_fields = ('user_message', 'bot_response')
    # Make the created_at field read-only
    readonly_fields = ('created_at',)
    # Order by most recent first
    ordering = ('-created_at',)
    # Fields to display in the detail view
    fieldsets = (
        (None, {
            'fields': ('user_message', 'bot_response', 'created_at')
        }),
    )
    
    def truncated_user_message(self, obj):
        return obj.user_message[:50] + '...' if len(obj.user_message) > 50 else obj.user_message
    truncated_user_message.short_description = 'User Message (truncated)'
    
    def truncated_bot_response(self, obj):
        return obj.bot_response[:50] + '...' if len(obj.bot_response) > 50 else obj.bot_response
    truncated_bot_response.short_description = 'Bot Response (truncated)'

# Register the model with the custom admin class
admin.site.register(ChatMessage, ChatMessageAdmin)