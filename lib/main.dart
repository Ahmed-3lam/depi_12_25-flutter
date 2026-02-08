import 'package:depi_five/old_apps/note/note_hive_helper.dart';
import 'package:depi_five/old_apps/note/note_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'ecommerce_app/splash/splash_screen.dart';
import 'old_apps/bmi_calc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  await Hive.openBox(NoteHiveHelper.noteBox);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: SplashScreen());
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
