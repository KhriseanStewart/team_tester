import 'package:car_wash_app/screen/job_list_screen/job_list.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:feather_icons/feather_icons.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

int _currentIndex = 0;

List<Widget> _screens = [
  JobList(),
];

class _MainLayoutState extends State<MainLayout> {
    void onTapped(int index) {
      setState(() {
        index = _currentIndex;
      });
    }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        onTap: onTapped,
        items: [
          SalomonBottomBarItem(
            icon: Icon(FeatherIcons.list),
            title: Text("Job List"),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.manage_history),
            title: Text("Washer Management"),
          ),
          SalomonBottomBarItem(
            icon: Icon(FeatherIcons.user),
            title: Text("Profile"),
          ),
        ],
      ),
    );
  }
}
