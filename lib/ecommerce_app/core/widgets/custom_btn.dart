import 'package:depi_five/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomBtn extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const CustomBtn({super.key,required this.title,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
