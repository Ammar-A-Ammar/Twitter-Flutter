// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class GreyLineSeperator extends StatelessWidget {
  //const GreyLineSeperator({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //margin: EdgeInsets.symmetric(vertical: size.height * 0.005),
      width: size.width, //0.78
      child: Row(
        children: [
          buildDividerExpanded(),
        ],
      ),
    );
  }

  Expanded buildDividerExpanded() {
    return const Expanded(
      child: Divider(
        color: Colors.grey, //Color(0xFFD9D9D9),
        height: 1.5,
      ),
    );
  }
}
