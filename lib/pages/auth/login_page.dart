// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace, avoid_print, prefer_const_constructors

import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_gospeedy/dimensions.dart';
import 'package:flutter_application_gospeedy/pages/auth/password_reset.dart';
import 'package:flutter_application_gospeedy/pages/auth/signup_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/my_textfield.dart';
import '../../widgets/reusable_widget.dart';
import '../../widgets/square_tile.dart';
import '../navpages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(Dimesions.width20,
                MediaQuery.of(context).size.height * 0.1, Dimesions.width20, 0),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.lock,
                  size: Dimesions.height100,
                ),
                SizedBox(
                  height: Dimesions.height45,
                ),
                Text(
                  'Welcome back you\'ve been missed!',
                  style: GoogleFonts.aBeeZee(
                    color: Colors.black87,
                    fontSize: Dimesions.font16,
                  ),
                ),
                SizedBox(height: 25),
                MyTextField(
                  controller: _emailTextController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                SizedBox(height: Dimesions.height10),
                MyTextField(
                  controller: _passwordTextController,
                  hintText: 'Password',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: forgetPassword(context),
                ),
                const SizedBox(height: 25),
                firebaseUIButton(context, "Sign In", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainPage()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // google button
                    SquareTile(imagePath: 'assets/images/mobile1.jpg'),
                  ],
                ),
                const SizedBox(height: 50),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Not a member?', style: TextStyle(color: Colors.black87)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignupPage()));
          },
          child: const Text(
            ' Register now',
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.black87),
        ),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ResetPassword())),
      ),
    );
  }
}
