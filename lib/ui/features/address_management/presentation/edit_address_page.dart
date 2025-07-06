import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/application/state/address_action_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/domain/address.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/domain/address_create_request.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/presentation/address_form.dart';
import '../application/address_provider.dart';

class EditAddressPage extends ConsumerStatefulWidget {
  final Address address;
  const EditAddressPage({super.key, required this.address});

  @override
  ConsumerState<EditAddressPage> createState() => _EditAddressPageState();
}

class _EditAddressPageState extends ConsumerState<EditAddressPage> {
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AddressActionState>(addressActionNotifierProvider, (previous, next) async {
      if (next.success && next.action == AddressActionType.update) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.address.updateSuccess)),
        );
        await ref.read(addressNotifierProvider.notifier).fetchAddresses();
        if (mounted) Navigator.of(context).pop();
      }
      if (next.error != null && next.action == AddressActionType.update) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!)),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.address.editAddress),
      ),
      body: AddressForm(
        initial: AddressCreateRequest(
          name: widget.address.name,
          phone: widget.address.phone,
          street: widget.address.street,
          houseNumber: widget.address.houseNumber,
          postcode: widget.address.postcode,
          city: widget.address.city,
          country: widget.address.country,
        ),
        submitting: _submitting,
        submitLabel: context.t.address.saveAddress,
        onSubmit: (request) async {
          setState(() => _submitting = true);
          await ref.read(addressActionNotifierProvider.notifier).updateAddress(widget.address.id, request);
          setState(() => _submitting = false);
        },
      ),
    );
  }
}