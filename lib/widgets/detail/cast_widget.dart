import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/global/url/urls.dart';

class CastWidget extends StatelessWidget {
  final String?castImgUrl;
  final String?castName;

  const CastWidget({Key? key, this.castImgUrl, this.castName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 100,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 5,
                top: 7,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    castImgUrl == null
                        ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-45gYPtG2C5jtj3zGW-T5-GsTlCl4m4jhVAlP2iA0SrFfRZg1S1hm-Iv6E2XRvNPAVuo&usqp=CAU"
                        : "${Urls.imageUrl}${castImgUrl}",
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            castName!.substring(0, 5),
            style: TextStyle(
              fontSize: 17,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
