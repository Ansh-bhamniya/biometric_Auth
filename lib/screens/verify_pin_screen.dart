import 'package:flutter/material.dart';
import '../utils/secure_storage.dart';

class VerifyPinScreen extends StatefulWidget {
  const VerifyPinScreen({super.key});

  @override
  State<VerifyPinScreen> createState() => _VerifyPinScreenState();
}

class _VerifyPinScreenState extends State<VerifyPinScreen> {
  final TextEditingController _pinController = TextEditingController();
  String _status = '';
  bool _isLoading = false;

  void _verifyPin() async {
    setState(() {
      _isLoading = true;
      _status = '';
    });

    final enteredPin = _pinController.text;
    final savedPin = await SecureStorage.getPin();

    await Future.delayed(const Duration(milliseconds: 300)); // UI delay

    if (enteredPin == savedPin) {
      setState(() {
        _status = '✅ PIN Verified';
        _isLoading = false;
      });
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        _status = '❌ Incorrect PIN';
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unlock with PIN'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock_outline, size: 80, color: Colors.deepPurple),
            const SizedBox(height: 20),
            const Text(
              'Enter your 4-digit PIN',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _pinController,
              obscureText: true,
              keyboardType: TextInputType.number,
              maxLength: 4,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'PIN',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _verifyPin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Login', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 16),
            if (_status.isNotEmpty)
              Text(
                _status,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _status.contains('✅') ? Colors.green : Colors.red,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
