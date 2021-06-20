import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tmdb_movie_app/model/movie/heat_model.dart';

class HeatService {
 
  Future<List<Result>> heatMovieItems(int pageNum) async {
 
    String url =

        "https://api.themoviedb.org/3/search/movie?api_key=82842c1d4249ecbe2d8ee39d7cb524c3&language=en-US&query=hot&page=$pageNum";

    var req = await http.get(Uri.parse(url));

    var json = jsonDecode(req.body);

    if (req.statusCode == 200) {

      print("Heat Service Status code : ${req.statusCode}");

      List<Result> resResult = HeatModel.fromJson(json).results;

      return resResult;

    } else {

      print("Error Service : ${req.statusCode}");

      throw Exception();

    }

  }

}
