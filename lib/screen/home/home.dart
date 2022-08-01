import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_movie_app/dialog/alert/hot_disclamer.dart';
import 'package:tmdb_movie_app/global/message/custom_toast.dart';
import 'package:tmdb_movie_app/screen/heat/heat_page.dart';
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
  late SharedPreferences preferences;
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
                  GestureDetector(
                    onTap: () async {
                      preferences = await SharedPreferences.getInstance();
                      if (preferences.getBool("isVlaidDisclamer") == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HeatPage(),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return Age18Disclamer();
                          },
                        );
                      }
                    },
                    child: CustomCarouselDown(
                      imagePath: "assets/hot.png",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      CustomToast().customToast("Comming Soon", context);
                    },
                    child: CustomCarouselDown(
                      imagePath: "assets/list.png",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      CustomToast().customToast("Comming Soon", context);
                    },
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
