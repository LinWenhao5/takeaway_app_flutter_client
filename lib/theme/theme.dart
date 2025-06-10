import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/theme/preset/app_bar_theme.dart';
import 'package:takeaway_app_flutter_client/theme/preset/input_decoration_theme.dart';
import 'package:takeaway_app_flutter_client/theme/preset/nav_bar_theme.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/text_theme.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/colors.dart';
import 'package:takeaway_app_flutter_client/theme/preset/tab_bar_theme.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: kPrimaryColor,
  brightness: Brightness.light,
  textTheme: appTextTheme,
  appBarTheme: lightAppBarTheme,
  bottomNavigationBarTheme: lightNavBarTheme,
  inputDecorationTheme: appInputDecorationThemeLight,
  tabBarTheme: customTabBarTheme,
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: kPrimaryColorDark,
  textTheme: appTextTheme,
  appBarTheme: darkAppBarTheme,
  bottomNavigationBarTheme: darkNavBarTheme,
  inputDecorationTheme: appInputDecorationThemeDark,
  tabBarTheme: customTabBarTheme,
);