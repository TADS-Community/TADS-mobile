import 'package:go_router/go_router.dart';
import 'package:tads_app/src/presentation/pages/auth/auth_page.dart';
import 'package:tads_app/src/presentation/pages/home/home_page.dart';

abstract class AppRoutes {
  AppRoutes._();

  static const home = '/home';
  static const auth = '/auth';
  static const authConfirm = '/authConfirm';
  static const search = '/search';

  static router(bool authenticated) => GoRouter(
    initialLocation: authenticated ? home : auth,
    routes: [
      GoRoute(
        path: auth,
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
