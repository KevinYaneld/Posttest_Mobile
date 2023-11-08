import 'package:flutter/material.dart';
import 'package:posttest4_031_kevin/providers/colorScheme_provider.dart';
import 'package:posttest4_031_kevin/providers/item_list_providers.dart';
import 'package:posttest4_031_kevin/providers/theme_provider.dart';
import 'package:posttest4_031_kevin/providers/wishlist_providers.dart';
import 'package:posttest4_031_kevin/screens/about_page.dart';
import 'package:posttest4_031_kevin/screens/home_page.dart';
import 'package:posttest4_031_kevin/screens/introduction_page.dart';
import 'package:posttest4_031_kevin/screens/wishlist.dart';
import 'package:posttest4_031_kevin/screens/bottomNavbar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ItemListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ColorSchemeProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);
    final selectedColorScheme =
        Provider.of<ColorSchemeProvider>(context).selectedColorScheme;
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: selectedColorScheme.colorScheme.primary,
        useMaterial3: true,
        colorScheme: selectedColorScheme.colorScheme,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: selectedColorScheme.colorScheme.primary,
          textTheme: ButtonTextTheme.primary,
        ),
        fontFamily: 'Roboto',
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: selectedColorScheme.colorScheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                selectedColorScheme.colorScheme.primary),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: selectedColorScheme.colorScheme.primary,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: selectedColorScheme
              .colorScheme.primary,
          iconTheme: IconThemeData(
              color: selectedColorScheme
                  .colorScheme.onPrimary), 
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: selectedColorScheme.colorScheme,
        brightness: Brightness.dark,
        primaryColor: selectedColorScheme.colorScheme.primary,
        scaffoldBackgroundColor: Colors.grey,
        textTheme: TextTheme(
          bodyLarge:
              TextStyle(color: Colors.white),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: selectedColorScheme.colorScheme.primary,
          textTheme: ButtonTextTheme.primary,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: selectedColorScheme.colorScheme.primary,
        ),
        iconTheme: IconThemeData(
          color: selectedColorScheme.colorScheme.onPrimary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                selectedColorScheme.colorScheme.primary),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 49, 49, 49),
          iconTheme:
              IconThemeData(color: selectedColorScheme.colorScheme.onPrimary),
        ),
      ),
      themeMode: themeprovider.themeMode,
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomePage(),
        '/bottomNav': (context) => const BottomNavScreen(),
        '/my': (context) => MyApp(),
        '/wishlist': (context) => const Wishlist(),
        '/about': (context) => const About(),
        '/introduction': (context) => IntroductionPage(),
      },
      initialRoute: '/introduction',
    );
  }
}
