import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

class ForgotPasswordLink extends StatelessWidget {
  const ForgotPasswordLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/forgot-password');
        },
        child: Text(
          context.t.forgotPassword.title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}