import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_movie_app/global/url/urls.dart';
import 'package:tmdb_movie_app/provider/cS_provider.dart';
import 'package:tmdb_movie_app/screen/detail/detail.dart';

class CommingListFilmWidget extends StatefulWidget {
  @override
  _CommingListFilmWidgetState createState() => _CommingListFilmWidgetState();
}

class _CommingListFilmWidgetState extends State<CommingListFilmWidget> {
  int initialPageNumber = 1;

  ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var commingInitialData =
        Provider.of<CServiceProvider>(context, listen: false);
    commingInitialData.cMovieDataProvider(initialPageNumber);

// Todo Initial NextPage Data {This is Comming Films}...............
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        setState(() {
          commingInitialData.nextCMovieData(initialPageNumber);
          initialPageNumber++;
          print("My Page : " + initialPageNumber.toString());
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var listMovieItem = Provider.of<CServiceProvider>(context);
    return Container(
      width: double.infinity,
      height: 200,
      child: listMovieItem.loadingData
          ? Container(
              width: double.infinity,
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listMovieItem.cResultList.length + 1,
              controller: scrollController,
              itemBuilder: (context, index) {
                if (index == listMovieItem.cResultList.length) {
                  return Center(
                    child: SizedBox(
                      child: Center(child: CircularProgressIndicator()),
                      width: 90,
                      height: 50,
                    ),
                  );
                }
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          filmUID: listMovieItem.cResultList[index].id,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            width: 110,
                            height: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: FadeInImage.assetNetwork(
                                image:
                                    "${Urls.imageUrl}${listMovieItem.cResultList[index].posterPath}",
                                placeholder: "assets/loading.gif",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            width: 110,
                            child: Text(
                              listMovieItem.cResultList[index].title,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              softWrap: false,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
