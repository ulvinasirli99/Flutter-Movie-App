import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movie_app/cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  
  ThemeCubit() : super(ThemeLightState());

//Todo Theme Cubit with chnage App Theme
  void getChangeThemeCubit() {
  
    if (state is ThemeLightState) {
  
      emit(ThemeDarkState());
  
    } else {
  
      emit(ThemeLightState());
  
    }
  
  }

}

