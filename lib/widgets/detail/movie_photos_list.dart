import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_movie_app/provider/movie/cSS_provider.dart';
import 'package:tmdb_movie_app/widgets/detail/photos.dart';

class MoviePhotosList extends StatefulWidget {
  final int filmID;

  const MoviePhotosList({Key key, this.filmID}) : super(key: key);

  @override
  _MoviePhotosListState createState() => _MoviePhotosListState();
}

class _MoviePhotosListState extends State<MoviePhotosList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var castItems = Provider.of<CastServiceProvider>(context, listen: false);
    castItems.getCasts(widget.filmID);
  }

  @override
  Widget build(BuildContext context) {
    var castItem = Provider.of<CastServiceProvider>(context);
    return castItem.loading
        ? Container(
            width: double.infinity,
            height: 100,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return MoviePhotoWidget(
                imgUrl: castItem.castModel.cast[index].profilePath,
              );
            },
          );
  }
}
