import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:tads_app/generated/locale_keys.g.dart';
import 'package:tads_app/src/config/constants/constants.dart';
import 'package:tads_app/src/config/routes/app_routes.dart';
import 'package:tads_app/src/config/theme/app_icons.dart';
import 'package:tads_app/src/core/local_source/local_storage.dart';
import 'package:tads_app/src/core/utils/base_functions.dart';
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
                      TextFormField(
                        maxLength: 32,
                        controller: _controllerPassword,
                        validator: ((s) {
                          if (!BaseFunctions.validPassword(s ?? '')) {
                            return LocaleKeys.password_requirement.tr();
                          }
                          return null;
                        }),
                        obscureText: _hidden,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              setState(() {
                                _hidden = !_hidden;
                              });
                            },
                            child: AnimatedSwitcher(
                              duration: const Duration(microseconds: 1000),
                              switchInCurve: Curves.easeIn,
                              switchOutCurve: Curves.easeOut,
                              child: !_hidden
                                  ? const Icon(Icons.remove_red_eye_outlined)
                                  : SvgPicture.asset(AppIcons.eye,
                                      width: 18,
                                      height: 18,
                                      colorFilter: ColorFilter.mode(
                                          Theme.of(context)
                                                  .appBarTheme
                                                  .titleTextStyle
                                                  ?.color ??
                                              Colors.white,
                                          BlendMode.srcIn)),
                            ),
                          ),
                          hintText: LocaleKeys.password.tr(),
                          counterText: '',
                        ),
                      ),
                      kHeight24,
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            bloc.add(RegisterEvent(_controllerPassword.text));
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
