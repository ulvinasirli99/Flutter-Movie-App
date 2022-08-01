import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

const IMAGE_KEY = 'IMAGE_KEY';

class ProfileSaver {

  static Future<bool> saveImageToPrefs(String value) async {
   
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString(IMAGE_KEY, value);
  }

  static Future<String?> loadImageFromPrefs() async {
  
    SharedPreferences prefs = await SharedPreferences.getInstance();
  
    return prefs.getString(IMAGE_KEY);
  
  }

  // encodes bytes list as string
  static String base64String(Uint8List data) {
 
    return base64Encode(data);
 
  }

  // decode bytes from a string
  static imageFrom64BaseString(String base64String) {
  
    return Image.memory(
  
      base64Decode(base64String),

      width: 90,
      
      height: 90,
  
      fit: BoxFit.fill,
  
    );
  
  }

}
