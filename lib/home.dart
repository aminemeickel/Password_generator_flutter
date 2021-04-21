import 'package:flutter_pw_gen/Utils/UtilClass.dart';
import 'components/clearButton.dart';
import 'components/generateButton.dart';
import 'components/listTile.dart';
import 'components/textField.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String? title;
  HomePage({Key? key, this.title}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                optionListTile(
                    inputText: "Lowercase Letters",
                    value: _checked[0],
                    fun: (val) => setState(() => _checked[0] = val)),
                optionListTile(
                  inputText: "Uppercase Letters",
                  value: _checked[1],
                  fun: (val) => setState(() => _checked[1] = val),
                ),
                optionListTile(
                  inputText: "Numbers",
                  value: _checked[2],
                  fun: (val) => setState(() => _checked[2] = val),
                ),
                optionListTile(
                  inputText: "Symbols",
                  value: _checked[3],
                  fun: (val) => setState(() => _checked[3] = val),
                ),
                SizedBox(
                  height: 12,
                ),
                PasswordButton(
                  size: size,
                  onPressed: () {
                    _textContorler.text =
                        UtilClass.passwordGenerator(_checked, _val.toInt());
                  },
                ),
                SizedBox(
                  height: 14,
                ),
                ClearButton(
                  size: size,
                  onPressed: () {
                    _textContorler.clear();
                    UtilClass.showToast(message: 'Text Cleard');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
