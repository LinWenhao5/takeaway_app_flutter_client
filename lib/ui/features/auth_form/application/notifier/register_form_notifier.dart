import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterFormState {
  final Map<String, TextEditingController> controllers;

  RegisterFormState({
    required this.controllers,
  });

  RegisterFormState copyWith({
    Map<String, TextEditingController>? controllers,
  }) {
    return RegisterFormState(
      controllers: controllers ?? this.controllers,
    );
  }

  TextEditingController get nameController => controllers['name']!;
  TextEditingController get emailController => controllers['email']!;
  TextEditingController get passwordController => controllers['password']!;
  TextEditingController get confirmPasswordController =>
      controllers['confirmPassword']!;
  TextEditingController get captchaController => controllers['captcha']!;
}

class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  RegisterFormNotifier()
      : super(RegisterFormState(
          controllers: {
            'name': TextEditingController(),
            'email': TextEditingController(),
            'password': TextEditingController(),
            'confirmPassword': TextEditingController(),
            'captcha': TextEditingController(),
          },
        ));

  void updateField(String field, String value) {
    final controller = state.controllers[field];
    if (controller != null) {
      controller.value = TextEditingValue(
        text: value,
        selection: TextSelection.collapsed(offset: value.length),
      );
    }
  }

  @override
  void dispose() {
    for (final controller in state.controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }
}