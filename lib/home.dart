import 'package:flutter_pw_gen/Utils/UtilClass.dart';
import 'package:flutter_pw_gen/history.dart';
import 'components/costumButton.dart';
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
          leading: ElevatedButton(
            style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(Colors.transparent)),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => History(),
                ),
              );
            },
            child: Icon(Icons.history),
          )),
      body: Container(
        alignment: Alignment.center,
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(10),
          shadowColor: Colors.grey[300],
          color: Colors.white,
          child: Container(
            constraints: BoxConstraints.tightFor(
              height: size.height * .8,
              width: size.width * .96,
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                textfield(
                  textContorler: _textContorler,
                  forAll: forAll,
                ),
                Slider(
                  value: _val,
                  onChanged: (x) => setState(() => _val = x),
                  max: 22,
                  min: 4,
                  divisions: 18,
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
                CustomButton(
                  color: Colors.blue,
                  text: 'Generate Password',
                  size: size,
                  onPressed: () {
                    _textContorler.text =
                        UtilClass.passwordGenerator(_checked, _val.toInt());
                  },
                ),
                CustomButton(
                  size: size,
                  color: Colors.red,
                  text: 'Clear Password',
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
