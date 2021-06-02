import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_movie_app/provider/cSS_provider.dart';
import 'package:tmdb_movie_app/widgets/detail/cast_widget.dart';

class MovieCastsWidget extends StatefulWidget {
  final int filmID;

  MovieCastsWidget({Key key, this.filmID}) : super(key: key);
  @override
  _MovieCastsWidgetState createState() => _MovieCastsWidgetState();
}

class _MovieCastsWidgetState extends State<MovieCastsWidget> {
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
            itemCount: castItem.castModel.cast.length,
            itemBuilder: (context, index) {
              return CastWidget(
                castImgUrl: castItem.castModel.cast[index].profilePath,
                castName: castItem.castModel.cast[index].name,
              );
            },
          );
  }
}
