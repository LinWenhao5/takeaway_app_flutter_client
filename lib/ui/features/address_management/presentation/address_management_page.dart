import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/application/state/address_action_state.dart';
import '../application/address_provider.dart';
import '../domain/address.dart';
import 'address_card.dart';

class AddressManagementPage extends ConsumerWidget {
  const AddressManagementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addressNotifierProvider);
    final notifier = ref.read(addressNotifierProvider.notifier);
    final actionNotifier = ref.read(addressActionNotifierProvider.notifier);

    ref.listen<AddressActionState>(addressActionNotifierProvider, (
      prev,
      next,
    ) async {
      if (next.success && next.action == AddressActionType.delete) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.address.deleteSuccess)),
        );
        await notifier.fetchAddresses();
        actionNotifier.reset();
      }
      if (next.error != null && next.action == AddressActionType.delete) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.error!)));
        actionNotifier.reset();
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text(context.t.settings.address_management)),
      body:
          state.isLoading
              ? Center(
                child: SpinKitWave(
                  color: Theme.of(context).primaryColor,
                  size: 40.0,
                ),
              )
              : state.error != null
              ? Center(child: Text('Failed to load: ${state.error}'))
              : RefreshIndicator(
                onRefresh: () async {
                  await notifier.fetchAddresses();
                },
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxisCount;
                    double aspectRatio;
                    if (constraints.maxWidth > 1600) {
                      crossAxisCount = 3;
                      aspectRatio = 4;
                    } else if (constraints.maxWidth > 1000) {
                      crossAxisCount = 2;
                      aspectRatio = 3.5;
                    } else {
                      crossAxisCount = 1;
                      aspectRatio = 3;
                    }
                    return GridView.builder(
                      padding: const EdgeInsets.all(12),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: aspectRatio,
                      ),
                      itemCount: state.addresses.length,
                      itemBuilder: (context, index) {
                        final Address address = state.addresses[index];
                        return AddressCard(
                          address: address,
                          onEdit: () {
                            Navigator.of(
                              context,
                            ).pushNamed('/edit-address', arguments: address);
                          },
                          onDelete: () {
                            actionNotifier.deleteAddress(address.id);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed('/add-address');
        },
        icon: const Icon(Icons.add),
        label: Text(context.t.address.addAddress),
      ),
    );
  }
}
