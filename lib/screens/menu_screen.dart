import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pets_project/screens/cat_facts_screen.dart';

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
                SizedBox(height: 16),
                Text(
                  'All About Cats!',
                  style: GoogleFonts.concertOne(
                    fontSize: 45,
                  ),
                ),
                SizedBox(height: 20),
                RoundedButton(
                  icon: Icons.person,
                  text: 'Discover',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      CatFactsScreen.id,
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
