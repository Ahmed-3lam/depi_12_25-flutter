import 'dart:async';

import 'package:depi_five/const.dart';
import 'package:depi_five/ecommerce_app/core/helpers/hive_helper.dart';
import 'package:depi_five/ecommerce_app/features/auth/auth_screen.dart';
import 'package:depi_five/ecommerce_app/features/home/home_screen.dart';
import 'package:depi_five/ecommerce_app/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int count = 1;
  Color background = backgroundColor;

  late Timer _timer;
  int _start = 3;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          if (HiveHelper.getLoginBox() ==true) {
            Get.off(HomeScreen());
          } else if (HiveHelper.getOnboardingBoxValue() == true) {
            Get.off(AuthScreen());
          } else {
            Get.off(OnboardingScreen());
          }
        });
      } else {
        if (count == 1) {
          count = 2;
          background = Colors.white;
        } else {
          count = 1;
          background = backgroundColor;
        }

        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: InkWell(
        onTap: () {},
        child: Center(
          child: Image.asset("assets/images/logo_$count.png", height: 70),
        ),
      ),
    );
  }
}
