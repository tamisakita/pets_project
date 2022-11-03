import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = 'profile_screen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('lib/images/cat-three.png'),
              backgroundColor: Colors.grey,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Profile Page',
            style: GoogleFonts.concertOne(
              fontSize: 45,
            ),
          ),
        ]),
      ),
    );
  }
}
