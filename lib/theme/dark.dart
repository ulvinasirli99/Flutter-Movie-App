
import 'package:flutter/material.dart';

class DarkTheme{

  static ThemeData data = ThemeData(
  
      scaffoldBackgroundColor: Colors.indigo.shade200,

      bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.indigo.shade300,),
  
      primarySwatch: Colors.teal,
  
      backgroundColor: Colors.red,
  
      textTheme: TextTheme(
  
        bodyText1: TextStyle(

          color: Colors.white,
  
        ),
  
      ),
  
    );


}