import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/auth_provider.dart';
import '../share/email_input.dart';
import '../share/password_input.dart';
import '../share/captcha_input.dart';
import 'register_button.dart';
import '../share/name_input.dart';

class RegisterForm extends ConsumerWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(registerFormProvider);
    final formNotifier = ref.read(registerFormProvider.notifier);

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
            NameInput(
              controller: formState.nameController,
              onChanged: (value) => formNotifier.updateField('name', value),
            ),
            const SizedBox(height: 16),
            EmailInput(
              controller: formState.emailController,
              onChanged: (value) => formNotifier.updateField('email', value),
            ),
            const SizedBox(height: 16),
            PasswordInput(
              controller: formState.passwordController,
              onChanged: (value) => formNotifier.updateField('password', value),
              label: context.t.register.passwordLabel,
              hintText: context.t.register.passwordHint,
              prefixIcon: const Icon(Icons.lock),
            ),
            const SizedBox(height: 16),
            PasswordInput(
              controller: formState.confirmPasswordController,
              onChanged: (value) =>
                  formNotifier.updateField('confirmPassword', value),
              label: context.t.register.confirmPasswordLabel,
              hintText: context.t.register.confirmPasswordHint,
              prefixIcon: const Icon(Icons.lock_outline),
            ),
            const SizedBox(height: 16),
            CaptchaInput(
              controller: formState.captchaController,
              emailController: formState.emailController,
              onChanged: (value) => formNotifier.updateField('captcha', value),
            ),
            const SizedBox(height: 24),
            RegisterButton(
              controllers: formState.controllers,
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}