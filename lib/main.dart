import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pw_gen/componet/textField.dart';

import 'componet/generateButton.dart';

void main() {
  runApp(MyApp());
}

class WidgetMaker {
  static Widget getoLcalListTile(
          {required String inputText, bool? value, Function? fun}) =>
      CheckboxListTile(
          title: Text(
            inputText,
            style: TextStyle(color: Colors.black),
          ),
          value: value,
          onChanged: fun as void Function(bool?)?);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'password Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.comfortable,
      ),
      home: MyHomePage(title: 'Flutter Password Generator '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String? title;
  MyHomePage({Key? key, this.title}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static double _val = 4;
  var _textContorler = TextEditingController();
  var _checked = <bool>[false, false, false, false];
  var forAll = Colors.blue;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(widget.title!),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(10),
            shadowColor: Colors.grey[300],
            color: Colors.white,
            child: Container(
              constraints: BoxConstraints.tightFor(height: 480, width: 340),
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  ),
                  textfield(
                    textContorler: _textContorler,
                    forAll: forAll,
                  ),
                  Slider(
                    value: _val,
                    onChanged: (x) => setState(() => _val = x),
                    max: 20,
                    min: 4,
                    divisions: 16,
                    label: _val.round().toString(),
                  ),
                  WidgetMaker.getoLcalListTile(
                      inputText: "Include Lowercase Letters",
                      value: _checked[0],
                      fun: (val) => setState(() => _checked[0] = val)),
                  WidgetMaker.getoLcalListTile(
                    inputText: "Include Uppercase Letters",
                    value: _checked[1],
                    fun: (val) => setState(() => _checked[1] = val),
                  ),
                  WidgetMaker.getoLcalListTile(
                    inputText: "Include Numbers",
                    value: _checked[2],
                    fun: (val) => setState(() => _checked[2] = val),
                  ),
                  WidgetMaker.getoLcalListTile(
                    inputText: "Include Symbols",
                    value: _checked[3],
                    fun: (val) => setState(() => _checked[3] = val),
                  ),
                  GeneratePasswordButton(
                    textContorler: _textContorler,
                    color: forAll,
                    text: 'Generate Password',
                    size: size,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
