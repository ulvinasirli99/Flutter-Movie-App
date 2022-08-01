import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/screen/auth/login.dart';

mixin LogoutMix {
  
  late SharedPreferences sharedPreferences;
  
  void logoutAccount(BuildContext context) async {
  
    sharedPreferences = await SharedPreferences.getInstance();
  
    sharedPreferences.remove("");
  
    Navigator.pushAndRemoveUntil(context,
  
        MaterialPageRoute(builder: (context) => LoginPage()), (route) => true);
  
  }

}

