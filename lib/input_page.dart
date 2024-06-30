import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:yolo_app/model_provider.dart';

class InputPage extends StatelessWidget {
  final picker = ImagePicker();

  Future<void> pickImage(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      Provider.of<ModelProvider>(context, listen: false).setImage(File(pickedFile.path));
      Navigator.pushNamed(context, '/output');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => pickImage(context),
          child: Text('Capture Image'),
        ),
      ),
    );
  }
}
