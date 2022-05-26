// ignore_for_file: deprecated_member_use
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class RoundedButton extends StatelessWidget {
  final String passedText;
  final Function pressed;
  final Color colorPassed, textColor, highlightPassedColor, roundedpassedcolor;
  final double marginValue;

  const RoundedButton({
    Key key,
    this.passedText,
    this.pressed,
    this.colorPassed,
    this.textColor,
    this.roundedpassedcolor,
    this.marginValue,
    this.highlightPassedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //decoration: InputDecoration(icon: Icon(Icons.ac_unit_rounded)) ,
      //Icon('assests/icons/mockingay1.ico'),
      margin: EdgeInsets.symmetric(vertical: marginValue),
      //width: size.width ,
      child: ClipRRect(
        //borderRadius: BorderRadius.circular(77),
        child: FlatButton(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: roundedpassedcolor,
            ),
            borderRadius: BorderRadius.circular(990),
          ),
          minWidth: 355, //327
          height: 45, //41

          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
          color: colorPassed,
          //hoverColor: Colors.deepPurple,
          //disabledColor: Colors.deepPurple,
          //disabledTextColor: Colors.deepPurple,
          //colorBrightness: Color.fromARGB(255, 234, 221, 255),
          //focusColor: Colors.deepPurple,
          highlightColor: highlightPassedColor,

          onPressed: pressed,
          child: Text(
            passedText,
            style: TextStyle(
              color: textColor,
              //fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
