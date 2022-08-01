import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tmdb_movie_app/global/url/urls.dart';
import 'package:tmdb_movie_app/model/movie/popular_model.dart';

class PopularService {
 
  Future<List<Result>> getPopularMovies(int pageNumber) async {
 
    String url = "${Urls.popularMovieUrl}$pageNumber";

    var req = await http.get(Uri.parse(url));

    var res = jsonDecode(req.body);

    if (req.statusCode == 200) {
 
      List<Result> dataResult = PopularModel.fromJson(res).results!;

      return dataResult;
 
    } else {
 
      print("Popular Service Error Code : ${req.statusCode}");

      throw Exception();
 
    }
 
  }

}
