import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final String title;
  final bool isPassword;
  const CustomTextfield({
    super.key,
    required this.title,
    this.isPassword = false,
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
        Container(
          height: 50,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.grey[200],
          ),
          child: TextFormField(
            obscureText: widget.isPassword && isObscure,
            decoration: InputDecoration(
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
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
