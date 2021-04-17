import 'package:flutter/material.dart';

// creating Stateless Wideget for buttons
class Button extends StatelessWidget {
  // declaring variables
  final color;
  final textColor;
  final String buttonText;
  final buttontapped;

  //Constructor
  Button({this.color, this.textColor, this.buttonText, this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: FractionalOffset(0.0, 1.0),
                  end: FractionalOffset(1.0, 0.0),
                  colors: [
                    Color.fromRGBO(114, 114, 117, 1.0),
                    Color.fromRGBO(42, 43, 46, 1.0)
                  ],
                  stops: [0.0, 0.8],
                  tileMode: TileMode.decal),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(-5, 5), //changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: color),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: textColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
