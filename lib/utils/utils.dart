import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  static TextStyle ts1(BuildContext context) {
    return const TextStyle(
      fontSize: 20,
    );
  }
  //
  // static TextStyle ts2(BuildContext context) {
  //   return const TextStyle(
  //     fontSize: 20,
  //   );
  // }
}