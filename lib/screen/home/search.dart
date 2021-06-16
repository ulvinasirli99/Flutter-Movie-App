import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movie_app/bloc/search_bloc.dart';
import 'package:tmdb_movie_app/bloc/search_event.dart';
import 'package:tmdb_movie_app/bloc/search_state.dart';
import 'package:tmdb_movie_app/model/movie/search_model.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SearchBloc>()..add(FetchSearchMovie());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [],
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

*/
