import 'package:flutter/material.dart';

class FilmImageWidget extends StatelessWidget {
  final String imgURI;
  FilmImageWidget(this.imgURI);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imgURI),
        ),
      ),
    );
  }
}
