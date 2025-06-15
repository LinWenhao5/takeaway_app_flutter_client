import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import '../share/email_input.dart';
import '../share/password_input.dart';
import 'register_link.dart';
import 'login_button.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  context.t.login.title,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 24),
                EmailInput(controller: emailController),
                const SizedBox(height: 16),
                PasswordInput(
                  controller: passwordController,
                  label: context.t.register.passwordLabel,
                  hintText: context.t.register.passwordHint,
                  prefixIcon: const Icon(Icons.lock),
                ),
                const SizedBox(height: 16),
                const RegisterLink(),
                const SizedBox(height: 24),
                LoginButton(
                  emailController: emailController,
                  passwordController: passwordController,
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