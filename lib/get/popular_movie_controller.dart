import 'package:get/get.dart';
import 'package:tmdb_movie_app/model/movie/popular_model.dart';
import 'package:tmdb_movie_app/service/movie/popular_service.dart';

class PopularMovieController extends GetxController {
 
  var isLoading = true.obs;
 
  PopularService service = PopularService();
 
  var movieList = List<Result>.empty(growable: false).obs;

 //Todo Initial Service for Start 
 Future<List<Result>> getMovieList(int pageNum) async {
 
    isLoading.value = true;
 
    var result = await service.getPopularMovies(pageNum);
 
    movieList = result.obs;
 
    isLoading.value = false;
 
    update();
 
  }

//Todo This Controller is  Next Page Data Service
 Future<List<Result>> nextGetMovieList(int pageNum) async {
 
    var result = await service.getPopularMovies(++pageNum);
 
    movieList.addAll(result);
 
    pageNum++;
 
    update();
 
  }

}
