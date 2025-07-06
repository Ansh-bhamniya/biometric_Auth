import 'package:biometric_login_app/screens/pin_screen.dart';
import 'package:biometric_login_app/screens/set_pin_screen.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const BiometricLoginApp());
}

class BiometricLoginApp extends StatelessWidget {
  const BiometricLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biometric Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/pin' : ( context) => const PinScreen(),
        '/set-pin': (context) => const SetPinScreen(),
      },
    );
  }
}
