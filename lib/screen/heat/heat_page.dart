import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/get/heat_service_controller.dart';
import 'package:tmdb_movie_app/global/url/urls.dart';
import 'package:tmdb_movie_app/model/movie/heat_model.dart';
import 'package:tmdb_movie_app/screen/detail/detail.dart';
import 'package:tmdb_movie_app/widgets/core/film_round_image.dart';
import 'package:get/get.dart';

class HeatPage extends StatefulWidget {
  @override
  _HeatPageState createState() => _HeatPageState();
}

class _HeatPageState extends State<HeatPage> {
  int initialPageNumber = 1;
  ScrollController scrollController = new ScrollController();
  HeatServiceController movieController = Get.put(HeatServiceController());

  @override
  void initState() {
    super.initState();
    movieController.getHeatData(initialPageNumber);
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        setState(() {
          initialPageNumber++;
          movieController.nextHeatPage(initialPageNumber);
          print(initialPageNumber);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<HeatServiceController>(
        init: movieController,
        builder: (value) {
          List<Result> listItem = movieController.listModel;
          return value.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  controller: scrollController,
                  itemCount: movieController.listModel.length + 1,
                  itemBuilder: (context, index) {
                    if (index == movieController.listModel.length) {
                      return SizedBox(
                        width: 30,
                        height: 50,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              filmUID: listItem[index].id,
                            ),
                          ),
                        );
                      },
                      child: FilmRoundImage(
                        movieUrl: listItem[index].backdropPath == null
                            ? Urls.ifFilmImageNull
                            : "${Urls.imageUrl}${listItem[index].backdropPath}",
                        orginalTitle: listItem[index].originalTitle,
                        populuartyValue: listItem[index].popularity.toString(),
                        releaseDateTime: listItem[index].releaseDate.toString(),
                        voteCount: listItem[index].voteCount.toString(),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
