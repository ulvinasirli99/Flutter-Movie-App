import 'dart:async';
import 'dart:math';

import 'package:rounded_loading_button/rounded_loading_button.dart';

RoundedLoadingButtonController btnController = RoundedLoadingButtonController();


void paidMovie() async {
  Timer(Duration(seconds: 2), () {
    btnController.success();
  });
}

 double moviePaidRandomGenerator(int valueSum) {
 
  int sum = valueSum;
  
  if (sum == 0) {
  
    return 32.52;
  
  } 
   else if (sum >0 && sum < 20) {
  
    return 12.30;
  
  }
  else if (sum > 30 && sum < 40) {
  
    return 18.30;
  
  } else if (sum > 40 && sum < 50) {
  
  } else if (sum > 20 && sum < 30) {
  
    return 21.12;
  
  } else if (sum > 50 && sum < 60) {
  
    return 15.34;
  
  } else if (sum > 90 && sum < 100) {
  
    return 25.90;
  
  } else if (sum > 120 && sum < 130) {
  
    return 59.61;
  
  } else if (sum > 150 && sum < 170) {
  
    return 48.82;
  
  } else if (sum > 170 && sum < 180) {
    return 31.13;
  
  } else if (sum > 180 && sum < 190) {
  
    return 71.33;
  
  } else if (sum > 190 && sum < 200) {
  
    return 50.25;
  
  } else if (sum > 200 && sum < 220) {
  
    return 18.53;
  
  }

}