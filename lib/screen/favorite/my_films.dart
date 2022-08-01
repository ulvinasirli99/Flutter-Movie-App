import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/database/movie_db.dart';
import 'package:tmdb_movie_app/global/url/urls.dart';
import 'package:tmdb_movie_app/model/db/favorite_model.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<dynamic> favs = [];

//Todo Bunu bir class da yazib daha sonra classi initiliaze etmek lazimdir.....
  Future<List<dynamic>> futureFavoriteMovies() async {
    var db = DatabaseProvider();
    await db.allFavoriteMovies().then((moviesElement) {
      favs = moviesElement;
    });
    return favs;
  }

  @override
  void initState() {
    super.initState();
    futureFavoriteMovies();
    print(favs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: futureFavoriteMovies(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data!.length == 0) {
            return Center(
              child: Text(
                "No You isn't favorite movies",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.teal,
                ),
              ),
            );
          }
          if (snapshot.data!.length == null) {
            return Center(
              child: Text(
                "You isn't favorite movies",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.teal,
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              String movieImage = snapshot.data![index].movieImage == null
                  ? "http://filmcasting.az/uploads/202006000635.jpg"
                  : "${Urls.imageUrl}${snapshot.data![index].movieImage}";
              final item = snapshot.data![index];
              return Dismissible(
                background: Container(color: Colors.teal.shade300),
                key: UniqueKey(),
                child: ListTile(
                  contentPadding: EdgeInsets.all(12),
                  title: Text(
                    snapshot.data![index].movieName!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.lightGreen.shade800.withOpacity(
                        0.7,
                      ),
                    ),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                      snapshot.data![index].movieType!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  leading: Container(
                    width: 80,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(movieImage),
                      ),
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    deleteMovieItem(snapshot, index);
                  });
                },
              );
            },
          );
        },
      ),
    );
  }
  void deleteMovieItem(
      AsyncSnapshot<List<dynamic>> snapshot, int index) async {
    await DatabaseProvider().delete(snapshot.data![index].movieID!);
  }
}
