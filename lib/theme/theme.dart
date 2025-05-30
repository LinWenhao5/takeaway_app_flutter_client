import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/theme/preset/app_bar_theme.dart';
import 'package:takeaway_app_flutter_client/theme/preset/nav_bar_theme.dart';
import 'package:takeaway_app_flutter_client/theme/preset/text_theme.dart';
import 'package:takeaway_app_flutter_client/theme/preset/colors.dart'; // 导入你的颜色

final ThemeData lightTheme = ThemeData(
  primaryColor: kPrimaryColor,
  brightness: Brightness.light,
  appBarTheme: lightAppBarTheme,
  bottomNavigationBarTheme: lightNavBarTheme,
  textTheme: appTextTheme,
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: kPrimaryColor,
  appBarTheme: darkAppBarTheme,
  bottomNavigationBarTheme: darkNavBarTheme,
  textTheme: appTextTheme,
);