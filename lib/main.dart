// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_gospeedy/pages/auth/login_page.dart';
import 'package:flutter_application_gospeedy/pages/navpages/main_page.dart';
import 'package:flutter_application_gospeedy/pages/navpages/profile_page_routes/personal_data.dart';
import 'package:flutter_application_gospeedy/pages/onboard/onboard.dart';
import 'package:flutter_application_gospeedy/splash_screen.dart';
import 'package:flutter_application_gospeedy/widgets/pick_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:flutter_application_gospeedy/pages/onboarding_page.dart';
int? isviewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'flutter-application-gospeedy',
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
      // home: isviewed != 0 ? OnBoard() : LoginPage(),
      home: OnBoard(),
    );
  }
}
