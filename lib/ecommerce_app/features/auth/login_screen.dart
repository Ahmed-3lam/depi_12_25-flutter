import 'package:depi_five/const.dart';
import 'package:depi_five/ecommerce_app/core/widgets/custom_btn.dart';
import 'package:depi_five/ecommerce_app/features/auth/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(imagePath + "logo.png", height: 120),
              Text(
                "Welcome to our  ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "E-Grocery",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: backgroundColor,
                ),
              ),
              SizedBox(height: 70),
              CustomTextfield(title: "Email"),
              SizedBox(height: 20),

              CustomTextfield(title: "Password", isPassword: true),
              SizedBox(height: 5),

              Row(
                mainAxisAlignment: .end,
                children: [Text("Forget Password?")],
              ),
              SizedBox(height: 20),
              CustomBtn(title: "Login", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
