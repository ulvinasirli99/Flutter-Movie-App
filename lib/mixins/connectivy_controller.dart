import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:tmdb_movie_app/global/message/custom_toast.dart';

mixin ConnectivyMixin {
  
  CustomToast toast = new CustomToast();
  
  ConnectivityWrapper connectivityWrapper = ConnectivityWrapper.instance;

  void connectionCheckResult(BuildContext context) async {
  
    if (await connectivityWrapper.isConnected) {
  
      toast.customToast("The network is active...", context);
  
    } else {
  
      toast.customToast("The network is inactive...", context);
  
    }
  
  }

}
