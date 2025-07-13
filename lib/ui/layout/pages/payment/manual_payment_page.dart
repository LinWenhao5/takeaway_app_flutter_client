import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/radius.dart';
import 'package:url_launcher/url_launcher.dart';

class ManualPaymentPage extends StatelessWidget {
  final String? paymentUrl;

  const ManualPaymentPage({super.key, required this.paymentUrl});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final appBar = AppBar(
      title: Text(
        context.t.payment.paymentTitle
      )
    );

    if (paymentUrl == null || paymentUrl!.isEmpty) {
      return Scaffold(
        appBar: appBar,
        body: Center(
          child: Text(
            context.t.payment.paymentExpired,
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.error,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: appBar,
      backgroundColor: colorScheme.surface,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(kCardRadius),
            border: Border.all(
              color: colorScheme.outline,
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                context.t.payment.paymentInstruction,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SelectableText(
                paymentUrl!,
                style: textTheme.bodyLarge?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.copy, size: 20),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    elevation: 0, // 扁平化无阴影
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    textStyle: textTheme.titleMedium,
                  ),
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: paymentUrl!));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(context.t.payment.linkCopied),
                        backgroundColor: colorScheme.secondary,
                      ),
                    );
                  },
                  label: Text(context.t.payment.copyLink),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.open_in_new, size: 20),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: colorScheme.primary,
                    side: BorderSide(color: colorScheme.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    textStyle: textTheme.titleMedium,
                  ),
                  onPressed: () async {
                    final uri = Uri.parse(paymentUrl!);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri, mode: LaunchMode.externalApplication);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(context.t.payment.paymentOpenFailed),
                          backgroundColor: colorScheme.error,
                        ),
                      );
                    }
                  },
                  label: Text(context.t.payment.openLink),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}