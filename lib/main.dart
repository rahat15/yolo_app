import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yolo_app/home_page.dart';
import 'package:yolo_app/input_page.dart';
import 'package:yolo_app/output_page.dart';
import 'package:yolo_app/model_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ModelProvider(),
      child: MaterialApp(
        title: 'YOLOv8 Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/input': (context) => InputPage(),
          '/output': (context) => OutputPage(),
        },
      ),
    );
  }
}
