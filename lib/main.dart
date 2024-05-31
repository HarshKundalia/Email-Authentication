// ignore_for_file: prefer_const_constructors, duplicate_ignore, unused_import

import 'dart:io';
import 'package:email_authentication_db/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: 'AIzaSyBC3_pHRXS1b0JWCC9vW8DCs_x4Imj5ThE',
          appId: '1:673486415249:android:98fdf8e71048fd778de630',
          messagingSenderId: '673486415249',
          projectId: 'email-authentication-e2aa04',
        ))
      : await Firebase.initializeApp();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: 'AIzaSyBC3_pHRXS1b0JWCC9vW8DCs_x4Imj5ThE',
      appId: '1:673486415249:android:98fdf8e71048fd778de630',
      messagingSenderId: '673486415249',
      projectId: 'email-authentication-e2aa04',
    ));
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const Wrapper(),
      debugShowCheckedModeBanner: false,
    );
  }
}
