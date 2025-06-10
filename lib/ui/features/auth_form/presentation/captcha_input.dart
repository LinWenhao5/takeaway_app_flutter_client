import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

class CaptchaInput extends StatelessWidget {
  final TextEditingController controller;

  const CaptchaInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.t.register.captchaLabel,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: context.t.register.captchaHint,
                  prefixIcon: const Icon(Icons.security),
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(context.t.register.captchaSentMessage)),
                );
              },
              child: Text(context.t.register.sendCaptchaButton),
            ),
          ],
        ),
      ],
    );
  }
}