import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_movie_app/screen/auth/login.dart';
import 'package:tmdb_movie_app/screen/navigation/all_page_navigation.dart';

class AuthSession extends StatefulWidget {
  @override
  _AuthSessionState createState() => _AuthSessionState();
}

class _AuthSessionState extends State<AuthSession> {
  SharedPreferences sharedPreferences;

  Future authSession() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getInt("userUIDCodeValue") != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AllPagesNavigation()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
