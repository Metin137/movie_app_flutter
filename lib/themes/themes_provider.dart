import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/models/theme_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart';
import 'package:movie_app/helpers/shared_preferences_helper.dart';

class ThemesProvider extends ChangeNotifier {
  ThemeModel darkColors = ThemeModel(
    name: "light",
    colors: ThemeColors(
      accent: const Color(0xFFFF4957),
      primary: const Color(0xFF344955),
      secondary: const Color(0xFFF9AA33),
      thirth: const Color(0xFF232F34),
      fourth: const Color(0xFF4A6572),
      fifth: const Color(0xFF063048),
      black: const Color(0xFF2F2F2F),
      white: const Color(0xFFFFFFFF),
      gray: const Color(0xFFBDBFC7),
      gray2: const Color(0xFFD8D8D8),
      gray3: const Color(0xFFF0F0F0),
      gray4: const Color(0xFFF7F8FA),
      borderColor: const Color(0xFFe5e5e5),
      textColor: const Color(0xFFFFFFFF),
    ),
  );

  ThemeModel lightColors = ThemeModel(
    name: "light",
    colors: ThemeColors(
      accent: Color.fromARGB(255, 255, 0, 21),
      primary: const Color(0xFFFFFFFF),
      secondary: const Color.fromARGB(255, 14, 14, 14),
      thirth: const Color(0xFFfc4849),
      fourth: const Color(0xFF4A6572),
      fifth: const Color(0xFFffb677),
      black: const Color(0xFF2F2F2F),
      white: const Color(0xFFFFFFFF),
      gray: const Color(0xFF999999),
      gray2: const Color(0xFFE5E5E5),
      gray3: const Color(0xFFF0F0F0),
      gray4: const Color(0xFFF7F8FA),
      borderColor: const Color(0xFFff8364),
      textColor: const Color(0xFF2F2F2F),
    ),
  );

  SharedPreferencesHelper storageHelper = SharedPreferencesHelper();
  List<Map<String, dynamic>> allThemes = [];
  late ThemeColors colors;

  ThemeColors get getColors {
    return colors;
  }

  bool isDark = true;

  ThemesProvider() {
    //getActiveTheme();
    colors = lightColors.colors;
  }

  Color toColor(String arg) {
    var hexColor = arg.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    } else {
      return const Color(0xFFffffff);
    }
  }

  getActiveTheme() async {
    String activeThemeKey = await storageHelper.getStorageItem(key: "activeTheme");

    ThemeModel activeTheme = activeThemeKey == "dark" ? darkColors : lightColors;

    colors = activeTheme.colors;
    return colors;
  }

  setActiveTheme(String value) async {
    String activeThemeKey = await storageHelper.setStorageItem(key: "activeTheme", value: value);

    ThemeModel activeTheme = activeThemeKey == "dark" ? darkColors : lightColors;

    colors = activeTheme.colors;
    notifyListeners();
    debugPrint("activeTheme: " + activeTheme.toString());
  }

  ThemeData get themeData => ThemeData(
        primaryColor: colors.borderColor,
        accentColor: colors.borderColor,
        backgroundColor: colors.primary,
        scaffoldBackgroundColor: colors.primary,
        textTheme: const TextTheme().copyWith(
          headline1: TextStyle(
            color: colors.textColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
          headline2: TextStyle(color: colors.textColor, fontSize: 14),
          bodyText1: TextStyle(color: colors.textColor, fontSize: 18),
          bodyText2: TextStyle(color: colors.gray2, fontSize: 16),
          caption: TextStyle(color: colors.gray2, fontSize: 14),
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.green,
        ),
      );

  darkThemes() {
    setActiveTheme("dark");
  }

  lightThemes() {
    setActiveTheme("light");
  }

  toggleThemes() {
    if (isDark) {
      lightThemes();
      isDark = false;
    } else {
      darkThemes();
      isDark = true;
    }
  }
}
