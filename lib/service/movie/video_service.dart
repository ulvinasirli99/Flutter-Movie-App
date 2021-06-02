import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tmdb_movie_app/model/movie/video_model.dart';

class VideService {
  
  Future<VideolModel> videosReady(int pageNum) async {
  
    final String url =
  
        "https://api.themoviedb.org/3/movie/$pageNum/videos?api_key=82842c1d4249ecbe2d8ee39d7cb524c3&language=en-US";

    var req = await http.get(Uri.parse(url));

    if (req.statusCode == 200) {
  
      var res = jsonDecode(req.body);
  
      return VideolModel.fromJson(res);
  
    } else {
  
      print("Error : ${req.statusCode}");
  
      throw Exception();
  
    }
  
  }

}
