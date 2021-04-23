import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pw_gen/Utils/UtilClass.dart';
import 'package:flutter_pw_gen/core/storage.dart';
import 'package:flutter_pw_gen/models/gPasswordmodel.dart';

class History extends StatefulWidget {
  History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  DBProvider _dbProvider = DBProvider.db;
  var _passwordList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('History'), centerTitle: true, actions: [
          TextButton(
            onPressed: () async {
              var result = await dialog();
              if (result) {
                _dbProvider.clearpasswords();
                setState(() {
                  _passwordList = [];
                });
              }
            },
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          )
        ]),
        body: FutureBuilder(
          future: _dbProvider.getAll(),
          builder: (context, snapShot) {
            if (!snapShot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            _passwordList = (snapShot.data as List);
            return ListView.builder(
              itemCount: _passwordList.length,
              itemBuilder: (context, pos) {
                var item = _passwordList[pos];
                var gPassword = GPassword(
                  password: item['password'],
                  id: item['id'],
                  time: item['time'],
                );
                return Dismissible(
                  key: Key(gPassword.password),
                  onDismissed: (direction) =>
                      _dbProvider.removepassword(gPassword.id),
                  background: dismissBackground(Alignment.centerLeft),
                  secondaryBackground: dismissBackground(Alignment.centerRight),
                  child: ListTile(
                    onTap: () {
                      Clipboard.setData(
                          ClipboardData(text: gPassword.password));
                      UtilClass.showToast(message: 'Copied!!');
                    },
                    title: Text(
                      '${gPassword.password}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${gPassword.dateFormatter}'),
                    trailing: Icon(Icons.copy),
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

  dismissBackground(Alignment alignment) => Container(
        color: Colors.red,
        child: Align(
          alignment: alignment,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 35,
            ),
          ),
        ),
      );

  dialog() => showDialog(
        context: context,
        builder: (builder) => AlertDialog(
          title: Text('Clear All Password'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [Text('Do you Want to clear All passwords ?')],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text('Clear')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text('Cancel'))
          ],
        ),
      );
}
