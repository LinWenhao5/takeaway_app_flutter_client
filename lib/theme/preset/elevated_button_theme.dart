import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/colors.dart';

final ElevatedButtonThemeData elevatedButtonThemeLight =
    ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
      ),
    );

final ElevatedButtonThemeData elevatedButtonThemeDark = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: kPrimaryColorDark,
    foregroundColor: Colors.white,
  ),
);
