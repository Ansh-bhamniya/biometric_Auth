import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final _storage = FlutterSecureStorage();
  static const String _pinKey = "user_pin";

  static Future<void> savePin(String pin) async {
    await _storage.write(key: _pinKey, value: pin);
  }
  static Future<String?> getPin() async {
      return await _storage.read(key: _pinKey);
  }  

  static Future<bool> hasPin() async {
    return (await getPin()) != null;
  }
  static Future<void> deletePin() async {
    await _storage.delete(key: _pinKey);
  }

  static Future<void> setLoginStatus(bool status) async {
    await _storage.write(key: 'isLoggedIn', value: status.toString());
  }

  static Future<bool> getLoginStatus() async {
    String? value = await _storage.read(key: 'isLoggedIn');
    return value == 'true';
  }

  static Future<void> logout() async {
    await _storage.delete(key: 'isLoggedIn');
  }
}
