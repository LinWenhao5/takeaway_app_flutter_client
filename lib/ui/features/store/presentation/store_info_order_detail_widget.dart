import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/store/application/provider.dart';
import 'package:takeaway_app_flutter_client/ui/utils/launch_util.dart';

class StoreInfoOrderDetailWidget extends ConsumerWidget {
  const StoreInfoOrderDetailWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeAsync = ref.watch(storeProvider);

    Widget title = Row(
      children: [
        Icon(
          Icons.store_mall_directory_outlined,
          color: Theme.of(context).colorScheme.primary,
          size: 22,
        ),
        const SizedBox(width: 8),
        Text(
          context.t.checkout.pickupAddress,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );

    return storeAsync.when(
      loading: () => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            const SizedBox(height: 16),
            const LinearProgressIndicator(),
          ],
        ),
      ),
      error: (err, stack) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            const SizedBox(height: 16),
            Text(context.t.errors.genericErrorMessage),
          ],
        ),
      ),
      data: (store) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            const SizedBox(height: 12),
            Text(
              store.name,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.location_on_outlined, size: 18, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 6),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${store.street} ${store.houseNumber}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        '${store.postcode}, ${store.city}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.map_outlined, color: Colors.blue, size: 20),
                  tooltip: 'Open in Google Maps',
                  onPressed: () {
                    final address = '${store.street} ${store.houseNumber}, ${store.postcode} ${store.city}, ${store.country}';
                    openGoogleMaps(address);
                  },
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.phone, size: 18, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 6),
                InkWell(
                  onTap: () => callPhone(store.phone),
                  child: Text(
                    store.phone,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}