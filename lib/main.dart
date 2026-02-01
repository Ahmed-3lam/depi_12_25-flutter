import 'package:flutter/material.dart';

import 'messanger/messanger_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MessangerScreen());
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
/// CircleAvatar
/// ListView.builder (for loop)
