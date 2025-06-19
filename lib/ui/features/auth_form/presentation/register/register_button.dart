import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/auth_provider.dart';

class RegisterButton extends ConsumerWidget {
  final Map<String, TextEditingController> controllers;

  const RegisterButton({
    super.key,
    required this.controllers,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          final name = controllers['name']!.text.trim();
          final email = controllers['email']!.text.trim();
          final password = controllers['password']!.text.trim();
          final confirmPassword = controllers['confirmPassword']!.text.trim();
          final captcha = controllers['captcha']!.text.trim();

          if ([name, email, password, confirmPassword, captcha]
              .any((field) => field.isEmpty)) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(context.t.register.errorMessage)),
            );
            return;
          }

          if (password != confirmPassword) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(context.t.register.passwordMismatchMessage)),
            );
            return;
          }

          try {
            await ref.read(registerProvider.notifier).register(
                  name,
                  email,
                  password,
                  captcha,
                  context,
                );

            if (!context.mounted) return;

            final updatedAuthState = ref.read(registerProvider);

            if (updatedAuthState.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(updatedAuthState.errorMessage!)),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.t.register.successMessage)),
              );
              Navigator.pop(context);
            }
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(context.t.errors.genericErrorMessage)),
            );
          }
        },
        child: Text(
          context.t.register.registerButton,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}