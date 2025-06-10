import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

class ConfirmPasswordInput extends StatelessWidget {
  final TextEditingController controller;

  const ConfirmPasswordInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.t.register.confirmPasswordLabel,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: true,
          decoration: InputDecoration(
            hintText: context.t.register.confirmPasswordHint,
            prefixIcon: const Icon(Icons.lock),
          ),
        ),
      ],
    );
  }
}