import 'package:flutter/material.dart';
import 'package:tads_app/src/config/constants/constants.dart';
import 'package:tads_app/src/features/main/presentation/pages/main_page.dart';
import 'package:tads_app/src/features/profile/presetation/pages/profile_page.dart';
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
      appBar: AppBar(
        title: const Text(appName),
      ),
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
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        onDestinationSelected: (index) {
          _controller.animateTo(index);
        },
        selectedIndex: _currentIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_box),
            label: 'Add',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}