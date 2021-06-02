import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LeftDotsWidget extends StatelessWidget {
  final String text;
  LeftDotsWidget(this.text);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 15,top: 2),
          width: 4,
          height: 15,
          color: Colors.green,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
