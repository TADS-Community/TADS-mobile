import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          if (_controllerID.text.isEmpty && state.statusID.isSuccess) {
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
                    Text('${LocaleKeys.generated_id.tr()}:'),
                    kHeight8,
                    TextFormField(
                      controller: _controllerID,
                      validator: ((s) {
                        if (s!.isEmpty) {
                          return LocaleKeys.error_generating.tr();
                        }
                        return null;
                      }),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                      readOnly: true,
                      keyboardType: TextInputType.number,
                      maxLength: 20,
                      decoration: InputDecoration(
                        suffixIcon: Stack(
                          children: [
                            Visibility(
                              visible: state.statusID.isFailure,
                              child: IconButton(
                                icon: const Icon(Icons.refresh),
                                onPressed: () {
                                  if (!state.statusID.isInProgressOrSuccess) {
                                    bloc.add(GenerateID());
                                  }
                                },
                              ),
                            ),
                            if (state.statusID.isInProgress)
                              const Positioned(
                                top: 10,
                                bottom: 10,
                                right: 10,
                                left: 10,
                                child: CircularProgressIndicator(),
                              ),
                          ],
                        ),
                        hintText: 'ID',
                        counterText: '',
                      ),
                    ),
                    kHeight16,
                    TextFormField(
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
                        if (_formKey.currentState?.validate() ?? false) {}
                      },
                      child: Text(LocaleKeys.enter.tr()),
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
