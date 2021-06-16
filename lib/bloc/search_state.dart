import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:tmdb_movie_app/model/movie/search_model.dart';

abstract class SearchState extends Equatable {}

class SearchEmpty extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoaded extends SearchState {
  final SearchModel model;
  SearchLoaded(this.model);
  @override
  List<Object> get props => [model];
}

class SearchError extends SearchState {
  final String errMsg;
  SearchError({@required this.errMsg});
  @override
  List<Object> get props => [errMsg];
}
