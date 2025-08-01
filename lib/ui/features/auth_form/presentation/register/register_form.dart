import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import '../share/email_input.dart';
import '../share/password_input.dart';
import '../share/captcha_input.dart';
import 'register_button.dart';
import '../share/name_input.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final captchaController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    captchaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Text(
              context.t.register.title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 24),
            NameInput(controller: nameController),
            const SizedBox(height: 16),
            EmailInput(controller: emailController),
            const SizedBox(height: 16),
            PasswordInput(
              controller: passwordController,
              label: context.t.register.passwordLabel,
              hintText: context.t.register.passwordHint,
              prefixIcon: const Icon(Icons.lock),
            ),
            const SizedBox(height: 16),
            PasswordInput(
              controller: confirmPasswordController,
              label: context.t.register.confirmPasswordLabel,
              hintText: context.t.register.confirmPasswordHint,
              prefixIcon: const Icon(Icons.lock_outline),
            ),
            const SizedBox(height: 16),
            CaptchaInput(
              controller: captchaController,
              emailController: emailController,
            ),
            const SizedBox(height: 24),
            RegisterButton(
              controllers: {
                'name': nameController,
                'email': emailController,
                'password': passwordController,
                'confirmPassword': confirmPasswordController,
                'captcha': captchaController,
              },
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
