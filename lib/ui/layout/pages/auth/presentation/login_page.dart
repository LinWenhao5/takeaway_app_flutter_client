import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/presentation/login/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: const Padding(padding: EdgeInsets.all(16.0), child: LoginForm()),
    );
  }
}
