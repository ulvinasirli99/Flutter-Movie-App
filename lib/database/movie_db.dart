import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tmdb_movie_app/model/db/favorite_model.dart';

class DatabaseProvider {
  Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    String dbPath = join(await getDatabasesPath(), "favmovie.db");
    var movieDb = await openDatabase(dbPath, version: 3, onCreate: createDb);
    return movieDb;
  }

  FutureOr<void> createDb(Database db, int version) async {
    await db.execute(
        "Create table movies(id integer primary key, movieID integer, movieName text, movieImage text, movieType text)");
  }

  Future<List> allFavoriteMovies() async {
    Database db = await this.db;
    List<FavoriteModel> movieListItem = [];
    List<Map> result = await db.query("movies",
        columns: ["id", "movieID", "movieName", "movieImage", "movieType"],
        orderBy: "id DESC");
    if (result.length > 0) {
      result.forEach((element) {
        movieListItem.add(FavoriteModel.fromMap(element));
      });
    }
    return movieListItem;
  }

  Future<int> insert(FavoriteModel favMovie) async {
    Database db = await this.db;
    var result = await db.insert("movies", favMovie.toMap());
    return result;
  }

  Future<int> delete(int movieId) async {
    Database db = await this.db;
    var result = await db.rawDelete("delete from movies where movieID = ?",[movieId]);
    return result;
  }

  Future<int> allDeleteMovies() async {
    Database db = await this.db;
    var result = await db.delete("movies");
    return result;
  }

  Future<bool> favoriteHasData(int movieId) async {
    Database db = await this.db;
    final ret =
        await db.rawQuery('SELECT * FROM movies WHERE movieID = ?', [movieId]);
    if (ret.length == 0) {
      return false;
    } else {
      return true;
    }
  }
}
