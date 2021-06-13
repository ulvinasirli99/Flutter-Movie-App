import 'dart:async';

mixin SplashContoller {
  //Todo This mixin is next page for splash
  void timerDuartionNavigate(Function navFunction) {
    new Timer(Duration(seconds: 4), navFunction);
    print("Go to Next Page Started.......!");
  }
}
