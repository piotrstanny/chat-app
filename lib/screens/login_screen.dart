import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/rounded_button.dart';
import 'package:flutter_chat_app/components/rounded_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/screens/chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 120.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedInput(
              borderColour: Colors.lightBlueAccent,
              hintText: 'Enter your email',
              inputType: TextInputType.emailAddress,
              obscureText: false,
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            RoundedInput(
              borderColour: Colors.lightBlueAccent,
              hintText: 'Enter your password',
              inputType: TextInputType.text,
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              title: 'Login',
              colour: Colors.lightBlueAccent,
              onPressed: () async {
                try {
                  UserCredential userCredential =
                      await _auth.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  if (userCredential != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
