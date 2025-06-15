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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.t.register.title,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 24),
                NameInput(
                  controller: formState.nameController,
                  onChanged: formNotifier.updateName,
                ),
                const SizedBox(height: 16),
                EmailInput(
                  controller: formState.emailController,
                  onChanged: formNotifier.updateEmail,
                ),
                const SizedBox(height: 16),
                PasswordInput(
                  controller: formState.passwordController,
                  onChanged: formNotifier.updatePassword,
                  label: context.t.register.passwordLabel,
                  hintText: context.t.register.passwordHint,
                  prefixIcon: const Icon(Icons.lock),
                ),
                const SizedBox(height: 16),
                PasswordInput(
                  controller: formState.confirmPasswordController,
                  onChanged: formNotifier.updateConfirmPassword,  
                  label: context.t.register.confirmPasswordLabel,
                  hintText: context.t.register.confirmPasswordHint,
                  prefixIcon: const Icon(Icons.lock_outline),
                ),
                const SizedBox(height: 16),
                CaptchaInput(
                  controller: formState.captchaController,
                  emailController: formState.emailController,
                  onChanged: formNotifier.updateCaptcha,
                ),
                const SizedBox(height: 24),
                RegisterButton(
                  nameController: formState.nameController,
                  emailController: formState.emailController,
                  passwordController: formState.passwordController,
                  confirmPasswordController: formState.confirmPasswordController,
                  captchaController: formState.captchaController,
                ),
              ],
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}