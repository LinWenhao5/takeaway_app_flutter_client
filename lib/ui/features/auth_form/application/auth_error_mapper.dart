import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

String mapLoginErrorToLocalizedMessage(BuildContext context, String error) {
  if (error.contains('Invalid credentials')) {
    return context.t.errors.invalidCredentialsMessage;
  }
  if (error.contains('email')) {
    return context.t.errors.invalidEmailFormatMessage;
  }
  if (error.contains('password')) {
    return context.t.errors.invalidPasswordMessage;
  }
  return context.t.errors.genericErrorMessage;
}

String mapRegisterErrorToLocalizedMessage(BuildContext context, String error) {
  if (error.contains('email')) {
    return context.t.errors.emailTakenMessage;
  }
  if (error.contains('captcha')) {
    return context.t.errors.invalidCaptchaMessage;
  }
  return context.t.errors.genericErrorMessage;
}


String mapCaptchaErrorToLocalizedMessage(BuildContext context, String error) {
  if (error.contains('email')) {
    return context.t.errors.invalidEmailFormatMessage;
  }
  return context.t.errors.genericErrorMessage;
}