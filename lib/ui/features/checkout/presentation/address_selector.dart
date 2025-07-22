import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/application/address_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/application/provider.dart';

class AddressSelector extends ConsumerWidget {
  const AddressSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressState = ref.watch(addressNotifierProvider);
    final addresses = addressState.addresses;
    final selectedId = ref.watch(selectedAddressIdProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(context.t.checkout.selectAddress, style: Theme.of(context).textTheme.titleMedium),
            IconButton(
              icon: const Icon(Icons.add_location_alt_outlined),
              tooltip: context.t.checkout.addAddress,
              onPressed: () {
                Navigator.of(context).pushNamed('/add-address');
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (addresses.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'No address available. Please add one.',
              style: TextStyle(color: Colors.grey[600]),
            ),
          )
        else
          ...addresses.map((address) {
            final isSelected = selectedId == address.id;
            final colorScheme = Theme.of(context).colorScheme;
            return InkWell(
              onTap: () {
                ref.read(selectedAddressIdProvider.notifier).state = address.id;
              },
              child: Container(
                color: isSelected
                    ? colorScheme.primary.withAlpha((0.15 * 255).toInt())
                    : Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Row(
                  children: [
                    Icon(
                      isSelected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      color: isSelected
                          ? colorScheme.primary
                          : colorScheme.onSurface.withAlpha((0.5 * 255).toInt()),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${address.street} ${address.houseNumber}, ${address.city}',
                            style: Theme.of(context).textTheme.bodyMedium
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${address.name}  ${address.phone}',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurface.withAlpha((0.5 * 255).toInt())
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
      ],
    );
  }
}