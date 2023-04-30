import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formz/formz.dart';
import 'package:tads_app/generated/locale_keys.g.dart';
import 'package:tads_app/src/config/constants/constants.dart';
import 'package:tads_app/src/features/profile/presentation/widgets/profile_text_input.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    Key? key,
    required this.status,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.updateFirstname,
    required this.updateLastname,
    required this.updateEmail,
    required this.updatePhone,
    required this.emailVerified,
    required this.phoneVerified,
    required this.verifyEmail,
    required this.verifyPhone,
  }) : super(key: key);

  final FormzSubmissionStatus status;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final bool emailVerified;
  final bool phoneVerified;
  final Function(String value) updateFirstname;
  final Function(String value) updateLastname;
  final Function(String value) updateEmail;
  final Function(String value) updatePhone;
  final VoidCallback verifyEmail;
  final VoidCallback verifyPhone;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).primaryColorLight,
      ),
      child: status.isInProgress
          ? const Center(child: CircularProgressIndicator.adaptive())
          : status.isFailure
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.warning_rounded,
                      size: 64,
                    ),
                    kHeight16,
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        LocaleKeys.unable_to_load.tr(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProfileTextInput(
                      onTapSuffix: updateFirstname,
                      hintText: LocaleKeys.first_name.tr(),
                      text: firstName,
                      keyboardType: TextInputType.text,
                    ),
                    const Divider(),
                    ProfileTextInput(
                      onTapSuffix: updateLastname,
                      hintText: LocaleKeys.last_name.tr(),
                      text: lastName,
                      keyboardType: TextInputType.text,
                    ),
                    const Divider(),
                    ProfileTextInput(
                      onTapSuffix: updateEmail,
                      validator: (value) {
                        final emailValidator =
                            RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!emailValidator.hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      hintText: LocaleKeys.email.tr(),
                      text: email,
                      keyboardType: TextInputType.text,
                    ),
                    Visibility(
                      visible: !emailVerified,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: OutlinedButton(
                          onPressed: verifyEmail,
                          style: OutlinedButton.styleFrom(
                              minimumSize: const Size(100, 32)),
                          child: Text(LocaleKeys.verify.tr()),
                        ),
                      ),
                    ),
                    const Divider(),
                    ProfileTextInput(
                      onTapSuffix: updatePhone,
                      hintText: LocaleKeys.phone_number.tr(),
                      text: phone,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'\d'))
                      ],
                    ),
                    Visibility(
                      visible: !phoneVerified,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: OutlinedButton(
                          onPressed: verifyPhone,
                          style: OutlinedButton.styleFrom(
                              minimumSize: const Size(100, 32)),
                          child: Text(LocaleKeys.verify.tr()),
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}
