📱 Biometric Login App with PIN Fallback
This Flutter app demonstrates secure user authentication using biometrics (fingerprint/face) with a fallback to PIN login. It mirrors the login flow seen in secure apps like CRED or banking platforms.

✅ Features
🔐 Biometric Authentication (Fingerprint / Face ID)

🔁 Fallback to 4-digit PIN if biometrics unavailable or cancelled

🧠 Persistent PIN storage using flutter_secure_storage

🎨 Clean & minimal UI with biometric and PIN lock screen

🔁 Handles edge cases like missing hardware or failed attempts

🧰 Tech Stack
Flutter (Dart)

local_auth for biometric access

flutter_secure_storage for secure PIN storage

Android/iOS platform integration (via native configs)

🚀 Screens & Flow
Login Screen

Try biometric auth

Option to use/set PIN

Set PIN

First-time users can set a 4-digit PIN securely

Verify PIN

PIN-based login if biometric fails or isn't available

Home Screen

Dummy screen after successful login

📂 Folder Structure
css
Copy
Edit
lib/
├── main.dart
├── screens/
│   ├── login_screen.dart
│   ├── home_screen.dart
│   ├── set_pin_screen.dart
│   └── verify_pin_screen.dart
├── services/
│   └── biometric_auth_service.dart
└── utils/
    └── secure_storage.dart
📥 Setup Instructions
Clone the repo

bash
Copy
Edit
git clone https://github.com/yourusername/biometric_login_app.git
cd biometric_login_app
Install dependencies

bash
Copy
Edit
flutter pub get
Run the app

bash
Copy
Edit
flutter run
Run on real device for biometric auth (face/fingerprint)

Android: physical device with fingerprint or face auth setup

iOS: real device with Face ID/Touch ID or simulator with biometric enrollment

🔐 Permissions & Configuration
Android (android/app/src/main/AndroidManifest.xml)
xml
Copy
Edit
<uses-permission android:name="android.permission.USE_BIOMETRIC"/>
<uses-permission android:name="android.permission.USE_FINGERPRINT"/>
iOS (ios/Runner/Info.plist)
xml
Copy
Edit
<key>NSFaceIDUsageDescription</key>
<string>This app uses Face ID to authenticate the user</string>
📹 Demo Recordings
Type	Link
project-features	[Your Drive Link Here]
project-technical	[Your Drive Link Here]

💡 Rename videos like ansh_flutter_assignment_1.mp4 before uploading.
