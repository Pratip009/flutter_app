// ignore_for_file: library_private_types_in_public_api, prefer_typing_uninitialized_variables, prefer_const_constructors, sort_child_properties_last, avoid_print, unnecessary_null_comparison

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  const PickImage({super.key});

  @override
  _PickImageState createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  File? file;
  ImagePicker image = ImagePicker();
  String url = "";
  var name;
  var color1 = Colors.redAccent[700];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          "WEBFUN",
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              " Please ",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                // backgroundColor: Colors.redAccent[700],
                fontStyle: FontStyle.normal,
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  color1 = Colors.grey[700];
                });
              },
              color: color1,
              splashColor: Colors.white,
              child: Text(
                " Subscribe ",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  // backgroundColor: Colors.redAccent[700],
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              elevation: 5.0,
              height: 60,
              onPressed: () {
                getfile();
              },
              child: Text(
                "  Get file",
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                ),
              ),
              color: Colors.blue,
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              elevation: 5.0,
              height: 60,
              onPressed: () {
                getImage();
              },
              child: Text(
                "  Get image",
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                ),
              ),
              color: Colors.blue,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  getfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    if (result != null) {
      File c = File(result.files.single.path.toString());
      setState(() {
        file = c;
        name = result.names.toString();
      });
      uploadFile();
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
      var imagefile =
          FirebaseStorage.instance.ref().child("user").child("/$name");
      UploadTask task = imagefile.putFile(file!);
      TaskSnapshot snapshot = await task;
      url = await snapshot.ref.getDownloadURL();

      print(url);
      if (url != null && file != null) {
        Fluttertoast.showToast(
          msg: "Done Uploaded",
          textColor: Colors.red,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Something went wrong",
          textColor: Colors.red,
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
