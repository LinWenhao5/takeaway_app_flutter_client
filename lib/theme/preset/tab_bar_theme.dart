import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/colors.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/text_theme.dart';

const TabBarThemeData customTabBarTheme = TabBarThemeData(
  labelColor: kPrimaryColor,
  unselectedLabelColor: Colors.grey,
  labelStyle: kTitleMedium,
  unselectedLabelStyle: kBodyMedium,
  indicator: UnderlineTabIndicator(
    borderSide: BorderSide(width: 3.0, color: kPrimaryColor),
  ),
);
