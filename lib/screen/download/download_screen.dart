import 'dart:io';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tmdb_movie_app/global/url/urls.dart';
import 'package:tmdb_movie_app/widgets/download/custom_progress.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadScreen extends StatefulWidget {
  final String movieImageUrl;
  final String movieUrl;
  final String moviName;

  DownloadScreen({
    Key key,
    @required this.movieUrl,
    @required this.moviName,
    @required this.movieImageUrl,
  }) : super(key: key);

  @override
  _DownloadScreenState createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  double progress = 0;
  Permission permission;
  String movieFullUrl = "";
  String filmImage = "";

  @override
  void initState() {
    super.initState();
    filmImage = widget.movieImageUrl == "null"
        ? "https://brocku.ca/social-sciences/cpcf/wp-content/uploads/sites/150/Films-Hero-1260x600.jpg"
        : "${Urls.imageUrl}${widget.movieImageUrl}";
    movieFullUrl = "${Urls.yotubeVideoUrl}${widget.movieUrl}";
    print("Full video Url : $movieFullUrl");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(filmImage),
              ),
            ),
            width: double.infinity,
            height: 200,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    "Download Trailer Video",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, right: 8),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () async {
                        PermissionStatus status =
                            await Permission.storage.request();
                        if (status.isGranted) {
                       
                        } else {
                          await Permission.storage.request();
                        }
                      },
                      child: Icon(
                        Icons.download_rounded,
                        size: 50,
                        color: Colors.purple.shade300.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 30),
                child: Text(
                  "Download Status",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600.withOpacity(0.5),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 30, top: 30),
                child: CustomProgress(
                  perogress: progress,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
