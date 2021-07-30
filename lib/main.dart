import 'dart:io';

import 'package:flutter/material.dart';
import 'UserImagePicker.dart';

void main(){
  runApp(MaterialApp(
    home: ImageRestoration(),
  ));
}

class ImageRestoration extends StatefulWidget{
  @override
  _ImageRestorationState createState() => _ImageRestorationState();
}

class _ImageRestorationState extends State<ImageRestoration>{
  File _userImageFile;

  void _pickedImage(File image){
    _userImageFile = image;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              UserImagePicker(_pickedImage),
            ],
          ),
        ),
      ),
    );
  }
}