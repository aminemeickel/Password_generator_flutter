import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Size size;
  final Function onPressed;
  final Color color;
  final String text;
  final double? width;
  final double height;
  final double fontSize;
  CustomButton(
      {Key? key,
      required this.size,
      required this.onPressed,
      required this.color,
      required this.text,
      this.width,
      this.height = 50,
      this.fontSize = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? size.width * .7,
      height: height,
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
          style: TextStyle(color: Colors.white, fontSize: fontSize),
        ),
        onPressed: onPressed as VoidCallback,
      ),
    );
  }
}
