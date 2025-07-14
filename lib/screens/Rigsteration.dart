import 'package:flutter/material.dart';
import 'package:messageme_app/screens/ChatScreen.dart';
import 'package:messageme_app/screens/SignIn.dart';
import 'package:messageme_app/widgets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messageme_app/widgets/snackBar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Rigsteration extends StatefulWidget {
  static const String screenRoute = 'register_screen';
  const Rigsteration({super.key});

  @override
  State<Rigsteration> createState() => _RigsterationState();
}

class _RigsterationState extends State<Rigsteration> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: loading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(child: Image.asset('images/logo.png', height: 180)),
              SizedBox(height: 50),
              TextField(
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
                color: Colors.blue[800]!,
                onPressed: () async {
                  setState(() {
                    loading = true;
                  });

                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    showSnackBar(context, ("you created account sucessefly"));
                    Navigator.pushNamed(context, Signin.screenRoute);
                    setState(() {
                      loading = false;
                    });
                  } catch (error) {
                    setState(() {
                      loading = false;
                    });
                    showSnackBar(context, ("the email already exit"));
                  }
                },
                title: 'Register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
