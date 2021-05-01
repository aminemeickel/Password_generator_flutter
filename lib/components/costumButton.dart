import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Size size;
  final Function onPressed;
  final Color color;
  final String text;
  CustomButton(
      {Key? key,
      required this.size,
      required this.onPressed,
      required this.color,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .7,
      height: 50,
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
        onPressed: onPressed as VoidCallback,
      ),
    );
  }
}
