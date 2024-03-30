// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:car_app/screens/favorite_screen.dart';
import 'package:car_app/screens/home_screen.dart';
import 'package:car_app/screens/profile_screen.dart';
import 'package:car_app/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    FavoriteScreen(),
    ProfileScreen(),
    SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: screens,
      ),
      floatingActionButton: SafeArea(
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xFFEF6969),
          child: Icon(
            Icons.qr_code,
            size: 20,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xFFEF6969),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: GNav(
            onTabChange: (index) {
              setState(() {
                pageIndex = index;
              });
            },
            padding: EdgeInsets.all(15),
            backgroundColor: Color(0xFFEF6969),
            color: Colors.white,
            tabBackgroundColor: Color.fromARGB(255, 242, 203, 203),
            gap: 9,
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.favorite,
                text: "Favorite",
              ),
              GButton(
                icon: Icons.person,
                text: "Profile",
              ),
              GButton(
                icon: Icons.settings,
                text: "Settings",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
