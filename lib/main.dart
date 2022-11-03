import 'package:flutter/material.dart';
import 'package:pets_project/screens/cat_fact_screen.dart';
import 'package:pets_project/screens/home_screen.dart';
import 'package:pets_project/screens/menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      initialRoute: MenuScreen.id,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        MenuScreen.id: (context) => const MenuScreen(),
        CatFactScreen.id: (context) => const CatFactScreen(),
      },
    );
  }
}
