import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_widget/flutter_pin_code_widget.dart';
import 'package:tads_app/generated/locale_keys.g.dart';
import 'package:tads_app/src/config/constants/constants.dart';
import 'package:tads_app/src/config/routes/app_routes.dart';
import 'package:tads_app/src/config/theme/app_colors.dart';
import 'package:tads_app/src/core/local_source/local_storage.dart';

class PinCodeSetPage extends StatefulWidget {
  const PinCodeSetPage({Key? key}) : super(key: key);

  @override
  State<PinCodeSetPage> createState() => _PinCodeSetPageState();
}

class _PinCodeSetPageState extends State<PinCodeSetPage> {
  String temp = '';
  StreamController<bool> streamController = StreamController();
  String commandText = LocaleKeys.create_pin.tr();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              LocaleKeys.set_up_pin.tr(),
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
                buttonColor: LocalStorage.getThemeMode == dark
                    ? AppColors.appIconBackground
                    : AppColors.oceanLight1,
                deleteButtonColor: LocalStorage.getThemeMode == dark
                    ? AppColors.appIconBackground
                    : AppColors.oceanLight1,
                minPinLength: 4,
                maxPinLength: 4,
                onChangedPin: (pin) {
                  // check the PIN length and check different PINs with 4,5.. length.
                  if (pin.length == 4) {
                    if (temp.isEmpty) {
                      temp = pin;
                      streamController.add(true);
                      setState(() {
                        commandText = LocaleKeys.confirm_pin.tr();
                      });
                    } else if (temp == pin) {
                      LocalStorage.setPinCode(pin);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoutes.home, (route) => false);
                    } else {
                      setState(() {
                        temp = '';
                        commandText = LocaleKeys.create_pin.tr();
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
