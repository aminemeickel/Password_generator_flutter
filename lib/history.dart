import 'package:flutter/material.dart';
import 'package:flutter_pw_gen/Utils/UtilClass.dart';
import 'package:flutter_pw_gen/core/storage.dart';
import 'package:flutter_pw_gen/models/gPasswordmodel.dart';
import 'package:sqflite/sqflite.dart';

class History extends StatefulWidget {
  History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  DBProvider _dbProvider = DBProvider.db;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: _dbProvider.getAll(),
          builder: (context, snapShot) {
            if (!snapShot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: (snapShot.data as List).length,
              itemBuilder: (context, pos) {
                var item = (snapShot.data as List)[pos];
                var gPassword = GPassword(
                  password: item['password'],
                  id: item['id'],
                  time: item['time'],
                );
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text("Password : ${gPassword.password}"),
                    subtitle: Text('${gPassword.time}'),
                  ),
                );
              },
            );
          },
        ));
  }

  buttonBuilder(
          {required VoidCallback onPressed,
          required String text,
          IconData icon = Icons.report_problem}) =>
      Padding(
        padding: EdgeInsets.only(top: 32),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          height: 60,
          width: 300,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shadowColor: MaterialStateProperty.all(Colors.transparent)),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                Icon(
                  icon,
                  color:
                      icon == Icons.report_problem ? Colors.red : Colors.green,
                  // Icons.report_problem
                )
              ],
            ),
          ),
        ),
      );
}

extension on String {
  toTitle() {
    return this[0].toUpperCase() + this.substring(1);
  }
}
