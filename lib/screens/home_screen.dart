import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_project/screens/cat_fact_screen.dart';
import 'package:pets_project/screens/login_screen.dart';
import 'package:pets_project/screens/menu_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 1;

  final screens = [
    LoginScreen(),
    MenuScreen(),
    CatFactScreen(),
  ];

  final items = <Widget>[
    Icon(Icons.person, size: 30),
    Icon(Icons.home, size: 30),
    Icon(Icons.favorite, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        key: navigationKey,
        buttonBackgroundColor: Colors.red.shade200,
        backgroundColor: Colors.grey.shade300,
        animationDuration: Duration(milliseconds: 300),
        height: 60,
        index: index,
        items: items,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}
