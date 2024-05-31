// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'package:email_authentication_db/forgot.dart';
import 'package:email_authentication_db/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isloading= false;

  signIn() async {

    setState(() {
      isloading = true;
    });

    try{
      await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
    }on FirebaseAuthException catch(e){
      Get.snackbar("error msg", e.code);
    }catch(e){
      Get.snackbar('error msg', e.toString());
    }

    setState(() {
      isloading = false;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return isloading? Center(child: CircularProgressIndicator(),): Scaffold(

        backgroundColor: Colors.orange[200],
        appBar: AppBar(
          title: Center(
            child: Text("Login"),
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
              ElevatedButton(onPressed: (() => signIn()), child: Text('Login')),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (() => Get.to(Signup())), child: Text('Register now')),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (() => Get.to(Forgot())), child: Text('Forgot Password'))
            ],
          ),
        ));
  }
}
