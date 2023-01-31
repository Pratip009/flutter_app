// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print, unnecessary_null_comparison, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_gospeedy/pages/navpages/profile_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'personal_data_successfull_page.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  bool showPassword = false;
  File? file;
  ImagePicker image = ImagePicker();
  String url = "";
  var name;
//pan
  File? pfile;
  ImagePicker pimage = ImagePicker();
  String purl = "";
  var pname;
  final GlobalKey _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  final locationController = TextEditingController();
  final adhaarController = TextEditingController();
  final panController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    numberController.dispose();
    passwordController.dispose();
    ageController.dispose();
    locationController.dispose();
    adhaarController.dispose();
    panController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: 16,
          top: 25,
          right: 16,
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SizedBox(
            height: 800,
            child: ListView(
              shrinkWrap: true,
              // ignore: prefer_co
              // nst_literals_to_create_immutables
              children: [
                Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 4,
                            color: Colors.white,
                          ),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black87.withOpacity(0.1),
                              offset: Offset(0, 10),
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://wallpaperaccess.com/full/154009.jpg'),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Colors.white,
                            ),
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                buildTextFormField("Full Name", "Enter your full name ", false,
                    nameController),
                buildTextFormField(
                    "E-mail",
                    "Alternate email address (optional)",
                    false,
                    emailController),
                buildTextFormField("Mobile Number", "Enter your mobile number",
                    false, numberController),
                buildTextFormField(
                    "Password", "********", true, passwordController),
                buildTextFormField(
                    "Age", "Enter your age", false, ageController),
                buildTextFormField("Location", "Enter your address", false,
                    locationController),
                buildTextFormField(
                    "Adhaar Number",
                    "Enter your 12 digit adhaar number",
                    false,
                    adhaarController),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            border: Border.all(color: Colors.black87),
                            borderRadius: BorderRadius.circular(10)),
                        height: 100,
                        width: double.maxFinite,
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Upload Adhaar Image',
                              style: GoogleFonts.aBeeZee(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.file_upload_outlined,
                                size: 25, color: Colors.black87)
                          ],
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    // if (image != null)
                    //   SizedBox(
                    //     height: 100,
                    //     width: 300,
                    //     child: Image.file(file!),
                    //   ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                buildTextFormField("PAN Number",
                    "Enter your 10 digit PAN number", false, panController),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        getPanImage();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          border: Border.all(color: Colors.black87),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 100,
                        width: double.maxFinite,
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Upload PAN Image',
                              style: GoogleFonts.aBeeZee(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.file_upload_outlined,
                                size: 25, color: Colors.black87)
                          ],
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    // if (pimage != null)
                    //   SizedBox(
                    //     height: 100,
                    //     width: 300,
                    //     child: Image.file(pfile!),
                    //   ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            side: BorderSide(width: 2, color: Colors.grey),
                          ),
                          onPressed: () {},
                          child: Text(
                            'CANCEL',
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.black87),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Container(
                          height: 40,
                          width: 100,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ), // Background color
                            ),
                            onPressed: () {
                              updateUser();
                            },
                            child: Text(
                              'SAVE',
                              style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(
    String labelText,
    String placeholder,
    bool isPasswordTextFormField,
    final controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        obscureText: isPasswordTextFormField ? showPassword : false,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          suffixIcon: isPasswordTextFormField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(Icons.remove_red_eye),
                  color: Colors.grey,
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 3, left: 10),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w400,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w200,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Future updateUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = await FirebaseAuth.instance.currentUser;

    try {
      await auth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((signedInUser) => {
                FirebaseFirestore.instance
                    .collection("user-data")
                    .doc(signedInUser.user?.uid)
                    .set({
                  'name': nameController.text,
                  'email': emailController.text,
                  'number': numberController.text,
                  'age': ageController.text,
                  'location': locationController.text,
                  'adhaar number': adhaarController.text,
                  'pan number': panController.text,
                }).then((signedInUser) => {
                          print('success'),
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PersonalDataSuccessfullPage(),
                            ),
                          )
                        })
              });
    } catch (e) {
      print(e);
    }
  }

  getImage() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
    if (file != null) {
      uploadFile();
    }
  }

  uploadFile() async {
    try {
      var imagefile = FirebaseStorage.instance
          .ref()
          .child("Adhaar_image_user")
          .child("/$name");
      UploadTask task = imagefile.putFile(file!);
      TaskSnapshot snapshot = await task;
      url = await snapshot.ref.getDownloadURL();

      print(url);
      if (url != null && file != null) {
        Fluttertoast.showToast(
            msg: "Document Uploaded...",
            textColor: Colors.black87,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
          msg: "Something went wrong",
          textColor: Colors.black87,
        );
      }
    } on Exception catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        textColor: Colors.red,
      );
    }
  }

  getPanImage() async {
    var pimg = await pimage.pickImage(source: ImageSource.gallery);
    setState(() {
      pfile = File(pimg!.path);
    });
    if (pfile != null) {
      uploadPanFile();
    }
  }

  uploadPanFile() async {
    try {
      var imagefilep = FirebaseStorage.instance
          .ref()
          .child("Adhaar_image_user")
          .child("/$name");
      UploadTask task = imagefilep.putFile(pfile!);
      TaskSnapshot snapshot = await task;
      purl = await snapshot.ref.getDownloadURL();

      print(purl);
      if (purl != null && pfile != null) {
        Fluttertoast.showToast(
            msg: "Document Uploaded...",
            textColor: Colors.black87,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
          msg: "Something went wrong",
          textColor: Colors.black87,
        );
      }
    } on Exception catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        textColor: Colors.red,
      );
    }
  }
}
