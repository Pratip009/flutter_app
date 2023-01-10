// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_gospeedy/firebase_options.dart';
import 'package:flutter_application_gospeedy/pages/home_screen.dart';
import 'package:flutter_application_gospeedy/pages/onboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:flutter_application_gospeedy/pages/onboarding_page.dart';
int? isviewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: 'AIzaSyBKYZemmmVWQULpqJJXTRYILS3G1xenopk',
        appId: '1:287378463879:web:ec1d096e98dcb507fa2c22',
        messagingSenderId: '287378463879',
        projectId: 'tripay-flutter'),
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isviewed != 0 ? OnBoard() : HomeScreen(),
    );
  }
}
