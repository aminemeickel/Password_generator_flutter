import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pw_gen/core/storage.dart';
import 'package:flutter_pw_gen/models/gPasswordmodel.dart';

import '../Utils/UtilClass.dart';

Widget textfield({
  TextEditingController? textContorler,
  required Color forAll,
}) =>
    TextField(
        onTap: () async {
          if (textContorler!.text.isNotEmpty) {
            Clipboard.setData(ClipboardData(text: textContorler.text));
            UtilClass.showToast(message: "Copied!!");
            var db = DBProvider.db;
            await db.addPassword(GPassword(
                password: textContorler.text, time: DateTime.now().toString()));
            textContorler.clear();
          } else {
            UtilClass.showToast(message: 'Empty Password');
          }
        },
        controller: textContorler,
        maxLines: 1,
        readOnly: true,
        autocorrect: false,
        decoration: InputDecoration(
          fillColor: Colors.green,
          hintText: "Your password goase her",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(60))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: forAll),
              borderRadius: BorderRadius.all(Radius.circular(60))),
          suffixIcon: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(50))),
            margin: EdgeInsets.fromLTRB(0, 3, 8, 3),
            padding: EdgeInsets.fromLTRB(9, 0, 1, 0),
            alignment: Alignment.center,
            width: 67,
            child: Row(
              children: [
                Icon(
                  Icons.copy,
                  color: Colors.white,
                  size: 14,
                ),
                Text(
                  " Copy",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )
              ],
            ),
          ),
        ));
