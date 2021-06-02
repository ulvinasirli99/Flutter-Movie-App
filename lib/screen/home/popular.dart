import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_color/random_color.dart';
import 'package:tmdb_movie_app/colors/app_color.dart';
import 'package:tmdb_movie_app/get/popular_movie_controller.dart';
import 'package:tmdb_movie_app/global/url/urls.dart';
import 'package:tmdb_movie_app/screen/detail/detail.dart';

class PopularMoviePage extends StatefulWidget {
  @override
  _PopularMoviePageState createState() => _PopularMoviePageState();
}

class _PopularMoviePageState extends State<PopularMoviePage> {
  RandomColor randomColor;
  int pageNum = 1;
  AppLifecycleState lifecycleState;
  ScrollController scrollController = new ScrollController();
  PopularMovieController movieController = Get.put(PopularMovieController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieController.getMovieList(pageNum);
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        setState(() {
          pageNum++;
          movieController.nextGetMovieList(pageNum);
          print(pageNum);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: GetX<PopularMovieController>(
          init: movieController,
          builder: (value) {
            return value.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    controller: scrollController,
                    itemCount: movieController.movieList.length + 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 0.6,
                    ),
                    itemBuilder: (context, index) {
                      if (index == movieController.movieList.length) {
                        return SizedBox(
                          width: 30,
                          height: 30,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                filmUID: movieController.movieList[index].id,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 2,
                            left: 2,
                            right: 2,
                            bottom: 3,
                          ),
                          width: 120,
                          height: 100,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                  ),
                                  child: FadeInImage.assetNetwork(
                                    fit: BoxFit.cover,
                                    placeholder: "assets/loading.gif",
                                    image: movieController.movieList[index]
                                                .backdropPath ==
                                            null
                                        ? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png"
                                        : Urls.imageUrl +
                                            movieController
                                                .movieList[index].backdropPath,
                                  ),
                                ),
                              ),
                              Container(
                                width: 120,
                                height: 20,
                                child: Text(
                                  movieController.movieList[index].title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: purple,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
