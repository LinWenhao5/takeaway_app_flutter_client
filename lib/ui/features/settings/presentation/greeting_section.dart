import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import '../application/customer_account_provider.dart';

class GreetingSection extends ConsumerWidget {

  const GreetingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameState = ref.watch(usernameNotifierProvider);


    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: () {
        if (usernameState.isLoading) {
          return Center(
            child: 
            SpinKitWave(
              color: Theme.of(context).primaryColor,
              size: 30.0,
            )
          );
        } else if (usernameState.username != null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getGreeting(context),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 4),
              Text(
                usernameState.username!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          );
        } else if (usernameState.errorCode == 401) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.t.settings.login_prompt,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () async {
                  final result = await Navigator.of(context).pushNamed('/login');
                  if (result == true) {
                    ref.read(usernameNotifierProvider.notifier).fetchUsername();
                  }
                },
                child: Text(
                  context.t.settings.sign_in_now,
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          );
        } else if (usernameState.error != null) {
          return Text('Failed to load username', style: TextStyle(color: Colors.red));
        } else {
          return const SizedBox.shrink();
        }
      }(),
    );
  }
}

// greeting
String getGreeting(BuildContext context) {
  final hour = DateTime.now().hour;
  if (hour >= 21 || hour < 6) {
    return context.t.settings.greetings.night;
  } else if (hour < 9) {
    return context.t.settings.greetings.morning;
  } else if (hour < 12) {
    return context.t.settings.greetings.forenoon;
  } else if (hour < 14) {
    return context.t.settings.greetings.noon;
  } else if (hour < 18) {
    return context.t.settings.greetings.afternoon;
  } else {
    return context.t.settings.greetings.evening;
  }
}