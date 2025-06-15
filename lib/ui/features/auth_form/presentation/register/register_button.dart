import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/auth_provider.dart';

class RegisterButton extends ConsumerWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController captchaController;

  const RegisterButton({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.captchaController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () async {
          final name = nameController.text.trim();
          final email = emailController.text.trim();
          final password = passwordController.text.trim();
          final confirmPassword = confirmPasswordController.text.trim();
          final captcha = captchaController.text.trim();


          if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty || captcha.isEmpty) {
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