import 'package:depi_five/old_apps/note/note_hive_helper.dart';
import 'package:depi_five/old_apps/note/note_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'ecommerce_app/core/helpers/hive_helper.dart';
import 'ecommerce_app/features/splash/splash_screen.dart';
import 'old_apps/bmi_calc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  await Hive.openBox(NoteHiveHelper.noteBox);
  await Hive.openBox(HiveHelper.onboardingBox);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(useInheritedMediaQuery: true, home: SplashScreen());
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
