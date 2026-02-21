import 'package:depi_five/const.dart';
import 'package:depi_five/ecommerce_app/core/extension/email_validation.dart';
import 'package:depi_five/ecommerce_app/core/helpers/hive_helper.dart';
import 'package:depi_five/ecommerce_app/core/widgets/custom_btn.dart';
import 'package:depi_five/ecommerce_app/features/auth/widgets/custom_textfield.dart';
import 'package:depi_five/ecommerce_app/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
          child: GestureDetector(
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Image.asset("${imagePath}logo.png", height: 120),
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
                    CustomTextfield(
                      controller: _emailController,
                      title: "Email",
                      label: "Email",
                      prefixIcon: Icon(Icons.email),
                      validator: (value) {
                        if (!value!.emailValid()) {
                          return "Email isn't valid";
                        }
                      },
                    ),
                    SizedBox(height: 20),

                    CustomTextfield(
                      controller: _passwordController,
                      title: "Password",
                      isPassword: true,
                      validator: (value) {
                        if (value!.length < 6) {
                          return "Password should be more than 5 letters";
                        }
                      },
                    ),
                    SizedBox(height: 5),

                    Row(
                      mainAxisAlignment: .end,
                      children: [Text("Forget Password?")],
                    ),
                    SizedBox(height: 20),
                    CustomBtn(
                      title: "Login",
                      isLoading: _isLoading,
                      onTap: () async {
                        if (_formkey.currentState!.validate()) {
                          _isLoading = true;
                          setState(() {});
                          await Future.delayed(Duration(seconds: 3));
                          if (_emailController.text == "ahmed@gmail.com" &&
                              _passwordController.text == "123456") {
                            HiveHelper.setLoginBox();
                            Get.offAll(HomeScreen());
                          } else {
                            Get.snackbar(
                              "Error",
                              "Your credintials isn't correct",
                              backgroundColor: Colors.red,
                            );
                          }
                          _isLoading = false;
                          setState(() {});
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



/// (1) validator function in textformField
/// (2)  Create Form Widget above all the TextFormFields
/// (3) create key for this form widget
/// (4) _formkey.currentState!.validate()