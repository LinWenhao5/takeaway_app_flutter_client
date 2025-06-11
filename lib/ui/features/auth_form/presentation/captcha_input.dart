import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/auth_provider.dart';

class CaptchaInput extends ConsumerWidget {

  final TextEditingController controller;
  final TextEditingController emailController; 

  const CaptchaInput({
    super.key, 
    required this.controller, 
    required this.emailController
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final captchaState = ref.watch(captchaProvider);
    final captchaNotifier = ref.read(captchaProvider.notifier);

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
              onPressed: captchaState.isLoading
                  ? null
                  : () async {
                      final email = emailController.text;
                      print('Email: $email');
                      if (email.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(context.t.errors.invalidEmailMessage)),
                        );
                        return;
                      }

                      await captchaNotifier.generateCaptcha(email, context);

                      if (!context.mounted) return;

                      if (captchaState.errorMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(captchaState.errorMessage!)),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(context.t.register.captchaSentMessage)),
                        );
                      }
                    },
              child: captchaState.isLoading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(context.t.register.sendCaptchaButton),
            ),
          ],
        ),
      ],
    );
  }
}