import 'dart:convert';

import 'package:tmdb_movie_app/model/movie/comming_soon_model.dart';
import 'package:http/http.dart' as http;

class CommingMovieService {
 
  //Todo Comming Soon Service Has Been Started...........
  Future<List<Result>?> getCommingMovieResults(int pageNum) async {
 
    var response = await http.get(Uri.parse(
 
        "https://api.themoviedb.org/3/movie/upcoming?api_key=82842c1d4249ecbe2d8ee39d7cb524c3&language=tr-TR&page=$pageNum"));

    if (response.statusCode == 200) {
 
      try {
 
        var dataModel = jsonDecode(response.body);

        List<Result>? dataResults = ComingSoonModel.fromJson(dataModel).results;
 
        return dataResults!;
 
      } catch (e) {
 
        print("Error State : ${e.toString()}");
 
      }
 
    }
 
  }

}
