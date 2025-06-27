import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

String mapLoginErrorToLocalizedMessage(String error) {
  if (error.contains('Invalid credentials')) {
    return t.errors.invalidCredentialsMessage;
  }
  if (error.contains('email')) {
    return t.errors.invalidEmailFormatMessage;
  }
  if (error.contains('password')) {
    return t.errors.invalidPasswordMessage;
  }
  return t.errors.genericErrorMessage;
}

String mapRegisterErrorToLocalizedMessage(String error) {
  if (error.contains('email')) {
    return t.errors.emailTakenMessage;
  }
  if (error.contains('captcha')) {
    return t.errors.invalidCaptchaMessage;
  }
  return t.errors.genericErrorMessage;
}


String mapCaptchaErrorToLocalizedMessage(String error) {
  if (error.contains('email')) {
    return t.errors.invalidEmailFormatMessage;
  }
  return t.errors.genericErrorMessage;
}