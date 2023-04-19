import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tads_app/generated/locale_keys.g.dart';
import 'package:tads_app/src/config/constants/constants.dart';
import 'package:tads_app/src/config/routes/app_routes.dart';
import 'package:tads_app/src/core/local_source/local_storage.dart';
import 'package:tads_app/src/core/utils/base_functions.dart';
import 'package:tads_app/src/features/common/presentation/components/buttons/app_elevated_button.dart';
import 'package:tads_app/src/features/common/presentation/components/buttons/app_outlined_button.dart';
import 'package:tads_app/src/features/common/presentation/components/text_inputs/app_text_input.dart';
import 'package:tads_app/src/features/common/presentation/dialogs/settings_dialog.dart';
import 'package:tads_app/src/features/login/presentation/blocs/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerID = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  late LoginBloc bloc;
  bool _hidden = true;

  @override
  void initState() {
    super.initState();
    bloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.statusLogin.isSuccess) {
            LocalStorage.setID(int.parse(_controllerID.text));
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.setPinCode,
              (route) => false,
            );
          }
          if (state.statusLogin.isFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    kHeight48,
                    IconButton(
                      onPressed: () async {
                        var prev = context.locale.languageCode;
                        await showDialog(
                          context: context,
                          builder: (context) => SettingsDialog(
                            language: prev,
                          ),
                        ).then((value) async {
                          if (context.locale.languageCode != prev) {
                            bloc
                              ..dispose()
                              ..newRepo();
                          }
                        });
                      },
                      icon: const Icon(Icons.settings),
                    ),
                    const Spacer(),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _controllerID,
                          validator: ((s) {
                            if (s!.length < 6) {
                              return LocaleKeys.length_input.tr(args: ['6']);
                            }
                            return null;
                          }),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                          ],
                          keyboardType: TextInputType.number,
                          maxLength: 20,
                          decoration: InputDecoration(
                            hintText:
                                'ID, ${LocaleKeys.email.tr()} ${LocaleKeys.or.tr()} ${LocaleKeys.phone_number.tr()}',
                            counterText: '',
                          ),
                        ),
                        kHeight16,
                        AppTextInput(
                          maxLength: 32,
                          controller: _controllerPassword,
                          validator: ((s) {
                            if (!BaseFunctions.validPassword(s ?? '')) {
                              return LocaleKeys.password_requirement.tr();
                            }
                            return null;
                          }),
                          hidden: _hidden,
                          onTapSuffix: () {
                            setState(() {
                              _hidden = !_hidden;
                            });
                          },
                          hintText: LocaleKeys.password.tr(),
                          suffixIcon: Icons.remove_red_eye_outlined,
                        ),
                        kHeight24,
                        AppElevatedButton(
                          onTap: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              bloc.add(PostLoginEvent(
                                uid: _controllerID.text,
                                password: _controllerPassword.text,
                              ));
                            }
                          },
                          text: LocaleKeys.login.tr(),
                          isLoading: state.statusLogin.isInProgress,
                        ),
                        kHeight16,
                        TextButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 16,
                            ),
                            child: Text(LocaleKeys.forgot_password.tr()),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    AppOutlinedButton(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.register);
                      },
                      size: const Size(200, 32),
                      isLoading: state.statusLogin.isInProgress,
                      text: LocaleKeys.registration.tr(),
                    ),
                    kHeight24,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
