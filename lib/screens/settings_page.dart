import 'package:flutter/material.dart';
import 'package:posttest4_031_kevin/models/color_scheme.dart';
import 'package:posttest4_031_kevin/providers/colorScheme_provider.dart';
import 'package:posttest4_031_kevin/providers/theme_provider.dart';
import 'package:provider/provider.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text(
              "Change Theme",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            onTap: () {
              showThemeChangeDialog(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.change_circle),
            title: Text(
              "Change Color Scheme",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            onTap: () {
              showColorSchemeChangeDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void showThemeChangeDialog(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Select Theme',
            style: TextStyle(
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  'Light Theme',
                  style: TextStyle(
                    color: isDarkTheme ? Colors.white : Colors.black,
                  ),
                ),
                leading: Radio(
                  value: ThemeMode.light,
                  groupValue: Provider.of<ThemeProvider>(context).themeMode,
                  onChanged: (value) {
                    Navigator.of(context).pop();
                    Provider.of<ThemeProvider>(context, listen: false)
                        .changeTheme(ThemeMode.light);
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'Dark Theme',
                  style: TextStyle(
                    color: isDarkTheme ? Colors.white : Colors.black,
                  ),
                ),
                leading: Radio(
                  value: ThemeMode.dark,
                  groupValue: Provider.of<ThemeProvider>(context).themeMode,
                  onChanged: (value) {
                    Navigator.of(context).pop();
                    Provider.of<ThemeProvider>(context, listen: false)
                        .changeTheme(ThemeMode.dark);
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'System Theme',
                  style: TextStyle(
                    color: isDarkTheme ? Colors.white : Colors.black,
                  ),
                ),
                leading: Radio(
                  value: ThemeMode.system,
                  groupValue: Provider.of<ThemeProvider>(context).themeMode,
                  onChanged: (value) {
                    Navigator.of(context).pop();
                    Provider.of<ThemeProvider>(context, listen: false)
                        .changeTheme(ThemeMode.system);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showColorSchemeChangeDialog(BuildContext context) {
    final colorSchemeProvider = Provider.of<ColorSchemeProvider>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Select Color Scheme',
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  'Default',
                ),
                leading: Radio(
                  value: ColorSchemes.defaultTheme,
                  groupValue: colorSchemeProvider.selectedColorScheme,
                  onChanged: (value) {
                    Navigator.of(context).pop();
                    colorSchemeProvider.changeColorScheme(ColorSchemes.defaultTheme);
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'Royal Purple',
                ),
                leading: Radio(
                  value: ColorSchemes.royalPurple,
                  groupValue: colorSchemeProvider.selectedColorScheme,
                  onChanged: (value) {
                    Navigator.of(context).pop();
                    colorSchemeProvider.changeColorScheme(ColorSchemes.royalPurple);
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'Vibrant Red',
                ),
                leading: Radio(
                  value: ColorSchemes.vibrantRed,
                  groupValue: colorSchemeProvider.selectedColorScheme,
                  onChanged: (value) {
                    Navigator.of(context).pop();
                    colorSchemeProvider.changeColorScheme(ColorSchemes.vibrantRed);
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'Emerald Green',
                ),
                leading: Radio(
                  value: ColorSchemes.emeraldGreen,
                  groupValue: colorSchemeProvider.selectedColorScheme,
                  onChanged: (value) {
                    Navigator.of(context).pop();
                    colorSchemeProvider.changeColorScheme(ColorSchemes.emeraldGreen);
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'Midnight Dark',
                ),
                leading: Radio(
                  value: ColorSchemes.midnightDark,
                  groupValue: colorSchemeProvider.selectedColorScheme,
                  onChanged: (value) {
                    Navigator.of(context).pop();
                    colorSchemeProvider.changeColorScheme(ColorSchemes.midnightDark);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}