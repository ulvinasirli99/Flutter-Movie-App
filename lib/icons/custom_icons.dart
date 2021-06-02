import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData iconData;
  final double iconSize;
  final Color color;

  CustomIcon({this.iconData, this.iconSize, this.color});


  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: iconSize,
      color: color,
    );
  }

}