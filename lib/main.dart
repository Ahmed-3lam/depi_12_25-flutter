import 'package:depi_five/note/note_hive_helper.dart';
import 'package:depi_five/note/note_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'old_apps/bmi_calc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  await Hive.openBox(NoteHiveHelper.noteBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: NoteScreen());
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
/// ListView.separated (for loop)
/// Expanded
/// Spacer
/// AppBar
/// Icon
