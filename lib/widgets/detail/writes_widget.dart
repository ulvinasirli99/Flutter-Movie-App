import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class WritesWidget extends StatelessWidget {
  final String writesName;

  WritesWidget({Key key, this.writesName}) : super(key: key);

  RandomColor _randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 8),
      width: 90,
      height: 140,
      decoration: BoxDecoration(
        color: _randomColor.randomColor(),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Center(
        child: Text(
          writesName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.orange,
          ),
        ),
      ),
    );
  }
}
