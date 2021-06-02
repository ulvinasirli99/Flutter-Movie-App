import 'package:flutter/cupertino.dart';
import 'package:tmdb_movie_app/model/movie/now_show_model.dart';
import 'package:tmdb_movie_app/service/movie/movie%20_service.dart';

class MServiceProvider extends ChangeNotifier {
  
  List<Result> resultList = [];

  bool loading = false;

  var service = new MovieService();

  //Todo Initial Now Showing Movie Data Provider
  Future<List<Result>> movieDataProvider(int pageNum) async {
  
    loading = true;

    resultList = await service.getMovieResults(pageNum);

    loading = false;

    notifyListeners();
  }
  
  //Todo Initial Now Showing Next Movie Data Provider
  Future<List<Result>> nextMovieData(int page) async {
   
    var dataList = await service.getMovieResults(++page);

    resultList.addAll(dataList);

    page++;

    notifyListeners();
  
  }

}


/*

var dataList = await service.getMovieResults(pageNum);

    resultList.addAll(dataList);

*/
