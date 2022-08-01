import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  
  late SharedPreferences sharedPreferences;
  
  Future<bool> setIntroValueWrite(bool valueKey) async {
  
    sharedPreferences = await SharedPreferences.getInstance();
  
    return sharedPreferences.setBool("introValue", valueKey);
  
  }

  Future<bool?> getIntroValueRead() async {
  
    sharedPreferences = await SharedPreferences.getInstance();
  
    return sharedPreferences.getBool("introValue") ?? null;
  
  }

}

