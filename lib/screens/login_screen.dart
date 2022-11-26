import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pets_project/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  final bool isEditing;

  const LoginScreen({Key? key, required this.isEditing}) : super(key: key);

  @override
  State<LoginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<LoginScreen> {
  String login = '';
  String password = '';

  bool loginAlert(BuildContext context, String text) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Text(text),
          actions: [
            TextButton(
                onPressed: () => {Navigator.of(context).pop()},
                child: const Text('OK'))
          ],
        ));
    return false;
  }

  void doLogin() {
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: login,
      password: password,
    ).then((e) => {
        if (FirebaseAuth.instance.currentUser != null)
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()))
      }
    ).catchError((e) {
      var authError = e as FirebaseAuthMultiFactorException;
      switch (authError.code) {
        case 'invalid-email':
          loginAlert(context, 'Invalid e-mail');
          break;
        case 'user-disabled':
          loginAlert(context, 'User disabled');
          break;
        case 'user-not-found':
          loginAlert(context, 'User not found');
          break;
        case 'wrong-password':
          loginAlert(context, 'User not found, check e-mail and password');
          break;
        default:
          loginAlert(context, 'Unknown error');
        }
    });
  }

  void doRegister() {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: login,
      password: password,
    ).then((e) => {
    if (FirebaseAuth.instance.currentUser != null)
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => const HomeScreen()))
    }
      ).catchError((e) {
      var authError = e as FirebaseAuthException;
      switch (authError.code) {
        case 'invalid-email':
          loginAlert(context, 'Invalid e-mail');
          break;
        case 'email-already-in-use':
          loginAlert(context, 'E-mail already in use');
          break;
        case 'weak-password':
          loginAlert(context, 'Weak password');
          break;
        case 'operation-not-allowed':
        default:
          loginAlert(context, 'Unknown error');
      }
    });
  }

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
                    onChanged: (text) {
                      setState(() {
                        login = text;
                      });
                    },
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
                    onChanged: (text) {
                      setState(() {
                        password = text;
                      });
                    },
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
                child: InkWell(
                  onTap: () {
                    if (widget.isEditing) {
                      doRegister();
                    }else {
                       doLogin();
                    }
                  },
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        widget.isEditing ? "Create Account" : "Log In",
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
            ),
            SizedBox(
              height: 25,
            ),

            //message  sign in
            if (!widget.isEditing)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a member? ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (
                              context) => const LoginScreen(isEditing: true)));
                    },
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
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
