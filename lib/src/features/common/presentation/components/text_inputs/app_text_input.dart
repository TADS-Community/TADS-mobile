import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tads_app/src/config/theme/app_icons.dart';

class AppTextInput extends StatelessWidget {
  final TextEditingController? controller;
  final int? maxLength;
  final String? Function(String?)? validator;
  final bool hidden;
  final VoidCallback onTapSuffix;
  final String hintText;
  final IconData? suffixIcon;

  const AppTextInput({
    required this.controller,
    this.maxLength,
    this.validator,
    this.hidden = false,
    required this.onTapSuffix,
    required this.hintText,
    this.suffixIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      controller: controller,
      validator: validator,
      obscureText: hidden,
      decoration: InputDecoration(
        suffixIcon: suffixIcon == null
            ? null
            : GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onTapSuffix,
                child: AnimatedSwitcher(
                  duration: const Duration(microseconds: 1000),
                  switchInCurve: Curves.easeIn,
                  switchOutCurve: Curves.easeOut,
                  child: !hidden
                      ? Icon(suffixIcon!)
                      : SvgPicture.asset(
                          AppIcons.eye_slash,
                          width: 18,
                          height: 18,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context)
                                    .appBarTheme
                                    .titleTextStyle
                                    ?.color ??
                                Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                ),
              ),
        hintText: hintText,
        counterText: '',
      ),
    );
  }
}
