import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppConnectivityCheck extends ChangeNotifier {
   // ignore: close_sinks
   StreamController<ConnectivityWrapper> connectWrapper = StreamController<ConnectivityWrapper>.broadcast();

  Stream<ConnectivityWrapper> get getConnectWrapper => connectWrapper.stream;

  connectionWrapperReceive() async {

    connectWrapper.stream.listen((event) async* {
      if (await event.isConnected) {
        Fluttertoast.showToast(msg: "Your device is not connected...");
      }else{
        Fluttertoast.showToast(msg: "Your device connection is good...");
      }
    });
  }
}
