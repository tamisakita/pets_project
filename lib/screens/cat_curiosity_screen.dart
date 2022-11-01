import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pets_project/screens/menu_screen.dart';
import '../components/rounded_button.dart';


class CatCuriosityScreen extends StatelessWidget {

  static const String id = 'cat_curiosity_screen';

  const CatCuriosityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              Text(
                'Cat trivia',
                style: GoogleFonts.concertOne(
                  fontSize: 56,
                ),
              ),
              SizedBox(height: 50),

              // button discover
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: RoundedButton(
                  icon: Icons.person,
                  text: 'Discover',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      CatCuriosityScreen.id,
                    );
                  },
                ),
              ),


              // go back
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: RoundedButton(
                  icon: Icons.person,
                  text: 'Back',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      MenuScreen.id,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}