import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera_camera/camera_camera.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File val;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rully")),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera_alt),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Camera(
                  mode: CameraMode.fullscreen,
                  orientationEnablePhoto: CameraOrientation.landscape,
                  onFile: (data) {
                    val = data;
                  },
                ),
              ),
            );
          }),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.8,
          child: val != null
              ? Image.file(
                  val,
                  fit: BoxFit.contain,
                )
              : Text("Tire a foto"),
        ),
      ),
    );
  }
}
