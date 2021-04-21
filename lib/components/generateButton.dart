import 'package:flutter/material.dart';

typedef String PasswordGenerate();

class PasswordButton extends StatelessWidget {
  final Size size;
  final Function onPressed;
  PasswordButton({Key? key, required this.size, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .64,
      height: size.height * .08,
      child: ElevatedButton(
        style: ButtonStyle(
          padding:
              MaterialStateProperty.all(EdgeInsets.fromLTRB(10, 15, 15, 15)),
          backgroundColor: MaterialStateProperty.all(Colors.blue),
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
          'Generate Password',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: onPressed as VoidCallback,
      ),
    );
  }
}