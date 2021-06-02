import 'package:flutter/cupertino.dart';
import 'package:tmdb_movie_app/model/movie/review_model.dart';
import 'package:tmdb_movie_app/service/movie/review_service.dart';

class RServiceProvider extends ChangeNotifier {
 
  bool loading = false;
 
  ReviewModel reviewModel;
 
  var service = new ReviewService();

  Future<ReviewModel> getReviewCount(int filmID) async {
   
    loading = true;
   
    reviewModel = await service.getReviewsContent(filmID);
   
    loading = false;
   
    notifyListeners();
  
  }

}
