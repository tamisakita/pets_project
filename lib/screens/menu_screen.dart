import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pets_project/screens/cat_fact_screen.dart';

import '../components/rounded_button.dart';

class MenuScreen extends StatelessWidget {
  static const String id = 'menu_screen';

  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                    child: Image.asset('lib/images/cat.png')),
                SizedBox(height: 16),
                Text(
                  'All About Cats!',
                  style: GoogleFonts.concertOne(
                    fontSize: 45,
                  ),
                ),
                SizedBox(height: 30),
                RoundedButton(
                  icon: Icons.person,
                  text: 'Discover',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      CatFactScreen.id,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
