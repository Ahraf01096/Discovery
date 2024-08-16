import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  //App related strings
  static String appName = "Discovery";

  //Colors for theme
  static Color kPrimaryColor = Color(0xff205065);
  static Color kSecondColor = Color(0xff3e97bd);






  static Color lightAccent = Color(0xff3e97bd);

  static Color darkAccent = Color(0xff205065);

  static Color lightBG = Colors.grey.shade200;
  static Color darkBG = Colors.grey;

  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.black,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: lightAccent,
    ),
    scaffoldBackgroundColor: lightBG,
    bottomAppBarTheme: BottomAppBarTheme(
      elevation: 0,
      color: lightBG,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: lightBG,
      iconTheme: const IconThemeData(color: Color(0xff205065)),
      toolbarTextStyle: GoogleFonts.nunito(
        color:Color(0xff205065),
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
      ),
      titleTextStyle: GoogleFonts.nunito(
        color: Color(0xff205065),
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
      ),
    ), colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: lightAccent,
    ).copyWith(background: lightBG),
  );

  static ThemeData darkTheme = ThemeData(
    iconTheme: const IconThemeData(color: Colors.white),
    primaryColor: Colors.white,
    scaffoldBackgroundColor: darkBG,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: darkAccent,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      elevation: 0,
      color: darkBG,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: darkBG,
      iconTheme: const IconThemeData(color: Colors.white),
      toolbarTextStyle: GoogleFonts.nunito(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
      ),
      titleTextStyle: GoogleFonts.nunito(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
      ),
    ), colorScheme: ColorScheme.fromSwatch(
      accentColor: darkAccent,
    ).copyWith(
      secondary: darkAccent,
      brightness: Brightness.dark,
    ).copyWith(background: darkBG),
  );

  static List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }
}
