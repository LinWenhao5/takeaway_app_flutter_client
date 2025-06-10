import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/auth_provider.dart';
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
    final authState = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);

    return Center(
      child: authState.isLoading
          ? const CircularProgressIndicator()
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () async {
                final email = emailController.text.trim();
                final password = passwordController.text.trim();

                if (email.isNotEmpty && password.isNotEmpty) {
                  await authNotifier.login(email, password, context);

                  if (!context.mounted) return;

                  final updatedAuthState = ref.read(authProvider);
                  if (updatedAuthState.token != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(context.t.login.successMessage)),
                    );
                    Navigator.pop(context);
                  } else if (updatedAuthState.errorMessage != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(updatedAuthState.errorMessage!)),
                    );
                  }
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