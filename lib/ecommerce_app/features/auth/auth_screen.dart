import 'dart:async';

import 'package:depi_five/const.dart';
import 'package:depi_five/ecommerce_app/core/widgets/custom_btn.dart';
import 'package:depi_five/ecommerce_app/features/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late Timer _timer;
  String image = "auth_1.png";

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (image == "auth_1.png") {
        image = "auth_2.png";
      } else {
        image = "auth_1.png";
      }
      setState(() {});
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
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,

            child: Image.asset(imagePath + image, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 130,
              left: 20,
              right: 20,
              bottom: 30,
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  "Welcome to our  ",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800),
                ),

                Text(
                  "E-Grocery",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                    color: backgroundColor,
                  ),
                ),
                Spacer(),
                CustomBtn(
                  title: "Continue with Email or Phone",
                  onTap: () {
                    Get.to(LoginScreen());
                  },
                  height: height * .08,
                ),
                SizedBox(height: 10),
                CustomBtn(
                  title: "Create an account",
                  onTap: null,
                  color: Colors.white,
                  height: height * .08,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
