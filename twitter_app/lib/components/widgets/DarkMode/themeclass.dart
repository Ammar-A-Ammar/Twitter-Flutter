import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black),
      textTheme: TextTheme(
        headline2: TextStyle(color: Colors.black),
      ),
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black54,
    ),
  );
  // ThemeClass._();

  // static Color _iconColor = Colors.blueAccent.shade200;
  // static const Color _lightPrimaryColor = Color.fromARGB(255, 255, 255, 255);
  // static const Color _lightPrimaryVariantColor =
  //     Color.fromARGB(255, 255, 255, 255);
  // static const Color _lightSecondaryColor = Colors.green;
  // static const Color _lightOnPrimaryColor = Colors.black;

  // static const Color _darkPrimaryColor = Colors.white24;
  // static const Color _darkPrimaryVariantColor = Colors.black;
  // static const Color _darkSecondaryColor = Colors.white;
  // static const Color _darkOnPrimaryColor = Colors.white;

  // static final ThemeData lightTheme = ThemeData(
  //     appBarTheme: AppBarTheme(
  //       titleTextStyle: TextStyle(
  //           color: Colors.black,
  //           fontFamily: "Roboto",
  //           fontWeight: FontWeight.bold,
  //           fontSize: 26),
  //       color: _lightPrimaryVariantColor,
  //       iconTheme: IconThemeData(color: _lightOnPrimaryColor),
  //     ),
  //     colorScheme: ColorScheme.light(
  //       primary: _lightPrimaryColor,
  //       primaryVariant: _lightPrimaryVariantColor,
  //       secondary: _lightSecondaryColor,
  //       onPrimary: _lightOnPrimaryColor,
  //     ),
  //     iconTheme: IconThemeData(
  //       color: _iconColor,
  //     ),
  //     textTheme: _lightTextTheme,
  //     dividerTheme: DividerThemeData(color: Colors.black12));

  // static final ThemeData darkTheme = ThemeData(
  //     scaffoldBackgroundColor: _darkPrimaryVariantColor,
  //     appBarTheme: AppBarTheme(
  //       color: _darkPrimaryVariantColor,
  //       iconTheme: IconThemeData(color: _darkOnPrimaryColor),
  //     ),
  //     colorScheme: ColorScheme.dark(
  //       primary: _darkPrimaryColor,
  //       primaryVariant: _darkPrimaryVariantColor,
  //       secondary: _darkSecondaryColor,
  //       onPrimary: _darkOnPrimaryColor,
  //       background: Colors.white12,
  //     ),
  //     iconTheme: IconThemeData(
  //       color: _iconColor,
  //     ),
  //     textTheme: _darkTextTheme,
  //     dividerTheme: DividerThemeData(color: Colors.black));

  // static final TextTheme _lightTextTheme = TextTheme(
  //   headline1: _lightScreenHeading1TextStyle,
  // );

  // static final TextTheme _darkTextTheme = TextTheme(
  //   headline1: _darkScreenHeading1TextStyle,
  // );

  // static final TextStyle _lightScreenHeading1TextStyle = TextStyle(
  //     fontSize: 26.0,
  //     fontWeight: FontWeight.bold,
  //     color: _lightOnPrimaryColor,
  //     fontFamily: "Roboto");

  // static final TextStyle _darkScreenHeading1TextStyle =
  //     _lightScreenHeading1TextStyle.copyWith(color: _darkOnPrimaryColor);
}
