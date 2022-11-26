import 'package:flutter/material.dart';
import 'package:pets_project/screens/cat_fact_screen.dart';
import 'package:pets_project/screens/home_screen.dart';
import 'package:pets_project/screens/login_screen.dart';
import 'package:pets_project/screens/menu_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomeScreen(),
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => const LoginScreen(isEditing: false),
        HomeScreen.id: (context) => const HomeScreen(),
        MenuScreen.id: (context) => const MenuScreen(),
        CatFactScreen.id: (context) => const CatFactScreen(),
      },
    );
  }
}
