import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tads_app/generated/locale_keys.g.dart';
import 'package:tads_app/src/config/constants/constants.dart';

class SuccessDialog extends StatefulWidget {
  final int id;

  const SuccessDialog({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  State<SuccessDialog> createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          kHeight8,
          const Icon(
            Icons.check_circle_outline,
            size: 36,
            color: Colors.green,
          ),
          kHeight36,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${LocaleKeys.your_id.tr()}:',
                style: GoogleFonts.roboto(),
              ),
              kWidth8,
              SelectableText(
                widget.id.toString(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
