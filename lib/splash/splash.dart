import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/colors/app_color.dart';
import 'package:tmdb_movie_app/mixin/splash_controller_mixin.dart';
import 'package:tmdb_movie_app/screen/auth/login.dart';
import 'package:tmdb_movie_app/widgets/clip/splash_clip.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SplashContoller {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timerDuartionNavigate(
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: orange,
      body: Column(
        children: [
          Expanded(
            child: ClipPath(
              clipper: SplashClipPath(),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  "assets/film.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: CircularProgressIndicator(
              strokeWidth: 5,
              valueColor:
                  AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            width: 35,
            height: 35,
          ),
        ],
      ),
    );
  }
}
