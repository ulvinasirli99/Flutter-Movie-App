import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

mixin DbException {
  void dbExcMessage(String dbMsg, BuildContext context) {
    Toast.show(
      dbMsg,
      context,
      duration: 2,
      textColor: Colors.teal,
      backgroundColor: Colors.black,
      backgroundRadius: 8,
    );
  }
}
