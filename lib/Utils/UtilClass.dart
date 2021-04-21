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

  static String passwordGenerator(List<bool> checkedOption, int numberofItem) {
    if (!checkedOption.contains(true)) {
      UtilClass.showToast(message: "Please Select an Option");
      return "";
    }
    var finalList = <String>[];

    if (checkedOption[0]) finalList.addAll(alphabetListLowerCase);
    if (checkedOption[1]) finalList.addAll(alphabetListUpperCase);
    if (checkedOption[2])
      finalList.addAll(List.generate(11, (index) => index.toString()));
    if (checkedOption[3]) finalList.addAll(symbols);
    finalList.shuffle();
    var word = "";
    for (int i = 0; i <= numberofItem; i++) {
      word += finalList[Random.secure().nextInt(finalList.length)];
    }
    return word;
  }

  static Widget getoLcalListTile(
          {required String inputText, bool? value, Function? fun}) =>
      CheckboxListTile(
          title: Text(
            'Include ' + inputText,
            style: TextStyle(color: Colors.black),
          ),
          value: value,
          onChanged: fun as void Function(bool?)?);
}
