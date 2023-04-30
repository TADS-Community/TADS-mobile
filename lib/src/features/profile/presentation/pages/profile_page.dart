import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tads_app/generated/locale_keys.g.dart';
import 'package:tads_app/src/config/constants/constants.dart';
import 'package:tads_app/src/core/local_source/local_storage.dart';
import 'package:tads_app/src/features/common/presentation/dialogs/settings_dialog.dart';
import 'package:tads_app/src/features/profile/presentation/blocs/profile_bloc.dart';
import 'package:tads_app/src/features/profile/presentation/widgets/user_info_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  final _formKey = GlobalKey<FormState>();
  late ProfileBloc bloc;

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
                  mainAxisSize: MainAxisSize.min,
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
                          '${LocaleKeys.your_id.tr()}:',
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
                    UserInfoWidget(
                      firstName: state.user.firstName,
                      lastName: state.user.lastName,
                      phone: state.user.phone,
                      email: state.user.email,
                      updateFirstname: (value) {
                        if (value != state.user.firstName) {
                          bloc.add(UpdateUserEvent(firstName: value));
                        }
                      },
                      updateLastname: (value) {
                        if (value != state.user.lastName) {
                          bloc.add(UpdateUserEvent(lastName: value));
                        }
                      },
                      updateEmail: (value) {
                        if (_formKey.currentState?.validate() ?? false) {
                          if (value != state.user.email) {
                            bloc.add(UpdateUserEvent(email: value));
                          }
                        }
                      },
                      updatePhone: (value) {
                        if (value != state.user.phone) {
                          bloc.add(UpdateUserEvent(phone: value));
                        }
                      },
                      emailVerified: state.user.emailVerified,
                      phoneVerified: state.user.phoneVerified,
                      verifyEmail: () {},
                      verifyPhone: () {},
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
