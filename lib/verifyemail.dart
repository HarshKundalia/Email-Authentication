// ignore_for_file: unused_import, prefer_const_constructors

import 'package:email_authentication_db/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {

  @override
  void initState(){
    sendverifylink();
    super.initState();
  }

  sendverifylink() async{
    final user=FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification().then((value) => {
      Get.snackbar('Link sent','A link has been sent to your email',margin: EdgeInsets.all(30),snackPosition: SnackPosition.BOTTOM)
    }
    );
  }

  reload() async{
    await FirebaseAuth.instance.currentUser!.reload().then((value) => {Get.offAll(Wrapper())});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        title: Center(child: Text("Verification")),
        titleTextStyle: TextStyle(color: Colors.red, fontSize: 30),
        backgroundColor: Colors.amber[100],
      ),
      body: Padding(
        padding: EdgeInsets.all(28),
        child: Center(
          child: Text('Open your email and click on the link provided to verify email & reload this page...',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        ),
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: (() => reload()),
        child: Icon(Icons.restart_alt_rounded),
        ),
    );
  }
}