import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/application/state/address_action_state.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/presentation/adress_form.dart';
import '../application/address_provider.dart';

class AddAddressPage extends ConsumerStatefulWidget {
  const AddAddressPage({super.key});

  @override
  ConsumerState<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends ConsumerState<AddAddressPage> {
  bool _submitting = false;

  @override
  Widget build(BuildContext context) {
    ref.listen<AddressActionState>(addressActionNotifierProvider, (previous, next) async {
      if (next.success && next.action == AddressActionType.create) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.address.addSuccess)),
        );
        await ref.read(addressNotifierProvider.notifier).fetchAddresses();
        if (mounted) Navigator.of(context).pop();
      }
      if (next.error != null && next.action == AddressActionType.create) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!)),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.address.addAddress),
      ),
      body: AddressForm(
        submitting: _submitting,
        submitLabel: context.t.address.submit,
        onSubmit: (request) async {
          setState(() => _submitting = true);
          await ref.read(addressActionNotifierProvider.notifier).createAddress(request);
          setState(() => _submitting = false);
        },
      ),
    );
  }
}