import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/screen/home/search.dart';
import 'package:tmdb_movie_app/widgets/global/comming_list_films.dart';
import 'package:tmdb_movie_app/widgets/global/nowshow_list_films.dart';
import 'package:tmdb_movie_app/widgets/home/app_bar_icon.dart';
import 'package:tmdb_movie_app/widgets/home/left_dots_widget.dart';
import 'package:tmdb_movie_app/widgets/image/custom_carousel_down.dart';
import 'package:tmdb_movie_app/widgets/image/custom_carousel_image.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBarWidget(),
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchPage(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.search,
                        size: 35,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomCarouselImage(),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCarouselDown(
                    imagePath: "assets/hot.png",
                  ),
                  CustomCarouselDown(
                    imagePath: "assets/list.png",
                  ),
                  CustomCarouselDown(
                    imagePath: "assets/sort.png",
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            LeftDotsWidget("Now Showing Movies"),
            SizedBox(height: 15),
            NowShowListFilmWidget(),
            SizedBox(height: 20),
            LeftDotsWidget("Is on the air"),
            CommingListFilmWidget(),
          ],
        ),
      ),
    );
  }
}
