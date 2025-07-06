# 📱 Biometric Login App with PIN Fallback

This Flutter app demonstrates secure user authentication using **biometrics (fingerprint/face)** with a **fallback to 4-digit PIN** login — similar to apps like CRED or Paytm.

---
video link : https://drive.google.com/file/d/1n6JLpU08zdNhx1MRhx_uNPp3Vs8l0LMs/view?usp=sharing
---


## ✅ Features

- 🔐 Biometric Authentication (Fingerprint / Face ID)
- 🔁 Fallback to 4-digit PIN
- 🧠 Secure local storage using `flutter_secure_storage`
- 🎨 Clean login and PIN UI
- 📲 Works on Android and iOS (real devices)

---

## 🧰 Tech Stack

- Flutter
- `local_auth` package
- `flutter_secure_storage`
- Native permissions for biometrics (Android & iOS)

---

## 📂 Project Structure

lib/
├── main.dart
├── screens/
│ ├── login_screen.dart
│ ├── home_screen.dart
│ ├── set_pin_screen.dart
│ └── verify_pin_screen.dart
├── services/
│ └── biometric_auth_service.dart
└── utils/
└── secure_storage.dart

---

## 🚀 How to Run

### 🔧 Setup

1. **Clone the repo**

```bash
git clone https://github.com/yourusername/biometric_login_app.git
cd biometric_login_app
