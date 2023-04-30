import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLoading;
  final String text;
  final Size? size;
  final Color? textColor;
  final Color? borderColor;

  const AppOutlinedButton({
    required this.onTap,
    required this.text,
    this.isLoading = false,
    this.size,
    this.textColor,
    this.borderColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading ? null : onTap,
      style: size != null
          ? OutlinedButton.styleFrom(
              minimumSize: size ?? const Size(200, 32),
              foregroundColor: textColor,
              side:
                  borderColor != null ? BorderSide(color: borderColor!) : null,
            )
          : null,
      child: isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
                strokeWidth: 3,
              ),
            )
          : Text(text),
    );
  }
}
