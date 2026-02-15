import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final String title;
  final bool isPassword;
  final String? Function(String?)? validator;
  final bool autoFocus;
  final Widget? prefixIcon;
  final String? hintText;
  final String? label;
  final TextEditingController? controller;
  const CustomTextfield({
    super.key,
    required this.title,
    this.isPassword = false,
    this.validator,
    this.autoFocus = false,
    this.prefixIcon,
    this.hintText,
    this.label,
    this.controller
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    print("Build form Custom TextField");
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(widget.title, style: TextStyle(color: Colors.grey)),
        SizedBox(height: 5),
        TextFormField(
          controller: widget.controller,
          autofocus: widget.autoFocus,
          obscureText: widget.isPassword && isObscure,
          validator: widget.validator,
          decoration: InputDecoration(
            hintText: widget.hintText,
            labelText: widget.label,
            floatingLabelBehavior: FloatingLabelBehavior.auto,

            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPassword
                ? InkWell(
                    onTap: () {
                      isObscure = !isObscure;
                      setState(() {});
                    },
                    child: Icon(
                      isObscure ? Icons.remove_red_eye : Icons.visibility_off,
                    ),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
