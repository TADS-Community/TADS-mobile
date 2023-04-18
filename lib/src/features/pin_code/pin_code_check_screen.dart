import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pin_code_widget/flutter_pin_code_widget.dart';
import 'package:tads_app/src/config/constants/constants.dart';
import 'package:tads_app/src/config/routes/app_routes.dart';
import 'package:tads_app/src/core/local_source/local_storage.dart';
import 'package:tads_app/src/features/app/presentation/blocs/app_bloc.dart';

class PinCodeCheckPage extends StatefulWidget {
  const PinCodeCheckPage({Key? key}) : super(key: key);

  @override
  State<PinCodeCheckPage> createState() => _PinCodeCheckPageState();
}

class _PinCodeCheckPageState extends State<PinCodeCheckPage> {
  Color enterColor = Colors.greenAccent;
  String commandText = 'Enter the PIN';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            kHeight48,
            Text(commandText),
            kHeight48,
            kHeight48,
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: PinCodeWidget(
                filledIndicatorColor: enterColor,
                minPinLength: 4,
                maxPinLength: 4,
                onChangedPin: (pin) {
                  if (pin.length == 4) {
                    if (pin == LocalStorage.getPinCode) {
                      context.read<AppBloc>().add(ChangeLockEvent());
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.home,
                        (route) => false,
                      );
                    } else {
                      setState(() {
                        enterColor = Colors.red;
                      });
                    }
                  } else {
                    setState(() {
                      enterColor = Colors.greenAccent;
                    });
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
