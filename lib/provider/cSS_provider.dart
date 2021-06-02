import 'package:flutter/cupertino.dart';
import 'package:tmdb_movie_app/model/movie/cast_model.dart';
import 'package:tmdb_movie_app/service/movie/cast_service.dart';

class CastServiceProvider extends ChangeNotifier {

  bool loading = false;

  CastModel castModel;

  var castService = new CastService();

  Future<CastModel> getCasts(int id) async {

    loading = true;

    castModel = await castService.getCastPersons(id);

    loading = false;

    notifyListeners();

  }

}
