import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorStyle {
  static void setSystemStylePref() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: ColorStyle.whiteColor,
    ));
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  static const Map<int, Color> customSwatchColor = {
    50: Color.fromRGBO(63, 106, 201, .1),
    100: Color.fromRGBO(63, 106, 201, .2),
    200: Color(0xFF3F6AC9),
    300: Color.fromRGBO(63, 106, 201, .4),
    400: Color.fromRGBO(63, 106, 201, .5),
    500: Color.fromRGBO(63, 106, 201, .6),
    600: Color.fromRGBO(63, 106, 201, .7),
    700: Color.fromRGBO(63, 106, 201, .8),
    800: Color.fromRGBO(63, 106, 201, .9),
    900: Color.fromRGBO(63, 106, 201, 1),
  };

  static const ColorScheme appScheme = ColorScheme(
    brightness: Brightness.light,
    primary: ColorStyle.primaryColor,
    onPrimary: ColorStyle.whiteColor,
    secondary: ColorStyle.primaryColor,
    onSecondary: ColorStyle.whiteColor,
    error: ColorStyle.red100Color,
    onError: ColorStyle.whiteColor,
    surface: ColorStyle.backgroundColor,
    onSurface: ColorStyle.primaryTextColor,
  );

  static MaterialColor primaryMaterialColor =
      const MaterialColor(0xFF3F6AC9, customSwatchColor);

  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    primaryColor: ColorStyle.primaryColor,
    fontFamily: "Helvetica Now Display",
    canvasColor: ColorStyle.backgroundColor,
    colorScheme: ColorStyle.appScheme,
    primarySwatch: ColorStyle.primaryMaterialColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    dialogBackgroundColor: ColorStyle.whiteColor,
    cupertinoOverrideTheme: const CupertinoThemeData(
      textTheme: CupertinoTextThemeData(),
    ),
  );

  static const primaryColor = Color(0xFF3F6AC9);

  static const primaryTextColor = Color(0xFF000000);
  static const secondaryTextColor = Color(0xFF939393);
  static const backgroundColor = Color(0xFFFFFFFF);
  static const borderColor = Color(0xFFEAEAEA);
  static const outline100Color = Color(0xFF646464);
  static const black200Color = Color(0xFF666666);
  static const red100Color = Color(0xFFD41615);
  static const green100Color = Color.fromARGB(255, 18, 187, 18);

  static const grey100Color = Color(0xFFF1EDE7);
  static const scrollColor = Color(0xFFEFEFEF);
  static const greyTextColor = Color(0xFF939393);
  static const cardColor = Color(0xFFF1EDE7);
  static const jumbleColor = Color(0xFF3E87FF);
  static Color shadowColor = const Color(0xFF626976).withOpacity(0.15);

  static const whiteColor = Color(0xFFFFFFFF);
  static const blackColor = Color(0xFF000000);
}
