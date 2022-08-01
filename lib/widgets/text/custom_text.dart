import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String ?text;
  final double ?size;
  final FontWeight ?fontWeight;
  final Color ?color;
  final FontStyle ?fontStyle;

  CustomText({
    this.text,
    this.size,
    this.fontWeight,
    this.color,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        fontStyle: fontStyle,
      ),
    );
  }
}
