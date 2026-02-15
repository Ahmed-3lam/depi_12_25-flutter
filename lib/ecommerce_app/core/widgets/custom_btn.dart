import 'package:depi_five/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomBtn extends StatelessWidget {
  final String title;
  final Color color;
  final double height;
  final void Function()? onTap;
  final bool isLoading;
  const CustomBtn({
    super.key,
    required this.title,
    this.onTap,
    this.color = backgroundColor,
    this.height = 56,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: isLoading
              ? Center(child: CircularProgressIndicator(color: Colors.white))
              : Text(
                  title,
                  style: TextStyle(
                    color: color == backgroundColor ? Colors.white : null,
                    fontSize: 16,
                  ),
                ),
        ),
      ),
    );
  }
}
