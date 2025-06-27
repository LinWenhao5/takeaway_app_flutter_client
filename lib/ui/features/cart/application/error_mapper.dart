import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

String mapCartErrorToLocalizedMessage(String error) {
  if (error.contains('Unauthenticated')) {
    return t.errors.unauthorizedMessage;
  }
  return t.errors.genericErrorMessage;
}