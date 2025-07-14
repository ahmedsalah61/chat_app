import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messageme_app/screens/ChatScreen.dart';
import 'package:messageme_app/widgets/my_button.dart';
import 'package:messageme_app/widgets/snackBar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Signin extends StatefulWidget {
  static const String screenRoute = 'sign_in';
  const Signin({super.key});

  @override
  State<Signin> createState() => _RigsterationState();
}

class _RigsterationState extends State<Signin> {
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;
  bool showLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(child: Image.asset('images/logo.png', height: 180)),
              SizedBox(height: 50),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  hintText: ("Enter your email"),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 1),

                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  hintText: ("Enter your password"),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 1),

                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              SizedBox(height: 10),
              MyButton(
                color: Colors.yellow[900]!,
                onPressed: () async {
                  setState(() {
                    showLoading = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    showSnackBar(context, ("you loged in sucess"));
                    Navigator.pushNamed(context, Chatscreen.screenRoute);
                    setState(() {
                      showLoading = false;
                    });
                  } catch (error) {
                    setState(() {
                      showLoading = false;
                    });
                    showSnackBar(
                      context,
                      ("please enter your email or password correct"),
                    );
                  }
                },
                title: 'Sign in',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
