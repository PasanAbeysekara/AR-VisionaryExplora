import 'package:ar_visionary_explora/components/botttom_nav_tile.dart';
import 'package:ar_visionary_explora/screens/main/favourites/favourites.dart';
import 'package:ar_visionary_explora/screens/main/home/home.dart';
import 'package:ar_visionary_explora/screens/main/myhome/homeScreen.dart';
import 'package:ar_visionary_explora/screens/main/profile/profile.dart';
import 'package:ar_visionary_explora/screens/main/search/search.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // to store the active bottom bar index
  int _activeIndex = 0;

  // trigger when botton bar icon is cliked
  void onItemTaped(int i) {
    setState(() {
      _activeIndex = i;
    });
    Logger().i(_activeIndex);
  }

  // screens list
  final List<Widget> _screens = [
    Home(),
    Favourites(),
    Search(),
    Profile(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_activeIndex),
      bottomNavigationBar: Container(
        height: 83,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavTile(
              icon: Icons.home,
              isActive: _activeIndex == 0,
              onTap: () => onItemTaped(0),
            ),
            BottomNavTile(
              icon: Icons.favorite_border_outlined,
              isActive: _activeIndex == 1,
              onTap: () => onItemTaped(1),
            ),
            BottomNavTile(
              icon: Icons.search,
              isActive: _activeIndex == 2,
              onTap: () => onItemTaped(2),
            ),
            BottomNavTile(
              icon: Icons.person,
              isActive: _activeIndex == 3,
              onTap: () => onItemTaped(3),
            ),
            BottomNavTile(
              icon: Icons.store,
              isActive: _activeIndex == 4,
              onTap: () => onItemTaped(4),
            ),
          ],
        ),
      ),
    );
  }
}
