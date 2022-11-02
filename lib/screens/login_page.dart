import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _loginPageState();
}

class _loginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.imgbin.com/9/16/7/imgbin-avatar-youtube-cat-cute-dog-vaVWaZpiGRXq8EdFFUPbDb6aN.jpg'),
                radius: 70),
            SizedBox(height: 16),
            Text(
              'Hello Again!',
              style: GoogleFonts.concertOne(
                fontSize: 56,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Hope you\'re feline good today.',
              style: GoogleFonts.nunitoSans(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 50,
            ),

            //email text field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                color: Colors.white,
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            // password text field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                color: Colors.white,
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            // sign
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Material(
                color: Colors.brown[700],
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),

            //message  sign in
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member? ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Register now',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
