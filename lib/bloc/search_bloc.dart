import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_movie_app/repository/repo.dart';
import 'package:tmdb_movie_app/bloc/search_event.dart';
import 'package:tmdb_movie_app/bloc/search_state.dart';
import 'package:tmdb_movie_app/model/movie/search_model.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ApiRepository repository;
  SearchModel searchModel;

  SearchBloc({@required this.repository}) : super(SearchEmpty());
  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is FetchSearchMovie) {
      try {
        yield SearchLoading();
        searchModel = await repository.getAllMovieSearch();
        yield SearchLoaded(searchModel);
      } catch (e) {
        yield SearchError(errMsg: e.toString());
      }
    }
  }
}
