import 'package:depi_five/my_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

///stateless widget

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome());
  }
}
/// Material App
/// Scaffold
/// Container
/// Text
/// Center
/// Row
/// Column
/// SizedBox
