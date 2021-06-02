import 'dart:convert';
import 'package:tmdb_movie_app/global/url/urls.dart';
import 'package:tmdb_movie_app/model/movie/now_show_model.dart';
import 'package:http/http.dart' as http;

class MovieService {
  //Todo Now PlayModel Service Hass Been Staterted..........
  Future<List<Result>> getMovieResults(int pageNumber) async {
    var resposne = await http
        .get(Uri.parse(Urls.nowPlayingUrl + "${pageNumber.toString()}"));

    if (resposne.statusCode == 200) {
      try {
        var data = jsonDecode(resposne.body);

        List<Result> results = NowPlayingModel.fromJson(data).results;

        return results;
      } catch (e) {
        print("Error State : ${e.toString()}");
      }
    } else {
      print("Movie No Play Error : ${resposne.statusCode}");
    }
  }
}
