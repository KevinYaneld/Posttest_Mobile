import 'package:flutter/material.dart';
import 'package:posttest4_031_kevin/models/color_scheme.dart';

class ColorSchemeProvider extends ChangeNotifier {
  ThemeData _selectedColorScheme = ColorSchemes.defaultTheme;

  ThemeData get selectedColorScheme => _selectedColorScheme;

  void changeColorScheme(ThemeData newColorScheme) {
    _selectedColorScheme = newColorScheme;
    notifyListeners();
  }
}