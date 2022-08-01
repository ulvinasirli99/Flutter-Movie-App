import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_movie_app/database/movie_db.dart';
import 'package:tmdb_movie_app/global/count/global_counts.dart';
import 'package:tmdb_movie_app/global/url/urls.dart';
import 'package:tmdb_movie_app/model/db/favorite_model.dart';
import 'package:tmdb_movie_app/model/movie/detail_model.dart';
import 'package:tmdb_movie_app/model/movie/review_model.dart';
import 'package:tmdb_movie_app/provider/movie/rS_providerr.dart';
import 'package:tmdb_movie_app/provider/storage/check_stoarge.dart';
import 'package:tmdb_movie_app/screen/home/video_page.dart';
import 'package:tmdb_movie_app/service/movie/detail_service.dart';
import 'package:tmdb_movie_app/utils/file_share.dart';
import 'package:tmdb_movie_app/widgets/detail/film_buy.dart';
import 'package:tmdb_movie_app/widgets/detail/film_img.dart';
import 'package:tmdb_movie_app/widgets/detail/movie_cast_list.dart';
import 'package:tmdb_movie_app/widgets/detail/movie_photos_list.dart';
import 'package:tmdb_movie_app/widgets/detail/txt_i.dart';
import 'package:tmdb_movie_app/widgets/detail/writes_widget_list.dart';

class DetailPage extends StatefulWidget {
  final int? filmUID;

  const DetailPage({Key? key, this.filmUID}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int currentINdex = 0;
  FileShare share = new FileShare();
  late Future<DetailModel?> detailFuture;
  late Future<ReviewModel?> getReviews;
  late FilmDetailService? detailService = new FilmDetailService();

  @override
  void initState() {
    super.initState();
    //Todo Detail service statrted......
    detailFuture = detailService!.getFilmDetail(widget.filmUID!);
    //Todo Review Provider Management
    var reviewCount = Provider.of<RServiceProvider>(context, listen: false);
    reviewCount.getReviewCount(widget.filmUID!);
    //Todo Check MovieItem in Srorage.......
    var chekMovieItem =
        Provider.of<CheckStorageMovieItem>(context, listen: false);
    chekMovieItem.checkMovieDbItem(widget.filmUID!);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var reviewCount = Provider.of<RServiceProvider>(context);
    var listMovieItem = Provider.of<CheckStorageMovieItem>(context);
    return Scaffold(
      body: FutureBuilder<DetailModel?>(
        future: detailFuture,
        builder: (context, AsyncSnapshot<DetailModel?> snapshot) {
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
                      snapshot.data!.backdropPath == null
                          ? Urls.ifFilmImageNull
                          : "${Urls.imageUrl}${snapshot.data!.backdropPath}",
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
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 35,
                          right: 55,
                        ),
                        //Todo This is Favorite Button {Database Instert button}.........
                        child: GestureDetector(
                          onTap: () async {
                            if (listMovieItem.isFavorited == false) {
                              var result = await DatabaseProvider().insert(
                                FavoriteModel(
                                  movieID: int.tryParse(
                                    snapshot.data!.id.toString(),
                                  ),
                                  movieName: snapshot.data!.title,
                                  movieImage: snapshot.data!.backdropPath,
                                  movieType: snapshot.data!.tagline,
                                ),
                              );
                              setState(() {
                                listMovieItem.isFavorited = true;
                              });
                              if (result > 0) {
                                Fluttertoast.showToast(
                                  msg: "Add to Favorite",
                                  toastLength: Toast.LENGTH_LONG,
                                  textColor: Colors.teal,
                                  backgroundColor: Colors.black,
                                );
                              } else {
                                Fluttertoast.showToast(
                                  msg: "Error",
                                  toastLength: Toast.LENGTH_LONG,
                                  textColor: Colors.teal,
                                  backgroundColor: Colors.black,
                                );
                              }
                            } else {
                              var result = await DatabaseProvider()
                                  .delete(snapshot.data!.id!);
                              setState(() {
                                listMovieItem.isFavorited = false;
                              });
                              if (result > 0) {
                                Fluttertoast.showToast(
                                  msg: "Delete from Favorite",
                                  toastLength: Toast.LENGTH_LONG,
                                  textColor: Colors.teal,
                                  backgroundColor: Colors.black,
                                );
                              } else {
                                Fluttertoast.showToast(
                                  msg: "Error delete item...",
                                  toastLength: Toast.LENGTH_LONG,
                                  textColor: Colors.teal,
                                  backgroundColor: Colors.black,
                                );
                              }
                            }
                          },
                          child: Icon(
                            Icons.favorite,
                            color: listMovieItem.isFavorited == false
                                ? Colors.white
                                : Colors.redAccent,
                            size: 35,
                          ),
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
                          onPressed: () {
                            share.shareFilmUrl(snapshot.data!.title!);
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: size.width / 5,
                          right: size.width * 0.01,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoPage(
                                  filmID: snapshot.data!.id!,
                                  movieIMGUrl: snapshot.data!.posterPath == null
                                      ? "https://brocku.ca/social-sciences/cpcf/wp-content/uploads/sites/150/Films-Hero-1260x600.jpg"
                                      : snapshot.data!.posterPath!,
                                ),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.play_arrow_outlined,
                            size: 120,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        height: size.height * 0.18,
                        color: Theme.of(context).scaffoldBackgroundColor,
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
                                        snapshot.data!.originalTitle!,
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
                                          initialRating:
                                              ratingCount(snapshot)!.toDouble(),
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemSize: 14.0,
                                          itemBuilder: (contxet, index) => Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          onRatingUpdate: (rating) {
                                            rating = ratingCount(snapshot)!
                                                .toDouble();
                                          },
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          snapshot.data!.voteAverage.toString(),
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
                                  "${snapshot.data!.genres![0].name}",
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
                                        snapshot.data!.popularity.toString()),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    TxtI(
                                      Icons.mail,
                                      reviewCount.loading
                                          ? "0"
                                          : "${reviewCount.reviewModel!.results!.length.toString()}",
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    TxtI(
                                      Icons.lock_clock,
                                      getTimeString(snapshot.data!.runtime!) +
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
                          snapshot.data!.backdropPath == null
                              ? "${Urls.ifFilmImageNull}"
                              : "${Urls.imageUrl}${snapshot.data!.backdropPath}",
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
                        snapshot.data!.overview == ""
                            ? "There is no description of this film."
                            : '''${snapshot.data!.overview}''',
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
                        filmID: snapshot.data!.id,
                      )
                    : currentINdex == 1
                        ? MoviePhotosList(
                            filmID: snapshot.data!.id,
                          )
                        : WritesWidgetList(
                            id: snapshot.data!.id,
                          ),
              ),
              Spacer(),
              BuyFilmWidget(),
            ],
          );
        },
      ),
    );
  }
}
