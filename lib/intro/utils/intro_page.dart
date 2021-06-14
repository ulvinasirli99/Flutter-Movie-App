import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/intro/utils/route.dart';
import 'package:tmdb_movie_app/model/intro/page_data.dart';

class OnboardingScreen extends StatelessWidget {
  List<Color> get colors => pages.map((p) => p.bgColor).toList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ConcentricPageView(
          colors: <Color>[
            Colors.white,
            Colors.blue,
            Colors.red,
          ],
          itemCount: 1, // null = infinity
          itemBuilder: (int index, double value) {
            return Container(
              child: RouteExample(),
            );
          },
        ),
      ),
    );
  }
}
