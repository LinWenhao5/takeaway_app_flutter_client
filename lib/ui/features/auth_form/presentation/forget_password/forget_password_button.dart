import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/auth_provider.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

class ForgetPasswordButton extends ConsumerWidget {
  final TextEditingController emailController;
  final TextEditingController captchaController;
  final TextEditingController passwordController;

  const ForgetPasswordButton({
    super.key,
    required this.emailController,
    required this.captchaController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(forgetPasswordProvider, (previous, next) {
      if (next.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.forgotPassword.success)),
        );
        Navigator.pop(context, true);
      } else if (!next.loading && next.error != null && next.error!.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!)),
        );
      }
    });

    final state = ref.watch(forgetPasswordProvider);
    final notifier = ref.read(forgetPasswordProvider.notifier);

    return state.loading
        ? SpinKitFadingCircle(
            color: Theme.of(context).primaryColor,
            size: 40.0,
          )
        : SizedBox(
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              ),
              onPressed: () async {
                final email = emailController.text.trim();
                final captcha = captchaController.text.trim();
                final password = passwordController.text;
                if (email.isEmpty || captcha.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(context.t.login.errorMessage)),
                  );
                  return;
                }
                await notifier.resetPassword(
                  email,
                  captcha,
                  password,
                );
              },
              child: Text(
                context.t.forgotPassword.reset,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
            ),
          );
  }
}