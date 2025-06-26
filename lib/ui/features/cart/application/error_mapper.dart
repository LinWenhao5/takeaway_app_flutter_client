import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

String mapCartErrorToLocalizedMessage(BuildContext context, String error) {
  if (error.contains('Unauthenticated')) {
    return context.t.errors.unauthorizedMessage;
  }
  return context.t.errors.genericErrorMessage;
}