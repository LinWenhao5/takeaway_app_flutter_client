import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/presentation/share/email_input.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/presentation/share/captcha_input.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/presentation/share/password_input.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'forget_password_button.dart';

class ForgetPasswordForm extends ConsumerStatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  ConsumerState<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends ConsumerState<ForgetPasswordForm> {
  final emailController = TextEditingController();
  final captchaController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    captchaController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  context.t.forgotPassword.title,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 24),
                EmailInput(controller: emailController),
                const SizedBox(height: 16),
                CaptchaInput(
                  controller: captchaController,
                  emailController: emailController,
                ),
                const SizedBox(height: 16),
                PasswordInput(
                  controller: passwordController,
                  label: context.t.register.passwordLabel,
                  hintText: context.t.register.passwordHint,
                  prefixIcon: const Icon(Icons.lock),
                ),
                const SizedBox(height: 24),
                Center(
                  child: ForgetPasswordButton(
                    emailController: emailController,
                    captchaController: captchaController,
                    passwordController: passwordController,
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      context.t.login.backToLogin,
                      style: const TextStyle(
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
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