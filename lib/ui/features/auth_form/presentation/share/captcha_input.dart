import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/auth_provider.dart';

class CaptchaInput extends ConsumerWidget {
  final TextEditingController controller;
  final TextEditingController emailController;
  final ValueChanged<String>? onChanged;

  const CaptchaInput({
    super.key,
    required this.controller,
    required this.emailController,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final captchaState = ref.watch(captchaProvider);
    final captchaNotifier = ref.read(captchaProvider.notifier);

    final remainingTime = ref.watch(captchaTimerProvider);
    final captchaTimerNotifier = ref.read(captchaTimerProvider.notifier);

    ref.listen(captchaProvider, (previous, next) {
      if (!context.mounted) return;
      if (next.errorMessage != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      } else if (next.captchaMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.register.captchaSentMessage)),
        );
        captchaTimerNotifier.startTimer();
      }
    });

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
                onChanged: onChanged,
                decoration: InputDecoration(
                  hintText: context.t.register.captchaHint,
                  prefixIcon: const Icon(Icons.security),
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed:
                  (remainingTime > 0 || captchaState.isLoading)
                      ? null
                      : () async {
                        final email = emailController.text;
                        if (email.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                context.t.errors.invalidEmailMessage,
                              ),
                            ),
                          );
                          return;
                        }
                        await captchaNotifier.generateCaptcha(email);
                      },
              child:
                  captchaState.isLoading
                      ? SizedBox(
                        width: 16,
                        height: 16,
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                          size: 20.0,
                        ),
                      )
                      : Text(
                        remainingTime > 0
                            ? '${remainingTime}s'
                            : context.t.register.sendCaptchaButton,
                      ),
            ),
          ],
        ),
      ],
    );
  }
}
