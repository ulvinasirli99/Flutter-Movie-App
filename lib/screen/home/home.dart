import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/global/animation/list_animation.dart';
import 'package:tmdb_movie_app/screen/home/video_page.dart';
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

class _HomeState extends State<Home>{


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
                children: [
                  AppBarWidget(),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    //Todo Search Yazanda Axtaris ucun getsin Popular filmiler icersionden axtarsin
                    child: AnimatedSearchBar(
                      label: "Search",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      searchDecoration: InputDecoration(
                        labelText: "Search Movie",
                        labelStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                      ),
                      searchStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (value) {
                        //Todo This page is not ready
                      },
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPage(),
                        ),
                      );
                    },
                    child: CustomCarouselDown(
                      imagePath: "assets/hot.png",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CustomCarouselDown(
                      imagePath: "assets/list.png",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: CustomCarouselDown(
                      imagePath: "assets/sort.png",
                    ),
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
