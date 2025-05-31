import 'package:flutter/material.dart';

const TextStyle kDisplayLarge = TextStyle(
  fontSize: 34,
  fontWeight: FontWeight.bold,
);

const TextStyle kDisplayMedium = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
);

const TextStyle kHeadlineLarge = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const TextStyle kHeadlineMedium = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
);

const TextStyle kTitleLarge = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

const TextStyle kTitleMedium = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

const TextStyle kBodyLarge = TextStyle(
  fontSize: 16,
);

const TextStyle kBodyMedium = TextStyle(
  fontSize: 14,
);

const TextStyle kBodySmall = TextStyle(
  fontSize: 12,
);

const TextStyle kLabelLarge = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

const TextStyle kLabelSmall = TextStyle(
  fontSize: 10,
);

final TextTheme appTextTheme = TextTheme(
  displayLarge: kDisplayLarge,
  displayMedium: kDisplayMedium,
  headlineLarge: kHeadlineLarge,
  headlineMedium: kHeadlineMedium,
  titleLarge: kTitleLarge,
  titleMedium: kTitleMedium,
  bodyLarge: kBodyLarge,
  bodyMedium: kBodyMedium,
  bodySmall: kBodySmall,
  labelLarge: kLabelLarge,
  labelSmall: kLabelSmall,
);