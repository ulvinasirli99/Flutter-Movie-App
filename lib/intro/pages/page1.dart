import 'package:concentric_transition/page_route.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/intro/utils/page_card.dart';
import 'package:tmdb_movie_app/intro/pages/page2.dart';
import 'package:tmdb_movie_app/model/intro/page_data.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35, right: 5),
            child: Align(
              alignment: Alignment.topRight,
              child: MaterialButton(
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    ConcentricPageRoute(
                      builder: (ctx) {
                        return Page2();
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: PageCard(
                    page: pages![0],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
