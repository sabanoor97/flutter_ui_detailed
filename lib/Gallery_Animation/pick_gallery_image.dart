import 'dart:math';
import 'dart:io';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickingUpImages extends StatefulWidget {
  @override
  _PickingUpImagesState createState() => _PickingUpImagesState();
}

class _PickingUpImagesState extends State<PickingUpImages> {
  File _image;
  final picker = ImagePicker();

  ConfettiController _controllerBottom;

  @override
  void initState() {
    _controllerBottom =
        ConfettiController(duration: const Duration(seconds: 20));
    super.initState();
  }

  @override
  void dispose() {
    _controllerBottom.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Row(
                children: [
                  Text(
                    "Pick image of your choice",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  ButtonBar(
                    children: [
                      IconButton(
                          icon: Icon(Icons.camera_alt),
                          onPressed: () async => await pickImageFromCamera(),
                          tooltip: "Capture Image"),
                      IconButton(
                          icon: Icon(Icons.photo),
                          onPressed: () async => await pickImageFromGallery(),
                          tooltip: "Pick Image"),
                    ],
                  ),
                ],
              ),
            ),
          ),
          this._image == null
              ? Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 1.4,
                  color: Colors.grey[350],
                )
              : Image.file(this._image),
          Container(
            padding: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: Align(
              heightFactor: 5.0,
              alignment: Alignment.bottomCenter,
              child: ConfettiWidget(
                  confettiController: _controllerBottom,
                  blastDirectionality: BlastDirectionality.explosive,
                  shouldLoop: true,
                  colors: [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.lime,
                    Colors.teal,
                    Colors.grey,
                    Colors.orange,
                    Colors.purple,
                    Colors.red
                  ],
                  blastDirection: -pi / 2,
                  emissionFrequency: 0.01,
                  numberOfParticles: 300,
                  maxBlastForce: 300,
                  minBlastForce: 80,
                  gravity: 0.3),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                onPressed: () {
                  _controllerBottom.play();
                },
                child: Text("Congratulations")),
          ),
        ],
      ),
    );
  }

  Future<Null> pickImageFromGallery() async {
    final PickedFile imageFile =
        await picker.getImage(source: ImageSource.gallery);
    // setState(() {
    //   this._image = imageFile;
    // });
    setState(() {
      if (picker != null) {
        _image = File(imageFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<Null> pickImageFromCamera() async {
    final PickedFile imageFile =
        await picker.getImage(source: ImageSource.camera);
    // setState(() {
    //   this._image = imageFile;
    // });
    setState(() {
      if (picker != null) {
        _image = File(imageFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
