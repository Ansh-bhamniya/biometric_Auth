import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BiometricAuthService {
  static final LocalAuthentication _auth = LocalAuthentication();

  /// Check if device supports biometric or device-level authentication (PIN/Pattern)
  static Future<bool> hasBiometricSupport() async {
    try {
      return await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
    } on PlatformException catch (e) {
      print("❌ Biometric support check failed: $e");
      return false;
    }
  }

  /// Authenticate the user with biometrics or device credentials (PIN/password).
  ///
  /// Optionally pass [context] to redirect to a custom PIN fallback screen on failure.
  static Future<bool> authenticateUser({BuildContext? context}) async {
    try {
      final isAvailable = await hasBiometricSupport();

      if (!isAvailable) {
        print('⚠️ Biometric or device authentication not available.');
        if (context != null) {
          Navigator.pushNamed(context, '/pin');
        }
        return false;
      }

      final didAuthenticate = await _auth.authenticate(
        localizedReason: 'Please authenticate to access your account',
        options: const AuthenticationOptions(
          biometricOnly: false,     // ✅ Allows fallback to PIN/password
          stickyAuth: true,         // Keeps session alive if app pauses
          useErrorDialogs: true,    // Shows default system UI
        ),
      );

      if (!didAuthenticate && context != null) {
        // ❗ User cancelled or failed → Fallback to your custom PIN screen
        Navigator.pushNamed(context, '/pin');
      }

      return didAuthenticate;
    } on PlatformException catch (e) {
      print("❌ Authentication error: ${e.message}");
      if (context != null) {
        Navigator.pushNamed(context, '/pin');
      }
      return false;
    }
  }
}
