import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/notifier/captcha_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/notifier/captcha_timer_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/notifier/forgot_password_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/state/captcha_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/state/forget_password_state.dart';
import 'notifier/login_notifier.dart';
import 'notifier/register_notifier.dart';
import 'state/login_state.dart';
import 'state/register_state.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier();
});

final registerProvider = StateNotifierProvider<RegisterNotifier, RegisterState>(
  (ref) {
    return RegisterNotifier();
  },
);

final captchaProvider = StateNotifierProvider<CaptchaNotifier, CaptchaState>((
  ref,
) {
  return CaptchaNotifier();
});

final captchaTimerProvider = StateNotifierProvider<CaptchaTimerNotifier, int>((
  ref,
) {
  return CaptchaTimerNotifier();
});

final forgetPasswordProvider = StateNotifierProvider<ForgotPasswordNotifier, ForgotPasswordState>((
  ref,
) {
  return ForgotPasswordNotifier();
});
