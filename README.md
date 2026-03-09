# 📚 Bookia

A feature-rich **Flutter bookstore app** with full authentication flows, book browsing, wishlist management, and shopping cart functionality — powered by a REST API backend.

---

## ✨ Features

| Area | What's Included |
|------|-----------------|
| **Auth** | Login · Register · Forgot Password · OTP Verification · Reset Password |
| **Home** | Image slider · Best-sellers section · Browse all products |
| **Book Details** | Detailed book page with add-to-cart & wishlist actions |
| **Wishlist** | Add / remove books from your wishlist |
| **Cart** | View cart · Update quantities · Remove items |
| **Navigation** | Bottom navigation bar (Home, Wishlist, Cart, Profile) |
| **Onboarding** | Animated splash screen · Welcome page |

---

## 🏗️ Architecture

The project follows a **feature-first clean architecture** pattern with the **BLoC (Cubit)** state management approach.

```
lib/
├── main.dart                   # App entry point
├── components/                 # Reusable UI widgets
│   ├── app_bar_arrow.dart
│   ├── inbut_field.dart
│   ├── main_button.dart
│   ├── nav_bar_text.dart
│   ├── search_field.dart
│   └── social_media_icon.dart
├── core/                       # Shared infrastructure
│   ├── constants/              # Asset names & constants
│   ├── extentions/             # Dialog helpers
│   ├── routes/                 # GoRouter configuration
│   ├── services/
│   │   ├── api/                # Dio HTTP client & endpoints
│   │   └── local/              # SharedPreferences helper
│   └── utils/                  # Theme, colors, text styles
└── features/                   # Feature modules
    ├── auth/                   # Authentication flows
    │   ├── data/               # Models & repository
    │   └── presentation/       # Cubit, pages & widgets
    ├── home/                   # Home, product list, details
    │   ├── data/
    │   └── presentaion/
    ├── cart/                   # Shopping cart
    │   ├── data/
    │   └── presentation/
    ├── wishlist/               # Wishlist management
    │   ├── data/
    │   └── presentation/
    ├── main/                   # Bottom navigation shell
    ├── splash/                 # Splash screen
    └── welcome/                # Welcome / onboarding screen
```

Each feature follows the **data → presentation** layering:
- **data/** — API repository + request/response models
- **presentation/** — Cubit (state management) + Pages + Widgets

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|------------|
| Framework | Flutter (SDK ^3.8.1) |
| State Management | flutter_bloc / Cubit |
| Routing | go_router |
| Networking | Dio |
| Local Storage | shared_preferences |
| UI Extras | flutter_svg · lottie · carousel_slider · smooth_page_indicator · pinput |
| Custom Font | DM Serif Display |

---

## 🚀 Getting Started

```bash
# Clone the repository
git clone https://github.com/Mustafahu21/bookia.git
cd bookia

# Install dependencies
flutter pub get

# Run the app
flutter run
```

> **Prerequisites:** Flutter SDK ^3.8.1 installed and configured.

---

## 📂 Key Screens

1. **Splash** → Animated intro  
2. **Welcome** → Onboarding page  
3. **Login / Register** → Full auth flow with form validation  
4. **Forgot Password** → Email → OTP → New Password → Success  
5. **Home** → Image slider + best-sellers + "See All" products  
6. **Book Details** → Cover, description, add to cart / wishlist  
7. **Wishlist** → Saved books list  
8. **Cart** → Cart items with quantity controls  
