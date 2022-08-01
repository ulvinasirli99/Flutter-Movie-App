import 'dart:async';

import 'package:flutter/cupertino.dart';

mixin SplashContoller {
  //Todo This mixin is next page for splash
  void timerDuartionNavigate(VoidCallback navFunction) {
    new Timer(Duration(seconds: 3), navFunction);
    print("Go to Next Page Started.......!");
  }
}
