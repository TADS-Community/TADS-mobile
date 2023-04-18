import 'package:flutter/material.dart';
import 'package:flutter_pin_code_widget/flutter_pin_code_widget.dart';

class PinCodeSetPage extends StatefulWidget {
  const PinCodeSetPage({Key? key}) : super(key: key);

  @override
  State<PinCodeSetPage> createState() => _PinCodeSetPageState();
}

class _PinCodeSetPageState extends State<PinCodeSetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              'Set up PIN',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            const Text('You can use this PIN to unlock the app..'),
            const Text('Pin length is 4-25 digits'),
            const SizedBox(height: 60),
            Expanded(
              child: PinCodeWidget(
                minPinLength: 4,
                maxPinLength: 25,
                onChangedPin: (pin) {
                  // check the PIN length and check different PINs with 4,5.. length.
                },
                onEnter: (pin, _) {
                  // callback user pressed enter
                },
                centerBottomWidget: IconButton(
                  icon: const Icon(
                    Icons.fingerprint,
                    size: 40,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
