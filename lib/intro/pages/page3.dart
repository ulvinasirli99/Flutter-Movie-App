import 'package:concentric_transition/page_route.dart';
import 'package:flutter/material.dart';

import 'package:tmdb_movie_app/preferences/prefs.dart';
import 'package:tmdb_movie_app/splash/splash.dart';

class Page3 extends StatelessWidget {
  SharedPrefs prefs = new SharedPrefs();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: MaterialButton(
              child: Icon(
                Icons.arrow_forward_ios,
                size: 45,
                color: Colors.white,
              ),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SplashScreen(),
                  ),
                );
                await prefs.setIntroValueWrite(false);
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Get Started",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
