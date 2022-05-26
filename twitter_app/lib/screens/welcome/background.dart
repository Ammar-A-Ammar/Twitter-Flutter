import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: sized_box_for_whitespace
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 25,
                left: 160,
                child: Image.asset(
                  "assests/images/FinalLogo.png",
                  width: size.width * 0.2,
                ),
              ),
              /* Positioned(
                child: child,
              ), */
              child
            ],
          ),
        ),
      ),
    );
  }
}
