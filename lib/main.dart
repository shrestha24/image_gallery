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

  pickImageFromGallery(ImageSource source){
    imageFile = ImagePicker.pickImage(source: source);
  }

  Widget showImage() {
    return FutureBuilder<File> (
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
        snapshot.data != null) {
          return Image.file(
              snapshot.data,
          width: 300,
          height: 300,
          );
        } else if (snapshot.error != null) {
          return const Text(
            'Error Picking Iamge',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
              'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
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