import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_movie_app/global/count/global_counts.dart';
import 'package:tmdb_movie_app/global/url/urls.dart';
import 'package:tmdb_movie_app/model/movie/detail_model.dart';
import 'package:tmdb_movie_app/model/movie/review_model.dart';
import 'package:tmdb_movie_app/provider/rS_providerr.dart';
import 'package:tmdb_movie_app/service/movie/detail_service.dart';
import 'package:tmdb_movie_app/service/movie/review_service.dart';
import 'package:tmdb_movie_app/widgets/detail/film_buy.dart';
import 'package:tmdb_movie_app/widgets/detail/film_img.dart';
import 'package:tmdb_movie_app/widgets/detail/movie_cast_list.dart';
import 'package:tmdb_movie_app/widgets/detail/movie_photos_list.dart';
import 'package:tmdb_movie_app/widgets/detail/txt_i.dart';
import 'package:tmdb_movie_app/widgets/detail/writes_widget_list.dart';

class DetailPage extends StatefulWidget {
  final int filmUID;

  const DetailPage({Key key, this.filmUID}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int currentINdex = 0;
  Future<DetailModel> detailFuture;
  Future<ReviewModel> getReviews;
  FilmDetailService detailService = new FilmDetailService();

  ///Todo Diqqet filmin ayritilarinda
  ///Todo Bacdrop image null ola biler ve bunun ucun gelen datani yoxla gonder

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    detailFuture = detailService.getFilmDetail(widget.filmUID);
    var reviewCount = Provider.of<RServiceProvider>(context, listen: false);
    reviewCount.getReviewCount(widget.filmUID);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var reviewCount = Provider.of<RServiceProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<DetailModel>(
          future: detailFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.data == null) {
              return Center(
                child: Text("Error : Please try again : ${snapshot.error}"),
              );
            }
            return Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: size.height * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        snapshot.data.backdropPath == null
                            ? Urls.ifFilmImageNull
                            : "${Urls.imageUrl}${snapshot.data.backdropPath}",
                      ),
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 15,
                        top: 25,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 35,
                            right: 55,
                          ),
                          child: FavoriteButton(
                            iconSize: 45,
                            iconDisabledColor: Colors.white,
                            valueChanged: (value) {
                              print(value);
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(top: 27, right: 2),
                          child: IconButton(
                            icon: Icon(
                              Icons.share,
                              size: 30,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: size.width / 5,
                            right: size.width / 6,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.play_arrow,
                              color: Colors.white.withOpacity(0.7),
                              size: 100,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          height: size.height * 0.18,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 90),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 5,
                                        left: 16,
                                      ),
                                      child: Container(
                                        width: 140,
                                        child: Text(
                                          snapshot.data.originalTitle,
                                          overflow: TextOverflow.fade,
                                          maxLines: 1,
                                          softWrap: false,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 5,
                                        right: 7,
                                      ),
                                      child: Row(
                                        children: [
                                          RatingBar.builder(
                                            minRating: 1.0,
                                            itemCount: 5,
                                            initialRating: ratingCount(snapshot)
                                                .toDouble(),
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemSize: 14.0,
                                            itemBuilder: (contxet, index) =>
                                                Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            onRatingUpdate: (rating) {
                                              rating = ratingCount(snapshot)
                                                  .toDouble();
                                            },
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            snapshot.data.voteAverage
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.pinkAccent.shade400,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    left: 15,
                                  ),
                                  child: Text(
                                    "${snapshot.data.genres[0].name}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 10,
                                    top: 10,
                                    left: 15,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TxtI(Icons.remove_red_eye,
                                          snapshot.data.popularity.toString()),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      TxtI(
                                        Icons.mail,
                                        reviewCount.loading
                                            ? "0"
                                            : "${reviewCount.reviewModel.results.length.toString()}",
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      TxtI(
                                        Icons.lock_clock,
                                        getTimeString(snapshot.data.runtime) +
                                            " min",
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 120, left: 10),
                          child: FilmImageWidget(
                            snapshot.data.backdropPath == null
                                ? "${Urls.ifFilmImageNull}"
                                : "${Urls.imageUrl}${snapshot.data.backdropPath}",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  width: double.infinity,
                  height: 100,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "STORYLINE",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          snapshot.data.overview == ""
                              ? "There is no description of this film."
                              : '''${snapshot.data.overview}''',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  child: Flexible(
                    child: DefaultTabController(
                      initialIndex: 0,
                      length: 3,
                      child: TabBar(
                        onTap: (index) {
                          setState(() {
                            currentINdex = index;
                          });
                        },
                        indicatorSize: TabBarIndicatorSize.values[1],
                        indicatorColor: Colors.red,
                        labelColor: Colors.red,
                        unselectedLabelColor: Colors.black,
                        labelStyle: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Colors.red[400],
                        ),
                        tabs: [
                          Tab(
                            text: "CAST",
                          ),
                          Tab(
                            text: "PHOTOS",
                          ),
                          Tab(text: "WRITES"),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 135,
                  child: currentINdex == 0
                      ? MovieCastsWidget(
                          filmID: snapshot.data.id,
                        )
                      : currentINdex == 1
                          ? MoviePhotosList(
                            filmID: snapshot.data.id,
                          )
                          : WritesWidgetList(
                              id: snapshot.data.id,
                            ),
                ),
                Spacer(),
                BuyFilmWidget(),
              ],
            );
          }),
    );
  }
}
