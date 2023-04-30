import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tads_app/generated/locale_keys.g.dart';
import 'package:tads_app/src/config/routes/app_routes.dart';
import 'package:tads_app/src/core/local_source/local_storage.dart';
import 'package:tads_app/src/features/main/presentation/pages/main_page.dart';
import 'package:tads_app/src/features/profile/presentation/pages/profile_page.dart';
import 'package:tads_app/src/features/search/presentation/pages/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late TabController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(onTabChange);
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        _resumed();
        break;
      case AppLifecycleState.paused:
        _paused();
        break;
      case AppLifecycleState.inactive:
        _inactive();
        break;
      default:
        break;
    }
  }

  void onTabChange() => setState(() => _currentIndex = _controller.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          MainPage(),
          SearchPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (index) {
          _controller.animateTo(index);
        },
        selectedIndex: _currentIndex,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home),
            label: LocaleKeys.main.tr(),
          ),
          NavigationDestination(
            icon: const Icon(Icons.search),
            label: LocaleKeys.search.tr(),
          ),
          NavigationDestination(
            icon: const Icon(Icons.person),
            label: LocaleKeys.profile.tr(),
          ),
        ],
      ),
    );
  }

  Future _paused() async {
    LocalStorage.setLastKnownStateKey(AppLifecycleState.paused.index);
  }

  Future _inactive() async {
    final prevState = LocalStorage.getLastKnownStateKey;
    final prevStateIsNotPaused = prevState != null &&
        AppLifecycleState.values[prevState] != AppLifecycleState.paused;
    if (prevStateIsNotPaused) {
      // save App backgrounded time to Shared preferences
      LocalStorage.setBackgroundedTimeKey(
          DateTime.now().millisecondsSinceEpoch);
    }
    // update previous state as inactive
    LocalStorage.setLastKnownStateKey(AppLifecycleState.inactive.index);
  }

  final pinLockMillis = 2000;

  Future _resumed() async {
    final bgTime = LocalStorage.getBackgroundedTimeKey;
    final allowedBackgroundTime = bgTime + pinLockMillis;

    final shouldShowPIN =
        DateTime.now().millisecondsSinceEpoch > allowedBackgroundTime;
    if (shouldShowPIN) {
      Navigator.of(context).pushNamed(
        AppRoutes.checkPinCode,
        arguments: true,
      );
    }

    LocalStorage.removeBackgroundedTimeKey(); // clean
    LocalStorage.setLastKnownStateKey(
        AppLifecycleState.resumed.index); // previous state
  }
}
