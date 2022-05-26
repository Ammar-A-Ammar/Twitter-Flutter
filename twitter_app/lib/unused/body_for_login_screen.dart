import 'package:flutter/material.dart';

class BodyForLoginScreen extends StatelessWidget {
  const BodyForLoginScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 25,
            //left: size.width * 0.4,
            child: Image.asset(
              'assests/images/mockingay2.png',
              width: size.width * 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
