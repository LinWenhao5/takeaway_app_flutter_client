import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/captcha_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/domain/captcha_state.dart';
import 'login_notifier.dart';
import 'register_notifier.dart';
import '../domain/login_state.dart';
import '../domain/register_state.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier();
});

final registerProvider = StateNotifierProvider<RegisterNotifier, RegisterState>((ref) {
  return RegisterNotifier();
});

final captchaProvider = StateNotifierProvider<CaptchaNotifier, CaptchaState>((ref) {
  return CaptchaNotifier();
});