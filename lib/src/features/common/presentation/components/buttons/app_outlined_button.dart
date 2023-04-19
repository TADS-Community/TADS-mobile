import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLoading;
  final String text;
  final Size? size;

  const AppOutlinedButton({
    required this.onTap,
    required this.text,
    this.isLoading = false,
    this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading ? null : onTap,
      style: size != null
          ? OutlinedButton.styleFrom(minimumSize: const Size(200, 32))
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
