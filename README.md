
# 💬 Groq Chatbot Integration

A full-stack chatbot application with a **Django backend** powered by **Groq AI**, and a **Flutter frontend** for real-time, intelligent chat on mobile devices.

---

## 🗂️ Project Structure

```
chatBot
├── chatbot/               # Django app
│   ├── migrations/
│   ├── admin.py
│   ├── apps.py
│   ├── models.py          # ChatMessage model
│   ├── serializers.py     # DRF serializers
│   ├── urls.py
│   ├── views.py           # API logic
│   └── groq_client.py     # Groq API integration
├── chatBot/                # Django project settings
├── flutter_bot/     # Flutter frontend
│   ├── lib/
│   │   ├── models/
│   │   ├── providers/
│   │   ├── services/
│   │   ├── widgets/
│   │   └── screens/
│   └── pubspec.yaml
└── README.md
```

---

## 🚀 Features

### 🔧 Django Backend
- REST API for chat operations
- Integration with **Groq AI** for smart responses
- SQLite for development (PostgreSQL recommended in production)
- Admin panel for managing chat history

### 📱 Flutter Frontend
- Cross-platform app (Android/iOS)
- Real-time, interactive chat UI
- Message history viewing
- Modern and responsive design

---

## 📦 Prerequisites

- **Python** 3.8+
- **Django** 4.2+
- **Flutter** 3.0+
- **Dart SDK**
- Groq API key → [Get from Groq Console](https://console.groq.com/)

---

## ⚙️ Installation

### 🔙 Backend Setup (Django)

1. **Clone the repository**:
   ```bash
   git clone https://github.com/elliot-hacks/FlutterNDjango101.git
   cd chatBot
   ```

2. **Create and activate virtual environment**:
   ```bash
   python -m venv venv
   source venv/bin/activate  # Windows: venv\Scripts\activate
   ```

3. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

4. **Create `.env` file**:
   ```ini
   DEBUG=True
   DJANGO_SECRET_KEY=your-secret-key-here
   GROQ_API_KEY=your-groq-api-key-here
   ```

5. **Apply migrations**:
   ```bash
   python manage.py migrate
   ```

6. **Create superuser**:
   ```bash
   python manage.py createsuperuser
   ```

7. **Run the server**:
   ```bash
   python manage.py runserver
   ```

---

### 📲 Frontend Setup (Flutter)

1. **Navigate to Flutter directory**:
   ```bash
   cd flutter_bot
   ```

2. **Install Flutter dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

---

## 🔧 Configuration

### 🔗 Backend URLs

- **API Base URL**: `http://localhost:8000/api/chat/`  
- **Admin Interface**: `http://localhost:8000/admin/`

### ⚙️ Frontend Configuration

Edit `lib/services/api_service.dart`:

```dart
// For web
static const String _baseUrl = 'http://localhost:8000';

// For Android emulator
static const String _baseUrl = 'http://10.0.2.2:8000';

// For physical devices
static const String _baseUrl = 'http://<YOUR-IP>:8000';
```

---

## 🚀 Deployment Notes

### 🛠️ Backend (Django)
- Set `DEBUG=False` in `.env`
- Use PostgreSQL in production
- Set proper `CORS_ALLOWED_ORIGINS`
- Use `Gunicorn + Nginx` for WSGI deployment

### 📦 Frontend (Flutter)
- **Build APK**:
  ```bash
  flutter build apk --release
  ```

- **Build iOS**:
  ```bash
  flutter build ios --release
  ```

- **Build Web**:
  ```bash
  flutter build web
  ```

---

## 📡 API Endpoints

| Endpoint        | Method | Description            |
|-----------------|--------|------------------------|
| `/api/chat/`    | GET    | Retrieve chat history  |
| `/api/chat/`    | POST   | Send a new message     |

---


## 🧩 Troubleshooting

### 🔄 Django CORS Issues
- Ensure `corsheaders` is in `INSTALLED_APPS`
- Add your Flutter origin to `CORS_ALLOWED_ORIGINS`
- Add `CorsMiddleware` at the top of `MIDDLEWARE`

### 📡 Flutter Connection Issues
- For Android: Add a network config
- For physical devices: Ensure device & PC are on the same network
- Use `flutter run -v` for verbose logging

---

## 📜 License

This project is licensed under the **MIT License**. See the [LICENSE](./LICENSE) file for details.

---

## 🤝 Contributing

1. Fork the repository  
2. Create your feature branch  
3. Commit your changes  
4. Push to the branch  
5. Open a pull request