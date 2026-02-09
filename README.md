# 🗞️ News App (Flutter)

A modern **Flutter News Application** built with a strong focus on **clean architecture, performance, and scalable state management**.  
This project demonstrates real-world app features like localization, theming, caching, pagination, and infinite scrolling using **Riverpod**.

---

## ✨ Features

✅ **Localization (i18n)**
- Multi-language support
- Easy language switching
- Scalable localization setup

🎨 **Dynamic Theme Support**
- Light & Dark mode
- Centralized color theming
- Consistent UI across the app

⚡ **Efficient State Management (Riverpod)**
- Clean separation of concerns
- Reactive UI updates
- Test-friendly architecture

📦 **Caching Mechanism**
- Reduces unnecessary API calls
- Improves performance and user experience

📄 **Pagination & Infinite Scroll**
- Smooth infinite scrolling for news lists
- Lazy loading of data
- Optimized API usage

🔄 **Pull-to-Refresh**
- Refresh news content with a swipe
- Proper loading & error handling states

🧠 **Proper App Architecture**
- Repository pattern
- Provider-based dependency injection
- Scalable for large projects

---

## 🛠️ Tech Stack

- **Flutter**
- **Dart**
- **Riverpod**
- REST API integration
- Material Design

---

## 📁 Project Structure (Simplified)

```text
lib/
├── core/
│   ├── theme/
│   ├── localization/
│   ├── network/
│   └── constants/
├── features/
│   └── news/
│       ├── data/
│       ├── domain/
│       └── presentation/
├── shared/
├── main.dart
