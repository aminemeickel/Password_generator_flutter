import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'const.dart';

class UtilClass {
  static void showToast({required String message}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_LEFT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static String passwordGenerator(List<bool> checked, int numberofItem) {
    if (!checked.contains(true)) {
      UtilClass.showToast(message: "Please Select an Option");
      return "";
    }
    var finalList = <String>[];

    if (checked[0]) finalList.addAll(alphabetListLowerCase);
    if (checked[1]) finalList.addAll(alphabetListUpperCase);
    if (checked[2])
      finalList.addAll(List.generate(11, (index) => index.toString()));
    if (checked[3]) finalList.addAll(symbols);

    finalList.shuffle();
    var word = "";
    for (int i = 0; i <= numberofItem; i++) {
      word += finalList[Random().nextInt(finalList.length)];
    }
    return word;
  }
}
