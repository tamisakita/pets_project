import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                height: 100, child: Image.asset('lib/images/cat-four.png')),
            SizedBox(height: 16),
            Text(
              'Hello Cat Lover!',
              style: GoogleFonts.concertOne(
                fontSize: 50,
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
              height: 40,
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

            // log in button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Material(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.black,
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
