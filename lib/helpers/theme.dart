import 'package:flutter/material.dart';
import 'package:pin_app/helpers/services/color_services.dart';
import 'package:pin_app/helpers/theme_services.dart';

import 'constant.dart';

class Themes {
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: blackTxtColor),
    fontFamily: family,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(color: blackTxtColor),
      toolbarTextStyle: TextStyle(color: blackTxtColor, fontSize: 18, fontWeight: FontWeight.bold),
    ),
    textTheme: TextTheme(
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: blackTxtColor),
    ),
  );

  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    iconTheme: IconThemeData(color: whiteTxtColor),
    fontFamily: family,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      toolbarTextStyle: TextStyle(color: whiteTxtColor),
      iconTheme: IconThemeData(color:whiteTxtColor),
    ),
    textTheme: TextTheme(


    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(foregroundColor: Colors.black, backgroundColor: Colors.white),
    ),
  );

// static bool setColor(BuildContext context) {
//   Color? color = Theme.of(context).textTheme.bodyLarge?.color;
//   return (color == Colors.white) ? true : false;
// }
}

TextStyle getAppbarTextTheme() {
  return TextStyle(
    color: ThemeService.isSavedDarkMode() ? Colors.black : Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,

  );
}