import 'dart:convert';
import 'package:tmdb_movie_app/global/url/urls.dart';
import 'package:tmdb_movie_app/model/movie/search_model.dart';
import 'package:http/http.dart' as http;

class SearchService {
  
  //Todo Search Service Hass Been Staterted..........
  
  Future<SearchModel> searchMovieResult() async {
  
    var response = await http.get(Uri.parse(Urls.searchMovieUrl));
  
    if (response.statusCode == 200) {

       print("Search Service Response Status : ${response.statusCode}");
  
      try {
  
        var data = jsonDecode(response.body);
  
        return SearchModel.fromJson(data);
  
      } catch (e) {
  
        print(e.toString());
  
      }
  
    }else{
  
      print("Search Service Error : ${response.statusCode}");
  
    }

    return null;
  
  }

}
