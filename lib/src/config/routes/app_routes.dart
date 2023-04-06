import 'package:go_router/go_router.dart';
import 'package:tads_app/src/presentation/pages/home/home_page.dart';
import 'package:tads_app/src/presentation/pages/login/login_page.dart';

abstract class AppRoutes {
  AppRoutes._();

  static const home = '/home';
  static const login = '/login';
  static const authConfirm = '/authConfirm';
  static const search = '/search';

  static router(bool authenticated) => GoRouter(
    initialLocation: authenticated ? home : login,
    routes: [
      GoRoute(
        path: login,
        name: login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: home,
        name: home,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
