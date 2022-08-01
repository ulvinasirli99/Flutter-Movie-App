import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FilmRoundImage extends StatelessWidget {
  final String?orginalTitle;
  final String?releaseDateTime;
  final int? voteAverage;
  final String? voteCount;
  final String? populuartyValue;
  final String? movieUrl;

  FilmRoundImage({
    Key? key,
    @required this.orginalTitle,
    @required this.releaseDateTime,
    this.voteAverage,
    @required this.voteCount,
    @required this.populuartyValue,
    @required this.movieUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 5, left: 8),
          width: 120,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(movieUrl!),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 10, left: 8),
            width: double.infinity,
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 7,
                  ),
                  child: Text(
                    orginalTitle!,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7, top: 7),
                  child: Text(
                    "Relase Date : $releaseDateTime",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 7, top: 7),
                      child: Text(
                        "Vote Average",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7, top: 7),
                      child: RatingBar.builder(
                        minRating: 1.0,
                        itemCount: 5,
                        initialRating: 3.3,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemSize: 16.0,
                        itemBuilder: (contxet, index) => Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        onRatingUpdate: (rating) {
                          rating = 3.0;
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7, top: 7),
                  child: Text(
                    "Vote Count : $voteCount",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7, top: 7),
                  child: Text(
                    "Popularity : $populuartyValue",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
