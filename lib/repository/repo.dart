import 'package:tmdb_movie_app/model/movie/search_model.dart';
import 'package:tmdb_movie_app/service/movie/search_service.dart';

class ApiRepository {

  //Todo Search Service is initialize
 
  final searchService = new  SearchService();
 
 //Todo is SearchModel get Search service commint
  Future<SearchModel> getAllMovieSearch(int pageNum, String movieName) async {
 
    return await searchService.searchMovieResult(pageNum,movieName);
 
  }

}
