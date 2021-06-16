import 'package:toast/toast.dart';
import 'package:flutter/material.dart';

class CustomToast {
 
  void customToast(String msg, BuildContext context) {
 
    Toast.show(
 
      msg,
 
      context,
 
      duration: 4,
 
      textColor: Colors.white,
 
      backgroundColor: Colors.black.withOpacity(0.7),
 
      backgroundRadius: 8,
  
    );
 
  }
}

