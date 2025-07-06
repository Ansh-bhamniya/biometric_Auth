import 'package:flutter/material.dart';
import '../services/biometric_auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _authStatus = '';
  bool _isLoading = false;

  Future<void> _handleBiometricLogin() async {
    setState(() {
      _isLoading = true;
      _authStatus = '';
    });

    final isAuthenticated =
        await BiometricAuthService.authenticateUser(context: context);

    setState(() {
      _isLoading = false;
      if (isAuthenticated) {
        _authStatus = 'Authentication Successful ✅';
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        _authStatus = 'Authentication Failed or Cancelled ❌';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.fingerprint, size: 100, color: Colors.deepPurple),
              const SizedBox(height: 32),
              const Text(
                'Secure Login',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Use your fingerprint or device PIN to continue',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 40),

              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton.icon(
                      onPressed: _handleBiometricLogin,
                      icon: const Icon(Icons.lock_open),
                      label: const Text('Login with Biometrics'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28, vertical: 14),
                        textStyle: const TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

              const SizedBox(height: 24),

              if (_authStatus.isNotEmpty)
                Column(
                  children: [
                    Text(
                      _authStatus,
                      style: TextStyle(
                        color: _authStatus.contains("Successful")
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    if (_authStatus.contains("Failed"))
                      TextButton(
                        onPressed: _handleBiometricLogin,
                        child: const Text("Try Again"),
                      )
                  ],
                ),

              const SizedBox(height: 30),

              const Text(
                'Can’t use fingerprint? Use your device PIN instead.',
                style: TextStyle(fontSize: 13, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
