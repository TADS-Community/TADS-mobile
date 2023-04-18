import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pin_code_widget/flutter_pin_code_widget.dart';
import 'package:tads_app/src/config/routes/app_routes.dart';
import 'package:tads_app/src/core/local_source/local_storage.dart';
import 'package:tads_app/src/features/app/presentation/blocs/app_bloc.dart';

class PinCodeSetPage extends StatefulWidget {
  const PinCodeSetPage({Key? key}) : super(key: key);

  @override
  State<PinCodeSetPage> createState() => _PinCodeSetPageState();
}

class _PinCodeSetPageState extends State<PinCodeSetPage> {
  String temp = '';
  StreamController<bool> streamController = StreamController();
  String commandText = 'Create PIN';

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
            Text(commandText),
            const SizedBox(height: 60),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: PinCodeWidget(
                filledIndicatorColor: Colors.greenAccent,
                clearStream: streamController.stream,
                minPinLength: 4,
                maxPinLength: 4,
                onChangedPin: (pin) {
                  // check the PIN length and check different PINs with 4,5.. length.
                  if (pin.length == 4) {
                    if (temp.isEmpty) {
                      temp = pin;
                      streamController.add(true);
                      setState(() {
                        commandText = 'Confirm PIN';
                      });
                    } else if (temp == pin) {
                      LocalStorage.setPinCode(pin);
                      context.read<AppBloc>().add(ChangeLockEvent());
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoutes.home, (route) => false);
                    } else {
                      setState(() {
                        temp = '';
                        commandText = 'Create PIN';
                      });
                    }
                  }
                },
                onEnter: (pin, _) {
                  // callback user pressed enter
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
