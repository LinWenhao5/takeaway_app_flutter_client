import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/colors.dart';

class RegisterLink extends StatelessWidget {
  const RegisterLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/register');
        },
        child: Text(
          context.t.login.registerLink,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: kPrimaryColor,
                decoration: TextDecoration.underline,
                decorationColor: kPrimaryColor,
              ),
        ),
      ),
    );
  }
}