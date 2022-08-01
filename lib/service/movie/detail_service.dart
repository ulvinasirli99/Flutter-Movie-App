import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tmdb_movie_app/model/movie/detail_model.dart';

class FilmDetailService {

  //Todo Detail Service for Film
  Future<DetailModel?> getFilmDetail(int filmUID) async {
 
    var response = await http.get(Uri.parse(
 
        "https://api.themoviedb.org/3/movie/$filmUID?api_key=82842c1d4249ecbe2d8ee39d7cb524c3&language=tr-TR"));

    if (response.statusCode == 200) {
 
      var json = jsonDecode(response.body);

      return DetailModel.fromJson(json);
 
    } else {
 
      print("Error Service Code : ${response.statusCode}");
 
    }
 
  }

}
