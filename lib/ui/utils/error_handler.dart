import 'package:flutter/material.dart';

String handleError(
  BuildContext context,
  dynamic exception,
  String Function(BuildContext, String) errorMapper,
) {
  return errorMapper(context, exception.toString());
}