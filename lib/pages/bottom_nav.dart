import 'package:flutter/material.dart';
import 'package:test/pages/main_home_page05.dart';
import 'package:test/pages/category_page08.dart';
import 'package:test/pages/streamer_profiles011.dart';
import 'package:test/pages/all_activity023.dart';
import 'package:test/pages/my_order036.dart';

class BottomNav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavState();
}

class BottomNavState extends State<BottomNav> {
  int pageIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }
  void selectSecondIcon() {
    setState(() {
      pageIndex = 1; // Select the second bottom navigation bar icon (index 1)
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const MainHomePage(),
      const CategoryPage(),
       streamer_profiles011(),
       my_order036(),
      ActivityPage(),

    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: _onItemTapped,
        selectedIconTheme: IconThemeData(color: Color(0xFFE8C435)), // Set selected icon color
        unselectedIconTheme: IconThemeData(color: Color(0xFF333333)),
        elevation: 0.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:'',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
              label:''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
              label:''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
              label:''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
              label:''
          ),
        ],

      ),
      body: pages[pageIndex],
    );
  }
}
