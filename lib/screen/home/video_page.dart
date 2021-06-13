import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/model/movie/video_model.dart';
import 'package:tmdb_movie_app/service/movie/video_service.dart';
import 'package:tmdb_movie_app/widgets/video/custom_video.dart';

class VideoPage extends StatefulWidget {
  final int filmID;
  final String movieIMGUrl;
  VideoPage({Key key, @required this.filmID, @required this.movieIMGUrl}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideService videService = new VideService();
  Future<VideolModel> futureVideoModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureVideoModel = videService.videosReady(widget.filmID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<VideolModel>(
        future: futureVideoModel,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data == null) {
            return Center(
              child: Text(snapshot.data.toString()),
            );
          }
          return CustomVideowidget(
            videoUrl: "${snapshot.data.results[0].key}",
            // "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
            filmName: snapshot.data.results[0].name,
            moviIMGUrl: widget.movieIMGUrl,
          );
        },
      ),
    );
  }
}
