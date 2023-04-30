import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tads_app/generated/locale_keys.g.dart';
import 'package:tads_app/src/config/constants/constants.dart';
import 'package:tads_app/src/core/local_source/local_storage.dart';
import 'package:tads_app/src/features/common/presentation/dialogs/settings_dialog.dart';
import 'package:tads_app/src/features/profile/presentation/blocs/profile_bloc.dart';
import 'package:tads_app/src/features/profile/presentation/widgets/profile_text_input.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  final _formKey = GlobalKey<FormState>();
  late ProfileBloc bloc;
  final emailValidator = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  void initState() {
    super.initState();
    bloc = ProfileBloc()..add(GetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(LocaleKeys.profile.tr()),
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    var prev = context.locale.languageCode;
                    showDialog(
                      context: context,
                      builder: (context) => SettingsDialog(
                        language: prev,
                      ),
                    ).then((value) async {
                      if (context.locale.languageCode != prev) {
                        bloc
                          ..dispose()
                          ..newRepo();
                      }
                    });
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kHeight16,
                    Align(
                      alignment: Alignment.center,
                      child: IconButton(
                        onPressed: () async {},
                        icon: const Icon(
                          Icons.person_pin,
                          size: 64,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your ID:',
                          style: GoogleFonts.roboto(),
                        ),
                        kWidth8,
                        SelectableText(
                          LocalStorage.getID.toString(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    kHeight16,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).primaryColorLight,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ProfileTextInput(
                            onTapSuffix: (value) {
                              if (value != state.user.firstName) {
                                bloc.add(UpdateUserEvent(firstName: value));
                              }
                            },
                            hintText: 'First name',
                            text: state.user.firstName,
                            keyboardType: TextInputType.text,
                          ),
                          const Divider(),
                          ProfileTextInput(
                            onTapSuffix: (value) {
                              if (value != state.user.lastName) {
                                bloc.add(UpdateUserEvent(lastName: value));
                              }
                            },
                            hintText: 'Last name',
                            text: state.user.lastName,
                            keyboardType: TextInputType.text,
                          ),
                          const Divider(),
                          ProfileTextInput(
                            onTapSuffix: (value) {
                              if (_formKey.currentState?.validate() ?? false) {
                                if (value != state.user.email) {
                                  bloc.add(UpdateUserEvent(email: value));
                                }
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              if (!emailValidator.hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            hintText: 'Email',
                            text: state.user.email,
                            keyboardType: TextInputType.text,
                          ),
                          Visibility(
                            visible: !state.user.emailVerified,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: OutlinedButton(
                                onPressed: () {},
                                child: const Text('Verify email'),
                              ),
                            ),
                          ),
                          const Divider(),
                          ProfileTextInput(
                            onTapSuffix: (value) {
                              if (value != state.user.phone) {
                                bloc.add(UpdateUserEvent(phone: value));
                              }
                            },
                            hintText: 'Phone',
                            text: state.user.phone,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'\d'))
                            ],
                          ),
                          Visibility(
                            visible: !state.user.emailVerified,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: OutlinedButton(
                                onPressed: () {},
                                child: const Text('Verify phone'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
