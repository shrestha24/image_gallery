import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(ImageGallery());
}

class ImageGallery extends StatefulWidget {
  ImageGallery() : super();

  final String title = "Flutter Pick Image demo";

  @override
  _imageGallery createstate() => _imageGallery();

}

 class _imageGallery extends State<ImageGallery> {

  Future<File> imageFile;

  pickImageFromGallery(ImageSource source){}

  Widget showImage() {
    return Text("No Image");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          showImage(),
            RaisedButton(
              child: Text("Slet Image from Gallery"),
              onPressed: () {
                pickImageFromGallery(ImageSource.gallery);
              },
            )
          ],
        ),
      ),
    );
  }
 }