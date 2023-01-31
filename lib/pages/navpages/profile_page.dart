// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_gospeedy/pages/navpages/profile_page_routes/personal_data.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "  Loading";
  String email = " Loading";
  void getData() async {
    User? user = FirebaseAuth.instance.currentUser;
    var userData = await FirebaseFirestore.instance
        .collection("user")
        .doc(user?.uid)
        .get();
    setState(() {
      name = userData.data()!['name'];
      email = userData.data()!['email'];
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(12),
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: 35,
          ),
          userTile(),
          divider(),
          colorTiles(),
          divider(),
          bwTiles(),
        ],
      ),
    );
  }

  Widget userTile() {
    String url =
        'https://cdn.pixabay.com/photo/2023/01/19/15/32/squirrel-7729415_960_720.jpg';
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(url),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(email),
    );
  }

  Widget divider() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Divider(
        thickness: 1.5,
      ),
    );
  }

  Widget colorTiles() {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PersonalData()));
            },
            child: colorTile(
                Icons.person_outline, Colors.deepPurple, "Personal Data")),
        SizedBox(
          height: 10,
        ),
        colorTile(Icons.settings_outlined, Colors.blue, "Settings"),
        SizedBox(
          height: 10,
        ),
        colorTile(Icons.credit_card, Colors.pink, "Payment"),
        SizedBox(
          height: 10,
        ),
        colorTile(Icons.favorite_border, Colors.orange, "Personal Data"),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget bwTiles() {
    return Column(
      children: [
        bwTile(Icons.info_outline, "FAQs"),
        SizedBox(
          height: 10,
        ),
        bwTile(Icons.border_color_outlined, "Handbook"),
        SizedBox(
          height: 10,
        ),
        bwTile(Icons.textsms_outlined, "Community"),
        SizedBox(
          height: 10,
        ),
        bwTile(Icons.logout_outlined, "Log out"),
      ],
    );
  }

  Widget bwTile(IconData icon, String text) {
    return colorTile(icon, Colors.black, text, blackAndWhite: true);
  }

  Widget colorTile(IconData icon, Color color, String text,
      {bool blackAndWhite = false}) {
    Color pickedColor = Color(0xfff3f4fe);
    return ListTile(
      leading: Container(
        // ignore: sort_child_properties_last
        child: Icon(
          icon,
          color: color,
        ),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: blackAndWhite ? Color(0xfff3f4fe) : color.withOpacity(0.09),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.black,
        size: 20,
      ),
    );
  }
}
