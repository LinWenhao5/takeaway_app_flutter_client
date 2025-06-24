import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/auth_provider.dart';

class RegisterButton extends ConsumerWidget {
  final Map<String, TextEditingController> controllers;

  const RegisterButton({
    super.key,
    required this.controllers,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      registerProvider,
      (previous, next) {
        if (!next.isLoading && next.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(next.errorMessage!)),
          );
        } else if (!next.isLoading && next.errorMessage == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.t.register.successMessage)),
          );
          Navigator.pop(context);
        }
      },
    );

    final registerNotifier = ref.read(registerProvider.notifier);
    final registerState = ref.watch(registerProvider);

    return Center(
      child: registerState.isLoading
          ? SpinKitFadingCircle(
              color: Theme.of(context).primaryColor,
              size: 40.0,
            )
          : ElevatedButton(
              onPressed: () async {
                final name = controllers['name']!.text.trim();
                final email = controllers['email']!.text.trim();
                final password = controllers['password']!.text.trim();
                final confirmPassword = controllers['confirmPassword']!.text.trim();
                final captcha = controllers['captcha']!.text.trim();

                if ([name, email, password, confirmPassword, captcha]
                    .any((field) => field.isEmpty)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(context.t.register.errorMessage), duration: Duration(seconds: 2),),
                  );
                  return;
                }

                if (password != confirmPassword) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(context.t.register.passwordMismatchMessage), duration: Duration(seconds: 2),),
                  );
                  return;
                }

                await registerNotifier.register(
                  name,
                  email,
                  password,
                  captcha,
                  context,
                );
              },
              child: Text(
                context.t.register.registerButton,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
    );
  }
}