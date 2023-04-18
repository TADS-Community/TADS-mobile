import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tads_app/generated/locale_keys.g.dart';
import 'package:tads_app/src/config/constants/constants.dart';
import 'package:tads_app/src/core/local_source/local_storage.dart';
import 'package:tads_app/src/features/app/presentation/blocs/app_bloc.dart';

class SettingsDialog extends StatefulWidget {
  final String language;

  const SettingsDialog({required this.language, Key? key}) : super(key: key);

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  bool _switch = true;
  String _languageCode = uz;

  List<DropdownMenuItem<String>> items = [
    const DropdownMenuItem(
      value: uz,
      child: Text('Uzbek (UZ)'),
    ),
    const DropdownMenuItem(
      value: en,
      child: Text('English (US)'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _languageCode = widget.language;
    _switch = LocalStorage.getThemeMode == dark;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButton(
              value: _languageCode,
              items: items,
              icon: const Icon(Icons.language),
              onChanged: (value) {
                if (value != _languageCode) {
                  context.setLocale(Locale(value ?? _languageCode));
                  setState(() {
                    _languageCode = value ?? 'uz';
                  });
                  LocalStorage.setLocale(_languageCode);
                }
              }),
          kHeight4,
          Row(
            children: [
              Text(LocaleKeys.dark.tr()),
              kWidth4,
              Transform.scale(
                scale: 0.8,
                child: Switch.adaptive(
                  inactiveTrackColor: Theme.of(context).scaffoldBackgroundColor,
                  value: _switch,
                  onChanged: (value) {
                    context
                        .read<AppBloc>()
                        .add(ChangeThemeModeEvent(value ? dark : light));
                    LocalStorage.setThemeMode(value ? dark : light);
                    setState(() {
                      _switch = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
