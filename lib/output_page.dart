import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yolo_app/model_provider.dart';

class OutputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final modelProvider = Provider.of<ModelProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Output Page'),
      ),
      body: modelProvider.image == null
          ? Center(child: Text('No image selected.'))
          : Column(
              children: [
                Image.file(modelProvider.image),
                modelProvider.outputs != null
                    ? Text(
                        'Detected: ${modelProvider.outputs[0]["label"]}',
                        style: TextStyle(fontSize: 20),
                      )
                    : CircularProgressIndicator(),
              ],
            ),
    );
  }
}
