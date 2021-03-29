import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class Home extends StatefulWidget {
  const Home({
    Key key,
    @required this.user
  }) : super(key: key);
  final User user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  // if (pickedFile != null) {
  // _image = File(pickedFile.path);
  // } else {
  // print('No image selected.');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home ${widget.user.email}'),
      ),
      body: Center(
          child: _image == null
              ? Text('Tap on the Camera Button to Take a Picture')
              : Image.file(_image)),
      drawer: Text("This is the drawer"),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
