import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class ModelProvider extends ChangeNotifier {
  File _image = File(''); // initialized
  List _outputs = []; // initialized

  File get image => _image;
  List get outputs => _outputs;

  ModelProvider() {
    _initialize();
  }

  Future<void> _initialize() async {
    await loadModel();
    notifyListeners(); // Notify listeners that the model is loaded
  }

  void setImage(File image) {
    _image = image;
    classifyImage(image);
    notifyListeners();
  }

  Future<void> classifyImage(File image) async {
    var result = await Tflite.runModelOnImage(
      path: image.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2,
      threshold: 0.2,
      asynch: true,
    );

    _outputs = result ?? [];
    notifyListeners();
  }

  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: "assets/best_float16.tflite"
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
