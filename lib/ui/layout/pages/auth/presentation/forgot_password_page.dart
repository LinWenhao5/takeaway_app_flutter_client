import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/presentation/forget_password/forget_password_form.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        centerTitle: true,
      ),
      body: const ForgetPasswordForm(),
    );
  }
}