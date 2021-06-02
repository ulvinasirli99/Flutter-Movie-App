import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            "assets/cool.png",
            width: 30,
            height: 30,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "COOL MOVIE",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
