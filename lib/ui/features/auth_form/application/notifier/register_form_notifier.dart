import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterFormState {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController captchaController;

  RegisterFormState({
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.captchaController,
  });

  RegisterFormState copyWith({
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? confirmPasswordController,
    TextEditingController? captchaController,
  }) {
    return RegisterFormState(
      nameController: nameController ?? this.nameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      confirmPasswordController:
          confirmPasswordController ?? this.confirmPasswordController,
      captchaController: captchaController ?? this.captchaController,
    );
  }
}

class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  RegisterFormNotifier()
      : super(RegisterFormState(
          nameController: TextEditingController(),
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
          confirmPasswordController: TextEditingController(),
          captchaController: TextEditingController(),
        ));

  void updateName(String name) {
    state.nameController.text = name;
  }

  void updateEmail(String email) {
    state.emailController.text = email;
  }

  void updatePassword(String password) {
    state.passwordController.text = password;
  }

  void updateConfirmPassword(String confirmPassword) {
    state.confirmPasswordController.text = confirmPassword;
  }

  void updateCaptcha(String captcha) {
    state.captchaController.text = captcha;
  }

  @override
  void dispose() {
    state.nameController.dispose();
    state.emailController.dispose();
    state.passwordController.dispose();
    state.confirmPasswordController.dispose();
    state.captchaController.dispose();
    super.dispose();
  }
}