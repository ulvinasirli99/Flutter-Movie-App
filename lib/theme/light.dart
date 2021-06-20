import 'package:flutter/material.dart';

class LightTheme{
 
  static ThemeData data = ThemeData(
  
      scaffoldBackgroundColor: Colors.white,

      bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.indigo.shade400,),
  
      primarySwatch: Colors.blue,
  
      backgroundColor: Colors.white,
  
      textTheme: TextTheme(
  
        bodyText1: TextStyle(
  
          color: Colors.black,
  
        ),
  
      ),
  
    );
}