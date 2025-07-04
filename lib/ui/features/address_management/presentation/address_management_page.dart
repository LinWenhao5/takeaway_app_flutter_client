import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../settings/application/address_provider.dart';
import '../domain/address.dart';
import 'address_card.dart';

class AddressManagementPage extends ConsumerWidget {
  const AddressManagementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addressNotifierProvider);
    final notifier = ref.read(addressNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Address Management'),
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.error != null
              ? Center(child: Text('Failed to load: ${state.error}'))
              : RefreshIndicator(
                  onRefresh: () async {
                    await notifier.fetchAddresses();
                  },
                  child: ListView.separated(
                    padding: const EdgeInsets.all(12),
                    itemCount: state.addresses.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final Address address = state.addresses[index];
                      return AddressCard(
                        address: address,
                        onEdit: () {
                          // TODO: Edit logic
                        },
                        onDelete: () {
                          // TODO: Delete logic
                        },
                      );
                    },
                  ),
                ),
    );
  }
}