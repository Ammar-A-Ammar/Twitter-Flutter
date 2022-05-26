import 'package:flutter/material.dart';

class BackGroundForHomePageScreen extends StatelessWidget {
  final Widget child;
  //  final Size size;
  const BackGroundForHomePageScreen({
    Key key,
    // @required this.size,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 25,
              //left: size.width * 0.4,
              child: Image.asset(
                'assests/images/mockingay1.png',
                width: size.width * 0.11,
              ),
            ),
            child
          ],
        ),
      ),
    );
  }
}









/* class BackgroundForLoginScreen extends StatelessWidget {
  final Widget child;
  const BackgroundForLoginScreen({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: sized_box_for_whitespace
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 25,
              left: 0,
              child: Image.asset(
                "assests/images/mockingay2.png",
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
    );
  }
}

 */