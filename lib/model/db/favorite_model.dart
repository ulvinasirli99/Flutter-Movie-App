import 'package:tmdb_movie_app/global/constants/db_texts.dart';

class FavoriteModel {
  int id;
  int movieID;
  String movieName;
  String movieImage;
  String movieType;
  //Todo Database Model Conustructor
  FavoriteModel({
    this.movieID,
    this.movieName,
    this.movieImage,
    this.movieType,
  });

  //Todo Operation with
  FavoriteModel.withId({
    this.id,
    this.movieID,
    this.movieName,
    this.movieImage,
    this.movieType,
  });

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["movieID"] = movieID;
    map["movieName"] = movieName;
    map["movieImage"] = movieImage;
    map["movieType"] = movieType;
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  FavoriteModel.fromMap(dynamic map) {
    this.id = int.tryParse(map["id"].toString());
    this.movieID = int.tryParse(map["movieID"].toString());
    this.movieName = map["movieName"];
    this.movieImage = map["movieImage"];
    this.movieType = map["movieType"];
  }
}
