import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

void main() {
  runApp(ImageGallery());
}

class ImageGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RaisedButton(
            child: Text(
              'Click Here'
            ),
            onPressed: () async{
              FilePickerResult result = await FilePicker.platform.pickFiles();

              if(result != null) {
                PlatformFile file = result.files.first;

                print(file.name);
                print(file.bytes);
                print(file.size);
                print(file.extension);
                print(file.path);
              }
            },
          ),
        ),
      ),
    );
  }

}