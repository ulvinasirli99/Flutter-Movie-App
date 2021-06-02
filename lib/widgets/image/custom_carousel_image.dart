import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/data/local_image.dart';

class CustomCarouselImage extends StatefulWidget {
  @override
  _CustomCarouselImageState createState() => _CustomCarouselImageState();
}

class _CustomCarouselImageState extends State<CustomCarouselImage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          child: CarouselSlider(
            options: CarouselOptions(
              //Todo Bu carouselin dot indicatoru qaldi
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlay: true,
                aspectRatio: 2.0,
                autoPlayCurve: Curves.fastOutSlowIn,
                onPageChanged: (index, reason) {
                  setState(() {
                    pageIndex = index;
                  });
                }),
            items: imageSliders,
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Flexible(
        //       child: Container(
        //         child: CarouselIndicator(
        //           color: Colors.grey,
        //           activeColor: Colors.redAccent,
        //           count: imageSliders.length,
        //           index: pageIndex,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
