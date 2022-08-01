import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/screen/download/download_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomVideowidget extends StatefulWidget {
  final String videoUrl;
  final String filmName;
  final String moviIMGUrl;

  const CustomVideowidget({
    Key? key,
    required this.videoUrl,
    required this.filmName,
    required this.moviIMGUrl,
  }) : super(key: key);

  @override
  _CustomVideowidgetState createState() => _CustomVideowidgetState();
}

class _CustomVideowidgetState extends State<CustomVideowidget> {
  late YoutubePlayerController youtubePlayerController;

  void playTubePlayer() {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: widget.videoUrl,
      flags: YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: false,
      ),
    );
  }

  @override
  void initState() {
    playTubePlayer();
    super.initState();
  }

  @override
  void deactivate() {
    youtubePlayerController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: youtubePlayerController,
      ),
      builder: (context, player) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30, top: 50),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DownloadScreen(
                          movieUrl: widget.videoUrl,
                          moviName: widget.filmName,
                          movieImageUrl: widget.moviIMGUrl,
                        ),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.download,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Todo Player
                  player,
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    widget.filmName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.redAccent.withOpacity(
                        0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
