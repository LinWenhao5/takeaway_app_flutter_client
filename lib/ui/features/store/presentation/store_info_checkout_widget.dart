import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/radius.dart';
import 'package:takeaway_app_flutter_client/ui/features/store/application/provider.dart';
import 'package:takeaway_app_flutter_client/ui/utils/launch_util.dart';

class StoreInfoCheckoutWidget extends ConsumerWidget {
  const StoreInfoCheckoutWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeAsync = ref.watch(storeProvider);

    return storeAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.t.checkout.pickupAddress,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(context.t.errors.genericErrorMessage),
          ),
        ],
      ),
      data: (store) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.t.checkout.pickupAddress,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kCardRadius),
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                ),
              ),
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    store.name,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on_outlined, size: 20, color: Theme.of(context).colorScheme.primary),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          '${store.street} ${store.houseNumber}, ${store.postcode} ${store.city}',
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.map_outlined, color: Colors.blue, size: 24),
                        tooltip: context.t.common.openInGoogleMaps,
                        onPressed: () {
                          final address = '${store.street} ${store.houseNumber}, ${store.postcode} ${store.city}, ${store.country}';
                          openGoogleMaps(address);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () => callPhone(store.phone),
                    child: Row(
                      children: [
                        Icon(Icons.phone, size: 20, color: Theme.of(context).colorScheme.primary),
                        const SizedBox(width: 6),
                        Text(
                          store.phone,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}