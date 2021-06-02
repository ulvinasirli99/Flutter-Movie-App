import 'package:flutter/material.dart';

class TxtI extends StatelessWidget {
  final IconData iconData;
  final String text;

  TxtI(this.iconData, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 16,
          color: Colors.grey,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
