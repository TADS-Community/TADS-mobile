import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pin_code_widget/flutter_pin_code_widget.dart';
import 'package:local_auth/local_auth.dart';
import 'package:tads_app/src/config/constants/constants.dart';
import 'package:tads_app/src/config/routes/app_routes.dart';
import 'package:tads_app/src/core/local_source/local_storage.dart';
import 'package:tads_app/src/features/app/presentation/blocs/app_bloc.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class PinCodeCheckPage extends StatefulWidget {
  const PinCodeCheckPage({Key? key}) : super(key: key);

  @override
  State<PinCodeCheckPage> createState() => _PinCodeCheckPageState();
}

class _PinCodeCheckPageState extends State<PinCodeCheckPage> {
  final LocalAuthentication auth = LocalAuthentication();
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
                centerBottomWidget: IconButton(
                  icon: const Icon(
                    Icons.fingerprint,
                    size: 40,
                  ),
                  onPressed: () async {
                    try {
                      auth
                          .authenticate(
                              localizedReason:
                                  'Please authenticate to show account balance',
                              options: const AuthenticationOptions(
                                  useErrorDialogs: false))
                          .then((value) {
                        if (value) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRoutes.home,
                            (route) => false,
                          );
                        }
                      });
                    } on PlatformException catch (e) {
                      if (e.code == auth_error.notEnrolled) {
                        // Add handling of no hardware here.
                      } else if (e.code == auth_error.lockedOut ||
                          e.code == auth_error.permanentlyLockedOut) {
                        // ...
                      } else {
                        // ...
                      }
                    }
                  },
                ),
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
