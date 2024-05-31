// ignore_for_file: prefer_const_constructors

import 'package:email_authentication_db/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signup() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email.text, password: password.text);
        Get.offAll(Wrapper());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.orange[200],
        appBar: AppBar(
          title: Center(
            child: Text("Sign Up"),
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
              TextField(
                controller: password,
                decoration: InputDecoration(hintText: 'Enter password'),
              ),
              ElevatedButton(onPressed: (() => signup()), child: Text('Sign Up'))
            ],
          ),
        )
      );
  }
}
