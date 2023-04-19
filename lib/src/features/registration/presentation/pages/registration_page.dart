import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tads_app/generated/locale_keys.g.dart';
import 'package:tads_app/src/config/constants/constants.dart';
import 'package:tads_app/src/config/routes/app_routes.dart';
import 'package:tads_app/src/core/local_source/local_storage.dart';
import 'package:tads_app/src/core/utils/base_functions.dart';
import 'package:tads_app/src/features/common/presentation/components/buttons/app_elevated_button.dart';
import 'package:tads_app/src/features/common/presentation/components/text_inputs/app_text_input.dart';
import 'package:tads_app/src/features/registration/presentation/blocs/registration_bloc.dart';
import 'package:tads_app/src/features/registration/presentation/widgets/success_dialog.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerPassword = TextEditingController();
  late RegistrationBloc bloc;
  bool _hidden = true;

  @override
  void initState() {
    super.initState();
    bloc = RegistrationBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocConsumer<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state.statusReg.isSuccess) {
            LocalStorage.setID(state.id);
            showDialog(
              context: context,
              builder: (context) => SuccessDialog(
                id: state.id,
              ),
            ).then((value) => Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.setPinCode,
                  (route) => false,
                ));
          }
          if (state.statusReg.isFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async {
              if (state.statusReg.isInProgress) {
                return false;
              }
              return true;
            },
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            bloc.add(RegisterEvent(_controllerPassword.text));
                          }
                        },
                        text: LocaleKeys.enter.tr(),
                        isLoading: state.statusReg.isInProgress,
                      ),
                    ],
                  ),
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
