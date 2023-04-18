import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tads_app/generated/locale_keys.g.dart';
import 'package:tads_app/src/config/constants/constants.dart';
import 'package:tads_app/src/features/registration/presentation/blocs/registration_bloc.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerID = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  late RegistrationBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = RegistrationBloc()..add(GenerateID());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (_controllerID.text.isEmpty && state.statusReg.isSuccess) {
            _controllerID.text = state.id ?? '';
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      maxLength: 32,
                      controller: _controllerPassword,
                      validator: ((s) {
                        if (s!.length < 8) {
                          return LocaleKeys.length_input.tr(args: ['8']);
                        }
                        return null;
                      }),
                      obscureText: true,
                      decoration:
                          InputDecoration(hintText: LocaleKeys.password.tr()),
                    ),
                    kHeight24,
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {

                        }
                      },
                      child: state.statusReg.isInProgress
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator.adaptive(
                                backgroundColor: Colors.white,
                                strokeWidth: 3,
                              ),
                            )
                          : Text(LocaleKeys.enter.tr()),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
