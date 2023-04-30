import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tads_app/src/config/routes/app_routes.dart';
import 'package:tads_app/src/core/local_source/local_storage.dart';
import 'package:tads_app/src/features/profile/presetation/blocs/profile_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
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
          return Center(
            child: IconButton(
              onPressed: () async {
                LocalStorage.clearProfile();
                Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
              },
              icon: const Icon(Icons.logout_outlined),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
