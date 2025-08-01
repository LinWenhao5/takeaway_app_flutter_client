import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/colors.dart';

final InputDecorationTheme appInputDecorationThemeLight = InputDecorationTheme(
  filled: true,
  fillColor: Colors.white,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(24),
    borderSide: const BorderSide(color: kPrimaryColor, width: 1),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(24),
    borderSide: const BorderSide(color: kPrimaryColor, width: 1),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(24),
    borderSide: const BorderSide(color: kAccentColor, width: 2),
  ),
  prefixIconColor: kPrimaryColor,
  hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
);

final InputDecorationTheme appInputDecorationThemeDark = InputDecorationTheme(
  filled: true,
  fillColor: Color(0xFF181818),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(24),
    borderSide: const BorderSide(color: kAccentColor, width: 1),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(24),
    borderSide: const BorderSide(color: kAccentColor, width: 1),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(24),
    borderSide: const BorderSide(color: kPrimaryColor, width: 2),
  ),
  prefixIconColor: kAccentColor,
  hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
);
