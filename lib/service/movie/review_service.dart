import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tmdb_movie_app/model/movie/review_model.dart';

class ReviewService {
 
  Future<ReviewModel> getReviewsContent(int filmUID) async {
 
    var url =
 
        "https://api.themoviedb.org/3/movie/$filmUID/reviews?api_key=82842c1d4249ecbe2d8ee39d7cb524c3&language=en-US&page=1";
 
    var req = await http.get(Uri.parse(url));
 
    var jsonDec = jsonDecode(req.body);
 
    if (req.statusCode == 200) {
 
      return ReviewModel.fromJson(jsonDec);
 
    } else {
 
      print("Error Data Service : ${req.statusCode}");
 
      throw Exception();
 
    }
 
  }

}
