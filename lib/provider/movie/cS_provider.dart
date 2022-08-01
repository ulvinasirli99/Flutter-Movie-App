import 'package:flutter/cupertino.dart';
import 'package:tmdb_movie_app/model/movie/comming_soon_model.dart';
import 'package:tmdb_movie_app/service/movie/comming_movie_service.dart';

class CServiceProvider extends ChangeNotifier {
  List<Result>? cResultList = [];

  bool loadingData = false;

  var service = new CommingMovieService();

  //Todo Initial Comming Movie Data Provider
  Future<List<Result>?> cMovieDataProvider(int pageNum) async {
    loadingData = true;

    cResultList = await service.getCommingMovieResults(pageNum);

    loadingData = false;

    notifyListeners();

    return cResultList;
  }

  //Todo Initial Comming Next Movie Data Provider
  Future<List<Result>?> nextCMovieData(int pageNum) async {
    var commingList = await service.getCommingMovieResults(++pageNum);

    cResultList?.addAll(commingList!);

    pageNum++;

    notifyListeners();

    return commingList;
  }
}
