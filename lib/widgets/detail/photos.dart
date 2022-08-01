import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/global/url/urls.dart';

class MoviePhotoWidget extends StatelessWidget {
  final String? imgUrl;

  const MoviePhotoWidget({Key? key, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: Container(
        width: 90,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              // ignore: unnecessary_null_comparison
              imgUrl == null
                  ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-45gYPtG2C5jtj3zGW-T5-GsTlCl4m4jhVAlP2iA0SrFfRZg1S1hm-Iv6E2XRvNPAVuo&usqp=CAU"
                  : "${Urls.imageUrl}$imgUrl",
            ),
          ),
        ),
      ),
    );
  }
}
