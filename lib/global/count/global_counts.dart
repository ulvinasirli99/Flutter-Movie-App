import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/model/movie/detail_model.dart';

double ratingCount(AsyncSnapshot<DetailModel> snapshot) {

  if (snapshot.data.voteAverage > 0 && snapshot.data.voteAverage <= 2) {
    
    return 1.0;

  }else if(snapshot.data.voteAverage > 2 && snapshot.data.voteAverage <= 4){

    return 2.0;

  }else if(snapshot.data.voteAverage > 4 && snapshot.data.voteAverage <= 6){

    return 3.0;
    
  }else if(snapshot.data.voteAverage > 6 && snapshot.data.voteAverage <= 8){

    return 4.0;
    
  }else if(snapshot.data.voteAverage > 8 && snapshot.data.voteAverage <= 10){

    return 5.0;
    
  }

}

String getTimeString(int value) {
 
  final int hour = value ~/ 60;
 
  final int minutes = value % 60;
 
  return '${hour.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}';

}
