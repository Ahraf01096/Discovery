import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
        required this.backgroundColor,
        required this.textColor,
        this.borderRadius,
        required this.text,
        this.fontSize,
        this.onPressed, this.width});
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String text;
  final double? fontSize;
  final double? width;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(30))),
        child: Text(
          text,
          style: Styles.textStyle16.copyWith(
              color: textColor,
              fontSize: fontSize),
        ),
      ),
    );
  }
}