import 'package:flutter/material.dart';
import '../utils/secure_storage.dart';

class SetPinScreen extends StatefulWidget {
  const SetPinScreen({super.key});

  @override
  State<SetPinScreen> createState() => _SetPinScreenState();
}


class _SetPinScreenState extends State<SetPinScreen> {
  
  final _pinController = TextEditingController();
  final _confirmPinController = TextEditingController();
  
  String _status = '';

  void _savePin() async {
    final pin = _pinController.text;
    final confirmPin = _confirmPinController.text;

    if (pin.length != 4 || confirmPin.length != 4) {
      setState(() => _status = 'PIN must be 4 digits');
      return;
    }

    if (pin != confirmPin) {
      setState(() => _status = 'PINs do not match');
      return;
    }

    await SecureStorage.savePin(pin);
    setState(() => _status = 'PIN saved successfully ✅');

    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Set Your PIN')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Enter a 4-digit PIN', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            TextField(
              controller: _pinController,
              obscureText: true,
              keyboardType: TextInputType.number,
              maxLength: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter PIN',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _confirmPinController,
              obscureText: true,
              keyboardType: TextInputType.number,
              maxLength: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Confirm PIN',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _savePin,
              child: const Text('Save PIN'),
            ),
            const SizedBox(height: 16),
            if (_status.isNotEmpty)
              Text(_status,
                  style: TextStyle(
                    color: _status.contains('✅') ? Colors.green : Colors.red,
                  )),
          ],
        ),
      ),
    );
  }
}
