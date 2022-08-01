import 'package:flutter/cupertino.dart';
import 'package:tmdb_movie_app/database/movie_db.dart';

class CheckStorageMovieItem extends ChangeNotifier {
  //Todo Database created Initalized
  var databaseHandler = new DatabaseProvider();

  //! Has Data check in SQfLIte
  bool isFavorited = false;

  //? Favorite return result Line.......
  Future<bool?> checkMovieDbItem(int movieItemId) async {
    isFavorited = await databaseHandler.favoriteHasData(movieItemId);

    notifyListeners();

    return isFavorited;
  }
}
