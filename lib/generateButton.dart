import 'package:flutter/material.dart';

typedef String PasswordGenerate();

class GeneratePasswordButton extends StatelessWidget {
  final Color color;
  final TextEditingController textContorler;
  final String text;
  final Size size;

  GeneratePasswordButton({
    Key? key,
    required this.color,
    required this.textContorler,
    required this.text,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .64,
      height: size.height * .08,
      child: ElevatedButton(
        style: ButtonStyle(
          padding:
              MaterialStateProperty.all(EdgeInsets.fromLTRB(10, 15, 15, 15)),
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20,
                ),
              ),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
          textContorler.text = '';
        },
      ),
    );
  }
}
