import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/colors/app_color.dart';
import 'package:tmdb_movie_app/global/url/urls.dart';
import 'package:tmdb_movie_app/model/movie/popular_model.dart';

class GridFilmWidget extends StatelessWidget {
  final List<Result> resultList;

  const GridFilmWidget({
    Key? key,
    required this.resultList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: resultList.length + 1,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) {
        if (index == resultList.length) {
          return SizedBox(
            width: 30,
            height: 30,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Container(
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
                    image: resultList[index].backdropPath == null
                        ? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png"
                        : Urls.imageUrl + resultList[index].backdropPath!,
                  ),
                ),
              ),
              Container(
                width: 120,
                height: 20,
                child: Text(
                  resultList[index].title!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: purple,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
