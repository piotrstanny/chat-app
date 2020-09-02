import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/rounded_button.dart';
import 'package:flutter_chat_app/components/rounded_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app/screens/chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'register';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
              borderColour: Colors.blueAccent,
              hintText: 'Enter your email',
              obscureText: false,
              inputType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            RoundedInput(
              borderColour: Colors.blueAccent,
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
              title: 'Register',
              colour: Colors.blueAccent,
              onPressed: () async {
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  if (newUser != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
