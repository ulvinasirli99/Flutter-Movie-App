import 'package:flutter/material.dart';

class CustomCarouselDown extends StatelessWidget {
  final String imagePath;

  CustomCarouselDown({this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: 45,
      height: 45,
      fit: BoxFit.cover,
    );
  }
}
