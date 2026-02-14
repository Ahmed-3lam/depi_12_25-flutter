import 'package:depi_five/const.dart';
import 'package:depi_five/ecommerce_app/features/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/helpers/hive_helper.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * .2),
              child: Image.asset("assets/images/onboarding_$count.png"),
            ),
            Column(
              children: [
                Text(
                  titles[count - 1],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  descriptions[count - 1],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: GestureDetector(
                onTap: () {
                  if (count < 3) {
                    count++;
                  } else {
                    HiveHelper.setOnboardingBoxValue();
                    Get.off(AuthScreen());
                  }

                  setState(() {});
                },
                child: Image.asset("assets/images/next_$count.png", height: 80),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
