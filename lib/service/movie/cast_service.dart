import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tmdb_movie_app/model/movie/cast_model.dart';

class CastService {
 
  Future<CastModel> getCastPersons(int filmUID) async {
 
    String castUrl =
 
        "https://api.themoviedb.org/3/movie/$filmUID/credits?api_key=82842c1d4249ecbe2d8ee39d7cb524c3&language=en-US";
 
    var req = await http.get(Uri.parse(castUrl));
 
    var json = jsonDecode(req.body);
 
    if (req.statusCode == 200) {
 
      print("Review Service Status code : ${req.statusCode}");
 
      return CastModel.fromJson(json);
 
    } else {
 
      print("Error Service : ${req.statusCode}");
 
      throw Exception();
 
    }
 
  }

}