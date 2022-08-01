import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movie_app/bloc/search_bloc.dart';
import 'package:tmdb_movie_app/bloc/search_event.dart';
import 'package:tmdb_movie_app/bloc/search_state.dart';
import 'package:tmdb_movie_app/controller/text_controller.dart';
import 'package:tmdb_movie_app/global/url/urls.dart';
import 'package:tmdb_movie_app/model/movie/search_model.dart';
import 'package:tmdb_movie_app/screen/detail/detail.dart';
import 'package:tmdb_movie_app/widgets/search/movie_card.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int pageNum = 1;
  String movieName = "";
  GlobalKey<FormState> searcFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (movieName.contains("")) {
      context.read<SearchBloc>()..add(FetchSearchMovie(pageNum, "elma"));
    } else {
      context.read<SearchBloc>()..add(FetchSearchMovie(pageNum, movieName));
    }
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    return Scaffold(
      body: Form(
        key: searcFormKey,
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (BuildContext context, SearchState state) {
            if (state is SearchError) {
              return Center(
                child: Text(state.errMsg!),
              );
            }
            if (state is SearchLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SearchLoaded) {
              SearchModel model = state.model;
              return Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 25,
                        left: 5,
                        right: 12,
                      ),
                      width: double.infinity,
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              child: TextFormField(
                                controller: searchTextController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search Movie",
                                ),
                                onChanged: (value) {
                                  movieName = value;
                                },
                                onSaved: (value) {
                                  movieName = value!;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: InkWell(
                              onTap: () {
                                if (searcFormKey.currentState!.validate()) {
                                  setState(() {
                                    context.read<SearchBloc>()
                                      ..add(
                                          FetchSearchMovie(pageNum, movieName));
                                  });
                                  print(movieName);
                                  currentFocus.focusedChild!.unfocus();
                                  searchTextController.clear();
                                }
                              },
                              child: Icon(
                                Icons.search,
                                size: 35,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: model.results!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    filmUID: model.results![index].id!,
                                  ),
                                ),
                              );
                            },
                            child: MovieCard(
                              movieBackrdopPath: model
                                          .results![index].backdropPath ==
                                      null
                                  ? Urls.ifFilmImageNull
                                  : "${Urls.imageUrl}${model.results![index].backdropPath}",
                              movieName: model.results![index].title!,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: Text('Service Not found'),
            );
          },
        ),
      ),
    );
  }
}
/*

BlocBuilder<SearchBloc, SearchState>(
        builder: (BuildContext context, SearchState state) {
          if (state is SearchError) {
            return Center(
              child: Text(state.errMsg),
            );
          }
          if (state is SearchLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SearchLoaded) {
            SearchModel model = state.model;
            return Center(
              child: Text(model.results.length.toString()),
            );
          }
          return Center(
            child: Text('Service Not found'),
          );
        },
      ),



      Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 25, left: 12),
              width: double.infinity,
              height: 120,
              child: AnimatedSearchBar(
                animationDuration: 300,
                label: "Search Movie",
                labelStyle: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
                onChanged: (value) {
                  setState(() {
                    print(value);
                  });
                },
                searchDecoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return MovieCard();
                },
              ),
            ),
          ],
        ),
      ),


*/
