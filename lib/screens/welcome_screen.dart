import 'package:flutter/material.dart';
import 'package:messageme_app/screens/Rigsteration.dart';
import 'package:messageme_app/screens/SignIn.dart';
import 'package:messageme_app/widgets/my_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String screenRoute = 'Welcome_screen';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                SizedBox(child: Image.asset('images/logo.png'), height: 180),
                Text(
                  "MessageMe",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 20, 35, 93),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            MyButton(
              color: Colors.yellow[900]!,
              onPressed: () {
                Navigator.pushNamed(context, Signin.screenRoute);
              },
              title: 'Sign in',
            ),
            MyButton(
              color: Colors.blue[800]!,
              onPressed: () {
                Navigator.pushNamed(context, Rigsteration.screenRoute);
              },
              title: 'Sign up',
            ),
          ],
        ),
      ),
    );
  }
}
