import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tads_app/generated/locale_keys.g.dart';
import 'package:tads_app/src/features/main/presentation/pages/main_page.dart';
import 'package:tads_app/src/features/profile/presentation/pages/profile_page.dart';
import 'package:tads_app/src/features/search/presentation/pages/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(onTabChange);

    super.initState();
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
}
