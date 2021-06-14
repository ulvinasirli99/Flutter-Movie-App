import 'package:flutter/material.dart';

class PageData {
  final String title;
  final IconData icon;
  final Color bgColor;
  final Color textColor;

  PageData({
    this.title,
    this.icon,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
  });
}

final List<PageData> pages = [
    PageData(
      icon: Icons.format_size,
      title: "Intersting \n Movies and Films",
      textColor: Colors.white,
      bgColor: Colors.teal,
    ),
    PageData(
      icon: Icons.movie,
      title: "Movie Trailer Youtube Videos",
      bgColor: Colors.blue.shade400.withOpacity(0.8),
    ),
    PageData(
      icon: Icons.movie_creation,
      title: "Youtube Video \n Download",
      bgColor: Colors.redAccent.withOpacity(0.8),
      textColor: Colors.white,
    ),
  ];