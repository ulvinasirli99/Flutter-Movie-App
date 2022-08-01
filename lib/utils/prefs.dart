import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_movie_app/enum/app_theme.dart';

//Todo Only App Theme Switch Saver
class Prefs {

  static late SharedPreferences preferences;

  static const String KEY_SELECTED_THEME = 'key_selected_theme';

//Todo SharedPreferences is Instance Created
  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void saveTheme(AppTheme selectedTheme) async {
    if (null == selectedTheme) {
      selectedTheme = AppTheme.lightTheme;
    }
    String theme = jsonEncode(selectedTheme.toString());
    preferences.setString(KEY_SELECTED_THEME, theme);
  }

//Todo AppTheme in App Initalize 
  static AppTheme? getTheme() {
    String? theme = preferences.getString(KEY_SELECTED_THEME);
    // ignore: unnecessary_null_comparison
    if (null == theme) {
      return AppTheme.lightTheme;
    }
    return getThemeFromString(jsonDecode(theme));
  }

  static AppTheme? getThemeFromString(String themeString) {
    for (AppTheme theme in AppTheme.values) {
      if (theme.toString() == themeString) {
        return theme;
      }
    }
    return null;
  }

}