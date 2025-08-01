import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

class PaymentMethodSelector extends StatelessWidget {
  const PaymentMethodSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.t.checkout.paymentMethod,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Radio<String>(value: 'ideal', groupValue: 'ideal', onChanged: null),
            SvgPicture.asset('assets/images/IDEAL.svg', width: 32, height: 32),
            const SizedBox(width: 8),
            const Text('iDEAL'),
          ],
        ),
      ],
    );
  }
}
