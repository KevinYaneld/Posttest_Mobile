import 'package:flutter/material.dart';
import 'package:posttest4_031_kevin/screens/about_page.dart';
import 'package:posttest4_031_kevin/screens/home_page.dart';
import 'package:posttest4_031_kevin/screens/settings_page.dart';
import 'package:posttest4_031_kevin/screens/wishlist.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen();

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomePage(),
    Wishlist(),
    About(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Auction Store',
          style: TextStyle(
            color: Colors.white, // Set the text color here
          ),
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "About Us",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
