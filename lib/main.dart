import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messageme_app/screens/ChatScreen.dart';
import 'package:messageme_app/screens/Rigsteration.dart';
import 'package:messageme_app/screens/SignIn.dart';
import 'package:messageme_app/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chat app',
      initialRoute: _auth.currentUser != null
          ? Chatscreen.screenRoute
          : WelcomeScreen.screenRoute,
      routes: {
        WelcomeScreen.screenRoute: (context) => WelcomeScreen(),
        Signin.screenRoute: (context) => Signin(),
        Rigsteration.screenRoute: (context) => Rigsteration(),
        Chatscreen.screenRoute: (context) => Chatscreen(),
      },
    );
  }
}
