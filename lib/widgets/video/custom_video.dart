import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';

class CustomVideowidget extends StatefulWidget {
  final String videoUrl;
  final String filmName;

  const CustomVideowidget({
    Key key,
    @required this.videoUrl,
    @required this.filmName,
  }) : super(key: key);

  @override
  _CustomVideowidgetState createState() => _CustomVideowidgetState();
}

class _CustomVideowidgetState extends State<CustomVideowidget> {
  BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    super.initState();
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network, widget.videoUrl);
    _betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(
        errorBuilder: (context, erMessage) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        controlsConfiguration: BetterPlayerControlsConfiguration(
          controlBarColor: Colors.green.withOpacity(0.6),
          unMuteIcon: Icons.volume_off,
          loadingColor: Colors.blue,
        ),
      ),
      betterPlayerDataSource: betterPlayerDataSource,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _betterPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size bSIze = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: bSIze.height * 0.38,
        
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 15),
            width: double.infinity,
            height: bSIze.height * 0.3,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayer(
                controller: _betterPlayerController,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.filmName,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
          )
        ],
      ),
    );
  }
}
