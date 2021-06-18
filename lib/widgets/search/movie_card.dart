import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String movieName;
  final String movieBackrdopPath;

  MovieCard({
    Key key,
    @required this.movieName,
    @required this.movieBackrdopPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: 8, top: 8, right: 8, left: 8),
      child: Container(
        width: size.width,
        height: size.width / 1.5,
        padding: EdgeInsets.only(bottom: 8, top: 8, right: 8, left: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: Image.network(
                  movieBackrdopPath,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              movieName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.blue.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
