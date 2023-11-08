import 'package:flutter/material.dart';

class ColorSchemes {
  static final defaultTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(secondary: Colors.green),
  );

  static final royalPurple = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
        .copyWith(secondary: Colors.deepPurple),
  );

  static final vibrantRed = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
        .copyWith(secondary: Colors.yellow),
  );

  static final emeraldGreen = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
        .copyWith(secondary: Colors.teal),
  );

   static final midnightDark = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey)
        .copyWith(secondary: Colors.orange),
  );
}
