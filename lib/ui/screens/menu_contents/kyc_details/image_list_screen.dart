import 'dart:io';

import 'package:flutter/material.dart';

class ImageListScreen extends StatelessWidget {
  final List<String> pickedImage;
  const ImageListScreen({super.key, required this.pickedImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Picked Images'),
      ),
      body: ListView.builder(
        itemCount: pickedImage.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Image.file(File(pickedImage[index])),
          );
        },
      ),
    );
  }
}
