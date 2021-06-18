import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {}

class FetchSearchMovie extends SearchEvent {
  
  final int pageNum;
  
  final String movieName;
  
  FetchSearchMovie(this.pageNum, this.movieName);
  
  @override
  // TODO: implement props
  List<Object> get props => [pageNum,movieName];
}
