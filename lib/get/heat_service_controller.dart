import 'package:get/get.dart';
import 'package:tmdb_movie_app/model/movie/heat_model.dart';
import 'package:tmdb_movie_app/service/movie/heat_service.dart';

class HeatServiceController extends GetxController {
 
  var isLoading = true.obs;

  HeatService service = HeatService();

  var listModel = List<Result>.empty(growable: true).obs;

//Todo Initial Service for Start 
  Future<List<Result>> getHeatData(int pageNum) async {
 
    isLoading.value = true;
 
    var res = await service.heatMovieItems(pageNum);
 
    listModel = res.obs;
 
    isLoading.value = false;
 
    update();
 
  }

//Todo This Controller is  Next Page Data Service
  Future<List<Result>> nextHeatPage(int pNum) async {
 
    var res = await service.heatMovieItems(++pNum);
 
    listModel.addAll(res);
 
    pNum++;
 
    update();
 
  }

}
