import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tads_app/generated/locale_keys.g.dart';
import 'package:tads_app/src/core/constants/constants.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _controllerID = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LocaleKeys.login.tr(),
                style: Theme.of(context).textTheme.titleLarge),
            kHeight24,
            TextFormField(
              controller: _controllerID,
              validator: ((s) {
                print(s);
              }),
              decoration: const InputDecoration(hintText: 'ID'),
            ),
            kHeight16,
            TextFormField(
              controller: _controllerPassword,
              validator: ((s) {
                print(s);
              }),
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            kHeight24,
            TextButton(
              onPressed: () {},
              child: Text('Enter',style: Theme.of(context).textTheme.labelLarge,),
            ),
          ],
        ),
      ),
    );
  }
}
