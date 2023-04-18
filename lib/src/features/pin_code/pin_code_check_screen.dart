import 'package:flutter/material.dart';
import 'package:flutter_pin_code_widget/flutter_pin_code_widget.dart';

class PinCodePage extends StatefulWidget {
  const PinCodePage({Key? key}) : super(key: key);

  @override
  State<PinCodePage> createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Skip',
                style: TextStyle(color: Colors.blueAccent),
              ))
        ],
      ),
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
                  onPressed: () {

                  },
                ),
                borderSide: const BorderSide(width: 0),
                numbersStyle: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                ),
                // emptyIndicatorColor: context.colN30Pri80,
                filledIndicatorColor: Theme.of(context).primaryColor,
                // buttonColor: Theme.of(context).colorScheme.surf5darkSurfLight,
                // deleteButtonLabel: context.intl.delete,
                // deleteIconColor: Theme.of(context).colorScheme.surf5darkSurfLight,
                // deleteButtonColor: Theme.of(context).colorScheme.primary90,
                // clearStream: model.clearPin,
                // onEnter: (pin, __) => model.handlePinInput(pin, onFull: true),
                // onChangedPin: (_) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}