import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/theme/preset/colors.dart';

const BottomNavigationBarThemeData lightNavBarTheme = BottomNavigationBarThemeData(
  backgroundColor: kLightNavBg,
  selectedItemColor: kPrimaryColor,
  unselectedItemColor: Colors.grey,
  selectedIconTheme: IconThemeData(color: kPrimaryColor),
  unselectedIconTheme: IconThemeData(color: Colors.grey),
  showUnselectedLabels: true,
);

const BottomNavigationBarThemeData darkNavBarTheme = BottomNavigationBarThemeData(
  backgroundColor: kDarkNavBg,
  selectedItemColor: kPrimaryColor,
  unselectedItemColor: Colors.grey,
  selectedIconTheme: IconThemeData(color: kPrimaryColor),
  unselectedIconTheme: IconThemeData(color: Colors.grey),
  showUnselectedLabels: true,
);