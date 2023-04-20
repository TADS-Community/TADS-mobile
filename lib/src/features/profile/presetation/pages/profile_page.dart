import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tads_app/src/features/common/presentation/dialogs/settings_dialog.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: IconButton(
        onPressed: () async {
          var prev = context.locale.languageCode;
          showDialog(
            context: context,
            builder: (context) => SettingsDialog(
              language: prev,
            ),
          );
        },
        icon: const Icon(Icons.settings),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
