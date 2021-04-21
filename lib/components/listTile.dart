import 'package:flutter/material.dart';

Widget optionListTile(
        {required String inputText, bool? value, Function? fun}) =>
    CheckboxListTile(
        title: Text(
          'Include ' + inputText,
          style: TextStyle(color: Colors.black),
        ),
        value: value,
        onChanged: fun as void Function(bool?)?);
