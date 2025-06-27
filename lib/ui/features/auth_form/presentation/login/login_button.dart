import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../application/auth_provider.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

class LoginButton extends ConsumerWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loginProvider, (previous, next) {
      if (!next.isLoading && next.token != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.login.successMessage)),
        );
        Navigator.pop(context, true);
      } else if (!next.isLoading && next.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.errorMessage!)),
        );
      }
    });

    final authState = ref.watch(loginProvider);
    final authNotifier = ref.read(loginProvider.notifier);

    return Center(
      child: authState.isLoading
          ? SpinKitFadingCircle(
              color: Theme.of(context).primaryColor,
              size: 40.0,
            )
          : ElevatedButton(
              onPressed: () async {
                final email = emailController.text.trim();
                final password = passwordController.text.trim();

                if (email.isNotEmpty && password.isNotEmpty) {
                  await authNotifier.login(email, password);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(context.t.login.errorMessage)),
                  );
                }
              },
              child: Text(
                context.t.login.loginButton,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
    );
  }
}