import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/intro/pages/page1.dart';

class RouteExample extends StatefulWidget {
  @override
  _RouteExampleState createState() => _RouteExampleState();
}

class _RouteExampleState extends State<RouteExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Page1(),
    );
  }
}




