import 'package:flutter/material.dart';
import 'TodoScreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final materialApp = MaterialApp(
      title: '',
      home: TodoScreen(),
    );
    return materialApp;
  }
}
