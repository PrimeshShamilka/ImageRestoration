import 'dart:io';

import 'package:flutter/material.dart';
import 'UserImagePicker.dart';
import 'package:tflite/tflite.dart';



//void main() => runApp(MyApp());

//class MyApp extends StatelessWidget{
//  Widget build(BuildContext context){
//    return MaterialApp(
//      title: 'tflite',
//      home: Scaffold(
//        body: Text('tflite'),
//      ),
//    );
//  }
//}



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
  bool _busy;

  void _pickedImage(File image){
    _userImageFile = image;
  }

  loadTfModel() async {
    await Tflite.loadModel(
        model: "assets/models/ssd_mobilenet.tflite",
        labels: "assets/models/labels.txt",
        numThreads: 1,
        isAsset: true,
        useGpuDelegate: false
    );
  }

  @override
  void initState() {
    super.initState();
    _busy = true;
    loadTfModel().then((val) {{
      setState(() {
        _busy = false;
      });
      print ('model loading finished');
    }});
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