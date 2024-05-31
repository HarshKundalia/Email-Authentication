// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {

    TextEditingController email = TextEditingController();

  reset() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email.text);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.orange[200],
        appBar: AppBar(
          title: Center(
            child: Text("Forgot Password"),
          ),
          titleTextStyle: TextStyle(color: Colors.red, fontSize: 30),
          backgroundColor: Colors.amber[100],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: email,
                decoration: InputDecoration(hintText: 'Enter email'),
              ),
              ElevatedButton(onPressed: (() =>reset()), child: Text('Send Link'))
            ],
          ),
        )
    );
  }
}