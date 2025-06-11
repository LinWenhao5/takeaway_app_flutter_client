import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'email_input.dart';
import 'password_input.dart';
import 'confirm_password_input.dart';
import 'captcha_input.dart';
import 'register_button.dart';
import 'name_input.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();
    final TextEditingController captchaController = TextEditingController();

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
                NameInput(controller: nameController),
                const SizedBox(height: 16),
                EmailInput(controller: emailController),
                const SizedBox(height: 16),
                PasswordInput(controller: passwordController),
                const SizedBox(height: 16),
                ConfirmPasswordInput(controller: confirmPasswordController),
                const SizedBox(height: 16),
                CaptchaInput(
                  controller: captchaController,
                  emailController: emailController
                ),
                const SizedBox(height: 24),
                RegisterButton(
                  nameController: nameController,
                  emailController: emailController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                  captchaController: captchaController,
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