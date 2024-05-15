import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DarkThemesOfApp {
  static Color primaryColor = const Color(0xff000000);
  static Color secondaryColor = const Color(0xff14213d);
  static Color textColor = const Color(0xffffffff);
  static Color boxColor = const Color(0xffe5e5e5);
}

class LightThemeOfApp {
  static Color primaryColor = const Color(0xffffffff);
  static Color secondaryColor = const Color(0xff000000);
  static Color textColor = const Color(0xffffffff);
  static Color boxColor = const Color(0xffe5e5e5);
}

class LightTextStyle {
  static TextStyle normalStyle = TextStyle(
      color: LightThemeOfApp.secondaryColor,
      fontSize: 18.sp,
      fontWeight: FontWeight.bold);
}

class DarkTextStyle {
  static TextStyle normalStyle = TextStyle(
      color: DarkThemesOfApp.textColor,
      fontSize: 18.sp,
      fontWeight: FontWeight.bold);
}
