// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        title: Center(child: Text("HomePage")),
        titleTextStyle: TextStyle(color: Colors.red, fontSize: 30),
        backgroundColor: Colors.amber[100],
      ),
      body: Center(
        child: Text(
          'Hello, ${user!.email}',
          style: TextStyle(
              color: Colors.orange[800],
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => signout()),
        child: AvatarGlow(
          child: Icon(Icons.login_rounded,color: Colors.white,),
          glowColor: Color.fromARGB(255, 0, 0, 0),
          duration: Duration(milliseconds: 1500),
        ),
      ),
    );
  }
}
