import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isLoading;

  const AppElevatedButton({
    required this.onTap,
    required this.text,
    this.isLoading = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onTap,
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
