import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin DbException {
  void dbExcMessage(String dbMsg, BuildContext context) {
    Fluttertoast.showToast(
      msg: dbMsg,
      toastLength: Toast.LENGTH_LONG,
      textColor: Colors.teal,
      backgroundColor: Colors.black,
    );
  }
}
