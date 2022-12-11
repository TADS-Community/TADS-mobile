import 'package:flutter/material.dart';
import 'package:tads_app/src/presentation/pages/main_tabs/create/create_tab.dart';
import 'package:tads_app/src/presentation/pages/main_tabs/main/main_tab.dart';
import 'package:tads_app/src/presentation/pages/main_tabs/profile/profile_tab.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TADS - Let's donate"),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 140),
        child: IndexedStack(
          index: 0,
          children: const [
            MainTab(),
            CreateTab(),
            ProfileTab(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {},
        items: const [
          BottomNavigationBarItem(
            label: 'Main',
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Create',
            icon: Icon(Icons.add_box_outlined),
            activeIcon: Icon(Icons.add_box),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.add_box),
          ),
        ],
      ),
    );
  }
}
