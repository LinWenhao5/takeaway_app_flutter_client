import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

class ManualPaymentPage extends StatelessWidget {
  final String? paymentUrl;

  const ManualPaymentPage({super.key, required this.paymentUrl});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: Text(context.t.payment.paymentTitle));

    if (paymentUrl == null || paymentUrl!.isEmpty) {
      return Scaffold(
        appBar: appBar,
        body: Center(
          child: Text(
            context.t.payment.paymentExpired,
            style: TextStyle(fontSize: 18, color: Colors.redAccent),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(context.t.payment.paymentInstruction),
              const SizedBox(height: 16),
              SelectableText(paymentUrl!, style: const TextStyle(color: Colors.blue)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: paymentUrl!));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(context.t.payment.linkCopied),
                    ),
                  );
                },
                child: Text(context.t.payment.copyLink),
              ),
            ],
          ),
        ),
      ),
    );
  }
}