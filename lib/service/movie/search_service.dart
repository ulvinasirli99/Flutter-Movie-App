import 'dart:convert';
import 'package:tmdb_movie_app/global/url/urls.dart';
import 'package:tmdb_movie_app/model/movie/search_model.dart';
import 'package:http/http.dart' as http;

class SearchService {
  //Todo Search Service Hass Been Staterted..........

  Future<SearchModel> searchMovieResult(int pageNum, String movieName) async {
    var response = await http.get(
      Uri.parse(
          "https://api.themoviedb.org/3/search/movie?api_key=82842c1d4249ecbe2d8ee39d7cb524c3&language=en-US&query=$movieName&page=$pageNum"),
    );

    if (response.statusCode == 200) {
      print("Search Service Response Status : ${response.statusCode}");

      try {
        var data = jsonDecode(response.body);

        return SearchModel.fromJson(data);
      } catch (e) {
        print(e.toString());
      }
    } else {
      print("Search Service Error : ${response.statusCode}");
    }

    return null;
  }
}
