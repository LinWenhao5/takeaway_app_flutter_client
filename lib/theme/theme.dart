import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/theme/preset/app_bar_theme.dart';
import 'package:takeaway_app_flutter_client/theme/preset/input_decoration_theme.dart';
import 'package:takeaway_app_flutter_client/theme/preset/nav_bar_theme.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/text_theme.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/colors.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: kPrimaryColor,
  brightness: Brightness.light,
  appBarTheme: lightAppBarTheme,
  bottomNavigationBarTheme: lightNavBarTheme,
  textTheme: appTextTheme,
  inputDecorationTheme: appInputDecorationThemeLight,
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: kPrimaryColor,
  appBarTheme: darkAppBarTheme,
  bottomNavigationBarTheme: darkNavBarTheme,
  textTheme: appTextTheme,
  inputDecorationTheme: appInputDecorationThemeDark,
);